% Cài đặt chung
\version "2.20.0"
\include "english.ly"

\header {
  title = "Con Bước Lên Bàn Thờ"
  composer = "Kim Long"
  tagline = ##f
}

global = {
  \key f \major
  \time 3/8
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
  c4 d8 |
  c (bf) g |
  f4. |
  c8 a' bf |
  a4 g8 |
  a4 bf8 |
  c4. |
  c4 d8 |
  c (bf) g |
  a4. |
  a8 bf a |
  g4 f8 |
  g a g |
  f4. \bar "|."
}

nhacDiepKhucBass = \relative c'' {
  a4 bf8 |
  a (g) e |
  f4. |
  c8 f g |
  f4 e8 |
  f4 f8 |
  e4. |
  a4 bf8 |
  a (g) c, |
  f4. |
  f8 g f |
  e4 d8 |
  c c bf |
  a4.
}

% Nhạc phiên khúc
nhacPhienKhuc = \relative c' {
  \set Score.currentBarNumber = #15
  f8 (e) d |
  c4 f8 |
  g f e |
  f4 a8 |
  bf a g |
  a4 c8 |
  d,4 f8 |
  g4. |
  f8 (e) d |
  c4 f8 |
  g f e |
  f4 g8 |
  bf a g |
  a4 d,8 |
  g8 (a) g |
  f4. \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  \set stanza = #"ĐK:"
  Con bước lên bàn thờ,
  cùng dân Chúa đây hợp dâng thánh lễ.
  Đây lễ chiên chiều xưa:
  Con Chúa uy linh đã trao hiến thân mình.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Muôn tâm hồn liên kết trong tình thân,
  dâng tiến Cha toàn năng lễ vật hy sinh.
  Xin Cha lành cho lễ dâng toàn thiêu,
  mưa xuống muôn hồng ân nhuần thấm tâm hồn.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Con nguyện cầu xin Chúa thương trần gian,
  cho khắp nơi bình an Giáo hội rộng lan.
  Cho muôn người thôi oán thương hận than,
  cho khói binh mờ tan, hạnh phúc tuông tràn.
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
  >>
}
