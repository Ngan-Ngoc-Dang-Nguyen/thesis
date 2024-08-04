#import "@preview/gentle-clues:0.7.1": *
// #import "@preview/diagraph:0.2.0": *
// #import "@preview/minitoc:0.1.0": *
// #import "../../src/tybank.typ": *
// #import "@preview/moremath:0.1.0": ind
#show: gentle-clues.with(breakable: true)
#set page(numbering: "1")
#set heading(numbering: "1.1.")
#set text(font: "New Computer Modern")
#set par(justify: true) 
#set enum(numbering: "a)")
#set math.equation(numbering: "(1)")
// #set ref(supplement: it => [(#counter("equation"))])
#let title(x) = [#align(center)[#text(size: 1.7em, fill: black)[*#x*]] ]
#let aka = [a.k.a]
#let eg = [e.g.]
#let ie = [i.e.]
#let etal = [et. al.]
#let wrt = [w.r.t.]
#let remLE(x) = text(fill: blue, size: 0.75em)[[*LE:* #x]]
#let fbar = $overline(f)$
#let gbar = $overline(g)$

// math's macros
#let innerprod(x) = $angle.l #x angle.r$
#let polar(x) = $#x degree$
#let conj(x) = $#x^*$
#let xopt = $x^star$
#let uopt = $u^star$
#let rowmatrix = $r$

#let IndexNonZero = $I_(!= 0)$
#let IndexNonSaturated = $I_(circle)$

#let PLASSO = $P_"L"$
#let PSVM = $P_"SVM"$
#let RRbar = $overline(RR)$
#let phibar = $overline(phi)$
#let one = $bb(1)$
#let ind(x) = $Iota(#x)$
#let example(x) = [*Example.* _#x _]
#let goal(x) = box(stroke: blue, inset: 0.5em)[*GOAL:* _#x _]

//--------------- eqref
// #let reffmt = it => box(stroke: rgb("#ff0000") + 0.5pt, outset: 2pt)[#smallcaps[#it]]
#let reffmt = it => text(fill: blue)[#it]
#show ref: reffmt
#let linkfmt = it => [#underline(text(blue)[#it])]

#import "eqref.typ": *

#let eqref = eqref.with(style: reffmt) // set defaults
#let customEqfmt = (nums) => [#box[Eq. (#numbering("1.1", ..nums))]]
#let customEqref = eqref.with(fmt: customEqfmt, style: emph) // alternate options
//--------------- eqref