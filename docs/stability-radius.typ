#include "../tools/multi-section-ref.typ"
#import "../tools/macros.typ": eqref, remark-Le, delete-Le, add-Le, remark-Ngan, delete-Ngan, add-Ngan
#import "../typst-orange.typ": theorem, proof, lemma, proposition, corollary, example, definition, 
#import "@preview/cetz:0.1.2": canvas, plot
#import "@preview/cetz:0.1.2"

// = BÁN KÍNH ỔN ĐỊNH CỦA ĐIỂM 1-MEDIAN
// = NÂNG CẤP BÁN KÍNH ỔN ĐỊNH ĐIỂM 1-MEDIAN
= BÁN KÍNH ỔN ĐỊNH ĐIỂM 1-MEDIAN



#remark-Le[Chương kiến thức chuẩn bị là 30 trang. Chương này mớ có 10 trang. Em phải cố gắng viết thêm 10 trang nữa nha.]

#remark-Le[Phải đặt tiêu đề ngắn, vì nếu không, tiêu đề chương sẽ bị xuống hàng k đẹp.]


== Khái niệm bán kính ổn định của điểm 1-median trên cây

#remark-Le[Nhắc lại setting: đồ thị cây, điểm một median .... ]

Giả sử $w in RR_+^n$ là một vecto trọng số thỏa mãn điều kiện (1) và $v_1$ là một trung vị tương ứng với $w$.

Trong thực tế, vecto trọng số $w$ có thể bị nhiễu thành vecto $tilde(w) in RR_+^n$. Ta giả sử rằng sự khác biệt giữ $w$ và $tilde(w)$ là nhỏ, tức là $norm(tilde(w)-w)_infinity <= epsilon_0$, hoặc tương đương $tilde(w) in [w-epsilon; w+ epsilon] $ với một mức nhiễu nhỏ $epsilon>0$. Trong bối cảnh có nhiễu này, chúng ta nhắm đến việc điều tra sự ổn định của điểm trung vị $v_1$. Cụ thể, chúng ta quan tâm đến mức nhiễu lớn nhất có thể $epsilon$ sao cho $v_1$ vẫn còn tối ưu đối với $tilde(w)$, tức là
$ R(w)=sup{epsilon>= 0: v_1 in X_tilde(w)^*, quad forall tilde(w)in [w-epsilon;w+epsilon] sect RR_+^n} $.

Ở đây, $R(w)$ được gọi là _bán kính ổn định_ của điểm $v_1$ tương ứng với vecto $w$.



== Chặn dưới của bán kính ổn định 

Mặc dù $R(w)$ được định nghĩa một cách ngầm định, nó có một cận dưới đơn giản nhưng chặt chẽ. 

#theorem[Ta có
$ R(w) >= underline(R)(w) = min_(u in N(v_1)) 1/n (1-2 angle.l w, bb(1)_T_u angle.r). $ 

Hơn nữa, dấu "=" xảy ra nếu $R(w) < min_(i=1,...,n) w_i$
]

Trước khi chứng minh *Định lý...* cần lưu ý rằng cận dưới $R(w)$ được đảm bảo không âm do tính tối ưu của $v_1$ (6). Hơn nữa, điều kiện $R(w) < min_(i=1,...,n) w_i$ về cơ bản có nghĩa là $R(w)$ là một mức độ nhiễu sao cho bất kỳ trọng số nào trong khoảng $[w-R(w), w + R(w)]$ vẫn dương, khiến nó trở thành một điều kiện nhẹ nhàng. 

#proof[
  Đặt $epsilon_u = 1/n (1-2 angle.l w, bb(1)_T_u angle.r)$. Không khó để thấy rằng $epsilon_u$ thỏa mãn phương trình sau:
  $ angle.l w+ epsilon_u, bb(1)_T_u angle.r = angle.l w- epsilon_u, bb(1)_(T without T_u) angle.r $

  Để chứng minh (7), chỉ cần chứng minh rằng với bất kỳ $epsilon$ nào thỏa mãn $epsilon <= min_(u in N(v_1)) epsilon_u$ thì $v_1$ là một điểm trung vị đối với bất kỳ $tilde(w) in [w-epsilon, w+epsilon] sect RR_+^n$. Với tất cả $epsilon <= min_(u in N(v_1) epsilon_u), tilde(w) in [w - epsilon, w+ epsilon] sect RR_+^n$ và $u in N(v_1)$, ta có:

  $ angle.l tilde(w), bb(1)_T_u angle.r <= angle.l w+ epsilon_u, bb(1)_T_u angle.r = angle.l w - epsilon_u, bb(1)_(T without T_u) angle.r <= angle.l tilde(w), bb(1)_(T without T_u) angle.r. $

  Theo *Định lý 2.1* có thể kết luận rằng $v_1 in X_tilde(w)^*$. 

  Giả sử rằng $underline(R)(w) < min_(i=1,...,n) w_i$, mục tiêu của ta là chứng minh rằng $R(w)= underline(R)(w).$ Để đạt được mục tiêu này, chúng tôi chứng minh rằng đối với mức độ nhiễu $epsilon$ lớn hơn $R(w)$, thì sẽ tồn tại một trọng số nhiễu khả thi $tilde(w)$ sao cho $v_1$ không còn là tối ưu đối với $tilde(w)$. Cụ thể, giả sử $epsilon in (R(w), min_(i=1,...,n)w_i)$, sau đó chúng tôi xây dựng một số $tilde(w) in [w-epsilon,w+epsilon] sect RR_n^+$ sao cho $v_1 in.not X_tilde(w)^*$. Vì $epsilon > R(w)$, tồn tại một số $u in N(v_1)$ sao cho $epsilon > epsilon_u$. Do đó
  $ angle.l w + epsilon, bb(1)_T_u angle.r > angle.l w + epsilon_u, bb(1)_T_u angle.r  = angle.l w - epsilon_u, bb(1)_(T without T_u) angle.r > angle.l w- epsilon, bb(1)_(T without T_u) angle.r. $ (9)

  Đặt $tilde(w)= (w+ epsilon) dot.circle bb(1)_T_u + (w-epsilon) dot.circle bb(1)_(T without T_u)$, trong đó $dot.circle$ là pháp nhân Hadamard giữa hai vecto. Lưu ý rằng $tilde(w) in [w - epsilon, w + epsilon]$ và dương vì $epsilon <= min_(i=1,...,n) w_i$. Quan sát rằng (9) có thể được viết lại dưới dạng $ angle.l tilde(w), bb(1)_T_u angle.r > angle.l tilde(w), bb(1)_(T without T_u) angle.r$. Do đó, $X_tilde(w)^* subset T_u$ theo bổ đề 2.1. Vì $v_1 in.not T_u$, ta có $v_1 in.not X_tilde(w)^*$

  Vậy ta hoàn thành chứng minh.
]

// *Ví dụ 3.1*
#example[
Ta xem xét cây có trọng số $T$ trong hình 1. Bán kính ổn định $R(w)$ bị chặn dưới bởi $underline(R)(w) = min{epsilon_v_2, epsilon_v_3, epsilon_v_4}= 0.1/9$, trong đó $epsilon_v_2 = 0.34/9, epsilon_v_3 = 0.76/9, epsilon_v_4 = 0.1/9 $. Bởi vì $0.1/9 < min_(i=1,...,n) w_i = 0.06$, ta thu được $R(w)= 0.1/9$.]

#remark-Le[Em bé có thể tính toán ví dụ chi tiết ra, nếu có thời gian.]