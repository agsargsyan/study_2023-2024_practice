(TeX-add-style-hook
 "main"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("report" "a4paper" "")))
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("fontenc" "T2A") ("inputenc" "utf8") ("babel" "russian") ("scrextend" "fontsize=13pt") ("xcolor" "table" "xcdraw") ("geometry" "left=30mm" "right=15mm" "bottom=20mm" "top=20mm") ("hyperref" "hidelinks") ("natbib" "numbers")))
   (add-to-list 'LaTeX-verbatim-environments-local "lstlisting")
   (add-to-list 'LaTeX-verbatim-environments-local "minted")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "lstinline")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "nolinkurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperbaseurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperimage")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperref")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "href")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "lstinline")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "path")
   (TeX-run-style-hooks
    "latex2e"
    "title"
    "abstract"
    "abbrev"
    "intro"
    "ch01"
    "ch02"
    "ch03"
    "conclusion"
    "ap01"
    "bib"
    "report"
    "rep10"
    "fontenc"
    "inputenc"
    "babel"
    "setspace"
    "scrextend"
    "xcolor"
    "geometry"
    "sectsty"
    "amsmath"
    "listings"
    "pdflscape"
    "graphicx"
    "subfig"
    "hyperref"
    "amssymb"
    "natbib"
    "enumerate"
    "verbatim"
    "minted")
   (LaTeX-add-bibliographies
    "bib"))
 :latex)

