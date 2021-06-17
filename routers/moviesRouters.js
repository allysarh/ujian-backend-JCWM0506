const express = require('express')
const { readToken } = require('../config')
const moviesControllers = require('../controllers/moviesControllers')
const router = express.Router()

router.get('/get/all', moviesControllers.getMovie)
router.get('/get', moviesControllers.getMovieQuery)
router.post('/add', readToken, moviesControllers.addMovie)
router.patch('/edit/:idmovie', readToken, moviesControllers.editMovie)
router.patch('/set/:idmovie', readToken, moviesControllers.addSchedule)
module.exports = router

// token: eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwidWlkIjoiMTYyMzg5ODE3MTI5OSIsImVtYWlsIjoiYWxseXNhQG1haWwuY29tIiwiaWRzdGF0dXMiOjEsImlkcm9sZSI6MiwiaWF0IjoxNjIzOTAyNTU4fQ.rudNoRM6FHYQqGqO8vOB0Nu25yB2PjClCiy4A5i05L8