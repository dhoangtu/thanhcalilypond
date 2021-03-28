% Cài đặt chung
\version "2.20.0"
\include "english.ly"

\header {
  title = "Halleluia - Halleluia - Halleluia"
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

% Nhạc điệp khúc
nhacDiepKhuc = \relative c' {
  \override Lyrics.LyricSpace.minimum-distance = #3.0
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \partial 8 c8 |
  ef4 _(\tuplet 3/2 { f8 g ef } |
  ef4 f8 ef) |
  ef4 _(\tuplet 3/2 { f8 g ef }) |
  ef4 _(f8 ef |
  \tuplet 3/2 { af8 f g } f4 |
  ef4. \fermata) \bar "" \break
  
  d8 |
  f4 _(\tuplet 3/2 { g8 a f } |
  f4 g8 f) |
  f4 _(\tuplet 3/2 { g8 a f }) |
  f4 _(g8 f |
  \tuplet 3/2 { bf8 g a } g4 |
  f4. \fermata) \bar "" \break
  
  e8 |
  g4 _(\tuplet 3/2 { a8 b g } |
  g4 a8 g) |
  g4 _(\tuplet 3/2 { a8 b g }) |
  g4 _(a8 g \tuplet 3/2 { c8 a b } a4 |
  g4. \fermata ) \bar "" \break
  
  g8 |
  c4 e,8 f |
  g4 c, |
  c8 (e4.) |
  d8 d g a |
  f4 g |
  e2 _( |
  e4) c'8 g |
  d'2 |
  e8 c d c |
  g2 _( |
  g8) a a g |
  e4 c8 d |
  c4 r8 g' _( |
  c4) b8 a |
  g4. f8 _( |
  e d) c d |
  g4. g8 ( |
  \tuplet 3/2 { d'8 c d }) e8 (d |
  c4) b |
  c2 \bar "|."
}


% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  Hal -- le -- lu -- ia,
  Hal -- le -- lu -- ia,
  Hal -- le -- lu -- ia.
  Viên đá người thợ xây loại bỏ,
  lại trở nên đá tảng góc tường.
  Ấy là Chúa đã làm nên như vậy
  trước mắt chúng ta thật lạ lùng.
  Hal -- le -- lu -- ia,
  Hal -- le -- lu -- ia,
  Hal -- le -- lu -- ia.
}

% Dàn trang
\score {
  \new ChoirStaff <<
    \new Staff = chorus \with {
        \consists "Merge_rests_engraver"
      }
      <<
      \new Voice = "sopranos" {
        \voiceOne \global \stemNeutral \nhacDiepKhuc
      }
    >>
    \new Lyrics = basses
    \context Lyrics = basses \lyricsto sopranos \loiDiepKhuc
  >>
}
