// == #text(orange)[1.2 Bài toán 1-median]
// == Bài toán 1-median
== BÀI TOÁN 1-MEDIAN


(Viết lại) (Trích giáo trình thầy Kiên) Xuất phát từ yêu cầu phải đặt công trình công cộng ở một vị trí trong một phạm vi địa lý nhất định để tối ưu hóa việc đi lại trong một tiêu chuẩn nào đó, ví dụ như chi phí nhiên liệu cho các phương tiện giao thông. Vấn đề này được giải quyết bằng việc giải bài toán 1-median trên đồ thị có trọng số. Bài toán này được dùng trong các ứng dụng thực tế như xây dựng các công trình công cộng: trường hợp, bệnh viện,...

// == #text(orange)[1.2.1 Bài toán 1-median trên đồ thị tổng quát]

=== Bài toán 1-median trên đồ thị tổng quát



(Trích trong giáo trình thầy Kiên) Cho $G=(V,E)$ là một đồ thị được gán một trọng số độ dài cạnh và trọng số mỗi đỉnh. Ta đặt $w_i$ là trọng số của đỉnh $v_i$. Ta giả sử tất cả các đỉnh đều có trọng số dương. 

Xét hàm số $f(x)=sum_(v_i in V) w_i d(v_i,x)$.

Ta cần tất cả các điểm $x in P(G)$ sao cho $f(s)$ nhỏ nhất. Bài toán này được gọi là _bài toán 1-median_ _(1-median problems)_. Điểm $s$ được gọi là điểm _1-median_.

Thuật toán tìm điểm 1-median trên đồ thị tổng quát được trình bày bởi Nickel. Thuật toán gồm các bước sau:

1. Xác định khoảng cách $d_(i j)= d(v_i,v_i)$ giữa tất cả các cặp đỉnh của $G$.

2. Tính giá trị của $f(v_i), forall v_i in V$

3. Tìm $ o p t = min{f(v_i) bar.v v_i in V}$

4. Trả về $(x^*)={v_i bar.v f(v_i)= o p t}$ là các điểm 1-median của $G$.

(Cho ví dụ, vẽ hình)

// == #text(orange)[1.2.1 Bài toán 1-median trên cây]
=== Bài toán 1-median đồ thị cây

Cho $T$ là một cây. Ta ký hiệu .....

#text(orange)[*Định lý 2.1*] Một điểm $x_0$ là điểm 1-median của cây $T$ khi và chỉ khi $angle.l w, bb(1)_T_u angle.r <= 1/2$ $forall u in N(x_0)$.

Giả sử $x_0$ là điểm 1-median. Ta cần chứng minh $angle.l w, bb(1)_T_u angle.r <= 1/2$. 

Trước tiên, ta đặt $ deg(x_0) = k$. Khi đó, nếu xóa bỏ $x_0$, ta được $k$ cây con với gốc lần lượt là $T_u_1, T_u_2,...,T_u_k$, trong đó $u_i in N(x_0), i=1,...,k$.

Ta lại có $x_0$ là một điểm 1-median, theo định nghĩa giá trị $f(x_0)$ nhỏ nhất. Nghĩa là:

 $f(u_i) - f(x_0) >= 0$ (5)

 Hơn nữa, 
 $f(u_i)= (angle.l w, bb(1)_T_u_i angle.r) d(v',u_1)$ + $(angle.l w, bb(1)_(T without T_u_i) angle.r)d(v,u_i)$ = $(angle.l w, bb(1)_u_i angle.r)[d(w,x_0)-d(u_i,x_0)]$ + $(angle.l w, bb(1)_(T without T_u_i) angle.r)[d(v,x_0)+d(x_0,u_i)] = f(x_0) + (angle.l w, bb(1)_(T without T_u_i) angle.r - angle.l w, bb(1)_(T_u_i) angle.r) d(u_i,x_0)= 1- 2 angle.l w, bb(1)_T_u_i angle.r$.

 $f(x_0)= (angle.l w, bb(1)_T_u_i) d(v,x_0) + (angle.l w, bb(1)_(T without T_u_i))d(v,x_0)$.

 Thế vào (5), ta được $1- 2 angle.l w, bb(1)_T_u_i angle.r >= 0$ hay nói cách khác $angle.l w, bb(1)_T_u_i angle.r <= 1/2$

 (Vẽ hình minh họa)

 Ngược lại, ta giả sử rằng $angle.l w, bb(1)_T_u_i angle.r <= 1/2$. Ta cần chứng minh $x_0$ là một điểm 1-median.

 Nghĩa là, ta cần phải chỉ ra rằng giá trị $f(x_0)$ nhỏ nhất .$angle.l w, bb(1)_T_u_i angle.r <= 1/2 <=> f(u_i)-f(x_0) >= 0 <=> f(x_0) <= f(u_i)$, $forall u in N(x_0)$. Khi đó, $x_0$ là cực tiểu địa phương của hàm mục tiêu $f$ trên $T$. Gọi $v$ là điểm nằm trên đường đi nối giữa $x_0$ và $v'$, trong đó $v'$ là một đỉnh bất kỳ, sao cho $v$ vẫn thuộc vào lân cận $x_0$. Khi đó $v= alpha x_0 + (1-alpha)v'$ (viết lại, dựa vào phần chứng minh hàm khoảng cách là lồi ở mục chapter1). $forall alpha in [0;1]$. Ta có: $f(x_0) <= f(v)=f(alpha x_0 + (1-alpha)v')$ $<= alpha(x_0) + (1-alpha)f(v')$ $=> f(x_0) <= f(v')$. Vậy $f(x_0)$ đạt giá trị nhỏ nhất tại $x_0$, hay nói cách khác $x_0$ là điểm 1-median.

#text(orange)[*Giải thuật và ví dụ cho bài toán 1-mediann trên cây*]

Thuật toán tuyến tính tìm 1-median trên cây được độc lập đưa ra bởi Goldman(1971).Ý tưởng cơ bản của thuật toán là "nuốt lá", tức là xóa từng lá và cộng trọng số của lá đó vào trọng số của đỉnh liền kề với nó. Quá trình tiếp diễn cho đến khi có một lá có trọng số lớn hơn phân nửa trọng số của cây $T$, lá này chính là điểm 1-median của cây $T$

#set table.hline(stroke: .6pt)

#table(
  table.hline(),
  stroke: none,
  columns: (auto, 1fr),
  [*ĐẦU VÀO*], [Cây $T=(v,E),$],
  [09:45], [Opening Keynote],
  [10:30], [Talk: Typst's Future],
  [11:15], [Session: Good PRs],
  table.hline(start: 1),
  [Noon], [_Lunch break_],
  table.hline(start: 1),
  [14:00], [Talk: Tracked Layout],
  [15:00], [Talk: Automations],
  [16:00], [Workshop: Tables],
  table.hline(),
  [19:00], [Day 1 Attendee Mixer],
)

-Thuật toán