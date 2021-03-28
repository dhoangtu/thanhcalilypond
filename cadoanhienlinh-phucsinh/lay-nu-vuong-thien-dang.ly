% Cài đặt chung
\version "2.20.0"
\include "english.ly"

\header {
  title = "Lạy Nữ Vương Thiên Đàng"
  subtitle = "(Kinh Regina Coeli)"
  composer = "Nhạc: Labat"
  arranger = "Lời Việt: Khổng Vĩnh Thành"
  tagline = ##f
}

global = {
  \key g \major
  \time 4/4
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
nhacSoloMot = \relative c' {
  \tempo "Allegretto moderato" 4 = 96
  \override Lyrics.LyricSpace.minimum-distance = #2.5
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \partial 4. d8 g b |
  d2 cs8 (d) e d |
  b4 g r8 g a b |
  c4 \breathe e2 -> d8 c |
  b2 r8 d c b |
  a4. \breathe b8 d (c) a (b) |
  g2 (fs8) \fermata \bar "||"
}

nhacDiepKhucSop = \relative c' {
  \override Lyrics.LyricSpace.minimum-distance = #2.5
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \partial 4. d8 g b |
  d2 ^\ff cs8 (d) e d |
  b4 g r8 g a b |
  c4 \breathe e2 -> d8 c |
  b2 r8 d b g |
  e'4 \breathe e -^ d fs, |
  g8 d' e d d2 ( |
  d8) \breathe d e d d2 ( |
  d4) \breathe e8. e16 d4 (c) |
  g8 d' e d d2 ( |
  d8) \breathe d e d d2 ( |
  d4) \breathe e8. e16 d4 (c) |
  b4 \breathe e8. e16 d4 (fs,) |
  g2 r4 \bar "|."
}

nhacDiepKhucBass = \relative c' {
  \override Lyrics.LyricSpace.minimum-distance = #2.5
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \partial 4. d8 g b |
  b2 ^\ff as8 (b) c! b |
  g4 g r8 g8 fs g |
  a4 \breathe c2 -> b8 a |
  g2 r8 g g g |
  c4 \breathe c -^ b fs |
  g4 r4 r8 a a c |
  b4 r r8 a a c |
  b4 \breathe c8. c16 b4 (a) |
  g4 r4 r8 a a c |
  b4 r4 r8 a a c |
  b4 \breathe c8. c16 b4 (a) |
  g \breathe c8. c16 b4 (fs) |
  g2 r4 \bar "|."
}

% Nhạc phiên khúc một
nhacSoloHai = \relative c' {
  \override Lyrics.LyricSpace.minimum-distance = #2.5
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \partial 4 d4 |
  g b a8 c b a |
  a8. (g16) g4 r b8. b16 |
  a2 a8 (b) cs (d) |
  e4. (d8) cs \breathe a b cs |
  d4 \breathe b a cs |
  d2 r8 \bar "||"
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"Solo 1:"
  Al -- le -- lu -- ia! Lạy Nữ Vương thiên đàng, Mẹ ơi, vui lên!
  Al -- le -- lu -- ia, Al -- le -- lu -- ia, Al -- le -- lu -- ia!
}

% Lời điệp khúc
loiDiepKhucSop = \lyricmode {
  \set stanza = #"Chorus:"
  Al -- le -- lu -- ia! Lạy Nữ Vương thiên đàng, Mẹ ơi, vui lên!
  Al -- le -- lu -- ia, Al -- le -- lu -- ia, Al -- le -- lu -- ia,
  Al -- le -- lu -- ia, Al -- le -- lu -- ia, Al -- le -- lu -- ia,
  Al -- le -- lu -- ia, Al -- le -- lu -- ia, Al -- le -- lu -- ia,
  Al -- le -- lu -- ia.
}

loiDiepKhucBass = \lyricmode {
  Al -- le -- lu -- ia! Lạy Nữ Vương thiên đàng, Mẹ ơi, vui lên!
  Al -- le -- lu -- ia, Al -- le -- lu -- ia, Al -- le -- lu -- ia,
  Al -- le -- lu -- ia, Al -- le -- lu -- ia, Al -- le -- lu -- ia,
  Al -- le -- lu -- ia, Al -- le -- lu -- ia, Al -- le -- lu -- ia,
  Al -- le -- lu -- ia.
}

% Lời phiên khúc hai
loiPhienKhucHai = \lyricmode {
  \set stanza = #"Solo 2:"
  Vì nay Đấng Mẹ đã cưu mang trong lòng đã sống lại.
  Al -- le -- lu -- ia, Al -- le -- lu -- ia, Al -- le -- lu -- ia.
}

% Dàn trang
\score {
  \new ChoirStaff <<
    \new Staff = soloMot <<
      \new Voice = "sopranos" {
        \global \stemNeutral \nhacSoloMot
      }
    >>
    \new Lyrics \lyricsto sopranos \loiPhienKhucMot
  >>
}

\score {
  \new ChoirStaff <<
    \new Staff <<
      \override Staff.TimeSignature.transparent = ##t
      \new Voice = "Soprano" { \clef treble \global \nhacDiepKhucSop }
      \new Lyrics \lyricsto Soprano \loiDiepKhucSop
    >>
    \new Staff <<
      \override Staff.TimeSignature.transparent = ##t
      \new Voice = "Bass" { \clef treble \global \nhacDiepKhucBass }
      \new Lyrics \lyricsto Bass \loiDiepKhucBass
    >>
  >>
}

\score {
  \new ChoirStaff <<
    \new Staff = soloHai <<
      \override Staff.TimeSignature.transparent = ##t
      \new Voice = "sopranos" {
        \global \stemNeutral \nhacSoloHai
      }
    >>
    \new Lyrics \lyricsto sopranos \loiPhienKhucHai
  >>
}
