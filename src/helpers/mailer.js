const nodeMailer = require('../config/mail');

const sendEmail = (destination, subject, html, attachments) => {
    const options = {
        from : process.env.MAIL_ACCOUNT, 
        to : destination, 
        subject, 
        html,
        attachments
    }
    nodeMailer.sendMail(options);
}

module.exports = {sendEmail}