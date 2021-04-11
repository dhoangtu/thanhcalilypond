% Cài đặt chung
\version "2.20.0"
\include "english.ly"

\header {
  title = "Giêrusalem Hãy Tán Tụng Chúa"
  composer = "TV. 147"
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
nhacDiepKhucSop= \relative c'' {
  \override Lyrics.LyricSpace.minimum-distance = #4.0
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \partial 4. g8 g g |
  g4 r8 e |
  c4 a' |
  g2 | \break
  r8 a a a |
  a a4 f8 |
  a4 d |
  c2 ^( |
  c4) r \bar "|."
}

nhacDiepKhucBass= \relative c' {
  \override Lyrics.LyricSpace.minimum-distance = #4.0
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \override NoteHead.font-size = #-2
  \skip 4.
  \skip 2
  \skip 2
  \skip 2
  r8 f f f |
  f f4 d8 |
  f4 g |
  e2 ( |
  e4) r
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c'' {
  \set Score.barAlways = ##t
  \set Score.defaultBarType = ""
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  a8 g b a a16 a a a c4 \breathe
  a8 g a e d a' f e4 \breathe
  a8 a c \breathe
  c c c d4 \breathe
  c8 e d a4 b8 g d' e c4 \bar "||"
}

nhacPhienKhucHai = \relative c'' {
  \set Score.barAlways = ##t
  \set Score.defaultBarType = ""
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  a8 a a e c' b a e4 \breathe
  f8 f f d a' e c \acciaccatura c8 e4 \breathe
  a8 a a e e' c a a4 \breathe
  d8 d d g, d' b g c4 \bar "||"
}

nhacPhienKhucBa = \relative c'' {
  \set Score.barAlways = ##t
  \set Score.defaultBarType = ""
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  a8 e a e d e a, d e4 \breathe
  a8 f d d a' c b b4 \breathe
  b8 b a c b b a g4 f8 g a c a d e c4 \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  \override Lyrics.LyricText.font-series = #'bold
  Giê -- ru -- sa -- lem tán tụng Chúa đi.
  Giê -- ru -- sa -- lem hãy ngợi khen Chúa đi.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Tán tụng Chúa đi Giê -- ru -- sa -- lem hỡi.
  Ca ngợi Chúa Trời nào hỡi Si -- on.
  Cho ngươi vững, cho ngươi kiên vững.
  Con cái trong thành Chúa đều chúc phúc lành.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Nơi biên cương Người thiết lập hòa bình,
  cho ngươi no đầy lúa mì tuyệt hảo.
  Nơi biên cương Người thiết lập hòa bình,
  cho ngươi no đầy phúc lộc triền miên.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Chúa bày tỏ luật Ngài cho nhà Gia -- cóp.
  Chiếu chỉ luật điều cho Is -- ra -- el.
  Chưa dân nào Chúa thi ân như vậy,
  để cho ta thấy tình thương của Ngài.
}


% Dàn trang
\score {
  \new ChoirStaff <<
    \new Staff = chorus \with {
        \consists "Merge_rests_engraver"
      }
      <<
      \new Voice = "sopranos" {
        \global \stemUp \nhacDiepKhucSop
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
