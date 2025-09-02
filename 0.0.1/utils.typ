#let months = (
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
)

// Helper Functions
#let monthname(n, display: "short") = {

    n = int(n)
    let month = months.at(n)
    
    month
}

#let strpdate(isodate) = {
    let date = ""
    date = datetime(
        year: int(isodate.slice(0, 4)),
        month: int(isodate.slice(5, 7)),
        day: int(isodate.slice(8, 10))
    )
    date
}

#let currentdate() = {
    let date = datetime.today()
    let month = monthname(date.month() - 1)
    let day = date.day()
    let year = date.year()
    align(right)[
        #month #day, #year
    ]
}