
// _Chương này sẽ nghiên cứu về một đối tượng ...._

#include "../tools/multi-section-ref.typ"
#import "../tools/macros.typ": eqref, myref, figref, defeq, remark-Le, delete-Le, add-Le, remark-Ngan, delete-Ngan, add-Ngan, theorem, definition, proposition, lemma, proof, example, hypothesis 
#import "@preview/equate:0.2.1": equate
#show: equate.with(breakable: true, sub-numbering: true)
#set math.equation(numbering: "(1.1)", supplement: none)
// #import "../tools/macros.typ": eqref, remark-Le, delete-Le, add-Le, remark-Ngan, delete-Ngan, add-Ngan
// #import "../typst-orange.typ": theorem, proof, lemma, thmref, proposition, corollary, example, definition, 
#import "@preview/cetz:0.1.2": canvas, plot
#import "@preview/cetz:0.1.2"
#include "../tools/multi-section-ref.typ"
// #import "../tools/macros.typ": eqref
// #import "../typst-orange.typ": theorem, proof, lemma, proposition, corollary, example
// #include "../tools/multi-section-ref.typ"
// #import "../tools/macros.typ": eqref
// #import "../typst-orange.typ": theorem, proof
= BÁN KÍNH ỔN ĐỊNH CỦA ĐIỂM 1-MEDIAN
// == Tổng quan bán kính ổn định 

// #delete-Le[_Bán kính ổn định_ của một đối tượng trong lý thuyết đồ thị là một khái niệm phản ánh mức độ mà một đồ thị (hoặc một thành phần của nó) có thể duy trì các thuộc tính quan trọng khi bị tác động bởi những thay đổi nhỏ, chẳng hạn như việc loại bỏ các đỉnh hoặc cạnh. Nó đo lường khả năng "chịu đựng" của đồ thị trước các yếu tố gây rối loạn hoặc phá hủy, đồng thời xác định phạm vi ảnh hưởng của sự thay đổi đối với cấu trúc của đồ thị.

// Trong các ngữ cảnh khác nhau, khái niệm này có thể có các ý nghĩa cụ thể, chẳng hạn:

// Trong bài toán định vị trung tâm (facility location): Khi nghiên cứu bài toán 1-median hoặc các bài toán liên quan trong lý thuyết đồ thị, bán kính ổn định có thể được hiểu là mức độ thay đổi của vị trí trung tâm (ví dụ, vị trí của một "median" hoặc "center") khi có sự điều chỉnh về trọng số của các đỉnh hoặc cạnh trong đồ thị. Một bán kính ổn định lớn cho thấy trung tâm của đồ thị ít bị ảnh hưởng khi có sự điều chỉnh hoặc thay đổi nhỏ trong hệ thống.

// Trong mạng phân tán hoặc hệ thống máy tính: Bán kính ổn định của một mạng lưới có thể đề cập đến khả năng chịu lỗi, tức là số lượng nút hoặc liên kết bị mất trước khi hệ thống không còn duy trì được các chức năng quan trọng (ví dụ, việc đảm bảo tất cả các thành phần có thể giao tiếp với nhau).

// Trong phạm vi luận văn này, chúng ta sẽ nghiên cứu về bán kính ổn định của điểm 1-median trên đồ thị cây.] 

#add-Le[_Bán kính ổn định_ là một khái niệm đo lường khả năng của hệ thống trong việc duy trì trạng thái "ổn định" khi chịu ảnh hưởng từ các yếu tố nhiễu động môi trường. Tùy thuộc vào ngữ cảnh, khái niệm này có thể mang các ý nghĩa khác nhau. Trong phạm vi của luận văn này, chúng ta tập trung nghiên cứu bán kính ổn định của điểm 1-median trên đồ thị cây.

Trong lĩnh vực logistics, các kho hàng thường được đặt tại các vị trí trung tâm, đặc trưng bởi hàm median (trung vị) trên một mạng lưới giao thông. Trong đó, mỗi nút giao thông được gán trọng số dựa trên nhu cầu tương ứng. Tuy nhiên, các trọng số này thường xuyên thay đổi theo mùa, làm ảnh hưởng đến tính tối ưu của vị trí kho hàng. Bán kính ổn định cung cấp một cách đo lường mức độ ổn định của vị trí kho hàng trước sự biến động nhu cầu.

Trong chương này, chúng ta sẽ nghiên cứu chi tiết về bán kính ổn định của điểm 1-median trên đồ thị cây. Chúng tôi nhận thấy rằng, mặc dù việc tính toán chính xác giá trị bán kính ổn định có thể phức tạp, vẫn có thể xác định một cận dưới đơn giản và chặt chẽ. Ngoài ra, chúng tôi còn xem xét bài toán nâng cấp cận dưới của bán kính ổn định bằng cách tham số hóa bài toán và đề xuất một thuật toán tổ hợp hiệu quả để giải quyết bài toán này.

]

== Một số ký hiệu liên quan 

Trước khi đi vào nội dung chính, chúng ta sẽ giới thiệu một số ký hiệu quan trọng được sử dụng xuyên suốt trong chương này. Các ký hiệu này sẽ giúp việc trình bày và phân tích trở nên rõ ràng và nhất quán hơn.

// #remark-Le[Thêm ký hiệu đồ thị cây, cây con gốc tại u là gì?]

1. Ta định nghĩa _tích Hadamard_ giữa hai vector $u= vec(u_1,u_2,u_3), v= vec(v_1, v_2, v_3)$ bằng cách nhân từng thành phần tương ứng của hai vectơ, ký hiệu như sau: 

$ u dot.circle v = vec(u_1,u_2,u_3) dot.circle vec(v_1, v_2, v_3) = vec(u_1 times v_1, u_2 times v_2, u_3 times v_3) $

// Ký hiệu $dot.circle$ được gọi là _tích Hadamard_ và phép toán này

//  #remark-Le[Phép nhân Hadamard k phải cộng. Em cho ví dụ lộn rồi.]

*Ví dụ* Cho $u = vec(1,2,3), v= vec(4,5,6)$. Khi đó
$ u dot.circle v = vec(1,2,3) dot.circle vec(4,5,6) = vec(1 times 4,2 times 5,3 times 6)= vec(4,10,18) $

2. Gọi $ bb(1)_T_u = vec(v_1,v_2, dots.v,v_n) $
Trong đó 
$ v_i = cases(1 "nếu" v_i in T_u, 0 "nếu" v_i in.not T_u ) $
Nghĩa là, vecto $bb(1)_T_u$ có $n$ thành phần, với thành phần thứ $i$ bằng 1 nếu đỉnh $v_i$ thuộc cây $T_u$ và bằng 0 nếu không thuộc.

3. Tổng trọng số của cây con lấy gốc tại $u$ ứng với bộ trọng số $w$ được xác định bởi tích vô hướng $ angle.l w, bb(1)_T_u angle.r $ là 

4. Giả sử một vecto $x = (x_1,x_2,...,x_n)$, chuẩn vô cùng của vecto $x$ được định nghĩa là:

$ norm(.)_infinity = max_(1<= i <= n) abs(x_i) $

*Ví dụ* Giả sử $x=(1,-3,2)$, khi đó:
$ norm(x)_infinity = max (abs(1), abs(-3),abs(2)) = 3 $

5. Giả sử một vecto $x = (x_1,x_2,...,x_n)$, chuẩn một của vecto $x$ được định nghĩa là:

$ norm(.)_1 = sum_(i=1)^n abs(x_i) $

Nói cách khác, chuẩn 1 tính tổng các giá trị tuyệt đối của các phần tử trong vecto.

*Ví dụ* Giả sử $x=(1,-3,2)$, khi đó:
$ norm(x)_1 =  abs(1) + abs(-3) + abs(2) = 1 + 3 + 2= 6. $

// #remark-Le[Giải thích thêm ký hiệu $[w - epsilon, w+ epsilon]$]

== Bán kính ổn định
=== Định nghĩa 

Trước tiên ta nhắc lại điều kiện tối ưu của điểm 1-median.
Đỉnh $v_1$ là điểm 1-median ứng với bộ trọng số $w$ nếu thỏa điều kiện tối ưu như sau:
$ angle.l w, bb(1)_T_u angle.r <= W/2, quad quad forall u in N(v_1), $ <eq:dktu>
trong đó $W = angle.l w, bb(1)_T angle.r$ là tổng trọng số của cây ứng với $w$ và $N(v_1)$ là tập các đỉnh liền kề với $v_1$. Chú ý rằng, theo @cor-opt-cond, bất đẳng thức #myref[@eq:dktu] tương đương
$
angle.l w, bb(1)_T_u angle.r <= angle.l w, bb(1)_(T without T_u) angle.r, quad quad forall u in N(v_1).
$

Trong chương này ta giả sử tổng trọng số của $w$ có độ lớn không đổi //và $v_1$ là điểm 1-median ứng với $w$. 
#hypothesis[Giả sử $w in RR_+^n$ là một vecto trọng số thỏa 
$ W = angle.l w, bb(1)_T angle.r = 1. $ <eq:dk>
// và $v_1$ là điểm 1-median ứng với $w$.
]

// #remark-Le[Việc giải sử này là hợp lý do?]

Khi đó, #eqref(<eq:dktu>) có thể được viết lại:

$ angle.l w, bb(1)_T_u angle.r <= 1/2, quad quad forall u in N(v_1). $

// Trong chương này ta giả sử


Trong thực tế, vector trọng số $w$ có thể bị nhiễu, dẫn đến việc nó bị thay đổi thành một vector $ tilde(w) in RR_+^n$. Chẳng hạn, trong một thành phố, trọng số tại mỗi điểm dân cư có thể thay đổi do các yếu tố như biến động dân số, điều kiện giao thông, hoặc sự phát triển của cơ sở hạ tầng. Một ví dụ khác có thể thấy trong hệ thống chuỗi cửa hàng, nơi trọng số về khối lượng hàng hóa tại mỗi cửa hàng có thể dao động do ảnh hưởng của thời tiết, tính chất mùa vụ, hoặc tình hình kinh tế.

Ta giả sử rằng sự sai khác giữ $w$ và $tilde(w)$ là nhỏ, cụ thể được mô tả bởi bất đẳng thức:
$ norm(tilde(w)-w)_infinity <= epsilon $ điều này tương đương $tilde(w) in [w-epsilon; w+ epsilon] $ với một mức nhiễu nhỏ $epsilon>0$. Điều này có nghĩa là mỗi thành phần trọng số của $tilde(w)$ có thể biến động xung quanh giá trị tương ứng của nó trong $w$.

Trong bối cảnh tồn tại sự nhiễu này, mục tiêu của chúng ta là xem xét sự ổn định của điểm 1-median $v_1$. Nói cách khác, chúng ta muốn biết mức độ nhiễu lớn nhất có thể, ký hiệu là $epsilon$, sao cho $v_1$ vẫn là điểm 1-median tối ưu đối với vector trọng số bị nhiễu $tilde(w)$. Ta gọi giá trị $epsilon$ lớn nhất này là _bán kính ổn định_ của điểm median $v_1$.

#definition[Bán kính ổn định][Bán kính ổn định của điểm median $v_1$ ứng với trọng số $w$ được ký hiệu bởi $R(w)$ xác định như sau:
$ R(w) defeq sup{epsilon>= 0: v_1 in X_tilde(w)^*, quad forall tilde(w)in [w-epsilon;w+epsilon] sect RR_+^n} $
] <def-stability-radius>
Trong đó ta ký hiệu $X_tilde(w)^*$ là tập hợp các điểm 1-median tương ứng với vector trọng số bị nhiễu $tilde(w)$



// Mặc dù $R(w)$ được định nghĩa một cách ngầm định, nó có một cận dưới đơn giản nhưng chặt chẽ.



===  Chặn dưới của bán kính ổn định 



Mặc dù $R(w)$ được định nghĩa một cách không tường minh, ta có thể chỉ ra một chặn dưới chặt cho nó.

#theorem([Chặn dưới của bán kính ổn định])[Ta có
$ R(w) >= underline(R)(w) = min_(u in N(v_1)) 1/n (1-2 angle.l w, bb(1)_T_u angle.r). $ <eq-lowerbound-SR>

Hơn nữa, dấu "=" xảy ra nếu $underline(R)(w) < min_(i=1,...,n) w_i$.
] <thm-lower-bound-SR>

// #thmref("xxx")

Trước khi chứng minh @thm-lower-bound-SR cần lưu ý rằng cận dưới $underline(R)(w)$ được đảm bảo không âm do tính tối ưu của $v_1$. Hơn nữa, điều kiện $underline(R)(w) < min_(i=1,...,n) w_i$ về cơ bản có nghĩa là $underline(R)(w)$ là một mức độ nhiễu sao cho bất kỳ trọng số nào trong khoảng $[w-underline(R)(w), w + underline(R)(w)]$ vẫn dương, khiến nó trở thành một điều kiện dễ dàng được thỏa mãn. 

#proof[
  Đặt $epsilon_u = 1/n (1-2 angle.l w, bb(1)_T_u angle.r)$. Không khó để thấy rằng $epsilon_u$ thỏa mãn phương trình sau:
  $ angle.l w+ epsilon_u, bb(1)_T_u angle.r = angle.l w- epsilon_u, bb(1)_(T without T_u) angle.r $

  Để chứng minh #myref[@eq-lowerbound-SR], chỉ cần chứng minh rằng với bất kỳ $epsilon$ nào thỏa mãn $epsilon <= min_(u in N(v_1)) epsilon_u$ thì $v_1$ là một điểm median đối với bất kỳ $tilde(w) in [w-epsilon, w+epsilon] sect RR_+^n$. Với mọi $epsilon <= min_(u in N(v_1)) epsilon_u, tilde(w) in [w - epsilon, w+ epsilon] sect RR_+^n$ và $u in N(v_1)$, ta có:

  $ angle.l tilde(w), bb(1)_T_u angle.r <= angle.l w+ epsilon_u, bb(1)_T_u angle.r = angle.l w - epsilon_u, bb(1)_(T without T_u) angle.r <= angle.l tilde(w), bb(1)_(T without T_u) angle.r. $

  Theo @cor-opt-cond có thể kết luận rằng $v_1 in X_tilde(w)^*$. 

  Giả sử $underline(R)(w) < min_(i=1,...,n) w_i$, ta sẽ chứng minh rằng $R(w)= underline(R)(w)$. Ta cần chứng minh rằng đối với mức độ nhiễu $epsilon$ lớn hơn $R(w)$, thì sẽ tồn tại một trọng số nhiễu khả thi $tilde(w)$ sao cho $v_1$ không còn là tối ưu đối với $tilde(w)$. Cụ thể, giả sử $epsilon in (R(w), min_(i=1,...,n)w_i)$, sau đó chúng tôi xây dựng một số $tilde(w) in [w-epsilon,w+epsilon] sect RR_n^+$ sao cho $v_1 in.not X_tilde(w)^*$. Vì $epsilon > R(w)$, tồn tại một số $u in N(v_1)$ sao cho $epsilon > epsilon_u$. Do đó
  $ angle.l w + epsilon, bb(1)_T_u angle.r > angle.l w + epsilon_u, bb(1)_T_u angle.r  = angle.l w - epsilon_u, bb(1)_(T without T_u) angle.r > angle.l w- epsilon, bb(1)_(T without T_u) angle.r $ <eq-9-xxx>

  Đặt $tilde(w)= (w+ epsilon) dot.circle bb(1)_T_u + (w-epsilon) dot.circle bb(1)_(T without T_u)$, trong đó $dot.circle$ là phép nhân Hadamard. Lưu ý rằng $tilde(w) in [w - epsilon, w + epsilon]$ và dương vì $epsilon <= min_(i=1,...,n) w_i$. Quan sát rằng #myref[@eq-9-xxx] có thể được viết lại dưới dạng $ angle.l tilde(w), bb(1)_T_u angle.r > angle.l tilde(w), bb(1)_(T without T_u) angle.r$. Do đó, $X_tilde(w)^* subset T_u$. //theo bổ đề 2.1. #remark-Le[Ref Bổ đề]
  Vì $v_1 in.not T_u$, ta có $v_1 in.not X_tilde(w)^*$

  Vậy ta hoàn thành chứng minh.
]

// *Ví dụ 3.1*
#example[
Ta xem xét cây có trọng số $T$ trong #figref[@fig-example-stability-radius]. Bán kính ổn định $R(w)$ bị chặn dưới bởi $ underline(R)(w) = min{epsilon_v_2, epsilon_v_3, epsilon_v_4}= 0.1/9, $ trong đó $epsilon_v_2 = 0.34/9, epsilon_v_3 = 0.76/9, epsilon_v_4 = 0.1/9 $. Bởi vì $0.1/9 < min_(i=1,...,n) w_i = 0.06$, ta thu được $R(w)= 0.1/9$.]

// #remark-Le[Em bé có thể tính toán ví dụ chi tiết ra, nếu có thời gian.]

#let example-stability-radius = canvas(length: 10%, {
  import cetz.draw: *

  let y = 2 
  let x = 4
  let y-space = 1
  let h=1.6

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
)
#figure(
  example-stability-radius,
  caption: [Đồ thị cây để tính bán kính ổn định],
) <fig-example-stability-radius>
