#par(justify: true)[
*Nâng cấp bán kính ổn định của điểm 1-median*

Trong phần này, đầu tiên, chúng tôi sẽ xác định vấn đề chính của mình trong Mục 4.1. Tiếp theo, chúng tôi giới thiệu các phiên bản quyết định của bài toán và thiết lập mối quan hệ giữa chúng trong Mục 4.2. Cuối cùng, chúng tôi cho thấy rằng các vấn đề quyết định có thể được giải quyết dưới dạng đóng, từ đó đưa ra một phương pháp tiếp cận tổ hợp hiệu quả để giải quyết vấn đề lần lượt trong mục 4.3 và 4.4. 

*4.1 Công thức*

Rõ ràng các biến đổi trong trọng số đỉnh trên cây có thể dẫn đến sự bất ổn định trong vị trí trung vị đã thiết lập. Trong phần này, chúng tôi nhằm mục đích tăng cường độ bền vững của vị trí trung vị bằng cách cải thiện bán kính ổn định $R(w)$. Do tính chất phức tạp của $R(w)$, thay vào đó chúng tôi tập trung vào việc nâng cấp chặn dưới của $R(w)$. Bây giờ, chúng tôi sẽ nghiên cứu chi tiết mô hình

Giả sử $v_1 in V $ là một điểm trung vị liên quan đến vecto trọng số $w in RR_n^+$ thỏa mãn điều kiện khối lượng đơn vị (1). Với một ngân sách $B >= 0 $, mục tiêu của chúng tôi là thay đổi các trọng số từ $w$ thành một vecto trọng số $tilde(w) in RR_n^+$ trong giới hạn ngân sách này, đồng thời đảm bảo rằng $v_1$ vẫn là điểm trung vị, với mục tiêu tối đa hóa chặn dưới $underline(R)(tilde(w))$. Ở đây, chúng tôi giả định rằng chi phí thay đổi trọng số từ $w$ thành $tilde(w)$ được đo bằng chuẩn $"L1"$, tức là $norm(w - tilde(w))_1$. Hơn nữa, chúng tôi giả định rằng tổng trọng số không thay đổi, tức là $sum_(i=1) ^n tilde(w) = 1$ và không lệch quá nhiều so với $w$, tức là $tilde(w) in [w-epsilon_0, w + epsilon_0]$, với mọi giá trị $epsilon_0 >0 $. Chúng tôi gọi vấn đề này là nâng cấp bán kính ổn định $"(USR)"$ của điểm trung vị $v_1$ và dữ liệu đầu vào là $w$.

Khi đó, mô hình của bài toán $"(USR)"$ có thể được viết lại như sau:
$
max quad & underline(R)(tilde(w)) quad quad quad quad quad quad quad quad quad quad quad #text(blue)[(USR-10)]\ 

"s.t." quad & norm(tilde(w)-w)_1 <= B quad quad quad quad quad quad quad("USR"-10a)\

 & v_1 "is 1-median w.r.t" tilde(w) quad quad quad quad quad quad quad ("USR" - 10b)\

 & sum^n_(i=1) tilde(w)_i = 1 quad quad quad quad quad quad quad ("USR" -10c)\

 & norm(tilde(w)-w)_infinity <= epsilon_0 quad quad quad quad quad quad quad ("USR" - 10d)
$

Trong phần còn lại của tiểu mục này, mục tiêu của chúng tôi là đơn giản hóa vấn đề $"USR"$ bằng cách: 
1. Viết lại bài toán max thành min
2. Loại bỏ ràng buộc ("USR" - 10b)
3. Thay đổi biến từ vecto trọng số $tilde(w)$ sang vecto thay đổi $x = tilde(w) - w.$

Dựa vào *Định lý 3.1*, bài toán tối ưu hóa $underline(R)(w)$ có thể viết lại dưới dạng một bài toán tối thiểu hóa như sau:

$ max_tilde(w) underline(R)(tilde(w)) = max_tilde(w) min_(u in N(v_1)) 1/n (1- 2 angle.l tilde(w), bb(1)_T_u angle.r)= 1/n -2/n min_tilde(w) max_( u in N(v_1)) angle.l tilde(w), bb(1)_T_u angle.r. $ (11)

Tiếp theo, ta đặt $w^*$ là nghiệm tối ưu của bài (USR-10), dễ thấy
$ max_(u in N(v_1)) angle.l w^*, bb(1)_T_u angle.r <= max_(u in N(v_1)) angle.l tilde(w), bb(1)_T_u angle.r <= 1/2. $

Từ đó, ta thấy rằng $v_1$ là tối ưu đối với $w^*$. Do đó, ràng buộc (USR-10b) là dư thừa và có thể loại bỏ. 

Cuối cùng, đặt $ x= tilde(w) - w$ là vecto điều chỉnh. Bằng cách đổi biến, loại bỏ điều kiện (USR-10b) và viết lại hàm mục tiêu như (11), bài toán (USR-10) được viết lại như sau:

 $
    min quad & max_(u in N(v_1)) angle.l w + x, bb(1)_T_u angle.r quad quad  #text(blue)[(USR-12)]\ 

    "s.t." quad & norm(x)_1 <= B  quad quad quad quad quad quad quad  "USR-12a"\

    & sum^n_(i=1) x_i = 0 quad quad quad quad quad quad quad  "USR-12b"\

    & x_i in [-epsilon_0; epsilon_0], forall i = 1,...,n quad quad quad quad quad quad quad  "USR-12c"
    $

Trong phần còn lại của bài báo này, chúng tôi sẽ tập trung vào (USR-12) thay vì (USR-10). Bằng cách mở rộng hàm mục tiêu, vấn đề (USR-12) có thể biểu diễn thành một bài toán lập trình tuyến tính với $n$ chiều và có $O(n)$ ràng buộc. Do đó, nó có thể được giải bằng phương pháp đơn hình nổi tiếng. Tuy nhiên, độ phức tạp của phương pháp đơn hình không phải là bậc đa thức, theo Klee và Minty (1972). Mặc dù có các thuật toán thời gian đa thức cho lập trình tuyến tính, ví dụ như Karmarkar (1984), nhưng độ phức tạp thời gian của chúng không phải là tuyến tính theo $n$, do đó có thể chậm đối với các bài toán lập trình tuyến tính, như Megiddo (1984), nhưng những phương pháp này yêu cầu số chiều phải cố định hoặc tăng chậm theo số lượng ràng buộc, điều này không áp dụng trong trường hợp này.

Trong phần tiếp theo, chúng tôi đề xuất một phương pháp tổ hợp hiệu quả để giải quyết vấn đề (USR-12) bằng cách tận dụng cấu trúc đặc thù của nó. Để phát triển thuật toán này, chúng tôi sẽ giới thiệu trong các phần tiếp theo..., có thể được giải dưới dạng đóng. Hơn nữa, giải pháp cho vấn đề quyết định có thể được chuyển đổi hiệu quả thành giải pháp cho (USR-12) dựa trên mối quan hệ giữa chúng.

== Phiên bản tham số của bài toán nâng cấp bán kính ổn định

Giải quyết bài toán (USR-12) thực chất là trả lời câu hỏi: "Giá trị mục tiêu nhỏ nhất có thể đạt được với ngân sách bị giới hạn bởi $B$ là bao nhiêu". Thay vì tập trung vào câu hỏi này, ta có thể khám phá một câu hỏi liên quan chặt chẽ khác: "Với một giá trị mục tiêu $t$ cho trước, ngân sách tối thiểu cần thiết để đạt được giá trị mục tiêu không lớn hơn $t$ là bao nhiêu?". Câu hỏi này có thể được biểu diễn thành bài toán sau:

$
    min quad & norm(x)_1 quad quad quad quad quad quad #text(blue)[(PUSR-13)]\

    "s.t." quad & max_(u in N(v_1)) angle.l w + x, bb(1)_T_u angle.r <= t quad quad quad "PUSR-13a"\

    & sum^n_(i=1) x_i = 0 quad quad quad "PUSR-13b"\

    & x_i in [-epsilon_0; epsilon_0], forall i = 1,...,n quad quad quad "PUSR-13b"
    $

Thoạt nhìn, (PUSR-13) được tạo ra từ (USR-12) bằng cách hoán đổi mục tiêu và ràng buộc ngân sách. Trong phần còn lại, độc giả sẽ thấy rằng: 

-- Giải quyết (PUSR-13) đơn giản hơn so với (USR-12) 
-- Có một phép biến đổi đơn giản để từ nghiệm của (PUSR-13) suy ra nghiệm của (USR-12).

Trực quan, mối liên hệ giữa (USR-12) và (PUSR-13) như sau: nếu ngân sách tối thiểu cần thiết để đạt được giá trị mục tiêu không lớn hơn $t$ không vượt quá $B$, thì việc tăng ngân sách lên $B$ sẽ cho phép giảm $t$ để đạt được giá trị mục tiêu nhỏ nhất của bài toán ban đầu. Nói cách khác, giải quyết bài toán mới này cho phép chúng ta xác định xem $t$ có lớn hơn giá trị mục tiêu nhỏ nhất của bài toán gốc hay không. Do đó, chúng tôi gọi bài toán này là bài toán "phiên bản tham số của nâng cấp bán kính ổn định. (PUSR-13)"

Thú vị là, lập luận ngược lại cũng đúng, như được chứng minh trong bổ đề sau đây. Để phát biểu bổ đề, chúng ta hãy giới thiệu một số ký hiệu bổ sung. Gọi $P(x)= max_(u in N(v_1)) angle.l w + x, bb(1)_T_u angle.r $ là hàm mục tiêu của (USR-12). Chúng ta cũng ký hiệu $x^*$ là nghiệm tối ưu và $t^*$ là giá trị mục tiêu tối ưu của (USR-12). Khi đó, $P(x^*)= t^*$. Tiếp theo, gọi $hat(x)(t)$ là nghiệm tối ưu và $beta(t)$ là giá trị mục tiêu tối ưu của (PUSR-13) tương ứng với tham số $t$. Nếu tập hợp nghiệm khả thi của (PUSR-13) rỗng, chúng ta đặt $beta(t)= + infinity$. Rõ ràng bằng $beta(.)$ là một hàm không giảm trên miền của nó. Mối quan hệ giữa $(t,beta(t))$ và $(t^*,B)$ được thiết lập như sau:

== Bổ đề 4.1 

$ beta(t) <= B <=> t>= t^* $

*Chứng minh*
Nếu $beta(t) <= B$, thì $hat(x)(t)$ là một nghiệm khả thi ứng với (PUSR-13), do đó, $P(hat(x)(t)) >= P(x^*)$. Vì thế, $t >= P(hat(x)(t)) >= P(x^*) = t^*$, trong đó dấu bất đẳng thức đầu tiên xuất phát từ (PUSR-13a). Ta tiến hành chứng minh chiều ngược lại. Giả sử rằng $t >= t^*$. Bởi vì $t^* = P(x^*)$, ta có $P(x^*) <= t$. Điều này cho thấy tính khả thi của $x^*$ đối với (PUSR-13). Do đó, $norm(hat(x)(t))_1 <= norm(x^*)_1$. Tính khả thi của $x^*$ đối với (PUSR-12) ngụ ý rằng $norm(x^*)_1 <= B$. Vì vậy, $beta(t)= norm(hat(x)(t))_1 <= B$. Ta hoàn thành chứng minh.

Từ *Bổ đề 4.1*, điều quan trọng cần lưu ý là $beta(t^*) <= B.$ (14). 

Trong phần tiếp theo, chúng ta sẽ khai thác *Bổ đề 4.1* để dẫn ra một sự chuyển đổi từ $(hat(x)(t), beta(t))$ của (USR-12) sang $(x^*, t^*)$ của (PUSR-13).

*Định lý 4.1* _Giá trị hàm mục tiêu $t^*$ của (USR-12) được tính_
$ t^* = inf{t: beta(t) <= B}. $
_và $hat(x)(t^*)$ là nghiệm tối ưu của (USR-12)._

*Chứng minh* 

Từ 4.1, ta có thể thấy rằng $t^* <= inf{t: beta(t)<= B}$. Nếu $t^* < inf{t: beta(t) <= B}$ thì dễ thấy rằng $beta(t^*) > B$, điều này mâu thuẫn với (14). Vì thế, $t^*= inf{t: beta(t)<= B}$.

Từ (14), ta biết rằng $hat(x)t^*$ là nghiệm khả thi của (USR-12). Do đó, $P(hat(x)(t^*)) >= P(x^*) = t^*$. Hơn nữa, tính khả thi của $hat(t^*)$ tương ứng với (PUSR-13a) ngụ ý rằng $t^* >= P(hat(x)(t^*))$. Kết hợp với các điều này cho thấy tính tối ưu của $hat(x)(t^*)$ đối với (USR-12). (chứng minh xong).

Từ *Định lý 4.1*, có thể thấy rằng nếu ta có thể giải quyết được (PUSR-13), tức là biết $beta(t)$ và $hat(x)(t)$ với t bất kỳ, thì ta có thể xây dựng một nghiệm tối ưu $x^* = hat(x)(t^*)$, trong đó $t^*$ có thể được tính bằng (15). Trong phần còn lại của tiểu mục này, chúng tôi đề xuất một cách đơn giản hóa (PUSR-13) bằng cách gộp tất cả các phần tử của nghiệm tối ưu có giá trị bằng nhau. Cụ thể, trước hết chúng tôi nhận thấy rằng có tồn tại một nghiệm tối ưu của (PUSR-13) sao cho các phần tử thứ $i$ của nó có giá trị giống nhau đối với các đỉnh $v_i$ thuộc cùng một cây con $T_u$ với $u in N(v_1)$.

*Định lý 4.2* _Tồn tại một nghiệm tối ưu $hat(x)(t)$ của (PUSR-13) mà gán cùng một giá trị cho $hat(x)_(i)(t)$ đối với tất cả các đỉnh $v_i$ trong mỗi cây con $T_u$, với $ u in N(v_1)$._

*Chứng minh*
Giả sử $hat(x)(t)$ là một nghiệm tối ưu bất kỳ của (PUSR-13). Khi đó, ta có thể đạt được nghiệm tối ưu mong muốn bằng cách, đối với mọi $ u in N(v_1)$,
$ hat(x)_(i)(t) = 1/ abs(T_u) sum_(v_i in T_u) hat(x)_(i)(t), quad quad forall v_i in T_u. $ (chứng minh xong)

Từ định lý *4.2*, chúng ta nhận thấy rằng thay vì tìm kiếm vecto điều chỉnh tối ưu $hat(x)(t)$, chúng ta có thể tập trung vào tổng trọng chỉnh sửa trên mỗi cây con $T_u_j$. Quan sát này cho phép chúng ta giảm số chiều của bài toán (PUSR-13) từ $n$ xuống $k+1$, trong đó $k$ là bậc của điểm trung vị $v_1$. Giả sử $N(v_1)={u_1,u_2,...,u_k}$, $u_0 = v_1$ và $T_u_O = {v_1}$. Bây giờ chúng ta định nghĩa vecto mới $z in RR_+^(k+1)$ có chặn trên $overline(z) in RR_+^(k+1)$. Tiếp theo, ta đặt $z_0 = x_1$ là phép chỉnh sửa liên quan đến điểm trung vị $v_1$ và $z_0 = epsilon_0$ là giới hạn trên của nó. Đặt $z_j = angle.l x, bb(1)_T_u_j angle.r$ là tổng trọng số chỉnh sửa của cây con $T_u_j$ và $z_j = epsilon_0 abs(T_u_j)$ là chặn trên cho $z_j$, với $j=1,...,k$. Lưu ý rằng, $norm(x)_1 >= norm(z)_1$ và sự bằng nhau xảy ra nếu các giá trị $x_i$ cùng dấu cho các đỉnh $v_i$ thuộc cùng một cây con $T_u_j$. Ký hiệu $gamma_j = angle.l w, bb(1)_T_u_j angle.r$ là tổng trọng số của cây con $T_u_j$ với $j=1,...,k.$

Với các ký hiệu mới, thay vì xem xét bài toán (PUSR-13), người ta có thể tập trung vào bài toán sau, với số chiều nhỏ hơn bằng cách giữ nguyên tất cả các ràng buộc, nhưng thay thế $norm(x)_1$ bằng giới hạn dưới của nó $norm(z)_1:$

$
    min quad & sum_(j=0)^k abs(z_j) quad quad quad quad #text(blue)[(PUSR-16)]\

    "s.t." quad & max_(j=1,...,k) (gamma_j + z_j) <= t    quad quad ("PUSR-16a")\

    & sum^k_(j=1) z_j = 0 quad quad ("PUSR-16b")\

    & z_j in [-overline(z)_j; overline(z)_j], forall j = 0,1,...,k quad quad ("PUSR-16c")
    $

Giả sử $hat(z)(t)$ là nghiệm tối ưu của (PUSR-16). Lưu ý rằng $beta(t)$ cũng là giá trị mục tiêu tối ưu của (PUSR-16). Điều quan trọng cần lưu ý là (PUSR-13) và (PUSR-16) "tương đương" theo nghĩa nếu biết $hat(x)(t)$ như được mô tả trong Định lý 4.2, thì ta có thể xây dựng $hat(z)(t)$ và nếu biết $hat(z)(t)$ thì ta có thể tìm ra $hat(x)(t)$ bằng cách
$ hat(z)_(j)(t)= sum_(v_i in T_u_j) hat(x)_(i)(t), quad forall j= 0,1,...,k. $

và nếu biết $hat(z)(t)$, chúng ta có thể tìm $hat(x)(t)$ bằng 
$ hat(x)_i(t) = (hat(z)_(j)(t))/ abs(T_u_j), quad forall v_i in T_u_j, forall j= 0,1,...,k. $

Chúng ta kết thúc phần này với một đặc trưng về tính không rỗng của tập hợp khả thi của (PUSR-16). Gọi $ J <= (t)= {j in {1,...,k}: gamma_j <= t}$ và $J > (t) = {j in {1,...,k}: gamma_j > t}.$

*Mệnh đề 4.1*. _Tập khả thi của (PUSR-16) là không rỗng nếu
$ overline(z_0) + sum_(j in J <= (t)) min(overline(z)_j, t- gamma_j) >= sum_(i in J>(t)) (gamma_i- t). $_

*Chứng minh*
Nếu tập khả thi của (PUSR-16) không rỗng thì tồn tại một số nghiệm khả thi $z in RR^(k+1)$ thỏa mãn ràng buộc (PUSR-16), nghĩa là
$ z_0 + sum_(j in J<=(t)) z_j = - sum_(j in J > (t)) z_j. $ (19)

Từ tính khả thi của $z$, không khó để xác minh rằng vế trái của (19) bị chặn trên bởi vế trái của (18) và vế phải của (19) bị chặn dưới bởi vế phải của (18). Do đó, ta thu được (18). Ngược lại, giả sử rằng (18) không thỏa mãn. Bằng cách sử dụng các ước lượng tương tự, ta có thể thu được
$ z_0 + sum_(j in J <= (t)) z_j < - sum_(j in J > (t)) z_j. $

Điều này vi phạm ràng buộc (PUSR-16b) và do đó, tập hợp khả thi là rỗng. (chứng minh xong).

== 4.3 Giải phiên bản tham số của bài toán nâng cấp bán kính ổn định

Trong phần trước, chúng ta đã chứng minh rằng việc giải bài toán mục tiêu (USR-12) có thể được giảm xuống bằng việc giải phiên bản tham số của nó (PUSR-16) bằng cách tìm một nghiệm tối ưu $hat(z)(t)$ và mục tiêu tối ưu $beta(t)$ tương ứng với $t$. Định lý sau đây cung cấp các biểu thức dạng đóng cho cả $hat(z)(t)$ và $beta(t)$. 

*Định lý 4.3* _Nếu giá trị mục tiêu tối ưu $beta(t)$ là hữu hạn, thì nó có thể được tính dưới dạng biểu thức đóng:
$ beta(t) = 2 sum_(i=1)^k [gamma_i -t]_+ $ (20)_

_Trong đó $[alpha]_+ = max(0,alpha)$ với $alpha in RR$. Hơn nữa, một nghiệm tối ưu của (PUSR-16), gọi là $hat(z)(t)$ có thể được chọn bằng cách xem xét hai trường hợp. Nếu $overline(z_0) >= sum_(i=1)^k [gamma_i - t]_+$ thì ta chọn
$ hat(z)_(j)(t) = -(gamma_j - t), quad quad j in J > (t) quad (21a) $
$ hat(z)_(j) (t) = 0, quad quad j in J <= (t) quad quad (21b) $
$ hat(z_0)(t)= sum_(j in J > (t)) (gamma_j - t). quad quad (21c)  $
Ngược lại,
$ hat(z_j)(t)= -(gamma_j -t), quad quad j in J > (t)
(22a) $
$ hat(z_j)(t)= min(overline(z_j), underline(t)-gamma_j), quad quad j in J <= (t) (22b) $
$ hat(z_0)(t)=overline(z_0), quad (22c) $
trong đó $underline(t)$ được chọn sao cho 
$ overline(z_0)+ sum_(j in J <= (t)) min(overline(z_j), underline(t)-gamma_j)= sum_(j in J >(t)) (gamma_j - t). quad (23) $_

*Chứng minh*
Chứng minh gồm hai phần, chúng tôi chia thành hai bước. Trong bước đầu tiên, chúng tôi chứng minh rằng $2 sum_(i=1)^k [gamma_j - t]_+$ là cận dưới cho mục tiêu (PUSR-16), tức là $beta(t)>= 2 sum_(i=1)^k [gamma_j - t]_+$. Trong bước thứ hai, chúng tôi chứng minh rằng $2 sum_(i=1)^k [gamma_j-t]_+$ thực sự là giá trị nhỏ nhất của (PUSR-16) bằng cách chứng minh rằng $hat(z)(t)$, được định nghĩa trong (21) hoặc (22), thỏa mãn $norm(hat(z)(t))_1 = 2 sum_(i=1)^k [gamma_j - t]_+.$

*Bước 1.* Trực giác cho thấy, với một giá trị $t$ nào đó, ta cần phải giảm $gamma_j$ với $ j in J <= (t)$ để duy trì phương trình (PUSR-16b). Nói cách khác, $z_j$ nên là số không dương đối với $j in J>(t)$ và nên là số không âm đối với $j in J <= (t)$. Trực giác này thúc đẩy các ước lượng khéo léo sau đây để đạt được một cận dưới chặt chẽ cho hàm mục tiêu:
$ norm(z)_1 = sum_(j=0)^k abs(z_j)= abs(z_0)+ sum_(i in J <= (t)) abs(z_i)+ sum_(j in J >(t)) abs(z_i) >= z_0 + sum_(i in J <= (t)) z_j - sum_(i in J > (t)) z_j. $
Bằng điều kiện (PUSR-16b), chúng ta có $z_0 + sum_(i in J <= (t)) z_j = - sum_(i in J >(t)) z_j.$ Do đó,
$ norm(z)_1 >= -2 sum_(i in J > (t)) z_j. $
Chú ý rằng với mọi $j in J >(t)$, ta có $-z_j >= gamma_j - t >0$, do đó,
$ norm(z)_1 >= 2 sum_(j in J > (t))(gamma_j - t)= 2 sum_(j=1)^k [gamma_j - t]_+. $
Từ ước lượng trên, ta thấy rằng $ 2sum_(j in J > (t))(gamma_j -t )$ là chặn dưới của giá trị mục tiêu của (PUSR-16).

*Bước 2.* Ta biết rằng tồn tại một vài vecto khả thi $z$ của (PUSR-16) để mà
$ norm(z)_1= 2sum_(j in J >(t))(gamma_j -t). quad quad (24) $
Vecto $z$ có thể được định nghĩa như sau. Đối với tập hợp chỉ số $J > (t)$, chúng ta đặt
$ z_j = -(gamma_j - t), quad forall j in J >(t). $
Với $j in {0} union J <= (t)$, mục tiêu của ta là chọn $z_j$ là một số không âm sao cho tổng của chúng bằng $sum_(j in J > (t)) (gamma_j -t)$. Để làm điều này, hãy xem xét hai trường hợp. Nếu $z_0 >= sum_(j in J > (t))(gamma_j -t)$, thì ta có thể đơn giản đặt
$ z_0 =sum_(j in J >(t))(gamma_j -t), $
$ z_j =0, quad forall j in J <= (t). $
Ngược lại, ta có $overline(z_0) < sum_(j in J >(t))(gamma_j -t)$. Trong trường hợp này, ta đặt 
$ z_0 = overline(z_0), $
$ z_j = min (overline(z_j), underline(t)-gamma_j), quad forall j in J <= (t), $
trong đó $underline(t)$ được định nghĩa ở (23).

Bây giờ chúng ta chỉ ra sự tồn tại của $underline(t)$. Đặt $phi(t')= overline(z_0) < sum_(j in J >(t))(gamma_j -t)$ và $phi(t)>= sum_(j in J > (t))(gamma_j -t)$ vì mệnh đề 4.1. Do tính liên tục của $phi$ ngụ ý sự tồn tại của $underline(t)$. Cuối cùng, không khó để thấy rằng $z$ là một nghiệm khả thi của (PUSR-16) và thỏa (24). Bằng cách chọn $hat(z)(t)=z$, chúng ta hoàn thành chứng minh. (chứng minh xong)

Quan sát rằng với mỗi giá trị cố định của $t$, ta có thể tìm $underline(t)$ trong (23) bằng cách sử dụng tìm kiếm nhị phân vì hàm $z_0 + sum_(j in J <= (t)) min (z_j, . - gamma_j)$ là hàm tuyến tính từng khúc và không giảm. Lưu ý rằng việc đánh giá hàm này tốn chi phi $O(k)$, với $k$ là bậc của $v_1$. Do đó, các bài toán tham số (PUSR-16) có thể được giải quyết trong thời gian $O(k log k)$. Vì phép biến đổi (17) tốn chi phí $O(n)$, bài toán (PUSR-13) có thể được giải trong thời gian $O(n+k log k).$

*Giải bài toán nâng cấp bán kính ổn định*
Bây giờ chúng tôi sẽ mô tả một cách tiếp cận tổ hợp để tìm nghiệm tối ưu $w*$ của bài toán nâng cấp bán kính ổn định ban đầu (USR-10) thông qua các phép biến đổi đã được phát triển trong các tiểu mục trước đó.

Ta có $w* = w + x^* $, trong đó $x*$ là nghiệm khả thi của (USR-12). Dựa vào định lý 4.1, ta có thể chọn $x*= hat(x)(t*)$. Lưu ý rằng, ta có thể xây dựng $hat(x)(t)$ từ $hat(z)(t)$ cho bất kỳ $t$ nào bằng cách sử dụng Định lý 4.2, phương trình (17), và biểu thức của $hat(z)(t)$ được cho bởi (21) hoặc (22). Về giá trị $t*$, nó có thể được tìm thấy trong thời gian $O(k log k)$, với $k$ là bậc của $v_1$, bằng cách sử dụng tìm kiếm nhị phân vì $t* = inf{t >= 0: beta(t) <= B}$ và hàm $beta(.)$ được xác định trong Định lý 4.3 là hàm tuyến tính từng khúc và giảm dần. Xem Hình 2 để có cái nhìn tổng quan về các phép biến đổi giữa các bài toán và lời giải.

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

    content("l1.bottom",  [*Loại bỏ ràng buộc median*], anchor: "bottom", padding: 0.2)
    content("l1.top",  [*$x^* = w^* - w$*], anchor: "top", padding: 0.2)
    content("l2.left",  [*Đổi hàm mục tiêu và*

*điều kiện ngân sách*], anchor: "left", padding: 0.2)
    content("l2.right",  [*Định lý 3*], anchor: "right", padding: 0.2)
    content("l3.bottom",  [*Định lý 4.2 4.3 & (17)*], anchor: "bottom", padding: 0.2)
    content("l3.top",  [*Giảm chiều*], anchor: "top", padding: 0.2)
  })]

Hình 2. Các phép biến đổi của bốn bài toán nâng cấp. Mỗi hộp chứa một bài toán và nghiệm tối ưu của nó. Mỗi mũi tên đại diện cho phép biến đổi giữa các bài toán cùng với những kết quả chính kết nối chúng.

Nhớ rằng việc giải quyết bài toán (PUSR_13) tốn chi phí $O(n + k log k)$ và việc tìm kiếm $t*$ có thể thực hiện trong $O(k log k)$, do đó độ phức tạp tổng thể của việc giải bài toán (USR-10) là $O(n + k log k)$. 

*Định lý 4.4* _Bài toán nâng cấp cận dưới của bán kính ổn định cho điểm trung vị trên đồ thị cây (USR-10) có thể được giải quyết trong thời gian $O(n + k log k )$, trong đó $n$ là số đỉnh của cây và $k$ là bậc của điểm trung vị $v_1$._

Cuối cùng, ta kết thúc mục này bằng ví dụ minh họa cho những bước chính để giải quyết bài toán (USR-10).

*Ví dụ 4.1* Xem xét bài toán (USR-12) với ngân sách $B = 0.36$, mức độ nhiễu $epsilon_0 = 0.05$ và cây có trọng số như hình 1. Đặt $u_0 = v_1$, $u_1 = v_2$ $u_2 = v_3$ và $u_3 = v_4$. Nhớ rằng $gamma_j = angle.l w, bb(1)_T_u_j angle.r $ với $j= 0,1,2,3$, ta có $gamma_1 = 0.33$, $gamma_2 = 0.12$ và $gamma_3 = 0.45$. Hơn nữa $ beta(t)= 2([gamma_1 - t]_+ + [gamma_2 - t]_+ + [gamma_3 - t]_+) $.

Bằng (15), ta có $t^*=inf{t: beta(t) <= B}= 0.3$. Trong trường hợp này, ta có $beta(t^*)=B$. Bởi vì $overline(z_0)= epsilon_0 = 0.05 < beta(t^*)/2 =0.18$, ta có thể chọn $hat(z)(t^*)$ dựa vào (22), chú ý rằng $J > (t^*)= {1,3}$, $J <= (t^*)= {2}$ và ta có
$ hat(z)(t^*)=(0.05, -0.03, 0.13, -0.15). $
Bằng (17), ta có $ hat(x)(t^*)=(0.05, -0.01, 0.065, -0,05, -0.01, -0,01, 0.065, -0.05, -0.05). $ 

Dựa vào định lý 4.1, ta có thể chọn $x^* = hat(x)(t^*)$. Bởi vì $w^* = w+x$, ta được
$ w^* = (0.15, 0.12, 0.125, 0.1, 0.09, 0.09, 0.125, 0.1, 0.15, 0.05). $
Chặn dưới lớn nhất của bán kính ổn định sau khi được nâng cấp là $underline(R)(w^*)= 0.4/9$. 

Trọng số đỉnh trên cây được cải thiện như ở hình 3

#import "@preview/cetz:0.1.2": canvas, plot
#import "@preview/cetz:0.2.2"
#import "@preview/cetz:0.1.2"

#align(center)[#canvas(length: 10%, {
  import cetz.draw: *

  let y = 2 
  let x = 4
  let y-space = 1
  let h=1.4

  circle((0*h,3), radius: 0.05,fill:black, name: "v1") 
  content("v1.bottom", $v_1 (0.15)$, anchor: "left", padding: 0.2)

  circle((-2*h, 2), radius: 0.05, fill: black, name: "v2") 
  content("v2.bottom", $v_2 (0.12)$, anchor: "left", padding: 0.2)

  circle((-3*h, 1), radius: 0.05,fill:black, name: "v5") 
  content("v5.bottom", $v_5 (0.09)$, anchor: "left", padding: 0.2)

  circle((-1*h, 1), radius: 0.05,fill:black, name: "v6") 
  content("v6.bottom", $v_6 (0.09)$, anchor: "left", padding: 0.2)

  circle((0*h, 2), radius: 0.05, fill: black, name: "v3") 
  content("v3.bottom", $v_3 (0.125)$, anchor: "left", padding: 0.2)

  circle((0*h, 1), radius: 0.05, fill: black, name: "v7") 
  content("v7.bottom", $v_7 (0.125)$, anchor: "left", padding: 0.2)

  circle((2*h, 2), radius: 0.05, fill: black, name: "v4") 
  content("v4.bottom", $v_4 (0.1)$, anchor: "left", padding: 0.2)

  circle((1*h, 1), radius: 0.05, fill: black, name: "v8") 
  content("v8.bottom", $v_8 (0.15)$, anchor: "left", padding: 0.2)
  circle((3*h, 1), radius: 0.05, fill:black, name: "v9") 
  content("v9.bottom", $v_9 (0.05)$, anchor: "left", padding: 0.2)
  
  line("v1", "v2")
  line("v1", "v3")
  line("v1", "v4")
  line("v2", "v5")
  line("v2", "v6")
  line("v3", "v7")
  line("v4", "v8")
  line("v4", "v9")    }
)]

]