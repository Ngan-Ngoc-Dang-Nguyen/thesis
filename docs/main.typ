#import "../typst-orange.typ": project, part, chapter, my-bibliography, appendices, make-index, index, theorem, mathcal

#show math.equation: it => {
    if it.body.fields().at("size", default: none) != "display" {
      return math.display(it)
    }
    it 
}
//#set text(font: "Linux Libertine")
//#set text(font: "TeX Gyre Pagella")
// #set text(font: "Lato")
//#show math.equation: set text(font: "Fira Math")
// #show math.equation: set text(font: "Lato Math")
// #show raw: set text(font: "Fira Code")

#show: project.with(
  title: "Bài toán nâng cấp bán kính ổn định cho vị trí 1-median trên cây",
  //subtitle: "A Practical Guide",
  date: "Anno scolastico 2023-2024",
  author: "Nguyễn Đặng Ngọc Ngân",
  mainColor: rgb("#F36619"),
  lang: "en",
  cover: image("../images/background.svg"),
  imageIndex: image("../images/orange1.jpg"),
  listOfFigureTitle: "List of Figures",
  listOfTableTitle: "List of Tables",
  supplementChapter: "Chapter",
  supplementPart: "Part",
  part_style: 0,
  copyright: []
)

#part([Example]) 

// #chapter("Sectioning Examples", image: image("../images/orange2.jpg"), l: "chap1")
// #index("Sectioning")

#include "../docs/chapter1.typ"
#include "../docs/chapter2.typ"
#include "../docs/1.3 center.typ"
#include "../docs/knapsack.typ"
#include "../docs/inverse 1-median.typ"
#include "../docs/upgrading.typ"
#include "../docs/stable radius.typ"
#include "../docs/upgrading radius.typ"
