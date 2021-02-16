% Cài đặt chung
\version "2.20.0"
\include "english.ly"

\header {
  title = "Về Đây Hỡi Người"
  composer = "Lan Thanh"
  tagline = ##f
}

global = {
  \key bf \major
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
nhacDiepKhucSop = \relative c' {
  \partial 4 bf8 (c) |
  f8. g16 bf,8 bf16 (c) |
  f8 r g bf |
  f8 c' bf c |
  d2 ( |
  d4) g,8 (bf) |
  c8. d16 g,8 g16 (bf) |
  c8 r c d |
  g, a bf g |
  d2 ( |
  d4) bf8 (c) |
  f8. g16 bf,8 bf16 (c) |
  f8 r g bf |
  f c' bf c |
  d2 ( |
  d4) g,8 (bf) |
  c8. d16 g,8 g16 (bf) |
  c8 r c d |
  bf c d c |
  bf2 \bar "|."
}

nhacDiepKhucBass = \relative c' {
  \partial 4 bf8 (c) |
  d8. c16 bf8 bf16 (c) |
  d8 r d d16 (c) |
  bf8 ef d f |
  bf2 ( |
  bf4) g4 |
  f8. d16 bf8 c |
  f8 r f f |
  bf, c d ef |
  d2 ( |
  d4) bf8 c |
  d8. c16 bf8 bf16 (c) |
  d8 r d d16 (c) |
  bf8 ef d f |
  bf2 ( |
  bf4) g4 |
  f8. d16 bf8 c |
  f8 r f f |
  ef c f f |
  <d bf>2
}

% Nhạc phiên khúc
nhacPhienKhuc = \relative c'' {
  \set Score.currentBarNumber = #20
  bf8. bf16 f8 g |
  bf4 bf8 bf |
  bf4. c16 (bf) |
  f2 |
  f8 c f g |
  g4 f8 f |
  d'4. c8 |
  c2 |
  c8 bf16 (c) c8 bf |
  g4 g8 bf |
  g4 g8 (bf) |
  f2 |
  f8 c f g |
  bf4 c8 d |
  f,4 f8 (g) |
  bf2 ( |
  bf4) \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  \set stanza = #"ĐK:"
  Về đây hỡi người về đây, ta tiến vào cung điện Thiên Chúa.
  Về đây hỡi người về đây, ta tiến vào nơi Thánh Vua Trời.
  Về đây hỡi người về đây, ta cất lời ca tụng Thiên Chúa.
  Về đây hỡi người về đây, ta chúc tụng Danh Chúa muôn đời.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Đây cung điện Thiên Chúa ôi nguy nga diễm lệ.
  Ta dừng chân đứng ngắm mà lòng thấy say mê.
  Ta rủ nhau đi về, (về) cung điện Chúa Trời.
  Dâng lời ca tiếng hát Thiên Chúa là nguồn vui.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Tôi vô cùng sung sướng khi nghe ai nói rằng:
  Đi về cung thánh Chúa về Nhà Chúa muôn dân.
  Ta rủ nhau đi về, (về) ngắm Nhan Thánh Người.
  Xin Người cho ta sống luôn vững một niềm vui.
}

% Dàn trang
\score {
  \new ChoirStaff <<
    \new Staff = chorus \with {
        \consists "Merge_rests_engraver"
      }
      <<
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
