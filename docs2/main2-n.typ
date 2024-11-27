// #include "./thesis-template.typ"
// #let 

#set page(margin: (top: 3cm, bottom: 3cm, left: 3.5cm, right: 2cm))
#set heading(numbering: "1.1.1.")
#show heading.where(level: 1): set text(red)
#show heading.where(level: 2): set text(red, weight: "bold")
#set figure(supplement: [*Hình*])
#set text(font: "Times New Roman", size: 13pt)
#set par(leading: 1.5em, first-line-indent: 1.5em)
// #set math.equation(numbering: "(1)")
// #show math.equation: set text(blue)
#show math.equation: it => {
    if it.body.fields().at("size", default: none) != "display" {
      return math.display(it)
    }
    it 
}
#show cite: set text(red)
#show link: set text(red)
#import "@preview/ctheorems:1.1.3": thmrules
#show: thmrules.with(qed-symbol: $square$)



#set page(numbering: "I")
#set page(footer: context [#line(length: 100%)\ #v(-2.5em) #h(1fr) _Trang #counter(page).display("I")_ #h(1fr)])
// -----------------------------------
//    CONTENTS
// -----------------------------------
// #include "../docs2/part06-contents.typ"
// #heading(numbering: none, level: 1)[Mục lục ]
// #v(2em)
#{
  // set page(numbering: "I")
  // set page(footer: context [#line(length: 100%)\ #v(-2.5em) #h(1fr) Trang #counter(page).display("I")])
  show outline.entry.where(
    level: 1
  ): it => {
    strong(it)
  }
  show outline.entry.where(
    level: 2
  ): it => {
    text(weight: "bold", it)
  }
  outline(title: [Mục lục\ #v(1em)], indent: true)
}





#include "../docs2/part03-notations.typ"
#include "../docs2/part04-images.typ"
#include "../docs2/part01-thanks.typ"
#include "../docs2/part05-commit.typ"
#include "../docs2/part02-intro.typ"

#set page(footer: context [#line(length: 100%)\ #v(-2.5em) #h(1fr) _Trang #counter(page).display()_ #h(1fr)])
// #set page(footer: context [#h(1fr) Trang #counter(page).display()])
#set page(numbering: "1")
#counter(page).update(1)
// // --------- CHƯƠNG 2
#pagebreak()
#include "../docs2/part11-graphs.typ"
#include "../docs2/part13-median.typ"
#include "../docs2/part141-knapsack.typ"
#include "../docs2/part142-inverse.typ"
#include "../docs2/part143-reverse.typ"
#include "../docs2/part144-upgrading.typ"

// --------- CHƯƠNG 3
// #part([Chương 2]) 
#pagebreak()
#include "../docs2/part21-SR.typ"
#include "../docs2/part22-USR.typ"


// --------- CHƯƠNG 4
// #part([#v(0.65em)]) 
#pagebreak()
#include "../docs2/part31-conclusion.typ"
#pagebreak()
#heading(numbering: none, level: 1, outlined: true)[Tài liệu tham khảo]
// #set heading(numbering: none)
\ //this line is a hack fix indent issue
#bibliography("../docs2/ref.bib", title: none, style: "annual-reviews-author-date", )