#text(orange)[*Upgrading 1-median*]

Trong khi các bài toán vị trí cổ điển tập trung vào việc tìm các vị trí tối ưu cho các cơ sở, nhiệm vụ của phiên bản nâng cấp tương ứng là thay đổi mạng lưới cơ sở hạ tầng theo các giới hạn nhất định sao cho giá trị mục tiêu tối ưu có thể đạt được trong mạng lưới đã được sửa đổi là tốt nhất (hoặc kém nhất) có thể. Trong bài báo này, chúng tôi cho phép thay đổi trọng số của các đỉnh trong các giới hạn đã cho sao cho thỏa mãn một ràng buộc ngân sách tuyến tính. Đối với bài toán 1-median nâng cấp, một thuật toán với thời gian O(n^2) được đề xuất. Bài toán 1-median hạ cấp được chứng minh là có thể giải quyết trong thời gian đa thức. Đối với trường hợp đặc biệt của cây, một tính chất đồng concavity dẫn đến thuật toán có thời gian O(n log n).

Trong bài báo này, chúng tôi xem xét một bài toán nâng cấp và hạ cấp mạng lưới, trong đó mục tiêu là thay đổi trọng số của các đỉnh trong các giới hạn nhất định sao cho chất lượng của vị trí cơ sở tối ưu kết quả là được tối đa hóa hoặc tối thiểu hóa.

Giả sử một công ty dự định mở một nhà máy mới với sức chứa là _*B*_. Thêm vào đó, giả sử có _n_ kho hàng hiện có, mỗi kho có dung tích lưu trữ là $w_i$ với $i=1,...,n$ và tổng nhu cầu nguyên liệu thô tại nhà máy là $sum_(i=1)^n w_i$.

Vì nhà máy có khả năng lưu trữ nguyên liệu (với chi phí vận chuyển bằng 0), công ty muốn xác định số lượng nguyên liệu lưu trữ tại mỗi kho cũng như vị trí tối ưu cho nhà máy để giảm thiểu tổng chi phí vận chuyển từ các kho đến nhà máy.

Ứng dụng này có thể được mô hình hóa bằng bài toán nâng cấp 1-median, trong đó nhiệm vụ là thay đổi trọng số của các đỉnh (ở đây là dung tích lưu trữ) trong các giới hạn nhất định (nhà máy có thể nhận tối đa B đơn vị) sao cho tổng chi phí vận chuyển đối với một vị trí tối ưu của nhà máy được giảm thiểu. Chúng ta không cố định một vị trí và cải thiện tối đa chất lượng của nó bằng cách thay đổi trọng số đỉnh, mà chúng ta thay đổi trọng số đỉnh trong bước đầu tiên và trong bước thứ hai, xác định một vị trí tối ưu dựa trên trọng số mới.

Các bài toán nâng cấp và hạ cấp là các bài toán sửa đổi mạng đặc biệt. Trong bài toán nâng cấp 1-median, chúng ta phải thay đổi các tham số của mạng trong những giới hạn nhất định sao cho giá trị mục tiêu tối ưu liên quan đến các tham số đã sửa đổi được giảm thiểu. Đối với phiên bản hạ cấp, nhiệm vụ là thay đổi các tham số để tối đa hóa giá trị mục tiêu tối ưu trong mạng đã sửa đổi. Cả hai phiên bản nâng cấp và hạ cấp đều được áp dụng cho bài toán 1-median, thuộc về những mô hình cơ bản quan trọng nhất của các bài toán xác định vị trí. Để có cái nhìn tổng quan về các bài toán xác định vị trí, độc giả có thể tham khảo Kariv và Hakimi [18], Mirchandani và Francis [21] và Drezner và Hamacher [9].

(Một biến thể chung của các bài toán nâng cấp và hạ cấp có dạng như sau: Cho một bài toán tối ưu hóa (tối thiểu hóa) với giá trị mục tiêu tối ưu \( z(w) \), trong đó \( w \) là một vector tham số. Nhiệm vụ của bài toán nâng cấp tương ứng là thay đổi các tham số trong một số giới hạn nhất định sao cho \( z(\tilde{w}) \) được tối thiểu hóa. Phiên bản hạ cấp là tối đa hóa \( z(\tilde{w}) \). Khái niệm này đã được áp dụng cho một số bài toán tối ưu hóa tổ hợp kinh điển, ví dụ như đường đi ngắn nhất và dài nhất (Fulkerson và Harding [11] và Hambrusch và Tu [16]), dòng chảy mạng (Phillips [22]), cây khung nhỏ nhất và cây Steiner (Frederickson và Solis-Oba [10], Drangmeister et al. [8] và Krumke et al. [19]). Một khung chung cho các phiên bản nâng cấp và hạ cấp của các bài toán tối ưu hóa tổ hợp 0/1 đã được nghiên cứu bởi Burkard, Klinz và Zhang [4] và Burkard, Lin và Zhang [5]. Hơn nữa, các phiên bản nâng cấp và hạ cấp cho bài toán 1-center trên mạng cũng đã được nghiên cứu (Gassner [13]).)

Các bài toán nâng cấp có liên quan chặt chẽ đến các bài toán ngược, trong đó một giải pháp khả thi được cho trước và nhiệm vụ là thay đổi các tham số trong một số giới hạn nhất định để tối đa hóa giá trị mục tiêu của giải pháp khả thi đã cho. Trong trường hợp các bài toán xác định vị trí, độc giả có thể tham khảo Burkard, Gassner và Hatzl [2, 3] và Zhang, Yang và Cai [23, 24].

Hơn nữa, các bài toán ngược cũng là các bài toán sửa đổi mạng, trong đó một giải pháp khả thi được cho trước. Nhưng ở đây, nhiệm vụ là thay đổi các tham số trong một số giới hạn nhất định với chi phí tối thiểu sao cho giải pháp đã cho trở nên tối ưu đối với các tham số đã sửa đổi. Các bài toán xác định vị trí ngược đã được nghiên cứu trong [6, 7, 12].

Ngọc Ngân 

Trong bài báo này, chúng tôi xem xét một biến thể của bài toán 1-median, trong đó mạng được sửa đổi trước khi cơ sở được đặt trên mạng. Các bài toán nâng cấp và hạ cấp có thể được xem như các bài toán hai cấp độ, trong đó một người ra quyết định (người hành động) thay đổi trọng số đỉnh trong một số giới hạn nhất định và một người ra quyết định khác (nhà lập kế hoạch vị trí hoặc người phản ứng) định vị cơ sở một cách tối ưu dựa trên các trọng số đỉnh mới. Mục tiêu của nhà lập kế hoạch vị trí là tối thiểu hóa giá trị mục tiêu 1-median. Tùy thuộc vào việc mục tiêu của người hành động và người phản ứng có giống nhau hay mâu thuẫn với nhau, chúng ta sẽ nói về các bài toán nâng cấp hoặc hạ cấp. Trong phiên bản nâng cấp, người hành động muốn tối thiểu hóa giá trị mục tiêu 1-median (tức là, người hành động và người phản ứng có cùng mục tiêu), trong khi trong phiên bản hạ cấp, người hành động tìm cách tối đa hóa giá trị mục tiêu 1-median trong khi nhà lập kế hoạch vị trí muốn tối thiểu hóa giá trị này. Do đó, phiên bản hạ cấp là một bài toán max-min.

Ký hiệu giá trị mục tiêu 1-median tối ưu với trọng số đỉnh \( w \) là \( z(w) \). Sau đó, nhiệm vụ của bài toán nâng cấp 1-median là tăng các trọng số bằng \( \delta = (\delta_v){v \in V} \) sao cho \( \delta \) là một sự thay đổi trọng số đỉnh khả thi và \( z(w - \delta) \) được tối thiểu hóa. Tương tự, bài toán hạ cấp 1-median là tìm một sự thay đổi trọng số khả thi \( \delta \) sao cho \( z(w + \delta) \) được tối đa hóa.

