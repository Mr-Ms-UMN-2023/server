const { Model } = require('objection')
const knex = require("../database/knex") 

Model.knex(knex)

class QRToken extends Model { 
    static get tableName(){
        return 'himalaya_qr_tokens'
    }
}

module.exports = QRToken