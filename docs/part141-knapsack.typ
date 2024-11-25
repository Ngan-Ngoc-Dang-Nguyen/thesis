//knapsack book

// #include "../tools/multi-section-ref.typ"
// #import "../tools/macros.typ": eqref
// #include "../tools/multi-section-ref.typ"
// #import "../tools/macros.typ": eqref
// #import "../typst-orange.typ": theorem, proof, lemma, proposition, corollary, example
// #import "@preview/cetz:0.1.2": canvas, plot
// #import "@preview/cetz:0.1.2"
// #include "../tools/multi-section-ref.typ"
// #import "../tools/macros.typ": eqref
// #import "../typst-orange.typ": theorem, proof, lemma, proposition, corollary, example
// #include "../tools/multi-section-ref.typ"
// #import "../tools/macros.typ": eqref
// #import "../typst-orange.typ": theorem, proof

#include "../tools/multi-section-ref.typ"
#import "@preview/cetz:0.1.2": canvas, plot
#import "@preview/cetz:0.1.2"
#import "../tools/macros.typ": eqref, remark-Le, delete-Le, add-Le, remark-Ngan, delete-Ngan, add-Ngan, theorem, definition, proposition, lemma, proof, example
// === BÀI TOÁN KNAPSACK
== Inverse 1-median và các bài toán liên quan


// Bài toán xếp ba lô (knapsack) có thể được định nghĩa một cách chính thức như sau: Chúng ta có một chiếc ba lô với $N$ là tập hợp các vật phẩm, bao gồm $n$ vật phẩm $x_j$ với lợi nhuận $P_j$ và trọng lượng $W_j$, cùng với sức chứa $c$. Thông thường, tất cả các giá trị này đều là số nguyên dương. Mục tiêu là chọn một tập con của $N$ sao cho tổng lợi nhuận của các vật phẩm được chọn là lớn nhất và tổng trọng lượng không vượt quá $c$.
=== Bài toán Xếp ba lô
==== Bài toán xếp ba lô 0-1

Trong phần này, chúng ta sẽ khám phá bài toán xếp ba lô (_Knapsack Problem_) - một bài toán kinh điển trong tối ưu hóa tổ hợp, được sử dụng rộng rãi để giải quyết nhiều bài toán tối ưu phức tạp trong thực tế. Bài toán này đòi hỏi chúng ta phải lựa chọn các đối tượng trong một tập hợp sao cho tối đa hóa giá trị tổng thể mà không vượt quá một giới hạn nhất định, thường là về trọng lượng hoặc dung lượng.

Để dễ hình dung, hãy xem xét ví dụ sau: Một tên trộm đột nhập vào cửa hàng và thấy có $n$ món hàng, mỗi món có trọng lượng và giá trị khác nhau. Tuy nhiên, hắn chỉ có một chiếc ba lô với sức chứa giới hạn $c$. Vấn đề đặt ra là tên trộm nên chọn những món nào, và số lượng bao nhiêu, để tối đa hóa tổng giá trị mà vẫn đảm bảo tổng trọng lượng của những món đồ không vượt quá khả năng chứa của chiếc ba lô.


// ==== Định nghĩa bài toán

Bài toán ba lô 0-1 (_0-1 Knapsack Problem_) là một trong những biến thể quan trọng và phổ biến nhất của bài toán xếp ba lô. Trong phiên bản này, mỗi vật phẩm đều chỉ có hai lựa chọn: hoặc được chọn hoàn toàn để đưa vào ba lô, hoặc bị bỏ qua hoàn toàn. Điều này tạo nên tên gọi "0-1", biểu thị rằng quyết định cho mỗi vật phẩm chỉ có thể là "0" (không chọn) hoặc "1" (chọn).

Bài toán ba lô 0-1 thường xuất hiện trong các tình huống thực tế, nơi mà các vật phẩm không thể phân chia hoặc chỉ có thể được lựa chọn toàn bộ. Thách thức chính trong bài toán này là phải cân đối giữa giá trị tổng hợp của các vật phẩm và giới hạn trọng lượng của ba lô, sao cho tối ưu hóa tổng giá trị nhận được mà không vượt quá sức chứa.

Bài toán này thuộc nhóm các bài toán NP-khó, điều đó có nghĩa là không có thuật toán nào giải quyết nó một cách tối ưu trong thời gian đa thức cho mọi trường hợp, khiến việc tìm kiếm các phương pháp gần đúng hoặc giải pháp xấp xỉ trở thành một hướng tiếp cận quan trọng.

Tiếp theo, chúng ta sẽ tiến hành mô hình hóa bài toán xếp ba lô dưới dạng toán học như sau.

Bài toán xếp ba lô (_Knapsack Problem_) có thể được định nghĩa một cách chính thức như sau: Chúng ta có một chiếc ba lô với sức chứa tối đa $c$. Ta có $n$ vật phẩm $(j = 1,...,n)$, mỗi vật phẩm có một giá trị $p_j$ và trọng lượng $w_j$. Thông thường, tất cả các giá trị này đều là số nguyên dương. Mục tiêu của bài toán là chọn ra một tập hợp các vật phẩm sao cho tổng giá trị của chúng là lớn nhất, nhưng tổng trọng lượng không được vượt quá sức chứa $c$.

Bài toán xếp ba lô có thể được viết dưới dạng công thức sau:

// $(K P 0-1)$
$
max quad & sum_(j=1)^n p_j x_j\

"s.t." quad & sum_(j=1)^n w_j x_j <= c\

 & x_j in {0,1}, quad quad quad quad j= 1,...,n
$
Trong đó, nếu $x_j = 0$ nghĩa là ta không chọn vật phẩm $x_j$. Ngược lại, nếu $x_j =1$ ta sẽ chọn vật phẩm đó.

//  Một cá nhân hoặc nhà đầu tư tổ chức giàu có có một số tiền nhất định $c$ mà họ muốn đầu tư vào các dự án kinh doanh có lợi nhuận. Để làm cơ sở cho những quyết định của mình, họ lập một danh sách dài các khoản đầu tư có thể, bao gồm số tiền cần thiết $W_j$ và lợi nhuận ròng dự kiến $p_j$ trong một khoảng thời gian cố định cho mỗi khoản đầu tư. Yếu tố rủi ro không được xem xét rõ ràng ở đây. Rõ ràng, việc kết hợp các quyết định nhị phân cho mỗi khoản đầu tư sao cho tổng lợi nhuận đầu tư là lớn nhất có thể được mô hình hóa bởi bài toán xếp ba lô $(K P)$. 

// Một ví dụ minh họa thứ ba về tình huống thực tế được thể hiện qua bài toán xếp ba lô $(K P)$ là trong kinh doanh vận chuyển hàng hóa của hãng hàng không. Nhân viên điều phối của một hãng hàng không vận chuyển hàng hóa phải quyết định xem yêu cầu vận chuyển nào từ khách hàng nên được thực hiện. Quyết định của anh ta dựa trên danh sách các yêu cầu chứa trọng lượng $W_j$ của mỗi kiện hàng và mức phí trên mỗi đơn vị trọng lượng được tính cho từng yêu cầu. Lưu ý rằng, mức phí này không cố định mà phụ thuộc vào các thỏa thuận dài hạn cụ thể của mỗi khách hàng. Do đó, lợi nhuận $p_j$ mà công ty thu được từ việc chấp nhận một yêu cầu và xếp kiện hàng tương ứng lên máy bay không tỷ lệ trực tiếp với trọng lượng của kiện hàng. Rõ ràng, trong thực tế, mỗi chiếc máy bay có một sức chứa tối đa $c$ cụ thể không được vượt quá bởi tổng trọng lượng của các kiện hàng được chọn. Vấn đề hậu cần này là một tương đồng trực tiếp với việc đóng gói ba lô của người leo núi. 

Ngoài những bài toán thực tiễn liên quan đến xếp ba lô, cần lưu ý rằng nhiều phương pháp giải quyết các bài toán phức tạp hơn thường sử dụng bài toán xếp ba lô như một bài toán con. Do đó, việc nghiên cứu kỹ lưỡng về bài toán xếp ba lô không chỉ giúp ta nắm vững vấn đề này mà còn mang lại nhiều lợi ích cho việc phát triển và áp dụng các mô hình toán học đa dạng khác.

// ==== Giải thuật tham lam cho bài toán xếp ba lô 0-1

Thuật toán tham lam là một phương pháp giải quyết bài toán tối ưu bằng cách đưa ra các lựa chọn tại mỗi bước dựa trên tiêu chí tốt nhất tại thời điểm đó, mà không xem xét các lựa chọn trong tương lai. Mỗi bước lựa chọn là _tham lam_ vì nó cố gắng tối đa hóa hoặc tối thiểu hóa một số yếu tố tức thời, với hy vọng rằng chuỗi các lựa chọn này sẽ dẫn đến kết quả tối ưu toàn cục.

Áp dụng vào bài toán xếp ba lô 0-1, một cách tiếp cận tự nhiên là đánh giá tỷ lệ lợi nhuận trên trọng lượng $e_j$
của mỗi vật phẩm, còn gọi là hiệu suất của vật phẩm.

$ e_j = p_j / w_j $

và cố gắng đặt các đối tượng có hiệu suất cao nhất vào ba lô. Rõ ràng, những đối tượng này sẽ tạo ra lợi nhuận cao nhất trong khi tiêu tốn ít không gian nhất. Do đó, trong phần này, chúng ta sẽ giả định rằng các đối tượng được sắp xếp theo hiệu suất của chúng theo thứ tự giảm dần, sao cho
$ p_1 / w_i >= p_2/w_2  >= ... >= p_n/w_n $ <eq:21>

Ý tưởng của thuật toán tham lam với kết quả tối ưu $z_G$ là bắt đầu với một ba lô trống và lần lượt xem xét các vật phẩm theo thứ tự giảm dần của hiệu suất, thêm từng vật phẩm vào ba lô nếu điều đó không vi phạm ràng buộc về sức chứa của ba lô.

// #set table.hline(stroke: .7pt)

// #table(
//   table.hline(),
//   stroke: none,
//   columns: (auto, 4fr),
//   [*ĐẦU VÀO*],  [Các vật phẩm $x_j, j=1,...,n$, $p_j, w_j$ lần lượt là giá trị và khối lượng vật phẩm $x_j$, ba lô với sức chứa $c$],
//   [*Bước 0*],  [Sắp xếp các vật phẩm theo thứ tự giảm dần của hiệu suất $e_j$, $overline(w):= 0, z_G := 0$],
//   [*Bước 1*],  [Xem xét vật phẩm $x_1$],
//   // [*Bước 2*],  [Nếu $V={v_k}$ thì trả về: $X^*={v_k}.$],
//   [*Bước 3*],  [],
//   [$w_1$ ],  [Trả về: $X^*={x in v_k v_l}$, trong đó $v_l$ liền kề $v_k$.],
//   [$w_k >$ $W$/2],  [Trả về: $X^*={v_k}$],
//   [$w_k <$ $W$/2],  [Sang Bước 4.],
//   [*Bước 4*],  [Đặt $w_l := w_l + w_k$ với $v_l$ liền kề $v_k$ và xét cây mới $T:= T without {v_k}$. Trở về Bước 1.],
//   table.hline(),
//   [*ĐẦU RA*],  [$X^*$ là tập hợp tất cả các điểm 1-median.],
// )

#import "@preview/showybox:2.0.1": showybox

#showybox(
  [*THUẬT TOÁN THAM LAM*

  *ĐẦU VÀO:* Có $n$ vật phẩm $x_j$, $p_j, w_j$ lần lượt là giá trị và khối lượng vật phẩm, các vật phẩm này đã được sắp xếp theo giá trị giảm dần của hiệu suất $e_j$ và ba lô có sức chứa $c$.

  $overline(w) := 0 quad quad quad$ $overline(w)$: _cân nặng tổng cộng của các vật phẩm đã được đóng gói hiện tại_

  $z_G:=0 quad quad quad$ $z_G$: _giá trị tối ưu_

  *for* $quad$ $j:= 1$ đến $n$ $quad$ *do*

  $quad quad $ *if*  $quad$ $overline(w)+w_j <= c$ $quad$ *then*

   $quad quad quad quad x_j:=1$ _đặt vật phẩm thứ $j$ vào ba lô_

   $quad quad quad quad overline(w):= overline(w) + w_j$

   $quad quad quad quad z_G := z_G + p_j$

   $quad quad$ *else* $quad$ $x_j := 0$

 *ĐẦU RA:* $z_G$ và $overline(w)$.
  
  ]
)

Để hiểu rõ hơn về cách hoạt động của thuật toán, ta xem xét ví dụ sau


*Ví dụ* Cho ba lô với sức chứa $c=9$ và số vật phẩm hiện có là $n=7$ với giá trị và trọng lượng được cho ở bảng bên dưới.

#import "@preview/tablem:0.1.0": tablem

// #tablem[
//   | *j*    | 1 | 2 | 3  | 4 | 5 | 6 | 7 |
//   | ------ |---|---|----|-----------------|
//   | p_j    | 6 | 5 |  8 | 9 | 6 | 7 | 3 |
//   | w_j    | 2 | 3 |  6 | 7 | 5 | 9 | 4 |
// ]

// #import "@preview/tablem:0.1.0": tablem

// #tablem[
//   | *Name* | *Location* | *Height* | *Score* |
//   | ------ | ---------- | -------- | ------- |
//   | John   | Second St. | 180 cm   |  5      |
//   | Wally  | Third Av.  | 160 cm   |  10     |
// ]

#align(center)[#table(
  columns: 8,
  [$j$], [1], [2], [3], [4], [5], [6], [7],
  [$p_j$], [6], [5], [8], [9], [6], [7], [3],
  [$w_j$], [2], [3], [6], [7], [5], [9], [4]
  
)]

Trước tiên, ta thấy rằng, các vật phẩm đã được sắp xếp theo hiệu suất giảm dần. Tiếp theo, thuật toán tham lam sẽ hoạt động như sau:

Xét vật phẩm $x_1$, lúc này $overline(w):= overline(w) + w_1 = 0 + 2 = 2 <= c = 9$, đưa $x_1$ vào ba lô và $z_G := z_G + p_1 = 0 + 6 =6$.

Xét đến vật phẩm $x_2$, $overline(w):= overline(w) + w_2 = 2 + 3 = 5 <= c =9$, đưa $x_2$ vào ba lô và $z_G := z_G + p_2 = 6 +5 = 11 $.

Xét vật phẩm $x_3$, $overline(w) := overline(w)+ w_3 = 5 + 6 = 11 > c = 9$, không đưa $x_3$ vào ba lô.

Xét vật phẩm $x_4$, $overline(w):= overline(w) + w_4 = 5 + 7 = 12 > c =9 $, không đưa $x_4$ vào ba lô.

Xét vật phẩm $x_5$, $overline(w):= overline(w) + w_5 = 5 + 5 = 10 > c =9$, không đưa $x_5$ vào ba lô.

Xét vật phẩm $x_6$, $overline(w):= overline(w) + w_6 = 5 + 9 = 14 > c =9$, không đưa $x_6$ vào ba lô.

Xét vật phẩm $x_7$, $overline(w):= overline(w)+ w_7 = 5 + 4 = 9 = c$, đưa $x_7$ vào ba lô và $z_G := z_G + p_7 = 11 + 3 = 14$.

Vậy, thuật toán tham lam đưa các đối tượng 1,2 và 7 vào ba lô và có giá trị $z_G =14$.

// ==== Độ phức tạp tính toán

Sau khi sắp xếp các vật phẩm theo #eqref(<eq:21>) trong thời gian $O(n log n)$, thời gian chạy của thuật toán tham lam là $O(n)$ vì mỗi đối tượng được xem xét tối đa một lần.

====  Bài toán xếp ba lô liên tục

Bài toán xếp ba lô liên tục (_continuous knapsack problem_) là một biến thể của bài toán xếp ba lô cổ điển, trong đó các vật phẩm có thể được chia nhỏ thay vì chỉ có thể chọn toàn bộ hoặc bỏ qua. Giả sử bạn có một chiếc ba lô với sức chứa nhất định và cần mang theo các vật phẩm như đường, muối, bột ngọt. Những vật phẩm này có thể được chia nhỏ thành từng phần nhỏ hơn, cho phép bạn tối ưu hóa giá trị tổng thể mà bạn mang theo mà không vượt quá sức chứa của ba lô.

// ==== Định ngĩa bài toán
Bài toán xếp ba lô liên tục có thể được định nghĩa một cách chính thức như sau: Chúng ta có một chiếc ba lô với sức chứa tối đa $c$. Ta có $n$ vật phẩm $(j = 1,...,n)$, mỗi vật phẩm có một giá trị $p_j$ và trọng lượng $w_j$. Thông thường, tất cả các giá trị này đều là số nguyên dương. Mục tiêu của bài toán là chọn ra một tập hợp các vật phẩm sao cho tổng giá trị của chúng là lớn nhất, nhưng tổng trọng lượng không được vượt quá sức chứa $c$.

Bài toán xếp ba lô liên tục được phát biểu như sau:

$
max quad & sum_(j=1)^n p_j x_j\

"s.t." quad & sum_(j=1)^n w_j x_j <= c\

 & x_j in [0,1] quad quad quad quad j= 1,...,n
$

Trong đó $x_j in [0,1]$ nghĩa là phần trăm vật thể $i$ được lấy ra.

==== Giải thuật tham lam cho bài toán xếp ba lô liên tục
Tương tự như bài toán xếp ba lô 0-1, một cách tiếp cận tự nhiên cho bài toán xếp ba lô liên tục là đánh giá hiệu suất của mỗi vật phẩm $e_j$

$ e_j = p_j / w_j $

và cố gắng đặt các đối tượng có hiệu suất cao nhất vào ba lô và cũng giả sử rằng các đối tượng được sắp xếp theo hiệu suất của chúng theo thứ tự giảm dần, sao cho
$ p_1 / w_i >= p_2/w_2  >= ... >= p_n/w_n $

Bắt đầu với một ba lô trống và lần lượt xem xét các vật phẩm theo thứ tự giảm dần của hiệu suất.

#set table.hline(stroke: .7pt)

#table(
  table.hline(),
  stroke: none,
  columns: (auto, 4fr),
  table.hline(),
  [*ĐẦU VÀO*],  [ $n$ vật phẩm, mỗi vật phẩm có giá trị $p_j$ và $w_j$ tương ứng, $j= 1,...,n$, $z := 0, overline(w):= c, x_j := 0, j:= 1$. Các vật phẩm đã được xếp theo thứ tự giảm dần của hiệu suất.],
  table.hline(),
  [*Bước 1*],  [],
  [Nếu $w_j <= overline(w)$],  [thì $ x_j:= 1, z:= z + p_j.x_j, overline(w):= overline(w) - w_i$],
  [Nếu $w_j > overline(w)$],  [thì $ x_j:= overline(w)/w_j, z:= z + p_j.x_j, overline(w):= overline(w) - w_i, overline(w):= 0$],
  [*Bước 2*],  [$j:= j+ 1$, trở về Bước 1],
  table.hline(),
  [*ĐẦU RA*],  [$z$ và $x_j$],
  table.hline(),
)

Để hiểu rõ về cách hoạt động của thuật toán tham lam trên, ta xem xét ví dụ sau: Giả sử ta là một nhà buôn muốn vận chuyển hàng hóa bằng một chiếc xe tải với sức chứa tối đa $c=50$ kg và ta có một số loại hàng hóa như sau (mỗi loại hàng hóa bên dưới đều có thể chia nhỏ được):

#align(center)[#table(
  columns: 5,
  [$j$], [1], [2], [3], [4],
  [$p_j$], [120], [200], [300], [240],
  [$w_j$], [10], [20], [30], [40]
  
)]

Nhận thấy rằng, 4 loại hàng hóa trên đã được sắp xếp theo hiệu suất giảm dần, tức là
$ p_1/ w_1 >= p_2/w_2 >= p_3/ w_3 >= p_4/ w_4 $

Tiếp theo, ta sẽ bắt đầu xếp hàng hóa vào xe tải bằng thuật toán tham lam như sau:

$overline(w):= c = 50, z:= 0, x_j := 0, j = 1,...,4$

Xem xét $w_1$:

$w_1 = 10 <= overline(w)= 50$ nên $x_1 := 1, z:= z+ p_1.x_1 = 0 + 120.1 = 120, overline(w):= overline(w)- w_1 = 50 - 10 = 40.$

Xem xét $w_2$:

$w_2 = 20<= overline(w) = 40$ nên $x_2 := 1, z:= z+ p_2.x_2 = 120 + 200.1 = 320, overline(w):= overline(w)- w_2 = 40 - 20 = 20.$

Xem xét $w_3$:
$w_3 = 30 > overline(w) = 20$ nên $x_3: overline(w)/ w_3 = 20/30 = 2/3, z:= z + p_3.x_3 = 320 + 300. 2/3= 520, overline(w):= 0.$

Vậy giá trị tối đa mà xe tải có thể chở là $520$ với hàng hóa thứ 1 và thứ 2 được lấy toàn bộ, hàng hóa thứ 3 được lấy một lượng 2/3 đang có.

*Nhận xét:* 
Để giải quyết bài toán này, ta có thể sử dụng thuật toán tham lam với bước sắp xếp các vật phẩm theo hiệu suất có độ phức tạp $O(n log n)$. Sau khi sắp xếp, mỗi vật phẩm sẽ được duyệt qua $n$ lần, do đó độ phức tạp tính toán tổng thể là $O(n log n)$.

Ngoài ra, trong bài toán ba lô liên tục, @balas1980algorithm đã chứng minh rằng bài toán này có thể được giải trong thời gian đa thức, mở ra hướng tiếp cận tối ưu và hiệu quả hơn cho việc xử lý các bài toán tối ưu liên quan đến ba lô trong các tình huống thực tế.












