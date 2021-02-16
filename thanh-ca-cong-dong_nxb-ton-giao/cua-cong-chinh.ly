% Cài đặt chung
\version "2.20.0"
\include "english.ly"

\header {
  title = "Cửa Công Chính"
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
nhacDiepKhucSop = \relative c' {
  c8 (d) e (f) |
  g4 a8 (g) |
  d (f) e d |
  c4 g'8 g |
  e e g4 |
  a c8 c |
  a a c4 |
  d2 |
  d8 (c) b (a) |
  g4 a8 g |
  e d16 (e) g4 |
  a c8 (b) |
  a (b) c (d) |
  e4 f8 (e) |
  d4. e16 (e) |
  c2 \bar "|."
}

nhacDiepKhucBass = \relative c' {
  c8 (d) e (f) |
  g4 a8 (g) |
  d (f) e d |
  c4 b8 b |
  c c e4 |
  f e8 e |
  f f a4 |
  g2 |
  d'8 (c) b (a) |
  g4 a8 g |
  e d16 (e) g4 |
  a4 e8 (g) |
  fs (g) a (g) |
  c4 a8 (c) |
  f, (e f) g |
  <e c>2
}

% Nhạc phiên khúc
nhacPhienKhuc = \relative c'' {
  \set Score.currentBarNumber = #17
  g8 a16 (g) e8 (g) |
  a4. c8 |
  d (e) e (c) |
  g2 |
  d8 d d g |
  a4 a |
  f8 \acciaccatura a8 g e (d) |
  c2 \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  \set stanza = #"ĐK:"
  Cửa công chính hãy mở cho tôi vào,
  cho tôi vào tạ ơn Chúa nơi cung điện ngợp quang vinh.
  Chính đây là, chính đây là cửa Thiên Chúa,
  hỡi người công chính hãy mau tiến vào.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Hãy cảm tạ Chúa vì Chúa nhân từ,
  vì tình Người yêu thương ta bền vững muôn đời.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Hãy chúc tụng Chúa nào khắp nhân trần.
  Vì tình Người yêu thương ta bền vững muôn đời.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Trong lúc sầu thương hằng vững tin Người,
  và bền lòng tôi kêu xin Người sẽ nghe lời.
}

loiPhienKhucBon = \lyricmode {
  \set stanza = #"4."
  Tin vững vào Chúa lợi ích vô cùng,
  vì trần hoàn này không ai quyền phép như Người.
}

loiPhienKhucNam = \lyricmode {
  \set stanza = #"5."
  Ca khúc tạ ơn thành kính dâng Người,
  trần hoàn đồng ca vang lên hòa với cung đàn.
}

loiPhienKhucSau = \lyricmode {
  \set stanza = #"6."
  Tôi vẫn bình tâm dù giữa quan thù,
  cậy nhờ quyền uy Đức Chúa chẳng khiếp sợ gì.
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
    \new Lyrics \with \inNghieng \lyricsto verse \loiPhienKhucBon
    \new Lyrics \lyricsto verse \loiPhienKhucNam
    \new Lyrics \with \inNghieng \lyricsto verse \loiPhienKhucSau
  >>
}
