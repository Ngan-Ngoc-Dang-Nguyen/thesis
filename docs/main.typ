#import "../typst-orange.typ": project, part, chapter, my-bibliography, appendices, make-index, index, theorem, mathcal
// #import "@preview/indenta:0.0.3": fix-indent
// #show: fix-indent() 
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
  // title: "Bài toán nâng cấp bán kính ổn định cho vị trí 1-median trên cây",
//   title: [Bài toán nâng cấp bán kính ổn định\ cho vị trí 1-median trên cây],
  title: [NÂNG CẤP BÁN KÍNH ỔN ĐỊNH\ CHO VỊ TRÍ 1-MEDIAN TRÊN CÂY],
  // title: [],
  //subtitle: "A Practical Guide",
  date: "2024",
  author: "Nguyễn Đặng Ngọc Ngân",
  mainColor: rgb("#F36619"),
  // mainColor: blue,
  lang: "en",
  cover: image("../images/background.svg"),
//   imageIndex: image("../images/orange1.jpg"),
  imageIndex: none,
  listOfFigureTitle: "Danh sách hình vẽ",
  listOfTableTitle: "Danh sách bảng",
  supplementChapter: "Chương",
  supplementPart: "Phần",
  part_style: 0,
  copyright: [],

)

#set figure(supplement: "Hình")
#set text(font: "Times New Roman", size: 13pt)
// #show par: set block(spacing: 4em)
// #show list: set block(spacing: 2em)
// #show table: set par(leading: 0.65em)
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
#import "@preview/ctheorems:1.1.3": thmrules
#show: thmrules.with(qed-symbol: $square$)
// #let theorem = thmbox("theorem", "Định lý", base_level: 1, fill: rgb("#eeffee"), stroke: black, radius: 2pt)
// #let proposition = thmbox("theorem", "Mệnh đề", base_level: 1, fill: rgb("#eeffee"), stroke: black, radius: 2pt)
// #let definition = thmbox("theorem", "Định nghĩa", base_level: 1, fill: rgb("#eeffee"), stroke: black, radius: 2pt)

// #chapter("Sectioning Examples", image: image("../images/orange2.jpg"), l: "chap1")
// #index("Sectioning")
// #include "../tools/multi-section-ref.typ"
// #import "../tools/macros.typ": eqref
// #import "../typst-orange.typ": theorem, proof, lemma, proposition, corollary, example
// #pagebreak()
#include "../docs/part03-notations.typ"
#include "../docs/part04-images.typ"
#include "../docs/part01-thanks.typ"
#include "../docs/part02-intro.typ"

// <<<<<<< HEAD
#pagebreak()
#pagebreak()

// =======
// #include "../docs/part03-notations.typ"
// >>>>>>> 79c32a546ec82858b5e429893b6d7167e35cfd47

// --------- CHƯƠNG 2
// #part([Chương 1]) 
#pagebreak()
// // #include "../docs/xxx-how.typ"
// #include "../docs/chapter1.typ"
// // #include "../docs/chapter2.typ"
// #include "../docs/1.2 median.typ"
// == Inverse 1-median và các bài toán liên quan
// #include "../docs/problem-knapsack.typ"
// #include "../docs/problem-inverse.typ"
// #include "../docs/problem-reverse.typ"
// #include "../docs/problem-upgrading.typ"

#include "../docs/part11-graphs.typ"
// #include "../docs/part12-complexity.typ"
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
