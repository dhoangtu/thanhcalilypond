% Cài đặt chung
\version "2.20.0"
\include "english.ly"

\header {
  title = \markup { \fontsize #3 "Chúc Tụng Chúa" }
  poet = "Tv. 144"
  composer = "Lm. GB Trần Thanh Cao"
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
  \partial 2 d4 e8 _(d) |
  b4 d g a8 (b) |
  a2 b4 d |
  a r a b |
  e, c' b a |
  g2 r \bar "|."
}

nhacDiepKhucBas = \relative c' {
  \override NoteHead.font-size = #-2
  \skip 2
  \skip 4 b4 c d8 (g) |
  fs2 g4 fs |
  d r fs g |
  b, e d c |
  b2 r
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c' {
  \partial 2 d4 e8 (d) |
  b4 b' c4. b8 |
  a2 r4 a |
  e4. c'8 b4 a |
  d,2. c8 c |
  c4 e g e |
  fs2. d8 e |
  d4. b'8 a a g b |
  \acciaccatura b8 d2 \bar "||"
}

nhacPhienKhucHai = \relative c'' {
  \partial 2 b4. e,8 |
  e4 c' b a |
  d2. b8 g |
  e2 e8 c' c a |
  b2 a4. fs8 |
  g4 g fs8 a b g |
  fs2 r4 d8 g |
  b4. a8 fs d a' fs |
  g2 \bar "||"
}

nhacPhienKhucBa = \relative c' {
  \partial 4 e8 b |
  g'2 fs8 d b d |
  e2. e8 a |
  a4. a8 fs e4 d8 |
  d2. d8 b' |
  b4. b8 a g4 g8 |
  g2 r4 g8 e |
  c'4. c8 e, g4 c8 |
  b2. fs8 e |
  d2 d8 fs a d, |
  g2 r \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  \override Lyrics.LyricText.font-series = #'bold
  Tâu Thánh Thượng là Thiên Chúa con.
  Xin Chúc tụng, xin chúc tụng Thánh Danh muôn đời.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Tâu Thánh Thượng Thiên Chúa của con.
  Con nguyện tán dương danh Ngài.
  Ngày lại ngày xin chúc tụng Chúa.
  Và ca ngợi Thánh Danh muôn đời muôn thuở.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Chúa một niềm xót thương từ ái.
  Đã khoan hồng lại lắm nghĩa giàu ân.
  Chúa từ bi quảng đại với hết mọi người.
  Và âu yếm muôn vật Ngài đã dựng nên.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Chúa thành tín trong mọi lời Chúa phán.
  Đầy yêu thương trong mọi việc Người làm.
  Đầy yêu thương trong mọi việc Người làm.
  Ai quỵ ngã Chúa đều nâng đỡ lên.
  Kẻ bị dìm, Người cho đứng thẳng lên.
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
        \voiceOne \key g \major \time 2/2 \nhacDiepKhucSop
      }
      \new Voice = beBas {
        \voiceTwo \key g \major \time 2/2 \nhacDiepKhucBas
      }
    >>
    \new Lyrics \lyricsto beSop \loiDiepKhuc
  >>
  \layout {
    \override Lyrics.LyricText.font-series = #'bold
    \override Lyrics.LyricText.font-size = #+3
    \override Lyrics.LyricSpace.minimum-distance = #3.0
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
        \key g \major \time 2/2 \nhacPhienKhucMot
      }
    >>
    \new Lyrics \lyricsto beSop \loiPhienKhucMot
  >>
  \layout {
    \override Staff.TimeSignature.transparent = ##t
    \override Lyrics.LyricText.font-size = #+3
    \override Lyrics.LyricSpace.minimum-distance = #2.5
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
        \key g \major \time 2/2 \nhacPhienKhucHai
      }
    >>
    \new Lyrics \lyricsto beSop \loiPhienKhucHai
  >>
  \layout {
    \override Staff.TimeSignature.transparent = ##t
    \override Lyrics.LyricText.font-size = #+3
    \override Lyrics.LyricSpace.minimum-distance = #1.8
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
        \key g \major \time 2/2 \nhacPhienKhucBa
      }
    >>
    \new Lyrics \lyricsto beSop \loiPhienKhucBa
  >>
  \layout {
    \override Staff.TimeSignature.transparent = ##t
    \override Lyrics.LyricText.font-size = #+3
    \override Lyrics.LyricSpace.minimum-distance = #1.5
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
  }
}
