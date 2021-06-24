% Cài đặt chung
\version "2.20.0"
\include "english.ly"

\header {
  title = \markup { \fontsize #3 "Suy Tôn Thánh Giá" }
  poet = " "
  composer = "Lm. GB Trần Thanh Cao"
  arranger = " "
  tagline = ##f
}

\paper {
  #(set-paper-size "a4")
  top-margin = 10\mm
  bottom-margin = 10\mm
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

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c' {
  \partial 4 d8( f) |
  a4 g8( a16 g) |
  f2 |
  f4 g8 f |
  e f d4( |
  d) f |
  d8( f) a4 |
  a8( bf) a4 |
  g8( a) f e |
  d2 |
  e4 d8 f |
  e d a4 |
  d d |
  c2 |
  f4 d |
  a'8 f d a |
  f'4 e8 f |
  d2 \bar "|."
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  Đây là đây là cây Thánh Giá Chúa Ki -- tô,
  chính nơi này đem ơn cứu độ,
  ơn cứu độ cho trần gian.
  "Chung: Chúng" ta hãy mau mau đến tôn thờ mà thờ lạy mến yêu.
  
  Đây là đây là cây Thánh Giá Chúa Ki -- tô,
  chính nơi này đem ơn cứu độ,
  ơn cứu độ cho trần gian.
  "Chung: Chúng" ta hãy mau mau đến tôn thờ mà thờ lạy mến yêu.
  
  Đây là đây là cây Thánh Giá Chúa Ki -- tô,
  chính nơi này đem ơn cứu độ,
  ơn cứu độ cho trần gian.
  "Chung: Chúng" ta hãy mau mau đến tôn thờ mà thờ lạy mến yêu.
}


% Dàn trang
\score {
  \new ChoirStaff <<
    \new Staff = phienKhuc \with {
        \magnifyStaff #(magstep +1)
      }
      <<
      \new Voice = beSop {
        \key f \major \time 2/4 \nhacPhienKhucMot
      }
    >>
    \new Lyrics \lyricsto beSop \loiPhienKhucMot
  >>
  \layout {
    \override Lyrics.LyricText.font-size = #+3
    \override Lyrics.LyricSpace.minimum-distance = #3.5
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
  } 
}
