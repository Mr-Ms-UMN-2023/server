// Update with your config settings.

/**
 * @type { Object.<string, import("knex").Knex.Config> }
 */
module.exports = {

    development: {
      client: process.env.DB_CLIENT || 'mysql' ,
      connection: {
        host: process.env.DB_HOST || '127.0.0.1',
        user: process.env.DB_USER || 'root',
        password: process.env.DB_PASS || '', 
        database: process.env.DB_NAME || 'mrmsumn2023'
      },
      debug: false,
    },
    production: {
      client: process.env.DB_CLIENT || 'mysql' ,
      connection: {
        host: process.env.DB_HOST || '127.0.0.1',
        user: process.env.DB_USER || 'root',
        password: process.env.DB_PASS || '', 
        database: process.env.DB_NAME || 'mrmsumn2023'
      },
      debug: true,
    }
  };
  