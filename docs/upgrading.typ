// trích bài báo Up- down grading the 1-median in a network Gassner
// #text(orange)[*Bài toán nâng cấp 1-median*]
== Bài toán nâng cấp  XXX 1-median

Trong khi các bài toán vị trí cổ điển chủ yếu tập trung vào việc xác định các vị trí tối ưu cho các cơ sở, bài toán nâng cấp hướng đến việc điều chỉnh mạng lưới cơ sở hạ tầng dưới những ràng buộc nhất định để đạt được giá trị mục tiêu tối ưu tốt nhất có thể trong mạng lưới đã được sửa đổi. Phần này sẽ trình bày bài toán nâng cấp 1-median thông qua việc thay đổi trọng số của các đỉnh trong các giới hạn đã cho, sao cho thỏa mãn một ràng buộc ngân sách tuyến tính. Đồng thời, phần này cũng đề xuất một thuật toán có thời gian tính toán $O(n^2)$ để giải quyết bài toán này.

Giả sử một công ty có kế hoạch mở một nhà máy mới với sức chứa _*B*_. Hiện tại, công ty có _n_ kho hàng, mỗi kho có sức chứa $w_i$ với $i=1,...,n$, (và tổng lượng nguyên liệu thô tại nhà máy là $sum_(i=1)^n w_i$). Công ty muốn xác định số lượng nguyên liệu lưu trữ tại mỗi kho cũng như vị trí tối ưu để đặt nhà máy nhằm giảm thiểu tổng chi phí vận chuyển từ các kho đến nhà máy.

Ứng dụng này có thể được mô hình hóa bằng bài toán nâng cấp 1-median, trong đó nhiệm vụ là thay đổi trọng số của các đỉnh (ở đây là sức chứa của mỗi kho) trong các giới hạn nhất định (nhà máy có thể nhận tối đa _B_ đơn vị) sao cho tổng chi phí vận chuyển đến vị trí của nhà máy được giảm thiểu. Do đó, bài toán này không cố định một vị trí và cải thiện tối đa chất lượng của nó bằng cách thay đổi trọng số đỉnh, mà thay vào đó, nó thực hiện hai bước: đầu tiên là thay đổi trọng số đỉnh và sau đó xác định vị trí tối ưu dựa trên các trọng số mới. Hay nói một cách cụ thể hơn, trong bài toán nâng cấp 1-median, ta phải thay đổi các tham số của mạng trong những giới hạn nhất định sao cho giá trị hàm mục tiêu 1-median tối ưu được giảm thiểu.


Các bài toán nâng cấp có mối liên hệ chặt chẽ với các bài toán ngược (reverse), trong đó một nghiệm khả thi được cho trước và nhiệm vụ là thay đổi các tham số trong một số giới hạn nhất định để tối đa hóa giá trị mục tiêu của nghiệm khả thi đó. Ngoài ra, các bài toán ngược (inverse) cũng thuộc loại bài toán sửa đổi mạng, trong đó một nghiệm khả thi đã được cho trước. Tuy nhiên, ở đây nhiệm vụ là thay đổi các tham số trong một số giới hạn nhất định với chi phí tối thiểu để nghiệm khả thi đã cho trở thành nghiệm tối ưu đối với các tham số đã được sửa đổi. Các bài toán xác định vị trí ngược đã được nghiên cứu trong [6, 7, 12]. (xem bài của Gassner)


//Trong bài báo này, chúng tôi xem xét một biến thể của bài toán 1-median, trong đó mạng được sửa đổi trước khi cơ sở được đặt trên mạng. Các bài toán nâng cấp và hạ cấp có thể được xem như các bài toán hai cấp độ, trong đó một người ra quyết định (người hành động) thay đổi trọng số đỉnh trong một số giới hạn nhất định và một người ra quyết định khác (nhà lập kế hoạch vị trí hoặc người phản ứng) định vị cơ sở một cách tối ưu dựa trên các trọng số đỉnh mới. Mục tiêu của nhà lập kế hoạch vị trí là tối thiểu hóa giá trị mục tiêu 1-median. Tùy thuộc vào việc mục tiêu của người hành động và người phản ứng có giống nhau hay mâu thuẫn với nhau, chúng ta sẽ nói về các bài toán nâng cấp hoặc hạ cấp. Trong phiên bản nâng cấp, người hành động muốn tối thiểu hóa giá trị mục tiêu 1-median (tức là, người hành động và người phản ứng có cùng mục tiêu), trong khi trong phiên bản hạ cấp, người hành động tìm cách tối đa hóa giá trị mục tiêu 1-median trong khi nhà lập kế hoạch vị trí muốn tối thiểu hóa giá trị này. Do đó, phiên bản hạ cấp là một bài toán max-min.
== #text(orange)[CHƯƠNG 2: KIẾN THỨC CHUẨN BỊ]
=== giới thiệu ký hiệu
Ký hiệu giá trị mục tiêu 1-median tối ưu với trọng số đỉnh $w$ là $f(w)$. Sau đó, nhiệm vụ của bài toán nâng cấp 1-median là tăng các trọng số bằng \( \delta = (\delta_v){v \in V} \) sao cho \( \delta \) là một sự thay đổi trọng số đỉnh khả thi và \( z(w - \delta) \) được tối thiểu hóa. Tương tự, bài toán hạ cấp 1-median là tìm một sự thay đổi trọng số khả thi \( \delta \) sao cho \( z(w + \delta) \) được tối đa hóa.

Một sự thay đổi trọng số đỉnh \( \delta = (\delta_v){v \in V} \) được gọi là khả thi nếu một ràng buộc ngân sách được đáp ứng và các thay đổi nằm trong các giới hạn nhất định: 

- Gọi \( c_v \in \mathbb{R}^+ \) cho \( v \in V \) là chi phí thay đổi trọng số của đỉnh \( v \) một đơn vị.
- Gọi \( u_v \in \mathbb{R}^+ \) cho \( v \in V \) là giới hạn trên cho việc thay đổi trọng số của đỉnh \( v \).
- Hơn nữa, chúng ta được cung cấp tổng ngân sách \( B \).

Sau đó, \( \delta \) là khả thi nếu \( \delta \in \Delta \) với ∆ = (δ vX∈V cvδv ≤ B and 0 ≤ δv ≤ uv for all v ∈ V )

Do đó, chúng ta có thể định nghĩa các bài toán nâng cấp và hạ cấp như sau:

Gọi \( G = (V, E) \) là một đồ thị với các trọng số đỉnh \( w_v \in \mathbb{R}^+ \), các hệ số chi phí \( c_v \in \mathbb{R}^+ \) và các giới hạn \( u_v \in \mathbb{R}^+ \) cho tất cả \( v \in V \), các độ dài cạnh \( \ell_e \in \mathbb{R}^+ \) cho tất cả \( e \in E \), và tổng ngân sách \( B \).

Sau đó, bài toán nâng cấp 1-median, viết tắt là Up1Median, là để giải quyết:
\[
\min_{\delta \in \Delta} z(w - \delta) = \min_{\delta \in \Delta} \min_{x \in V} \sum_{v \in V} (w_v - \delta_v) d(v, x).
\]

Và bài toán hạ cấp 1-median, viết tắt là Down1Median, là để giải quyết:
\[
\max_{\delta \in \Delta} z(w + \delta) = \max_{\delta \in \Delta} \min_{x \in V} \sum_{v \in V} (w_v + \delta_v) d(v, x).
\]

Trong bài báo này, chúng tôi sẽ trình bày một thuật toán thời gian \( O(n^2) \) cho Up1Median với điều kiện ma trận khoảng cách được cho trước. Đối với Down1Median, một công thức lập trình tuyến tính được đưa ra. Do đó, Down1Median có thể được giải quyết trong thời gian đa thức. Nếu đồ thị cơ bản là một cây, một loại tính chất lõm có thể được chứng minh cho Down1Median, điều này dẫn đến một thuật toán thời gian \( O(n \log n) \).
== #text(orange)[Giải bài toán]

Phần này dành riêng cho việc nâng cấp 1-median trong một đồ thị. Cho một đồ thị \( G = (V, E) \), trọng số đỉnh \( w_v \in \mathbb{R}^+ \), hệ số chi phí \( c_v \in \mathbb{R}^+ \) và các giới hạn \( u_v \leq w_v \in \mathbb{R}^+ \) cho tất cả \( v \in V \), độ dài cạnh \( \ell_e \in \mathbb{R}^+ \) cho tất cả các cạnh \( e \in E \) và một ngân sách \( B \), nhiệm vụ là giải quyết:
\[
\min_{\delta \in \Delta} \min_{x \in V} \sum{v \in V} (w_v - \delta_v)d(v, x)
\]

Vì chúng ta có thể hoán đổi hai phép toán tối thiểu đầu tiên, Down1Median tương đương với:

\[
\min_{x \in V} \min_{\delta \in \Delta} \sum{v \in V} (w_v - \delta_v) d(v, x)
\]

Điều này dẫn đến \( n \) bài toán reverse 1-median. Đối với mỗi đỉnh \( x \in V \), giá trị mục tiêu tương ứng của 1-median phải được cải thiện tối đa bằng một thay đổi trọng số khả thi. Cuối cùng, giá trị mục tiêu tốt nhất sau khi nâng cấp bằng với giá trị mục tiêu tối ưu của Up1Median. Mỗi bài toán reverse 1-median là một bài toán knapsack liên tục có thể được giải quyết trong thời gian \( O(n) \) (Balas và Zemel [1]). Do đó, Up1Median có thể được giải quyết bằng cách giải quyết \( n \) bài toán knapsack liên tục và cuối cùng so sánh các giá trị mục tiêu đã được cải thiện tối đa.

Định lý 1. Nâng cấp 1-median bằng cách thay đổi trọng số đỉnh có thể được giải quyết trong thời gian \( O(n^2) \) với điều kiện ma trận khoảng cách được cung cấp.

Chúng tôi kết thúc phần này với một ví dụ minh họa một số tính chất của Up1Median. Nói chung, 1-median thay đổi sau khi thay đổi trọng số tối ưu. Xét ví dụ sau đây của Up1Median được cho trong Hình 1 với \( B = 2 \).

(vẽ hình)

Các giá trị mục tiêu đối với các trọng số ban đầu là \( f(1) = f(3) = 9 \) và \( f(2) = 8 \). Do đó, đỉnh 2 là 1-median duy nhất. Bây giờ, cố định đỉnh 1 và cải thiện tối đa giá trị mục tiêu của nó. Khi đó \( \delta_1 = \delta_2 = 0 \) và \( \delta_3 = 2 \) là một cải thiện tối ưu và do đó giá trị mục tiêu mới của đỉnh 1 bằng \( \tilde{f}(1) = 5 \). Do đối xứng, \( \delta_1 = 2 \) và \( \delta_2 = \delta_3 = 0 \) là sự cải thiện tối ưu của đỉnh 3 với giá trị mục tiêu cải thiện \( \tilde{f}(3) = 5 \). Nếu đỉnh 2 được cải thiện tối đa thì \( \delta_1 = \delta_3 = 1 \) và \( \delta_2 = 0 \), và do đó giá trị mục tiêu cải thiện của đỉnh 2 là \( \tilde{f}(2) = 6 \). Như vậy, hoặc đỉnh 1 hoặc đỉnh 3 là 1-median sau khi thay đổi trọng số tối ưu, và do đó đỉnh 2 mất tính tối ưu của nó.