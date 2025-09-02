#import "utils.typ": currentdate

#let coverletter(
    name: none,
    title: none,
    phone: none,
    email: none,
    company: none,
    city: none,
    region: none,
    postal-code: none,
    doc
) = {
    set page(
        paper: "us-letter", // a4, us-letter
        number-align: center, // left, center, right
        margin: 1.87cm, // 1.25cm, 1.87cm, 2.5cm
    )

    set text(
        font: "Helvetica",
        size: 12pt,
        hyphenate: false,
    )

    set par(
        leading: 1em,
        justify: true,
    )

    show heading.where(
        level: 2,
    ): it => {
        set align(left)
        set text(font: "Helvetica", size: 12pt, weight: "bold")
        it
    }

    // name title
    show heading.where(
        level: 1,
    ): it => {
        set text(font: "Helvetica", size: 18pt, weight: "bold")
        it
    }

    grid(
        columns: (2fr, 1fr),
        gutter: 3pt,
        [   
            #set align(left)
            #set par(leading: 0.6em)
            = #name \
            #title
        ],
        [   
            #set align(right)
            #set par(leading: 0.6em)
            #email \
            #phone \
            #company \
            #city, #region #postal-code
        ],
    )
    line(length: 100%, stroke: 1pt + black)
    align(right)[
        #v(36pt)
        #currentdate()
    ]
    doc
}