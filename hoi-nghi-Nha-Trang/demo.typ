// #import "../polylux.typ": *  
#import "@preview/polylux:0.3.1": *
#import themes.clean: *

#show link: set text(blue)
#set text(font: "Inria Sans")
// #show heading: set text(font: "Vollkorn")
#show raw: set text(font: "JuliaMono")

#show: clean-theme.with(
    footer: [Nha Trang, August 2024],
    //short-title: [Polylux demo],
    //logo: image("../assets/logo.png"),
)

#set text(size: 20pt)

#title-slide(
    title: [Upgrading Stability Radius Model for Enhancing Robustness
of Median Location on Tree Networks ],
    //subtitle: "An overview over all the features",
    authors:[#underline[Nguyễn Đặng Ngọc Ngân],  Cao Minh Quang,  Trần Thủ Lễ,  Nguyễn Trung Kiên],
    date: "August 2024",
)

#slide(title:"The main content")[

    *1. Stability Radius.*

    *2. Upgrading Stability Radidus.*]

#new-section-slide("1. Stability Radidus" )

#slide(title: "About this presentation")[
    Let $T = (V, E)$ be a tree network with vertex set $V = {v_1, ..., v_n}$ and edge set $E$.
Each vertex $v_i ∈ V$ has a nonnegative weight $w_i$ and every edge length also has to be positive.

#import "@preview/cetz:0.1.2": canvas, plot
#import "@preview/cetz:0.2.2"
  #import "@preview/cetz:0.1.2"

  #only(1)[
  #align(center)[#canvas(length: 10%, {
    import cetz.draw: *

    let y = 2 
    let x = 4
    let y-space = 1
    let h=1.4

    circle((0*h,3), radius: 0.05,fill:black, name: "v1") 
    content("v1.bottom", $v_1 (0.1)$, anchor: "left", padding: 0.2)

    circle((-2*h, 2), radius: 0.05, fill: black, name: "v2") 
    content("v2.bottom", $v_2 (0.13)$, anchor: "left", padding: 0.2)

    circle((-3*h, 1), radius: 0.05,fill:black, name: "v5") 
    content("v5.bottom", $v_5 (0.1)$, anchor: "left", padding: 0.2)

    circle((-1*h, 1), radius: 0.05,fill:black, name: "v6") 
    content("v6.bottom", $v_6 (0.1)$, anchor: "left", padding: 0.2)

    circle((0*h, 2), radius: 0.05, fill: black, name: "v3") 
    content("v3.bottom", $v_3 (0.06)$, anchor: "left", padding: 0.2)

    circle((0*h, 1), radius: 0.05, fill: black, name: "v7") 
    content("v7.bottom", $v_7 (0.06)$, anchor: "left", padding: 0.2)

    circle((2*h, 2), radius: 0.05, fill: black, name: "v4") 
    content("v4.bottom", $v_4 (0.15)$, anchor: "left", padding: 0.2)

    circle((1*h, 1), radius: 0.05, fill: black, name: "v8") 
    content("v8.bottom", $v_8 (0.2)$, anchor: "left", padding: 0.2)
    circle((3*h, 1), radius: 0.05, fill:black, name: "v9") 
    content("v9.bottom", $v_9 (0.1)$, anchor: "left", padding: 0.2)
    
    line("v1", "v2")
    line("v1", "v3")
    line("v1", "v4")
    line("v2", "v5")
    line("v2", "v6")
    line("v3", "v7")
    line("v4", "v8")
    line("v4", "v9")    }
  )]]

    // This presentation is supposed to briefly showcase what you can do with this
    // package.

    // For a full documentation, read the
    // #link("https://polylux.dev/book/")[online book].
]

#slide(title: "1-median on tree")[

Let $d(x, v_i)$ be the length of the shortest path between x and vi. A vertex $x^*$
is called a 1-median of T, if
$f(x^*) ≤ f(x) quad forall x in V$
where $f(x)= sum_(i=1) ^n w_i d(x,v_i)$

    // We used the `title` argument of the `#slide` function for that:
    // ```typ
    // #slide(title: "First slide")[
    //     ...
    // ]
    // ```
    // (This works because we utilise the `clean` theme; more on that later.)
]

#slide(title: "Stability Radius")[
Definition of the stability radius:

$R(w) = sup{epsilon in [0, min_{i=1,..., n} w_i]: v_1 in X^*_tilde(w), quad forall tilde(w) in [w-epsilon, w+ epsilon]}$

*Theorem...* 

 $underline(R(w)) = min_{u in N(v_1)} 1/n  (1- 2 angle.l w, bb(1)_T_u angle.r).$

 *Example...*

Consider the weighted tree T in Figure 1. The stability radius of median point $v_1$ is $R(w) = min{epsilon_v_2 , epsilon_v_3 , epsilon_v_4 } = 0.1/9$ since $epsilon_v_2 = 0.34/9, epsilon_v_3 = 0.76/9, epsilon_v_4 = 0.1/9$

    // We used the `title` argument of the `#slide` function for that:
    // ```typ
    // #slide(title: "First slide")[
    //     ...
    // ]
    // ```
    // (This works because we utilise the `clean` theme; more on that later.)
]
// 

// #slide[
//     *Example...*

//     Consider the weighted tree T in Figure 1. The stability radius of medianpoint $v_1$ is $R(w) = min{epsilon v_2 , epsilon v_3 , epsilon v_4 } = 0.1/9$ since $epsilon v_2 = 0.34/9, epsilon v_3 = 0.76/9 , epsilon v_4 = 0.1/9$
// ]

// #slide(title: "The bottom of the slide")[
//     Now, look down!

//     There we have some general info for the audience about what talk they are
//     actually attending right now.

//     You can also see the slide number there.
]


#new-section-slide("Upgrading Stability Radius of median point")


#slide(title: "Formulations")[
Let $T = (V, E)$ be a tree network with vertex set $V = {v_1, ..., v_n}$ and edge set $E$.

Each vertex $v_i in V$ has a nonnegative weight $w_i$ and every edge length also has to be positive. 
// #pause
Let $v_1 in V$ be a median point associated with weight vector $w in RR^n_+$.

(Nhớ nói về tổng trọng số cây ban đầu phải = 1)

#pause

 Given a budget $B ≥ 0$, the goal is to modify the weights from $w$ to some $tilde(w) in RR^n_+$ within the budget $B$.
]

#slide[The problem model is stated as follows:

$
max quad & underline(R(tilde(w)))\

"s.t." quad & norm(tilde(w)-w)_1 <= B\

 & v_1 "is 1-median w.r.t" tilde(w)\

 & sum^n_(i=1) tilde(w)_i = 1\

 & norm(tilde(w)-w)_infinity <= epsilon_0
$
]



#let example(body) = block(
    width: 100%,
    inset: .5em,
    fill: aqua.lighten(80%),
    radius: .5em,
    text(size: .8em, body)
)
#let Rdown = $underline(R)$

#slide[
    $ max_(tilde(w)) Rdown(tilde(w)) = max_tilde(w) min_(u in N(v_1))1/n -2/n min_tilde(w) max_(u in N(v_1)) angle.l w, bb(1)_T_u angle.r $

    The problem (USR-10) can be rewritten as follows:

    
    $
    min quad & max_(u in N(v_1)) angle.l w + x, bb(1)_T_u angle.r\ 

    "s.t." quad & norm(x)_1 <= B\

    & sum^n_(i=1) x_i = 0\

    & x_i in [-epsilon_0; epsilon_0], forall i = 1,...,n
    $
    
]



#slide(title: "Parametric version")[

"Given some target objective value $t$, what is the minimum budget we should prepare to reach objective value bounded by $t$?”

Considering the following problem 
   
    $
    min quad & norm(x)_1\

    "s.t." quad & max_(u in N(v_1)) angle.l w + x, bb(1)_T_u angle.r <= t\

    & sum^n_(i=1) x_i = 0\

    & x_i in [-epsilon_0; epsilon_0], forall i = 1,...,n
    $
   
]

#slide[
We also denote by $x^*$ an optimal solution and by $t^*$ the optimal objective value of (USR-12). Next, let $hat(x)(t)$ be an optimal solution and $beta(t)$ be the optimal objective value of (DUSR-13) corresponding to parameter $t$.

*Lemma* 

$ beta(t) <= B <=> t ≥ t^* $

#pause

*Theorem* 
The optimal objective value $t^*$ of (USR-12) satisfies 

$ t^* = inf{t : beta(t) ≤ B } $ and $hat(x)(t^*)$ is an optimal solution of (USR-12).

]

#let zup = $overline(z)$

#slide[
*Theorem.* _There exists an optimal solution $hat(x)(t)$ of (DUSR-13) that assigns the
same value to $hat(x)(t)$ for all vertices $v_i$ within each subtree $T_u$, where $u in N (v_1)$_

Reducing the dimension of problem (DUSR-13) from $n$ to $k+1$ where $k$ is the
degree of median point $v_1$

Let $N(v_1) = {u_1, ...., u_k}, u_0 = v_1$ and $ T_u_0 = {v_1}$

Let $z_0 = x_1$ the modification associated with the median point $v_1$, $z_j = angle.l x, bb(1)_T_u_j angle.r$, $zup = epsilon_0|T_u_j|$, $gamma_j = angle.l w, bb(1)_T_u_j angle.r$ the total weight of subtree $T_u_j$ for $j = 1, ...,k$.

]

#slide[

$
    min quad & sum_(j=0)^k abs(z_j)\

    "s.t." quad & max_(j=1,...,k) (gamma_j + z_j) <= t\

    & sum^k_(j=1) z_j = 0\

    & z_j in [-zup_j; zup_j], forall j = 0,1,...,k
    $

]

#slide[

Since the
transformation (17-z) costs $O(n)$, the decision problems (DUSR-16) can be solved in $O(k log k)$. Therefore, the problem (DUSR-13) can be solved in $O(n+k log k)$.
]

#new-section-slide("Solving upgrading stability radius problem")


#slide[
We have the following diagram:



*Example*

  ]
    

// #slide(title: "References")[

// [1] Marianov, V., Eiselt, H.A.: Fifty years of location theory - a selective review.
// _European Journal of Operational Research_ *318*(3), 701–718 (2024)

// [2] Laporte, G., Nickel, S., Saldanha-da-Gama, F.: Introduction to Location Science,
// pp. 1–21. Springer, Cham (2019)

// [3] Espejo, I., Mar ́ın, A.: The p-median problem with upgrading of transportation
// costs and minimum travel time allocation. Computers & Operations Research
// 159, 106354 (2023)

// [4] Goldengorin, B., J ̈ager, G., Molitor, P.: Tolerances applied in combinatorial
// optimization. J. Comput. Sci 2(9), 716–734 (2006)

// [5] Erkut, E., Tansel, B.C.: On parametric medians of trees. Transportation science
// 26(2), 149–156 (1992)

// [6] Cooper, L.: Bounds on the weber problem solution under conditions of uncer-
// tainty. Journal of Regional Science 18(1) (1978)

// [7] Drezner, Z.: Sensitivity analysis of the optimal location of a facility. Naval
// Research Logistics Quarterly 32(2), 209–224 (1985)

// [8] Chakravarti, N., Wagelmans, A.P.: Calculation of stability radii for combinatorial
// optimization problems. Operations Research Letters 23(1-2), 1–7 (1998)

// [9] Burkard, R.E., Pleschiutschnig, C., Zhang, J.: The inverse 1-median problem on
// a cycle. Discrete Optimization 5(2), 242–253 (2008)
// 15


// ]


/*
