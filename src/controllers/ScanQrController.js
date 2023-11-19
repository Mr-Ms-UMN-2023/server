const QRToken = require("../models/QRToken");
const ValidationException = require("../exceptions/ValidationException");
const knex = require("../database/knex");

const attendanceHandler = async (req, res) => {
    try {

        const { token = "" } = req.body;

        const ticket = await QRToken.query()
            .where({token})
            .first();

        if (!ticket){
            throw new ValidationException(
                404,
                'Tiket tidak ditemukan.', 
                'TICKET_NOT_FOUND'
            );
        }

        if (ticket.attendance){
            throw new ValidationException(
                422, 
                'Tiket invalid.', 
                'INVALID_TICKET'
            );
        }

        const update = await QRToken.query()
            .where({token})
            .patch({attendance : 1})


        return res.status(200).json({
            code : 200, 
            message : "Presensi tiket berhasil. Selamat datang!"
        });


    } catch (err) {
        if (err instanceof ValidationException) {
            return res.status(err.code).send({
              code: err.code,
              type: err.type,
              message: err.message,
            });
          }
      
          console.error(err);
          return res.status(500).send({
            code: 500,
            message: "Internal Server Error : " + err.message,
          });        
    }
}

// for qr modal popup
const getTicketData = async (req, res) => {
    try {
        const { token = "" } = req.params;

        const ticket = await QRToken.query()
            .select(
                'himalaya_qr_tokens.token AS token', 
                'himalaya_audiences.id AS id',
                'himalaya_audiences.nama AS nama', 
                'himalaya_audiences.email AS email',
                'himalaya_audiences.whatsapp AS whatsapp' 
            )
            .join('himalaya_audiences', 'himalaya_qr_tokens.audience_id', '=', 'himalaya_audiences.id')
            .where({token})
            .first();

        if (!ticket){
            throw new ValidationException(
                404,
                'Tiket tidak ditemukan.', 
                'TICKET_NOT_FOUND'
            );
        }

        return res.status(200).json({
            code : 200, 
            message : "Berhasil mendapatkan data tiket.", 
            data : ticket
        });

    }  catch (err) {
        if (err instanceof ValidationException) {
            return res.status(err.code).send({
              code: err.code,
              type: err.type,
              message: err.message,
            });
          }
      
          console.error(err);
          return res.status(500).send({
            code: 500,
            message: "Internal Server Error : " + err.message,
          });        
    }
}


module.exports = {
    attendanceHandler, 
    getTicketData
}