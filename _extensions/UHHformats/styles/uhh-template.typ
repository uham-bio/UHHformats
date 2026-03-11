// UHH Typst Template for Quarto
// Based on the UHH Pandoc Typst template

// ===== Colors =====
#let uhh-bluegray = rgb("#3B515B")
#let uhh-blue     = rgb("#0271BB")


// ===== Page setup =====
#set page(
  paper: "$if(papersize)$$papersize$$else$a4$endif$",
$if(margin)$
  margin: ($for(margin/pairs)$$margin.key$: $margin.value$,$endfor$),
$else$
  margin: (top: 25mm, bottom: 30mm, left: 25mm, right: 25mm),
$endif$
  numbering: "1",
  footer-descent: 8%,
  header: context {
    if counter(page).get().first() > 1 {
      let elems = query(heading.where(level: 1).before(here()))
      if elems.len() > 0 {
        let current-heading = elems.last()
        align(right, text(size: 9pt, style: "italic", fill: uhh-bluegray)[
          #current-heading.body
        ])
      }
      v(-2pt)
      line(length: 100%, stroke: 0.5pt + uhh-bluegray)
    }
  },
  footer: context {
    let page-num = counter(page).get().first()
    v(1em)
    grid(
      columns: (1fr, 1fr),
      align: (left + horizon, right + horizon),
$if(footer-logo)$
      if page-num > 1 { image("$footer-logo$", height: 10mm) } else { box(height: 10mm) },
$else$
      box(height: 10mm),
$endif$
      text(size: 9pt)[#page-num],
    )
  },
)


// Paragraph leading
#set par(leading: 0.3em)


// ===== Document metadata =====
#set document(
$if(title)$
  title: "$title$",
$endif$
$if(author)$
  author: ($for(author)$"$author$",$endfor$),
$endif$
$if(date)$
  date: auto,
$endif$
)


// ===== Font settings =====
#set text(
$if(mainfont)$
  font: ("$mainfont$",),
$else$
  font: ("Helvetica Neue",),
$endif$
$if(fontweight)$
  weight: "$fontweight$",
$else$
  weight: "light",
$endif$
$if(fontsize)$
  size: $fontsize$,
$else$
  size: 11pt,
$endif$
$if(lang)$
  lang: "$lang$",
$else$
  lang: "en",
$endif$
$if(region)$
  region: "$region$",
$endif$
)


// ===== Paragraph settings =====
#set par(
  first-line-indent: 0em,
  spacing: 1.2em,
  justify: true,
)


// ===== Heading styles =====
#show heading.where(level: 1): it => {
  v(0.8em)
  text(size: 1.1em, weight: "bold", fill: uhh-blue)[#it.body]
  v(0.2em)
}

#show heading.where(level: 2): it => {
  v(0.6em)
  text(size: 1.1em, weight: "bold", fill: uhh-bluegray)[#it.body]
  v(0.1em)
}

#show heading.where(level: 3): it => {
  v(0.4em)
  text(size: 1.1em, weight: "bold", fill: uhh-bluegray)[#it.body]
  v(0.1em)
}


// Section numbering
$if(section-numbering)$
#set heading(numbering: "$section-numbering$")
$endif$


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
    move(dy: 0.45em, square(size: 4.5pt, fill: none, stroke: 0.8pt + uhh-bluegray)),
    move(dy: 0.45em, square(size: 3.5pt, fill: uhh-blue)),
    move(dy: 0.45em, square(size: 3.5pt, fill: none, stroke: 0.8pt + uhh-bluegray)),
  ),
)


// ===== Numbered list styles =====
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
  stroke: (x: none, y: 0.5pt + uhh-bluegray),
  inset: (x: 8pt, y: 5pt),
)

#show table.cell.where(y: 0): set text(weight: "bold", fill: uhh-bluegray)
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


// ===== Title block =====
#v(0.5em)

$if(title)$
#text(size: 1.9em, weight: "bold", fill: uhh-bluegray)[$title$]
#v(-0.2em)
$endif$

$if(subtitle)$
#text(size: 1.31em, fill: uhh-bluegray)[$subtitle$]
#v(0.4em)
$endif$

$if(author)$
#text(size: 1.09em, weight: "bold", fill: uhh-bluegray)[
$for(author)$$author$$sep$, $endfor$
]
#v(0.3em)
$endif$

$if(date)$
#text(size: 0.86em, weight: "bold", fill: uhh-bluegray)[$date$]
#v(0.4em)
$endif$


// ===== Abstract =====
$if(abstract)$
#text(weight: "bold", fill: uhh-bluegray)[Abstract]
#v(-0.3em)
#text(size: 0.9em)[$abstract$]
#v(0.5em)
$endif$


// ===== Table of contents =====
$if(toc)$
#heading(level: 1, outlined: false)[$if(toc-title)$$toc-title$$else$Contents$endif$]
#outline(
  title: none,
  depth: $if(toc-depth)$$toc-depth$$else$3$endif$,
  indent: 1.5em,
)
#v(1em)
$endif$


// ===== Header includes =====
$for(header-includes)$
$header-includes$
$endfor$


// ===== Body =====
$body$
