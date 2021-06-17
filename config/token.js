const jwt = require('jsonwebtoken')

module.exports = {
    createToken: (payload) =>{
        return jwt.sign(payload, `users$`)
    },
    readToken: (req, res, next) =>{
        jwt.verify(req.token, `users$`, (err, decoded) =>{
            if(err){
                return res.status(401).send("User not authorized")
            }
            req.user = decoded
            next()
        })
    }
}