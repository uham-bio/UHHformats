# Erste Schritte mit UHHformats

Das UHHformats-Paket stellt R Markdown- und Quarto-Vorlagen für HTML-,
PDF- und Word-Ausgaben bereit. Diese Vignette gibt einen schnellen
Überblick über die verfügbaren Vorlagen und den Einstieg.

## Verfügbare Vorlagen

| Vorlage | R Markdown-Funktion | Quarto-Vorlage |
|:---|:---|:---|
| HTML-Dokument | [`html_doc()`](https://uham-bio.github.io/UHHformats/reference/html_doc.md) | `html_doc` |
| Einfaches PDF-Dokument | [`pdf_doc()`](https://uham-bio.github.io/UHHformats/reference/pdf_doc.md) | `pdf_doc` |
| PDF-Bericht | [`pdf_report()`](https://uham-bio.github.io/UHHformats/reference/pdf_report.md) | `pdf_report` |
| PDF-Cheat-Sheet | [`pdf_cheatsheet()`](https://uham-bio.github.io/UHHformats/reference/pdf_cheatsheet.md) | `pdf_cheatsheet` |
| Word-Dokument | [`word_doc()`](https://uham-bio.github.io/UHHformats/reference/word_doc.md) | `word_doc` |

## Erste Schritte

### R Markdown-Dokumente

#### Dokument in RStudio erstellen

Nach der Installation des Pakets musst du RStudio möglicherweise einmal
neu starten, damit die `UHHformats`-Vorlagen angezeigt werden.

1.  Wähle **Datei** \> **Neue Datei** \> **R Markdown**, dann **Aus
    Vorlage**. Du solltest dann die Paketvorlagen zur Auswahl sehen.

2.  Wähle das Verzeichnis, in dem du deine Datei speichern möchtest, und
    vergib einen Dateinamen (dieser Name wird sowohl für die .Rmd-Datei
    als auch für den neu erstellten Ordner verwendet).

3.  Falls du die in der Vorlage enthaltene Dokumentation nutzen
    möchtest, rendere das Dokument einmal, bevor du mit eigenen Inhalten
    beginnst (klicke auf die Schaltfläche `Knit`).

![Neues Dokument in RStudio erstellen](images/img_create_document.png)

Neues Dokument in RStudio erstellen

#### Dokument über die Konsole erstellen

Verwende
[`create_rmd_doc()`](https://uham-bio.github.io/UHHformats/reference/create_rmd_doc.md),
um ein neues Verzeichnis mit der Vorlage und allen zugehörigen Dateien
zu erstellen:

``` r

UHHformats::create_rmd_doc(dirname = "mein_bericht", template = "pdf_report")
```

Oder mit der Standard-rmarkdown-Funktion:

``` r

rmarkdown::draft("mein_bericht.Rmd", template = "html_doc", package = "UHHformats")
```

Beide Funktionen erstellen ein Unterverzeichnis mit der `.Rmd`-Datei und
allen benötigten Ressourcen (Bilder, Schriften, LaTeX-Vorlagen usw.).

#### Rendern

In RStudio: Klicke auf die **Knit**-Schaltfläche. Über die Konsole:

``` r

rmarkdown::render("mein_bericht/mein_bericht.Rmd")
```

**Wichtiger Hinweis**:
[`rmarkdown::render`](https://pkgs.rstudio.com/rmarkdown/reference/render.html)
verwendet standardmäßig Pandoc zur Konvertierung des Markdown-Dokuments
in PDF, HTML oder Word. Während RStudio seine eigene interne
Pandoc-Installation nutzt, muss Pandoc bei der Verwendung der Konsole
ohne RStudio auch auf deinem System installiert sein. Siehe
<https://pandoc.org/installing.html> für Installationsanweisungen.

#### YAML-Header

Jede Vorlage enthält einen vorausgefüllten YAML-Header. Zum Beispiel für
`html_doc`:

``` yaml
---
title: "Titel"
author: "Name"
date: "2026-03-21"
output:
  UHHformats::html_doc:
    highlight: kate
    code_folding: show
    use_bookdown: true
    number_sections: false
---
```

Alle verfügbaren Optionen sind auf den Hilfeseiten dokumentiert (z. B.
[`?html_doc`](https://uham-bio.github.io/UHHformats/reference/html_doc.md),
[`?pdf_report`](https://uham-bio.github.io/UHHformats/reference/pdf_report.md)).

### Quarto-Dokumente

Verwende
[`create_quarto_doc()`](https://uham-bio.github.io/UHHformats/reference/create_quarto_doc.md),
um ein Quarto-Projekt einzurichten:

``` r

UHHformats::create_quarto_doc(dirname = "mein_html", template = "html_doc")
UHHformats::create_quarto_doc(dirname = "mein_pdf", template = "pdf_doc", font = "TheSansUHH")
```

Verfügbare Vorlagen: `html_doc`, `pdf_doc`, `pdf_report`,
`pdf_cheatsheet`, `word_doc`.

#### Rendern

In RStudio: Öffne die `.qmd`-Datei und klicke auf **Render**. Über die
Konsole:

``` r

quarto::quarto_render("mein_html/mein_html.qmd")
```

## Ordnerstruktur der Vorlage

Sowohl
[`create_rmd_doc()`](https://uham-bio.github.io/UHHformats/reference/create_rmd_doc.md)
als auch
[`create_quarto_doc()`](https://uham-bio.github.io/UHHformats/reference/create_quarto_doc.md)
erstellen ein neues Verzeichnis mit der Vorlagendatei und allen
benötigten Ressourcen. Die Ordnerstruktur hängt von der Vorlage und dem
Format ab:

**R Markdown-Vorlagen** enthalten typischerweise:

    mein_bericht/
    ├── mein_bericht.Rmd     # Das R Markdown-Dokument
    ├── bib/                 # Bibliographie (.bib) und Zitierstil (.csl)
    ├── data/                # Beispieldatensatz (mtcars.csv)
    └── images/              # Beispielbilder aus der Vorlage

**Quarto-Vorlagen** enthalten zusätzliche Dateien:

    mein_bericht/
    ├── mein_bericht.qmd     # Das Quarto-Dokument
    ├── bib/                 # Bibliographie (.bib) und Zitierstil (.csl)
    ├── data/                # Beispieldatensatz (mtcars.csv)
    ├── images/              # Beispielbilder aus der Vorlage
    ├── styles/              # Stildateien (LaTeX-Header, CSS, JS)
    └── custom_lang.yml      # Benutzerdefinierte Spracheinstellungen

Der Ordner `bib/` enthält eine Beispiel-`.bib`-Datei und eine
`.csl`-Datei für den Zitierstil (standardmäßig SAGE Harvard). Der Ordner
`styles/` in Quarto-Vorlagen enthält die LaTeX-Präambel-Dateien (für
PDF) bzw. CSS-/JS-Dateien (für HTML). Die Datei `custom_lang.yml`
ermöglicht die Anpassung von Bezeichnungen wie „Abbildung”, „Tabelle”
oder „Inhaltsverzeichnis”.

Du kannst Dateien in diesen Ordnern nach Bedarf ändern, hinzufügen oder
entfernen.

### Cover-Seite von pdf_report anpassen

Die `pdf_report`-Vorlage enthält eine Titelseite mit einem
Hintergrundbild. Du kannst das Standardbild ersetzen, indem du die Datei
`images/cover.png` durch dein eigenes Bild austauschst (gleicher
Dateiname).

In der **Quarto-Version** kannst du das Cover-Erscheinungsbild direkt im
YAML-Header anpassen:

- `cover-bg-image`: Pfad zum Cover-Bild.
- `cover-page-color`: Hintergrundfarbe als Hex-Code (z. B. `"7EB7DF"`).
- `cover-text-color`: Titelfarbe als Hex-Code (z. B. `"3A515C"`).
- `cover-fade-effect`: Bei `true` (Standard) wird die Hintergrundfarbe
  über das Bild von oben nach unten eingeblendet. Auf `false` setzen, um
  das Bild ohne Überblendungseffekt anzuzeigen.

In der **R Markdown-Version** wird der Pfad zum Cover-Bild über das
`params`-Feld im YAML-Header festgelegt (z. B.
`cover: images/cover.png`).

## Schriftoptionen

Die Standardschrift für alle Vorlagen ist **Helvetica**. PDF- und
Word-Vorlagen unterstützen außerdem die eigene Schrift der Universität
Hamburg **TheSans UHH** (für UHH-Mitglieder verfügbar). Die Schrift wird
wie folgt eingestellt:

- **R Markdown:** `font: "TheSansUHH"` im YAML-Header oder
  `font = "TheSansUHH"` in
  [`create_rmd_doc()`](https://uham-bio.github.io/UHHformats/reference/create_rmd_doc.md)
- **Quarto:** `font = "TheSansUHH"` in
  [`create_quarto_doc()`](https://uham-bio.github.io/UHHformats/reference/create_quarto_doc.md)

Eine benutzerdefinierte Schrift kann über `font = "other"` eingebunden
werden – ersetze dazu die `font_XXX.ttf`-Dateien im Vorlagenverzeichnis
durch eigene Dateien (gleiche Dateinamen beibehalten).

## Voraussetzungen

- **PDF-Ausgabe** erfordert eine LaTeX-Distribution. Empfohlen:
  [tinytex](https://yihui.org/tinytex/).
- **Quarto-Vorlagen** erfordern die [Quarto
  CLI](https://quarto.org/docs/get-started/).

Alle YAML-Optionen sind auf den Hilfeseiten dokumentiert:
[`?html_doc`](https://uham-bio.github.io/UHHformats/reference/html_doc.md),
[`?pdf_doc`](https://uham-bio.github.io/UHHformats/reference/pdf_doc.md),
[`?pdf_report`](https://uham-bio.github.io/UHHformats/reference/pdf_report.md),
[`?pdf_cheatsheet`](https://uham-bio.github.io/UHHformats/reference/pdf_cheatsheet.md),
[`?word_doc`](https://uham-bio.github.io/UHHformats/reference/word_doc.md).
