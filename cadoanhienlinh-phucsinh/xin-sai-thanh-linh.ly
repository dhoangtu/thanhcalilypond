% Cài đặt chung
\version "2.20.0"
\include "english.ly"

\header {
  title = "Xin Sai Thánh Linh"
  composer = "Hoàng Kim"
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

% https://lilypond.org/doc/v2.19/Documentation/notation/working-with-ancient-music_002d_002dscenarios-and-solutions.en.html
% Nhạc điệp khúc
nhacDiepKhucSop = \relative c'' {
  \partial 4 g8 g |
  g8. a16 g8 b, |
  d4 a'8 a |
  a8. b16 c8 a |
  b4 g8 g |
  e'4 d |
  a8 b c4 |
  fs, a |
  g2 ( |
  g4) \bar "|."
}

nhacDiepKhucBass = \relative c'' {
  \skip 4
  \skip 1.
  \skip 2
  c4 b |
  fs8 g e4 |
  d c |
  b2 ( |
  b4)
}

% Nhạc phiên khúc
nhacPhienKhuc = \relative c' {
  \set Score.currentBarNumber = #10
  \partial 4 d8 d |
  ef8. d16 c8 ef |
  d4 g8 a |
  b b b16 (a) g8 |
  a4 b8 b |
  c8. b16 a8 c |
  b4 a8 b |
  d, g fs a |
  g2 ( |
  g4) \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  Lạy Chúa xin sai Thánh Linh
  Để Ngài đổi mới đổi mới mặt địa cầu.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Hồn tôi "ơi! Hãy chúc" tụng Chúa,
  hỡi Chúa, Thiên Chúa của con
  Ngài thật cao cả.
  Ngài mặc áo oai phong lẫm liệt,
  Và Ngài khoác long bào ánh sáng.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Ngài đặt trái đất trên nền vững,
  không khí chuyceenr lay,
  ngàn đời ngàn kiếp.
  Ngài dùng vực thẳm như áo che địa cầu,
  Và nước đã tụ lại trên đỉnh núi.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Ngài làm vọt lên những dòng suối,
  chúng róc rách tìm lỗi giữa những khe núi,
  gần dòng suối chim trời làm tổ.
  Núp dưới lá, chúng cất giọng líu lo.
}

loiPhienKhucBon = \lyricmode {
  \set stanza = #"4."
  Sự việc cúa Chúa, ôi lạy Chúa,
  thật là nhiều dường bao, 
  tất thảy Ngài làm đều khôn ngoan.
  Địa cầu đầy dẫy sang giàu của Ngài.
  Này hồn tôi hãy chúc tụng Đức Chúa.
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
  >>
}
