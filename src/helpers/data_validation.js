const isValidEmail = (email) => {
    const pattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;    
    return pattern.test(email);
}

const isValidPhoneNumber = (phoneNumber) => {
    const pattern = /^\d{9,14}$/;
    return pattern.test(phoneNumber);
}

const isValidName = (name) => {
    return name.length > 0;
}


module.exports = {
    isValidEmail, 
    isValidPhoneNumber,
    isValidName
}