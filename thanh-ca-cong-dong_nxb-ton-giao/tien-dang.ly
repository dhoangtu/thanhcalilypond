% Cài đặt chung
\version "2.20.0"
\include "english.ly"

\header {
  title = "Tiến Dâng"
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
  a4 g8 |
  f4 d8 |
  c4 c8 |
  a'4 a8 |
  a gs a |
  c _(bf) a |
  g4. |
  a4 g8 |
  f4 d8 |
  c4 c8 |
  g'4 g8 |
  g fs g |
  bf _(a) g |
  f4 \bar "|."
}

nhacDiepKhucBass = \relative c' {
  \skip 4.
  \skip 4.
  \skip 4.
  f4 f8 |
  f e f |
  a ^(g) f |
  c4. |
  \skip 4.
  \skip 4.
  \skip 4.
  b!4 b8 |
  c d e |
  g ^(f) e
}

% Nhạc phiên khúc
nhacPhienKhuc = \relative c'' {
  \set Score.currentBarNumber = #15
  \partial 8 c8 |
  c4 a8 |
  a4 f8 |
  e4. |
  f8 g a |
  d,4 d8 |
  d4. |
  d8 e g |
  c,4 c8 |
  c4 c8 |
  e g f |
  bf8. a16 gs8 |
  a4. \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  \set stanza = #"ĐK:"
  Tiến dâng trên bàn thờ rượu nho thơm hương
  cùng bánh miến trắng tinh.
  Chúa khoan nhân vô bờ,
  đoàn con xin đoan nguyện yêu mến hết tình.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Tiếng hát thơm hương nguyện cầu,
  tỏa bay khắp trời diệu huyền.
  Đoàn con kính thờ trọn niềm,
  nguyện dâng Chúa lời chúc ca thành tâm.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Kính tiến lên ngai Cha hiền,
  này đây xác hồn mọn hèn.
  Còn nơi thế trần lụy phiền,
  nguyện xin Chúa giải thoát ban bình yên.
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
