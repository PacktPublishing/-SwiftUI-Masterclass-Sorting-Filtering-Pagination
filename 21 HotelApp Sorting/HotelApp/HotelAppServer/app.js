import express from "express"
import hotels from "./data/hotels.js"

const app = express()

app.get("/api/hotels", (req, res) => {

    // get the sort options 
    const { sort } = req.query
    const sortedHotels = sortHotels(hotels, sort)
    res.json(sortedHotels)
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

app.listen(8080, () => {
    console.log("Server is running...")
})