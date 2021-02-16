% Cài đặt chung
\version "2.20.0"
\include "english.ly"

\header {
  title = "Mẹ Dâng Lễ Với Con"
  subsubtitle = "(Lễ Thiếu Nhi)"
  composer = "Phanxicô"
  tagline = ##f
}

global = {
  \key f \major
  \time 3/4
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
  \partial 4 a4 |
  c2 a4 |
  c4 d c |
  bf2 c4 |
  f,2 g4 |
  a2 f4 |
  d e f |
  g2 e8 g |
  c,2 c4 |
  e g g |
  f2 \fermata \bar "|."
}

nhacDiepKhucBass = \relative c' {
  \partial 4 f4 |
  a2 f4 |
  a bf a |
  g2 f4 |
  d2 c4 |
  f2 a,4 |
  bf c d |
  c2 c8 bf |
  a2 a4 |
  c4 c bf |
  a2
}

% Nhạc phiên khúc
nhacPhienKhuc = \relative c'' {
  \set Score.currentBarNumber = #11
  a4 c c |
  c2 d4 |
  bf g8 (f) f4 |
  f2. |
  f4 g a |
  e2 e4 |
  d d e |
  f2. \fermata \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  \set stanza = #"ĐK:"
  Mẹ ơi, Mẹ dâng lễ với con nến hồng rực sáng
  tâm hồn con sốt sắng khi có Mẹ cùng dâng lễ với con.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Tuổi con như hoa, ước mơ đời hiền hòa.
  Vào trong thánh điện khấn nguyện tình bao la.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Mẹ chung tay con, tiến dâng Cha cuộc đời.
  Hợp trong lễ này bao ngày dài tương lai.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Mẹ con hôm nay, kết yêu thương tràn trề.
  Cùng dâng lễ này như ngày nào Can -- vê.
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
