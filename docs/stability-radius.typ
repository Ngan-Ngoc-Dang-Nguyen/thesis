
// _Chương này sẽ nghiên cứu về một đối tượng ...._

#include "../tools/multi-section-ref.typ"
#import "../tools/macros.typ": eqref, remark-Le, delete-Le, add-Le, remark-Ngan, delete-Ngan, add-Ngan, theorem, definition, proposition, lemma, proof, example,
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
_Bán kính ổn định_ của một đối tượng trong lý thuyết đồ thị là một khái niệm phản ánh mức độ mà một đồ thị (hoặc một thành phần của nó) có thể duy trì các thuộc tính quan trọng khi bị tác động bởi những thay đổi nhỏ, chẳng hạn như việc loại bỏ các đỉnh hoặc cạnh. Nó đo lường khả năng "chịu đựng" của đồ thị trước các yếu tố gây rối loạn hoặc phá hủy, đồng thời xác định phạm vi ảnh hưởng của sự thay đổi đối với cấu trúc của đồ thị.

Trong các ngữ cảnh khác nhau, khái niệm này có thể có các ý nghĩa cụ thể, chẳng hạn:

Trong bài toán định vị trung tâm (facility location): Khi nghiên cứu bài toán 1-median hoặc các bài toán liên quan trong lý thuyết đồ thị, bán kính ổn định có thể được hiểu là mức độ thay đổi của vị trí trung tâm (ví dụ, vị trí của một "median" hoặc "center") khi có sự điều chỉnh về trọng số của các đỉnh hoặc cạnh trong đồ thị. Một bán kính ổn định lớn cho thấy trung tâm của đồ thị ít bị ảnh hưởng khi có sự điều chỉnh hoặc thay đổi nhỏ trong hệ thống.

Trong mạng phân tán hoặc hệ thống máy tính: Bán kính ổn định của một mạng lưới có thể đề cập đến khả năng chịu lỗi, tức là số lượng nút hoặc liên kết bị mất trước khi hệ thống không còn duy trì được các chức năng quan trọng (ví dụ, việc đảm bảo tất cả các thành phần có thể giao tiếp với nhau).

Trong phạm vi luận văn này, chúng ta sẽ nghiên cứu về bán kính ổn định của điểm 1-median trên đồ thị cây. 

== Một số ký hiệu liên quan 

Trước khi đi vào nội dung chính, chúng ta sẽ giới thiệu một số ký hiệu quan trọng được sử dụng xuyên suốt trong chương này. Các ký hiệu này sẽ giúp việc trình bày và phân tích trở nên rõ ràng và nhất quán hơn.

1. Giả sử:

$u= vec(u_1,u_2,u_3), v= vec(v_1, v_2, v_3).$ Ta định nghĩa phép nhân Hadamard như sau:

$ u dot.circle v = vec(u_1,u_2,u_3) dot.circle vec(v_1, v_2, v_3) = vec(u_1 + v_1, u_2 + v_2, u_3 + v_3) $

Ký hiệu $dot.circle$ được gọi là _tích Hadamard_ và phép toán này được thực hiện bằng cách cộng từng thành phần tương ứng của hai vectơ. #remark-Le[Phép nhân Hadamard k phải cộng. Em cho ví dụ lộn rồi.]

*Ví dụ* Cho $u = vec(1,2,3), v= vec(4,5,6)$. Khi đó
$ u dot.circle v = vec(1,2,3) dot.circle vec(4,5,6) = vec(1+4,2+5,3+6)=(5,7,9) $

2. Gọi $ bb(1)_T_u = vec(v_1,v_2,...,v_n) $
Trong đó 
$ v_i = cases(1 "nếu" v_i in T_u, 0 "nếu" v_i in.not T_u ) $
Nghĩa là, vecto $bb(1)_T_u$ có $n$ thành phần, với thành phần thứ $i$ bằng 1 nếu đỉnh $v_i$ thuộc cây $T_u$ và bằng 0 nếu không thuộc.

3. Đặt $ angle.l w, bb(1)_T_u angle.r $ là tổng tọng số của cây con lấy gốc tại $u$.

4. Giả sử một vecto $x = (x_1,x_2,...,x_n)$, chuẩn vô cùng của vecto $x$ được định nghĩa là:

$ norm(.)_infinity = max_(1<= i <= n) abs(x_i) $

*Ví dụ* Giả sử $x=(1,-3,2)$, khi đó:
$ norm(x)_infinity = max (abs(1), abs(-3),abs(2)) = 3 $

5. Giả sử một vecto $x = (x_1,x_2,...,x_n)$, chuẩn một của vecto $x$ được định nghĩa là:

$ norm(.)_1 = sum_(i=1)^n abs(x_i) $

Nói cách khác, chuẩn 1 tính tổng các giá trị tuyệt đối của các phần tử trong vecto.

*Ví dụ* Giả sử $x=(1,-3,2)$, khi đó:
$ norm(x)_1 =  abs(1) + abs(-3) + abs(2) = 1 + 3 + 2= 6. $

#remark-Le[Giải thích thêm ký hiệu $[w - epsilon, w+ epsilon]$]

== Bán kính ổn định
=== Định nghĩa 
Như đã trình bày ở *Chương 1*, $v_1$ được gọi là điểm 1-median nếu $f(v_1)$ nhỏ nhất. Đồng thời, *Goldman* cũng đã đưa ra được điều kiện tối ưu như sau:

$ angle.l w, bb(1)_T_u angle.r <= W/2 $ <eq:dktu>

Điều này tương đương với 
$
angle.l w, bb(1)_T_u angle.r <= angle.l w, bb(1)_(T without T_u) angle.r, quad quad forall u in N(v_1)
$

Trong mục này, ta sẽ định nghĩa bán kính ổn định của điểm 1-median trên cây với tổng trọng số đỉnh có độ lớn không đổi, nghĩa là

$ W = angle.l w, bb(1)_T angle.r = 1 $ <eq:dk>

Khi đó, #eqref(<eq:dktu>) có thể được viết lại:

$ angle.l w, bb(1)_T_u angle.r <= 1/2 $

Giả sử $w in RR_+^n$ là một vecto trọng số thỏa mãn điều kiện #eqref(<eq:dk>) và $v_1$ là điểm 1-median ứng với $w$.

Trong thực tế, vector trọng số $w$ có thể bị nhiễu, dẫn đến việc nó bị thay đổi thành một vector $ tilde(w) in RR_+^n$. Chẳng hạn, trong một thành phố, trọng số tại mỗi điểm dân cư có thể thay đổi do các yếu tố như biến động dân số, điều kiện giao thông, hoặc sự phát triển của cơ sở hạ tầng. Một ví dụ khác có thể thấy trong hệ thống chuỗi cửa hàng, nơi trọng số về khối lượng hàng hóa tại mỗi cửa hàng có thể dao động do ảnh hưởng của thời tiết, tính chất mùa vụ, hoặc tình hình kinh tế.

Ta giả sử rằng sự sai khác giữ $w$ và $tilde(w)$ là nhỏ, cụ thể được mô tả bởi bất đẳng thức:
$ norm(tilde(w)-w)_infinity <= epsilon_0 $ điều này tương đương $tilde(w) in [w-epsilon; w+ epsilon] $ với một mức nhiễu nhỏ $epsilon>0$. Điều này có nghĩa là mỗi thành phần trọng số của $tilde(w)$ chỉ có thể thay đổi trong một khoảng nhất định xung quanh giá trị tương ứng của nó trong $w$, phản ánh sự biến động nhẹ trong hệ thống.

Trong bối cảnh tồn tại sự nhiễu này, mục tiêu của chúng ta là xem xét sự ổn định của điểm 1-median $v_1$. Nói cách khác, chúng ta muốn biết mức độ nhiễu lớn nhất có thể, ký hiệu là $epsilon$, sao cho $v_1$ vẫn là điểm 1-median tối ưu đối với vector trọng số bị nhiễu $tilde(w)$, tức là:
$ R(w)=sup{epsilon>= 0: v_1 in X_tilde(w)^*, quad forall tilde(w)in [w-epsilon;w+epsilon] sect RR_+^n} $
Trong đó: $X_tilde(w)^*$ là tập hợp các điểm 1-median tương ứng với vector trọng số bị nhiễu $tilde(w)$

Khi đó ta gọi $R(w)$ là _bán kính ổn định_ của điểm $v_1$ tương ứng với vecto $w$.

// Mặc dù $R(w)$ được định nghĩa một cách ngầm định, nó có một cận dưới đơn giản nhưng chặt chẽ.
=== Ước lượng cận dưới bán kính ổn định

Trong mục này, chúng ta sẽ ước lượng cận dưới bán kính ổn định bằng một công thức được tính toán một cách tường minh. Điều này đóng vai trò quan trọng trong việc nâng cấp cận dưới này ở chương tiếp theo.

Gọi $v_1$ là điểm 1-median ứng với vecto trọng số $w$. Gọi $N(v_1)$ là tập hợp những đỉnh liền kề với $v_1$. Ta có định lý sau:

#theorem[
$ R(w) >= underline(R)(w) = min_(u in N(v_1)) 1/n (1-2 angle.l w, bb(1)_T_u angle.r). $ <eq:epsilonu>

Dấu "=" xảy ra nếu $underline(R)(w) < min_(i=1,...,n) w_i$]

// Trước khi chứng minh *Định lý...* cần lưu ý rằng cận dưới $R(w)$ được đảm bảo không âm do tính tối ưu của $v_1$ (6). Hơn nữa, điều kiện $R(w) < min_(i=1,...,n) w_i$ về cơ bản có nghĩa là $R(w)$ là một mức độ nhiễu sao cho bất kỳ trọng số nào trong khoảng $[w-R(w), w + R(w)]$ vẫn dương, khiến nó trở thành một điều kiện nhẹ nhàng. 

// #proof[ Đặt $epsilon_u = 1/n (1-2 angle.l w, bb(1)_T_u angle.r)$. Bằng những tính toán đơn giản, ta có:
// $ angle.l w + epsilon_u, bb(1)_T_u angle.r = angle.l w - epsilon_u, bb(1)_(T without T_u) angle.r. $
// ]
#proof[Đặt $epsilon_u = 1/n (1-2 angle.l w, bb(1)_T_u angle.r)$. Không khó để thấy rằng $epsilon_u$ thỏa mãn phương trình sau:
$ angle.l w+ epsilon_u, bb(1)_T_u angle.r = angle.l w- epsilon_u, bb(1)_(T without T_u) angle.r $ 

Để chứng minh #eqref(<eq:epsilonu>), chỉ cần chứng minh rằng với bất kỳ $epsilon$ nào thỏa mãn $epsilon <= min_(u in N(v_1)) epsilon_u$ thì $v_1$ là một điểm 1-median đối với bất kỳ $tilde(w) in [w-epsilon, w+epsilon] sect RR_+^n$. Với tất cả $epsilon <= min_(u in N(v_1) epsilon_u), tilde(w) in [w - epsilon, w+ epsilon] sect RR_+^n$ và $u in N(v_1)$, ta có:

$ angle.l tilde(w), bb(1)_T_u angle.r <= angle.l w+ epsilon_u, bb(1)_T_u angle.r = angle.l w - epsilon_u, bb(1)_(T without T_u) angle.r <= angle.l tilde(w), bb(1)_(T without T_u) angle.r. $

Theo *Hệ quả ...* có thể kết luận rằng $v_1 in X_tilde(w)^*$. #remark-Le[Ref Hệ quả XXX]
//  (Ở chương thêm, thêm 1 hệ quả...$ angle.l w, bb(1)_T_u angle.r <= W/2 = (angle.l w, bb(1)_T_u angle.r + angle.l w, bb(1)_(T without T_u) angle.r ) /2 
//  <=> angle.l w, bb(1)_T_u angle.r <= angle.l w, bb(1)_(T without T_u) angle.r $ )


Giả sử rằng $underline(R)(w) < min_(i=1,...,n) w_i$, ta cần chứng minh rằng $R(w)= underline(R)(w).$ 

Để đạt được mục tiêu này, chúng tôi chứng minh rằng khi mức độ nhiễu $epsilon$ lớn hơn $underline(R)(w)$, sẽ tồn tại một trọng số $tilde(w)$ sao cho $v_1$ không còn là phương án tối ưu đối với $tilde(w)$.

Cụ thể, giả sử $epsilon in (R(w), min_(i=1,...,n)w_i)$, sau đó chúng tôi xây dựng một số $tilde(w) in [w-epsilon,w+epsilon] sect RR_n^+$ sao cho $v_1 in.not X_tilde(w)^*$. Vì $epsilon > R(w)$, tồn tại một số $u in N(v_1)$ sao cho $epsilon > epsilon_u$. Do đó
$ angle.l w + epsilon, bb(1)_T_u angle.r > angle.l w + epsilon_u, bb(1)_T_u angle.r  = angle.l w - epsilon_u, bb(1)_(T without T_u) angle.r > angle.l w- epsilon, bb(1)_(T without T_u) angle.r. $ (9)

Đặt $tilde(w)= (w+ epsilon) dot.circle bb(1)_T_u + (w-epsilon) dot.circle bb(1)_(T without T_u)$, trong đó $dot.circle$ là phép nhân Hadamard giữa hai vecto. Lưu ý rằng $tilde(w) in [w - epsilon, w + epsilon]$ và dương vì $epsilon <= min_(i=1,...,n) w_i$. Quan sát rằng (9) có thể được viết lại dưới dạng $ angle.l tilde(w), bb(1)_T_u angle.r > angle.l tilde(w), bb(1)_(T without T_u) angle.r$. Do đó, $X_tilde(w)^* subset T_u$ theo bổ đề 2.1. #remark-Le[Ref Bổ đề] Vì $v_1 in.not T_u$, ta có $v_1 in.not X_tilde(w)^*$

Vậy ta hoàn thành chứng minh.]

#remark-Le[Nhắc lại setting: đồ thị cây, điểm một median .... ]

Giả sử $w in RR_+^n$ là một vecto trọng số thỏa mãn điều kiện (1) và $v_1$ là một trung vị tương ứng với $w$.

Trong thực tế, vecto trọng số $w$ có thể bị nhiễu thành vecto $tilde(w) in RR_+^n$. Ta giả sử rằng sự khác biệt giữ $w$ và $tilde(w)$ là nhỏ, tức là $norm(tilde(w)-w)_infinity <= epsilon_0$, hoặc tương đương $tilde(w) in [w-epsilon; w+ epsilon] $ với một mức nhiễu nhỏ $epsilon>0$. Trong bối cảnh có nhiễu này, chúng ta nhắm đến việc điều tra sự ổn định của điểm trung vị $v_1$. Cụ thể, chúng ta quan tâm đến mức nhiễu lớn nhất có thể $epsilon$ sao cho $v_1$ vẫn còn tối ưu đối với $tilde(w)$, tức là
$ R(w)=sup{epsilon>= 0: v_1 in X_tilde(w)^*, quad forall tilde(w)in [w-epsilon;w+epsilon] sect RR_+^n} $.

Ở đây, $R(w)$ được gọi là _bán kính ổn định_ của điểm $v_1$ tương ứng với vecto $w$.



===  Chặn dưới của bán kính ổn định 

Mặc dù $R(w)$ được định nghĩa một cách ngầm định, nó có một cận dưới đơn giản nhưng chặt chẽ. 

#theorem([xxx])[Ta có
$ R(w) >= underline(R)(w) = min_(u in N(v_1)) 1/n (1-2 angle.l w, bb(1)_T_u angle.r). $ 

Hơn nữa, dấu "=" xảy ra nếu $R(w) < min_(i=1,...,n) w_i$
]

// #thmref("xxx")

Trước khi chứng minh *Định lý...* cần lưu ý rằng cận dưới $R(w)$ được đảm bảo không âm do tính tối ưu của $v_1$ (6). Hơn nữa, điều kiện $R(w) < min_(i=1,...,n) w_i$ về cơ bản có nghĩa là $R(w)$ là một mức độ nhiễu sao cho bất kỳ trọng số nào trong khoảng $[w-R(w), w + R(w)]$ vẫn dương, khiến nó trở thành một điều kiện nhẹ nhàng. 

#proof[
  Đặt $epsilon_u = 1/n (1-2 angle.l w, bb(1)_T_u angle.r)$. Không khó để thấy rằng $epsilon_u$ thỏa mãn phương trình sau:
  $ angle.l w+ epsilon_u, bb(1)_T_u angle.r = angle.l w- epsilon_u, bb(1)_(T without T_u) angle.r $

  Để chứng minh (7), chỉ cần chứng minh rằng với bất kỳ $epsilon$ nào thỏa mãn $epsilon <= min_(u in N(v_1)) epsilon_u$ thì $v_1$ là một điểm trung vị đối với bất kỳ $tilde(w) in [w-epsilon, w+epsilon] sect RR_+^n$. Với tất cả $epsilon <= min_(u in N(v_1) epsilon_u), tilde(w) in [w - epsilon, w+ epsilon] sect RR_+^n$ và $u in N(v_1)$, ta có:

  $ angle.l tilde(w), bb(1)_T_u angle.r <= angle.l w+ epsilon_u, bb(1)_T_u angle.r = angle.l w - epsilon_u, bb(1)_(T without T_u) angle.r <= angle.l tilde(w), bb(1)_(T without T_u) angle.r. $

  Theo *Định lý 2.1* có thể kết luận rằng $v_1 in X_tilde(w)^*$. 

  Giả sử rằng $underline(R)(w) < min_(i=1,...,n) w_i$, mục tiêu của ta là chứng minh rằng $R(w)= underline(R)(w).$ Để đạt được mục tiêu này, chúng tôi chứng minh rằng đối với mức độ nhiễu $epsilon$ lớn hơn $R(w)$, thì sẽ tồn tại một trọng số nhiễu khả thi $tilde(w)$ sao cho $v_1$ không còn là tối ưu đối với $tilde(w)$. Cụ thể, giả sử $epsilon in (R(w), min_(i=1,...,n)w_i)$, sau đó chúng tôi xây dựng một số $tilde(w) in [w-epsilon,w+epsilon] sect RR_n^+$ sao cho $v_1 in.not X_tilde(w)^*$. Vì $epsilon > R(w)$, tồn tại một số $u in N(v_1)$ sao cho $epsilon > epsilon_u$. Do đó
  $ angle.l w + epsilon, bb(1)_T_u angle.r > angle.l w + epsilon_u, bb(1)_T_u angle.r  = angle.l w - epsilon_u, bb(1)_(T without T_u) angle.r > angle.l w- epsilon, bb(1)_(T without T_u) angle.r. $ (9)

  Đặt $tilde(w)= (w+ epsilon) dot.circle bb(1)_T_u + (w-epsilon) dot.circle bb(1)_(T without T_u)$, trong đó $dot.circle$ là pháp nhân Hadamard giữa hai vecto. Lưu ý rằng $tilde(w) in [w - epsilon, w + epsilon]$ và dương vì $epsilon <= min_(i=1,...,n) w_i$. Quan sát rằng (9) có thể được viết lại dưới dạng $ angle.l tilde(w), bb(1)_T_u angle.r > angle.l tilde(w), bb(1)_(T without T_u) angle.r$. Do đó, $X_tilde(w)^* subset T_u$ theo bổ đề 2.1. #remark-Le[Ref Bổ đề] Vì $v_1 in.not T_u$, ta có $v_1 in.not X_tilde(w)^*$

  Vậy ta hoàn thành chứng minh.
]

// *Ví dụ 3.1*
#example[
Ta xem xét cây có trọng số $T$ trong hình 1. Bán kính ổn định $R(w)$ bị chặn dưới bởi $underline(R)(w) = min{epsilon_v_2, epsilon_v_3, epsilon_v_4}= 0.1/9$, trong đó $epsilon_v_2 = 0.34/9, epsilon_v_3 = 0.76/9, epsilon_v_4 = 0.1/9 $. Bởi vì $0.1/9 < min_(i=1,...,n) w_i = 0.06$, ta thu được $R(w)= 0.1/9$.]

#remark-Le[Em bé có thể tính toán ví dụ chi tiết ra, nếu có thời gian.]
