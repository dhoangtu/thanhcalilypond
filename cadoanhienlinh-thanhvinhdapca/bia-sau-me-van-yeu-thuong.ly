% Cài đặt chung
\version "2.20.0"
\include "english.ly"

\header {
  title = "Mẹ Vẫn Yêu Thương"
  subtitle = "(trích)"
  poet = " "
  composer = "Nhạc và lời: Lm. Trần Thanh Cao"
  tagline = ##f
}

\paper {
  #(set-paper-size "a5")
  top-margin = 10\mm
  bottom-margin = 10\mm
  left-margin = 20\mm
  right-margin = 20\mm
  #(define fonts
    (make-pango-font-tree
      "Liberation Serif"
      "Liberation Serif"
      "Liberation Serif"
      (/ 20 20)))
  indent = #0
  system-system-spacing.basic-distance = #13
}

% Nhạc điệp khúc
nhacDiepKhucSop = \relative c'' {
  \partial 4 a8 b |
  cs4. d4 cs8 |
  cs4. cs8 a b |
  cs4. d4 cs8 |
  b2 b8 b |
  b2 b4 |
  fs2 a8 a |
  a4. gs8 fs gs |
  \acciaccatura cs,8 e2 a4 
  a2. ( |
  a2) \bar "|."
}

nhacDiepKhucBas = \relative c'' {
  \partial 4 cs8 d |
  e4. fs4 e8 |
  e4. e8 cs d |
  e4. fs4 e8 |
  d2 d8 d |
  d2 d4 |
  b2 cs8 cs |
  cs4. b8 a b |
  a2 cs4 |
  cs2. ( |
  cs2)
}


% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  \set stanza = "..."
  Dù thời gian có phôi pha nhưng tình Mẹ thương vẫn bao la,
  như mây bay trên ngàn,
  như thông reo bên dòng suối nhỏ yêu thương.
}

\score {
  \new ChoirStaff <<
    \new Staff = diepKhuc \with {
        \consists "Merge_rests_engraver"
        %\magnifyStaff #(magstep -1)
      }
      <<
      \new Voice = beSop {
        \voiceTwo \key a \major \time 3/4 \nhacDiepKhucSop
      }
      \new Voice = beBas {
        \override NoteHead.font-size = #-2
        \voiceOne \key a \major \time 3/4 \nhacDiepKhucBas
      }
    >>
    \new Lyrics \lyricsto beSop \loiDiepKhuc
  >>
  \layout {
    \override Lyrics.LyricSpace.minimum-distance = #1.0
    \override Lyrics.LyricText.font-size = #+2
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
  }
}
