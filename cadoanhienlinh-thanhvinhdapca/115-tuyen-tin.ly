% Cài đặt chung
\version "2.20.0"
\include "english.ly"

\header {
  title = \markup { \fontsize #3 "Tuyên Tín" }
  poet = " "
  composer = "Lm. Trần Thanh Cao"
  arranger = " "
  tagline = ##f
}

\paper {
  #(set-paper-size "a4")
  top-margin = 10\mm
  bottom-margin = 10\mm
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

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c'' {
  g4 e8 d |
  c4 a' |
  g2 ( |
  g8) r r4 \bar "||"
}

% Nhạc điệp khúc
nhacDiepKhucSop= \relative c'' {
  \partial 4. g8 e d |
  c4 f |
  f8 d g4 |
  r8 a g g |
  g4 b |
  d8 c a4 |
  r a8 b |
  a2 |
  b4 c |
  d2 |
  <<
    {
      c4 c |
      c2 ^( |
      c4) r
    }
    {
      \tweak font-size #-2 e4
      \tweak font-size #-2 e |
      \tweak font-size #-2 e2 _( |
      \tweak font-size #-2 e4) r
    }
  >>
  \bar "||"
}

nhacDiepKhucBass= \relative c' {
  \skip 4.
  \skip 4 c4 |
  c8 b c4 |
  r8 f e e |
  e4 g |
  b8 g f4 |
  r f8 g |
  f2 |
  d4 e |
  f2 g4 g |
  c,2 ( |
  c4) r
}

% Lời điệp khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"XƯỚNG:"
  Đây là mầu nhiệm đức tin.
}

% Lời phiên khúc
loiDiepKhuc = \lyricmode {
  \set stanza = #"ĐÁP:"
  Chúng con loan truyền Chúa đã chịu chết.
  Chúng con tuyên xưng Chúa đã sống lại,
  cho tới khi Ngài lại đến trong vinh quang.
}


% Dàn trang
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
    \override Lyrics.LyricText.font-series = #'bold
    \override Lyrics.LyricText.font-size = #+3
    \override Lyrics.LyricSpace.minimum-distance = #8.0
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
  } 
}

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
        \override NoteHead.font-size = #-2
        \voiceTwo \key c \major \time 2/4 \nhacDiepKhucBass
      }
    >>
    \new Lyrics \lyricsto beSop \loiDiepKhuc
  >>
  \layout {
    \override Staff.TimeSignature.transparent = ##t
    \override Lyrics.LyricText.font-size = #+3
    \override Lyrics.LyricSpace.minimum-distance = #1.8
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
  }
}
