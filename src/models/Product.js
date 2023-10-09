const { Model } = require('objection')
const knex = require("../database/knex") 

Model.knex(knex)

class Product extends Model { 
    static get tableName(){
        return 'himalaya_items'
    }
}

module.exports = Product