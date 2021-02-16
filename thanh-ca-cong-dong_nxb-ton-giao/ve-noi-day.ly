% Cài đặt chung
\version "2.20.0"
\include "english.ly"

\header {
  title = "Về Nơi Đây"
  composer = "Nguyễn Duy"
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
  c8 g e f |
  g4 e |
  c a' |
  g2 |
  c8 g e f |
  g4 g8 g |
  c4 d |
  e2 |
  e8 e f e |
  d4 a |
  d8 d e d |
  c4 g |
  e8 e f g |
  a4 g8 g |
  b4 d |
  c2 ( |
  c4) \bar "|."
}

nhacDiepKhucBass = \relative c' {
  \override NoteHead.font-size = #-2
  e8 d c d |
  b4 c |
  a c |
  e2 |
  e8 d c d |
  e4 d8 d |
  e4 g |
  c2 |
  c8 c a c |
  g8 (e) f4 |
  g8 g g f |
  e (d) e4 |
  c8 c d e |
  f4 e8 e |
  d4 g |
  <e c>2 ( |
  <e g>4 )
}

% Nhạc phiên khúc
nhacPhienKhuc = \relative c'' {
  \set Score.currentBarNumber = #18
  \partial 4 e8 e |
  e8. c16 c8 c |
  d4 d8 d |
  d8. b16 b8 b |
  c4 c8 b |
  a4 g |
  f g |
  e2 ( |
  e4) c8 c |
  e8. e16 d8 d |
  f4 e8 e |
  g8. g16 f8 f |
  a4 a8 b |
  c4 d |
  e c |
  d2 \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  \set stanza = #"ĐK:"
  Chúng con về nơi đây dâng ngàn tiếng ca.
  Chúng con về nơi đây để tạ ơn Thiên Chúa.
  Qua bao tháng năm mong chờ, say sưa thánh ân vô bờ,
  được cùng nhau bên Chúa thỏa lòng con ước mơ.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Với tiếng hát rạo rực niềm tin
  với ánh mắt đọng lời nguyện xin,
  chúng con dâng muôn ngàn ý tình.
  Từng lời kinh hay từng cuộc sống,
  cùng hòa chung trong tình hiệp nhất,
  nguyện dâng lên Thiên Chúa tình yêu.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Hãy đón lấy một trời hồng ân
  hãy giữ lấy cả một mùa xuân,
  Chúa thương ban cho người thế trần.
  Một lần ta đến dự tiệc thánh,
  thì đời ta no thỏa hạnh phúc,
  nguồn bình an chan chứa đời ta.
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
