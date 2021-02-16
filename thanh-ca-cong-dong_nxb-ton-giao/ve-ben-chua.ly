% Cài đặt chung
\version "2.20.0"
\include "english.ly"

\header {
  title = "Về Bên Chúa"
  composer = "Nguyễn Duy"
  tagline = ##f
}

global = {
  \key g \major
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
  g4 g |
  d b'8 b |
  g4 g8 a ( |
  a2) |
  a4 a |
  e c'8 c |
  a4 a8 b ( |
  b2) |
  d4 d |
  b4 b8 b |
  c4 d8 e ( |
  e2) |
  c4 c |
  a a8 a |
  d4 c8 b ( |
  b2) |
  b4 b |
  g g8 g |
  b4 g8 a ( |
  a2) |
  a4 a |
  fs fs8 fs |
  a4 fs8 g ( |
  g2 |
  g4) \bar "|."
}

nhacDiepKhucBass = \relative c'' {
  \override NoteHead.font-size = #-2
  \skip 1.
  \skip 1.
  \skip 1
  b4 b |
  g g8 g |
  e4 g8 c ( |
  c2) |
  a4 a |
  fs fs8 fs |
  fs4 fs8 g ( |
  g2) |
  g4 g |
  e e8 e |
  d4 e8 c ( |
  c2) |
  c4 cs |
  d d8 d |
  c4 d8 b (b2 |
  b4)
}

% Nhạc phiên khúc
nhacPhienKhuc = \relative c'' {
  \set Score.currentBarNumber = #26
  \partial 4 g8 fs |
  e4 e |
  fs e8 d ( |
  d2 |
  d4) d8 e |
  fs4 fs |
  e4 d8 g ( |
  g2) \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  \set stanza = #"ĐK:"
  Tôi vui mừng tiến bước về nhà Cha.
  Gieo cung đàn thắm thiết lời ngợi ca.
  Ôi bao lần lòng này luôn mơ ước.
  Xin nương mình vào lòng Chúa bao la.
  Cho ân tình còn đẹp mãi mầu hoa.
  Như cung nhạc tìm những vần thơ.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Chúa kêu mời con bước lên đường,
  về với Chúa suối nguồn tình thương.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Cúi xin Ngài hợp nhất muôn người,
  một lòng trí mến yêu tràn vui.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Sáng danh Ngài là Chúa đất trời,
  ngợi khen Chúa hát lên người ơi.
}

% Dàn trang
\score {
  \new ChoirStaff <<
    \new Staff = chorus <<
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
    \new Lyrics \lyricsto verse \loiPhienKhucBa
  >>
}
