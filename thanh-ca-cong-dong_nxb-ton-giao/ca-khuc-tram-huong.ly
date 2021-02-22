% Cài đặt chung
\version "2.20.0"
\include "english.ly"

\header {
  title = "Ca Khúc Trầm Hương"
  composer = "Dao Kim"
  tagline = ##f
}

global = {
  \key d \major
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
  \partial 4 d4 |
  b2 d4 |
  b2 d4 |
  e d c |
  a2. ( |
  a2) c4 |
  a2 c4 |
  a2 c4 |
  d c a |
  b2. ( |
  b2) d4 |
  b2 d4 |
  b2 b4 |
  c c d |
  e2. ( |
  e2) c4 |
  a2 c4 |
  a2 c4 |
  d c a |
  g2. _( |
  g4) r \bar "|."
}

nhacDiepKhucBass = \relative c'' {
  b4 |
  g2 b4 |
  g2 b4 |
  c b a |
  fs2. ( |
  fs2) a4 |
  fs2 a4 |
  fs2 a4 |
  b a fs |
  g2. ( |
  g2) b4 |
  g2 b4 |
  g2 g4 |
  a a b |
  c2. ( |
  c2) a4 |
  fs2 a4 |
  fs2 a4 |
  b a fs |
  g2. ^( |
  g4) r4
}

% Nhạc phiên khúc
nhacPhienKhuc = \relative c'' {
  \set Score.currentBarNumber = #21
  \partial 4 g4 |
  e2 e4 |
  e2 d4 |
  g2 a4 |
  b2. ( |
  b2) c4 |
  b2 a4 |
  b2 g4 |
  a2 a4 |
  a2. ( |
  a2) g4 |
  e2 e4 |
  e2 d4 |
  g2 a4 |
  b2. ( |
  b2) c4 |
  b2 a4 |
  e'2 e4 |
  d2 fs,4 |
  g2. ( |
  g4) r4 \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  \set stanza = #"ĐK:"
  Lời con như trầm hương bay lên tới thiên đường
  bay lên tới thiên đường cho lung linh ánh nhiệm mầu.
  Thiết tha là như cánh vạc kêu sương Chúa ơi.
  Lòng con chân thành dâng vinh quang Chúa muôn vàn
  không gian mấy tơ vàng đây cao siêu lễ tôn thờ.
  Khấn cầu là Chúa hãy dủ lòng thương ban muôn hồng ân.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Chúa ơi bênh vực con luôn khỏi những quân gian thù
  hằng mưu ác hại con.
  Cánh tay con này vươn cao như đất mong mưa rào
  hồn con khát Chúa dường bao.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Chúa ơi con hằng trông mong được ở trong nhà Ngài
  ngày đêm suốt đời con.
  Lời cầu như trầm hương dâng ơn thánh Chúa dạt dào
  dìu con lên tới đỉnh cao.
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
