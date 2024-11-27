// #include "./thesis-template.typ"
#set heading(numbering: "1.1.1")
#set figure(supplement: [Hình])
#set text(size: 13pt)
#set par(leading: 1.5em)

#outline(title: "Mục lục", indent: true)


#pagebreak()
#outline(
  title: [Danh mục các hình],
  target: figure.where(kind: image),
)

// -----------------------------------
//    CONTENTS
// -----------------------------------

#include "../docs/part03-notations.typ"
#include "../docs/part04-images.typ"
#include "../docs/part01-thanks.typ"
#include "../docs/part05-commit.typ"
#include "../docs/part02-intro.typ"

// --------- CHƯƠNG 2

#pagebreak()
#include "../docs/part11-graphs.typ"
#include "../docs/part13-median.typ"
#include "../docs/part141-knapsack.typ"
#include "../docs/part142-inverse.typ"
#include "../docs/part143-reverse.typ"
#include "../docs/part144-upgrading.typ"

// --------- CHƯƠNG 3
// #part([Chương 2]) 
#pagebreak()
#include "../docs/part21-SR.typ"
#include "../docs/part22-USR.typ"


// --------- CHƯƠNG 4
// #part([#v(0.65em)]) 
#pagebreak()
#include "../docs/part31-conclusion.typ"
#pagebreak()
#heading(numbering: none, level: 1, outlined: false)[Tài liệu tham khảo]
// #set heading(numbering: none)
#bibliography("../docs/ref.bib", title: none, style: "annual-reviews-author-date", )