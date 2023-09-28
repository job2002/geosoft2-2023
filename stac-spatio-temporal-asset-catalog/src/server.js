const EXPRESS = require('express')
const APP = EXPRESS()
const PATH = require("path")

// safe .json-Files as variables to use them in routes
let landing_page = require("./stac_example/catalog.json")
let gebaeude_in_muenster = require("./stac_example/gebaeude-in-muenster/collection.json")
let item1 = require("./stac_example/gebaeude-in-muenster/1.json")
let item2 = require("./stac_example/gebaeude-in-muenster/2.json")

const HOST = 'localhost'
const PORT = '3000'

// landing page
APP.get('/', function(_req, res) {
    res.json(landing_page)
})

// service-desc
APP.get("/api", function(_req, res) {
    res.json({api_name: "stac example API", api_feature1: "Auflistung der Features dieser API", etc: ""})
})

// service-doc
APP.get("/api.html", function(_req, res) {
    res.sendFile(PATH.join(__dirname, "/api.html"))
})

// child "gebäude-in-münster". Usually would be programmed to give dynamic access to all collections, but for this example its programmed statically.
APP.get("/gebaeude-in-muenster", function(_req, res) {
    res.json(gebaeude_in_muenster)
})

// item "1"
APP.get("/gebaeude-in-muenster/1", function(_req, res) {
    res.json(item1)
})

// item "2"
APP.get("/gebaeude-in-muenster/2", function(_req, res) {
    res.json(item2)
})

// Explicitly tell the client that there is no favicon
APP.get('/favicon.ico', (req, res) => res.status(204))

console.log(`Server is running on: http://${HOST}:${PORT}`)

APP.listen(PORT, HOST)