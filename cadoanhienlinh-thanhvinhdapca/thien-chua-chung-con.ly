% Cài đặt chung
\version "2.20.0"
\include "english.ly"

\header {
  title = "Thiên Chúa Chúng Con"
  composer = "TV. 8"
  arranger = " "
  tagline = ##f
}

global = {
  \key c \major
  \time 2/4
}

\paper {
  #(set-paper-size "a4")
  top-margin = 20\mm
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

% Nhạc điệp khúc
nhacDiepKhuc = \relative c' {
  \override Lyrics.LyricSpace.minimum-distance = #1.7
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  e8 a c \acciaccatura b8 c |
  d e d4 |
  e8 a, c b |
  a4 b8 g |
  \acciaccatura g8 a2 \bar "|."
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c'' {
  \override Lyrics.LyricSpace.minimum-distance = #2.0
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  a8 g a c |
  a8. e'16 c4 |
  d8 d d e |
  d16 (e) d (c) a4 |
  g8 b g b |
  c2 |
  b8 d b d |
  e4 \fermata \tuplet 3/2 { a,8 c b } |
  a2 |
  g8 b d g, |
  a2 ( |
  a4) r \bar "||"
}

nhacPhienKhucHai = \relative c'' {
  \override Lyrics.LyricSpace.minimum-distance = #2.0
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \partial 4 \tuplet 3/2 { a8 b g } |
  a4 \tuplet 3/2 { a8 c b } |
  d4 b |
  e2 |
  d8 d c b |
  a2 |
  g8 b d8. b16 |
  c2 |
  r4 \tuplet 3/2 { a8 c b } |
  a2 |
  g8 a f g |
  e2 |
  r4 \tuplet 3/2 { a8 g a } |
  e4 e8 a |
  c4 b |
  a2 \bar "||"
}

nhacPhienKhucBa = \relative c'' {
  \override Lyrics.LyricSpace.minimum-distance = #2.0
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  a8 c a c |
  d2 |
  b8 d b d |
  e2 \fermata |
  e8 d a d |
  c4. a8 |
  g4. a8 |
  e4 c'8 b |
  d4 g, |
  a2 ( |
  a4) r \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  \override Lyrics.LyricText.font-series = #'bold
  Lạy Thiên Chúa là Chúa chúng con,
  lẫy lừng thay danh Ngài khắp địa cầu.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Ngắm trời xanh tay Ngài sáng tạo.
  Muôn trăng sao Chúa đã an bài.
  Thì con người là chi,
  mà Chúa cần nhớ đến.
  Phàm nhân là gì, mà CHúa phải bận tâm.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  So với Thần Linh, Ngài không để thua là mấy.
  Ban vinh dự huy hoàng để làm mũ triều thiên.
  Kiệt tác của Ngài, Ngài cho làm bá chủ.
  Muôn loài muôn sự Ngài đặt cả dưới chân.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Bò chiên và dã thú,
  bò chiên và dã thú.
  Chim trời và cá biển mọi loài,
  muôn loại ngang dọc khắp trùng dương.
}


% Dàn trang
\score {
  \new ChoirStaff <<
    \new Staff = chorus <<
      \new Voice = "sopranos" {
        \global \stemNeutral \nhacDiepKhuc
      }
    >>
    \new Lyrics = basses
    \context Lyrics = basses 
      %\with \override LyricText.font-shape = #'bold
      \lyricsto sopranos \loiDiepKhuc
  >>
}

\score {
  \new ChoirStaff <<
    \new Staff = verses <<
      \override Staff.TimeSignature.transparent = ##t
      \new Voice = "verse" {
        \global \stemNeutral \nhacPhienKhucMot
      }
    >>
    \new Lyrics \lyricsto verse \loiPhienKhucMot
  >>
}

\score {
  \new ChoirStaff <<
    \new Staff = verses <<
      \override Staff.TimeSignature.transparent = ##t
      \new Voice = "verse" {
        \global \stemNeutral \nhacPhienKhucHai
      }
    >>
    \new Lyrics \lyricsto verse \loiPhienKhucHai
  >>
}

\score {
  \new ChoirStaff <<
    \new Staff = verses <<
      \override Staff.TimeSignature.transparent = ##t
      \new Voice = "verse" {
        \global \stemNeutral \nhacPhienKhucBa
      }
    >>
    \new Lyrics \lyricsto verse \loiPhienKhucBa
  >>
}
