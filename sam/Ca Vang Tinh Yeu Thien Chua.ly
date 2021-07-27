% Cài đặt chung
\version "2.22.1"
\include "english.ly"

\header {
  title = \markup { \fontsize #2 "Ca Vang Tình Yêu Thiên Chúa" }
  composer = " "
  tagline = "Lilypond 2.22"
}

\paper {
  #(set-paper-size "a4")
  top-margin = 20\mm
  bottom-margin = 20\mm
  left-margin = 20\mm
  right-margin = 20\mm
  indent = 0
}

% Nhạc điệp khúc
nhacDiepKhuc = \relative c' {
  \partial 4. a8 d e |
  f4. g16 f |
  e8 _> d c _> a |
  d2 ~ |
  d8 d g a |
  bf4. a16 g | \break
  f8 d f g |
  a2 ~ |
  a8 a d c |
  bf4 bf ~ |
  bf8 g c bf | \break
  a4 a ~ |
  a8 d, bf' _> a |
  g4. g16 bf |
  a8 _> e g _> f |
  d2 ~ \bar "||" \break
  d8 a8 d e |
  f4.
}

gamDiepKhuc = \chords {
  \skip4. d2:m c4 a:m d2:m bf
  g:m bf f f:7 bf g:m
  f d4:m d:7 g2:m f4 a:7
  d2:m
}


% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  Intro
  _ _ _ _ _ _ _ _ _ _
  _ _ _ _ _ _ _ _ _ _
  _ _ _ _ _ _ _ _ _ _
  _ _ _ _ _ _ _ _ _ _
  _ _
  Tình yêu Thiên Chúa...
}

% Dàn trang
\score {
  \new ChoirStaff <<
    \gamDiepKhuc
    \new Staff <<
      \new Voice = beSop {
        \key f \major \time 2/4 \nhacDiepKhuc
      }
    >>
    \new Lyrics \lyricsto beSop \loiDiepKhuc
  >>
  \layout {
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
  }
  \midi {
    \tempo 4 = 72
  }
}

