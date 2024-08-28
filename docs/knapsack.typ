//knapsack book
Bài toán xếp ba lô (knapsack) có thể được định nghĩa một cách chính thức như sau: Chúng ta có một chiếc ba lô với $N$ là tập hợp các vật phẩm, bao gồm $n$ vật phẩm $x_j$ với lợi nhuận $P_j$ và trọng lượng $W_j$, cùng với sức chứa $c$. Thông thường, tất cả các giá trị này đều là số nguyên dương. Mục tiêu là chọn một tập con của $N$ sao cho tổng lợi nhuận của các vật phẩm được chọn là lớn nhất và tổng trọng lượng không vượt quá $c$.

Bài toán xếp ba lô có thể được viết dưới dạng công thức sau:

$(K P)$
$
max quad & sum_(j=1)^n p_j x_j\

"s.t." quad & sum_(j=1)^n w_j x_j <= c\

 & x_j in {0,1}, quad quad quad quad j= 1,...,n
$
Trong đó, nếu $x_j = 0$ nghĩa là ta không chọn vật phẩm $x_j$. Ngược lại, nếu $x_j =1$ ta sẽ chọn vật phẩm đó.

Xem xét đặc điểm của người leo núi trong bối cảnh kinh doanh thay vì giải trí dẫn đến một cách diễn giải cổ điển thứ hai của bài toán ba lô $(K P)$ như là một bài toán đầu tư. Một cá nhân hoặc nhà đầu tư tổ chức giàu có có một số tiền nhất định $c$ mà họ muốn đầu tư vào các dự án kinh doanh có lợi nhuận. Để làm cơ sở cho những quyết định của mình, họ lập một danh sách dài các khoản đầu tư có thể, bao gồm số tiền cần thiết $W_j$ và lợi nhuận ròng dự kiến $p_j$ trong một khoảng thời gian cố định cho mỗi khoản đầu tư. Yếu tố rủi ro không được xem xét rõ ràng ở đây. Rõ ràng, việc kết hợp các quyết định nhị phân cho mỗi khoản đầu tư sao cho tổng lợi nhuận đầu tư là lớn nhất có thể được mô hình hóa bởi bài toán xếp ba lô $(K P)$. 

Một ví dụ minh họa thứ ba về tình huống thực tế được thể hiện qua bài toán xếp ba lô $(K P)$ là trong kinh doanh vận chuyển hàng hóa của hãng hàng không. Nhân viên điều phối của một hãng hàng không vận chuyển hàng hóa phải quyết định xem yêu cầu vận chuyển nào từ khách hàng nên được thực hiện. Quyết định của anh ta dựa trên danh sách các yêu cầu chứa trọng lượng $W_j$ của mỗi kiện hàng và mức phí trên mỗi đơn vị trọng lượng được tính cho từng yêu cầu. Lưu ý rằng, mức phí này không cố định mà phụ thuộc vào các thỏa thuận dài hạn cụ thể của mỗi khách hàng. Do đó, lợi nhuận $p_j$ mà công ty thu được từ việc chấp nhận một yêu cầu và xếp kiện hàng tương ứng lên máy bay không tỷ lệ trực tiếp với trọng lượng của kiện hàng. Rõ ràng, trong thực tế, mỗi chiếc máy bay có một sức chứa tối đa $c$ cụ thể không được vượt quá bởi tổng trọng lượng của các kiện hàng được chọn. Vấn đề hậu cần này là một tương đồng trực tiếp với việc đóng gói ba lô của người leo núi. 

Ngoài các trường hợp rõ ràng của bài toán ba lô, cũng cần lưu ý rằng nhiều phương pháp giải quyết các bài toán phức tạp hơn sử dụng bài toán ba lô (đôi khi theo cách lặp đi lặp lại) như một bài toán con. Do đó, việc nghiên cứu sâu về bài toán ba lô mang lại nhiều lợi ích cho một loạt các mô hình toán học khác nhau.

*1.2 Các biến thể và mở rộng của bài toán xếp ba lô*

*1.3 Thuật toán tham lam*

Nếu một người không chuyên đang cố gắng tìm một giải pháp tốt cho bài toán ba lô $( K P)$, tức là một cách đóng gói các đối tượng vào ba lô sao cho có lợi nhuận cao, thì một cách tiếp cận trực quan sẽ là xem xét tỷ lệ lợi nhuận trên trọng lượng $e_j$ của mỗi đối tượng, còn được gọi là hiệu suất của một đối tượng

$ e_j = p_j / w_j $

và cố gắng đặt các đối tượng có hiệu suất cao nhất vào ba lô. Rõ ràng, những đối tượng này sẽ tạo ra lợi nhuận cao nhất trong khi tiêu thụ ít dung lượng nhất. Do đó, trong phần này, chúng ta sẽ giả định rằng các đối tượng được sắp xếp theo hiệu suất của chúng theo thứ tự giảm dần, sao cho
$ p_1 / w_i >= p_2/w_2  >= ... >= p_n/w_n $ (1)

Ý tưởng của thuật toán tham lam với giá trị lời giải $z_G$ là bắt đầu với một ba lô trống và đơn giản là đi qua các đối tượng theo thứ tự giảm dần của hiệu suất, thêm từng đối tượng vào ba lô nếu điều đó không vi phạm ràng buộc về dung lượng 

*Thuật toán*
// Trang 36 knapsack book

*Ví dụ* Ta xem xét một ví dụ $(K P)$ với sức chứa của ba lô $c=9$ và số vật phẩm hiện có là $n=7$ với giá trị và trọng lượng được cho ở bảng bên dưới.

// Kẻ bảng

Các đối tượng đã được sắp xếp theo hiệu suất giảm dần. Thuật toán Greedy đưa các đối tượng 1,2 và 7 vào ba lô, tạo ra lợi nhuận $z_G =14$.

*Độ phức tạp tính toán*

Sau khi sắp xếp các đối tượng theo (1) trong thời gian $O(n log n)$, thời gian chạy của Greedy là $O(n)$ vì mỗi đối tượng được xem xét tối đa một lần.