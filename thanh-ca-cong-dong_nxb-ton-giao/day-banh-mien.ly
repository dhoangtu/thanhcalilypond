% Cài đặt chung
\version "2.20.0"
\include "english.ly"

\header {
  title = "Đây Bánh Miến"
  composer = "Kim Long"
  tagline = ##f
}

global = {
  \key c \major
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
  g2 c4 |
  c g e |
  f2 a4 |
  g2. |
  d2 f4 |
  e e f |
  g2 d4 |
  e2. |
  g2 c4 |
  c g e |
  f2 a4 |
  g2. |
  d2 f4 |
  e e f |
  g (a) b |
  c2. \bar "|."
}

nhacDiepKhucBass = \relative c' {
  e2 g4 |
  f e c |
  d2 c4 |
  b2. |
  b2 d4 |
  c c d |
  e (d) b |
  c2. |
  e2 g4 |
  f e c |
  d2 c4 |
  b2. |
  b2 d4 |
  c c d |
  e (d) <f g,> |
  <e c>2.
}

% Nhạc phiên khúc
nhacPhienKhuc = \relative c'' {
  \set Score.currentBarNumber = #10
  c2 a4 |
  e2 a4 |
  c4 a a |
  a2. |
  g2 a4 |
  d,2 e4 |
  f e d |
  e2. |
  e4 a c |
  a2. |
  d,4 g a |
  g2. |
  g4 (f) e |
  c'2 d4 |
  c (b) a |
  g2. \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  \set stanza = #"ĐK:"
  Đây bánh miến đây rượu nho khiết tinh.
  Lòng chân thành cùng dâng Chúa hiển vinh.
  Như khói trắng như trầm hương ngát thơm.
  Cầu Chúa thương nhận của lễ hy sinh.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Chúng con cùng dâng tiến lên ngai thiêng,
  trong chén vàng cuộc sống bao tình yêu.
  Cầu mong Chúa thương, hiệp nhất chúng con,
  trong tình Chúa mến thương muôn đời.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Hướng tâm hồn lên Chúa trong tin yêu,
  dâng trót đời khổ giá nơi trần gian.
  Cầu xin Chúa thương, phù giúp chúng con,
  tiến về tới ánh quang thiên đường.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Chúng con cầu xin Chúa cho muôn dân,
  mau kết đoàn vui sống trong tình thân.
  Cầu Cha chí nhân, tràn muôn thánh ân,
  trên đời sống khó nguy gian trần.
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
