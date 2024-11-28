// #pagebreak()
// #set page(numbering: "I")
// #set page(footer: context [#line(length: 100%)\ #v(-2.5em) #h(1fr) Trang #counter(page).display("I")])
#heading(numbering: none, level: 1)[Mục lục ]
#v(2em)
#{
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
  outline(title: none, indent: true)
}



