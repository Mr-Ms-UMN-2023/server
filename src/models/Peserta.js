const { Model } = require('objection')
const knex = require("../database/knex") 

Model.knex(knex)

class Peserta extends Model { 
    static get tableName(){
        return 'peserta_2023'
    }
}

module.exports = Peserta