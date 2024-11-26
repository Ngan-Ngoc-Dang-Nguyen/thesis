#include "../tools/multi-section-ref.typ"
// #import "../tools/macros.typ": eqref, remark-Le, delete-Le, add-Le, remark-Ngan, delete-Ngan, add-Ngan
// #import "../typst-orange.typ": theorem, proof, lemma, proposition, corollary, example, definition, 
#import "../tools/macros.typ": eqref, remark-Le, delete-Le, add-Le, remark-Ngan, delete-Ngan, add-Ngan, theorem, definition, proposition, lemma, proof, example
#import "@preview/cetz:0.1.2": canvas, plot
#import "@preview/cetz:0.1.2"
#import "@preview/equate:0.2.1": equate
#show: equate.with(breakable: true, sub-numbering: true)
#set math.equation(numbering: "(1.1)", supplement: "Eq.")
#let USR1 = [(USR1)]
#let USR2 = [(USR2)]
#let PUSR1 = [(PUSR1)]
#let PUSR2 = [(PUSR2)]


// #par(justify: true)[
// = Nâng cấp bán kính ổn định của điểm 1-median
// = NÂNG CẤP BÁN KÍNH ỔN ĐỊNH CỦA ĐIỂM 1-MEDIAN

// $ x^2 + y^2 = z^2 $ <eq:pytago>

// Xét pt pytago @eq:pytago
==  Bài toán nâng cấp cận dưới bán kính ổn định 

Như đã đề cập, điểm 1-median đóng vai trò quan trọng trong mạng lưới đồ thị tổng quát, đặc biệt là đồ thị cây. Bán kính ổn định của điểm 1-median phản ánh mức độ thay đổi vị trí của nó khi trọng số các đỉnh trên đồ thị biến động. Việc nâng cao bán kính ổn định không chỉ giúp tăng tính ổn định mà còn mở ra nhiều ứng dụng thực tiễn hữu ích. Vì vậy, phần này sẽ tập trung vào bài toán nâng cấp bán kính ổn định của điểm 1-median, cụ thể là nghiên cứu và cải thiện cận dưới của bán kính này.
// Trong phần này, đầu tiên, chúng tôi sẽ xác định vấn đề chính của mình trong Mục 4.1. Tiếp theo, chúng tôi giới thiệu các phiên bản quyết định của bài toán và thiết lập mối quan hệ giữa chúng trong Mục 4.2. Cuối cùng, chúng tôi cho thấy rằng các vấn đề quyết định có thể được giải quyết dưới dạng đóng, từ đó đưa ra một phương pháp tiếp cận tổ hợp hiệu quả để giải quyết vấn đề lần lượt trong mục 4.3 và 4.4. 

// Trong phần này, đầu tiên, chúng tôi sẽ xác định vấn đề chính của mình trong Mục 4.1. Tiếp theo, chúng tôi giới thiệu các phiên bản quyết định của bài toán và thiết lập mối quan hệ giữa chúng trong Mục 4.2. Cuối cùng, chúng tôi cho thấy rằng các vấn đề quyết định có thể được giải quyết dưới dạng đóng, từ đó đưa ra một phương pháp tiếp cận tổ hợp hiệu quả để giải quyết vấn đề lần lượt trong mục 4.3 và 4.4. 

// *4.1 Công thức*
=== Mô hình hóa bài toán

// Rõ ràng các biến đổi trong trọng số đỉnh trên cây có thể dẫn đến sự bất ổn định trong vị trí trung vị đã thiết lập. Trong phần này, chúng tôi nhằm mục đích tăng cường độ bền vững của vị trí trung vị bằng cách cải thiện bán kính ổn định $R(w)$. Do tính chất phức tạp của $R(w)$, thay vào đó chúng tôi tập trung vào việc nâng cấp chặn dưới của $R(w)$. Bây giờ, chúng tôi sẽ nghiên cứu chi tiết mô hình

Giả sử $v_1 in V $ là điểm 1-median trên cây $T$ tương ứng với trọng số $w in RR_n^+$ cho trước, thỏa mãn điều kiện tổng trọng số đỉnh có độ lớn không đổi, nghĩa là thỏa mãn điều kiện #eqref(<eq:dk>). Với một ngân sách $B >= 0 $, mục tiêu của ta là điều chỉnh trọng số từ $w$ thành một vecto trọng số $tilde(w) in RR_n^+$ trong giới hạn ngân sách, sao cho:
1. $v_1$ vẫn là điểm 1-median.

2. Chặn dưới $underline(R)(tilde(w))$ là lớn nhất. 

Trong đó, chi phí thay đổi trọng số từ $w$ thành $tilde(w)$ được đo bằng chuẩn $"L1"$, tức là $norm(w - tilde(w))_1$. Đồng thời, tổng trọng số trên cây vẫn giữ nguyên giá trị, hay nói cách khác $sum_(i=1) ^n tilde(w) = 1$. Ngoài ra, vecto trọng số mới $tilde(w)$ không được chênh lệch quá lớn so với $w$ ban đầu, cụ thể là $tilde(w) in [w-epsilon_0, w + epsilon_0]$, với một hằng số $epsilon_0 >0 $. 

Bài toán này được gọi là nâng cấp bán kính ổn định (USR - Upgrading Stability Radius) của điểm 1-median $v_1$ với dữ liệu đầu vào là trọng số ban đầu $w$.

Khi đó, mô hình của bài toán $"(USR)"$ có thể được viết lại như sau:
// $
// max quad & underline(R)(tilde(w)) quad quad quad quad quad quad quad quad quad quad quad #text(blue)[(USR-20)]\ 

// "s.t." quad & norm(tilde(w)-w)_1 <= B quad quad quad quad quad quad quad("USR"-20a)\

//  & v_1 "is 1-median w.r.t" tilde(w) quad quad quad quad quad quad quad ("USR" - 20b)\

//  & sum^n_(i=1) tilde(w)_i = 1 quad quad quad quad quad quad quad ("USR" -20c)\

//  & norm(tilde(w)-w)_infinity <= epsilon_0 quad quad quad quad quad quad quad ("USR" - 20d)
// $

// $
// max quad & underline(R)(tilde(w)) &  #h(1fr) #text(blue)[(USR-20)]\ 

// "s.t." quad & norm(tilde(w)-w)_1 <= B & #h(1fr) quad("USR"-20a)\

//  & v_1 "is 1-median w.r.t" tilde(w) & #h(1fr) ("USR" - 20b)\

//  & sum^n_(i=1) tilde(w)_i = 1 & #h(1fr) ("USR" -20c)\

//  & norm(tilde(w)-w)_infinity <= epsilon_0 & #h(1fr) ("USR" - 20d)
// $ 

$
"(USR1)" quad quad max quad & underline(R)(tilde(w)) \ 

"s.t." quad & norm(tilde(w)-w)_1 <= B \

 & v_1 "is 1-median w.r.t" tilde(w) \

 & sum^n_(i=1) tilde(w)_i = 1 \

 & norm(tilde(w)-w)_infinity <= epsilon_0 
$ 

Đến đây, có thể nhận thấy rằng bài toán đang xem xét chứa nhiều điều kiện ràng buộc, khiến việc giải quyết trở nên phức tạp. Do đó, để đơn giản hóa, chúng ta sẽ tìm cách giảm bớt các ràng buộc và điều chỉnh một số biến, nhưng vẫn đảm bảo mục tiêu tối ưu ban đầu được duy trì. Cụ thể, các thay đổi sẽ được thực hiện như sau:

1. Viết lại bài toán $max$ thành $min$.

2. Loại bỏ ràng buộc (USR - 20b).

3. Thay đổi biến từ vecto trọng số $tilde(w)$ sang $x$, trong đó $x$ được gọi là vecto điều chỉnh, nghĩa là $x = tilde(w) - w.$

// *Định lý 3.1* --> @thm-lower-bound-SR 

Dựa vào @thm-lower-bound-SR, bài toán tối ưu hóa $underline(R)(w)$ có thể được chuyển đổi thành một bài toán tối thiểu hóa tương đương như sau:

$ max_tilde(w) underline(R)(tilde(w)) = max_tilde(w) min_(u in N(v_1)) 1/n (1- 2 angle.l tilde(w), bb(1)_T_u angle.r) = 1/n -2/n min_tilde(w) max_( u in N(v_1)) angle.l tilde(w), bb(1)_T_u angle.r. $

Tiếp theo, giả sử $w^*$ là nghiệm tối ưu của bài (USR-20), dễ thấy
$ max_(u in N(v_1)) angle.l w^*, bb(1)_T_u angle.r <= max_(u in N(v_1)) angle.l w, bb(1)_T_u angle.r <= 1/2. $

//giải thích ra tại sao.
// (USR-20b)
Từ đó, ta thấy rằng $v_1$ cũng là điểm 1-median đối với $w^*$. Do đó, ràng buộc về tính tối ưu trong #USR1 là dư thừa và có thể loại bỏ. Nói cách khác, nếu $w^*$ là nghiệm tối ưu của bài toán (USR-20) thì nó hiển nhiên thỏa mãn ràng buộc (USR-20b).

Cuối cùng, đặt $ x= tilde(w) - w$ là vecto điều chỉnh. 

Khi đó, bài toán (USR-20) có thể được viết lại như sau:

// $
//     "(USR2)" quad quad min quad & max_(u in N(v_1)) angle.l w + x, bb(1)_T_u angle.r quad quad  #text(blue)[(USR-23)]\ 

//     "s.t." quad & norm(x)_1 <= B  quad quad quad quad quad quad quad  "USR-23a"\

//     & sum^n_(i=1) x_i = 0 quad quad quad quad quad quad quad  "USR-23b"\

//     & x_i in [-epsilon_0; epsilon_0], forall i = 1,...,n quad quad quad quad quad quad quad  "USR-23c"
// $ <eq:23>
$
    "(USR2)" quad quad min quad & max_(u in N(v_1)) angle.l w + x, bb(1)_T_u angle.r \ 

    "s.t." quad & norm(x)_1 <= B \

    & sum^n_(i=1) x_i = 0 \

    & x_i in [-epsilon_0; epsilon_0], forall i = 1,...,n 
$ <eq:23>
// === Giải thuật của bài toán nâng cấp bán kính ổn định 
// == Giải thuật 
// === Giải bài toán tham số



===  Tham số hóa bài toán
// nâng cấp bán kính ổn định

Sau khi chuyển đổi sang bài toán đơn giản hơn #eqref(<eq:23>), phần này sẽ tập trung vào việc giải quyết #eqref(<eq:23>). Dễ dàng nhận thấy bài toán này có thể được biểu diễn dưới dạng một bài toán quy hoạch tuyến tính với không gian $n$ chiều và $n+2$ ràng buộc. Nhờ vậy, nó có thể được giải bằng các phương pháp kinh điển như thuật toán đơn hình hoặc các thuật toán thời gian đa thức do @karmarkar1984new và @megiddo1984linear đề xuất.

Tuy nhiên, khi số chiều tăng lên, thời gian tính toán tăng đáng kể. Điều này đặc biệt quan trọng trong thực tế, khi các đồ thị cây được phân tích có thể chứa hàng trăm hoặc thậm chí hàng chục nghìn đỉnh, khiến việc giải bài toán trở nên không khả thi bằng các phương pháp thông thường. Do đó, trong phần này, tôi sẽ đề xuất một thuật toán tổ hợp nhằm giải quyết bài toán một cách hiệu quả hơn.

Việc giải quyết bài toán #eqref(<eq:23>) thực chất là trả lời cho câu hỏi: _"Giá trị mục tiêu nhỏ nhất có thể đạt được trong ngân sách $B$ là bao nhiêu?"_. Tuy nhiên, thay vì tập trung vào câu hỏi này, ta có thể chuyển sang một câu hỏi có mối liên hệ chặt chẽ khác như sau: _"Với một giá trị mục tiêu $t$ cho trước, ngân sách tối thiểu cần thiết để đạt được giá trị mục tiêu không lớn hơn $t$ là bao nhiêu?"_. Câu hỏi này có thể được diễn đạt dưới dạng bài toán sau:

// $
//     min quad & norm(x)_1 quad quad quad quad quad quad #text(blue)[(PUSR-13)]\

//     "s.t." quad & max_(u in N(v_1)) angle.l w + x, bb(1)_T_u angle.r <= t quad quad quad "PUSR-13a"\

//     & sum^n_(i=1) x_i = 0 quad quad quad "PUSR-13b"\

//     & x_i in [-epsilon_0; epsilon_0], forall i = 1,...,n quad quad quad "PUSR-13b"
//     $
//     <eq:24>

$
    "(PUSR1)" quad quad min quad & norm(x)_1 \

    "s.t." quad & max_(u in N(v_1)) angle.l w + x, bb(1)_T_u angle.r <= t \

    & sum^n_(i=1) x_i = 0 \

    & x_i in [-epsilon_0; epsilon_0], forall i = 1,...,n 
$ <eq:24>

Khi đó, ta gọi bài toán này là _phiên bản tham số của bài toán nâng cấp bán kính ổn định (PUSR)_. Thoạt nhìn, bài toán (PUSR-13) #eqref(<eq:24>) được xây dựng từ (USR-23) #eqref(<eq:23>) bằng cách hoán đổi vai trò giữa mục tiêu và ràng buộc ngân sách. Với các bổ đề và định lý sẽ được trình bày ở phần tiếp theo, độc giả sẽ thấy rằng việc giải bài toán #eqref(<eq:24>) không chỉ đơn giản hơn so với #eqref(<eq:23>), mà còn cho phép ta dễ dàng tìm lại được nghiệm của #eqref(<eq:23>) khi đã tìm được nghiệm của #eqref(<eq:24>).

Bằng trực quan, ta có thể thấy rằng mối liên hệ giữa #eqref(<eq:23>) và #eqref(<eq:24>) như sau: 

1. Nếu ngân sách tối thiểu cần thiết để đạt được giá trị mục tiêu không lớn hơn $t$ không vượt quá $B$, thì việc tăng ngân sách lên $B$ sẽ cho phép giảm $t$ để đạt được giá trị mục tiêu nhỏ nhất của bài toán ban đầu. 

2. Ngược lại, khi giá trị $t$ vẫn còn lớn hơn hoặc bằng giá trị mục tiêu tối ưu $t^*$ thì ta vẫn chưa sử dụng hết ngân sách $B$. 

Nói cách khác, giải quyết bài toán mới này cho phép chúng ta xác định xem $t$ có lớn hơn giá trị mục tiêu nhỏ nhất của bài toán gốc hay chưa.

Từ quan sát thú vị này, ta có được bổ đề bên dưới:

#lemma[Ta có 
$ beta(t) <= B <=> t>= t^* $ trong đó $beta(t)$ là ngân sách cần thiết nhỏ nhất để đạt được giá trị $t$ và $t^*$ là giá trị mục tiêu tối ưu của bài toán #eqref(<eq:23>).
] <thm-beta-t>

Để chứng minh bổ đề này, trước hết ta xem xét một số ký hiệu liên quan. Với ngân sách cố định $B$, giả sử $x^*$ và $t^*$ lần lượt là nghiệm tối ưu và giá trị mục tiêu tối ưu của bài toán #eqref(<eq:23>). Với mỗi tham số $t$ cho trước, giả sử $hat(x)(t)$ và $beta(t)$ lần lượt là nghiệm tối ưu và ngân sách tối thiểu tương ứng trong #eqref(<eq:24>). Cần lưu ý rằng, $beta(dot)$ là một hàm không giảm trên miền xác định của nó và nhận giá trị $+infinity$ nếu tập khả thi của #eqref(<eq:24>) rỗng. Cuối cùng, ta đặt $P(x)= max_(u in N(v_1)) angle.l w + x, bb(1)_T_u angle.r $ là hàm mục tiêu của #eqref(<eq:23>).


// Để phát biểu bổ đề, chúng ta hãy giới thiệu một số ký hiệu bổ sung. Gọi $P(x)= max_(u in N(v_1)) angle.l w + x, bb(1)_T_u angle.r $ là hàm mục tiêu của (USR-12). Chúng ta cũng ký hiệu $x^*$ là nghiệm tối ưu và $t^*$ là giá trị mục tiêu tối ưu của (USR-12). Khi đó, $P(x^*)= t^*$. Tiếp theo, gọi $hat(x)(t)$ là nghiệm tối ưu và $beta(t)$ là giá trị mục tiêu tối ưu của (PUSR-13) tương ứng với tham số $t$. Nếu tập hợp nghiệm khả thi của (PUSR-13) rỗng, chúng ta đặt $beta(t)= + infinity$. Rõ ràng bằng $beta(.)$ là một hàm không giảm trên miền của nó. Mối quan hệ giữa $(t,beta(t))$ và $(t^*,B)$ được thiết lập như sau:

// == Bổ đề 4.1 
// *Bổ đề 4.1*
// #lemma[Ta có 
// $ beta(t) <= B <=> t>= t^* $
// ]

// *Chứng minh*
#proof[

Chứng minh gồm hai chiều, ta bắt đầu với chiều đầu tiên.

Nếu $beta(t) <= B$, thì $hat(x)(t)$ là một nghiệm khả thi ứng với #eqref(<eq:24>), do đó, $P(hat(x)(t)) >= P(x^*)$. Vì thế, $t >= P(hat(x)(t)) >= P(x^*) = t^*$, hay nói cách khác, ta có $t >= t^*$.

Ta tiến hành chứng minh chiều ngược lại. Giả sử rằng $t >= t^*$. Bởi vì $t^* = P(x^*)$, suy ra $P(x^*) <= t$. Do đó, $norm(hat(x)(t))_1 <= norm(x^*)_1$. Vì $x^*$ là nghiệm tối ưu đối với #eqref(<eq:24>) nên $norm(x^*)_1 <= B$. Vì vậy, $beta(t)= norm(hat(x)(t))_1 <= norm(x^*)_1 <= B$. Ta hoàn thành chứng minh.]

// *Bổ đề 4.1*--> @thm-beta-t

Từ @thm-beta-t, ta có thể thấy rằng 
$ beta(t^*) <= B $. <eq:26>

Trong phần tiếp theo, chúng ta sẽ khai thác @thm-beta-t xây dựng một sự chuyển đổi từ $(hat(x)(t), beta(t))$ của bài toán #eqref(<eq:23>) sang $(x^*, t^*)$ của #eqref(<eq:24>).

// *Định lý 4.1*

#theorem[_Giá trị hàm mục tiêu $t^*$ của #eqref(<eq:23>) được tính_
$ t^* = inf{t: beta(t) <= B}. $
_và $hat(x)(t^*)$ là nghiệm tối ưu của #eqref(<eq:23>)._] <thm-computing-topt>

// <eq:27>

// *Chứng minh* 

#proof[
Từ @thm-beta-t, ta có thể thấy rằng $t^* <= inf{t: beta(t)<= B}$. Nếu $t^* < inf{t: beta(t) <= B}$ thì dễ thấy rằng $beta(t^*) > B$, điều này mâu thuẫn với #eqref(<eq:26>). Vì thế, $t^*= inf{t: beta(t)<= B}$.

Hơn nữa từ #eqref(<eq:26>), ta biết rằng $hat(x)(t^*)$ là một nghiệm khả thi của #eqref(<eq:23>). Do đó, $ P(hat(x)(t^*)) >= P(x^*) = t^* $. 

Hơn nữa, tính khả thi của $hat(t^*)$ tương ứng với (PUSR-24a) có nghĩa là $ t^* >= P(hat(x)(t^*)) $.

Từ đây, ta được $ hat(x)(t^*) = t^* $ nghĩa là $hat(x)(t^*)$ là nghiệm tối ưu của #eqref(<eq:23>).]

// *Định lý 3.3* --> @thm-computing-topt

Từ @thm-computing-topt, có thể thấy rằng nếu ta có thể giải được bài toán (PUSR-24) #eqref(<eq:24>), tức là tìm được $beta(t)$ và $hat(x)(t)$ với $t$ bất kỳ, thì ta có thể xây dựng một nghiệm tối ưu $x^* = hat(x)(t^*)$, trong đó $t^*$ có thể được tính bằng @thm-computing-topt. 

Để giải bài toán (PUSR-24) #eqref(<eq:24>) một cách đơn giản và nhanh chóng, trước hết, tôi xin đề xuất một phép đổi biến nhằm giải chiều bài toán. Để thực hiện được điều này, ta cần lưu ý rằng, tồn tại một nghiệm tối ưu mà trong đó các giá trị của $x_i$ trong mỗi cây con $T_u$, với $u in N(v_1)$ là bằng nhau. Do đó, ta có thể đối thành biến mới, trong đó mỗi biến đại diện cho tổng của $x_i$ đối với các đỉnh $v_i$ thuộc cây con $T_u$. Bằng cách đổi biến như trên, ta có thể giảm chiều bài toán, cụ thể giảm từ $n$ chiều về $k$ chiều, với $k$ là bậc của đỉnh $v_1$. Khi đó, số chiều của bài toán được giảm một cách đáng kể.

Bây giờ, ta sẽ đi vào cụ thể chi tiết cách đổi biến cho bài toán. Đặt $N(v_1)={u_1,...,u_k}$ nghĩa là $N(v_1)$ là tập hợp tất cả các đỉnh liền kề với $v_1$, $u_0=v_1$ và $T_u_0={v_1}$. Gọi $gamma_j= angle.l w, bb(1)_T_u_j angle.r$ là tổng trọng số đỉnh của cây con lấy gốc tại $u_j$, $j=0,1,...,k$. Cho $x in RR^n$, ta định nghĩa vecto mới $z, overline(z) in RR^(k+1)$, trong đó thành phần thứ $j$ với $j=0,1,...k$ được xác định như sau:

$ z_j= angle.l x, bb(1)_T_u_j angle.r, $
$ overline(z)_j=epsilon_0.abs(T_u_j). $

Từ cách đổi biến như trên, bài toán #eqref(<eq:24>) ban đầu trở thành bài toán với số chiều giảm đi rất nhiều, cụ thể:

// $
//     min quad & sum_(j=0)^k abs(z_j) quad quad quad quad #text(blue)[(PUSR-33)]\

//     "s.t." quad & max_(j=1,...,k) (gamma_j + z_j) <= t    quad quad ("PUSR-33a")\

//     & sum^k_(j=1) z_j = 0 quad quad ("PUSR-33b")\

//     & z_j in [-overline(z)_j; overline(z)_j], forall j = 0,1,...,k quad quad ("PUSR-33c")

//     $
//     <eq:33>

$
    "(PUSR2)" quad quad min quad & sum_(j=0)^k abs(z_j) \

    "s.t." quad & max_(j=1,...,k) (gamma_j + z_j) <= t    \

    & sum^k_(j=1) z_j = 0 \

    & z_j in [-overline(z)_j; overline(z)_j], forall j = 0,1,...,k 
$ <eq:33>

    Kết luận sau khẳng định rằng, từ nghiệm của bài toán (PUSR-33) #eqref(<eq:33>), ta có thể tìm lại nghiệm của (PUSR-24) #eqref(<eq:24>) mà không làm thay đổi giá trị mục tiêu.

    #proposition[ Bài toán #eqref(<eq:33>) và #eqref(<eq:24>) có cùng giá trị mục tiêu $beta(t)$. Hơn nữa, nếu $hat(z)(t)$ là nghiệm tối ưu của #eqref(<eq:33>), thì nghiệm tối ưu của bài toán #eqref(<eq:24>) được xác định như sau:

    $ hat(x)_i(t) = (hat(z)_(j)(t))/ abs(T_u_j), quad forall v_i in T_u_j, forall j= 0,1,...,k. $
    
    ]

// (cần viết kỹ lại)

Tiếp theo, ta sẽ xem xét điều kiện để tập nghiệm khả thi của #eqref(<eq:33>) không rỗng. Giả sử:
$ J <= (t)={j in {i,...,k}: gamma_j <=t}
$
$ J > (t)={j in {1,...,k}: gamma_j >t} $

// *Định lý 4.2*

// #theorem[Tồn tại một nghiệm tối ưu $hat(x)(t)$ của (PUSR-13) mà gán cùng một giá trị cho $hat(x)_(i)(t)$ đối với tất cả các đỉnh $v_i$ trong mỗi cây con $T_u$, với $ u in N(v_1)$.]

// // *Chứng minh*
// #proof[
// Giả sử $hat(x)(t)$ là một nghiệm tối ưu bất kỳ của (PUSR-13). Khi đó, ta có thể đạt được nghiệm tối ưu mong muốn bằng cách, đối với mọi $ u in N(v_1)$,
// $ hat(x)_(i)(t) = 1/ abs(T_u) sum_(v_i in T_u) hat(x)_(i)(t), quad quad forall v_i in T_u. $ (chứng minh xong)
// ]

// Từ định lý *4.2*, chúng ta nhận thấy rằng thay vì tìm kiếm vecto điều chỉnh tối ưu $hat(x)(t)$, chúng ta có thể tập trung vào tổng trọng chỉnh sửa trên mỗi cây con $T_u_j$. Quan sát này cho phép chúng ta giảm số chiều của bài toán (PUSR-13) từ $n$ xuống $k+1$, trong đó $k$ là bậc của điểm trung vị $v_1$. Giả sử $N(v_1)={u_1,u_2,...,u_k}$, $u_0 = v_1$ và $T_u_O = {v_1}$. Bây giờ chúng ta định nghĩa vecto mới $z in RR_+^(k+1)$ có chặn trên $overline(z) in RR_+^(k+1)$. Tiếp theo, ta đặt $z_0 = x_1$ là phép chỉnh sửa liên quan đến điểm trung vị $v_1$ và $z_0 = epsilon_0$ là giới hạn trên của nó. Đặt $z_j = angle.l x, bb(1)_T_u_j angle.r$ là tổng trọng số chỉnh sửa của cây con $T_u_j$ và $z_j = epsilon_0 abs(T_u_j)$ là chặn trên cho $z_j$, với $j=1,...,k$. Lưu ý rằng, $norm(x)_1 >= norm(z)_1$ và sự bằng nhau xảy ra nếu các giá trị $x_i$ cùng dấu cho các đỉnh $v_i$ thuộc cùng một cây con $T_u_j$. Ký hiệu $gamma_j = angle.l w, bb(1)_T_u_j angle.r$ là tổng trọng số của cây con $T_u_j$ với $j=1,...,k.$

// Với các ký hiệu mới, thay vì xem xét bài toán (PUSR-13), người ta có thể tập trung vào bài toán sau, với số chiều nhỏ hơn bằng cách giữ nguyên tất cả các ràng buộc, nhưng thay thế $norm(x)_1$ bằng giới hạn dưới của nó $norm(z)_1:$

// $
//     min quad & sum_(j=0)^k abs(z_j) quad quad quad quad #text(blue)[(PUSR-16)]\

//     "s.t." quad & max_(j=1,...,k) (gamma_j + z_j) <= t    quad quad ("PUSR-16a")\

//     & sum^k_(j=1) z_j = 0 quad quad ("PUSR-16b")\

//     & z_j in [-overline(z)_j; overline(z)_j], forall j = 0,1,...,k quad quad ("PUSR-16c")
//     $

// Giả sử $hat(z)(t)$ là nghiệm tối ưu của (PUSR-16). Lưu ý rằng $beta(t)$ cũng là giá trị mục tiêu tối ưu của (PUSR-16). Điều quan trọng cần lưu ý là (PUSR-13) và (PUSR-16) "tương đương" theo nghĩa nếu biết $hat(x)(t)$ như được mô tả trong Định lý 4.2, thì ta có thể xây dựng $hat(z)(t)$ và nếu biết $hat(z)(t)$ thì ta có thể tìm ra $hat(x)(t)$ bằng cách
// $ hat(z)_(j)(t)= sum_(v_i in T_u_j) hat(x)_(i)(t), quad forall j= 0,1,...,k. $

// và nếu biết $hat(z)(t)$, chúng ta có thể tìm $hat(x)(t)$ bằng 
// $ hat(x)_i(t) = (hat(z)_(j)(t))/ abs(T_u_j), quad forall v_i in T_u_j, forall j= 0,1,...,k. $

// Chúng ta kết thúc phần này với một đặc trưng về tính không rỗng của tập hợp khả thi của (PUSR-16). Gọi $ J <= (t)= {j in {1,...,k}: gamma_j <= t}$ và $J > (t) = {j in {1,...,k}: gamma_j > t}.$

// // *Mệnh đề 4.1*.

#proposition[Tập khả thi của (PUSR-33) #eqref(<eq:33>) là không rỗng nếu
$ overline(z_0) + sum_(j in J <= (t)) min(overline(z)_j, t- gamma_j) >= sum_(i in J>(t)) (gamma_i- t). $]

// *Chứng minh*
#proof[
Nếu tập khả thi của (PUSR-16) không rỗng thì tồn tại một số nghiệm khả thi $z in RR^(k+1)$ thỏa mãn ràng buộc (PUSR-16), nghĩa là
$ z_0 + sum_(j in J<=(t)) z_j = - sum_(j in J > (t)) z_j. $ (19)

Từ tính khả thi của $z$, không khó để xác minh rằng vế trái của (19) bị chặn trên bởi vế trái của (18) và vế phải của (19) bị chặn dưới bởi vế phải của (18). Do đó, ta thu được (18). Ngược lại, giả sử rằng (18) không thỏa mãn. Bằng cách sử dụng các ước lượng tương tự, ta có thể thu được
$ z_0 + sum_(j in J <= (t)) z_j < - sum_(j in J > (t)) z_j. $

Điều này vi phạm ràng buộc (PUSR-16b) và do đó, tập hợp khả thi là rỗng. (chứng minh xong).]

// == 4.3 Giải phiên bản tham số của bài toán nâng cấp bán kính ổn định
== Giải thuật 

Trong phần trước, chúng ta đã chứng minh rằng việc giải bài toán mục tiêu (USR-12) có thể được đưa về giải bài toán tham số của nó (PUSR-16) bằng cách tìm một nghiệm tối ưu $hat(z)(t)$ và mục tiêu tối ưu $beta(t)$ tương ứng với $t$. Định lý sau đây cung cấp các biểu thức dạng đóng cho cả $hat(z)(t)$ và $beta(t)$. 

// *Định lý 4.3* 

=== Giải bài toán tham số
#remark-Le[Xem lại cách trình bày lại định lý này trong bản mới của bài báo]
Hơn nữa, một nghiệm tối ưu của (PUSR-16), gọi là $hat(z)(t)$ có thể được chọn bằng cách xem xét hai trường hợp. Nếu $overline(z_0) >= sum_(i=1)^k [gamma_i - t]_+$ thì ta chọn
$ hat(z)_(j)(t) = -(gamma_j - t), quad quad j in J > (t) quad (21a) $
$ hat(z)_(j) (t) = 0, quad quad j in J <= (t) quad quad (21b) $
$ hat(z_0)(t)= sum_(j in J > (t)) (gamma_j - t). quad quad (21c)  $
Ngược lại,
$ hat(z_j)(t)= -(gamma_j -t), quad quad j in J > (t)
(22a) $
$ hat(z_j)(t)= min(overline(z_j), underline(t)-gamma_j), quad quad j in J <= (t) (22b) $
$ hat(z_0)(t)=overline(z_0), quad (22c) $
trong đó $underline(t)$ được chọn sao cho 
$ overline(z_0)+ sum_(j in J <= (t)) min(overline(z_j), underline(t)-gamma_j)= sum_(j in J >(t)) (gamma_j - t). quad (23) $


#theorem[Nếu giá trị mục tiêu tối ưu $beta(t)$ là hữu hạn, thì nó có thể được tính dưới dạng biểu thức đóng:
$ beta(t) = 2 sum_(i=1)^k [gamma_i -t]_+ $

Trong đó $[alpha]_+ = max(0,alpha)$ với $alpha in RR$. ]



// *Chứng minh*
#proof[
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

Bây giờ chúng ta chỉ ra sự tồn tại của $underline(t)$. Đặt $phi(t')= overline(z_0) < sum_(j in J >(t))(gamma_j -t)$ và $phi(t)>= sum_(j in J > (t))(gamma_j -t)$ vì mệnh đề 4.1. Do tính liên tục của $phi$ ngụ ý sự tồn tại của $underline(t)$. Cuối cùng, không khó để thấy rằng $z$ là một nghiệm khả thi của (PUSR-16) và thỏa (24). Bằng cách chọn $hat(z)(t)=z$, chúng ta hoàn thành chứng minh. (chứng minh xong)]

Quan sát rằng với mỗi giá trị cố định của $t$, ta có thể tìm $underline(t)$ trong (23) bằng cách sử dụng tìm kiếm nhị phân vì hàm $z_0 + sum_(j in J <= (t)) min (z_j, . - gamma_j)$ là hàm tuyến tính từng khúc và không giảm. Lưu ý rằng việc đánh giá hàm này tốn chi phi $O(k)$, với $k$ là bậc của $v_1$. Do đó, các bài toán tham số (PUSR-16) có thể được giải quyết trong thời gian $O(k log k)$. Vì phép biến đổi (17) tốn chi phí $O(n)$, bài toán (PUSR-13) có thể được giải trong thời gian $O(n+k log k).$

=== Giải bài toán nâng cấp cận dưới bán kính ổn định

Bây giờ chúng tôi sẽ mô tả một cách tiếp cận tổ hợp để tìm nghiệm tối ưu $w^*$ của bài toán nâng cấp bán kính ổn định ban đầu (USR-10) thông qua các phép biến đổi đã được phát triển trong các tiểu mục trước đó.

Ta có $w^* = w + x^* $, trong đó $x^*$ là nghiệm khả thi của (USR-12). Dựa vào @thm-computing-topt, ta có thể chọn $x^*= hat(x)(t^*)$. Lưu ý rằng, ta có thể xây dựng $hat(x)(t)$ từ $hat(z)(t)$ cho bất kỳ $t$ nào bằng cách sử dụng Định lý 4.2, phương trình (17), và biểu thức của $hat(z)(t)$ được cho bởi (21) hoặc (22). Về giá trị $t^*$, nó có thể được tìm thấy trong thời gian $O(k log k)$, với $k$ là bậc của $v_1$, bằng cách sử dụng tìm kiếm nhị phân vì $t^* = inf{t >= 0: beta(t) <= B}$ và hàm $beta(.)$ được xác định trong Định lý 4.3 là hàm tuyến tính từng khúc và giảm dần.

Xem @fig-so-do-cac-bai-toan để có cái nhìn tổng quan về các phép biến đổi giữa các bài toán và lời giải. Trong đó, mỗi hình chữ nhật đại diện cho một bài toán và nghiệm tối ưu của nó. Mỗi mũi tên đại diện cho phép biến đổi giữa các bài toán cùng với những kết quả chính kết nối chúng.

#let so-do-cac-bai-toan  = canvas(length: 10%, {
    import cetz.draw: *
    let (y1, y2, y3, y4) = (3,2,1, 4) 
    let (x1, x2, x3, x4) = (1, 3, 5, 7) 
    let x0 = 0
    let r = 0.5
    let h =-2

    rect((0,0), (2.2, 0.5), name: "p1", stroke: none)
    rect((6,0), (6.5+2, 0.5), name: "p2", stroke: none)
    rect((0,h), (2.5, h+0.5), name: "p4", stroke: none)
    rect((6,h), (6.5+2, h+0.5), name: "p3", stroke: none)
    line("p1.right", "p2.left",  mark: (end: ">"), name: "l1")
    line("p2.bottom", "p3.top",  mark: (end: ">"), name: "l2")
    line("p3.left", "p4.right",  mark: (end: ">"), name: "l3")


    // content("p1.center",  [#text(blue)[$("USR"-1) quad "&" quad w^*$]], anchor: none, padding: 0.3)
    // content("p2.center",  [#text(blue)[$("USR"-2) quad "&" quad x^*$]], anchor: none, padding: 0.3)
    // content("p3.center",  [#text(blue)[$("PUSR"-3) quad "&" quad hat(x)(t)$]], anchor: none, padding: 0.3)
    // content("p4.center",  [#text(blue)[$("PUSR"-4) quad "&" quad hat(z)(t)$]], anchor: none, padding: 0.2)
    content("p1.center",  box(stroke: black, inset: 0.5em)[#USR1 & $w^*$], anchor: none, padding: 0.2)
    content("p2.center",  box(stroke: black, inset: 0.5em)[#USR2 & $x^*$], anchor: none, padding: 0.2)
    content("p3.center",  box(stroke: black, inset: 0.5em)[#PUSR1 & $hat(x)(t)$], anchor: none, padding: 0.2)
    content("p4.center",  box(stroke: black, inset: 0.5em)[#PUSR2 & $hat(z)(t)$], anchor: none, padding: 0.2)

    content("l1.bottom",  [*Loại bỏ ràng buộc median*], anchor: "bottom", padding: 0.2)
    content("l1.top",  [*$x^* = w^* - w$*], anchor: "top", padding: 0.2)
    content("l2.left",  [*Đổi hàm mục tiêu và\ điều kiện ngân sách*], anchor: "left", padding: 0.2)
    content("l2.right",  [*Định lý 3*], anchor: "right", padding: 0.2)
    content("l3.bottom",  [*Định lý 4.2 4.3 & (17)*], anchor: "bottom", padding: 0.2)
    content("l3.top",  [*Giảm chiều*], anchor: "top", padding: 0.2)
})
#figure(
  so-do-cac-bai-toan,
  caption: [Các phép biến đổi của bốn bài toán nâng cấp.],
) <fig-so-do-cac-bai-toan>
// Hình 2. Các phép biến đổi của bốn bài toán nâng cấp. Mỗi hộp chứa một bài toán và nghiệm tối ưu của nó. Mỗi mũi tên đại diện cho phép biến đổi giữa các bài toán cùng với những kết quả chính kết nối chúng.

Nhớ rằng việc giải quyết bài toán (PUSR_13) tốn chi phí $O(n + k log k)$ và việc tìm kiếm $t^*$ có thể thực hiện trong $O(k log k)$, do đó độ phức tạp tổng thể của việc giải bài toán (USR-10) là $O(n + k log k)$. 

// *Định lý 4.4*

#theorem[Bài toán nâng cấp cận dưới của bán kính ổn định cho điểm trung vị trên đồ thị cây (USR-10) có thể được giải quyết trong thời gian $O(n + k log k )$, trong đó $n$ là số đỉnh của cây và $k$ là bậc của điểm trung vị $v_1$.]

Cuối cùng, ta kết thúc mục này bằng ví dụ minh họa cho những bước chính để giải quyết bài toán (USR-10).

// *Ví dụ 4.1* 

#example[Xem xét bài toán (USR-12) với ngân sách $B = 0.36$, mức độ nhiễu $epsilon_0 = 0.05$ và cây có trọng số như hình 1. Đặt $u_0 = v_1$, $u_1 = v_2$ $u_2 = v_3$ và $u_3 = v_4$. Nhớ rằng $gamma_j = angle.l w, bb(1)_T_u_j angle.r $ với $j= 0,1,2,3$, ta có $gamma_1 = 0.33$, $gamma_2 = 0.12$ và $gamma_3 = 0.45$. Hơn nữa $ beta(t)= 2([gamma_1 - t]_+ + [gamma_2 - t]_+ + [gamma_3 - t]_+) $.

Bằng (15), ta có $t^*=inf{t: beta(t) <= B}= 0.3$. Trong trường hợp này, ta có $beta(t^*)=B$. Bởi vì $overline(z_0)= epsilon_0 = 0.05 < beta(t^*)/2 =0.18$, ta có thể chọn $hat(z)(t^*)$ dựa vào (22), chú ý rằng $J > (t^*)= {1,3}$, $J <= (t^*)= {2}$ và ta có
$ hat(z)(t^*)=(0.05, -0.03, 0.13, -0.15). $
Bằng (17), ta có $ hat(x)(t^*)=(0.05, -0.01, 0.065, -0,05, -0.01, -0,01, 0.065, -0.05, -0.05). $ 

Dựa vào định lý 4.1, ta có thể chọn $x^* = hat(x)(t^*)$. Bởi vì $w^* = w+x$, ta được
$ w^* = (0.15, 0.12, 0.125, 0.1, 0.09, 0.09, 0.125, 0.1, 0.15, 0.05). $
Chặn dưới lớn nhất của bán kính ổn định sau khi được nâng cấp là $underline(R)(w^*)= 0.4/9$. 

Trọng số đỉnh trên cây được cải thiện như ở hình 3
]

#import "@preview/cetz:0.1.2": canvas, plot
#import "@preview/cetz:0.2.2"
#import "@preview/cetz:0.1.2"

#let example-upgrading-stability-radius = canvas(length: 10%, {
  import cetz.draw: *

  let y = 2 
  let x = 4
  let y-space = 1
  let h=1.6

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
)
#figure(
  example-upgrading-stability-radius,
  caption: [Đồ thị cây sau nâng cấp cận dưới bán kính ổn định],
) <fig-example-upgrading-stability-radius>



