#include "../tools/multi-section-ref.typ"
// #import "../tools/macros.typ": eqref, remark-Le, delete-Le, add-Le, remark-Ngan, delete-Ngan, add-Ngan
// #import "../typst-orange.typ": theorem, proof, lemma, proposition, corollary, example, definition, 
#import "../tools/macros.typ": eqref, myref, figref, remark-Le, delete-Le, add-Le, remark-Ngan, delete-Ngan, add-Ngan, theorem, definition, proposition, lemma, proof, example
#import "@preview/cetz:0.1.2": canvas, plot
#import "@preview/cetz:0.1.2"
#import "@preview/equate:0.2.1": equate
#show: equate.with(breakable: true, sub-numbering: true)
#set math.equation(numbering: "(1.1)", supplement: none)
// #let myref(x) = text(fill: blue,)[(#x)]
#let USR = [USR]
#let USR1 = link(<eq-USR1>)[#text(fill: blue)[(USR1)]]
#let USR2 = link(<eq:23>)[#text(fill: blue)[(USR2)]]
// #let USR1 = text(fill: blue)[(USR1)]
// #let USR2 = text(fill: blue)[(USR2)]
#let PUSR1 = link(<eq:24>)[#text(fill: blue)[(PUSR1)]]
#let PUSR2 = link(<eq:33>)[#text(fill: blue)[(PUSR2)]]


// #par(justify: true)[
// = Nâng cấp bán kính ổn định của điểm 1-median
// = NÂNG CẤP BÁN KÍNH ỔN ĐỊNH CỦA ĐIỂM 1-MEDIAN

// $ x^2 + y^2 = z^2 $ <eq:pytago>

// Xét pt pytago @eq:pytago
==  Bài toán nâng cấp cận dưới bán kính ổn định 

Như đã đề cập, điểm 1-median đóng vai trò quan trọng trong mạng lưới đồ thị tổng quát, đặc biệt là đồ thị cây. Bán kính ổn định của điểm 1-median phản ánh mức độ ổn định của nó khi trọng số các đỉnh trên đồ thị biến động. Trong mục này, chúng ta sẽ củng cố tính ổn định của cơ sở tối ưu bằng cách nâng cấp (cận dưới) bán kính ổn định với một ngân sách cho trước.
//  Vì vậy, phần này sẽ tập trung vào bài toán nâng cấp bán kính ổn định của điểm 1-median, cụ thể là nghiên cứu và cải thiện cận dưới của bán kính này.
// Trong phần này, đầu tiên, chúng tôi sẽ xác định vấn đề chính của mình trong Mục 4.1. Tiếp theo, chúng tôi giới thiệu các phiên bản quyết định của bài toán và thiết lập mối quan hệ giữa chúng trong Mục 4.2. Cuối cùng, chúng tôi cho thấy rằng các vấn đề quyết định có thể được giải quyết dưới dạng đóng, từ đó đưa ra một phương pháp tiếp cận tổ hợp hiệu quả để giải quyết vấn đề lần lượt trong mục 4.3 và 4.4. 

// Trong phần này, đầu tiên, chúng tôi sẽ xác định vấn đề chính của mình trong Mục 4.1. Tiếp theo, chúng tôi giới thiệu các phiên bản quyết định của bài toán và thiết lập mối quan hệ giữa chúng trong Mục 4.2. Cuối cùng, chúng tôi cho thấy rằng các vấn đề quyết định có thể được giải quyết dưới dạng đóng, từ đó đưa ra một phương pháp tiếp cận tổ hợp hiệu quả để giải quyết vấn đề lần lượt trong mục 4.3 và 4.4. 

// *4.1 Công thức*
=== Mô hình hóa bài toán

// Rõ ràng các biến đổi trong trọng số đỉnh trên cây có thể dẫn đến sự bất ổn định trong vị trí trung vị đã thiết lập. Trong phần này, chúng tôi nhằm mục đích tăng cường độ bền vững của vị trí trung vị bằng cách cải thiện bán kính ổn định $R(w)$. Do tính chất phức tạp của $R(w)$, thay vào đó chúng tôi tập trung vào việc nâng cấp chặn dưới của $R(w)$. Bây giờ, chúng tôi sẽ nghiên cứu chi tiết mô hình

Giả sử $v_1 in V $ là điểm 1-median trên cây $T$ tương ứng với trọng số $w in RR_n^+$ cho trước, thỏa mãn điều kiện tổng trọng số đỉnh có độ lớn không đổi, nghĩa là thỏa mãn điều kiện #eqref(<eq:dk>). Với một ngân sách $B >= 0 $, mục tiêu của ta là điều chỉnh trọng số từ $w$ thành một vecto trọng số $tilde(w) in RR_n^+$ trong giới hạn ngân sách, sao cho:

1. Cận dưới của bán kính ổn định mới, $underline(R)(tilde(w))$, là lớn nhất. 

2. Đỉnh $v_1$ vẫn là điểm 1-median ứng với $tilde(w)$.

3. Chi phí thay đổi từ $w$ sang $tilde(w)$ không vượt quá ngân sách $B$. Trong đó, chi phí thay đổi trọng số từ $w$ thành $tilde(w)$ được đo bằng chuẩn $"L1"$, tức là $norm(w - tilde(w))_1$.

4. Tổng trọng số trên cây không đổi, hay nói cách khác $sum_(i=1) ^n tilde(w) = sum_(i=1) ^n w = 1$.

5. Trọng số mới $tilde(w)$ không được chênh lệch quá lớn so với $w$ ban đầu, cụ thể là $tilde(w) in [w-epsilon_0, w + epsilon_0] subset RR^n_+$, với một hằng số $epsilon_0 >0 $ cho trước. 

Bài toán này được gọi là _nâng cấp bán kính ổn định (USR - Upgrading Stability Radius)_ của điểm 1-median $v_1$ với dữ liệu đầu vào là trọng số ban đầu $w$. Trong đó $B$ và $epsilon_0$ là các tham số của mô hình bài toán.

Lúc này, bài toán có thể được viết lại như sau:
// $
// max quad & underline(R)(tilde(w)) quad quad quad quad quad quad quad quad quad quad quad #text(blue)[#USR1]\ 

// "s.t." quad & norm(tilde(w)-w)_1 <= B quad quad quad quad quad quad quad("USR"-20a)\

//  & v_1 "is 1-median w.r.t" tilde(w) quad quad quad quad quad quad quad ("USR" - 20b)\

//  & sum^n_(i=1) tilde(w)_i = 1 quad quad quad quad quad quad quad ("USR" -20c)\

//  & norm(tilde(w)-w)_infinity <= epsilon_0 quad quad quad quad quad quad quad ("USR" - 20d)
// $

// $
// max quad & underline(R)(tilde(w)) &  #h(1fr) #text(blue)[#USR1]\ 

// "s.t." quad & norm(tilde(w)-w)_1 <= B & #h(1fr) quad("USR"-20a)\

//  & v_1 "is 1-median w.r.t" tilde(w) & #h(1fr) ("USR" - 20b)\

//  & sum^n_(i=1) tilde(w)_i = 1 & #h(1fr) ("USR" -20c)\

//  & norm(tilde(w)-w)_infinity <= epsilon_0 & #h(1fr) ("USR" - 20d)
// $ 

$
"(USR1)" quad quad max quad & underline(R)(tilde(w)) \ 

"s.t." quad & norm(tilde(w)-w)_1 <= B \

 & v_1 "is 1-median w.r.t" tilde(w) #<USR-med-cond>\

 & sum^n_(i=1) tilde(w)_i = 1 \

 & norm(tilde(w)-w)_infinity <= epsilon_0 
$ <eq-USR1>



Trước khi giải bài toán này, ta sẽ để đơn giản hóa nó bằng cách đổi biến và giảm bớt các ràng buộc:

1. Viết lại bài toán $max$ thành $min$.

2. Loại bỏ ràng buộc median trong #USR1. // #myref[@USR-med-cond].

3. Đổi biến từ vecto trọng số $tilde(w)$ sang $x = tilde(w) - w$, trong đó $x$ được gọi là vecto điều chỉnh.

// *Định lý 3.1* --> @thm-lower-bound-SR 

Dựa vào @thm-lower-bound-SR, bài toán $underline(R)(w)$ với hàm mục tiêu $max$ có thể được chuyển đổi thành một bài toán $min$ như sau:

$ max_tilde(w) underline(R)(tilde(w))
& = max_tilde(w) min_(u in N(v_1)) 1/n (1- 2 angle.l tilde(w), bb(1)_T_u angle.r)\
& = 1/n -2/n min_tilde(w) max_( u in N(v_1)) angle.l tilde(w), bb(1)_T_u angle.r. $

Tiếp theo, ta có nhận xét rằng nếu $w^*$ là nghiệm tối ưu của bài USR, thì
$ max_(u in N(v_1)) angle.l w^*, bb(1)_T_u angle.r <= max_(u in N(v_1)) angle.l w, bb(1)_T_u angle.r <= 1/2. $
Ở đây, bất đẳng thức thứ hai xảy ra do $v_1$ là median ứng với $w$.
Từ đó, ta thấy rằng $v_1$ cũng là điểm 1-median đối với $w^*$. Do đó, ràng buộc về tính tối ưu của $v_1$ trong #USR1 là dư thừa và có thể loại bỏ. Nói cách khác, nếu $w^*$ là nghiệm tối ưu của bài toán USR thì nó hiển nhiên thỏa mãn ràng buộc #myref[@USR-med-cond].

Cuối cùng, đặt $ x= tilde(w) - w$ là vecto điều chỉnh. Khi đó, bài toán #USR1 có thể được viết lại như sau:

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

    & x_i in [-epsilon_0; epsilon_0], quad forall i = 1,...,n 
$ <eq:23>
// === Giải thuật của bài toán nâng cấp bán kính ổn định 
// == Giải thuật 
// === Giải bài toán tham số



===  Tham số hóa bài toán
// nâng cấp bán kính ổn định

Sau khi chuyển đổi sang bài toán đơn giản hơn #eqref(<eq:23>), phần này sẽ tập trung vào việc giải quyết #eqref(<eq:23>). Dễ dàng nhận thấy bài toán này có thể được biểu diễn dưới dạng một bài toán quy hoạch tuyến tính với không gian $n$ chiều và $n+2$ ràng buộc. Nhờ vậy, nó có thể được giải bằng các phương pháp kinh điển như thuật toán đơn hình hoặc các thuật toán thời gian đa thức do @karmarkar1984new và @megiddo1984linear đề xuất.

Tuy nhiên, khi số chiều tăng lên, thời gian tính toán tăng đáng kể. Điều này là một rào cản trong thực tế, khi các đồ thị cây được phân tích có thể chứa hàng trăm hoặc thậm chí hàng chục nghìn đỉnh, khiến việc giải bài toán trở nên không khả thi bằng các thuật toán đã nêu. Do đó, trong phần này, tôi sẽ đề xuất một thuật toán tổ hợp nhằm giải quyết bài toán một cách hiệu quả hơn.

Việc giải quyết bài toán #eqref(<eq:23>) thực chất là trả lời cho câu hỏi: _"Giá trị mục tiêu nhỏ nhất có thể đạt được trong giới hạn ngân sách $B$ là bao nhiêu?"_.

Tuy nhiên, thay vì tập trung vào câu hỏi này, ta có thể chuyển sang một câu hỏi ngược lại như sau: _"Với một giá trị mục tiêu $t$ cho trước, ngân sách tối thiểu cần thiết để đạt được giá trị mục tiêu không vượt quá $t$ là bao nhiêu?"_. Câu hỏi này có thể được diễn đạt dưới dạng bài toán dưới đây:

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

Khi đó, ta gọi bài toán này là _phiên bản tham số của bài toán nâng cấp bán kính ổn định (PUSR - Parametric USR)_. Thoạt nhìn, bài toán #PUSR1 được xây dựng từ #USR2 bằng cách hoán đổi vai trò giữa mục tiêu và ràng buộc ngân sách. Với các bổ đề và định lý sẽ được trình bày ở phần tiếp theo, chúng ta sẽ thấy rằng việc giải bài toán tham số không chỉ đơn giản hơn so với bài toán gốc, mà còn cho phép ta dễ dàng tìm lại được nghiệm của bài toán gốc khi biết nghiệm của bài toán tham số.

Ta có nhận xét về mối liên hệ giữa #PUSR1 và #USR2:

1. Nếu ngân sách tối thiểu cần thiết để đạt được giá trị mục tiêu không lớn hơn $t$ không vượt quá $B$, thì việc tăng ngân sách lên $B$ sẽ cho phép giảm $t$ để đạt được giá trị mục tiêu nhỏ nhất của bài toán ban đầu. 

2. Ngược lại, khi giá trị $t$ vẫn còn lớn hơn hoặc bằng giá trị mục tiêu tối ưu $t^*$ thì nghĩa là ta vẫn chưa sử dụng hết ngân sách $B$. 

Nói cách khác, giải quyết bài toán tham số này cho phép chúng ta xác định xem $t$ có lớn hơn giá trị mục tiêu nhỏ nhất của bài toán gốc hay không.

Từ nhận xét thú vị này, ta có được bổ đề bên dưới:

#lemma[Ta có 
$ beta(t) <= B <=> t>= t^* $ trong đó $beta(t)$ là ngân sách cần thiết nhỏ nhất để đạt được giá trị $t$ và $t^*$ là giá trị mục tiêu tối ưu của bài toán #eqref(<eq:23>).
] <thm-beta-t>

Để chứng minh bổ đề này, trước hết ta giới thiệu một số ký hiệu bổ sung. Với ngân sách cố định $B$, ta gọi $x^*$ và $t^*$ lần lượt là nghiệm tối ưu và giá trị mục tiêu tối ưu của bài toán #eqref(<eq:23>). Với mỗi tham số $t$ cho trước, giả sử $hat(x)(t)$ và $beta(t)$ lần lượt là nghiệm tối ưu và ngân sách tối thiểu tương ứng trong #eqref(<eq:24>). Cần lưu ý rằng, $beta(dot)$ là một hàm không giảm trên miền xác định của nó và nhận giá trị $+infinity$ nếu tập khả thi của #eqref(<eq:24>) bằng rỗng. Cuối cùng, ta đặt $P(x)= max_(u in N(v_1)) angle.l w + x, bb(1)_T_u angle.r $ là hàm mục tiêu của #eqref(<eq:23>).


// Để phát biểu bổ đề, chúng ta hãy giới thiệu một số ký hiệu bổ sung. Gọi $P(x)= max_(u in N(v_1)) angle.l w + x, bb(1)_T_u angle.r $ là hàm mục tiêu của #USR2. Chúng ta cũng ký hiệu $x^*$ là nghiệm tối ưu và $t^*$ là giá trị mục tiêu tối ưu của #USR2. Khi đó, $P(x^*)= t^*$. Tiếp theo, gọi $hat(x)(t)$ là nghiệm tối ưu và $beta(t)$ là giá trị mục tiêu tối ưu của (PUSR-13) tương ứng với tham số $t$. Nếu tập hợp nghiệm khả thi của (PUSR-13) rỗng, chúng ta đặt $beta(t)= + infinity$. Rõ ràng bằng $beta(.)$ là một hàm không giảm trên miền của nó. Mối quan hệ giữa $(t,beta(t))$ và $(t^*,B)$ được thiết lập như sau:

// == Bổ đề 4.1 
// *Bổ đề 4.1*
// #lemma[Ta có 
// $ beta(t) <= B <=> t>= t^* $
// ]

// *Chứng minh*
#proof[ Chứng minh gồm hai chiều, 

Ta bắt đầu với chiều thuận. Nếu $beta(t) <= B$, thì $hat(x)(t)$ là một nghiệm khả thi ứng với #eqref(<eq:24>), do đó, $P(hat(x)(t)) >= P(x^*)$. Vì thế, $t >= P(hat(x)(t)) >= P(x^*) = t^*$, hay nói cách khác, ta có $t >= t^*$.

Ta tiến hành chứng minh chiều ngược lại. Giả sử rằng $t >= t^*$. Bởi vì $t^* = P(x^*)$, suy ra $P(x^*) <= t$. Do đó, $norm(hat(x)(t))_1 <= norm(x^*)_1$. Vì $x^*$ là nghiệm tối ưu đối với #eqref(<eq:24>) nên $norm(x^*)_1 <= B$. Vì vậy, $beta(t)= norm(hat(x)(t))_1 <= norm(x^*)_1 <= B$. Ta hoàn thành chứng minh.]

// *Bổ đề 4.1*--> @thm-beta-t

Từ @thm-beta-t, ta có thể thấy rằng 
$ beta(t^*) <= B $. <eq:26>

Trong phần tiếp theo, chúng ta sẽ dùng @thm-beta-t để xây dựng một phép biến đổi từ $(hat(x)(t), beta(t))$ của bài toán #eqref(<eq:23>) sang $(x^*, t^*)$ của #eqref(<eq:24>).

// *Định lý 4.1*

#theorem[Giá trị mục tiêu $t^*$ của #eqref(<eq:23>) được tính theo $beta(t)$ như sau:
$ t^* = inf{t: beta(t) <= B}. $ <eq-computing-topt>
Hơn nữa, $hat(x)(t^*)$ là nghiệm tối ưu của #eqref(<eq:23>).] <thm-computing-topt>

// <eq:27>

// *Chứng minh* 

#proof[
Từ @thm-beta-t, ta có thể thấy rằng $t^* <= t$  với mọi $t$ thỏa $beta(t)<= B$. Suy ra $t^* <= inf{t: beta(t)<= B}$. Mặt khác, bất đẳng thức #eqref(<eq:26>) kéo theo $t^* >= inf{t: beta(t)<= B}$. Như vậy, $t^*= inf{t: beta(t)<= B}$.


// Từ @thm-beta-t, ta có thể thấy rằng $t^* <= inf{t: beta(t)<= B}$. Nếu $t^* < inf{t: beta(t) <= B}$ thì dễ thấy rằng $beta(t^*) > B$, điều này mâu thuẫn với #eqref(<eq:26>). Vì thế, $t^*= inf{t: beta(t)<= B}$.

Hơn nữa từ #eqref(<eq:26>), ta suy ra $hat(x)(t^*)$ là một nghiệm khả thi của #eqref(<eq:23>). Do đó, $ P(hat(x)(t^*)) >= P(x^*) = t^* $. 

Hơn nữa, tính khả thi của $hat(x)(t^*)$ trong #eqref(<eq:23>) suy ra $ t^* >= P(hat(x)(t^*)) $.

Từ đây, ta được $ P(hat(x)(t^*)) = t^* $ nghĩa là $hat(x)(t^*)$ là nghiệm tối ưu của #eqref(<eq:23>).]

// *Định lý 3.3* --> @thm-computing-topt

Từ @thm-computing-topt, có thể thấy rằng nếu ta có thể giải được bài toán tham số #eqref(<eq:24>), tức là tìm được $beta(t)$ và $hat(x)(t)$ với $t$ bất kỳ, thì ta có thể xây dựng một nghiệm tối ưu $x^* = hat(x)(t^*)$, trong đó $t^*$ có thể được tính theo công thức #myref[@eq-computing-topt]. 

Để giải bài toán tham số #eqref(<eq:24>) một cách đơn giản và nhanh chóng, trước hết, ta sẽ thực hiện phép đổi biến nhằm giảm chiều bài toán. Để thực hiện được điều này, ta cần lưu ý rằng, tồn tại một nghiệm tối ưu $x$ của bài toán tham số mà trong đó các giá trị thành phần $x_i$ ứng với các $v_i$, $v_i in T_u$ với $u in N(v_1)$, là bằng nhau. Do đó, ta có thể đối $x$ thành biến mới $z$, trong đó mỗi thành phần của $z$ đại diện cho tổng của $x_i$ đối với các đỉnh $v_i in T_u$. Bằng cách đổi biến như trên, ta có thể giảm chiều bài toán một cách đáng kể, cụ thể giảm từ $n$ chiều về $k$ chiều, với $k$ là bậc của đỉnh $v_1$. 

Bây giờ, ta sẽ đi vào cụ thể chi tiết cách đổi biến cho bài toán. Đặt $N(v_1)={u_1,...,u_k}$ nghĩa là $N(v_1)$ là tập hợp tất cả các đỉnh liền kề với $v_1$, $u_0=v_1$ và $T_u_0={v_1}$. Gọi $gamma_j= angle.l w, bb(1)_T_u_j angle.r$ là tổng trọng số đỉnh của cây con lấy gốc tại $u_j$, $j=0,1,...,k$. Cho $x in RR^n$, ta định nghĩa vecto mới $z, overline(z) in RR^(k+1)$, trong đó thành phần thứ $j$ với $j=0,1,...k$ được xác định như sau:

$ z_j= angle.l x, bb(1)_T_u_j angle.r, $
$ overline(z)_j=epsilon_0.abs(T_u_j). $

Từ cách đổi biến như trên, bài toán #eqref(<eq:24>) ban đầu trở thành bài toán mới với số chiều $k$:

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

Từ nghiệm của bài toán #PUSR2, ta có thể tìm lại nghiệm của #PUSR1 thông qua mệnh đề sau.

#proposition[ Bài toán #PUSR2 và #PUSR1 có cùng giá trị mục tiêu $beta(t)$. Hơn nữa, nếu $hat(z)(t)$ là nghiệm tối ưu của #PUSR2, thì nghiệm tối ưu của bài toán #PUSR1 được xác định như sau:

$ hat(x)_i (t) = (hat(z)_(j)(t))/ abs(T_u_j), quad forall v_i in T_u_j, forall j= 0,1,...,k. $ <eq-z-x>

]<thm-z-to-x>

// (cần viết kỹ lại)

Tiếp theo, ta sẽ xem xét điều kiện để tập nghiệm khả thi của #PUSR2 khác rỗng. Đặt
$ J^(<=) (t)={j in {i,...,k}: gamma_j <=t}
$
$ J^> (t)={j in {1,...,k}: gamma_j >t} $

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
//     min quad & sum_(j=0)^k abs(z_j) quad quad quad quad #text(blue)[#PUSR2]\

//     "s.t." quad & max_(j=1,...,k) (gamma_j + z_j) <= t    quad quad ("PUSR-16a")\

//     & sum^k_(j=1) z_j = 0 quad quad ("PUSR-16b")\

//     & z_j in [-overline(z)_j; overline(z)_j], forall j = 0,1,...,k quad quad ("PUSR-16c")
//     $

// Giả sử $hat(z)(t)$ là nghiệm tối ưu của #PUSR2. Lưu ý rằng $beta(t)$ cũng là giá trị mục tiêu tối ưu của #PUSR2. Điều quan trọng cần lưu ý là (PUSR-13) và #PUSR2 "tương đương" theo nghĩa nếu biết $hat(x)(t)$ như được mô tả trong Định lý 4.2, thì ta có thể xây dựng $hat(z)(t)$ và nếu biết $hat(z)(t)$ thì ta có thể tìm ra $hat(x)(t)$ bằng cách
// $ hat(z)_(j)(t)= sum_(v_i in T_u_j) hat(x)_(i)(t), quad forall j= 0,1,...,k. $

// và nếu biết $hat(z)(t)$, chúng ta có thể tìm $hat(x)(t)$ bằng 
// $ hat(x)_i(t) = (hat(z)_(j)(t))/ abs(T_u_j), quad forall v_i in T_u_j, forall j= 0,1,...,k. $

// Chúng ta kết thúc phần này với một đặc trưng về tính không rỗng của tập hợp khả thi của #PUSR2. Gọi $ J^(<=) (t)= {j in {1,...,k}: gamma_j <= t}$ và $J^> (t) = {j in {1,...,k}: gamma_j > t}.$

// // *Mệnh đề 4.1*.

#proposition[Tập khả thi của #PUSR2 là khác rỗng khi và chỉ khi 
$ overline(z)_0 + sum_(j in J^(<=) (t)) min(overline(z)_j, t- gamma_j) >= sum_(i in J^>(t)) (gamma_i- t). $ <eq-bound-for-cond-of-z>
]

// *Chứng minh*
#proof[
Nếu tập khả thi của #PUSR2 không rỗng thì tồn tại một số nghiệm khả thi $z in RR^(k+1)$ thỏa mãn các ràng buộc #PUSR2, nghĩa là
$ z_0 + sum_(j in J^(<=)(t)) z_j = - sum_(j in J^> (t)) z_j. $ <eq-equal-cond-of-z>

// #myref[@eq-equal-cond-of-z]

Từ tính khả thi của $z$, không khó để xác minh rằng vế trái của #myref[@eq-equal-cond-of-z] bị chặn trên bởi vế trái của #myref[@eq-bound-for-cond-of-z] và vế phải của #myref[@eq-equal-cond-of-z] bị chặn dưới bởi vế phải của #myref[@eq-bound-for-cond-of-z]. Do đó, ta thu được #myref[@eq-bound-for-cond-of-z]. Ngược lại, giả sử rằng #myref[@eq-bound-for-cond-of-z] không thỏa mãn. Bằng cách sử dụng các ước lượng tương tự, ta có thể thu được
$ z_0 + sum_(j in J^(<=) (t)) z_j < - sum_(j in J^> (t)) z_j <==> sum_(j=0)^k z_j < 0. $
Điều này vi phạm ràng buộc thứ hai trong #PUSR2 và do đó tập hợp khả thi là rỗng. Hoàn tất chứng minh.]

// == 4.3 Giải phiên bản tham số của bài toán nâng cấp bán kính ổn định
== Giải thuật 


// *Định lý 4.3* 

// ==== Giải bài toán tham số
// // #remark-Le[Xem lại cách trình bày lại định lý này trong bản mới của bài báo]
// Bây giờ, ta sẽ chứng minh rằng bài toán tham số hóa #PUSR2tồn tại nghiệm tối ưu $hat(z)(t)$
// và giá trị mục tiêu tối ưu $beta(t)$ được biểu diễn dưới dạng công thức tường minh.
// Để làm rõ điều này, ta định nghĩa $hat(z)(t)$ dựa trên hai trường hợp.

// Nếu $overline(z)_0 >= sum_(i=1)^k [gamma_i - t]_+$ thì ta chọn
// $ hat(z)_(j)(t) = -(gamma_j - t), quad quad j in J^> (t)\

// & hat(z)_(j) (t) = 0, quad quad j in J^(<=) (t) quad quad quad \
// & hat(z)_0(t)= sum_(j in J^> (t)) (gamma_j - t). $
// <eq:40>
// Trong phần trước, chúng ta đã chứng minh rằng việc giải bài toán mục tiêu #USR2 có thể được đưa về giải bài toán tham số của nó #PUSR2 bằng cách tìm một nghiệm tối ưu $hat(z)(t)$ và mục tiêu tối ưu $beta(t)$ tương ứng với $t$. Định lý sau đây cung cấp các biểu thức dạng đóng cho cả $hat(z)(t)$ và $beta(t)$. 

// *Định lý 4.3* 

=== Giải bài toán tham số
// #remark-Le[Xem lại cách trình bày lại định lý này trong bản mới của bài báo]

Trong phần này, chúng ta sẽ chỉ ra rằng bài toán #PUSR2 có thể được giải tường minh. 

Một nghiệm tối ưu của #PUSR2, gọi là $hat(z)(t)$, có thể được tính tường minh bằng cách xem xét hai trường hợp sau. Nếu $overline(z)_0 >= sum_(i=1)^k [gamma_i - t]_+$ thì ta đặt
$
  hat(z)_(j)(t) & = -(gamma_j - t), & quad quad j in J^> (t) \
  hat(z)_(j) (t) & = 0, & quad quad j in J^(<=)(t) \
  hat(z)_0(t) &= sum_(j in J^> (t)) (gamma_j - t). &
$ <eq:40>
Ngược lại,
$
 hat(z_j)(t)& = -(gamma_j -t), & quad quad j in J^> (t)\ 
 hat(z_j)(t) &= min(overline(z)_j, underline(t)-gamma_j), & quad quad j in J^(<=) (t)\
 hat(z)_0(t) &=overline(z)_0,
$ <eq:otherwise>
trong đó $underline(t)$ được chọn sao cho 
$ overline(z)_0+ sum_(j in J^(<=) (t)) min(overline(z)_j, underline(t)-gamma_j)= sum_(j in J^>(t)) (gamma_j - t).  $
<eq:deft>

Kết quả sau đây đưa ra công thức tường minh của $beta(t)$ và đảm bảo rằng $hat(z)(t)$ là nghiệm tối ưu của bài toán.

#proposition[Nếu giá trị mục tiêu tối ưu $beta(t)$ của #PUSR2 là hữu hạn thì
$ beta(t) = 2 sum_(i=1)^k [gamma_i -t]_+ $
Trong đó $[alpha]_+ = max(0,alpha)$ với $alpha in RR$. Hơn nữa, $hat(z)(t)$ xác định bởi công thức #eqref(<eq:40>) hoặc #eqref(<eq:otherwise>) là nghiệm tối ưu của #PUSR2. ] <thm-computing-beta-t>



// *Chứng minh*
#proof[Chứng minh gồm hai phần. 

Bước đầu tiên, ta chứng minh rằng $2 sum_(i=1)^k [gamma_j - t]_+$ là cận dưới giá trị hàm mục tiêu của bài toán #PUSR2, tức là $beta(t)>= 2 sum_(i=1)^k [gamma_j - t]_+$. 

Bước thứ hai, ta chứng minh rằng $2 sum_(i=1)^k [gamma_j-t]_+$ thực sự là giá trị nhỏ nhất của #PUSR2 bằng cách chứng minh rằng $hat(z)(t)$, được định nghĩa trong #eqref(<eq:40>) hoặc #eqref(<eq:otherwise>), là nghiệm khả thi và thỏa mãn $norm(hat(z)(t))_1 = 2 sum_(i=1)^k [gamma_j - t]_+.$

*Bước 1.* Dễ thấy thấy rằng với một giá trị $t$ nhất định, ta cần giảm $gamma_j$ với $j in J^>(t)$ và đồng thời tăng $gamma_j$ với $j in J^(<=) (t) $ nhằm đảm bảo rằng điều kiện thứ hai của #PUSR2 được thỏa mãn. Nói cách khác, $z_j$ cần nhận giá trị không dương khi $j in J^>(t)$ và cần nhận giá trị không âm khi $j in J^(<=) (t)$. Dựa trên quan sát này, ta sẽ thiết lập một cận dưới chặt cho hàm mục tiêu.

// Quan sát thấy, với một giá trị $t$ nào đó, ta cần phải giảm $gamma_j$ với $ j in J^(<=) (t)$ để duy trì phương trình (PUSR-16b). Nói cách khác, $z_j$ nên là số không dương đối với $j in J^>(t)$ và nên là số không âm đối với $j in J^(<=) (t)$. Trực giác này thúc đẩy các ước lượng khéo léo sau đây để đạt được một cận dưới chặt chẽ cho hàm mục tiêu:
$
    norm(z)_1 & = sum_(j=0)^k abs(z_j)= abs(z_0)+ sum_(i in J^(<=) (t)) abs(z_i)+ sum_(j in J^>(t)) abs(z_i)\
    & >= z_0 + sum_(i in J^(<=) (t)) z_j - sum_(i in J^> (t)) z_j.
$

Dựa vào điều kiện thứ hai của #PUSR2, ta có $z_0 + sum_(i in J^(<=) (t)) z_j = - sum_(i in J^>(t)) z_j.$ 

Do đó,
$ norm(z)_1 >= -2 sum_(i in J^> (t)) z_j. $
Chú ý rằng với mọi $j in J^>(t)$, ta có $-z_j >= gamma_j - t >0$. Do đó,
$ norm(z)_1 >= 2 sum_(j in J^> (t))(gamma_j - t)= 2 sum_(j=1)^k [gamma_j - t]_+. $
Từ ước lượng trên, ta thấy rằng $2 sum_(j=1)^k [gamma_j - t]_+ $ là một chặn dưới của giá trị mục tiêu của #PUSR2.

*Bước 2.* Bây giờ, ta sẽ chứng minh rằng  $z=hat(z)(t)$ là một nghiệm khả thi của #PUSR2 sao cho 
$ norm(z)_1= 2sum_(j in J^>(t))(gamma_j -t). $ <eq-cond-of-z>
// $z$ có thể được định nghĩa như sau:

Đối với tập hợp các chỉ số $J^> (t)$, ta đặt:
$ z_j = -(gamma_j - t), quad forall j in J^>(t). $
Với $j in {0} union J^(<=) (t)$, mục tiêu của ta là chọn $z_j$ là một số không âm sao cho tổng của chúng bằng $sum_(j in J^> (t)) (gamma_j -t)$. Cụ thể hơn, ta xem xét hai trường hợp. 

Nếu $overline(z)_0 >= sum_(j in J^> (t))(gamma_j -t)$ ta có thể đặt 
$ z_0 =sum_(j in J^>(t))(gamma_j -t), $
$ z_j =0, quad forall j in J^(<=) (t). $

Ngược lại, ta có $overline(z)_0 < sum_(j in J^>(t))(gamma_j -t)$. Trong trường hợp này, ta đặt 
$ z_0 = overline(z)_0, $
$ z_j = min (overline(z)_j, underline(t)-gamma_j), quad forall j in J^(<=) (t), $
trong đó $underline(t)$ được định nghĩa ở #eqref(<eq:deft>).

Với cách xây dựng trên của $z$ ta thấy rằng $z=hat(z)(t)$ và thỏa mãn #myref[@eq-cond-of-z].

Trong phần còn lại của chứng minh, ta cần chỉ ra sự tồn tại của $underline(t)$ xác định bởi #eqref(<eq:deft>). Đặt $phi$ là hàm ở vế trái của #eqref(<eq:deft>):

$
    phi(dot) = overline(z)_0+ sum_(j in J^(<=) (t)) min(overline(z)_j, dot -gamma_j)
$

Chú ý rằng
$
    phi(0) & <=  overline(z)_0 < sum_(j in J^>(t))(gamma_j -t),\
    phi(t) & >= sum_(j in J^> (t))(gamma_j -t).
$
Ở đây, bất đẳng thức sau xảy ra do điều kiện #myref[@eq-bound-for-cond-of-z] về tính khác rỗng của tập nghiệm khả thi. Do $phi$ liên tục, nên tồn tại $underline(t) in [0, t]$ sao cho $phi(underline(t))= sum_(j in J^> (t))(gamma_j -t)$. Ta hoàn tất thành chứng minh.
]

Quan sát rằng với mỗi giá trị cố định của $t$, ta có thể tìm $underline(t)$ trong #eqref(<eq:deft>) bằng cách sử dụng tìm kiếm nhị phân vì hàm $phi$ là hàm tuyến tính từng khúc và không giảm. Lưu ý rằng việc đánh giá hàm này tốn thời gian $O(k)$, với $k$ là bậc của $v_1$. Do đó, các bài toán tham số #PUSR2 có thể được giải quyết trong thời gian $O(k log k)$. Vì phép biến đổi #eqref(<eq-z-x>) tốn chi phí $O(n)$, bài toán #PUSR1 có thể được giải trong thời gian $O(n+k log k)$.

=== Giải bài toán nâng cấp cận dưới bán kính ổn định

Trong mục này, chúng ta sẽ giải bài toán gốc #USR1 thông qua việc giải các bài toán #USR2, #PUSR1, #PUSR2. 

Tham khảo #figref[@fig-so-do-cac-bai-toan] về các phép biến đổi giữa các bài toán và nghiệm của chúng. Trong đó, mỗi hình chữ nhật đại diện cho một bài toán và nghiệm tối ưu của nó. Mỗi mũi tên đại diện cho phép biến đổi giữa các bài toán cùng với những kết quả chính kết nối chúng.

Cụ thể hơn, việc giải #USR1 gồm 04 bước như sau:

*Bước 1.* Giải bài toán #PUSR2 với tham số $t$ chưa biết được dạng nghiệm tối ưu $hat(z)(t)$ theo các công thức #eqref(<eq:40>) hoặc #eqref(<eq:otherwise>) và hàm ngân sách tối ưu $beta(t)$ xác định bởi @thm-computing-beta-t. 

*Bước 2.* Giải bài toán #PUSR1 với tham số $t$ chưa biết. Chú ý rằng bài toán này có cùng hàm ngân sách tối ưu $beta(t)$. Nghiệm tối ưu lúc này là $hat(x)(t)$ thu được từ $hat(z)(t)$ theo @thm-z-to-x.

*Bước 3.* Giải bài toán #USR2 với giá trị hàm mục tiêu tối ưu $t^* = inf{t >= 0: beta(t) <= B}$ và nghiệm tối ưu $x^* = hat(x)(t^*)$ theo @thm-computing-topt.

*Bước 4.* Giải bài toán #USR1 với giá trị hàm mục tiêu tối ưu là $t^*$ và nghiệm tối ưu $w^* = w + x^* $.

// + $w^* = w + x^* $, trong đó $x^*$ là nghiệm khả thi của #USR2. Dựa vào @thm-computing-topt, ta có thể chọn $x^*= hat(x)(t^*)$. Lưu ý rằng, ta có thể xây dựng $hat(x)(t)$ từ $hat(z)(t)$ cho bất kỳ $t$ nào bằng cách sử dụng phương trình #eqref(<eq-z-x>), và biểu thức của $hat(z)(t)$ được cho bởi #eqref(<eq:40>) hoặc #eqref(<eq:otherwise>). Giá trị $t^*$ có thể tính được trong thời gian $O(k log k)$, với $k$ là bậc của $v_1$, bằng cách sử dụng tìm kiếm nhị phân vì $t^* = inf{t >= 0: beta(t) <= B}$ và hàm $beta(.)$ được xác định trong @thm-computing-beta-t là hàm tuyến tính từng khúc và giảm dần.



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
    // content("l1.top",  [*$x^* = w^* - w$*], anchor: "top", padding: 0.2)
    content("l2.left",  [*Đổi hàm mục tiêu và\ điều kiện ngân sách*], anchor: "left", padding: 0.2)
    // content("l2.right",  [*Định lý 3*], anchor: "right", padding: 0.2)
    // content("l3.bottom",  [*Định lý 4.2 4.3 & (17)*], anchor: "bottom", padding: 0.2)
    content("l3.top",  [*Giảm chiều*], anchor: "top", padding: 0.2)
})
#figure(
  so-do-cac-bai-toan,
  caption: [Mối liên hệ giữa bốn bài toán nâng cấp bán kính ổn định],
) <fig-so-do-cac-bai-toan>
// Hình 2. Các phép biến đổi của bốn bài toán nâng cấp. Mỗi hộp chứa một bài toán và nghiệm tối ưu của nó. Mỗi mũi tên đại diện cho phép biến đổi giữa các bài toán cùng với những kết quả chính kết nối chúng.


Như vậy với các bước giải trên ta có được một thuật toán tổ hợp để giải bài toán #USR1. Bây giờ ta tiến hành phân tích độ phức tạp tính toán của giải thuật vừa đề xuất để chứng mình tính hiệu quả của thuật toán.

+ Ở Bước 1, giải tìm $hat(z)(t)$ tốn thời gian tối đa là $O(k log k)$ do phải tìm $underline(t)$ bằng giải thuật tìm kiếm nhị phân với độ phức tạp $O(k)$ ở mỗi bước lặp.

+ Ở Bước 2, ta cần tốn thời gian $O(n)$ để chuyển từ nghiêm $hat(z)(t)$ sang $hat(x)(t)$.


+ Ở Bước 3, việc giải tìm $t^*$ tốn thời gian $O(k log k)$ bằng giải thuật nhị phân và tốn $O(k)$ ở mỗi bước lặp. 

+ Ở Bước 4, ta tốn $O(n)$ để tính $w^*$ từ $x^*$.

Như vậy tổng thời gian cần để giải #USR1 là $O(n + k log k)$.

// *Định lý 4.4*

#theorem[Bài toán nâng cấp cận dưới của bán kính ổn định cho điểm trung vị trên đồ thị cây #USR1 có thể được giải quyết trong thời gian $O(n + k log k )$, trong đó $n$ là số đỉnh của cây và $k$ là bậc của điểm trung vị $v_1$.]

Cuối cùng, ta kết thúc mục này bằng ví dụ minh họa cho 04 bước chính để giải bài toán #USR1.

// *Ví dụ 4.1* 

#example[Xem xét bài toán #USR2 với ngân sách $B = 0.36$, mức độ nhiễu $epsilon_0 = 0.05$ và đồ thị cây có trọng số $w$ cho bởi   #figref[@fig-example-stability-radius]. Đặt $u_0 = v_1$, $u_1 = v_2$ $u_2 = v_3$ và $u_3 = v_4$. Ta dễ dàng tính được $gamma_j = angle.l w, bb(1)_T_u_j angle.r $ với $j= 0,1,2,3$, ta có $gamma_1 = 0.33$, $gamma_2 = 0.12$ và $gamma_3 = 0.45$

- Trong Bước 1, ta có giải #PUSR2 với tham số $t$ chưa xác định được công thức nghiệm $hat(z)(t)$ tính theo #eqref(<eq:40>) hoặc #eqref(<eq:otherwise>) và giá trị ngân sách tối ưu $ beta(t)= 2([gamma_1 - t]_+ + [gamma_2 - t]_+ + [gamma_3 - t]_+). $

- Ta tính gộp Bước 2 và Bước 3.  Ta tính được $t^*$ theo #myref[@eq-computing-topt], $ t^*=inf{t: beta(t) <= B}= 0.3. $ Trong trường hợp này, ta có $beta(t^*)=B$. Bởi vì $overline(z)_0= epsilon_0 = 0.05 < beta(t^*)/2 =0.18$, nên ta xác định $hat(z)(t^*)$ dựa vào #myref[@eq:otherwise], chú ý rằng $J^> (t^*)= {1,3}$, $J^(<=) (t^*)= {2}$ và ta có $ hat(z)(t^*)=(0.05, -0.03, 0.13, -0.15). $ Từ #myref[@eq-z-x], ta tính được $ hat(x)(t^*)$ từ $hat(z)(t^*)$ bằng $ (0.05, -0.01, 0.065, -0,05, -0.01, -0,01, 0.065, -0.05, -0.05). quad $ Dựa vào @thm-computing-topt, ta có thể chọn $x^* = hat(x)(t^*)$. 

- Ở Bước 4, ta có $w^* = w+x^*$
$ w^* = (0.15, 0.12, 0.125, 0.1, 0.09, 0.09, 0.125, 0.1, 0.15, 0.05). $


Như vậy giá trị lớn nhất của cận dưới bán kính ổn định sau khi được nâng cấp là $underline(R)(w^*)= 0.4/9. $
Trọng số đỉnh $w^*$ trên cây được cải thiện như ở #figref[@fig-example-upgrading-stability-radius.]


]

// #import "@preview/cetz:0.1.2": canvas, plot
// #import "@preview/cetz:0.2.2"
// #import "@preview/cetz:0.1.2"

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
  caption: [Đồ thị cây với trọng số mới sau khi nâng cấp cận dưới bán kính ổn định],
) <fig-example-upgrading-stability-radius>



