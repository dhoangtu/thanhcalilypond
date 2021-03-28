% Cài đặt chung
\version "2.20.0"
\include "english.ly"

\header {
  title = "Rảy Nước Thánh"
  composer = " "
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

inNghieng = { \override LyricText.font-shape = #'italic }

% Nhạc điệp khúc
nhacDiepKhucSop = \relative c' {
  \override Lyrics.LyricSpace.minimum-distance = #3.0
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  e4. g8 |
  g4 e8 _(g) |
  a2 |
  g8 c a f |
  f _(d) e4 |
  e4. e8 |
  e _(d) c _(d) |
  g2 |
  g8 c a c |
  g4 e8 g |
  a4 \tuplet 3/2 { g8 _(a g) } |
  e4 c8 c |
  f4 g |
  e2 |
  g8 c d c |
  a4. c8 |
  c _(b) c4 |
  d r8 d |
  d _(c) b4 |
  c2 \bar "|."
}

nhacDiepKhucBass = \relative c' {
  c4. e8 |
  e4 c8 ^(e) |
  f2 |
  e8 g f d |
  d ^(b) c4 |
  c4. c8 |
  c4 a |
  b2 |
  c8 e f e |
  d4 c8 e |
  f4 e |
  c c8 c |
  a4 b |
  c2 |
  c8 e g g |
  f4. e8 |
  d4 e |
  f r8 g |
  g4 <g f> |
  <e c>2
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  Tôi đã thấy dòng nước từ cửa đông đền thờ tuôn ra,
  Hal -- le -- lu -- ia.
  Và tất cả những người được nước ấy thanh tẩy
  đều được ơn cứu độ
  và cất tiếng reo mừng:
  Hal -- le -- lu -- ia, Hal -- le -- lu -- ia.
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
