// The inverse 1-median problem on a tree and on a path (Galavii)

*Bài toán inverse 1-median trên cây*

*1. Phát biểu vấn đề*

#let widown= $underline(w_i)$
#let wiup = $overline(w_i)$
#let wt = $tilde(w)$

Cho đồ thị cây $T=(V,E)$ với tập đỉnh $V={v_1,v_2,...,v_n}$ và tập cạnh $E$. Mỗi đỉnh trên đồ thị được gán một trọng số không âm, kí hiệu là $w_i, i=1,2,...,n$ và mỗi cạnh cũng có một độ dài không âm. Đặt $d(x,v_i)$ là độ dài đường đi ngắn nhất giữa $x$ và $v_i$. Một đỉnh $x^*$ được gọi là điểm 1-median trên $T$ nếu

$ f(x^*) <= f(x), forall x in V $

trong đó, $f(x)= sum_(i=1)^n w_i d(x,v_i).$

Bài toán inverse 1-median trên cây có thể được phát biểu như sau: Chúng ta chỉ định một nút $s in V$ và muốn thay đổi các trọng số đỉnh với chi phí tối thiểu sao cho $s$ trở thành 1-median. Giả sử rằng chúng ta phải chịu chi phí không âm $c_i$ nếu trọng số $w_i$ nếu trọng số $w_i$ được tăng hoặc giảm một đơn vị. Ta giả định rằng không thể tăng hoặc giảm các trọng số đỉnh một cách tùy ý. Cụ thể, các trọng số đỉnh phải tuân theo các giới hạn $widown <= w_i <= wiup$ cho tất cả $i= 1,2,...,n$. Gọi $p_i$ là lượng mà trọng số $w_i$ được tăng lên. Tương tự, gọi $q_i$ là lượng mà trọng số $w_i$ được giảm đi. Bây giờ, bài toán inverse 1-median trên cây có thể được biểu diễn như sau: Tìm các trọng số đỉnh mới $w^*_i = w_i + p_i - q_i, i=1,2,...,n$ sao cho điểm $s in V $ là 1-median đối với các trọng số mới $w^*i$, các trọng số mới nằm trong các giới hạn cho trước $widown <= w^*_i <= wiup$ với tất cả $i=1,2,...,n$ và tổng chi phí $ sum_(i=1)^n c_i (p_i + q_i) $ cho việc thay đổi các trọng số nên được tối thiểu.

*2. Tiêu chí tối ưu*

Giả sử $W= sum_(i=1)^n w_i$ là tổng của tất cả các trọng số đỉnh của cây. Giả sử $t$ là một 1-median và $s (s != t)$, không phải là một 1-median của cây với các trọng số cho trước. Đặt gốc của cây tại $s$ và xem xét các cây con $T_1, T_2, ..., T_k$, trong đó $k$ là bậc của đỉnh $s$. Giả sử rằng $T_k$ chứa đỉn $t$ và $wt_i$ biểu thị tổng của tất cả các trọng số đỉnh của cây con $T_i$ và $wt_0 = w(s)$. Nếu $s$ không phải là một 1-median, thì chúng ta biết rằng $wt_i < W/2$ với tất cả $i=1,2,...,k-1$ và $wt_k > W/2$. Giả sử rằng ${v_1,..,v_s-1}$ và $R= wt_k - sum_(i=0)^k (wt_k)/2$. Định lý sau đây được chứng minh trong Burkard et al. [3]

*Định lý* (Tiêu chí tối ưu) Giả sử $wt_1 <= W/2,...,wt_(k-1) <= W/2$. Đỉnh $s$ là 1-median nếu và chỉ nếu $R=0$.

Phương trình $R=0$ nghĩa là $ sum_(i=s)^n (p_i - q_i) - sum_(i=1)^(s-1) (p_i - q_i) = 2wt_k - W$.

Do đó, bài toán 1-median ngược trên một cây với các trọng số dương có thể được viết dưới dạng tuyến tính như sau:

(LP)

$
min quad & sum_(i=1)^n c_i (p_i + q_i)\

"s.t." quad & sum_(i=s)^n (p_i - q_i) - sum_(i=1)^(s-1) (p_i - q_i) = 2 wt_k - W\

 & p_i <= wiup - w_i\

 & sum^n_(i=1) tilde(w)_i = 1\

 & norm(tilde(w)-w)_infinity <= epsilon_0
$
