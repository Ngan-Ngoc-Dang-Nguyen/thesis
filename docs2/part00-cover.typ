#let cover-size = 14pt 
#let head-size = 16pt 
#let title-size = 22pt 


#box(
  width: 100%, 
  height: 100%,
  stroke: 5pt + blue,
  align(center)[
    #v(1fr)

    #text(size: cover-size, weight: "bold")[TRƯỜNG ĐẠI HỌC CẦN THƠ\
    TRƯỜNG SƯ PHẠM\
    KHOA SƯ PHẠM TOÁN VÀ TIN HỌC\
    ---oOo---]

    #v(1fr)

    #image("../images/CTU-logo.png", width: 25%)

    #text(size: head-size, weight: "bold")[LUẬN VĂN TỐT NGHIỆP]

    #v(2fr)


    #text(size: cover-size, weight: "bold")[#align(left)[ĐỀ TÀI:]]
    #text(size: title-size, weight: "bold")[NÂNG CẤP BÁN KÍNH ỔN ĐỊNH CHO \
    VỊ TRÍ 1-MEDIAN TRÊN CÂY]

    #v(5fr)

    #table(
      // width: 100%,
      columns: (1fr, 1fr),
      align: (left, left), 
      inset: 2em,
      // stroke: black,
      stroke: none,
      [_GV hướng dẫn_\ *PGS.TS. Nguyễn Trung Kiên*],
      [
      _Sinh viên thực hiện_\
      *Nguyễn Đặng Ngọc Ngân*\
      *MSSV: B2100137*\
      *Lớp: SP Toán học - K47*
      ]
    )

    #v(1fr)


    #text(size: cover-size)[_Cần Thơ, tháng 11, năm 2024_]

    #v(1fr)

])