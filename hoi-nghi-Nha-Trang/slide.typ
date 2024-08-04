#import "@preview/polylux:0.3.1": *
#import themes.university: *
// #import themes.simple: *
#import "@preview/cetz:0.1.2": canvas, plot
#import "@preview/cetz:0.2.2"

#show: university-theme.with(
  short-author: "Trần Thủ Lễ",
  short-title: "Machine Learning and Safe Screening",
  short-date: "23-25/08/2024",
)
#import "macros.typ": *


#title-slide(
  authors: [#underline[Nguyễn Đặng Ngọc Ngân], #h(1em) Cao Minh Quang, #h(1em) Trần Thủ Lễ, #h(1em) Nguyễn Trung Kiên],
  // title: [Upgrading Stability Radius Model for Enhancing Robustness of Median Location on Tree Networks ],
  title: [Upgrading Stability Radius Model for Enhancing Robustness of Median Location on Tree Networks ],
  subtitle: "",
  date: "Nha Trang 23-25/08-2024",
  institution-name: "Khoa Sư Phạm, ĐH Cần Thơ",
  // logo: image("dummy-logo.png", width: 60mm),
  // footer: none
)

#pagebreak()


// #title-slide(
//     title: [Upgrading Stability Radius Model for Enhancing Robustness
// of Median Location on Tree Networks ],
//     //subtitle: "An overview over all the features",
//     authors:[#underline[Nguyễn Đặng Ngọc Ngân], Cao Minh Quang, Trần Thủ Lễ, Nguyễn Trung Kiên],
//     date: "August 2024",
// )

#slide(title: [#text(eastern. darken(10%))[The main content]])[

    *1. Stability Radius.*

    *2. Upgrading Stability Radidus.*]

// #new-section-slide("1. Stability Radidus" )

#slide(title: "About this presentation")[
    Let $T = (V, E)$ be a tree network with vertex set $V = {v_1, ..., v_n}$ and edge set $E$.
Each vertex $v_i ∈ V$ has a nonnegative weight $w_i$.

#import "@preview/bob-draw:0.1.0": *
#show raw.where(lang: "bob"): it => render(it)

#align(center)[#render(
    ```
  10          70                     *-----------------*
    *------------*                  /
                  \                /
                   \              /
                    \5         7 /
                     *----------*
                    /            \     *--------*
                   /              \   /
                  /                \ /
    *------------*                  * 
                /                    \
               /                      \
              /                        *--------------*
             *
    
    
    
    ```,
    width: 52%,
)]
    
    // This presentation is supposed to briefly showcase what you can do with this
    // package.

    // For a full documentation, read the
    // #link("https://polylux.dev/book/")[online book].
]


#slide[

  #import "@preview/cetz:0.1.2"
  #canvas(length: 10%, {
    import cetz.draw: *
    let (y1, y2, y3, y4) = (3,2,1, 4) 
    let (x1, x2, x3, x4) = (1, 3, 5, 7) 
    let x0 = 0
    let r = 0.5


    rect((x1, y1), (x1+5, y1+0.5), name: "a1")
    rect((x1, y2), (x1+5, y2+0.5), name: "a2")
    rect((x1, y3), (x1+5, y3+0.5), name: "a3")

    rect((x1+6, y1), (x1+6.5, y1+0.5), name: "b1")
    rect((x1+6, y2), (x1+6.5, y2+0.5), name: "b2")
    rect((x1+6, y3), (x1+6.5, y3+0.5), name: "b3")

    content("a1.left",  $alpha_1$, anchor: "right", padding: 0.1)
    content("a2.left",  $alpha_j$, anchor: "right", padding: 0.1)
    content("a3.left",  $alpha_m$, anchor: "right", padding: 0.1)
    content("b1.right", $beta_1$, anchor: "left",  padding: 0.1)
    content("b2.right", $beta_j$, anchor: "left",  padding: 0.1)
    content("b3.right", $beta_m$, anchor: "left",  padding: 0.1)

    content((x1+0.3, y1+0.25), $alpha_(11)$)
    content((x1+2.6, y1+0.25), $alpha_(1i)$)
    content((x1+4.6, y1+0.25), $alpha_(1n)$)

    line((x1, y4), (x1+5, y4), name: "x-axis", mark: (start: ">", end: ">"), stroke: gray+2pt)
    content("x-axis.top", [$n$ features], anchor: "bottom")

    line((x0, y1+0.5), (x0, y3), name: "y-axis", mark: (start: ">", end: ">"), stroke: gray+2pt)
    content("y-axis.left", [$n$ samples], anchor: "right")




  })

  #v(1em)

  Machine learning model: $beta_j approx phi(alpha_j, x)$ for all $j=1,..., m$

  Machine learning problem: $min_(x) L(x, alpha, beta)$

]

#matrix-slide(columns: (3fr, 3fr))[
  #set align(left)
  Consider machine learning problems:
  $
    min_(x in RR^n) quad 
    f(A x+b )+ g(x)
  $ <eq-primal-problem> 
  // #pause
  #v(3em)

  where 
  - $x in RR^n$ (feature space)
  - $b in RR^m$ (sample space)
  - $A in RR^(m times n)$ 
  - $f: RR^m -> RR$ is convex (data fitting)
  - $g: RR^n -> RR$ is convex (penalization)
  // - $f, g$ are separable gauge functions
][
  #pause
  #set align(left)
  *Examples:*

  - Regression:
    - linear (L2)
    - Ridge (L2+L2)
    - LAD (L1+0)
    - LASSO (L2+L1)

  - Classification
    - Logistic (Logistic+0)
    - SVM (Hinge loss+constr.)
    - Soft SVM (Hinge loss+L2)
    - Sparse SVM (Hinge loss+L1)

]

#matrix-slide[
  Regression with feature sparsity 

  (LASSO, Basis Pursuit)

  $ 1/2 sum_(i=1)^n (b_i- angle.l x, a_i angle.r)^2 + norm(x)_1 $

  #v(2em)
  // #pause

  Classification with sample sparsity 

  (Soft-SVM)

  $ sum_(i=1)^n max(0, 1 - b_i angle.l x, a_i angle.r) + 1/2 norm(x)_2^2 $
][
  #image("./img-LR.png",width: 100%)

  #image("./img-SVM.jpg", width: 100%)

]

// #slide[
//   Safe screening uses the sparsity to reduce the problem size

// ]


#slide[
  #align(center)[#box(stroke: blue, inset: 0.5em)[
    *Safe screening* exploits the sparsity to reduce the problem size.
  ]]

  #import "@preview/cetz:0.1.2"
  #canvas(length: 10%, {
    import cetz.draw: *
    line((-1,0), (8.5, 0), mark: (end: ">"), name: "axis")
    content("axis.end", [_time_], anchor: "top", padding: 0.2)
    // anchor("a", (0, 0))
    circle((0,0), radius: 0.1, fill: gray, name: "A")
    line("A.top", (0, -0.5), mark: (start: ">"), name: "lineA")
    content("lineA.end", box(stroke: gray, inset: 0.3em)[feature screening\ @ghaoui_safe_2011], anchor: "top")

    circle((3,0), radius: 0.1, fill: gray, name: "B")
    line("B.bottom", (3, 0.5), mark: (start: ">"), name: "lineB")
    content("lineB.end", box(stroke: gray, inset: 0.3em)[sample screening\ @ogawa_safe_nodate], anchor: "bottom")

    circle((6,0), radius: 0.1, fill: gray, name: "C")
    line("C.top", (6, -0.5), mark: (start: ">"), name: "lineC")
    content("lineC.end", box(stroke: gray, inset: 0.3em)[feature and sample screening\ @shibagaki_simultaneous_2016], anchor: "top")

    




    // circle((3,0), name: "B", radius: 0.1, fill: red)
    // circle((6,0), name: "C", radius: 0.1, fill: red)


    
    // content((3,1), box(stroke: gray, inset: 0.3em)[2013\ sample screening], )
    // content((6,-1), box(stroke: gray, inset: 0.3em)[2016\ feature and sample screening], )
    // content("plot.R", $g_i^+$)
  })



]

// #slide[What is t]


#slide[
  #import "@preview/cetz:0.1.2"

  #only(1)[
  #canvas(length: 10%, {
    import cetz.draw: *

    let y = 2 
    let x = 4
    let y-space = 1

    content((0, y), box(stroke: gray, inset: 0.3em)[Feature Sparsity], anchor: "right", name: "AA") 
    content((x, y), box(stroke: gray, inset: 0.3em)[Smaller primal problem], anchor: "left", name: "BB")
    line("AA.right", "BB.left", mark: (end: ">"), stroke: 3pt+gray)


    content((0, y - 2*y-space), box(stroke: gray, inset: 0.3em)[Sample Sparsity], anchor: "right", name: "CC") 
    content((x, y -  2*y-space), box(stroke: gray, inset: 0.3em)[Smaller dual problem], anchor: "left", name: "DD")
    line("CC.right", "DD.left", mark: (end: ">"), stroke: 3pt+gray)

    // circle((x/3, y), radius: 0.1, fill: gray, name: "point1")
    // circle((2*x/3, y), radius: 0.1, fill: gray, name: "point2")
    // circle((x/3, y -  2*y-space), radius: 0.1, fill: gray, name: "point3")
    // circle((2*x/3, y -  2*y-space), radius: 0.1, fill: gray, name: "point4")
    // content((x/3, y - y-space), box(stroke: gray, inset: 0.3em)[Why?], name: "why")
    // content((2*x/3, y - y-space), box(stroke: gray, inset: 0.3em)[How?], name: "how")

    // line("point1.top", "why.top", mark: (start: ">"), stroke: 3pt+gray)
    // line("point2.top", "how.top", mark: (start: ">"), stroke: 3pt+gray)
    // line("point3.bottom", "why.bottom", mark: (start: ">"), stroke: 3pt+gray)
    // line("point4.bottom", "how.bottom", mark: (start: ">"), stroke: 3pt+gray)

    // content((0, y - y-space), box(stroke: gray, inset: 0.3em)[separable gauge\ #text(blue)[(this talk)]], anchor: "right", name: "gauge")
    // content((x, y - y-space), box(stroke: gray, inset: 0.3em)[safe screening\ #text(blue)[(this talk)]], anchor: "left", name: "safe-region")
    // line("gauge.right", "why.left",  mark: (end: ">"), stroke: 3pt+gray)
    // line("safe-region.left", "how.right",  mark: (end: ">"), stroke: 3pt+gray)


  })]

  #only(2)[
  #canvas(length: 10%, {
    import cetz.draw: *

    let y = 2 
    let x = 4
    let y-space = 1

    content((0, y), box(stroke: gray, inset: 0.3em)[Feature Sparsity], anchor: "right", name: "AA") 
    content((x, y), box(stroke: gray, inset: 0.3em)[Smaller primal problem], anchor: "left", name: "BB")
    line("AA.right", "BB.left", mark: (end: ">"), stroke: 3pt+gray)


    content((0, y - 2*y-space), box(stroke: gray, inset: 0.3em)[Sample Sparsity], anchor: "right", name: "CC") 
    content((x, y -  2*y-space), box(stroke: gray, inset: 0.3em)[Smaller dual problem], anchor: "left", name: "DD")
    line("CC.right", "DD.left", mark: (end: ">"), stroke: 3pt+gray)

    circle((x/3, y), radius: 0.1, fill: gray, name: "point1")
    circle((2*x/3, y), radius: 0.1, fill: gray, name: "point2")
    circle((x/3, y -  2*y-space), radius: 0.1, fill: gray, name: "point3")
    circle((2*x/3, y -  2*y-space), radius: 0.1, fill: gray, name: "point4")
    content((x/3, y - y-space), box(stroke: gray, inset: 0.3em)[Why?], name: "why")
    content((2*x/3, y - y-space), box(stroke: gray, inset: 0.3em)[How?], name: "how")

    line("point1.top", "why.top", mark: (start: ">"), stroke: 3pt+gray)
    line("point2.top", "how.top", mark: (start: ">"), stroke: 3pt+gray)
    line("point3.bottom", "why.bottom", mark: (start: ">"), stroke: 3pt+gray)
    line("point4.bottom", "how.bottom", mark: (start: ">"), stroke: 3pt+gray)

    // content((0, y - y-space), box(stroke: gray, inset: 0.3em)[separable gauge\ #text(blue)[(this talk)]], anchor: "right", name: "gauge")
    // content((x, y - y-space), box(stroke: gray, inset: 0.3em)[safe screening\ #text(blue)[(this talk)]], anchor: "left", name: "safe-region")
    // line("gauge.right", "why.left",  mark: (end: ">"), stroke: 3pt+gray)
    // line("safe-region.left", "how.right",  mark: (end: ">"), stroke: 3pt+gray)


  })]

  #only(3)[
  #canvas(length: 10%, {
    import cetz.draw: *

    let y = 2 
    let x = 4
    let y-space = 1

    content((0, y), box(stroke: gray, inset: 0.3em)[Feature Sparsity], anchor: "right", name: "AA") 
    content((x, y), box(stroke: gray, inset: 0.3em)[Smaller primal problem], anchor: "left", name: "BB")
    line("AA.right", "BB.left", mark: (end: ">"), stroke: 3pt+gray)


    content((0, y - 2*y-space), box(stroke: gray, inset: 0.3em)[Sample Sparsity], anchor: "right", name: "CC") 
    content((x, y -  2*y-space), box(stroke: gray, inset: 0.3em)[Smaller dual problem], anchor: "left", name: "DD")
    line("CC.right", "DD.left", mark: (end: ">"), stroke: 3pt+gray)

    circle((x/3, y), radius: 0.1, fill: gray, name: "point1")
    circle((2*x/3, y), radius: 0.1, fill: gray, name: "point2")
    circle((x/3, y -  2*y-space), radius: 0.1, fill: gray, name: "point3")
    circle((2*x/3, y -  2*y-space), radius: 0.1, fill: gray, name: "point4")
    content((x/3, y - y-space), box(stroke: gray, inset: 0.3em)[Why?], name: "why")
    content((2*x/3, y - y-space), box(stroke: gray, inset: 0.3em)[How?], name: "how")

    line("point1.top", "why.top", mark: (start: ">"), stroke: 3pt+gray)
    line("point2.top", "how.top", mark: (start: ">"), stroke: 3pt+gray)
    line("point3.bottom", "why.bottom", mark: (start: ">"), stroke: 3pt+gray)
    line("point4.bottom", "how.bottom", mark: (start: ">"), stroke: 3pt+gray)

    content((0, y - y-space), box(stroke: gray, inset: 0.3em)[separable gauge\ #text(blue)[(this talk)]], anchor: "right", name: "gauge")
    content((x, y - y-space), box(stroke: gray, inset: 0.3em)[safe screening\ #text(blue)[(this talk)]], anchor: "left", name: "safe-region")
    line("gauge.right", "why.left",  mark: (end: ">"), stroke: 3pt+gray)
    line("safe-region.left", "how.right",  mark: (end: ">"), stroke: 3pt+gray)


  })]

]


#matrix-slide(columns: (3fr, 2fr))[
  #set align(left)
  $
    min_(x in RR^n) quad 
    f(A x+b )+ g(x)
  $ <eq-primal-problem> 
  // #pause

  where $f, g$ are separable gauge functions

  #uncover(3)[
    *Examples:* 

    L1-norm $g(x) = norm(x)_1$ 

    Hinge loss/RELU $g(x) = max(0, x)$ 

    Quantile/Pinball loss $ g(x) = -(1-tau) x 1_(x< 0 ) + tau x 1_(x>=0 ) $ 
  ]
][
  #pause

  $g$ is a separable gauge func.

  $ g(x)= sum_(i=1,..., n) g_i (x_i) $

  #import "@preview/cetz:0.1.2"
  #canvas(length: 10%, {
    import cetz.draw: *
    plot.plot(
      name: "plot",
      size: (5, 2),
      axis-style: "school-book",
      // x-ticks: (-1, 1,), 
      // y-ticks: (0, -3,), 
      // x-tick-step: 1, y-tick-step: 1,
      // x-min: -20, x-max: 20,
      // y-min: -2, y-max: 2,    
      x-tick-step: none, y-tick-step: none,
      // x-grid: true, y-grid: true,
      {
        plot.add(
          domain: (0,2),
          samples: 100,        
          x => (x, 3*x)
        )
        plot.add(
          domain: (-2, 0),
          samples: 100,        
          x => (x, -x)
        )
        plot.add-anchor("L", (-1,3.5))
        plot.add-anchor("R", (1,5))
      },
      )
    content("plot.L", $-g_i^-$)
    content("plot.R", $g_i^+$)
  })
  

]

// #matrix-slide(columns: (3fr, 2fr))[
//   #set align(left)

//   *Examples:* 

//   L1-norm $g(x) = norm(x)_1$ 

//   Hinge loss/RELU $g(x) = max(0, x)$ 

//   Quantile/Pinball loss $ g(x) = -(1-tau) x 1_(x< 0 ) + tau x 1_(x>=0 ) $ 

// ][

//   $g$ is a separable gauge func.

//   $ g(x)= sum_(i=1,..., n) g_i (x_i) $

//   #import "@preview/cetz:0.1.2"
//   #canvas(length: 10%, {
//     import cetz.draw: *
//     plot.plot(
//       name: "plot",
//       size: (5, 2),
//       axis-style: "school-book",
//       // x-ticks: (-1, 1,), 
//       // y-ticks: (0, -3,), 
//       // x-tick-step: 1, y-tick-step: 1,
//       // x-min: -20, x-max: 20,
//       // y-min: -2, y-max: 2,    
//       x-tick-step: none, y-tick-step: none,
//       // x-grid: true, y-grid: true,
//       {
//         plot.add(
//           domain: (0,2),
//           samples: 100,        
//           x => (x, 3*x)
//         )
//         plot.add(
//           domain: (-2, 0),
//           samples: 100,        
//           x => (x, -x)
//         )
//         plot.add-anchor("L", (-1,3.5))
//         plot.add-anchor("R", (1,5))
//       },
//       )
//     content("plot.L", $-g_i^-$)
//     content("plot.R", $g_i^+$)
//   })
  
// ]

// #slide[
//   #question[Why do we assume that $f, g$ are separable gauge function?]

//   #pause

//   #conclusion[
    
//     $g$ is separable gauge $==> $ sparsity in primal solution
  
//     $f$ is separable gauge $==> $ "sparsity" in dual solution
  
//     Pros of sparsity: smaller problem, faster solver, efficient memory
//   ]
// ]





// #matrix-slide[
//   *Machine Learning Lang.*

//   Feature screening

//   Sample screening

// ][
//   *Optimization Lang.* 

//   Reducing primal problem

//   Reducing dual problem

// ]


#slide[

  Assume that $g$ is a separable gauge function.
  $
    min_(x in RR^n) quad 
    f(A x+b )+ g(x)
  $ 
  
  Let  $IndexNonZero subset {i: xopt_i != 0}$ 

  $
    min_(x_IndexNonZero in RR^(abs(IndexNonZero))) quad 
    f(A_IndexNonZero x_IndexNonZero + b) + g_IndexNonZero (x_IndexNonZero).
  $ 
  If $xopt$ is sparse, then $IndexNonZero$ is small, #ie new problem has smaller dimension 
]


#slide[

  The Fenchel-Rockafellar dual problem is 
  $
    max_(u in RR^m) quad  
    quad -f^*(-u) - innerprod(b\, u) - g^*(A^T u )
  $

  Let $(f^+, f^-) in RR^m_+ times RR^m_+$  be the #emph[slopes] of separable gauge functions $f$.
  
  Since $f$ is a gauge, $f^*$ is an indicator function:
  $
    max quad & innerprod(-b\, u) + g^*(A^T u)\
    "s.t." quad & -u in  [-f^-, f^+]\
  $
]

#slide[
  $
    max quad & innerprod(-b\, u) + g^*(A^T u)\
    "s.t." quad & -u in  [-f^-, f^+]\
  $
  Now, let $IndexNonSaturated={i: uopt_i in (-f^-, f^+)}$. 
  $
    max quad & innerprod(-b_IndexNonSaturated\, u_IndexNonSaturated) + g^*(A^T_IndexNonSaturated u_IndexNonSaturated + k)\
    "s.t." quad & -u_IndexNonSaturated in  [-f^-_IndexNonSaturated, f^+_IndexNonSaturated]
  $
  If $uopt$ is "almost saturated", then $IndexNonSaturated$ is small, #ie the new dual problem has smaller dimension.

]

#slide[
  Optimality condition (KKT)
  $
  -uopt & in partial f(A xopt + b)\
  
  A^T uopt & in partial g(xopt) 
  $ 
]

#matrix-slide(columns: (3fr, 2fr))[
  // The optimality condition for $xopt$ and $uopt$ reads as follows 
  $
  -uopt & in partial f(A xopt + b)
  $
  // From #eqref(<eq-opt-f>), we derive the following screening rule referred to as #emph[sample elimination rule]:

  $
    [A xopt + b]_i>0 & ==>  -uopt_i = f_i^+\
    [A xopt + b]_i<0 & ==> -uopt_i = -f_i^-
  $

  For dual screening,

  #goal[Estimate $innerprod(alpha\, xopt)$]
][
  #import "@preview/cetz:0.1.2"
  #canvas(length: 10%, {
    import cetz.draw: *
    plot.plot(
      name: "plot",
      size: (5, 2),
      axis-style: "school-book",
      // x-ticks: (-1, 1,), 
      // y-ticks: (0, -3,), 
      // x-tick-step: 1, y-tick-step: 1,
      // x-min: -20, x-max: 20,
      // y-min: -2, y-max: 2,    
      x-tick-step: none, y-tick-step: none,
      // x-grid: true, y-grid: true,
      {
        plot.add(
          domain: (0,2),
          samples: 100,        
          x => (x, 3*x)
        )
        plot.add(
          domain: (-2, 0),
          samples: 100,        
          x => (x, -x)
        )
        plot.add-anchor("L", (-1,3))
        plot.add-anchor("R", (1,5))
      },
      )
    content("plot.L", $-f_i^-$)
    content("plot.R", $f_i^+$)
  })
]

#matrix-slide(columns: (3fr, 2fr))[

  $
  A^T uopt & in partial g(xopt) 
  $ 

  $
    [A^T uopt]_i in (-g^-_i, g^+_i)
    ==> xopt_i=0.
  $

  For primal screening,

  #goal[Estimate $innerprod(beta\, uopt)$]
][
  #import "@preview/cetz:0.1.2"
  #canvas(length: 10%, {
    import cetz.draw: *
    plot.plot(
      name: "plot",
      size: (5, 2),
      axis-style: "school-book",
      x-tick-step: none, y-tick-step: none,
      {
        plot.add(
          domain: (0,2),
          samples: 100,        
          x => (x, 3*x)
        )
        plot.add(
          domain: (-2, 0),
          samples: 100,        
          x => (x, -x)
        )
        plot.add-anchor("L", (-1,3))
        plot.add-anchor("R", (1,5))
      },
      )
    content("plot.L", $-g_i^-$)
    content("plot.R", $g_i^+$)
  })
]



#slide[
  *Primal safe region.*
  
  We prove that
  $
    xopt in X:={ x: g(x) + innerprod(partial f(A x_0 + b) \, x)
    <= g(x_0) + innerprod(partial f(A x_0 + b) \, x_0)}
  $

  Screening test
  $
  min quad &  innerprod(alpha\, x)\
  "s.t." quad & x in X
  $
  
  FACT: Its dual problem is 1D and can be solved by a combinatorial approach.
]


#slide[
  *Dual safe region.* 

  We proved that
  $
    uopt in U:={u in RR^m:  innerprod(b \, u_0) <= innerprod(b\, u) <= P(x_0), u in [ -f^- , f^+  ] }
  $
  Screening test
  $
  min quad &  innerprod(beta\, u)\
  "s.t." quad & u in U
  $
  FACT: This is a continuous knapsack problems with two bouding values, that can be solved in linear time using combinatorial approach. 
]

#slide[

  #table(
    columns: (1fr, 1.5fr),
    inset: 0.5em,
    [*Existing safe regions*], [*Type of safe screening*],
    [Ghaoui], [feature],
    [XXX], [sample],
    [Shibagaki], [feature & sample],
    [Cedric], [feature],
    [#text(blue)[Our safe regions]], [feature & sample (simpler, tighter)]
  )
]

#slide[
  #bibliography("references.bib", style: "annual-reviews-author-date")
]

// #focus-slide(background-img: image("background.svg"))[
//   *Another variant with an image in background...*
// ]

// #matrix-slide[
//   left
// ][
//   middle
// ][
//   right
// ]

// #matrix-slide(columns: 1)[
//   top
// ][
//   bottom
// ]

// #matrix-slide(columns: (1fr, 2fr, 1fr), ..(lorem(8),) * 9)


