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

#slide[
    Let $T = (V, E)$ be a tree network with vertex set $V = {v_1, ..., v_n}$ and edge set $E$.
Each vertex $v_i ∈ V$ has a nonnegative weight $w_i$ and $sum_(i=1) ^n w_i =1 $. Every edge length also has to be positive. 



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

  #align(center)[*Figure 1.* A weight tree]

    // This presentation is supposed to briefly showcase what you can do with this
    // package.

    // For a full documentation, read the
    // #link("https://polylux.dev/book/")[online book].
]

#slide(title: "1-median on tree")[

Let $d(x, v_i)$ be the length of the shortest path between $x$ and $v_i$. A vertex $x^*$
is called a 1-median of $T$, if
$ f(x^*) ≤ f(x) quad forall x in V $
where $f(x)= sum_(i=1) ^n w_i d(x,v_i)$


*Theorem 1.* _ A point $x^*$ is a median on tree $T$ w.r.t weight vector if and only if_
$ angle.l w, bb(1)_T_u angle.r <= W/2, forall u in N(x^*) $


//Có thể tìm kiếm điểm 1-median bằng thuật toán nuốt lá của Goldman.
]

#slide[*Example 1.* 

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

  #align(center)[*Figure 1.* A weight tree]

 In this case, $v_1$ is 1-median point.

]



    // We used the `title` argument of the `#slide` function for that:
    // ```typ
    // #slide(title: "First slide")[
    //     ...
    // ]
    // ```
    // (This works because we utilise the `clean` theme; more on that later.)


#slide(title: "Stability Radius")[
Definition of the stability radius of $v_1$ w.r.t weight vector $w$:

$ R(w) = sup{epsilon >= 0: v_1 in X^*_tilde(w), quad forall tilde(w) in [w-epsilon, w+ epsilon] sect RR_+^n} $

*Theorem 2.* _We have_

 $ R(w) >=  underline(R)(w) = min_(u in N(v_1)) 1/n  (1- 2 angle.l w, bb(1)_T_u angle.r) (1). $ _Furthermore, the equality in (1) holds if $underline(R)(w) < min_(i=1,...,n) w_i$_
]

#slide[
*Example 2.* 


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

  #align(center)[*Figure 1.* A weight tree]

$underline(R)(w) = min{epsilon_v_2 , epsilon_v_3 , epsilon_v_4 } = 0.1/9$ since $epsilon_v_2 = 0.34/9, epsilon_v_3 = 0.76/9, epsilon_v_4 = 0.1/9$
]

#new-section-slide("Upgrading Stability Radius of median point")


#slide(title: "Formulations")[
Let #text(blue)[$T = (V, E)$] be a tree network with vertex set #text(blue)[$V = {v_1, ..., v_n}$] and edge set #text(blue)[$E$].

Each vertex #text(blue)[$v_i in V$] has a nonnegative weight #text(blue)[$w_i$] 

Every edge length also has to be positive. 
// #pause
Let #text(blue)[$v_1 in V$] be #text(blue)[1-median point] associated with weight vector $w in RR^n_+$.

The total mass of $w$ is unchanged and normalized by the unit mass constraint #text(blue)[$ sum_(i=1)^n w_i =1 $]

#pause

 Given #text(blue)[a budget $B ≥ 0$], the goal is to modify the weights from $w$ to some $tilde(w) in RR^n_+$ within the budget $B$.
]

#slide[The problem model is stated as follows:

$
max quad & underline(R)(tilde(w)) quad quad quad quad quad quad quad #text(blue)[(USR-1)]\ 

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

    Let $x_i:= tilde(w)_i - w_i quad forall i= 1,...,n$

    The problem $#text(blue)[(USR-1)]$ can be rewritten as follows:

    
    $
    min quad & max_(u in N(v_1)) angle.l w + x, bb(1)_T_u angle.r quad quad  #text(blue)[(USR-2)]\ 

    "s.t." quad & norm(x)_1 <= B\

    & sum^n_(i=1) x_i = 0\

    & x_i in [-epsilon_0; epsilon_0], forall i = 1,...,n
    $
    
]



#slide(title: "Parametric version")[

#text(blue)[*"Given some target objective value $t$, what is the minimum budget we should prepare to reach objective value bounded by $t$?”*]

Considering the following problem:
   
    $
    min quad & norm(x)_1 quad quad quad quad quad quad #text(blue)[(PUSR-3)]\

    "s.t." quad & max_(u in N(v_1)) angle.l w + x, bb(1)_T_u angle.r <= t\

    & sum^n_(i=1) x_i = 0\

    & x_i in [-epsilon_0; epsilon_0], forall i = 1,...,n
    $
   
]

#slide[
Let #text(blue)[$x^*$] an #text(blue)[optimal solution] and #text(blue)[$t^*$] the #text(blue)[optimal objective value] of (USR-2).

Let #text(blue)[$hat(x)(t)$] be #text(blue)[an optimal solution] and #text(blue)[$beta(t)$] be #text(blue)[the optimal objective value] of (PUSR-3) corresponding to parameter #text(blue)[$t$].

*Lemma 1.* 

$ beta(t) <= B <=> t ≥ t^* $

#pause

*Theorem 3.* 
_The optimal objective value $t^*$ of (USR-2) satisfies_ 

$ t^* = inf{t : beta(t) ≤ B } $ and $hat(x)(t^*)$ is an optimal solution of (USR-2).

]

#let zup = $overline(z)$

#slide[
*Theorem 4.* _There exists an optimal solution $hat(x)(t)$ of (DUSR-3) that assigns the
same value to $hat(x)(t)$ for all vertices $v_i$ within each subtree $T_u$, where $u in N (v_1)$._

#text(blue)[Reducing the dimension] of problem (DUSR-3) from #text(blue)[$n$] to #text(blue)[$k+1$] where $k$ is the
degree of median point $v_1$

#pause

Let #text(blue)[$N(v_1) = {u_1, ...., u_k}, u_0 = v_1$] and #text(blue)[$ T_u_0 = {v_1}$]

Let #text(blue)[$z_0 = x_1$] the modification associated with the median point $v_1$, #text(blue)[$z_j = angle.l x, bb(1)_T_u_j angle.r$, $zup_j = epsilon_0|T_u_j|$, $gamma_j = angle.l w, bb(1)_T_u_j angle.r$] the total weight of subtree $T_u_j$ for $j = 1, ...,k$.

]

#slide[

$
    min quad & sum_(j=0)^k abs(z_j) quad quad quad quad #text(blue)[(PUSR-4)]\

    "s.t." quad & max_(j=1,...,k) (gamma_j + z_j) <= t\

    & sum^k_(j=1) z_j = 0\

    & z_j in [-zup_j; zup_j], forall j = 0,1,...,k
    $


The problem #text(blue)[$("PUSR-4")$] can be solved in $O(k log k)$.

The problem #text(blue)[$("PUSR-3")$] can be solved in $O(n+k log k)$
]

#new-section-slide("Solving upgrading stability radius problem")


#slide[
We have the following diagram:
#align(center)[
  #import "@preview/cetz:0.1.2"
  #import "@preview/cetz:0.1.2": canvas, plot
// #import "@preview/cetz:0.2.2"
//   #import "@preview/cetz:0.1.2
  #canvas(length: 10%, {
    import cetz.draw: *
    let (y1, y2, y3, y4) = (3,2,1, 4) 
    let (x1, x2, x3, x4) = (1, 3, 5, 7) 
    let x0 = 0
    let r = 0.5
    let h =-2

    rect((0,0), (2.2, 0.5), name: "p1")
    rect((6,0), (6.5+2, 0.5), name: "p2")
    rect((0,h), (2.5, h+0.5), name: "p4")
    rect((6,h), (6.5+2, h+0.5), name: "p3")
    line("p1.right", "p2.left",  mark: (end: ">"), name: "l1")
    line("p2.bottom", "p3.top",  mark: (end: ">"), name: "l2")
    line("p3.left", "p4.right",  mark: (end: ">"), name: "l3")


    content("p1.center",  [#text(blue)[$("USR"-1) quad "&" quad w^*$]], anchor: none, padding: 0.3)
    content("p2.center",  [#text(blue)[$("USR"-2) quad "&" quad x^*$]], anchor: none, padding: 0.3)
    content("p3.center",  [#text(blue)[$("PUSR"-3) quad "&" quad hat(x)(t)$]], anchor: none, padding: 0.3)
    content("p4.center",  [#text(blue)[$("PUSR"-4) quad "&" quad hat(z)(t)$]], anchor: none, padding: 0.2)

    content("l1.bottom",  [*Remove median constraint*], anchor: "bottom", padding: 0.2)
    content("l1.top",  [*$x^* = w^* - w$*], anchor: "top", padding: 0.2)
    content("l2.left",  [*Swap objective and*

*budget constraint*], anchor: "left", padding: 0.2)
    content("l2.right",  [*Theorem 3*], anchor: "right", padding: 0.2)
    content("l3.bottom",  [*Theorem 4*], anchor: "bottom", padding: 0.2)
    content("l3.top",  [*Reduce dimension*], anchor: "top", padding: 0.2)
  })]


  ]

#new-section-slide("Thank you for your attention!")

    