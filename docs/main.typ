#import "../typst-orange.typ": project, part, chapter, my-bibliography, appendices, make-index, index, theorem, mathcal

#show math.equation: it => {
    if it.body.fields().at("size", default: none) != "display" {
      return math.display(it)
    }
    it 
}
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
  mainColor: rgb("#F36619"),
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

// #part([Chương 1]) 


// #chapter("Sectioning Examples", image: image("../images/orange2.jpg"), l: "chap1")
// #index("Sectioning")


// --------- CHƯƠNG 1
#include "../docs/chapter1.typ"
// #include "../docs/chapter2.typ"
#include "../docs/1.2 median.typ"
#include "../docs/1.3 center.typ"
#include "../docs/knapsack.typ"
#include "../docs/inverse 1-median.typ"
#include "../docs/upgrading.typ"

// --------- CHƯƠNG 2
#include "../docs/stability radius.typ"

// --------- CHƯƠNG 3
#include "../docs/upgrading radius.typ"
