#include "../tools/multi-section-ref.typ"
#import "../tools/macros.typ": eqref, remark-Le, delete-Le, add-Le, remark-Ngan, delete-Ngan, add-Ngan, theorem, definition, proposition, lemma, proof,


// = Kết luận và thảo luận 
#heading(numbering: none, level: 1)[Kết luận]
// #remark-Le[Kết luận]
\ 

// #remark-Le[
//   - Kết luận: Các kết quả đạt được
//   - Thảo luận: Lấy conclusion của bài báo vô. Các hướng nghiên cứu tiếp theo
// ]
*Kết quả nghiên cứu.* Trong bài báo này, chúng tôi nghiên cứu bán kính ổn định của vị trí trung vị trên đồ thị cây, trong đó trọng số các đỉnh là các tham số có thể thay đổi. 

Đóng góp của luận văn gồm hai phần chính:

+ Trong phần thứ nhất, chúng tôi chứng minh rằng mặc dù bán kính ổn định được định nghĩa một cách không tường minh, chúng tôi xây dựng được một cận dưới cho bán kính ổn định này. Cận dưới này có công thức tường minh, đơn giản và chặt, theo nghĩa là nó bằng đúng bán kính ổn định dưới những điều kiện không ngặt.

+ Trong phần thứ nhất, chúng tôi khảo sát bài toán nâng cao cận dưới bán kính ổn định bằng cách điều chỉnh các trọng số đỉnh trong một ngân sách cho phép, đồng thời duy trì tính tối ưu của điểm trung vị ban đầu. Chúng tôi đề xuất một giải thuật tổ hợp hiệu quả để giải bài toán này trong thời gian gần tuyến tính. Kỹ thuật chính của chúng tôi bao gồm một chuỗi biến đổi đơn giản hóa bài toán như đổi biến, giảm số chiều. Trong đó, kỹ thuật quan trọng là  hoán đổi giá trị mục tiêu và ràng buộc ngân sách của bài toán chính để xây dựng một bài toán tham số có thể giải được tường minh.

\

*Các hướng nghiên cứu tiếp theo trong tương lai.* Từ những kết quả nghiên cứu trên, có nhiều hướng phát triển tiềm năng trong tương lai. Hai trong số đó là:
// Một số hướng nghiên cứu trong tương lai gồm:

+ Chúng tôi dự định nghiên cứu nâng cấp trực tiếp bán kính ổn định của điểm 1-median trên cây thay vì cận dưới của nó. Bài toán này là bài toán tối ưu hai lớp, phi tuyến và không lồi, nên khá khó để giải. Chúng tôi dự định sẽ giải bài toán này bằng các giải thuật gần đúng.


+ Chúng tôi cũng dự định nghiên cứu bài toán nâng cấp bán kính ổn định của điểm 1-center trên đồ thị cây. Chúng tôi dự định sẽ có có hướng tiếp cận tương tự bằng cách thiết lập cận dưới bán kính ổn định rồi nghiên cứu bài toán upgrading. Tuy vậy, để tìm được một ước lượng cận dưới đủ chặt cũng là một thách thức không nhỏ trong trường hợp 1-center.