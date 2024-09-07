
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

// = #text(orange)[*CHƯƠNG 1: KIẾN THỨC CHUẨN BỊ*]
= KIẾN THỨC CHUẨN BỊ

== LÝ THUYẾT ĐỒ THỊ

// === Đồ thị



// == #text(orange)[1. LÝ THUYẾT ĐỒ THỊ]
// === #text(orange)[1.1 ĐỒ THỊ]

=== Khái niệm đồ thị

Trong thực tế, việc biểu diễn các đối tượng và mối quan hệ giữa chúng là vô cùng quan trọng, phục vụ cho nhiều mục đích trong các lĩnh vực khác nhau. Ví dụ, trong mạng xã hội, để nghiên cứu mối quan hệ của các cá nhân với nhau, chúng ta cần một công cụ có thể mô hình hóa các kết nối này một cách trực quan và hiệu quả. Đồ thị là công cụ hữu ích để thực hiện việc này.

Ngoài mạng xã hội, đồ thị còn được ứng dụng rộng rãi trong nhiều lĩnh vực khác. Ví dụ, trong giao thông, đồ thị giúp mô phỏng các điểm đến và các tuyến đường kết nối, từ đó tối ưu hóa hành trình di chuyển, giảm thiểu tắc nghẽn và tiết kiệm thời gian. Trong quản lý chuỗi cung ứng, đồ thị có thể hỗ trợ việc theo dõi quá trình vận chuyển hàng hóa giữa các nhà kho và điểm giao nhận, từ đó tối ưu hóa quy trình, giảm chi phí và cải thiện hiệu suất.

Nhờ khả năng trực quan hóa mối quan hệ giữa các đối tượng, đồ thị đã trở thành một công cụ quan trọng trong việc phân tích và giải quyết các vấn đề phức tạp trong đời sống thực tế, từ nghiên cứu mạng xã hội đến quản lý giao thông và chuỗi cung ứng. Tóm lại, đồ thị là gì?

Đồ thị $G$ trong lý thuyết đồ thị là một cấu trúc toán học được sử dụng để mô tả mối quan hệ giữa các đối tượng. 

Một đồ thị (graph) $G$ là một bộ ba $(V(G),E(G),psi_G)$ bao gồm một tập khác rỗng $V(G)$ các đỉnh (vertices) của $G$, một tập $E(G)$ các cạnh (edges) của $G$, và một hàm liên thuộc (incidence function) $psi_G$ đặt tương ứng mỗi cạnh với một cặp đỉnh không theo thứ tự (hai đỉnh không nhất thiết phải khác nhau). Nếu $e$ là một cạnh và $u,v$ là hai đỉnh sao cho $psi_G(e) = u v$, thì ta nói $e$ nối $u$ và $v$; các đỉnh $u$ và $v$ được gọi là các điểm đầu mút (ends) của $e$.

Ví dụ, ta xét đồ thị $G=(V(G),E(G),psi_G)$ với $V(G)={v_1,v_2,v_3,v_4,v_5}, E(G)={e_1,e_2,e_3,e_4,e_5,e_6}$ và $psi_G$ được xác định bởi $psi_G(e_1)=v_1v_2, psi_G(e_2)=v_2v_3, psi_G(e_3)= v_2v_4, psi_G(e_4)=v_1v_5, psi_G(e_5)=v_3v_5, psi_G(e_6)=v_1v_4$. Hình bên dưới là một biểu diễn hình học của đồ thị $G$.

#import "@preview/cetz:0.1.2": canvas, plot
#import "@preview/cetz:0.1.2"
// #import "@preview/cetz:0.2.2"

  
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

#align(center)[#text(orange)[*Hình 1.1*] Minh họa biểu diễn hình học của một đồ thị]



Ví dụ: Trong một đồ thị, các đỉnh có thể biểu thị cho các cá nhân, trong khi các cạnh biểu thị cho mối quan hệ bạn bè giữa các cá nhân đó. Trong hệ thống giao thông, các thành phố được biểu diễn bằng cách đỉnh và các tuyến đường nối giữa chúng là các cạnh. 

// //#align(center)[

// #import "@preview/bob-draw:0.1.0": *
// #show raw.where(lang: "bob"): it => render(it)

// #render(
//     ```
//       1       2         3
//        *------*--------*    
//     4 /    5 /        /   
//      *------*        * 6
//       \             /              
//        \           /             
//         *---------* 8
//         7
    
//     ```,
//     width: 40%,
// )]
//#align(center)[#text(orange)[*Hình 1.1*] Minh họa biểu diễn hình học của một đồ thị]

Đồ thị vô hướng (undirected graph) là một loại đồ thị trong đó các cạnh không có hướng. Điều này có nghĩa là nếu có một cạnh giữa hai đỉnh $u$ và $v$ thì cạnh này có thể được đi từ $u$ đến $v$ và ngược lại có thể đi từ $v$ đến $u$ . Nói cách khác, mối quan hệ giữa các đỉnh là hai chiều và không có sự phân biệt về hướng. Hình 1.1 bên trên là đồ thị vô hướng.

Trong khi đó, đồ thị có hướng (directed graph) là một loại đồ thị trong đó mỗi cạnh có hướng. Điều này có nghĩa là mỗi cạnh được biểu diễn bởi một cặp đỉnh có thứ tự, chỉ định hướng đi từ đỉnh đầu đến đỉnh cuối. Trong đồ thị có hướng, nếu có cạnh từ đỉnh $u$ đến đỉnh $v$ thì không nhất thiết phải có cạnh từ đỉnh $v$ đến đỉnh $u$. Hình bên dưới là một ví dụ của đồ thị có hướng.

#import "@preview/cetz:0.1.2": canvas, plot
#import "@preview/cetz:0.2.2"
  #import "@preview/cetz:0.1.2"

  
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
    line("v1", "v2", name: "v1v2", mark:(end: ">", fill: orange))
    content("v1v2.bottom", $e_1$, anchor: "bottom", padding: 0.2)
    line("v2", "v3", name: "v2v3", mark:(end: ">", fill: orange))
    content("v2v3.top", $e_2$, anchor: "top", padding: 0.7)
    line("v2", "v4", name: "v2v4", mark:(end: ">", fill: orange))
    content("v2v4.top", $e_3$, anchor: "top", padding: 0.9)
    line("v5", "v1", name: "v5v1", mark:(end: ">", fill: orange))
    content("v5v1.top", $e_4$, anchor: "top", padding: 1.1)
    line("v3", "v5", name: "v3v5", mark: (end: ">", fill: orange))
    content("v3v5.top", $e_5$, anchor: "top", padding: 0.1)
    line("v4", "v1", name: "v4v1", mark:(end: ">", fill: orange))
    content("v4v1.top", $e_6$, anchor: "top", padding: 1.4)
    // line("v4", "v8")
    // line("v4", "v9")  
}
  )]
#align(center)[#text(orange)[*Hình 1.2*]  Đồ thị có hướng]

Đồ thị có trọng số (Weighted Graph) là loại đồ thị trong đó các đỉnh và các cạnh được gán các giá trị trọng số. Trọng số của đỉnh thường biểu thị các yếu tố như dân số, tài nguyên hoặc mức độ quan trọng của điểm đó, trong khi trọng số của cạnh thường đại diện cho khoảng cách, chi phí hoặc thời gian di chuyển giữa các điểm. Ví dụ, trong một đồ thị biểu diễn các điểm dân cư, mỗi đỉnh có thể gán với trọng số biểu thị dân số tại khu vực đó, còn mỗi cạnh có trọng số thể hiện khoảng cách giữa hai điểm dân cư.

#align(center)[#canvas(length: 10%, {
    import cetz.draw: *

    let y = 2 
    let x = 4
    let y-space = 1
    let h=1.4

    circle((0*h,3), radius: 0.05,fill:black, name: "v1") 
    content("v1.bottom", $v_1 (5)$, anchor: "left", padding: 0.2)

    circle((-3, 1.5), radius: 0.05, fill: black, name: "v2") 
    content("v2.right", $v_2 (2)$, anchor: "right", padding: 0.2)

    circle((3, 1.5), radius: 0.05, fill: black, name: "v3") 
    content("v3.right", $v_3 (3)$, anchor: "right", padding: 0.2)
     circle((2, 5), radius: 0.05, fill: black, name: "v4") 
    content("v4.right", $v_4 (1)$, anchor: "right", padding: 0.2)

     circle((-2, 5), radius: 0.05, fill: black, name: "v5") 
    content("v5.right", $v_5 (7)$, anchor: "right", padding: 0.2)

     circle((0, 5), radius: 0.05, fill: black, name: "v6") 
    content("v6.right", $v_6 (2)$, anchor: "right", padding: 0.2)

    line("v1", "v2", name: "v1v2")
    content("v1v2.top", $3$, anchor: "top", padding: 0.5)

    line("v1", "v3", name: "v1v3")
    content("v1v3.top", $3$, anchor: "top", padding: 0.5)

    line("v1", "v5", name: "v1v5")
    content("v1v5.top", $2$, anchor: "top", padding: 0.7)

    line("v1", "v4", name: "v1v4")
    content("v1v4.top", $2$, anchor: "top", padding: 0.5)

    line("v1", "v6", name: "v1v6")
    content("v1v6.right", $1$, anchor: "right", padding: 0.1)
    
    }
  )]

#align(center)[#text(orange)[*Hình 1.3*]  Đồ thị có trọng số]


Đồ thị không có trọng số(Unweighted Graph): Các cạnh và các đỉnh không có trọng số. Hình 1.1 và 1.2 là hai đồ không có trọng số.

Đồ thị liên thông(Connected Graph): Từ một đỉnh bất kỳ, ta có thể đi đến tất cả các đỉnh khác thông qua các cạnh. (Ví dụ minh họa)

#align(center)[#canvas(length: 10%, {
    import cetz.draw: *

    let y = 2 
    let x = 4
    let y-space = 1
    let h=1.4

    circle((0*h,3), radius: 0.05,fill:black, name: "v1") 
    content("v1.top", $v_1$, anchor: "top", padding: 0.2)

    circle((-3, 3), radius: 0.05, fill: black, name: "v2") 
    content("v2.right", $v_2$, anchor: "right", padding: 0.2)

    circle((3, 3), radius: 0.05, fill: black, name: "v3") 
    content("v3.left", $v_3$, anchor: "left", padding: 0.2)
    circle((-3, 0), radius: 0.05, fill: black, name: "v4") 
    content("v4.right", $v_4$, anchor: "right", padding: 0.2)

    circle((3, 0), radius: 0.05, fill: black, name: "v5") 
    content("v5.left", $v_5$, anchor: "left", padding: 0.2)

    //  circle((0, 5), radius: 0.05, fill: black, name: "v6") 
    // content("v6.right", $v_6 (2)$, anchor: "right", padding: 0.2)

    line("v1", "v2", name: "v1v2")
    //content("v1v2.top", $3$, anchor: "top", padding: 0.5)

    line("v1", "v3", name: "v1v3")
    // content("v1v3.top", $3$, anchor: "top", padding: 0.5)

    line("v2", "v4", name: "v1v4")
    // content("v1v5.top", $2$, anchor: "top", padding: 0.7)

    line("v1", "v4", name: "v1v4")
    // content("v1v4.top", $2$, anchor: "top", padding: 0.5)

    line("v1", "v5", name: "v1v5")
    // content("v1v6.right", $1$, anchor: "right", padding: 0.1)
    line("v3", "v5", name: "v3v5")
    line("v4", "v5", name: "v4v5")
    }
  )]
#align(center)[#text(orange)[*Hình 1.4*]  Đồ thị liên thông]

4. Đồ thị không liên thông(Disconnected Graph): Tồn tại ít nhất một đỉnh, mà từ đỉnh đó ta không thể đi đến một số đỉnh khác. Hình bên dưới là đồ thị không liên thông vì tồn tại đỉnh $v_4$ mà từ đỉnh này ta không thể đi đến các đỉnh còn lại của đồ thị.

#align(center)[#canvas(length: 10%, {
    import cetz.draw: *

    let y = 2 
    let x = 4
    let y-space = 1
    let h=1.4

    circle((0*h,3), radius: 0.05,fill:black, name: "v1") 
    content("v1.top", $v_1$, anchor: "top", padding: 0.2)

    // circle((-3, 3), radius: 0.05, fill: black, name: "v2") 
    // content("v2.right", $v_2$, anchor: "right", padding: 0.2)

    circle((3, 3), radius: 0.05, fill: black, name: "v3") 
    content("v3.left", $v_3$, anchor: "left", padding: 0.2)
    circle((-3, 0), radius: 0.05, fill: black, name: "v2") 
    content("v2.right", $v_2$, anchor: "right", padding: 0.2)

    circle((3, 0), radius: 0.05, fill: black, name: "v4") 
    content("v4.left", $v_4$, anchor: "left", padding: 0.2)

    //  circle((0, 5), radius: 0.05, fill: black, name: "v6") 
    // content("v6.right", $v_6 (2)$, anchor: "right", padding: 0.2)

    //line("v1", "v2", name: "v1v2")
    //content("v1v2.top", $3$, anchor: "top", padding: 0.5)

    //line("v1", "v3", name: "v1v3")
    // content("v1v3.top", $3$, anchor: "top", padding: 0.5)

    // line("v2", "v4", name: "v1v4")
    // content("v1v5.top", $2$, anchor: "top", padding: 0.7)

    line("v1", "v2", name: "v1v2")
    // content("v1v4.top", $2$, anchor: "top", padding: 0.5)

    line("v1", "v3", name: "v1v3")
    // content("v1v6.right", $1$, anchor: "right", padding: 0.1)
    //line("v3", "v5", name: "v3v5")
    line("v2", "v3", name: "v2v3")
    }
  )]
#align(center)[#text(orange)[*Hình 1.4*]  Đồ thị không liên thông]


// ==== #text(orange)[1.1.2 Một số khái niệm liên quan]
=== Một số khái niệm liên quan
(a) Nếu $u$ là một điểm đầu mút của cạnh $e$ thì ta nói $u$ và $e$ _liên thuộc(incident)_ với nhau.

#align(center)[#canvas(length: 10%, {
    import cetz.draw: *

    let y = 2 
    let x = 4
    let y-space = 1
    let h=1.4

    circle((0*h,3), radius: 0.05,fill:black, name: "v1") 
    content("v1.left", $u$, anchor: "left", padding: 0.2)

    circle((-3, 3), radius: 0.05, fill: black, name: "v2") 
    content("v2.right", $v$, anchor: "right", padding: 0.2)

    line("v1", "v2", name: "v1v2")
    content("v1v2.top", $e$, anchor: "top", padding: 0.1)
    
    }
  )]
#align(center)[#text(orange)[*Hình 1.5*] $u$ và $e$ liên thuộc nhau]

(b) Hai đỉnh liên thuộc với cùng một cạnh được gọi là hai đỉnh _liền kề(adjacent)_. Trong Hình 1.5, $u$ và $v$ cùng liên thuộc cạnh $e$ nên $u$ và $v$ là hai đỉnh liền kề. 

(c) Hai cạnh liên thuộc với cùng một đỉnh được gọi là hai cạnh _liền kề_. Hình 1.6, rõ ràng ta có thể thấy $e_1$ và $e_2$ cùng liên thuộc đỉnh $u$ nên $e_1, e_2$ là hai cạnh liền kề. 

#align(center)[#canvas(length: 10%, {
    import cetz.draw: *

    let y = 2 
    let x = 4
    let y-space = 1
    let h=1.4

    circle((0*h,3), radius: 0.05,fill:black, name: "v1") 
    content("v1.left", $u$, anchor: "left", padding: 0.2)

    circle((-3, 3), radius: 0.05, fill: black, name: "v2") 
    content("v2.right", $v$, anchor: "right", padding: 0.2)

    circle((0, 0), radius: 0.05, fill: black, name: "v3") 
    content("v3.right", $z$, anchor: "right", padding: 0.2)

    line("v1", "v2", name: "v1v2")
    content("v1v2.top", $e_1$, anchor: "top", padding: 0.1)
    line("v1", "v3", name: "v1v3")
    content("v1v3.right", $e_2$, anchor: "right", padding: 0.1)
    
    }
  )]
#align(center)[#text(orange)[*Hình 1.6*] $e_1$ và $e_2$ liền kề nhau]


(d) Một cạnh có hai điểm đầu mút trùng nhau được gọi là một _vòng(loop)_. (Vẽ hình minh hoa)


(e) Hai hay nhiều cạnh mà có hai đầu mút giống nhau được gọi là _các cạnh song song(parallel edges)_ hay còn được gọi là _các cạnh bội(multiple edges)_.

(e) Hai hay nhiều cạnh mà có hai đầu mút giống nhau được gọi là _các cạnh song song(parallel edges)_ hay còn được gọi là _các cạnh bội(multiple edges)_.

#align(center)[#canvas(length: 10%, {
    import cetz.draw: *

    let y = 2 
    let x = 4
    let y-space = 1
    let h=1.4

    circle((0*h,3), radius: 0.05,fill:black, name: "u")
    content("u.left", $u$, anchor: "left", padding: 0.2)

    circle((-3, 3), radius: 0.05, fill: black, name: "v") 
    content("v.right", $v$, anchor: "right", padding: 0.2)

    circle((0, 0), radius: 0.05, fill: black, name: "z") 
    content("z.right", $z$, anchor: "right", padding: 0.2)

    line("u", "v", name: "v1v2")
    content("v1v2.bottom", $e_1$, anchor: "bottom", padding: 0.1)

    bezier("u","v", (-1.5,2), name: "be1")
    content("be1.top", $e_4$, anchor: "top", padding: 0.2)

    line("u", "z", name: "v1v3")
    content("v1v3.right", $e_2$, anchor: "right", padding: 0.1)

    line("v", "z", name: "v2v3")
    content("v2v3.left", $e_3$, anchor: "left", padding: 1)

    bezier("z","v", (-4,-3), name: "be2")
    content("be2.right", $e_5$, anchor: "right", padding: 2.7)
    
    }
  )]
#align(center)[#text(orange)[*Hình 1.7*] Minh họa các cạnh bội]

(f) Đồ thị hữu hạn (finite graph) là đồ thị có cả tập hợp cạnh và tập hợp đỉnh đều hữu hạn. Các hình được đề cập bên trên đều là đồ thị hữu hạn.

(g) Đơn đồ thị (simple graph) là một đồ thị không có vòng và không có cạnh song song.

// ==== #text(orange)[1.1.3 Bậc và đường đi]
=== Bậc và đường đi

Bậc_(Degree)_ _d(v)_ của đỉnh _v_ trong _G_ là số cạnh của _G_ liên thuộc với _v_, mỗi vòng được tính là hai cạnh. (Cho ví dụ).

Đường đi_(walk)_ trong _G_ là một dãy khác rỗng hữu hữu gồm các đỉnh và các cạnh xen kẽ nhau. Nếu các cạnh của đường đi đôi một khác nhau thì đường đi đó được gọi là _đường đi đơn(trail)_. Trong khi đó, nếu các đỉnh của đường đi đôi một khác nhau thì được gọi là đường đi sơ cấp_(path)_.

Chu trình_(closed walk)_ là một đường đi có chiều dài dương và có đỉnh đầu và đỉnh cuối trùng nhau. _Chu trình đơn(closed trail)_ là một chu trình có các cạnh đôi một khác nhau. _Chu trình sơ cấp(cycle)_ là một chu trình đơn có các đỉnh đôi một khác nhau ngoại trừ đỉnh đầu và đỉnh cuối.

Đối với đồ thị có trọng số, _độ dài đường đi(length)_ bằng tổng trọng số cạnh của đường đi đó.

(Ví dụ minh họa)
// ==== #text(orange)[1.1.4 Đồ thị cây]
=== Đồ thị cây
Một _cây(tree)_ là một đồ thị liên thông không có chu trình sơ cấp.
(Ví dụ, vẽ hình)

#text(orange)[*Định lý 1.1*] _Trong một cây, hai đỉnh bất kỳ được nối với nhau bằng một đường đi sơ cấp duy nhất._

#text(orange)[*Chứng minh*]

Ta sẽ chứng minh bằng phản chứng. Cho _G_ là một cây và giả sử rằng trong _G_ có hai đường đi sơ cấp khác nhau từ _u_ đến _v_ là $P_1$ và $P_2$. Vì $P_1 != P_2$ nên tồn tại một cạnh $e=x y $ của $P_1$ không phải là cạnh của $P_2$. Rõ ràng đồ thị $(P_1 union P_2) - e$ liên thông, xem hình(....). Do đó, nó chứa một đường đi sơ cấp $P$ đi từ $x$ đến $y$. Khi đó $ P + e$ là một chu trình sơ cấp trong $G$, mâu thuẫn với giả thiết $G$ là một cây. $square.stroked.medium$

Lá (leaf) là các đỉnh (node) trong cây có bậc (degree) bằng 1. Nói cách khác, một đỉnh là lá nếu nó chỉ kết nối với đúng một đỉnh khác trong cây. 
(Ví dụ minh họa)

Hàm khoảng cách trên đồ thị cây là hàm lồi

//ĐN kỹ lại a ( nên sài N^1 như trong bài báo)

Với hai điểm $x$ và $y$ gọi $P(x,y)$ là đường đi nối $x$ và $y$.

#text(orange)[*Bổ đề 1*] (Trích Bài p-maxian) Đặt $a,x,y$ và $z$ là bốn điểm phân biệt nằm trên cây $T$ sao cho $z in P(x,y)$ thì $z in P(a,x)$ hoặc $z in P(a,y)$.


#text(orange)[*Chứng minh*]

Theo giả thiết, ta có $z in P(x,y)$. Ta giả sử $ z in.not P(a,x)$ và $z in.not P(a,y)$ (như hình vẽ) (vẽ hình minh họa). Bởi vì đường đi kết nối $x$ và $y$ đi qua $a$ nhưng không chứa $z$, trong khi đó đường đi $P(x,y)$ chứa $z$. Vì vậy, tồn tại hai con đường nối $x$ và $y$ và điều này mâu thuẫn với tính chất của đồ thị cây.$square.stroked.medium$

Bây giờ ta đặt $f_1(x,a) eq.triple d(x,a)$ là hàm khoảng cách từ một điểm bất kỳ trên đồ thị đến $a$.

#text(orange)[*Bổ đề 2*] (Trích Convex Location Problems on Tree Networks)$f_1(x,a)$ là hàm lồi khi và chỉ khi $T$ là đồ thị cây.

#text(orange)[*Chứng minh*] Ta sẽ tiến hành chứng minh hai chiều.

Giả sử, $T$ là đồ thị cây. Chọn $y,z$ bất kỳ nằm trên cây $T$, $0<lambda<1$ và $x in P(y,z)$. Để chứng minh $f_1(x,a)$ là hàm lồi, ta cần chứng minh $d(x,a) <= lambda d(y,a) + (1-lambda) d(z,a)$ hoặc ta có thể chứng minh bất đẳng thức sau:

$ d(x,a) d(y,z) <= d(x,z) d(y,a) + d(x,y) d(z,a) $ <eq:distance-a>

(Cách trích dẫn @eq:distance-a )

Vì $x in P(y,z)$ nên theo _Bổ đề 1_, ta có $x in P(y,a)$ hoặc $x in P(z,a)$.

Mặc khác, vì $x in P(y,z)$ nên 

$d(x,a)d(y,z)=d(x,a)[d(y,x)+d(x,z)]=d(x,a)d(y,x)+d(x,a)d(x,z)$. (2)

Giả sử, $x in P(z,a)$ ta có:

$d(x,a)=d(z,a)-d(z,x)$ (3)

Hơn nữa, $d(x,a)=d(y,x)-d(a,y) <= d(a,y)+d(y,x)$ (4)

Thay (3) và (4) vào (2) ta được (1).

Trường hợp $x in P(y,a)$ cũng được chứng minh tương tự.

Tiếp theo, đặt $f_1(x,a)$ là hàm lồi trên tập các điểm thuộc đồ thị $T$ và giả sử rằng $T$ không phải là cây. Nói cách khác, tồn tại một chu trình $C$ của $T$ có độ dài ngắn nhất, giả sử là $l$, trong tất cả các chu trình của $T$. Bởi vì $C$ là một chu trình ngắn nhất trong $T$, nên ta có thể chọn $x,y,z$ và $a$ trong $C$ sao cho $d(a,x)=d(y,z)=l/2$, $d(a,y)=d(x,y)=d(z,a)=d(x,z)=l/4$ và $d(x,z)=1/2 d(y,z)$. Khi đó $f_1(x,a)=(l/2) > (1/2)f_1(y,a) + (1/2)f_1(z,a)=l/4 $, điều này mâu thuẫn với giả thiết $f_1(x,a)$ là hàm lồi. Vậy $T$ là đồ thị cây. $square.stroked.medium$

(Có thể thêm bổ đề 3)

-Nghiệm cục bộ cũng là nghiệm toàn cục => trên cây giải hiệu quả....
(Có thể chứng minh thêm nghiệm cục bộ là nghiệm toàn cục)





