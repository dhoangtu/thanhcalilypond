% Cài đặt chung
\version "2.22.1"
\include "english.ly"
\include "gregorian.ly"

\header {
  title = \markup { \fontsize #3 "Mừng Vui Lên" }
  subtitle = "(Exsultet)"
  %composer = " "
  tagline = ##f
}

% Nhạc điệp khúc
nhacDiepKhucMot = \relative c'' {
  \autoBeamOff
  g8 a ([c]) c \divisioMinima b c d c c b a b ([c]) a4 \divisioMaior
  g8 a ([c]) c4 \divisioMinima c8 c b a b ([c]) a4 \divisioMaior
  d8 c b a g f e g ([a]) a4 \divisioMinima
  d,8 ([a']) a c a g f f ([a]) g8 ([f e]) e4 \finalis
  g8 a ([c]) c4 \divisioMinima b8 c d c c \divisioMinima
  c c b a b ([c]) a4 \divisioMinima
  g8 a ([c]) c c c b a b ([c]) a4 \divisioMaior
  d8 c b a ([g]) f ([e]) g ([a]) a4 \divisioMinima
  d,8 ([a']) a c a g f g ([a]) g ([f e]) e4 \finalis
  g8 a ([c]) c4 \divisioMinima c8 b c d c c4 \divisioMinima
  c8 c c b a b (c) a4 \divisioMinima
  d8 c b a g f e g ([a]) a4 \divisioMaior
  d,8 ([a']) a c a g f g ([a]) g ([f e]) e4 \divisioMaxima
  g8 a ([c]) c4 \divisioMinima c8 c c b c d c c4 \divisioMaior
  c8 c c c b a b ([c]) a4 \divisioMinima
  d8 c c b a b ([c]) a a4 \divisioMinima
  g8 a a g f g ([a]) g ([f e]) e4 \finalis
  g8 a ([c]) c c4 \divisioMaior
  c8 b c d c c4 \divisioMaior
  c8 c c b a b c a4 \divisioMinima
  d8 c c c b a b ([c]) a4 \divisioMaior
  g8 a a a g f g a g ([f e]) e4 \finalis \break
}

nhacDiepKhucHai = \relative c'' {
  \autoBeamOff
  a8 _([b]) f e a g a2 \finalis \break
  e8 g f ([g]) a4 \finalis \break
  c8 b ([c]) a g a4 \finalis \break
  a8 g g a e a4 \finalis \break
  c8 b ([c]) d e a, b c b a4 \finalis \break \noPageBreak
  e8 e g ([a]) a4 \finalis \break \pageBreak
}

nhacDiepKhucBa = \relative c'' {
  \autoBeamOff
  a8 c c4 \divisioMaior
  a8 c c c c c b c d c4 \divisioMaior
  c8 b b ([a]) a ([b]) b4 \divisioMaxima
  a8 b b b b b b a ([g]) g ([a]) b a ([b]) a4 \divisioMinima
  a8 c c c b b ([a]) a ([b]) b b4 \divisioMinima
  c8 c b b ([a]) a4 (b) \divisioMaior
  a8 b b b c b a ([g]) g ([a]) b a ([b]) a a4 \finalis
  c8 ([b]) a g a ([c]) a b4 \divisioMaior
  a8 c ([b]) a a ([b]) b b4 \divisioMinima
  b8 b a b c (b) a (g) g a b a ([b]) a4 \finalis
  a8 ([c d c b]) a ([b]) b4 a8 c c c c4 \divisioMaior
  b8 c d c c c \divisioMinima
  c b b a ([b]) b4 \divisioMaior
  b8 a b c b ([a]) g g ([a]) b a ([b]) a4 \finalis
  c8 b ([a g]) a ([c a]) b4 \divisioMaior
  a8 c c ([b]) a a ([b]) b4 \divisioMinima
  b8 b c ([b]) a ([g]) g ([a]) b a ([b]) a4 \finalis
  c8 ([b]) a b4 \divisioMaior
  a8 c c c c b c d c c c b ([a]) a ([b]) b4 \divisioMinima
  a8 c c c c c c b ([c]) d c ([b]) a ([b]) b4 \divisioMaior
  a8 b b4 \divisioMaior
  b8 a g g g ([a]) b a ([b]) a4 \finalis
  a8 ([c d c b]) a ([b]) b4 \divisioMaior
  a8 c ([b]) a a ([b]) b4 \divisioMinima
  c8 b b a g g \divisioMinima
  a b a ([b]) a4 \finalis
  a8 ([c d c b]) a a ([b]) b4 \divisioMinima
  a8 b c ([b]) a ([g]) g ([a]) b a ([b]) a4 \divisioMaxima
  a8 c c b ([c]) d c b ([a]) a ([b]) b4 \divisioMaior
  b8 b a ([b]) c4 \divisioMinima
  b8 a ([g]) g ([a]) b a ([b]) a4 \divisioMaxima
  c8 b ([c]) d c ([b]) a ([b]) b b4 \divisioMinima
  a8 c ([b]) a a ([b]) b4 \divisioMaior
  b8 a ([g]) g ([a]) b a ([b]) a a4 \divisioMaxima
  c8 ([b]) a a b4 \divisioMinima
  a8 b c b b a ([g]) g ([a]) b a ([b]) a4 \divisioMaxima
  a8 c4 \divisioMinima
  b8 c ([b]) a a ([b]) b b4 c8 b ([c]) d ([c b]) a ([b]) b4 \divisioMinima
  c8 ([b]) a ([b]) b b4 \divisioMinima
  a8 c b a a ([b]) b4 b8 a ([g]) g ([a]) b a ([b]) a a4 \divisioMaxima
  a8 ([c d]) c ([b]) a ([b]) b4 \divisioMaxima
  a8 c c c ([b]) a ([b]) b4 \divisioMaior
  b8 a b c b a ([g]) g ([a]) b a ([b]) a4 \finalis
  d8 ([c b]) a ([g]) a ([b]) b b4 a8 c b c d c c4 \divisioMinima
  a8 c c c c ([b]) a ([b]) b4 \divisioMinima
  a8 c c c c c b c d c c ([b]) a ([b]) b4 \divisioMinima
  b8 b a ([b]) c b b a ([g]) g ([a]) b a ([g]) a4 \finalis
  a8 c c c c b c d c4 \divisioMaior
  c8 c ([b]) a a ([b]) b4 \divisioMaior
  b8 a ([g]) g ([a]) b a ([b]) a a4 \divisioMaxima
  a8 b c d c c4a8 c b b ([a]) a ([b]) b4 \divisioMaior
  b8 b b c b b b a ([g]) g ([a]) b a ([b]) a4
  d8 ([c b]) a ([g]) a ([b]) b b4 \divisioMaior
  b8 a b c ([b]) a ([g]) g ([a]) b a ([b]) a4 \divisioMaxima
  a8 c c c c c ([b]) a a ([b]) b4 \divisioMaior
  d8 ([c b]) a ([g]) a ([b]) b4 \divisioMinima
  b8 b b4 \divisioMaior
  b8 b a b c b ([a]) g a b a ([b]) a a4 \divisioMaxima
  a8 a c c b ([a]) a ([b]) b4 \divisioMaior
  b8 a ([g]) g a b a ([b]) a4 \finalis
  g8 g4 ([a]) \bar "||"
}

% Lời điệp khúc
loiDiepKhucMot = \lyricmode {
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
  khấng xin ban cho tôi đầy ánh quang, để tôi hân hoan ca ngợi cây nến huy hoàng.
}

loiDiepKhucHai = \lyricmode {
  \override Lyrics.LyricText.font-series = #'bold
  \set stanza = #"(X) "
  Chúa ở cùng anh chị em.
  \revert Lyrics.LyricText.font-series
  \override LyricText.font-shape = #'italic
  \set stanza = #"(T) "
  Và ở cùng "cha (thầy)."
  \revert Lyrics.LyricText.font-shape
  \override Lyrics.LyricText.font-series = #'bold
  \set stanza = #"(X) "
  Hãy nâng tâm hồn lên.
  \revert Lyrics.LyricText.font-series
  \override LyricText.font-shape = #'italic
  \set stanza = #"(T) "
  Chúng tôi đang hướng về Chúa.
  \revert Lyrics.LyricText.font-shape
  \override Lyrics.LyricText.font-series = #'bold
  \set stanza = #"(X) "
  Hãy tạ ơn Chúa là Thiên Chúa chúng ta.
  \revert Lyrics.LyricText.font-series
  \override LyricText.font-shape = #'italic
  \set stanza = #"(T) "
  Thật là chính đáng.
}

loiDiepKhucBa = \lyricmode {
  Thật chính đáng, việc dâng lên tâm tư ca tụng Thiên Chúa Cha,
  Đấng thiêng liêng toàn năng,
  cùng Đức "Giê -" su "Ki -" tô Con Một Người Chúa chúng tôi.
  Ngài thay cho chúng tôi trả nợ "A -" dam,
  với Chúa Cha muôn thuở,
  và đổ máu quý giá để tẩy sạch án tổ tông xưa.
  Chính đây là lễ Vượt Qua, mà Chiên thật được sát tế
  nơi cửa nhà dân Chúa đã được ghi dấu máu chiên.
  "Này (i)" là Đêm mà cha ông chúng tôi,
  là con cái "Is -" "ra -" el thoát ly Ai Cập xưa
  Chúa đã cho tiến qua Biển Đỏ vẫn khô chân.
  Chính đây là Đêm, nhờ ánh sáng cột lửa thiêng,
  xua tan bóng đen tội lỗi nhân gian.
  Đây là Đêm, mà hôm nay ai tin cậy nơi Chúa "Ki -" tô khắp trên trần gian
  được cứu thoát hết các vết nhơ và tối tăm tội khiên,
  được ơn thiêng, đưa về hợp đoàn cùng các thánh nhân.
  "Này (i)" là Đêm, xiềng xích bị bẻ tung,
  Đức "Ki -" tô bỏ ngục hình vinh thắng tiến lên.
  Ôi huyền nhiệm thay,
  lòng Chúa quá yêu trần thế chúng tôi.
  Tình thương yêu của Chúa không ai hiểu thấu,
  để cứu đầy tờ, Chúa đã nộp chính Con yêu.
  Ôi cần thiết thay tội "A -" dam,
  tội đã được tẩy xóa chính nhờ sự chết Chúa Ki -- tô.
  Ôi tội hồng phúc, vì cho chúng ta Đấng Cứu Chuộc rất cao sang.
  Vì thế sự thánh thiện của đêm nay xua đuổi hết tội khiên,
  tẩy trừ vết nhơ, người có tội được sạch trong,
  kẻ ưu phiền sướng vui hân hoan.
  Ôi đêm hồng ân, này đêm nối kết trời đất,
  kết hợp Thiên Chúa với muôn người thế chúng tôi.
  Kính lạy Cha chí thánh,
  nguyện xin nguồn ơn thánh đêm nay nhận lấy hương thơm lễ chiều hôm,
  là lễ nghi dâng cây nến làm bởi sáp ong tinh tuyền đây,
  do tay thừa tác viên Giáo hội cùng kính dâng lên.
  Nguyện xin cho cây nến này dâng Chúa đây luôn luôn được tỏa sáng,
  phá tan mọi bóng tối đêm nay.
  Nguyện cho ánh nến lung linh hòa với muôn muôn vì sao,
  luôn được Chúa đoái thương
  xem như hương trầm ngát thơm bay.
  Ước mong ngôi Sao Mai, sẽ gặp gỡ ánh lửa này chiếu soi luôn.
  Này đây ngôi sao không bao giờ lặn đi.
  Chính là Con Chúa Đức "Ki -" tô,
  Ngôi Sao từ nơi tối tăm vượt lên chiếu sáng nhân gian.
  Người là Đấng thống trị hằng sống đến muôn đời muôn kiếp vinh quang.
  "A -" men.
}

% Dàn trang
\paper {
  #(set-paper-size "a4")
  top-margin = 15\mm
  bottom-margin = 20\mm
  left-margin = 20\mm
  right-margin = 20\mm
  indent = #0
  #(define fonts
	 (make-pango-font-tree "Liberation Serif"
	 		       "Liberation Serif"
			       "Liberation Serif"
			       (/ 20 20)))
  system-system-spacing = #'((basic-distance . 12)
                             (minimum-distance . 12.5)
                             (padding . 1))
  score-system-spacing = #'((basic-distance . 12)
                             (minimum-distance . 12.5)
                             (padding . 1))
  print-page-number = ##f
}

% Thiết lập tông nhịp
TongNhip = { \key c \major }

\score {
  \new ChoirStaff <<
    \new Staff = chorus <<
      \new Voice = "sopranos" {
        \TongNhip \nhacDiepKhucMot
      }
    >>
    \new Lyrics \with {
          \override VerticalAxisGroup.
            nonstaff-relatedstaff-spacing.padding = #1.5
          \override VerticalAxisGroup.
            nonstaff-unrelatedstaff-spacing.padding = #1.5
        }
        \lyricsto sopranos \loiDiepKhucMot
  >>
  \layout {
    \override Staff.TimeSignature.transparent = ##t
    \override Lyrics.LyricText.font-size = #+2
    \override Lyrics.LyricSpace.minimum-distance = #3
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
    %\override Score.SpacingSpanner packed-spacing = ##t
    \set Score.defaultBarType = ""
    \set Score.barAlways = ##t
    ragged-last = ##f
  }
}

%\markup { \vspace #0.5 }

\score {
  \new ChoirStaff <<
    \new Staff = chorus <<
      \new Voice = "sopranos" {
        \TongNhip \nhacDiepKhucHai
      }
    >>
    \new Lyrics \with {
          \override VerticalAxisGroup.
            nonstaff-relatedstaff-spacing.padding = #1.5
          \override VerticalAxisGroup.
            nonstaff-unrelatedstaff-spacing.padding = #1.5
        }
        \lyricsto sopranos \loiDiepKhucHai
  >>
  \layout {
    \override Staff.TimeSignature.transparent = ##t
    \override Lyrics.LyricText.font-size = #+2
    \override Lyrics.LyricSpace.minimum-distance = #3
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
    %\override Score.SpacingSpanner packed-spacing = ##t
    \set Score.defaultBarType = ""
    \set Score.barAlways = ##t
    line-width = 100
    ragged-right = ##f
    ragged-last = ##f
    indent = 0
  }
}

\score {
  \new ChoirStaff <<
    \new Staff = chorus <<
      \new Voice = "sopranos" {
        \TongNhip \nhacDiepKhucBa
      }
    >>
    \new Lyrics \with {
          \override VerticalAxisGroup.
            nonstaff-relatedstaff-spacing.padding = #1.5
          \override VerticalAxisGroup.
            nonstaff-unrelatedstaff-spacing.padding = #1.5
        }
        \lyricsto sopranos \loiDiepKhucBa
  >>
  \layout {
    \override Staff.TimeSignature.transparent = ##t
    \override Lyrics.LyricText.font-size = #+2
    \override Lyrics.LyricSpace.minimum-distance = #3
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
    %\override Score.SpacingSpanner packed-spacing = ##t
    \set Score.defaultBarType = ""
    \set Score.barAlways = ##t
    ragged-last = ##f
  }
}
