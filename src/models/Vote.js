const { Model } = require('objection')
const knex = require("../database/knex") 

Model.knex(knex)

class Vote extends Model { 
    static get tableName(){
        return 'vote_list_2023'
    }
}

module.exports = Vote