#include "../tools/multi-section-ref.typ"
#import "../tools/macros.typ": eqref
#import "../typst-orange.typ": theorem, proof, lemma, proposition, corollary, example
= CÁCH DÙNG TYPST

- ở mỗi file, cần thêm các dòng sau ở đầu file 
```typ
#include "../tools/multi-section-ref.typ"
#import "../tools/macros.typ": eqref
#import "../typst-orange.typ": theorem, proof
```

- Ví dụ về cách trích dẫn @alizadehBudgetconstrainedInverseMedian2020a và @alizadehCombinatorialAlgorithmsInverse2011

// #set math.equation(numbering: "(1)")
- Ví dụ về cách ref một equation 
$ x^2 + y^2 = z^2 $ <eq:pytago>
Có thể dùng lệnh `eqref(<equation-label>)` (equation reference) #eqref(<eq:pytago>)
$ x^3 + y^3 = z^3 $ <eq:pytago3>
Có thể ref #eqref(<eq:pytago3>).

- Ví dụ về cách tạo định lý: 

#theorem(name: "Định lý Pytago")[
  Định lý Pytago phát biểu rằng: ....
]
#proof[Để chứng minh định lý đầu tiên ta sẽ ...]

#theorem(name: "Định lý Pytago số 2")[
  Định lý Pytago phát biểu rằng: ....
]
#proof[...]

#lemma(name: "XXX")[
  YYY
]

#proposition(name: "XXX")[
  YYY
]

#corollary(name: "XXX")[
  YYY
]

#example(name: "XXX")[
  YYY
]

#pagebreak()