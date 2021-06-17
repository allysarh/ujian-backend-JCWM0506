const { dbQuery, db, createToken } = require("../config")

module.exports = {
    register: async (req, res, next) => {
        try {
            let { username, email, password } = req.body
            let uid = Date.now()
            if (username.length > 6 && password.match(/[0-9]/ig) && password.match(/[.@#$%^&*()]/) && email.match(/[@]/ig) && email.match(/[.]/ig)) {
                let register = `insert into users (uid, username, email, password) values (${uid}, ${db.escape(username)}, ${db.escape(email)}, ${db.escape(password)})`
                await dbQuery(register)
                let get = `SELECT * from users;`
                get = await dbQuery(get)
                console.log(get)
                let { id } = get[0]
                console.log(id, uid, username, email)
                let token = createToken({ id, uid, username, email })
    
                res.status(200).send({ id, uid, username, email, token })
            } else {
                res.status(404).send("Format not match")
            }
        } catch (error) {
            next(error)
        }
    },
    login: async (req, res, next) => {
        try {

            let { username, password } = req.body
            let login = `SELECT * from users where username = ${db.escape(username)} and password = ${db.escape(password)};`
            login = await dbQuery(login)
            let { id, uid, email, idstatus, idrole } = login[0]
            if (idstatus == 1 || idstatus == 2) {
                let token = createToken({ id, uid, email, idstatus, idrole })
                res.status(200).send({ id, uid, email, idstatus, idrole, token })
            } else {
                res.status(400).send("akun telah ditutup")
            }
        } catch (error) {
            next(error)
        }
    },
    deactivate: async (req, res, next) => {
        try {
            console.log("user id", req.user)
            let get = `SELECT uid, status from users u JOIN status s where id = ${req.user.id} and s.idstatus = u.idstatus;`
            get = await dbQuery(get)
            let { status } = get[0]

            if (status == "active" || status == "not-active") {
                let deactivate = `UPDATE users set idstatus = 2 where id = ${req.user.id};`
                await dbQuery(deactivate) 

                get = `SELECT uid, status from users u JOIN status s where id = ${req.user.id} and s.idstatus = u.idstatus;`
                get = await dbQuery(get)
                res.status(200).send(get)
            } else {
                res.status(400).send("akun telah ditutup")
            }
        } catch (error) {
            next(error)
        }
    }, activate: async (req, res, next) => {
        try {
            console.log("read token ", req.user)
            let get = `SELECT uid, status from users u JOIN status s where id = ${req.user.id} and s.idstatus = u.idstatus;`
            get = await dbQuery(get)
            let {status} = get[0]
            if (status == "active" || status == "not-active") {
                let activate = `UPDATE users set idstatus = 1 where id = ${req.user.id};`
                await dbQuery(activate)

                get = `SELECT uid, status from users u JOIN status s where id = ${req.user.id} and s.idstatus = u.idstatus;`
                get = await dbQuery(get)
                res.status(200).send(get)
            } else {
                res.status(400).send("akun telah ditutup")
            }
        } catch (error) {
            next(error)
        }
    },
    closeAcc: async (req, res, next) => {
        try {
            console.log(req.user.id)
            let activate = `UPDATE users set idstatus = 3 where id = ${req.user.id};`
            await dbQuery(activate)
            let get = `SELECT uid, status from users u JOIN status s where id = ${req.user.id} and s.idstatus = u.idstatus;`
            get = await dbQuery(get)

            res.status(200).send(get)
        } catch (error) {
            next(error)
        }
    }
}