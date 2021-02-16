% Cài đặt chung
\version "2.20.0"
\include "english.ly"

\header {
  title = "Hành Trang Người Trẻ"
  composer = "Hoàng Đức"
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
nhacDiepKhucSop = \relative c' {
  \partial 4 d4 |
  b'4 b8 a |
  g g a g |
  d2 ( |
  d4) d |
  b' b8 a |
  g g a g |
  e2 ( |
  e4) e8 g |
  g4 a8 (g) |
  d4 b8 (c) |
  d4 d8 d 
  b'4. (c16 b) |
  a4 e8 e |
  a4. ( b16 a) |
  g2 ( \bar "|."
  g4)
}

% Nhạc phiên khúc
nhacPhienKhuc = \relative c'' {
  \set Score.currentBarNumber = #17
  \partial 4 g4 |
  c c8 c |
  c4 g8 a |
  g4 g8 a |
  \acciaccatura a8 b2 ( |
  b4) g |
  b b8 b |
  b4 g8 a |
  e4 e8 g |
  d2 ( |
  d4) d |
  a' a8 a |
  a4 a8 a |
  a2 ( |
  a4) a8 a |
  a4 b8 a |
  a4 d8 d |
  d2 ( |
  d4) \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  \set stanza = #"ĐK:"
  Lạy Chúa chúng con về từ bốn phương trời.
  Lạy Chúa chúng con về từ khắp thôn làng.
  Cùng với lớp sóng người hành hương
  về nhà Chúa đi, về nhà Chúa đi.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Hành trang con mang theo đầy đau buồn của thế giới.
  Hành trang con mang theo trào căm hờn của kiếp nghèo.
  Về đây xin dâng Cha trong lo âu,
  đưa hai tay quyết chung xây thế giới mới.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Hành trang con mang theo cuộc nổi loạn của giới trẻ.
  Hành trang con mang theo niềm lo sợ của lớp già.
  Về đây xin dâng Cha trong lo âu,
  đưa hai tay quyết chung xây thế giới mới.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Hành trang con mang theo mọi khát vọng tìm chân lý.
  Hành trang con mang theo mọi xây dựng tìm công bằng.
  Về đây xin dâng Cha trong lo âu,
  đưa hai tay quyết chung xây thế giới mới.
}

% Dàn trang
\score {
  \new ChoirStaff <<
    \new Staff = chorus <<
      \new Voice = "sopranos" {
        \voiceOne \global \slurDown \stemNeutral \nhacDiepKhucSop
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
