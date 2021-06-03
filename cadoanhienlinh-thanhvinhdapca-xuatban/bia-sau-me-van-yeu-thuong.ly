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
  %ragged-right = ##t
  %ragged-last = ##t
  %line-width = #150
  ragged-bottom = ##f
  ragged-last-bottom = ##t
}

% Nhạc điệp khúc
nhacDiepKhucSop = \relative c'' {
  \override Score.SpacingSpanner.strict-note-spacing = ##t
  \partial 4 a8 b
  cs4. d4 cs8
  cs4. \break
  cs8 a b
  cs4. d4 cs8
  b2 \break
  b8 b
  b2 b4
  fs2 \break
  a8 a
  a4. gs8 fs gs
  \acciaccatura cs,8 e2 \break
  a4 
  a2. (
  a2) \bar "|."
}

nhacDiepKhucBas = \relative c'' {
  \override Score.SpacingSpanner.strict-note-spacing = ##t
  \partial 4 cs8 d
  e4. fs4 e8
  e4. e8 cs d
  e4. fs4 e8
  d2 d8 d
  d2 d4
  b2 cs8 cs
  cs4. b8 a b
  a2 cs4
  cs2. (
  cs2)
}


% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  \set stanza = "..."
  Dù thời gian có phôi pha
  Nhưng tình Mẹ thương vẫn bao la,
  Như mây bay trên ngàn,
  Như thông reo bên dòng suối nhỏ
  Yêu thương.
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
    \override Lyrics.LyricText.font-size = #+1
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Staff.TimeSignature.transparent = ##t
    \set Score.barAlways = ##t
    \set Score.defaultBarType = ""
    \override Score.SpacingSpanner.uniform-stretching = ##t
  }
}
