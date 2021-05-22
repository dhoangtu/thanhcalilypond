% Cài đặt chung
\version "2.20.0"
\include "english.ly"

\header {
  title = \markup { \fontsize #3 "Chúa Đối Xử Đại Lượng" }
  poet = "TV. 125"
  composer = "Lm. Trần Thanh Cao"
  arranger = " "
  tagline = ##f
}

\paper {
  #(set-paper-size "a4")
  top-margin = 15\mm
  bottom-margin = 15\mm
  left-margin = 20\mm
  right-margin = 20\mm
  #(define fonts
    (make-pango-font-tree
      "Liberation Serif"
      "Liberation Serif"
      "Liberation Serif"
      (/ 20 20)))
  page-count = #1
  indent = #0
  system-system-spacing.basic-distance = #17
}

% Nhạc điệp khúc
nhacDiepKhucBas = \relative c' {
  \partial 8 d8 |
  e fs a b |
  c4 g8 a |
  g4 e'8 e |
  d4 d8 d |
  c4 c8 c |
  b4 a |
  c4. b8 |
  b2 \bar "|."
}

nhacDiepKhucSop = \relative c'' {
  \partial 8 d8 |
  d d fs, e |
  e4 c'8 c |
  b2 |
  a8 b a e |
  a4. g8 |
  g2 |
  g2 |
  g2 \bar "|."
}

% Nhạc phiên khúc
nhacPhienKhuc = \relative c'' {
  \partial 4. b8 d d |
  e, fs fs e |
  d4. d8 |
  g, b d e |
  d4. c8 |
  c4 e8 e |
  e4 d8 fs ( |
  fs) a a e |
  c' d4 fs,8 |
  g2 \bar "||"
}

% Lời điệp khúc
loiDiepKhucSop = \lyricmode {
  Chúa đã đối xử đại lượng với chúng con,
  nên chúng con mừng rỡ hân hoan hân hoan.
}

loiDiepKhucBas = \lyricmode {
  Chúa đã đối xử đại lượng với chúng con,
  với chúng con, với chúng con,
  với chúng con mừng rỡ hân hoan.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Khi Chúa dắt tù Si -- on trở về,
  ta tưởng mình trong giấc mơ.
  Ngoài miệng vang vang câu cười nói,
  trên môi rộn rã khúc nhạc mừng.
}

loiPhienKhucHai = \lyricmode {
  \override Lyrics.LyricText.font-shape = #'italic
  \set stanza = #"2."
  Hôm ấy khắp bàn dân nghe luận đàm,
  ôi việc tay Chúa lớn lao.
  Việc Ngài thi công cao trọng quá,
  con nghe hồn chất ngất niềm vui.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Xin Chúa dẫn đường con dân trở về,
  như chuyển dòng suối phía Nam.
  Nghẹn ngào ra đi reo hạt giống,
  mai sau gặt hái sẽ mừng vui.
}

% Dàn trang
\score {
  \new ChoirStaff <<
    \new Staff \with {
        \consists "Merge_rests_engraver"
        \magnifyStaff #(magstep +1)
      }
      <<
      \new Voice = beSop {
        \voiceOne \key g \major \time 2/4 \nhacDiepKhucSop
      }
      \new Lyrics \lyricsto beSop \loiDiepKhucSop
    >>
    \new Staff \with {
        \consists "Merge_rests_engraver"
        \magnifyStaff #(magstep +1)
      }
      <<
      \new Voice = beBas {
        \voiceTwo \key g \major \time 2/4 \nhacDiepKhucBas
      }
      \new Lyrics \lyricsto beBas \loiDiepKhucBas
    >>
  >>
  \layout {
    \override Lyrics.LyricText.font-series = #'bold
    \override Lyrics.LyricText.font-size = #+3
    \override Lyrics.LyricSpace.minimum-distance = #0.5
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
        \key g \major \time 2/4 \nhacPhienKhuc
      }
    >>
    \new Lyrics \lyricsto beSop \loiPhienKhucMot
    \new Lyrics \lyricsto beSop \loiPhienKhucHai
    \new Lyrics \lyricsto beSop \loiPhienKhucBa
  >>
  \layout {
    \override Staff.TimeSignature.transparent = ##t
    \override Lyrics.LyricText.font-size = #+3
    \override Lyrics.LyricSpace.minimum-distance = #2.0
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
  } 
}