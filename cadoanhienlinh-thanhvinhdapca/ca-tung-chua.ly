% Cài đặt chung
\version "2.20.0"
\include "english.ly"

\header {
  title = "Ca Tụng Chúa"
  composer = "TV. 66"
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
nhacDiepKhuc= \relative c'' {
  \override Lyrics.LyricSpace.minimum-distance = #4.0
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \partial 4 g4 |
  g r8 a |
  g4 e |
  c'2 |
  d4 a |
  c4 r8 c |
  e,4 g |
  g r8 g |
  f4 e |
  c2 \bar "|."
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c'' {
  \set Score.barAlways = ##t
  \set Score.defaultBarType = ""
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  g8 a c a g4 e8 g a e g a g4
  e8 g g e d16 ([e]) d4
  e8 e d c a4
  a8 b g g g a g d' d g f e4
  c8 c c c a4 g8 b d ([f]) e ([d]) c d c4 \bar "||"
}

nhacPhienKhucHai = \relative c'' {
  \set Score.barAlways = ##t
  \set Score.defaultBarType = ""
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  c8 a g g16 ([a]) g8 e g g4 \breathe
  e8 e g e d c d d4 \breathe
  a8 b b \afterGrace d8 (g) f e d c4 \bar "||"
}

nhacPhienKhucBa = \relative c'' {
  \set Score.barAlways = ##t
  \set Score.defaultBarType = ""
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  g8 g a16 ([c]) a8 g e4
  g8 e d8. e16 c8 d d \breathe
  e8 d c a4 d8 e g e d16 ([e]) c8 d e d4
  a8 c e a, g b d f4 e8 d c4 \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  \override Lyrics.LyricText.font-series = #'bold
  Chư dân, hãy ca tụng Chúa.
  Thân lạy Chúa,
  hết thảy chư dân, hãy ca tụng Ngài.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Xin Thiên Chúa xót thương
  và ban phúc lành cho chúng tôi.
  Xin chiếu giải trên chúng tôi ánh sáng tôn nhan Ngài,
  để trên địa cầu người ta nhìn biết đường lối của Ngài:
  Cho chư dân thiên hạ được biết rõ ơn Ngài cứu độ.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Các dân tộc hãy vui mừng hân hoan,
  vì Ngài công bình cai trị chư dân,
  và Ngài cai quản các nước địa cầu.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Chư dân hãy ca tụng Ngài,
  thân lạy Ngài, hết thảy chư dân hãy ca tụng Ngài.
  Xin Thiên Chúa ban phúc lành cho chúng tôi.
  Và cho khắp cùng bờ cõi trái đất kính sợ Ngài.
}


% Dàn trang
\score {
  \new ChoirStaff <<
    \new Staff = chorus \with {
        \consists "Merge_rests_engraver"
      }
      <<
      \new Voice = "sopranos" {
        \global \stemNeutral \nhacDiepKhuc
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
        \key c \major \stemNeutral \nhacPhienKhucMot
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
        \key c \major \stemNeutral \nhacPhienKhucHai
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
        \key c \major \stemNeutral \nhacPhienKhucBa
      }
    >>
    \new Lyrics \lyricsto verse \loiPhienKhucBa
  >>
}
