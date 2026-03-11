// UHH Report Typst Template for Quarto
// Based on the UHH Pandoc Typst report template
//
// Produces a report with optional cover page, title page, TOC, and body.

// ===== Colors =====
#let uhh-darkblue = rgb("#3B515B")
#let uhh-blue     = rgb("#0271BB")


// ===== Cover page colors from YAML (or defaults) =====
#let cover-page-color = rgb("#$if(cover-page-color)$$cover-page-color$$else$7EB7DF$endif$")
#let cover-text-color = rgb("#$if(cover-text-color)$$cover-text-color$$else$3A515C$endif$")


// ===== Font settings =====
#let main-font   = "$if(mainfont)$$mainfont$$else$Helvetica Neue$endif$"
#let main-weight = "$if(fontweight)$$fontweight$$else$light$endif$"
#let main-size   = $if(fontsize)$$fontsize$$else$11pt$endif$
#let main-lang   = "$if(lang)$$lang$$else$en$endif$"


// ===== Language-dependent strings =====
#let is-german = main-lang == "de"
#let str-correspondence = if is-german { "Korrespondenz" } else { "Correspondence" }
#let str-toc = if is-german { "Inhaltsverzeichnis" } else { "Table of Contents" }


// ============================================================
// COVER PAGE
// ============================================================
$if(cover-bg-image)$
#page(
  paper: "a4",
  margin: 0mm,
  numbering: none,
  header: none,
  footer: none,
  fill: cover-page-color,
)[
  // Background image
  #place(bottom + center,
    image("$cover-bg-image$", width: 100%, fit: "cover"),
  )

  // Gradient overlay
  $if(cover-fade-effect)$
  #place(bottom + center,
    block(
      width: 100%,
      height: 70%,
      fill: gradient.linear(
        cover-page-color,
        cover-page-color.transparentize(100%),
        dir: ttb,
      ),
    )
  )
  $endif$

  // Title + subtitle
  #place(top + left, dx: 25mm, dy: 50mm)[
    #block(below: 0pt)[
      #text(font: main-font, size: 36pt, weight: "bold", fill: cover-text-color)[
        $title$
      ]
    ]
    $if(subtitle)$
    #block(above: 6pt)[
      #text(font: main-font, size: 22pt, weight: "regular", style: "italic", fill: cover-text-color)[
        $subtitle$
      ]
    ]
    $endif$
  ]
]
$endif$


// ============================================================
// TITLE PAGE
// ============================================================
#page(
  paper: "a4",
  margin: (top: 25mm, bottom: 25mm, left: 25mm, right: 25mm),
  numbering: none,
  header: none,
  footer: none,
)[
  #grid(
    columns: (1pt, 1fr),
    column-gutter: 5%,
    // Vertical rule
    line(length: 100%, angle: 90deg, stroke: 1pt + uhh-darkblue),
    // Content
    [
      // Title
      #block(below: 0pt)[
        #text(font: main-font, size: 20pt, weight: "bold", fill: uhh-darkblue)[
          $title$
        ]
      ]

      // Subtitle
      $if(subtitle)$
      #block(above: 20pt, below: 0pt)[
        #text(font: main-font, size: 14pt, weight: main-weight, style: "italic", fill: uhh-darkblue)[
          $subtitle$
        ]
      ]
      $endif$

      #v(3.5em)

      // Abstract
      $if(abstract)$
      #align(right)[
        #text(font: main-font, size: main-size, weight: main-weight)[
          $abstract$
        ]
      ]
      #v(3.5em)
      $endif$

      // Authors with superscript affiliations
      #text(font: main-font, size: 12pt, weight: main-weight)[
        $for(author)$#text(weight: "regular")[$author.name$]$if(author.affil)$#text(size: 8pt, baseline: -3pt)[$author.affil$]$endif$$if(author.email)$#text(size: 8pt, baseline: -3pt)[,\*]$endif$$sep$, $endfor$
      ]

      #v(1.5em)

      // Affiliations
      #text(font: main-font, size: 10pt, weight: main-weight)[
        $for(affiliations)$#h(1em)$affiliations.number$.~$if(affiliations.name)$$affiliations.name$$endif$$if(affiliations.department)$, $affiliations.department$$endif$$if(affiliations.address)$, $affiliations.address$$endif$\
        $endfor$
      ]

      #v(0.8em)

      // Correspondence
      #text(font: main-font, size: 10pt, style: "italic", weight: main-weight)[
        #h(1em)$for(author)$$if(author.email)$\* #str-correspondence: $author.name$ -- $author.email$$endif$$endfor$
      ]

      #v(1fr)

      // Date
      $if(date)$
      #text(font: main-font, size: main-size, weight: main-weight)[$date$]
      #v(2em)
      $endif$

      // Logos at bottom
      #grid(
        columns: (auto, 1fr, auto),
        align: (left + bottom, center, right + bottom),
        $if(logo1)$image("$logo1$", width: 50mm)$else$[]$endif$,
        [],
        $if(logo2)$image("$logo2$", width: 50mm)$else$[]$endif$,
      )
    ],
  )
]


// ============================================================
// GLOBAL SETTINGS
// ============================================================

// Document metadata
#set document(
$if(title)$
  title: "$title$",
$endif$
)

// Font
#set text(
  font: (main-font,),
  weight: main-weight,
  size: main-size,
  lang: main-lang,
$if(region)$
  region: "$region$",
$endif$
)

// Paragraph settings
#set par(
  first-line-indent: 0em,
  leading: 0.3em,
  spacing: 1.2em,
  justify: true,
)


// ===== Section numbering =====
$if(numbersections)$
#set heading(numbering: "$if(section-numbering)$$section-numbering$$else$1.1.1$endif$")
$else$
// numbersections not set or false
$endif$


// ===== Heading styles =====

// State to track which pages have a H1
#let h1-page = state("h1-page", ())

// Level 1: new page, larger font, dark blue
#show heading.where(level: 1): it => {
  colbreak(weak: true)
  [#metadata("h1-page") <h1-page-marker>]
  v(1.5em)
  text(size: 1.4em, weight: "bold", fill: uhh-darkblue)[
    #if it.numbering != none {
      counter(heading).display(it.numbering)
      h(0.5em)
    }
    #it.body
  ]
  v(0.4em)
}

// Level 2: UHH blue
#show heading.where(level: 2): it => {
  v(1em)
  text(size: 1.15em, weight: "bold", fill: uhh-blue)[
    #if it.numbering != none {
      counter(heading).display(it.numbering)
      h(0.5em)
    }
    #it.body
  ]
  v(0.1em)
}

// Level 3
#show heading.where(level: 3): it => {
  v(0.8em)
  text(size: 1.15em, weight: "bold", fill: uhh-darkblue)[
    #if it.numbering != none {
      counter(heading).display(it.numbering)
      h(0.5em)
    }
    #it.body
  ]
  v(0.1em)
}

// Level 4 (inline-style, no numbering)
#show heading.where(level: 4): it => {
  v(0.4em)
  text(size: 1.0em, weight: "bold", fill: uhh-darkblue)[#it.body]
  v(0.1em)
}


// ===== Links =====
#show link: it => {
  text(fill: uhh-blue)[#it]
}


// ===== List styles =====
#set list(
  indent: 1em,
  spacing: 0.6em,
  marker: (
    move(dy: 0.45em, square(size: 4.5pt, fill: uhh-blue)),
    move(dy: 0.45em, square(size: 4.5pt, fill: none, stroke: 0.8pt + uhh-darkblue)),
    move(dy: 0.45em, square(size: 3.5pt, fill: uhh-blue)),
    move(dy: 0.45em, square(size: 3.5pt, fill: none, stroke: 0.8pt + uhh-darkblue)),
  ),
)

#set enum(
  indent: 1em,
  spacing: 0.6em,
)


// ===== Figure captions =====
#show figure.caption: it => {
  text(size: 0.9em)[
    #text(weight: "bold")[#it.supplement #context it.counter.display(it.numbering)#it.separator]#it.body
  ]
}


// ===== Table styling =====
#set table(
  stroke: (x: none, y: 0.5pt + uhh-darkblue),
  inset: (x: 8pt, y: 5pt),
)

#show table.cell.where(y: 0): set text(weight: "bold", fill: uhh-darkblue)
#show table: set text(size: 0.9em)

#show figure.where(kind: table): it => {
  block(breakable: true)[
    #it.body
  ]
  if it.has("caption") {
    v(0.3em)
    it.caption
  }
}


// ============================================================
// TABLE OF CONTENTS
// ============================================================
$if(toc)$
#set page(
  paper: "$if(papersize)$$papersize$$else$a4$endif$",
$if(margin)$
  margin: ($for(margin/pairs)$$margin.key$: $margin.value$,$endfor$),
$else$
  margin: (top: 25mm, bottom: 35mm, left: 25mm, right: 25mm),
$endif$
  numbering: "i",
  header: none,
  footer-descent: 8%,
  footer: context {
    v(1em)
    grid(
      columns: (1fr, 1fr),
      align: (left + horizon, right + horizon),
$if(footer-logo)$
      image("$footer-logo$", height: 10mm),
$else$
      box(height: 10mm),
$endif$
      text(size: 9pt)[#counter(page).display("i")],
    )
  },
)

#v(2em)
#text(size: 1.5em, weight: "bold", fill: uhh-darkblue)[
  $if(toc-title)$$toc-title$$else$#str-toc$endif$
]
#v(1.5em)

// Custom TOC styling: level-1 bold + colored + larger
#show outline.entry: it => {
  if it.level == 1 {
    v(1.0em)
    text(fill: uhh-darkblue, size: 1.1em)[#strong(it)]
  } else {
    it
  }
}

#set outline.entry(fill: pad(right: 8pt, repeat[.#h(5pt)]))

#set par(leading: 0.5em)
#outline(
  title: none,
  depth: $if(toc-depth)$$toc-depth$$else$4$endif$,
  indent: 1.5em,
)
#set par(leading: 0.3em)
#pagebreak()
$endif$


// ============================================================
// BODY PAGES (arabic numbers, running header)
// ============================================================

#counter(page).update(1)

#set page(
  paper: "$if(papersize)$$papersize$$else$a4$endif$",
$if(margin)$
  margin: ($for(margin/pairs)$$margin.key$: $margin.value$,$endfor$),
$else$
  margin: (top: 25mm, bottom: 35mm, left: 25mm, right: 25mm),
$endif$
  numbering: "1",
  footer-descent: 8%,
  header: context {
    let markers = query(<h1-page-marker>)
    let current-page = here().page()
    let h1-starts-here = markers.any(m => m.location().page() == current-page)

    if not h1-starts-here {
      let h1-elems = query(heading.where(level: 1).before(here()))
      let heading-text = none
      if h1-elems.len() > 0 {
        heading-text = h1-elems.last().body
      }
      if heading-text != none {
        let is-even = calc.even(counter(page).get().first())
        let alignment = if is-even { left } else { right }
        align(alignment, text(size: 11pt, style: "italic", fill: uhh-darkblue)[
          #heading-text
        ])
      }
      v(-4pt)
      line(length: 100%, stroke: 0.5pt + uhh-darkblue)
    }
  },
  footer: context {
    let page-num = counter(page).get().first()
    v(1em)
    grid(
      columns: (1fr, 1fr),
      align: (left + horizon, right + horizon),
$if(footer-logo)$
      image("$footer-logo$", height: 10mm),
$else$
      box(height: 10mm),
$endif$
      text(size: 10pt)[#page-num],
    )
  },
)


// ===== Header includes =====
$for(header-includes)$
$header-includes$
$endfor$


// ===== Body =====
$body$
