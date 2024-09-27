#include "../tools/multi-section-ref.typ"
#import "../tools/macros.typ": eqref
#import "../typst-orange.typ": theorem, proof
#include "../tools/multi-section-ref.typ"
#import "../tools/macros.typ": eqref
#import "../typst-orange.typ": theorem, proof, lemma, proposition, corollary, example
#import "@preview/cetz:0.1.2": canvas, plot
#import "@preview/cetz:0.1.2"
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
