% Cài đặt chung
\version "2.20.0"
\include "english.ly"

\header {
  title = "Tung Hô Tin Mừng"
  composer = "Lễ Chúa Thánh Thần Hiện Xuống"
  tagline = ##f
}

global = {
  \key d \major
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
  print-page-number = #f
}

% Nhạc điệp khúc
sopChorus = \relative c' {
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
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
choruslyricA = \lyricmode {
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
    \new Staff = chorus <<
      \new Voice = "sopranos" {
        \global \stemNeutral \sopChorus
      }
    >>
    \new Lyrics \lyricsto sopranos \choruslyricA
  >>
}
