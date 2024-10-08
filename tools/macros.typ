#let remLE(x) = text(fill: blue, size: 0.75em)[[*LE:* #x]]

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