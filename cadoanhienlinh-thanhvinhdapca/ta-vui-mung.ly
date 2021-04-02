% Cài đặt chung
\version "2.20.0"
\include "english.ly"

\header {
  title = "Ta Vui Mừng"
  composer = "TV. 121"
  arranger = " "
  tagline = ##f
}

global = {
  \key c \major
  \time 2/4
}

\paper {
  #(set-paper-size "a4")
  top-margin = 20\mm
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

% Nhạc điệp khúc
nhacDiepKhuc = \relative c'' {
  \override Lyrics.LyricSpace.minimum-distance = #4.0
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \partial 4 g8 g |
  c,4
  <<
    {
      e8. g16 |
      e8 g a4 |
      a8 g d'4 |
      e8 d c d |
      c2 ( |
      c4 r
    }
    {
      c,8. e16 |
      c8 e f4 |
      f8 e g4 |
      c8 b g f |
      e2 ( |
      e4) r
    }
  >>
  \bar "|."
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c'' {
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \partial 4 c8 g |
  g2 |
  g8 g e d (\grace e8) |
  d2 |
  r8 e c e |
  f4 d8 f |
  g2 ( |
  g8) r g g |
  b2 |
  c8 c c c |
  d2 |
  r4 d8 b |
  g4. b8 |
  d4 g, |
  c2 ( |
  c4) r \bar "||"
}

nhacPhienKhucHai = \relative c'' {
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  r4 g8 a |
  g4. f8 |
  d4 e |
  f2 |
  r8 f e e |
  d4 b'8 a |
  g2 |
  r4 e8 g |
  a4. g8 |
  f4 g |
  d2 |
  r8 d b d |
  g,4. c8 |
  e4 d (\grace c8) |
  c2 ( |
  c4) r4 \bar "||"
}

nhacPhienKhucBa = \relative c' {
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \partial 4 e8 g |
  a4. g8 |
  a4 c |
  e,2 |
  r4 g8 e |
  g a g b |
  d4 d8 b |
  c2 ( |
  c4) r \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  \override Lyrics.LyricText.font-series = #'bold
  Ta vui mừng trảy lên Đền Thánh Chúa,
  Ta mừng vui tiến lên Đền Thánh Người.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Vui chừng nào khi thiên hạ bảo tôi:
  Ta cùng trẩy lên Đền Thánh Chúa.
  Và giờ đây Giê -- ru -- sa -- lem hỡi
  Cửa nội thành, ta đã dừng chân.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Từng chi tộc, chi tộc của Chúa.
  Trảy hội lên đền, ở nơi đây.
  Để danh Chúa họ cùng xưng tụng.
  Như lệnh đã truyền cho Is -- ra -- el.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Cũng nơi đó, đặt ngai xét xử.
  Ngai vàng của vương triều Đa -- vít, Tổ phụ xưa.
}


% Dàn trang
\score {
  \new ChoirStaff <<
    \new Staff = chorus <<
      \new Voice = "sopranos" {
        \global \nhacDiepKhuc
      }
    >>
    \new Lyrics \lyricsto sopranos \loiDiepKhuc
  >>
}

\score {
  \new ChoirStaff <<
    \new Staff = verses <<
      \override Staff.TimeSignature.transparent = ##t
      \new Voice = "verse" {
        \global \stemNeutral \nhacPhienKhucMot
      }
    >>
    \new Lyrics \lyricsto verse \loiPhienKhucMot
  >>
}

\score {
  \new ChoirStaff <<
    \new Staff = verses <<
      \override Staff.TimeSignature.transparent = ##t
      \new Voice = "verse" {
        \global \stemNeutral \nhacPhienKhucHai
      }
    >>
    \new Lyrics \lyricsto verse \loiPhienKhucHai
  >>
}

\score {
  \new ChoirStaff <<
    \new Staff = verses <<
      \override Staff.TimeSignature.transparent = ##t
      \new Voice = "verse" {
        \global \stemNeutral \nhacPhienKhucBa
      }
    >>
    \new Lyrics \lyricsto verse \loiPhienKhucBa
  >>
}
