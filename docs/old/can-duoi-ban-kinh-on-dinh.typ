=== Ước lượng cận dưới bán kính ổn định

Trong mục này, chúng ta sẽ ước lượng cận dưới bán kính ổn định bằng một công thức được tính toán một cách tường minh. Điều này đóng vai trò quan trọng trong việc nâng cấp cận dưới này ở chương tiếp theo.

Gọi $v_1$ là điểm 1-median ứng với vecto trọng số $w$. Gọi $N(v_1)$ là tập hợp những đỉnh liền kề với $v_1$. Ta có định lý sau:

#theorem([Cận dưới bán kính ổn định])[Ta có 
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
