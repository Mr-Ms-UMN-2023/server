const { Model } = require('objection')
const knex = require("../database/knex") 

Model.knex(knex)

class Finalist extends Model { 
    static get tableName(){
        return 'finalis_2023'
    }
}

module.exports = Peserta