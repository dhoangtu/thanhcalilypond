% Cài đặt chung
\version "2.20.0"
\include "english.ly"

\header {
  title = \markup { \fontsize #3 "Chúa Lên Trời" }
  composer = "TV. 46"
  arranger = " "
  tagline = ##f
}

\paper {
  #(set-paper-size "a4")
  top-margin = 15\mm
  bottom-margin = 15\mm
  left-margin = 20\mm
  right-margin = 20\mm
  indent = #0
  #(define fonts
    (make-pango-font-tree
      "Liberation Serif"
      "Liberation Serif"
      "Liberation Serif"
      (/ 20 20)))
  page-count = #1
}

% Nhạc điệp khúc
nhacDiepKhucSop = \relative c'' {
  \partial 4 g8 e |
  c4. g'8 |
  a e g4 ( |
  g8) e c d |
  e2 |
  r4 f8 e |
  d4. d8 |
  a' a g4 ( |
  g8) e a g |
  c4 \tuplet 3/2 { c8 c a } |
  c2 ( |
  c4) r \bar "|."
}

nhacDiepKhucBas = \relative c' {
  \override NoteHead.font-size = #-2
  \skip 4
  \skip 4. e8 |
  f c e4 ( |
  e8) c a g |
  c2 |
  r4 d8 c |
  b4. b8 |
  f' f d4 ( |
  d8) c f e |
  a4 \tuplet 3/2 { g8 g f } |
  e2 ( |
  e4) r
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c'' {
  \partial 4. c8 b a |
  g4 \breathe d8 d |
  e2 |
  c8. d16 e4 
  d8 fs a d, |
  g2 |
  r4 e8 g |
  a a g a |
  b4. d,8 |
  g a g f |
  d4 d |
  c2 ( |
  c4) r \bar "||"
}

nhacPhienKhucHai = \relative c' {
  \partial 4 e8 c |
  d4 \breathe c8. e16 |
  e8 d g4 |
  a8 r \tuplet 3/2 { f8 a a } |
  f4 \breathe f8 a |
  c d c a |
  g2 ( |
  g4) r \bar "||"
}

nhacPhienKhucBa = \relative c'' {
  \partial 4 c8 g |
  e a g e |
  \acciaccatura e8 (c'2) |
  c8 e, f g |
  e4. d8 |
  d2 |
  c4 d8 c |
  a4 d |
  d4. c8 |
  \acciaccatura a8 c2 ( |
  c4) r \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  Chúa lên trời giữa tiếng hò reo, vang trời dậy đất.
  Chúa lên trời kèn sáo trổi cao, mừng Chúa hiển vinh
  Hal -- lê -- lu -- ia.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Vỗ tay đi nào, muôn dân hỡi.
  Mừng Thiên Chúa nào cất tiếng hò reo.
  Vì Thiên Chúa tối cao khả úy,
  là Vua Chí Tôn thống trị địa cầu.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Hãy đàn ca, đàn ca lên mừng Thiên Chúa.
  Đàn ca lên nào, đàn ca nữa kính Vua chúng ta.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Hãy dâng Người khúc ca tuyệt mỹ.
  Chúa là Vua thống trị muôn dân.
  Ngự trên ngai tòa uy linh cao cả.
}


% Dàn trang
\score {
  \new ChoirStaff <<
    \new Staff = diepKhuc \with {
        \consists "Merge_rests_engraver"
        \magnifyStaff #(magstep +1)
      }
      <<
      \new Voice = beSop {
        \voiceOne \key c \major \time 2/4 \nhacDiepKhucSop
      }
      \new Voice = beBas {
        \voiceTwo \key c \major \time 2/4 \nhacDiepKhucBas
      }
    >>
    \new Lyrics \lyricsto beSop \loiDiepKhuc
  >>
  \layout {
    \override Lyrics.LyricText.font-series = #'bold
    \override Lyrics.LyricText.font-size = #+3
    \override Lyrics.LyricSpace.minimum-distance = #1.5
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
  }
}

\score {
  \new ChoirStaff <<
    \new Staff = phienKhuc \with {
        \magnifyStaff #(magstep +1)
      }
      <<
      \new Voice = beSop {
        \key c \major \time 2/4 \nhacPhienKhucMot
      }
    >>
    \new Lyrics \lyricsto beSop \loiPhienKhucMot
  >>
  \layout {
    \override Staff.TimeSignature.transparent = ##t
    \override Lyrics.LyricText.font-size = #+3
    \override Lyrics.LyricSpace.minimum-distance = #1.5
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
  }
}

\score {
  \new ChoirStaff <<
    \new Staff = phienKhuc \with {
        \magnifyStaff #(magstep +1)
      }
      <<
      \new Voice = beSop {
        \key c \major \time 2/4 \nhacPhienKhucHai
      }
    >>
    \new Lyrics \lyricsto beSop \loiPhienKhucHai
  >>
  \layout {
    \override Staff.TimeSignature.transparent = ##t
    \override Lyrics.LyricText.font-size = #+3
    \override Lyrics.LyricSpace.minimum-distance = #1.5
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
  }
}

\score {
  \new ChoirStaff <<
    \new Staff = phienKhuc \with {
        \magnifyStaff #(magstep +1)
      }
      <<
      \new Voice = beSop {
        \key c \major \time 2/4 \nhacPhienKhucBa
      }
    >>
    \new Lyrics \lyricsto beSop \loiPhienKhucBa
  >>
  \layout {
    \override Staff.TimeSignature.transparent = ##t
    \override Lyrics.LyricText.font-size = #+3
    \override Lyrics.LyricSpace.minimum-distance = #1.5
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
  }
}