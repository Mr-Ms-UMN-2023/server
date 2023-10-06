const nodeMailer = require('../config/mail');

const sendEmail = (destination, subject, html) => {
    const options = {
        from : process.env.MAIL_ACCOUNT, 
        to : destination, 
        subject, 
        html
    }
    console.log(options);
    nodeMailer.sendMail(options);
}

module.exports = {sendEmail}