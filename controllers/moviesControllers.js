const { dbQuery, db, createToken } = require("../config")

module.exports = {
    getMovie: async (req, res, next) => {
        try {
            let getMovieAll = `
            SELECT name, release_date, 
            release_month, release_year, duration_min, genre, description, movie_status as status,location, time
            from schedules as s
            LEFT join movies as m
            on m.idmovie = s.idmovie
            left join locations as l
            on s.idlocation = l.idlocation
            left join show_times as t
            on t.idtime = s.idtime
            left join movie_status as ms
            on ms.idmovie_status = m.idmovie_status;
            `
            getMovieAll = await dbQuery(getMovieAll)
            res.status(200).send(getMovieAll)
        } catch (error) {
            next(error)
        }
    },
    getMovieQuery: async (req, res, next) => {
        try {
            let getMovie = `
            SELECT name, release_date, 
            release_month, release_year, duration_min, genre, description, movie_status as status, location, time
            from schedules as s
            LEFT join movies as m
            on m.idmovie = s.idmovie
            left join locations as l
            on s.idlocation = l.idlocation
            left join show_times as t
            on t.idtime = s.idtime
            left join movie_status as ms
            on ms.idmovie_status = m.idmovie_status`

            let querySearch = []
            if (Object.keys(req.query).length > 0) {
                for (props in req.query) {
                    querySearch.push(`${props} = ${db.escape(req.query[props])}`)
                }
                getMovie = await dbQuery(`${getMovie} where ${querySearch.join(' and ')};`)
            } else {
                getMovie = await dbQuery(`${getMovie};`)
            }

            res.status(200).send(getMovie)
        } catch (error) {
            next(error)
        }
    },
    addMovie: async (req, res, next) => {
        try {
            if (req.user.idrole == 1) {
                let insertMovie = `Insert into movies set ?`
                insertMovie = await dbQuery(insertMovie, req.body)
                let getAdd = `SELECT idmovie as id, name, genre, release_date, release_month,
                release_year, duration_min, description
                from movies where idmovie = ${insertMovie.insertId};`
                getAdd = await dbQuery(getAdd)
                res.status(200).send(getAdd)
            } else {
                res.status(401).send("Hanya admin yang bisa akses")
            }
        } catch (error) {
            next(error)
        }
    },
    editMovie: async (req, res, next) => {
        try {
            console.log(req.user)
            let { idstatus } = req.body
            if (req.user.idrole == 1) {
                let editMovie = `update movies set idmovie_status = ${db.escape(idstatus)} where idmovie = ${req.params.idmovie};`
                await dbQuery(editMovie)
                res.status(200).send({ idmovie: req.params.idmovie, messages: 'Status has been changed' })
            } else {
                res.status(401).send("Hanya admin yang bisa akses")
            }
        } catch (error) {
            next(error)
        }
    },
    addSchedule: async (req, res, next) => {
        try {
            
            if (req.user.idrole == 1) {
                let { idlocation, idtime } = req.body
                let addSchedule = `INSERT into schedules values (null, ${db.escape(req.params.idmovie)}, ${db.escape(idlocation)}, ${db.escape(idtime)});`
                await dbQuery(addSchedule)
                res.status(200).send({ id: req.params.idmovie, message: 'Schedule has been added' })
            } else {
                res.status(401).send("anya admin yang bisa akses")
            }
        } catch (error) {
            next(error)
        }
    }
}
