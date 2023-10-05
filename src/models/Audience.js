const { Model } = require('objection')
const knex = require("../database/knex") 

Model.knex(knex)

class Audience extends Model { 
    static get tableName(){
        return 'himalaya_audiences'
    }
}

module.exports = Audience