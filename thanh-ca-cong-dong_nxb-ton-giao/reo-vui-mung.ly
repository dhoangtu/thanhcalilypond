% Cài đặt chung
\version "2.20.0"
\include "english.ly"

\header {
  title = "Reo Vui Mừng"
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

% Nhạc điệp khúc
nhacDiepKhucSop = \relative c'' {
  \partial 4 g8 (a) |
  g4. a8 |
  g8. d'16 d8 c |
  e2 ( |
  e4) a,8 c |
  d4. d8 |
  c4 a8 c |
  g2 (|
  g4) g8 (a) |
  g4. a8 |
  g8. d'16 d8 c |
  e2 ( |
  e4) a,8 c |
  d4. d8 |
  e (d) b4 |
  c2 ( |
  c4) \bar "|."
}

% Nhạc phiên khúc
nhacPhienKhuc = \relative c'' {
  \set Score.currentBarNumber = #17
  \partial 4 g8 g |
  g4. c8 |
  a8. c16 a8 g |
  e2 ( |
  e4) d8 d |
  d4. d8 |
  d g e d |
  c2 ( |
  c4) \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  \set stanza = #"ĐK:"
  Chúng con đến đây reo vui mừng Chúa.
  Và hân hoan dâng Ngài lời cảm tạ.
  Chúng con đến đây reo vui mừng Chúa.
  Cùng hòa vang theo tiếng đàn ca.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Xin tung hô Chúa là Chúa cả muôn loài.
  Xin tung hô Ngài là Chúa khắp địa cầu.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Xin dâng lên những ngày tháng trong cuộc đời.
  Xin dâng lên bao nhiêu đắng cay u sầu.
}

% Dàn trang
\score {
  \new ChoirStaff <<
    \new Staff = chorus <<
      \new Voice = "sopranos" {
        \voiceOne \global \stemNeutral \nhacDiepKhucSop
      }
    >>
    \new Lyrics = basses
    \context Lyrics = basses \lyricsto sopranos \loiDiepKhuc
  >>
}

\score {
  \new ChoirStaff <<
    \new Staff = verses <<
      \override Staff.TimeSignature.transparent = ##t
      \new Voice = "verse" {
        \global \stemNeutral \nhacPhienKhuc
      }
    >>
    \new Lyrics \lyricsto verse \loiPhienKhucMot
    \new Lyrics \with \inNghieng \lyricsto verse \loiPhienKhucHai
  >>
}
