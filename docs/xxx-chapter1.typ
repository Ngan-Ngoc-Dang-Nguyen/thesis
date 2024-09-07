
// Nhớ đánh số trang và footnote
// Canh đều toàn văn bản
//#set align()
//nhớ thêm tích Hamdamard
#set math.equation(numbering: "(1)")
#import "../typst-orange.typ": chapter
#set page(numbering: "1")
#set page(header: [
  _Luận văn - Nguyễn Đặng Ngọc Ngân_
  #h(1fr)
  Trường Đại học Cần Thơ
])


= #text(orange)[*CHƯƠNG 1: KIẾN THỨC CHUẨN BỊ*]


== #text(orange)[1. LÝ THUYẾT ĐỒ THỊ]
=== #text(orange)[1.1 ĐỒ THỊ]

==== #text(orange)[1.1.1 Khái niệm đồ thị]

Trong thực tế, việc biểu diễn các đối tượng và mối quan hệ giữa chúng là vô cùng quan trọng, phục vụ cho nhiều mục đích trong các lĩnh vực khác nhau. Ví dụ, trong mạng xã hội, để nghiên cứu mối quan hệ của các cá nhân với nhau, chúng ta cần một công cụ có thể mô hình hóa các kết nối này một cách trực quan và hiệu quả. Đồ thị là công cụ hữu ích để thực hiện việc này.

Ngoài mạng xã hội, đồ thị còn được ứng dụng rộng rãi trong nhiều lĩnh vực khác. Ví dụ, trong giao thông, đồ thị giúp mô phỏng các điểm đến và các tuyến đường kết nối, từ đó tối ưu hóa hành trình di chuyển, giảm thiểu tắc nghẽn và tiết kiệm thời gian. Trong quản lý chuỗi cung ứng, đồ thị có thể hỗ trợ việc theo dõi quá trình vận chuyển hàng hóa giữa các nhà kho và điểm giao nhận, từ đó tối ưu hóa quy trình, giảm chi phí và cải thiện hiệu suất.

Nhờ khả năng trực quan hóa mối quan hệ giữa các đối tượng, đồ thị đã trở thành một công cụ quan trọng trong việc phân tích và giải quyết các vấn đề phức tạp trong đời sống thực tế, từ nghiên cứu mạng xã hội đến quản lý giao thông và chuỗi cung ứng. Tóm lại, đồ thị là gì?

Đồ thị $G$ trong lý thuyết đồ thị là một cấu trúc toán học được sử dụng để mô tả mối quan hệ giữa các đối tượng. 

Một đồ thị (graph) $G$ là một bộ ba $(V(G),E(G),psi_G)$ bao gồm một tập khác rỗng $V(G)$ các đỉnh (vertices) của $G$, một tập $E(G)$ các cạnh (edges) của $G$, và một hàm liên thuộc (incidence function) $psi_G$ đặt tương ứng mỗi cạnh với một cặp đỉnh không theo thứ tự (hai đỉnh không nhất thiết phải khác nhau). Nếu $e$ là một cạnh và $u,v$ là hai đỉnh sao cho $psi_G(e) = u v$, thì ta nói $e$ nối $u$ và $v$; các đỉnh $u$ và $v$ được gọi là các điểm đầu mút (ends) của $e$.

Ví dụ, ta xét đồ thị $G=(V(G),E(G),psi_G)$ với $V(G)={v_1,v_2,v_3,v_4,v_5}, E(G)={e_1,e_2,e_3,e_4,e_5,e_6}$ và $psi_G$ được xác định bởi $psi_G(e_1)=v_1v_2, psi_G(e_2)=v_2v_3, psi_G(e_3)= v_2v_4, psi_G(e_4)=v_1v_5, psi_G(e_5)=v_3v_5, psi_G(e_6)=v_1v_4$. Hình bên dưới là một biểu diễn hình học của đồ thị $G$.

#import "@preview/cetz:0.2.2": canvas, plot
#import "@preview/cetz:0.2.2"
#import "@preview/cetz:0.2.2"

  
  #align(center)[#canvas(length: 10%, {
    import cetz.draw: *

    let y = 2 
    let x = 4
    let y-space = 1
    let h=1.4

    circle((0*h,3), radius: 0.05,fill:black, name: "v1") 
    content("v1.bottom", $v_1$, anchor: "left", padding: 0.2)

    circle((-3, 3), radius: 0.05, fill: black, name: "v2") 
    content("v2.right", $v_2$, anchor: "right", padding: 0.2)

    circle((2, 1), radius: 0.05,fill:black, name: "v3") 
    content("v3.right", $v_3$, anchor: "bottom", padding: 0.2)

    circle((-1, 0), radius: 0.05,fill:black, name: "v4") 
    content("v4.bottom", $v_4$, anchor: "left", padding: 0.2)

    circle((-3, 1), radius: 0.05, fill: black, name: "v5") 
    content("v5.bottom", $v_5$, anchor: "right", padding: 0.2)

    //circle((0*h, 1), radius: 0.05, fill: black, name: "v7") 
    //content("v7.bottom", $v_7 (0.06)$, anchor: "left", padding: 0.2)

    //circle((2*h, 2), radius: 0.05, fill: black, name: "v4") 
    //content("v4.bottom", $v_4 (0.15)$, anchor: "left", padding: 0.2)

    //circle((1*h, 1), radius: 0.05, fill: black, name: "v8") 
    //content("v8.bottom", $v_8 (0.2)$, anchor: "left", padding: 0.2)
    //circle((3*h, 1), radius: 0.05, fill:black, name: "v9") 
    //content("v9.bottom", $v_9 (0.1)$, anchor: "left", padding: 0.2)
    
    line("v1", "v2", name: "v1v2")
    content("v1v2.bottom", $e_1$, anchor: "bottom", padding: 0.2)
    line("v2", "v3", name: "v2v3")
    content("v2v3.top", $e_2$, anchor: "top", padding: 0.7)
    line("v2", "v4", name: "v2v4")
    content("v2v4.top", $e_3$, anchor: "top", padding: 0.9)
    line("v5", "v1", name: "v5v1")
    content("v5v1.top", $e_4$, anchor: "top", padding: 1.1)
    line("v3", "v5", name: "v3v5")
    content("v3v5.top", $e_5$, anchor: "top", padding: 0.1)
    line("v4", "v1", name: "v4v1")
    content("v4v1.top", $e_6$, anchor: "top", padding: 1.4)
    // line("v4", "v8")
    // line("v4", "v9")  
}
  )]