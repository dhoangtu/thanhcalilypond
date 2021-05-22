% Cài đặt chung
\version "2.20.0"
\include "english.ly"

\header {
  title = \markup { \fontsize #3 "Tung Hô Tin Mừng" }
  poet = "Lễ Chúa Thánh Thần Hiện Xuống"
  composer = "Lm. Trần Thanh Cao"
  arranger = " "
  tagline = ##f
}

\paper {
  #(set-paper-size "a4")
  top-margin = 15\mm
  bottom-margin = 15\mm
  left-margin = 20\mm
  right-margin = 20\mm
  indent = #0
  #(define fonts
    (make-pango-font-tree
      "Liberation Serif"
      "Liberation Serif"
      "Liberation Serif"
      (/ 20 20)))
  page-count = #1
}

% Nhạc điệp khúc
nhacDiepKhuc = \relative c' {
  \partial 4 \tuplet 3/2 { d8 fs a } |
  b4 \tuplet 3/2 { b8 a fs } |
  a4 \tuplet 3/2 { fs8 e d } |
  e4. e8 |
  d4 b |
  d2 ( |
  d8) d fs e |
  d4 fs8 g |
  a4 fs8 fs |
  d fs a4 |
  gs8 e cs' b |
  a2 |
  fs8 a d cs |
  b4 cs8 b |
  a4 \tuplet 3/2 { a8 a a } |
  d2 ( |
  d4) r \bar "|."
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  Ha -- lê -- lu -- ia. Ha -- lê -- lu -- ia.
  Ha -- lê -- lu -- ia. Ha -- lê -- lu -- ia.
  Lạy Chúa Thánh Thần, xin ngự đến
  cho tâm hồn tín hữu được nhuần thấm muôn ơn.
  Và cháy lửa mến yêu, mến yêu Ngài.
  Ha -- lê -- lu -- ia.
}

% Bố trí
\score {
  \new ChoirStaff <<
    \new Staff = diepKhuc \with {
        \consists "Merge_rests_engraver"
        \magnifyStaff #(magstep +1)
      }
      <<
      \new Voice = beSop {
        \key d \major \time 2/4 \stemNeutral \nhacDiepKhuc
      }
    >>
    \new Lyrics \lyricsto beSop \loiDiepKhuc
  >>
  \layout {
    \override Lyrics.LyricText.font-series = #'bold
    \override Lyrics.LyricText.font-size = #+3
    \override Lyrics.LyricSpace.minimum-distance = #2.0
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
  }
}