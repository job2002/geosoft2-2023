const EXPRESS = require('express')
const APP = EXPRESS()
let  landing_page = require("./stac_example/catalog.json")

const host = 'localhost'
const port = '3000'

APP.get('/', function(_req, res) {
    res.json(landing_page)
});


// Explicitly tell the client that there is no favicon
APP.get('/favicon.ico', (req, res) => res.status(204))

// APP.use(EXPRESS.static('static'))

console.log(`http://${host}:${port}`)

APP.listen(port, host)