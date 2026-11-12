
const hotels = [
    {
        id: 1,
        name: "Grand Plaza Hotel",
        price: 189,
        breakfast: true,
        parking: true,
        airportShuttle: true,
        wifiIncluded: true,
        guestRating: 8.7
    },
    {
        id: 2,
        name: "City View Inn",
        price: 120,
        breakfast: true,
        parking: false,
        airportShuttle: false,
        wifiIncluded: true,
        guestRating: 7.9
    },
    {
        id: 3,
        name: "Sunset Resort",
        price: 250,
        breakfast: false,
        parking: true,
        airportShuttle: true,
        wifiIncluded: true,
        guestRating: 9.2
    },
    {
        id: 4,
        name: "Downtown Suites",
        price: 175,
        breakfast: false,
        parking: false,
        airportShuttle: false,
        wifiIncluded: true,
        guestRating: 8.1
    },
    {
        id: 5,
        name: "Ocean Breeze Hotel",
        price: 220,
        breakfast: true,
        parking: true,
        airportShuttle: true,
        wifiIncluded: true,
        guestRating: 9.0
    },
    {
        id: 6,
        name: "Budget Stay",
        price: 85,
        breakfast: false,
        parking: true,
        airportShuttle: false,
        wifiIncluded: false,
        guestRating: 7.2
    },
    {
        id: 7,
        name: "Royal Garden Hotel",
        price: 310,
        breakfast: true,
        parking: true,
        airportShuttle: true,
        wifiIncluded: true,
        guestRating: 9.5
    },
    {
        id: 8,
        name: "Metro Lodge",
        price: 105,
        breakfast: true,
        parking: false,
        airportShuttle: false,
        wifiIncluded: false,
        guestRating: 7.6
    },
    {
        id: 9,
        name: "Mountain View Retreat",
        price: 275,
        breakfast: true,
        parking: true,
        airportShuttle: false,
        wifiIncluded: true,
        guestRating: 9.1
    },
    {
        id: 10,
        name: "Airport Express Hotel",
        price: 135,
        breakfast: true,
        parking: true,
        airportShuttle: true,
        wifiIncluded: true,
        guestRating: 8.0
    },
    {
        id: 11,
        name: "Lakeside Inn",
        price: 160,
        breakfast: false,
        parking: true,
        airportShuttle: false,
        wifiIncluded: true,
        guestRating: 8.3
    },
    {
        id: 12,
        name: "The Urban Boutique",
        price: 205,
        breakfast: true,
        parking: false,
        airportShuttle: false,
        wifiIncluded: true,
        guestRating: 8.9
    },
    {
        id: 13,
        name: "Palm Tree Resort",
        price: 340,
        breakfast: true,
        parking: true,
        airportShuttle: true,
        wifiIncluded: true,
        guestRating: 9.4
    },
    {
        id: 14,
        name: "Central Park Hotel",
        price: 195,
        breakfast: false,
        parking: true,
        airportShuttle: false,
        wifiIncluded: true,
        guestRating: 8.5
    },
    {
        id: 15,
        name: "Comfort Budget Inn",
        price: 65,
        breakfast: false,
        parking: false,
        airportShuttle: false,
        wifiIncluded: false,
        guestRating: 6.8
    },
    {
        id: 16,
        name: "Golden Gate Suites",
        price: 290,
        breakfast: true,
        parking: true,
        airportShuttle: false,
        wifiIncluded: true,
        guestRating: 9.0
    },
    {
        id: 17,
        name: "Riverside Hotel",
        price: 180,
        breakfast: true,
        parking: true,
        airportShuttle: false,
        wifiIncluded: true,
        guestRating: 8.6
    },
    {
        id: 18,
        name: "The Heritage Grand",
        price: 425,
        breakfast: true,
        parking: true,
        airportShuttle: true,
        wifiIncluded: true,
        guestRating: 9.7
    },
    {
        id: 19,
        name: "City Center Lodge",
        price: 110,
        breakfast: false,
        parking: false,
        airportShuttle: false,
        wifiIncluded: true,
        guestRating: 7.5
    },
    {
        id: 20,
        name: "Blue Horizon Resort",
        price: 365,
        breakfast: true,
        parking: true,
        airportShuttle: true,
        wifiIncluded: true,
        guestRating: 9.3
    },
    {
        id: 21,
        name: "Maple Leaf Inn",
        price: 145,
        breakfast: true,
        parking: true,
        airportShuttle: false,
        wifiIncluded: true,
        guestRating: 8.2
    },
    {
        id: 22,
        name: "Silver Star Hotel",
        price: 230,
        breakfast: false,
        parking: true,
        airportShuttle: true,
        wifiIncluded: true,
        guestRating: 8.8
    },
    {
        id: 23,
        name: "Coastal Paradise",
        price: 390,
        breakfast: true,
        parking: true,
        airportShuttle: true,
        wifiIncluded: true,
        guestRating: 9.6
    },
    {
        id: 24,
        name: "Quick Stay Motel",
        price: 55,
        breakfast: false,
        parking: true,
        airportShuttle: false,
        wifiIncluded: false,
        guestRating: 6.4
    },
    {
        id: 25,
        name: "Emerald City Hotel",
        price: 215,
        breakfast: true,
        parking: false,
        airportShuttle: false,
        wifiIncluded: true,
        guestRating: 8.7
    },
    {
        id: 26,
        name: "The Skyline Tower",
        price: 320,
        breakfast: true,
        parking: true,
        airportShuttle: true,
        wifiIncluded: true,
        guestRating: 9.2
    },
    {
        id: 27,
        name: "Pinewood Retreat",
        price: 155,
        breakfast: false,
        parking: true,
        airportShuttle: false,
        wifiIncluded: false,
        guestRating: 7.8
    },
    {
        id: 28,
        name: "Crystal Bay Resort",
        price: 450,
        breakfast: true,
        parking: true,
        airportShuttle: true,
        wifiIncluded: true,
        guestRating: 9.8
    },
    {
        id: 29,
        name: "Green Valley Inn",
        price: 125,
        breakfast: true,
        parking: true,
        airportShuttle: false,
        wifiIncluded: true,
        guestRating: 8.0
    },
    {
        id: 30,
        name: "The Modern Stay",
        price: 240,
        breakfast: false,
        parking: false,
        airportShuttle: true,
        wifiIncluded: true,
        guestRating: 8.9
    },
    {
        id: 31,
        name: "Sunrise Beach Hotel",
        price: 285,
        breakfast: true,
        parking: true,
        airportShuttle: false,
        wifiIncluded: true,
        guestRating: 9.1
    },
    {
        id: 32,
        name: "Economy Travelers Inn",
        price: 75,
        breakfast: false,
        parking: false,
        airportShuttle: false,
        wifiIncluded: false,
        guestRating: 6.9
    },
    {
        id: 33,
        name: "Diamond Palace Hotel",
        price: 480,
        breakfast: true,
        parking: true,
        airportShuttle: true,
        wifiIncluded: true,
        guestRating: 9.9
    },
    {
        id: 34,
        name: "Oakwood Suites",
        price: 170,
        breakfast: true,
        parking: true,
        airportShuttle: false,
        wifiIncluded: true,
        guestRating: 8.4
    },
    {
        id: 35,
        name: "Harbor View Hotel",
        price: 260,
        breakfast: false,
        parking: true,
        airportShuttle: true,
        wifiIncluded: true,
        guestRating: 8.8
    },
    {
        id: 36,
        name: "The Cozy Corner",
        price: 95,
        breakfast: true,
        parking: false,
        airportShuttle: false,
        wifiIncluded: true,
        guestRating: 7.7
    },
    {
        id: 37,
        name: "Paradise Island Resort",
        price: 500,
        breakfast: true,
        parking: true,
        airportShuttle: true,
        wifiIncluded: true,
        guestRating: 9.8
    },
    {
        id: 38,
        name: "The Grand Metropolitan",
        price: 355,
        breakfast: true,
        parking: true,
        airportShuttle: true,
        wifiIncluded: true,
        guestRating: 9.3
    },
    {
        id: 39,
        name: "Travelers Rest Hotel",
        price: 115,
        breakfast: false,
        parking: true,
        airportShuttle: false,
        wifiIncluded: true,
        guestRating: 7.9
    },
    {
        id: 40,
        name: "Moonlight Suites",
        price: 225,
        breakfast: true,
        parking: false,
        airportShuttle: false,
        wifiIncluded: true,
        guestRating: 8.6
    },
    {
        id: 41,
        name: "Cedar Grove Inn",
        price: 140,
        breakfast: true,
        parking: true,
        airportShuttle: false,
        wifiIncluded: false,
        guestRating: 7.8
    },
    {
        id: 42,
        name: "Royal Crown Resort",
        price: 410,
        breakfast: true,
        parking: true,
        airportShuttle: true,
        wifiIncluded: true,
        guestRating: 9.6
    },
    {
        id: 43,
        name: "Downtown Budget Hotel",
        price: 70,
        breakfast: false,
        parking: false,
        airportShuttle: false,
        wifiIncluded: true,
        guestRating: 7.0
    },
    {
        id: 44,
        name: "The Sapphire Hotel",
        price: 295,
        breakfast: true,
        parking: true,
        airportShuttle: false,
        wifiIncluded: true,
        guestRating: 9.0
    },
    {
        id: 45,
        name: "Sunflower Garden Inn",
        price: 165,
        breakfast: true,
        parking: true,
        airportShuttle: false,
        wifiIncluded: true,
        guestRating: 8.3
    },
    {
        id: 46,
        name: "Oceanfront Luxury Suites",
        price: 475,
        breakfast: true,
        parking: true,
        airportShuttle: true,
        wifiIncluded: true,
        guestRating: 9.7
    },
    {
        id: 47,
        name: "The Transit Hotel",
        price: 90,
        breakfast: false,
        parking: false,
        airportShuttle: true,
        wifiIncluded: true,
        guestRating: 7.4
    },
    {
        id: 48,
        name: "Willow Creek Lodge",
        price: 185,
        breakfast: true,
        parking: true,
        airportShuttle: false,
        wifiIncluded: true,
        guestRating: 8.5
    },
    {
        id: 49,
        name: "Imperial Grand Hotel",
        price: 440,
        breakfast: true,
        parking: true,
        airportShuttle: true,
        wifiIncluded: true,
        guestRating: 9.5
    },
    {
        id: 50,
        name: "The Minimalist Inn",
        price: 100,
        breakfast: false,
        parking: false,
        airportShuttle: false,
        wifiIncluded: true,
        guestRating: 7.6
    }
];

export default hotels;
