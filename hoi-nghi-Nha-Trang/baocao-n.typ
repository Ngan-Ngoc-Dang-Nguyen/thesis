#import "@preview/polylux:0.3.1": *
#import themes.clean: *

#show link: set text(blue)
#set text(font: "Inria Sans")
// #show heading: set text(font: "Vollkorn")
#show raw: set text(font: "JuliaMono")

#show: clean-theme.with(
    footer: [Cần Thơ, 12/2024],
    //short-title: [Polylux demo],
    //logo: image("../assets/logo.png"),
)

#set text(size: 25pt, font: "Times New Roman")

#import "@preview/cetz:0.1.2": canvas, plot
#import "@preview/cetz:0.2.2"
#import "@preview/cetz:0.1.2"

#title-slide(
    title: [#text(size: 32pt)[LUẬN VĂN TỐT NGHIỆP]

    Nâng cấp bán kính ổn định cho vị trí 1-median trên cây ],
    //subtitle: "An overview over all the features",
    authors:[
    Nguyễn Đặng Ngọc Ngân],
    date: "Tháng 12 năm 2024",
)

#slide[#text(size: 32pt)[#align(center)[*NỘI DUNG LUẬN VĂN*]]

#text(size: 30pt)[
*CHƯƠNG 1.* Kiến thức liên quan.

*CHƯƠNG 2.* Bán kính ổn định của điểm 1-median.]
]

#slide[#text(size: 32pt)[#align(center)[*CHƯƠNG 1*]]
1. Lý thuyết đồ thị.

2. Bài toán 1-median.

3. Inverse 1-median và các bài toán liên quan.


]

#slide[#text(size: 32pt)[#align(center)[*CHƯƠNG 2*]]
1. Một số ký hiệu liên quan.

2. Bán kính ổn định.

3. Nâng cấp cận dưới bán kính ổn định.

4. Giải thuật.

]

#slide[#text(size: 32pt)[#align(center)[*BÁN KÍNH ỔN ĐỊNH*]]

Đồ thị cây $T=(V,E)$ có $V={v_1, v_2,...,v_n}$ và tập cạnh $E$. 

$w_i$: trọng số đỉnh $v_i$, $w_i >= 0, i= 1,...n.$

$sum_(i=1)^n w_i =1$.



// #only(1)[
//   #align(center)[#canvas(length: 10%, {
//     import cetz.draw: *

//     let y = 2 
//     let x = 4
//     let y-space = 1
//     let h=1.4

//     circle((0*h,3), radius: 0.05,fill:black, name: "v1") 
//     content("v1.bottom", $v_1 (0.1)$, anchor: "left", padding: 0.2)

//     circle((-2*h, 2), radius: 0.05, fill: black, name: "v2") 
//     content("v2.bottom", $v_2 (0.13)$, anchor: "left", padding: 0.2)

//     circle((-3*h, 1), radius: 0.05,fill:black, name: "v5") 
//     content("v5.bottom", $v_5 (0.1)$, anchor: "left", padding: 0.2)

//     circle((-1*h, 1), radius: 0.05,fill:black, name: "v6") 
//     content("v6.bottom", $v_6 (0.1)$, anchor: "left", padding: 0.2)

//     circle((0*h, 2), radius: 0.05, fill: black, name: "v3") 
//     content("v3.bottom", $v_3 (0.06)$, anchor: "left", padding: 0.2)

//     circle((0*h, 1), radius: 0.05, fill: black, name: "v7") 
//     content("v7.bottom", $v_7 (0.06)$, anchor: "left", padding: 0.2)

//     circle((2*h, 2), radius: 0.05, fill: black, name: "v4") 
//     content("v4.bottom", $v_4 (0.15)$, anchor: "left", padding: 0.2)

//     circle((1*h, 1), radius: 0.05, fill: black, name: "v8") 
//     content("v8.bottom", $v_8 (0.2)$, anchor: "left", padding: 0.2)
//     circle((3*h, 1), radius: 0.05, fill:black, name: "v9") 
//     content("v9.bottom", $v_9 (0.1)$, anchor: "left", padding: 0.2)
    
//     line("v1", "v2")
//     line("v1", "v3")
//     line("v1", "v4")
//     line("v2", "v5")
//     line("v2", "v6")
//     line("v3", "v7")
//     line("v4", "v8")
//     line("v4", "v9")    }
//   )]]



//   #align(center)[#text(size: 22pt)[*Hình 1.* Đồ thị cây có trọng số]]
// 
]


#slide[

*Định nghĩa bán kính ổn định*

$ R(w) = sup{epsilon >= 0: v_1 in X^*_tilde(w), quad forall tilde(w) in [w-epsilon, w+ epsilon] sect RR_+^n}. $

*Định lý 1.*
$ R(w) >=  underline(R)(w) = min_(u in N(v_1)) 1/n  (1- 2 angle.l w, bb(1)_T_u angle.r) (1). $ _Furthermore, the equality in (1) holds if $underline(R)(w) < min_(i=1,...,n) w_i$_
]

#slide[*Nâng cấp bán kính ổn định điểm 1-median trên cây*

Đồ thị cây $T=(V,E)$ có $V={v_1, v_2,...,v_n}$ và tập cạnh $E$. 

$w_i$: trọng số đỉnh $v_i$, $w_i >= 0, i= 1,...n.$

$sum_(i=1)^n w_i =1$

$v_1$: là điểm 1-median ứng với $w$.

*Mục tiêu:* Chỉnh trọng số $w$ thành $tilde(w) in RR_+^n$ trong ngân sách $B>=0$.

]

#slide[

$
max quad & underline(R)(tilde(w)) quad quad quad quad quad quad quad #text(blue)[(USR-1)]\ 

"s.t." quad & norm(tilde(w)-w)_1 <= B\

 & v_1 "is 1-median w.r.t" tilde(w)\

 & sum^n_(i=1) tilde(w)_i = 1\

 & norm(tilde(w)-w)_infinity <= epsilon_0
$
]

#slide[Dựa vào định lý 1 và đặt $x_i = tilde(w)_i - w_i$, ta có:

  $
    min quad & max_(u in N(v_1)) angle.l w + x, bb(1)_T_u angle.r quad quad  #text(blue)[(USR-2)]\ 

    "s.t." quad & norm(x)_1 <= B\

    & sum^n_(i=1) x_i = 0\

    & x_i in [-epsilon_0; epsilon_0], forall i = 1,...,n
  $

]

#slide[
_Với một giá trị mục tiêu $t$ cho trước, ngân sách tối thiểu cần thiết để đạt được giá trị mục tiêu không vượt quá $t$ là bao nhiêu?_

_Phiên bản tham số của bài toán nâng cấp bán kính ổn định_

$
    min quad & norm(x)_1 quad quad quad quad quad quad #text(blue)[(PUSR-3)]\

    "s.t." quad & max_(u in N(v_1)) angle.l w + x, bb(1)_T_u angle.r <= t\

    & sum^n_(i=1) x_i = 0\

    & x_i in [-epsilon_0; epsilon_0], forall i = 1,...,n
$
]

#slide[Đặt #text(blue)[$x^*$] là #text(blue)[nghiệm tối ưu] và #text(blue)[$t^*$] là #text(blue)[giá trị tối ưu] của (USR-2).

Đặt #text(blue)[$hat(x)(t)$] là #text(blue)[giá trị tối ưu] và #text(blue)[$beta(t)$] là #text(blue)[giá trị tối ưu] của (PUSR-3) tương ứng với tham số #text(blue)[$t$].]

#slide[
*Bổ đề 1.*
$ beta(t) <= B <=> t ≥ t^* $

*Định lý 2.*
_Giá trị tối ưu $t^*$ của (USR-2) được tính_ 

$ t^* = inf{t : beta(t) ≤ B } $ và $hat(x)(t^*)$ nghiệm tối ưu của (USR-2).]

#slide[*Giảm chiều bài toán PUSR-3*

Đặt $N(v_1)={u_1,u_2,...,u_k}$, $u_0=v_1$ và $T_u_0={v_1}.$

Gọi $gamma_j= angle.l w, bb(1)_T_u_j angle.r $: tổng trọng số đỉnh của cây con lấy gốc tại $u_j, j=0,1...,k.$

$ z_j= angle.l x, bb(1)_T_u_j angle.r\

overline(z)_j = epsilon_0 abs(T_u_j)
 $

 $
    min quad & sum_(j=0)^k abs(z_j) quad quad quad quad #text(blue)[(PUSR-4)]\

    "s.t." quad & max_(j=1,...,k) (gamma_j + z_j) <= t\

    & sum^k_(j=1) z_j = 0\

    & z_j in [-overline(z)_j; overline(z)_j], forall j = 0,1,...,k
    $

The problem #text(blue)[$("PUSR-4")$] can be solved in $O(k log k)$.

The problem #text(blue)[$("PUSR-3")$] can be solved in $O(n+k log k)$
]

#new-section-slide("Giải thuật USR-1")
#slide[
Ta có sơ đồ sau:
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

    rect((0,0), (2.6, 0.5), name: "p1")
    rect((6,0), (6.5+2.5, 0.5), name: "p2")
    rect((0,h), (3, h+0.5), name: "p4")
    rect((6,h), (6.5+2.5, h+0.5), name: "p3")
    line("p1.right", "p2.left",  mark: (end: ">"), name: "l1")
    line("p2.bottom", "p3.top",  mark: (end: ">"), name: "l2")
    line("p3.left", "p4.right",  mark: (end: ">"), name: "l3")


    content("p1.center",  [#text(blue)[$("USR"-1) quad "&" quad w^*$]], anchor: none, padding: 0.3)
    content("p2.center",  [#text(blue)[$("USR"-2) quad "&" quad x^*$]], anchor: none, padding: 0.3)
    content("p3.center",  [#text(blue)[$("PUSR"-3) quad "&" quad hat(x)(t)$]], anchor: none, padding: 0.3)
    content("p4.center",  [#text(blue)[$("PUSR"-4) quad "&" quad hat(z)(t)$]], anchor: none, padding: 0.2)

    content("l1.bottom",  [*Bỏ ràng buộc 1-median*], anchor: "bottom", padding: 0.2)
    content("l1.top",  [*$x_i = tilde(w)_i - w_i$*], anchor: "top", padding: 0.2)
    content("l2.left",  [*Đổi mục tiêu và*
    
    * ràng buộc ngân sách*
    ], anchor: "left", padding: 0.2)
    // content("l2.right",  [*Theorem 3*], anchor: "right", padding: 0.2)
    // content("l3.bottom",  [*Theorem 4*], anchor: "bottom", padding: 0.2)
    content("l3.top",  [*Giảm chiều*], anchor: "top", padding: 0.2)
  })]


  ]

#new-section-slide("Thanks for your attention!")



