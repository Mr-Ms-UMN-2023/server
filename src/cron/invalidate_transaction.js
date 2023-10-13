const { Model } = require("objection");
const knex = require('../database/knex');
const Audience = require('../models/Audience');
const Product = require('../models/Product');
const Transaction = require('../models/Transaction');  

const invalidateTransaction = async (req, res) => {
    try {
        
        const time = new Date();
        time.setMinutes(time.getMinutes() - 15);

        Model.transaction(async (trx) => {

          const invalidTransactions = await Transaction.query()
            .where(function(query) {
              query.where('status', '<>', 'settlement')
                .orWhereNull('status');
            })
            .andWhereRaw('payment_init_time < ?', [time]);
            console.log(invalidTransactions);

            let reserved = 0;

            for (let transaction of invalidTransactions){
                reserved += transaction.quantity;
            }
  
            await Transaction.query()
              .where(function(query) {
                query.where('status', '<>', 'settlement')
                  .orWhereNull('status');
              })
              .andWhereRaw('payment_init_time < ?', [time])
              .delete();
            
            await Product.query()
              .where({ id : "Earlybird"})
              .patch({
                reserved : knex.raw(`reserved - ${reserved}`)
              });   

        }).catch((err) => {
          console.error('Cron job error : ', err);
        });  

      
      } catch (err) {
        console.error('Cron job error : ', err);
      }    
}

module.exports = invalidateTransaction;