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

#let author = table(
      // width: 100%,
      columns: (1fr, 1fr),
      align: (left+top, left+top), 
      inset: 2em,
      // stroke: black,
      stroke: none,
      [_GV hướng dẫn_\ *PGS.TS. Nguyễn Trung Kiên*],
      [
      _Sinh viên thực hiện_\
      *Nguyễn Đặng Ngọc Ngân*\
      *MSSV: B2100137*\
      *Lớp: SP Toán học - K47*
      ]
    )

#title-slide(
    title: text(fill: blue)[#text(size: 32pt, fill: blue)[LUẬN VĂN TỐT NGHIỆP]

    Nâng cấp bán kính ổn định cho vị trí 1-median trên cây ],
    //subtitle: "An overview over all the features",
    authors: author,
    date: "Tháng 12 năm 2024",
)

#slide[
  #v(-2em)
  #set table(
    stroke: none,
    row-gutter: 0.5em,
    column-gutter: 0.2em,
    inset: 0.5em,
    align: (horizon+center, horizon)
  )
  #let chuong-1 = table.cell(rowspan: 3, fill: green.lighten(30%))[Chương 1]
  #let phan-11 = table.cell(fill: green.lighten(60%))[Lý thuyết đồ thị]
  #let phan-12 = table.cell(fill: green.lighten(60%))[Bài toán 1-median]
  #let phan-13 = table.cell(fill: green.lighten(60%))[Inverse 1-median và các bài toán liên quan]

  #let chuong-2 = table.cell(rowspan: 3, fill: aqua.lighten(30%), )[Chương 2]
  #let phan-21 = table.cell(fill: aqua.lighten(60%), )[Bán kính ổn định và cận dưới]
  #let phan-22 = table.cell(fill: aqua.lighten(60%), )[Bài toán nâng cấp cận dưới bán kính ổn định]
  #let phan-23 = table.cell(fill: aqua.lighten(60%), )[Giải thuật]


  #table(
    columns: (auto, 1fr),
    chuong-1, phan-11, phan-12, phan-13,
    chuong-2, phan-21, phan-22, phan-23,
  )

  // xxx
]


// #slide[#text(size: 32pt)[#align(center)[*NỘI DUNG LUẬN VĂN*]]

// #text(size: 30pt)[
// *CHƯƠNG 1.* Kiến thức liên quan.

// *CHƯƠNG 2.* Bán kính ổn định của điểm 1-median.]
// ]

// #slide[#text(size: 32pt)[#align(center)[*CHƯƠNG 1*]]
// 1. Lý thuyết đồ thị.

// 2. Bài toán 1-median.

// 3. Inverse 1-median và các bài toán liên quan.


// ]

// #slide[#text(size: 32pt)[#align(center)[*CHƯƠNG 2*]]
// 1. Một số ký hiệu liên quan.

// 2. Bán kính ổn định.

// 3. Nâng cấp cận dưới bán kính ổn định.

// 4. Giải thuật.

// ]


#slide[
  #let logistic-image = image(height: 100%, "../images/logistic.jpg")
  #let tree = canvas(length: 10%, {
    import cetz.draw: *

    let y = 2 
    let x = 4
    let y-space = 1
    let h=1.6
    let v = 1.5

    circle((0*h, 3*v), radius: 0.1,fill:black, name: "v1") 
    content("v1.bottom", $v_1 (0.1)$, anchor: "left", padding: 0.2)

    circle((-2*h, 2*v), radius: 0.1, fill: black, name: "v2") 
    content("v2.bottom", $v_2 (0.13)$, anchor: "left", padding: 0.2)

    circle((-3*h, 1*v), radius: 0.1,fill:black, name: "v5") 
    content("v5.bottom", $v_5 (0.1)$, anchor: "left", padding: 0.2)

    // circle((-1*h, 1), radius: 0.1,fill:black, name: "v6") 
    // content("v6.bottom", $v_6 (0.1)$, anchor: "left", padding: 0.2)

    circle((0*h, 2*v), radius: 0.1, fill: black, name: "v3") 
    content("v3.bottom", $v_3 (0.06)$, anchor: "left", padding: 0.2)

    circle((0*h, 1*v), radius: 0.1, fill: black, name: "v7") 
    content("v7.bottom", $v_7 (0.06)$, anchor: "left", padding: 0.2)

    circle((2*h, 2*v), radius: 0.1, fill: black, name: "v4") 
    content("v4.bottom", $v_4 (0.15)$, anchor: "left", padding: 0.2)

    // circle((1*h, 1), radius: 0.1, fill: black, name: "v8") 
    // content("v8.bottom", $v_8 (0.2)$, anchor: "left", padding: 0.2)
    circle((3*h, 1*v), radius: 0.1, fill:black, name: "v9") 
    content("v9.bottom", $v_9 (0.1)$, anchor: "left", padding: 0.2)
    
    line("v1", "v2")
    line("v1", "v3")
    line("v1", "v4")
    line("v2", "v5")
    // line("v2", "v6")
    line("v3", "v7")
    // line("v4", "v8")
    line("v4", "v9")    
  })
  #v(-3em)
  #text(size: 32pt)[#align(center)[*ĐIỂM 1-MEDIAN*]]
  #table(
    columns: (1fr, 1fr),
    // stroke: black,
    align: (center, center),
    stroke: none,
    logistic-image,
    [#tree\
    $ arg min_(v in T) quad sum_(i=1)^n w_i d(v, v_i)  $
    ]
  )
]

#slide[#text(size: 32pt)[#align(center)[*BÁN KÍNH ỔN ĐỊNH*]]

// Đồ thị cây $T=(V,E)$ có $V={v_1, v_2,...,v_n}$ và tập cạnh $E$. 

// $w_i$: trọng số đỉnh $v_i$, $w_i >= 0, i= 1,...n.$

// $sum_(i=1)^n w_i =1$.





//   #align(center)[#text(size: 22pt)[*Hình 1.* Đồ thị cây có trọng số]]
// 
*Định nghĩa:*

$ R(w) = sup{epsilon >= 0: v_1 in X^*_tilde(w), quad forall tilde(w) in [w-epsilon, w+ epsilon] sect RR_+^n}. $

]


// #slide[#text(size: 32pt)[#align(center)[*BÁN KÍNH ỔN ĐỊNH*]]

// // *Định nghĩa bán kính ổn định*

// // $ R(w) = sup{epsilon >= 0: v_1 in X^*_tilde(w), quad forall tilde(w) in [w-epsilon, w+ epsilon] sect RR_+^n}. $
// ]

#slide[
    
    #text(size: 32pt)[#align(center)[*CẬN DƯỚI BÁN KÍNH ỔN ĐỊNH*]]
*Định lý 1.*
$ R(w) >=  underline(R)(w) = min_(u in N(v_1)) 1/n  (1- 2 angle.l w, bb(1)_T_u angle.r). $ _Dấu "=" xảy ra nếu  $underline(R)(w) < min_(i=1,...,n) w_i$_
]

#slide[
    
    #v(-1em)
    #text(size: 32pt)[#align(center)[*NÂNG CẤP BÁN KÍNH ỔN ĐỊNH*]]

    // #set table.hline(stroke: .7pt)

// #table(
//   stroke: none,
//   columns: (auto, 5fr),
//   [*Nâng cấp cận dưới*], [$ quad quad quad quad quad max quad underline(R)(tilde(w)) quad$ #text(blue)[(USR-1)]],
//   [],[],
//   [],[],
//   [],[],
//   [Điều chỉnh trong ngân sách $B$],  [$ quad quad quad quad quad quad "s.t"  norm(tilde(w)-w)_1 <= B$],
//   [],[],
//   [],[],
//   [],[],

//   [$v_1$ vẫn là 1-median của $tilde(w)$],  [$ quad quad quad quad quad quad  quad v_1$ vẫn là 1-median của $tilde(w)$],
//   [],[],
//   [],[],

//   [Tổng trọng số không đổi],  [$ quad quad quad quad quad quad quad sum_(i=1)^n tilde(w)_i =1$],
//   [],[],
//   [],[],

//   [Điều chỉnh không quá lớn],  [$ quad quad quad quad quad quad quad norm(tilde(w)-w)_infinity <= epsilon_0$],
// )
    #let bai-toan = [
        
        *Nâng cấp cận dưới*

        Điều chỉnh trong ngân sách $B$

        $v_1$ vẫn là 1-median của $tilde(w)$
        #v(1em)

        Tổng trọng số không đổi

        Điều chỉnh không quá lớn


    ]

    #let problem = $ 
     max quad & underline(R)(tilde(w)) quad quad quad quad #text(blue)[(USR-1)]\
     "s.t"  quad &  norm(tilde(w)-w)_1 <= B\
            & v_1 "vẫn là 1-median của" tilde(w)\
            & sum_(i=1)^n tilde(w)_i =1\
            & norm(tilde(w)-w)_infinity <= epsilon_0
    $
// #v(-1em)
#table(
  stroke: none,
  columns: (5fr, 5fr),
  align: (top, top),
  bai-toan,
  problem
)


// Đồ thị cây $T=(V,E)$ có $V={v_1, v_2,...,v_n}$ và tập cạnh $E$. 

// $w_i$: trọng số đỉnh $v_i$, $w_i >= 0, i= 1,...n.$

// $sum_(i=1)^n w_i =1$

// $v_1$: là điểm 1-median ứng với $w$.

// *Mục tiêu:* Chỉnh trọng số $w$ thành $tilde(w) in RR_+^n$ trong ngân sách $B>=0$.

]

// #slide[

// $
// max quad & underline(R)(tilde(w)) quad quad quad quad quad quad quad #text(blue)[(USR-1)]\ 

// "s.t." quad & norm(tilde(w)-w)_1 <= B\

//  & v_1 "is 1-median w.r.t" tilde(w)\

//  & sum^n_(i=1) tilde(w)_i = 1\

//  & norm(tilde(w)-w)_infinity <= epsilon_0
// $
// ]

#slide[Đặt $x_i = tilde(w)_i - w_i$, ta có:

  $
    min quad & max_(u in N(v_1)) angle.l w + x, bb(1)_T_u angle.r quad quad  #text(blue)[(USR-2)]\ 

    "s.t." quad & norm(x)_1 <= B\

    & sum^n_(i=1) x_i = 0\

    & x_i in [-epsilon_0; epsilon_0], forall i = 1,...,n
  $

]

// #slide[
// _Với một giá trị mục tiêu $t$ cho trước, ngân sách tối thiểu cần thiết để đạt được giá trị mục tiêu không vượt quá $t$ là bao nhiêu?_

// _Phiên bản tham số của bài toán nâng cấp bán kính ổn định_

// $
//     min quad & norm(x)_1 quad quad quad quad quad quad #text(blue)[(PUSR-3)]\

//     "s.t." quad & max_(u in N(v_1)) angle.l w + x, bb(1)_T_u angle.r <= t\

//     & sum^n_(i=1) x_i = 0\

//     & x_i in [-epsilon_0; epsilon_0], forall i = 1,...,n
// $
// ]

#slide[
    #let obj = text(fill: red)[$max_(u in N(v_1)) angle.l w + x, bb(1)_T_u angle.r$]
    #let budget = text(fill: eastern)[$norm(x)_1$]

  #table(
    columns: 2,
    stroke: none,
    inset: 1em,
    gutter: 1em,
  $
    min quad & #obj quad quad  #text(blue)[(USR-2)]\ 

    "s.t." quad & budget <= B\

    & sum^n_(i=1) x_i = 0\

    & x_i in [-epsilon_0; epsilon_0], forall i = 1,...,n
  $,
  $
      min quad & budget quad quad quad quad quad quad #text(blue)[(PUSR-3)]\

      "s.t." quad & #obj <= t\

      & sum^n_(i=1) x_i = 0\

      & x_i in [-epsilon_0; epsilon_0], forall i = 1,...,n
  $

  )

]


// #slide[Đặt #text(blue)[$x^*$] là #text(blue)[nghiệm tối ưu] và #text(blue)[$t^*$] là #text(blue)[giá trị tối ưu] của (USR-2).

// Đặt #text(blue)[$hat(x)(t)$] là #text(blue)[giá trị tối ưu] và #text(blue)[$beta(t)$] là #text(blue)[giá trị tối ưu] của (PUSR-3) tương ứng với tham số #text(blue)[$t$].]

#slide[
// *Bổ đề 1.*
// $ beta(t) <= B <=> t ≥ t^* $

Đặt #text(blue)[$x^*$] là #text(blue)[nghiệm tối ưu] và #text(blue)[$t^*$] là #text(blue)[giá trị tối ưu] của (USR-2).

Đặt #text(blue)[$hat(x)(t)$] là #text(blue)[nghiệm tối ưu] và #text(blue)[$beta(t)$] là #text(blue)[ngân sách tối thiểu] của (PUSR-3) tương ứng với tham số #text(blue)[$t$].

*Định lý 2.*
_Giá trị tối ưu $t^*$ của (USR-2) được tính_ 

$ t^* = inf{t : beta(t) ≤ B } $ _và $hat(x)(t^*)$ nghiệm tối ưu của (USR-2)_.
// Đặt $N(v_1)={u_1,u_2,...,u_k}$, $u_0=v_1$ và $T_u_0={v_1}.$

// Gọi $gamma_j= angle.l w, bb(1)_T_u_j angle.r $: tổng trọng số đỉnh của cây con lấy gốc tại $u_j, j=0,1...,k.$
]

#slide[
  #v(-3em)
$
  z_j= angle.l x, bb(1)_T_u_j angle.r,
  overline(z)_j = epsilon_0 abs(T_u_j)
$
*Giảm chiều bài toán PUSR-3*
#v(-0.5em)
$
    min quad & sum_(j=0)^k abs(z_j) quad quad quad quad #text(blue)[(PUSR-4)]\

    "s.t." quad & max_(j=1,...,k) (gamma_j + z_j) <= t\

    & sum^k_(j=1) z_j = 0\

    & z_j in [-overline(z)_j; overline(z)_j], forall j = 0,1,...,k
$


// The problem #text(blue)[$("PUSR-4")$] can be solved in $O(k log k)$.

// The problem #text(blue)[$("PUSR-3")$] can be solved in $O(n+k log k)$
]

#new-section-slide("GIẢI THUẬT")
// #slide[
// Ta có sơ đồ sau:
// #align(center)[
//   #import "@preview/cetz:0.1.2"
//   #import "@preview/cetz:0.1.2": canvas, plot
// // #import "@preview/cetz:0.2.2"
// //   #import "@preview/cetz:0.1.2
//   #canvas(length: 10%, {
//     import cetz.draw: *
//     let (y1, y2, y3, y4) = (3,2,1, 4) 
//     let (x1, x2, x3, x4) = (1, 3, 5, 7) 
//     let x0 = 0
//     let r = 0.5
//     let h =-2

//     rect((0,0), (2.6, 0.5), name: "p1",)
//     rect((6,0), (6.5+2.5, 0.5), name: "p2")
//     rect((0,h), (3, h+0.5), name: "p4")
//     rect((6,h), (6.5+2.5, h+0.5), name: "p3")
//     line("p1.right", "p2.left",  mark: (end: ">"), name: "l1")
//     line("p2.bottom", "p3.top",  mark: (end: ">"), name: "l2")
//     line("p3.left", "p4.right",  mark: (end: ">"), name: "l3")


//     content("p1.center",  text(blue)[$("USR"-1) quad "&" quad w^*$], anchor: none, padding: 0.3)
//     content("p2.center",  text(blue)[$("USR"-2) quad "&" quad x^*$], anchor: none, padding: 0.3)
//     content("p3.center",  [#text(blue)[$("PUSR"-3) quad "&" quad hat(x)(t)$]], anchor: none, padding: 0.3)
//     content("p4.center",  [#text(blue)[$("PUSR"-4) quad "&" quad hat(z)(t)$]], anchor: none, padding: 0.2)

//     content("l1.bottom",  [*Bỏ ràng buộc 1-median*], anchor: "bottom", padding: 0.2)
//     // content("l1.top",  [*$x_i = tilde(w)_i - w_i$*], anchor: "top", padding: 0.2)
//     content("l2.left",  [*Hoán đổi mục tiêu &*
    
//     * ràng buộc ngân sách*
//     ], anchor: "right", padding: 0.2)
//     // content("l2.right",  [*Theorem 3*], anchor: "right", padding: 0.2)
//     // content("l3.bottom",  [*Theorem 4*], anchor: "bottom", padding: 0.2)
//     content("l3.top",  [*Giảm chiều*], anchor: "top", padding: 0.2)
//   })]


//   ]

  #slide[
// Ta có sơ đồ sau:
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
    let d = 7
    let h = 3
    let str = gray
    let str = none
    let str2= black

    // rect((0,0), (2.6, 0.5), name: "p1", stroke: gray)
    // rect((6,0), (6.5+2.5, 0.5), name: "p2")
    // rect((0,h), (3, h+0.5), name: "p4")
    // rect((6,h), (6.5+2.5, h+0.5), name: "p3")



    content((0, 0),  box(inset: 0.5em, stroke: str2)[#text(blue)[$("USR"-1) quad "&" quad w^*$]], anchor: none, padding: 0.3, name: "p1")
    content((d, 0),  box(inset: 0.5em, stroke: str2)[#text(blue)[$("USR"-2) quad "&" quad x^*$]], anchor: none, padding: 0.3, name: "p2")
    content((d, -h),  box(inset: 0.5em, stroke: str2)[#text(blue)[$("PUSR"-3) quad "&" quad hat(x)(t)$]], anchor: none, padding: 0.3, name : "p3")
    content((0, -h),  box(inset: 0.5em, stroke: str2)[#text(blue)[$("PUSR"-4) quad "&" quad hat(z)(t)$]], anchor: none, padding: 0.2, name: "p4")

    line("p1.right", "p2.left",  mark: (end: ">"), name: "l1", padding: 0.5em)
    line("p2.bottom", "p3.top",  mark: (end: ">"), name: "l2")
    line("p3.left", "p4.right",  mark: (end: ">"), name: "l3")

    content("l1.bottom",  [*Bỏ ràng buộc 1-median*], anchor: "bottom", padding: 0.2)
    // content("l1.top",  [*$x_i = tilde(w)_i - w_i$*], anchor: "top", padding: 0.2)
    content("l2.left",  [*Hoán đổi mục tiêu &*
    
    * ràng buộc ngân sách*
    ], anchor: "right", padding: 0.2)
    // content("l2.right",  [*Theorem 3*], anchor: "right", padding: 0.2)
    // content("l3.bottom",  [*Theorem 4*], anchor: "bottom", padding: 0.2)
    content("l3.top",  [*Giảm chiều*], anchor: "top", padding: 0.2)
  })]


  ]

#slide[
    
    #align(center)[
        *KẾT QUẢ NGHIÊN CỨU*]

    #v(2em)
    - Thu được công thức tường minh cho cận dưới bán kính ổn định điểm 1-median trên cây
    - Đề xuất giải thuật tổ hợp hiệu quả cho bài toán nâng cấp cận dưới bán kính ổn định 
    - Công bố kết quả tại một tạp chí Q3 Scopus đang trong quá trình phản biện

]

#new-section-slide("Thanks for your attention!")



