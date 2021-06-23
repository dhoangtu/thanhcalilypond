% Cài đặt chung
\version "2.20.0"
\include "english.ly"

\header {
  title = \markup { \fontsize #3 "Phần Kết Kinh Nguyện Thánh Thể" }
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
nhacPhienKhucMot = \relative c'' {
  \afterGrace c4 _({c8 bf)} f g4 c8 (d) bf4 g8 c bf4 \breathe
  g8 g bf f f g g f g f16 (g) bf4 \breathe
  g8 c a c \breathe
  g bf bf bf g bf f4 (g) \bar "||"
  g8 (f g) g4 \bar "|."
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \override LyricText.font-series = #'bold
  Chính nhờ Người, với Người và trong Người
  mà mọi chúc tụng và vinh quang đều quy về Chúa,
  là Cha toàn năng cùng với Chúa Thánh Thần muôn đời.
  \override LyricText.font-series = #'normal
  A -- men.
}


% Dàn trang
\score {
  \new ChoirStaff <<
    \new Staff = phienKhuc \with {
        \magnifyStaff #(magstep +1)
      }
      <<
      \new Voice = beSop {
        \key bf \major \time 2/4 \nhacPhienKhucMot
      }
    >>
    \new Lyrics \lyricsto beSop \loiPhienKhucMot
  >>
  \layout {
    \override Staff.TimeSignature.transparent = ##t
    \override Lyrics.LyricText.font-size = #+3
    \override Lyrics.LyricSpace.minimum-distance = #2.0
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
    \set Score.barAlways = ##t
    \set Score.defaultBarType = ""
  } 
}
