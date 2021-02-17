% Cài đặt chung
\version "2.20.0"
\include "english.ly"

\header {
  title = "Xin Chúa Thiên Đình"
  composer = "Kim Long"
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
  c4 d8 c |
  a4. a16 ^(c) |
  d,8 f a c |
  g4. g16 (a) |
  f8 g a f |
  d2 ( |
  \bar "|."
  d4) r8
}

% Nhạc phiên khúc
nhacPhienKhuc = \relative c' {
  \set Score.currentBarNumber = #8
  \partial 8 d16 (c) |
  a8 (c) d (f) |
  d4. d8 |
  f d f g |
  a4. g8 |
  a g a c |
  d4. d16 (c) |
  g8 (c) d (c) |
  a4. f8 |
  g a f c |
  d2 \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  \set stanza = #"ĐK:"
  Xin Chúa thiên đình đoái nhận bánh miến trắng tinh
  với rượu nho ngát hương lành.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Xin cùng tiến dâng này đây rượu nho bánh miến,
  cùng muôn sầu thương nguy biến,
  giữa đời khóc than,
  cầu mong Chúa ban bình an.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Tâm hồn chúng con cùng nên một trong yêu mến,
  tựa muôn ngàn hạt lúa miến,
  kết thành bánh thơm,
  hiệp dâng Chúa trong niềm tin.
}

% Dàn trang
\score {
  \new ChoirStaff <<
    \new Staff = chorus <<
      \new Voice = "sopranos" {
        \global \slurDown \stemNeutral \nhacDiepKhucSop
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
