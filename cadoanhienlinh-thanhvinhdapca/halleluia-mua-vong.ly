% Cài đặt chung
\version "2.20.0"
\include "english.ly"

\header {
  title = "Halleluia Mùa Vọng"
  composer = " "
  tagline = ##f
}

global = {
  \key f \major
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
sopChorus = \relative c' {
  \override Lyrics.LyricSpace.minimum-distance = #4.0
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \partial 4 \tuplet 3/2 { f8 f f } |
  a4 \tuplet 3/2 { a8 a c } |
  d2 |
  d8 c a c |
  d2 |
  a8 g f d |
  a'2 |
  e8 e g a (\slashedGrace bf) |
  a2 |
  g8 f e g |
  f4. f8 |
  g8 (a) g (f) |
  f2 \bar "|."
}

% Lời điệp khúc
choruslyricA = \lyricmode {
  Hal -- le -- lu -- ia.
  Hal -- le -- lu -- ia.
  Hãy dâng lời cảm mến.
  Hãy dọn đường người đến.
  Vì tình thương thiết tha.
  Đấng cứu độ chúng ta.
  Hal -- le -- lu -- ia.
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
