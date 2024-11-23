
#import "@preview/ctheorems:1.1.3": *
#set heading(numbering: "1.")
// #show: thmrules
#show: thmrules.with(qed-symbol: $square$)
#let theorem = thmbox("theorem", "Định lý", base_level: 1, fill: rgb("#eeffee"), stroke: black, radius: 2pt)
#let proposition = thmbox("theorem", "Mệnh đề", base_level: 1, fill: rgb("#eeffee"), stroke: black, radius: 2pt)
#let definition = thmbox("theorem", "Định nghĩa", base_level: 1, fill: rgb("#eeffee"), stroke: black, radius: 2pt)
= Ref of theorem 
== xxx
#theorem[
  Tổng bậc của tất cả các đỉnh trong một đồ thị bằng hai lần số cạnh của đồ thị đó.
] <theorem-tong-bac>

#theorem[
  XXX
] <theorem-tong-bac2>


#proposition[
  XXX
] <theorem-tong-bac3>

// #show ref: it => {
//   let eq = math.equation
//   let el = it.element
//   // if el != none and el.func() == eq {
//   if el != none and el.func() == figure {
//     // link(el.location(),numbering(
//     //   el.numbering,
//     //   ..counter(figure).at(el.location())
//     // ))
//     // link(el.location())[Định lý #el.numbering]
//     link(el.location())[Định lý #counter(heading)#numbering(el.numbering,..counter(figure).at(el.location()))]
//     // [#counter(figure).at(el.location()), #el.numbering]
    
//   } else {
//     // Other references as usual.
//     it
//   }
// }

// #thmref(<theorem-tong-bac>)

Ta có @theorem-tong-bac và @theorem-tong-bac2