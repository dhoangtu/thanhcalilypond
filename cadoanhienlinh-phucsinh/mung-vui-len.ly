% Cài đặt chung
\version "2.20.0"
\include "english.ly"

\header {
  title = "Mừng Vui Lên"
  subtitle = "(Exultet)"
  composer = " "
  tagline = ##f
}

global = {
  \key c \major
  \time 2/4
}

\paper {
  #(set-paper-size "a4")
  top-margin = 15\mm
  bottom-margin = 15\mm
  left-margin = 20\mm
  right-margin = 20\mm
  indent = #0
  #(define fonts
	 (make-pango-font-tree "Liberation Serif"
	 		       "Liberation Serif"
			       "Liberation Serif"
			       (/ 20 20)))
  print-page-number = ##f
}

% Nhạc điệp khúc
nhacDiepKhuc = \relative c'' {
  %\set Score.timing = ##f
  \override Lyrics.LyricSpace.minimum-distance = #2.5
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \autoBeamOff
  g8 a _(c) c \breathe b c d c c b a b (c) a4 \bar "|"
  g8 a _(c) c4 \breathe c8 c b a b (c) a4 \bar "|"
  d8 c b a g f e g (a) a4 \breathe
  d8 (a) a c a g f f (a) g8 (f e) e4 \bar "||"
  g8 a _(c) c4 \breathe b8 c d c c \breathe c c b a b (c) a4 \breathe
  g8 a _(c) c c c b a b (c) a4 \breathe
  d8 c b a (g) f (e) g (a) a4 \breathe
  d8 (a) a c a g f g (a) g (f e) e4 \breathe
  g8 a (c) c4 \breathe c8 b c d c c4 \breathe
  c c c b a b (c) a4 \breathe
  d8 c b a g f e g (a) a4 \breathe
  d8 (a) a c a g f g (a) g (f e) e4 \breathe \bar "|"
  g8 a (c) c4 \breathe c8 c c b c d c c4 \bar "|"
  c8 c c c b a b (c) a4 \breathe
  d8 c c b a b (c) a a4 \breathe
  g8 a a g f g (a) g (f e) e4 \breathe \bar "|"
  g8 a (c) c c4 \breathe
  c8 b c d c c4 \breathe
  c8 c c b a b c a4 \breathe
  d8 c c c b a b (c) a4 \breathe
  g8 a a a g f g a g (f e) e4 \breathe \bar "||" \break
  a8 _(b) f e a g a2 \breathe \break
  e8 g f (g) a4 \breathe \break
  c8 b (c) a g a4  \breathe \break
  a8 g g a e a4 \breathe \break
  c8 b (c) d e a, b c b a4 \breathe \break
  e8 e g (a) a4 \breathe \break
  
  a8 c c4 \breathe
  a8 c c c c c b c d c4 \breathe
  c8 b b _(a) a _(b) b4 \breathe
  a8 b b b b b b a (g) g (a) b a _(b) a4 \breathe
  a8 c c c b b (a) a (b) b b4 \breathe
  c8 c b b (a) a4 (b) \breathe
  a8 b b b c b a (g) g (a) b a (b) a a4 \breathe \bar "||"
  c8 (b) a g a (c) a b4 \breathe
  a8 c (b) a a (b) b b4 \breathe
  b b a b c (b) a (g) g a b a (b) a4 \breathe \bar "||"
  a8 (c d c b) a (b) b4 a8 c c c c4 \breathe
  b8 c d c c c \breathe
  c b b a (b) b4 \breathe
  b8 a b c b (a) g g (a) b a (b) a4 \breathe \bar "||"
  c8 b (a g) a (c a) b4 \breathe
  a8 c c (b) a a _(b) b4 \breathe
  b8 b c (b) a (g) g (a) b a (b) a4 \breathe
  c8 (b) a b \breathe
  a8 c c c c b c d c c c b (a) a (b) b4 \breathe
  a8 c c c c c c b (c) d c (b) a (b) b4 \breathe
  a8 b b4 \breathe
  b8 a g g g (a) b a (b) a4 \breathe \bar "||"
  
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
%  \override LyricText.self-alignment-X = #CENTER
  Mừng vui lên hỡi muôn các cơ binh Thiên Thần trên trời,
  cùng vui lên, hỡi những Nhiệm Mầu thánh này.
  Tiếng loa cứu độ hãy vang rền không gian.
  Mừng reo chiến công oai hùng Vua uy quyền.
  Và vui lên, toàn trái đất vui lên trong ánh huy hoàng chiếu soi
  và dưới ánh sáng Chúa muôn đời chói ngời,
  tất cả vũ trụ đều hân hoan được ơn thoát ly xa miền tối u sầu.
  Mừng vui lên, ôi Mẹ Hội Thánh vui lên, uy nghiêm trong muôn ngàn ánh quang,
  khắp nơi trong cung điện này hòa vang lên ngàn muôn tiếng ca reo mừng của nhân trần.
  Họp nhau đây, tôi xin anh chị em rất thân yêu, đã hân hoan tham gia nguồn sáng này,
  hết tâm kêu xin cùng Chúa uy linh tha thiết khấn xin lòng Chúa nhân từ.
  Người thương yêu tôi, tôi dầu không có công chi, thương cho tôi nhập hàng tư tế Người,
  khấng xin ban cho tôi đầy ánh quang, để tôi hân hoan ca ngợi cây nến huy hoàng)
  "X. Chúa" ở cùng anh chị em.
  "T.Và" ở cùng cha(thầy).
  "X. Hãy" nâng tâm hồn lên.
  "T. Chúng" tôi đang hướng về Chúa.
  "X. Hãy" tạ ơn Chúa là Thiên Chúa chúng ta.
  "T. Thật" là chính đáng.
  Thật chính đáng, việc dâng lên tâm tư ca tụng Thiên Chúa Cha,
  Đấng thiêng liêng toàn năng, cùng Đức Giê -- su Ki -- tô Con Một Người Chúa chúng tôi.
  Ngài thay cho chúng tôi trả nợ A -- dam, với Chúa Cha muôn thuở,
  và đổ máu quý giá để tẩy sạch án tổ tông xưa.
  Chính đây là lễ Vượt Qua, mà Chiên thật được sát tế
  nơi cửa nhà dân Chúa đã được ghi dấu máu chiên.
  Này(i) là Đêm mà cha ông chúng tôi, là con cái Is -- ra -- el thoát ly Ai Cập xưa
  Chúa đã cho tiến qua Biển Đỏ vẫn khô chân.
  Chính đây là Đêm, nhờ ánh sáng cột lửa thiêng, xua tan bóng đen tội lỗi nhân gian.
  Đây là Đêm, mà hôm nay ai tin cậy nơi Chúa Ki -- tô khắp trên trần gian
  được cứu thoát hết các vết nhơ và tối tăm tội khiên, được ơn thiêng,
  đưa về hợp đoàn cùng các thánh nhân.
  Này(i) là Đêm, xiềng xích bị bẻ tung, Đức Ki -- tô bỏ ngục hình vinh thắng tiến lên.
  Ôi huyền nhiệm thay, lòng Chúa quá yêu trần thế chúng tôi.
  Tình thương yêu của Chúa không ai hiểu thấu, để cứu đầy tờ, Chúa đã nộp chính Con yêu.
  Ôi cần thiết thay tội A -- dam, tội đã được tẩy xóa chính nhờ sự chết Chúa Ki -- tô.
  Ôi tội hồng phúc, vì cho chúng ta Đấng Cứu Chuộc rất cao sang.
  Vì thế sự thánh thiện của đêm nay xua đuổi hết tội khiên,
  tẩy trừ vết nhơ, người có tội được sạch trong, kẻ ưu phiền sướng vui hân hoan.
  Ôi đêm hồng ân, này đêm nối kết trời đất, kết hợp Thiên Chúa với muôn người thế chúng tôi.
  Kính lạy Cha chí thánh, nguyện xin nguồn ơn thánh đêm nay nhận lấy hương thơm lễ chiều hôm,
  là lễ nghi dâng cây nến làm bởi sáp ong tinh tuyền đây,
  do tay thừa tác viên giáo hội cùng kính dâng lên.
  Nguyện xin cho cây nến này dâng Chúa đây luôn luôn được tỏa sáng,
  phá tan mọi bóng tối đêm nay.
  Nguyện cho ánh nến lung linh hòa với muôn muôn vì sao, luôn được Chúa đoái thương
  xem như hương trầm ngát thơm bay.
  Ước mong ngôi Sao Mai, sẽ gặp gỡ ánh lửa này chiếu soi luôn.
  Này đây ngôi sao không bao giờ lặn đi.
  Chính là Con Chúa Đức Ki -- tô, Ngôi Sao từ nơi tối tăm vượt lên chiếu sáng nhân gian.
  Người là Đấng thống trị hằng sống đến muôn đời muôn kiếp vinh quang.
  A -- men.
}

% Bố trí
\score {
  \new ChoirStaff <<
    \new Staff = chorus <<
      \override Staff.TimeSignature.transparent = ##t
      \new Voice = "sopranos" {
        \global \stemNeutral \nhacDiepKhuc
      }
    >>
    \new Lyrics \lyricsto sopranos \loiDiepKhuc
  >>
}
