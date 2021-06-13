% Cài đặt chung
\version "2.20.0"
\include "english.ly"

\header {
  title = \markup { \fontsize #3 "Hy Vọng Nơi Ngài" }
  poet = "Tv. 32"
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

% Nhạc điệp khúc
nhacDiepKhucSop = \relative c' {
  \stemUp
  \partial 4 e4 |
  c'2 |
  b8 c b c |
  a4 gs8 a |
  e2 |
  g8. a16 g8 f |
  e f d4 |
  \stemDown
  e8. f16 e8 d |
  b4 d8 ^(e) 
  a,2 \bar "|."
}

nhacDiepKhucBas = \relative c' {
  \stemDown
  \partial 4 e4 |
  a2 |
  g8 a g a |
  f4 e8 f |
  c2 |
  e8. f16 e8 d |
  c d b4 |
  \stemUp
  g'8. a16 g8 f |
  e4 gs |
  a2
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c' {
  \partial 4 a8 a |
  e'4. e8 c d b4 |
  d8 g d4 g8 g d e ( |
  e) a e a a a e c' |
  b2 r4 d8 d |
  a4
  \autoBeamOff
  a8 f' \fermata
  \autoBeamOn
  d4 d |
  e2 (e4) r \bar "||"
}

nhacPhienKhucHai = \relative c' {
  \partial 4 a8 e' |
  e4. c8 c d b4 |
  g'8 d e4 e8 c' b b ( |
  b) r c a c b b a |
  c4 d8 b d4 \fermata c \fermata |
  e \fermata \breathe b8 c d b c b |
  a2 (a4) r \bar "||"
}

nhacPhienKhucBa = \relative c' {
  \partial 4. e8 a, e' |
  d4. d8 e d g4 |
  a8 e a4 b8 d4 c16 (b) |
  a2. e4 |
  c'2 b8 c b c |
  a4 gs8 a e2 |
  d8 e d c b4 d8 (e) |
  a,2 (a4) r \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  Lạy Chúa, xin đổ trên chúng con nguồn ân huệ,
  như chúng con hy vọng nơi Ngài,
  như chúng con hy vọng nơi Ngài.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Vì lời Chúa quả là chân thật,
  việc Chúa làm rất đang cậy tin
  chính trực công minh Chúa hằng mến chuộng,
  trái đất này Ngài trải rộng tình thương.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Còn những kẻ một niềm kính sợ,
  vẫn cậy trông lòng Chúa yêu thương
  Chúa để mắt trông nom gìn giữ,
  cứu khỏi tay thần chết,
  và nuôi sống trong buổi cơ hàn.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Riêng phần chúng con cậy trông vào Chúa,
  bởi Ngài luôn nâng đỡ hộ phù.
  Lạy Chúa xin đổ trên chúng con nguồn ân huệ,
  như chúng con hy vọng nơi Ngài.
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
        \override NoteHead.font-size = #-2
        \voiceTwo \key c \major \time 2/4 \nhacDiepKhucBas
      }
    >>
    \new Lyrics \lyricsto beSop \loiDiepKhuc
  >>
  \layout {
    \override Lyrics.LyricText.font-series = #'bold
    \override Lyrics.LyricText.font-size = #+3
    \override Lyrics.LyricSpace.minimum-distance = #0.8
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
  }
}

\score {
  \new ChoirStaff <<
    \new Staff = phienKhuc \with {
        \magnifyStaff #(magstep +1)
      }
      <<
      \new Voice = beSop {
        \key c \major \time 4/4 \nhacPhienKhucMot
      }
    >>
    \new Lyrics \lyricsto beSop \loiPhienKhucMot
  >>
  \layout {
    \override Lyrics.LyricText.font-size = #+3
    \override Lyrics.LyricSpace.minimum-distance = #2.0
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
  }
}

\score {
  \new ChoirStaff <<
    \new Staff = phienKhuc \with {
        \magnifyStaff #(magstep +1)
      }
      <<
      \new Voice = beSop {
        \key c \major \time 4/4 \nhacPhienKhucHai
      }
    >>
    \new Lyrics \lyricsto beSop \loiPhienKhucHai
  >>
  \layout {
    \override Lyrics.LyricText.font-size = #+3
    \override Lyrics.LyricSpace.minimum-distance = #2.0
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
  }
}

\score {
  \new ChoirStaff <<
    \new Staff = phienKhuc \with {
        \magnifyStaff #(magstep +1)
      }
      <<
      \new Voice = beSop {
        \key c \major \time 4/4 \nhacPhienKhucBa
      }
    >>
    \new Lyrics \lyricsto beSop \loiPhienKhucBa
  >>
  \layout {
    \override Lyrics.LyricText.font-size = #+3
    \override Lyrics.LyricSpace.minimum-distance = #2.0
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
  }
}
