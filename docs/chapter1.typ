
// Nhớ đánh số trang và footnote
// Canh đều toàn văn bản
//#set align()
//nhớ thêm tích Hamdamard

#set page(numbering: "1")
#set page(header: [
  _Luận văn - Nguyễn Đặng Ngọc Ngân_
  #h(1fr)
  Trường Đại học Cần Thơ
])

== #text(orange)[CHƯƠNG 1: KIẾN THỨC CHUẨN BỊ]

== #text(orange)[1. LÝ THUYẾT ĐỒ THỊ]
== #text(orange)[1.1 ĐỒ THỊ]

== #text(orange)[1.1.1 Khái niệm đồ thị]
Đồ thị trong lý thuyết đồ thị _(G)_ là một cấu trúc toán học được sử dụng để mô tả mối quan hệ giữa các đối tượng. Một đồ thị gồm hai thành phần chính:
+ Đỉnh _(V)_: là các đối tượng mà ta muốn nghiên cứu.
+ Cạnh _(E)_: Biểu diễn mối quan hệ giữa các cạnh.
Ví dụ: Trong một đồ thị, các đỉnh có thể biểu thị cho các cá nhân, trong khi các cạnh biểu thị cho mối quan hệ bạn bè giữa các cá nhân đó.
(Nói về khái niệm đầu mút - đỉnh)
(Thêm ký hiện $P(G)$)
#align(center)[

#import "@preview/bob-draw:0.1.0": *
#show raw.where(lang: "bob"): it => render(it)

#render(
    ```
      1       2         3
       *------*--------*    
    4 /    5 /        /   
     *------*        * 6
      \             /              
       \           /             
        *---------* 8
        7
    
    ```,
    width: 40%,
)]
#align(center)[#text(orange)[*Hình 1.1*] Minh họa biểu diễn hình học của một đồ thị]

Ta có hai loại đồ thị chính: Đồ thị vô hướng và đồ thị vô hướng. Đồ thị vô hướng (undirected graph) là một loại đồ thị trong đó các cạnh không có hướng. Điều này có nghĩa là nếu có một cạnh giữa hai đỉnh _u_ và _v_ thì cạnh này có thể được đi từ _u_ đến _v_ và ngược lại có thể đi từ _u_ đến _v_ . Nói cách khác, mối quan hệ giữa các đỉnh là hai chiều và không có sự phân biệt về hướng. Trong khi đó, đồ thị có hướng (directed graph) là một loại đồ thị trong đó mỗi cạnh có hướng. Điều này có nghĩa là mỗi cạnh được biểu diễn bởi một cặp đỉnh có thứ tự, chỉ định hướng đi từ đỉnh đầu đến đỉnh cuối. Trong đồ thị có hướng, nếu có cạnh từ đỉnh
_u_ đến đỉnh _v_ thì không nhất thiết phải có cạnh từ đỉnh _v_ đến đỉnh _u_.

Ngoài ra, đồ thị có thể có những đặc tính khác nhau như: 
1. Đồ thị có trọng số(Weighted Graph): Mỗi cạnh và mỗi đỉnh được gán một trọng số, thường biểu thị chi phí, khoảng cách hoặc thời gian. Ví dụ, với đồ thị ở trên, ta gán mỗi đỉnh tương ứng với một trọng số biểu thị số lượng dân cư ở đỉnh đó, đồng thời mỗi cạnh được gán trọng số khoảng cách giữa các điểm dân cư. (Viết lại cho mượt hơn)
2. Đồ thị không có trọng số(Unweighted Graph): Các cạnh và các đỉnh không có trọng số
3. Đồ thị liên thông(Connected Graph): Từ một đỉnh bất kỳ, ta có thể đi đến tất cả các đỉnh khác thông qua các cạnh. (Ví dụ minh họa)
4. Đồ thị không liên thông(Disconnected Graph): Tồn tại ít nhất một đỉnh, mà từ đỉnh đó ta không thể đi đến một số đỉnh khác. (Ví dụ minh họa).

== #text(orange)[1.1.2 Một số khái niệm liên quan]
+ Nếu _u_ là một điểm đầu mút của cạnh _e_ thì ta nói _u_ và _e_ _liên thuộc(incident)_ với nhau.

+ Hai đỉnh liên thuộc với cùng một cạnh được gọi là hai đỉnh _liền kề(adjacent)_.

+ Hai cạnh liên thuộc với cùng một đỉnh được gọi là hai cạnh _liền kề_.

+ Một cạnh có hai điểm đầu mút trùng nhau được gọi là một _vòng(loop)_.

+ Hai hay nhiều cạnh mà có hai đầu mút giống nhau được gọi là _các cạnh song song(parallel edges)_ hay còn được gọi là _các cạnh bội(multiple edges)_.

== #text(orange)[1.1.3 Bậc và đường đi]

Bậc_(Degree)_ _d(v)_ của đỉnh _v_ trong _G_ là số cạnh của _G_ liên thuộc với _v_, mỗi vòng được tính là hai cạnh. (Cho ví dụ).

Đường đi_(walk)_ trong _G_ là một dãy khác rỗng hữu hữu gồm các đỉnh và các cạnh xen kẽ nhau. Nếu các cạnh của đường đi đôi một khác nhau thì đường đi đó được gọi là _đường đi đơn(trail)_. Trong khi đó, nếu các đỉnh của đường đi đôi một khác nhau thì được gọi là đường đi sơ cấp_(path)_.

Chu trình_(closed walk)_ là một đường đi có chiều dài dương và có đỉnh đầu và đỉnh cuối trùng nhau. _Chu trình đơn(closed trail)_ là một chu trình có các cạnh đôi một khác nhau. _Chu trình sơ cấp(cycle)_ là một chu trình đơn có các đỉnh đôi một khác nhau ngoại trừ đỉnh đầu và đỉnh cuối.

Đối với đồ thị có trọng số, _độ dài đường đi(length)_ bằng tổng trọng số cạnh của đường đi đó.

(Ví dụ minh họa)
== #text(orange)[1.1.4 Đồ thị cây]
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

Giả sử, $T$ là đồ thị cây. Chọn $y,z$ bất kỳ nằm trên cây $T$, $0<lambda<1$ và $x in P(y,z)$. Để chứng minh $f_1(x,a)$ là hàm lồi, ta cần chứng minh $d(x,a) <= lambda d(y,a) + (1-lambda) d(z,a)$ hoặc ta có thể chứng minh bất đẳng thức sau: $d(x,a)d(y,z) <= d(x,z)d(y,a) + d(x,y)d(z,a)$ (1) (Cách trích dẫn 1)

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





