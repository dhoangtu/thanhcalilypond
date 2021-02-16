% Cài đặt chung
\version "2.20.0"
\include "english.ly"

\header {
  title = "Dâng Lễ Với Mẹ"
  composer = "Nguyên Kha"
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
}

inNghieng = { \override LyricText.font-shape = #'italic }

% Nhạc phiên khúc
nhacPhienKhuc = \relative c'' {
  g8 g a16 (c) a8 |
  g4. c,16 (d) |
  g8 g e (d) |
  \acciaccatura { c16 d } c4 r8 c'16 (d) |
  e8 e e d |
  c4. a8 |
  a (c) a \acciaccatura a c |
  g2 |
  g8 e16 (d) g8 e16 (d) |
  \acciaccatura { d16 e } c4. c'16 (d) |
  c8 c16 (d) e8 e16 (d) |
  c4. a8 |
  c4 a8 a16 (c) |
  g4. g8 |
  g g e16 (g e d) |
  c2 \bar "||"
}

% Nhạc điệp khúc
nhacDiepKhucSop = \relative c'' {
  \set Score.currentBarNumber = #17
  e4 e8 e16 (d) |
  \acciaccatura { c16 d } c4. c16 (d) |
  e8 e e16 (d) c (d) |
  e4. c8 |
  d d d c |
  g2 |
  c4 c8 d16 (c) |
  a4. a16 (c) |
  g8 a c d |
  d4. c8 |
  b g a b |
  c2 \bar "|."
}

nhacDiepKhucBass = \relative c'' {
  c4 c8 c |
  g4. a8 |
  c c c a |
  c4 (a8) a |
  g g g g16 (f) |
  e2 |
  a4 a8 g |
  f4. f8 |
  e f a a |
  g4. a8 |
  g e f f |
  e2
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Xưa trên núi Can -- vê Mẹ dâng Con cứu đời.
  Mẹ hiến tế chính con yêu làm giá chuộc muôn người.
  Nay hiệp với Giáo hội và triều thần thánh trên trời
  nài van Mẹ nhận lời dâng lên thánh lễ này.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Con xin chắp đôi tay nguyện mến Chúa hết tình.
  Dù sống chết quyết trung kiên yêu Chúa trọn tâm hồn.
  Con nguyện hứa trung thành dù ngàn hiểm nguy trên đường
  chén đắng xin uống cạn quyết tiến bước vững vàng.
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  \set stanza = #"ĐK:"
  Xin dâng lễ này cầu cho muôn dân hợp nhất
  cầu cho muôn dân thái hòa.
  Xin dâng lễ này chúc tụng ngợi khen tôn vinh
  cảm tạ tình thương bao la.
}

% Dàn trang
\score {
  \new ChoirStaff <<
    \new Staff = verses <<
      \new Voice = "verse" {
        \global \stemNeutral \nhacPhienKhuc
      }
    >>
    \new Lyrics \lyricsto verse \loiPhienKhucMot
    \new Lyrics \with \inNghieng \lyricsto verse \loiPhienKhucHai
  >>
}

\score {
  \new ChoirStaff <<
    \new Staff = chorus <<
      \override Staff.TimeSignature.transparent = ##t
      \new Voice = "sopranos" {
        \voiceOne \global \stemUp \nhacDiepKhucSop
      }
      \new Voice = "basses" {
        \voiceTwo \global \stemDown \nhacDiepKhucBass
      }
    >>
    \new Lyrics = basses
    \context Lyrics = basses \lyricsto sopranos \loiDiepKhuc
  >>
}

