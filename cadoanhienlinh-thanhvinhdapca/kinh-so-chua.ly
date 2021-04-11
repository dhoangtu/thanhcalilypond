% Cài đặt chung
\version "2.20.0"
\include "english.ly"

\header {
  title = "Kính Sợ Chúa"
  composer = "TV. 127"
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
  \autoBeamOff
  \partial 8 c8 |
  g4. f8 |
  d4 e8 e |
  c4 _(d) |
  g2 |
  r8 a8 b a |
  g4 a8 g |
  d'4 d8 (e) |
  c2 \bar "|."
}

nhacDiepKhucBass= \relative c' {
  \override Lyrics.LyricSpace.minimum-distance = #4.0
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \override NoteHead.font-size = #-2
  \autoBeamOff
  \skip 8
  \skip 2
  \skip 2
  \skip 2
  \skip 2
  r8 f g f |
  e4 f8 e |
  g4 g8 (f) |
  e2
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c'' {
  \set Score.barAlways = ##t
  \set Score.defaultBarType = ""
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  a8 c c a a c a c4 \breathe
  c8 d d c e c g4 \breathe
  gf8 gf gf f f4 f8 c f \acciaccatura c8 g'4
  e8 e e d b' b d, \fermata g4 (g) \bar "||"
}

nhacPhienKhucHai = \relative c'' {
  \set Score.barAlways = ##t
  \set Score.defaultBarType = ""
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  a8 c a c a c g4 \breathe
  c8 e, f g c, d e4
  d8 d fs \fermata a b a g4
  g8 e e c' c d \acciaccatura c8 e4 (e) \bar "||"
}

nhacPhienKhucBa = \relative c'' {
  \set Score.barAlways = ##t
  \set Score.defaultBarType = ""
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  c8 c a c a4 c8 e, f g a a e d4 \breathe
  d8 g b, c d4
  b'8 a a d, fs g4 \breathe
  e8 g a e e4
  e8 e c' b16 b b b8 \breathe
  e d16 d d d4 g, c (c) \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  \override Lyrics.LyricText.font-series = #'bold
  Phúc thay những người biết kính sợ Chúa.
  Ăn ở theo đường, theo đường lối của Người.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Hạnh phúc thay bạn nào kính sợ Chúa,
  ăn ở theo đường lối của Người.
  Công khó tay bạn làm bạn được an hưởng.
  Đời bạn quả là lắm phúc nhiều may.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Hiền thê bạn trong cửa trong nhà,
  khác nào cây nho đầy hoa trái.
  Và bầy con xúm xít lại bàn
  như những chồi ô -- liu mơn mởn.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Đó chính là phúc lộc Chúa dành cho kẻ biết kính sợ Người.
  Xin Chúa từ Si -- on xuống cho muôn vàn ơn phước.
  Để trong suốt cuộc đời bạn được thấy Giê -- ru -- sa -- lem
  thấy Giê -- ru -- sa -- lem phồn vinh.
}


% Dàn trang
\score {
  \new ChoirStaff <<
    \new Staff = chorus \with {
        \consists "Merge_rests_engraver"
      }
      <<
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
