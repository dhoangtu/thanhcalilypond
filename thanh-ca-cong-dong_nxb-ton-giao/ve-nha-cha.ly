% Cài đặt chung
\version "2.20.0"
\include "english.ly"

\header {
  title = "Về Nhà Cha"
  tagline = ##f
}

global = {
  \key a \major
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

printItalic = { \override LyricText.font-shape = #'italic }

% Nhạc điệp khúc
sopChorus = \relative c' {
  e8 cs cs d |
  e2 |
  e8 cs' a b |
  cs2 |
  cs8 b b cs |
  d4. b8 |
  e b4 b8 |
  cs2 |
  e,8 cs cs d |
  e2 |
  e8 cs' a b |
  cs2 |
  b8 b b gs |
  e2 |
  cs8 e a gs |
  a2 ( |
  a4) \bar "|."
}

% Nhạc phiên khúc
verseMusic = \relative c'' {
  \set Score.currentBarNumber = #18
  \partial 4 a8 gs |
  fs4. d8 |
  d fs4 a8 |
  e2 ( |
  e4) e8 b' |
  b4. e,8 |
  b' a4 b8 |
  cs2 ( |
  cs4) fs,8 a |
  d4. fs,8 |
  fs fs4 a8 |
  d2 ( |
  d4) cs8 d |
  e,4. e8 |
  cs e b' gs |
  a2 \bar "||"
}

% Lời điệp khúc
choruslyric = \lyricmode {
  \set stanza = #"ĐK:"
  Trên đường về nhà Cha, từng lớp người đi tới,
  có muôn hoa thế giới và có bạn bè ta.
  Trên đường về nhà Cha, người đông đoài Nam Bắc,
  mang hoa thơm cỏ lạ, của rừng sâu đảo xa.
}

% Lời phiên khúc
verseOne = \lyricmode {
  \set stanza = #"1."
  Đất nước ta là đồng xanh lúa vàng,
  là sông sâu là đất mầu nuôi sống.
  Bạn bè ta là một bài ca mới,
  trong đất trời vang hòa tiếng hát lời ca.
}

verseTwo = \lyricmode {
  \set stanza = #"2."
  Năm tay nhau và cùng nhau bước đều,
  đường ta đi dù có nhiều gian khó.
  Đừng ngại chi vì bạn bè ta đó,
  bên mái nhà Cha hiền đang đứng chờ ta.
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 6. Bố trí
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\score {
  \new ChoirStaff <<
    \new Staff = chorus <<
      \new Voice = "sopranos" {
        \voiceOne \global \stemNeutral \sopChorus
      }
    >>
    \new Lyrics = basses
    \context Lyrics = basses \lyricsto sopranos \choruslyric
  >>
}

\score {
  \new ChoirStaff <<
    \new Staff = verses <<
      \override Staff.TimeSignature.transparent = ##t
      \new Voice = "verse" {
        \global \stemNeutral \verseMusic
      }
    >>
    \new Lyrics \lyricsto verse \verseOne
    \new Lyrics \with \printItalic \lyricsto verse \verseTwo
  >>
}
