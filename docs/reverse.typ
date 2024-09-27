
#include "../tools/multi-section-ref.typ"
#import "../tools/macros.typ": eqref
#include "../tools/multi-section-ref.typ"
#import "../tools/macros.typ": eqref
#import "../typst-orange.typ": theorem, proof, lemma, proposition, corollary, example
#import "@preview/cetz:0.1.2": canvas, plot
#import "@preview/cetz:0.1.2"
#include "../tools/multi-section-ref.typ"
#import "../tools/macros.typ": eqref
#import "../typst-orange.typ": theorem, proof, lemma, proposition, corollary, example
#include "../tools/multi-section-ref.typ"
#import "../tools/macros.typ": eqref
#import "../typst-orange.typ": theorem, proof
== BÀI TOÁN REVERSE 1-MEDIAN TRÊN CÂY

Trong phạm vi luận văn này, chúng ta sẽ tập trung vào bài toán reverse cơ bản, một chủ đề được nghiên cứu rộng rãi và có nhiều ứng dụng thực tiễn mạnh mẽ. Tuy nhiên, để phù hợp với mục tiêu của luận văn, chúng ta chỉ trình bày mô hình đơn giản nhất của bài toán.

Một ví dụ thực tế của bài toán reverse có thể thấy trong lĩnh vực quy hoạch đô thị. Giả sử nhà nước đã xác định một vị trí quan trọng, chẳng hạn như một trường học, để phục vụ cho cộng đồng dân cư. Tuy nhiên, do các yếu tố khách quan như sự gia tăng lưu lượng giao thông, việc di chuyển từ các khu dân cư khác đến vị trí này trở nên khó khăn hơn. Mục tiêu của nhà nước là điều chỉnh quy hoạch (chẳng hạn như cải thiện đường giao thông hoặc thậm chí tái phân bố dân cư) nhằm tối ưu hóa việc di chuyển từ các khu dân cư đến vị trí quan trọng này. Đây là một ví dụ cơ bản cho bài toán reverse 1-median trên cây.

=== Định nghĩa và giải thuật

Cho đồ thị cây $T = (V, E)$ gồm $n$ đỉnh, mỗi đỉnh $i, i = 1,...,n$ được gán một trọng số không âm $w_i$ và mỗi cạnh có một độ dài không âm. Xét một đỉnh $v' in V$ bất kỳ. Gọi $delta_i$ là lượng điều chỉnh trọng số của đỉnh $i$, với điều kiện $delta_i <= u_i$, trong đó $u_i$ là giới hạn điều chỉnh của đỉnh $i$. Chi phí để điều chỉnh trọng số của đỉnh $i$ một lượng $delta_i$ được ký hiệu là $c_i(delta_i)$.

Mục tiêu của bài toán reverse 1-median trên cây là tìm cách điều chỉnh trọng số của các đỉnh sao cho hàm $f(v')$ đạt giá trị nhỏ nhất. Đồng thời, quá trình điều chỉnh phải tuân theo các ràng buộc về ngân sách tổng chi phí và giới hạn điều chỉnh tại mỗi đỉnh.

Ta có thể viết lại bài toán như sau:

$

 min_(v in V) sum_(i=1)^n (w_i - delta_i) d(v_i,v') \

"s.t." sum_(i=1)^n c_i delta_i <= B \

0 <= delta_i <= u_i \
$ <eq:41>

Để giải bài toán #eqref(<eq:41>), ta có thể chuyển về giải bài toán sau:

$

 max sum_(i=1)^n delta_i d(v_i,v') \

"s.t." sum_(i=1)^n c_i delta_i <= B \

0 <= delta_i <= u_i \
$ <eq:42>

Rõ ràng, mô hình bài toán #eqref(<eq:42>) tương ứng với bài toán xếp ba lô liên tục. Do đó ta có thể giải quyết bài toán này trong thời gian $O(n)$.

#theorem[ Bài toán reverse 1-median trên cây có thể được giải trong thời gian $O(n)$.]

*Ví dụ* Cho cây $T(V,E)$ có trọng số như hình bên dưới. Chọn điểm $v_2$ và điều chỉnh trọng số đỉnh trên cây $T$ trong ngân sách $B= 5$ để $f(v_2)$ nhỏ nhất. Đồng thời vẫn thỏa mãn các ràng buộc sau:
$c_1=1, c_2 = 2, c_3 = 4, c_4 =3, c_5=1, c_6 = 3 $
$
0 <= delta_1 <= 2, 
0 <= delta_2 <= 1,
0 <= delta_3 <= 2,
0 <= delta_4 <= 2,
0 <= delta_5 <= 1,
0 <= delta_6 <= 3.
$

#align(center)[#canvas(length: 7%, {
    import cetz.draw: *

    let y = 2 
    let x = 4
    let y-space = 1
    let h=1.4

    circle((0*h,3), radius: 0.05,fill:black, name: "v2")
    content("v2.left", $v_2 (5)$, anchor: "left", padding: 0.2)

    circle((-3,0), radius: 0.05,fill:black, name: "v1")
    content("v1.left", $v_1 (6)$, anchor: "left", padding: 0.2)

    circle((-3,6), radius: 0.05,fill:black, name: "v3")
    content("v3.left", $v_3 (7)$, anchor: "left", padding: 0.2)

    circle((4,3), radius: 0.05,fill:black, name: "v4")
    content("v4.left", $v_4 (4)$, anchor: "left", padding: 0.2)

    circle((7,6), radius: 0.05,fill:black, name: "v5")
    content("v5.left", $v_5 (3)$, anchor: "left", padding: 0.2)

    circle((7,0), radius: 0.05,fill:black, name: "v6")
    content("v6.left", $v_6 (3)$, anchor: "left", padding: 0.2)

    line("v1","v2", name: "v1v2")
    content("v1v2.left", $2$)

    line("v3","v2", name: "v2v3")

    content("v2v3.left", $2$)

    line("v4","v2", name: "v4v2")
    content("v4v2.left", $3$)

    line("v4","v5", name: "v4v5")
    content("v4v5.left", $2$)

    line("v4","v6", name: "v4v6")
    content("v4v6.left", $4$)

     }
  )]

Dựa vào dữ kiện ban đầu, ta có thể tính được $f(v_2)$ lúc này nhận giá trị bằng 74. Bây giờ ta sẽ tiến hành cải thiện giá trị này.
Tức là ta cần giải bài toán sau:

$

 max sum_(i=1)^6 delta_i d(v_i,v_2) \

"s.t." sum_(i=1)^6 c_i delta_i <= 3 \

0 <= delta_1 <= 2 \
0 <= delta_2 <= 1 \
0 <= delta_3 <= 2 \
0 <= delta_4 <= 2 \
0 <= delta_5 <= 1 \
0 <= delta_6 <= 3 \
$ 
Sau khi giải bài toán xếp ba lô liên tục, ta thu được:
$ delta_5 = 1, delta_6 = 3, delta_1 = 2, delta_2 = delta_3= delta_4 = 0. $

Ta được đồ thị cây $T$ với trọng số các đỉnh sau khi được cải thiện như sau:

#align(center)[#canvas(length: 7%, {
    import cetz.draw: *

    let y = 2 
    let x = 4
    let y-space = 1
    let h=1.4

    circle((0*h,3), radius: 0.05,fill:black, name: "v2")
    content("v2.left", $v_2 (5)$, anchor: "left", padding: 0.2)

    circle((-3,0), radius: 0.05,fill:black, name: "v1")
    content("v1.left", $v_1 (4)$, anchor: "left", padding: 0.2)

    circle((-3,6), radius: 0.05,fill:black, name: "v3")
    content("v3.left", $v_3 (7)$, anchor: "left", padding: 0.2)

    circle((4,3), radius: 0.05,fill:black, name: "v4")
    content("v4.left", $v_4 (4)$, anchor: "left", padding: 0.2)

    circle((7,6), radius: 0.05,fill:black, name: "v5")
    content("v5.left", $v_5 (2)$, anchor: "left", padding: 0.2)

    circle((7,0), radius: 0.05,fill:black, name: "v6")
    content("v6.left", $v_6 (0)$, anchor: "left", padding: 0.2)

    line("v1","v2", name: "v1v2")
    content("v1v2.left", $2$)

    line("v3","v2", name: "v2v3")

    content("v2v3.left", $2$)

    line("v4","v2", name: "v4v2")
    content("v4v2.left", $3$)

    line("v4","v5", name: "v4v5")
    content("v4v5.left", $2$)

    line("v4","v6", name: "v4v6")
    content("v4v6.left", $4$)

     }
  )]
Khi đó, $f(v_2) = 44.$
  
