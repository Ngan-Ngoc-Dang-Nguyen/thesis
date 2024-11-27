#import "../tools/macros.typ": eqref, remark-Le, delete-Le, add-Le, remark-Ngan, delete-Ngan, add-Ngan




#pagebreak()
#heading(numbering: none, level: 1)[Mở đầu]

// *1. Lý do chọn đề tài* 
#heading(numbering: none, level: 2, outlined: false)[a. Lý do chọn đề tài]

\ 

Bài toán vị trí (Location problems) là một lớp bài toán quan trọng trong Vận trù học (Operation Research) và được nghiên cứu một cách rộng rãi, độc giả có thể tham khảo thêm từ các tài liệu như @marianov2024location hoặc @laporte2019introduction. Đáng chú ý trong số đó là bài toán vị trí trung vị (1-median) bởi tính ứng dụng thực tiễn cao của nó. Trong bài toán này, mục tiêu là xác định một điểm trên đồ thị sao cho tổng khoảng cách có trọng số từ mọi đỉnh đến điểm đó là nhỏ nhất. Vị trí 1-median có thể được dùng để xây dựng các cơ sở quan trọng như các kho hàng, bệnh viện, trường học hoặc các trung tâm dịch vụ công cộng, nhằm tối thiểu hóa thời gian di chuyển của người dân. Một ví dụ cụ thể trong lĩnh vực logistics là _bài toán kho đến trạm phân phối_ (warehouse-to-lockers), được nghiên cứu bởi @espejo2023p. Trong mô hình này, nhà kho cần được đặt tại vị trí 1-median trên mạng lưới đồ thị để giảm thiểu tổng chi phí vận chuyển đến các trạm phân phối. Mỗi trạm phân phối có sức chứa xác định để đáp ứng nhu cầu khách hàng, và chi phí vận chuyển từ nhà kho đến từng trạm được tính dựa trên khoảng cách và quy mô nhu cầu.

Tuy nhiên, trong thực tế, hàng hóa và chi phí vận chuyển không phải lúc nào cũng cố định. Chúng thường biến động dưới ảnh hưởng của nhiều yếu tố khách quan. Chẳng hạn, lượng hàng hóa tại các trạm phân phối có thể thay đổi do điều kiện thời tiết, mùa vụ, hoặc tình hình tài chính của người dân trong khu vực. Sự dao động này tại các trạm phân phối không chỉ ảnh hưởng đến nhu cầu hàng hóa mà còn tác động trực tiếp đến vị trí tối ưu của kho chứa. Điều này cho thấy tính ổn định của vị trí 1-median có thể bị tác động bởi các yếu tố bên ngoài.

Để nghiên cứu tính ổn định của kho hàng nói riêng và vị trí 1-median nói chung, _bán kính ổn định_ là một công cụ đặc biệt hữu ích. Bán kính ổn định đo lường mức độ nhiễu tối đa của các tham số trong mô hình, trong khi vẫn đảm bảo rằng vị trí tối ưu ban đầu vẫn còn giữ tính tối ưu trong phạm vi nhiễu đó. Điều này giúp đánh giá tính ổn định của vị trí tối ưu khi đối mặt với những thay đổi không mong muốn trong thực tế. Mặc dù đã có nhiều nghiên cứu phân tích tính ổn định trong nhiều bài toán tối ưu, bán kính trong bài toán vị trí 1-median trên đồ thị dường như chưa nhận được sự quan tâm nghiên cứu đầy đủ. Theo chúng tôi, việc đi sâu vào chủ đề này không chỉ góp phần bổ sung lý thuyết mà còn mang lại tiềm năng ứng dụng trong việc ra quyết định về tính tối ưu trong logistics và quy hoạch đô thị.

Do đó, trong luận văn này, tôi sẽ tập trung nghiên cứu sâu về bán kính ổn định của điểm 1-median trên đồ thị cây. Luận văn gồm hai đóng góp chính. Thứ nhất, chúng tôi nhận thấy rằng định nghĩa bán kính ổn định là không tường minh dẫn đến việc tính toán chính xác bán kính ổn định là một thách thức không nhỏ.  Do đó, chúng tôi đề xuất một ước lượng cận dưới của bán kính ổn định. Thứ hai, luận văn sẽ nghiên cứu đề xuất một thuật toán tổ hợp hiệu quả nhằm nâng cấp cận dưới của bán kính ổn định nói trên.

// *2. Mục đích nghiên cứu*
#heading(numbering: none, level: 2, outlined: false)[b. Mục đích nghiên cứu]

\ 

Mục đích nghiên cứu của luận văn này là định nghĩa được bán kính ổn định, nghiên cứu công thức tường minh cho cận dưới bán kính ổn định của điểm 1-median trên đồ thị cây và đồng thời tìm ra giải thuật để nâng cấp cận dưới bán kính ổn định đó.

// *3. Đối tượng nghiên cứu*
#heading(numbering: none, level: 2, outlined: false)[c. Đối tượng nghiên cứu]

\ 

- Bán kính ổn định của điểm 1-median trên cây.
- Bài toán nâng cấp cận dưới bán kính ổn định.

Ngoài ra, để bổ khuyết cho nghiên cứu trên, chúng tôi cũng nghiên cứu các kiến thức bổ trợ liên quan

- Nghiên cứu lý thuyết đồ thị.
- Nghiên cứu bài toán vị trí 1-median.
- Nghiên cứu một số bài toán ngược: bài toán inverse 1-median, reverse 1-median, upgrading 1-median.

// *4. Phạm vi nghiên cứu*
#heading(numbering: none, level: 2, outlined: false)[d. Phạm vi nghiên cứu]

\

- Bài toán vị trí.
- Đồ thị cây.
- Các lớp bài toán ngược.
- Bán kính ổn định.

// *5. Phương pháp nghiên cứu*
#heading(numbering: none, level: 2, outlined: false)[e. Phương pháp nghiên cứu]

\

- Tổng hợp tài liệu: Lý thuyết đồ thị, bài toán vị trí, các bài toán ngược trên đồ thị và một số bài toán liên quan.
- Nghiên cứu lý thuyết: Ước lượng cận dưới bán kính ổn định của điểm 1-median trên cây.
- Nghiên cứu thuật toán: Thuật toán tổ hợp, phân tích độ phức tạp tính toán.

// *6. Nội dung chính của luận văn*
#heading(numbering: none, level: 2, outlined: false)[f. Nội dung chính của luận văn]

\

- Chương 1: Kiến thức chuẩn bị.

- Chương 2: Cận dưới bán kính ổn định và nâng cấp cận dưới.

// *7. Kết quả đạt được* 
#heading(numbering: none, level: 2, outlined: false)[g. Kết quả đạt được]

\

Luận văn đã thành công trong việc tìm ra công thức tường minh cho cận dưới bán kính ổn định của vị trí 1-median trên cây và đồng thời đề xuất một thuật toán để nâng cấp cận dưới nói trên.

Kết quả của luận văn được trình bày trong bài báo khoa học đang được phản biện bởi Tạp chí _Asia-Pacific Journal of Operational Research (Q3 Scopus)_.
// #align(center)[_Stability Radius and an Upgrading Model of Median Location on Trees_]




// #pagebreak()
// #heading(numbering: none, level: 1)[Kết quả đạt được]



// #remark-Le[Bài báo khoa học: 01 bài báo đang review tại Asia-Pacific Journal of Operational Research (APJOR). Bài báo là kết quả của các thành viên gồm: ...] 




