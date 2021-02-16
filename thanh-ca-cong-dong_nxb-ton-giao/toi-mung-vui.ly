% Cài đặt chung
\version "2.20.0"
\include "english.ly"

\header {
  title = "Tôi Mừng Vui"
  composer = "Kim Long"
  tagline = ##f
}

global = {
  \key f \major
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
  \partial 4 a8 g |
  a4. c8 |
  a g f (e) |
  d4 c8 (d) |
  f4 a8 (g) |
  f d f g |
  a2 |
  <a f d>4. <a f d>8 |
  <a e cs a>4 \breathe g8 f |
  g a f c |
  d4 \breathe <d' a f d>8 <c a f d>8 |
  <f c a d,>4. <e c a d,>8 |
  <d a f d>2 \bar "|."
}

% Nhạc phiên khúc
nhacPhienKhuc = \relative c'' {
  \set Score.currentBarNumber = #13
  d8 d d c |
  d4 c8 d |
  g, (a) bf c |
  a2 |
  d,8 d d f |
  g4 g8 a |
  f g e f |
  d4 \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  \set stanza = #"ĐK:"
  Tôi mừng vui mỗi khi nghe nhủ rằng:
  ''Nào ta tiến lên đền thờ Thiên Chúa''.
  Đây Gia -- liêm, ta dừng chân ngắm cửa tiền đường,
  ôi thành thánh vinh quang.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Đây Gia -- liêm thành đô luôn vững bền với tháng năm.
  Người người cùng mừng vui dâng lễ vật ca tụng Chúa Trời.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Muôn dâng sum họp đây nơi thánh điện hương ngát bay.
  Vạn lòng cùng vui say ơn Chúa tràn ứ trong chốn này.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Tay trong ta cùng nhau trông thánh điện vui bước mau.
  Cầu hòa bình bền lâu cho thánh điện thắm tươi sắc màu.
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
