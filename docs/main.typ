#import "../typst-orange.typ": project, part, chapter, my-bibliography, appendices, make-index, index, theorem, mathcal
// // begin format of Theorem
// #import "@preview/ctheorems:1.1.2": *
// #show: thmrules.with(qed-symbol: $square$)

// #set page(width: 16cm, height: auto, margin: 1.5cm)
// #set heading(numbering: "1.1.")

// #let theorem = thmbox("theorem", "Theorem", fill: rgb("#eeffee"))
// #let corollary = thmplain(
//   "corollary",
//   "Corollary",
//   base: "theorem",
//   titlefmt: strong
// )
// #let definition = thmbox("definition", "Definition", inset: (x: 1.2em, top: 1em))

// #let example = thmplain("example", "Example").with(numbering: none)
// #let proof = thmproof("proof", "Proof")
// // end of format of Theorem

// #set text(font: "Times New Roman", size: 14pt)
//#set text(font: "TeX Gyre Pagella")
// #set text(font: "Lato")
//#show math.equation: set text(font: "Fira Math")
// #show math.equation: set text(font: "Lato Math")
// #show raw: set text(font: "Fira Code")

#show: project.with(
  title: "Bài toán nâng cấp bán kính ổn định cho vị trí 1-median trên cây",
  //subtitle: "A Practical Guide",
  date: "2024",
  author: "Nguyễn Đặng Ngọc Ngân",
  // mainColor: rgb("#F36619"),
  mainColor: blue,
  lang: "en",
  cover: image("../images/background.svg"),
  imageIndex: image("../images/orange1.jpg"),
  listOfFigureTitle: "List of Figures",
  listOfTableTitle: "List of Tables",
  supplementChapter: "Chương",
  supplementPart: "Phần",
  part_style: 0,
  copyright: []
)

#set text(font: "Times New Roman", size: 12pt)
#set math.equation(numbering: "(1)")
// #show math.equation: set text(blue)
#show math.equation: it => {
    if it.body.fields().at("size", default: none) != "display" {
      return math.display(it)
    }
    it 
}
// #show cite: it => [#text(fill: blue)[#cite(it)]]
#show cite: set text(red)


// #chapter("Sectioning Examples", image: image("../images/orange2.jpg"), l: "chap1")
// #index("Sectioning")


// --------- CHƯƠNG 1
#part([Chương 1]) 
#pagebreak()
#include "../docs/xxx-how.typ"
#include "../docs/chapter1.typ"
// #include "../docs/chapter2.typ"
#include "../docs/1.2 median.typ"
#include "../docs/1.3 center.typ"
#include "../docs/knapsack.typ"
#include "../docs/inverse 1-median.typ"
#include "../docs/upgrading.typ"

// --------- CHƯƠNG 2
#part([Chương 2]) 
#pagebreak()
#include "../docs/stability radius.typ"

// --------- CHƯƠNG 3
#part([Chương 3]) 
#pagebreak()
#include "../docs/upgrading radius.typ"

#part([Tài Liệu Tham Khảo]) 
#pagebreak()
#bibliography("../docs/ref.bib", title: "Tài Liệu Tham Khảo", style: "annual-reviews-author-date", )
