const nodeMailer = require('../config/mail');

const sendEmail = (destination, subject, html) => {
    const options = {
        from : process.env.MAIL_ACCOUNT, 
        to : destination, 
        subject, 
        html
    }
    nodeMailer.sendMail(options);
}

module.exports = {sendEmail}