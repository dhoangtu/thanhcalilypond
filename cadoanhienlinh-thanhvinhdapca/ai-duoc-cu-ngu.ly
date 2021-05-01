% Cài đặt chung
\version "2.20.0"
\include "english.ly"

\header {
  title = "Ai Được Cư Ngụ"
  composer = "TV. 14"
  arranger = " "
  tagline = ##f
}

global = {
  \key f \major
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
nhacDiepKhuc= \relative c' {
  \override Lyrics.LyricSpace.minimum-distance = #4.0
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \partial 4 d4 |
  a'4. a8 |
  g a f8. (e16 |
  d8) g a a |
  a4. bf8 |
  a bf g8. (f16 |
  e8) c' d d |
  d2 ( |
  d4) r \bar "|."
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c' {
  \set Score.barAlways = ##t
  \set Score.defaultBarType = ""
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  d8 a' a f d4 \breathe
  g8 e c d a4 \breathe
  d8 a' g a f4 \breathe
  a8 c a d d4 (d) \bar "||"
}

nhacPhienKhucHai = \relative c'' {
  \set Score.barAlways = ##t
  \set Score.defaultBarType = ""
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  c8 e a, g f4 \breathe
  a8 e g a d,4 \breathe
  f8 e d g a4 \breathe
  g8 a c d (c) a4 (a) \bar "||"
}

nhacPhienKhucBa = \relative c'' {
  \set Score.barAlways = ##t
  \set Score.defaultBarType = ""
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  d8 d bf g d'4 \breathe
  g,8 bf g d' a4 \breathe
  f8 f a d, g4 \breathe
  g8 bf g bf c4 \breathe
  a8 e f g a f e d4 (d) \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  \override Lyrics.LyricText.font-series = #'bold
  Lạy Chúa, ai được cư ngụ trên núi thánh Chúa,
  ai được cư ngụ trên núi thánh Chúa.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Là kẻ sống vẹn toàn luôn làm điều ngay thẳng.
  Bụng nghĩ sao nói vậy.
  Miệng lưỡi chẳng điêu ngoa.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Không tác hại cho người.
  Chẳng làm ai sỉ nhục.
  Coi khinh phường gian ác.
  Trọng ai kính Chúa Trời.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Cho vay không đặt lãi.
  Chẳng ham quà hối lộ mà hại đến người ngay.
  Phàm ai làm điều ấy không hề nao núng chuyển lay bao giờ.
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
        \key f \major \stemNeutral \nhacPhienKhucMot
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
        \key f \major \stemNeutral \nhacPhienKhucHai
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
        \key f \major \stemNeutral \nhacPhienKhucBa
      }
    >>
    \new Lyrics \lyricsto verse \loiPhienKhucBa
  >>
}