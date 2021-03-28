% Cài đặt chung
\version "2.20.0"
\include "english.ly"

\header {
  title = "Xin Tái Tạo Lòng Con"
  composer = "TV. 50"
  arranger = " "
  tagline = ##f
}

global = {
  \key bf \major
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

inNghieng = { \override LyricText.font-shape = #'italic }

% Nhạc điệp khúc
nhacDiepKhuc = \relative c' {
  \override Lyrics.LyricSpace.minimum-distance = #1.7
  \partial 4 d4 |
  g2 |
  f8 g ef c |
  d2 |
  <<
  {
    a'8 bf f d |
    bf'4 a8 a |
    g2
  }
  {
    f8 g d bf |
    g'4 f8 f |
    d2
  }
  >>
  \bar "||"
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c'' {
  \override Lyrics.LyricSpace.minimum-distance = #2.0
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \partial 4 g4 |
  d' d8 d |
  d4 d8 bf |
  bf c g4 ( |
  g) \tuplet 3/2 { g8 f g } |
  d4 \tuplet 3/2 { bf'8 bf g } |
  a4 \breathe \tuplet 3/2 { bf8 a bf } |
  g4 \tuplet 3/2 { ef'8 \fermata ef \fermata c \fermata } |
  d2 ( |
  d8) r c bf |
  c a bf a |
  g4 g8 f |
  g ef g16 (bf) g (f) |
  d4. c8 |
  ef8 g d4 |
  c'4. a16 ef' |
  d2 ( |
  d4) r \bar "||"
}

nhacPhienKhucHai = \relative c'' {
  \override Lyrics.LyricSpace.minimum-distance = #2.0
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \partial 4 g4 |
  d'4 d16 ef c c |
  d4 c8 bf |
  g2 |
  r8 f \tuplet 3/2 { bf8 g f } |
  g f bf a |
  a2 ( |
  a8) r \tuplet 3/2 { a8 c a } |
  c c ef ef |
  d4 \fermata \breathe g,16 bf a g |
  a4 \fermata \breathe a8 f |
  d4. f16 (g) |
  g2 ( |
  g4) r \bar "||"
}

nhacPhienKhucBa = \relative c'' {
  \override Lyrics.LyricSpace.minimum-distance = #2.0
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \partial 4 c8. c16 |
  c8 c bf g |
  bf4 \fermata a8. a16 |
  a8 a f d |
  g2 |
  f8 f bf d |
  c2 |
  r4 a8 bf |
  g bf ef c |
  d2 |
  c8 c c d ( |
  d) r g,16 (a) bf (a) |
  g2 ( |
  g4) r \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  \override Lyrics.LyricText.font-series = #'bold
  Lạy Chúa, xin tái tạo lòng con
  xin tái tạo lòng con nên trong sạch.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Lạy Chúa, xin thương con bởi lòng Ngài nhân hậu.
  Lấy lượng hải hà xóa bỏ tội con,
  lấy lượng hải hà xóa bỏ tội con.
  Xin rửa con sạch hết lỗi lầm,
  xin rửa con sạch hết lỗi lầm,
  tội con đã phạm xin Ngài thứ tha.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  \override Lyrics.LyricText.font-shape = #'italic
  Lạy Chúa xin tái tạo lòng con nên trong sạch.
  Đổi mới tinh thần cho bền vững trung kiên.
  Đừng nỡ đuổi con xa cách Thánh Nhan,
  đừng cất khỏi lòng con Thánh Thần Ngài trao ban.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Nhưng cho con thấy lại niềm vui,
  nhưng cho con thấy lại niềm vui
  được Ngài thương thứ tha.
  Lạy Chúa Trời xin mở miệng con,
  cho con vang tiếng ngợi khen Ngài.
}


% Dàn trang
\score {
  \new ChoirStaff <<
    \new Staff = chorus <<
      \new Voice = "sopranos" {
        \voiceOne \global \stemUp \nhacDiepKhuc
      }
    >>
    \new Lyrics = basses
    \context Lyrics = basses 
      %\with \override LyricText.font-shape = #'bold
      \lyricsto sopranos \loiDiepKhuc
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
