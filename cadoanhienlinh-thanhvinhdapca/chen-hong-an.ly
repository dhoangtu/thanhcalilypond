% Cài đặt chung
\version "2.20.0"
\include "english.ly"

\header {
  title = "Chén Hồng Ân"
  composer = "TV. 115"
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
  \override Lyrics.LyricSpace.minimum-distance = #1.7
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \partial 4 g8 g |
  a e g a |
  c,4 c8 d |
  c4 d |
  g2 |
  r4 a8 a |
  b a b d |
  g,4 b8 d |
  c4 d |
  c2 ( |
  c4) r \bar "|."
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c'' {
  \override Lyrics.LyricSpace.minimum-distance = #2.0
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \partial 4 g8 f |
  d a' b a |
  g4 d8 f |
  e d e c |
  d4 r |
  r g8 g |
  a g a c |
  g4 a8 c |
  a4 c |
  d2 ( |
  d4) r \bar "||"
}

nhacPhienKhucHai = \relative c'' {
  \override Lyrics.LyricSpace.minimum-distance = #2.0
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \partial 4 c8 c |
  g f d f |
  g2 |
  r8 b b d, |
  f g d16 (e) d8 |
  c2 |
  r4 g'8 e |
  c'2 |
  c8 a a c |
  d4 b8 a |
  g2 |
  f8 d d c |
  c2 ( |
  c4) r \bar "||"
}

nhacPhienKhucBa = \relative c'' {
  \override Lyrics.LyricSpace.minimum-distance = #2.0
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \partial 4 g8 a |
  g c c e, |
  g4 f8 a |
  g4 b |
  c2 |
  a8 c e, f |
  g2 |
  b4 b8 d |
  g,4 g8 d |
  e4 d |
  c2 ( |
  c4) r \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  \override Lyrics.LyricText.font-series = #'bold
  Tôi nâng Chén Hồng Ân cứu độ mà xưng tụng danh Chúa.
  Tôi nâng Chén Hồng Ân  cứu độ mà xưng tụng danh Người.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Lấy chi đền đáp Chúa bây giờ,
  vì những ơn chan chưa Người ban.
  Tôi nâng Chén Hồng Ân cứu độ, mà xưng tụng Danh Chúa.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Trước Thánh Nhan thật là quý giá,
  cái chết của ai hiếu nghĩa với Người.
  Vâng lạy Chúa, thân này là tôi tớ:
  tôi tớ Ngài, con của nữ tỳ Ngài.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"2."
  Con sẽ dâng hiến lễ Tạ ơn, mà xưng tụng Danh Chúa.
  Lời khấn nguyện với Chúa,
  tôi xin giữ trọn trước toàn thể dân Người.
}


% Dàn trang
\score {
  \new ChoirStaff <<
    \new Staff = chorus <<
      \new Voice = "sopranos" {
        \global \stemNeutral \nhacDiepKhuc
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
