
#import "@preview/ctheorems:1.1.3": *
#set heading(numbering: "1.")
// #show: thmrules
#show: thmrules.with(qed-symbol: $square$)
#let theorem = thmbox("theorem", "Định lý", base_level: 1, fill: rgb("#eeffee"), stroke: black, radius: 2pt)
#let proposition = thmbox("theorem", "Mệnh đề", base_level: 1, fill: rgb("#eeffee"), stroke: black, radius: 2pt)
#let definition = thmbox("theorem", "Định nghĩa", base_level: 1, fill: rgb("#eeffee"), stroke: black, radius: 2pt)

#import "@preview/equate:0.2.1": equate
#show: equate.with(breakable: true, sub-numbering: true)
#set math.equation(numbering: "(1.1)", supplement: "Eq.")
#let myref(x) = text(fill: red)[(#x)]
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

= Equation 

// #let opt-prob = $
// max quad & underline(R)(tilde(w)) &  #h(1fr) #text(blue)[(USR-20)]\ 

// "s.t." quad & norm(tilde(w)-w)_1 <= B & #h(1fr) quad("USR"-20a)\

//  & v_1 "is 1-median w.r.t" tilde(w) & #h(1fr) ("USR" - 20b)\

//  & sum^n_(i=1) tilde(w)_i = 1 & #h(1fr) ("USR" -20c)\

//  & norm(tilde(w)-w)_infinity <= epsilon_0 & #h(1fr) ("USR" - 20d)
// $ 
// #import "@preview/equate:0.2.1": equate
// #show ref: equate



// #equate($
//   E &= m c^2 #<short> \
//     &= sqrt(p^2 c^2 + m^2 c^4) #<long>
// $)

// While @short is the famous equation by Einstein, @long is a
// more general form of the energy-momentum relation.


// #let symbol(body) = math.equation(
//   numbering: n => {
//     let symbols = ("∗", "†", "‡", "§", "¶", "‖")
//     let symbol = symbols.at(calc.rem(n - 1, symbols.len()))
//     [(#symbol)]
//   },
//   number-align: left,
//   body
// )

// #set math.equation(
//   numbering: n => [(USR-#n)],
//   number-align: right,
// )

// $ f = u product g_i space.thin . $

// #math.equation(
//   block: true,
//   numbering: n => [(USR-#n)],
//   number-align: right,
//   $x^2 + y^2$
// )

#let label-eq(label: none, body) = math.equation(
  block: true,
  numbering: n => {
    if label != none {[(#label - #n)]}
    else {[(#n)]}
  },
  number-align: right,
  body
)
#label-eq(label: "USR", $x^2 + y^2 = z^2$)




#let opt-prob2 = $
  max quad & underline(R)(tilde(w)) \ 

  "s.t." quad & norm(tilde(w)-w)_1 <= B \

  & v_1 "is 1-median w.r.t" tilde(w)\

  & sum^n_(i=1) tilde(w)_i = 1 \

  & norm(tilde(w)-w)_infinity <= epsilon_0 #<eq4>
$

#opt-prob2
// #label-eq(label: "USR", opt-prob2)

We have @eq4