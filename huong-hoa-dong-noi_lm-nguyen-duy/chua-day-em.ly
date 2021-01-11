% Cài đặt chung
\version "2.20.0"
\include "english.ly"

\header {
  title = "Chúa Dạy Em"
  composer = "Lm. Nguyễn Duy"
  tagline = ##f
}

global = {
  \key c \major
  \time 2/4
  \override Lyrics.LyricSpace.minimum-distance = #2.0
}

\paper {
  #(set-paper-size "a5")
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

% Nhạc điệp khúc
sopChorus = \relative c' {
  c'4 \appoggiatura b8 c e, |
  g4 e |
  f8 d e (d) |
  c2 |
  c'4 \appoggiatura b8 c e, |
  g4 e |
  c8 c f (g) |
  a4 r |
  b8 b \appoggiatura b c g |
  g4 f8 f |
  g4 e8 e |
  e4 r |
  b'8 b \appoggiatura b d g, |
  g4 g8 g16 (a) g8 g a b |
  c2 \bar "|."
}

% Lời điệp khúc
choruslyricA = \lyricmode {
  Chúa đã dạy em yêu Chúa và yêu người.
  Chúa đã dạy em yêu người và yêu Chúa.
  Em xin giữ lời Ngài em luôn sống vì mọi người.
  Em tuân giữ lời Ngài để chứng tỏ là em yêu Chúa.
}

% Bố trí
\score {
  \new ChoirStaff <<
    \new Staff = chorus <<
      \override Staff.TimeSignature.transparent = ##t
      \new Voice = "sopranos" {
        \global \stemNeutral \sopChorus
      }
    >>
    \new Lyrics \lyricsto sopranos \choruslyricA
  >>
}
