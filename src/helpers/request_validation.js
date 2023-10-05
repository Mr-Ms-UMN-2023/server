const createError = (key, message) => {
    return {error : key, message}   
}


module.exports = {
    createError
}