import express from "express"
import hotels from "./data/hotels.js"

const app = express()

// localhost:8080/api/hotels?breakfast=true&parking=true&wifiIncluded=true
const FILTER_OPTIONS = [
    "breakfast",
    "parking",
    "wifiIncluded",
    "airportShuttle"
]

app.get("/api/hotels", (req, res) => {

    // get the sort options 
    const { sort } = req.query

    let filteredHotels = filterHotels(hotels, req.query)
    filteredHotels = sortHotels(filteredHotels, sort)

    res.json(filteredHotels)
})

const sortHotels = (hotels, sort) => {
    switch (sort) {
        case "priceLowToHigh":
            hotels.sort((a, b) => a.price - b.price)
            break
        case "priceHighToLow":
            hotels.sort((a, b) => b.price - a.price)
            break
        case "guestRating":
            hotels.sort((a, b) => b.guestRating - a.guestRating);
            break
    }

    return hotels 
}

const filterHotels = (hotels, query) => {

    let results = [...hotels]

    FILTER_OPTIONS.forEach(filter => {
        if (query[filter] === "true") {
            results = results.filter(hotel => hotel[filter])
        }
    })

    return results
}

app.listen(8080, () => {
    console.log("Server is running...")
})