% Cài đặt chung
\version "2.20.0"
\include "english.ly"

\header {
  title = \markup { \fontsize #3 "Người Công Chính" }
  poet = "Tv. 111"
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
  \partial 4 c8 d |
  ef4 c |
  g'8 g4 g8 |
  f4 f8 g |
  ef4 c |
  g'2 |
  r4 g8 bf |
  c4 g |
  d'8 d4 d8 |
  c4 d8 ef |
  bf4 g |
  c2 ( |
  c4) r \bar "|."
}

nhacDiepKhucBas = \relative c' {
  \partial 4 c8 bf |
  c4 g |
  ef'8 ef4 ef8 |
  d4 d8 ef |
  c4 g |
  d'2 |
  r4 ef8 f |
  af4 ef |
  bf'8 bf4 bf8 |
  af4 bf8 c |
  g4 d |
  ef2 ( |
  ef4) r
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c' {
  \partial 4 c8 d |
  ef4 ef8 d |
  c4 f |
  g2 |
  f8 af bf c |
  g2 |
  r4 g8 g |
  d' d4 d8 |
  c4 d8 ef |
  bf4 g |
  c2 ( |
  c4) r \bar "||"
}

nhacPhienKhucHai = \relative c' {
  c4 c |
  ef8 d c f |
  g2 |
  r8 af g af |
  f4. af8 |
  c d ef d |
  c4 bf8 c |
  af4 \tuplet 3/2 { ef8 f f } |
  g2 |
  r8 f ef f |
  d4. bf8 |
  ef4 d |
  c2 ( |
  c4) r \bar "||"
}

nhacPhienKhucBa = \relative c' {
  ef8 d c4 |
  c8 d ef c |
  g'2 |
  f8 g af4 |
  af8 f c' bf |
  g4 c8 d |
  b!4. g8 |
  ef'4 d |
  c2 ( |
  c4) r \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  Người công chính bừng sáng giữa tối tăm,
  soi cả bậc hiền đức.
  Người công chính bừng sáng giữa tối tăm,
  soi cả bận hiền nhân.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Người công chính đã nhân từ thương xót
  lại công minh chính trực.
  Họ bừng sáng giữa tối tăm, soi cả bậc hiền đức.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Thật người chẳng bao giờ lay chuyển.
  Thiên hạ muôn đời sẽ nhắc nhở đến chính nhân.
  Người không sợ phải nghe tin dữ.
  Tâm hồn trông cậy vào Chúa vững vàng.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Kẻ túng nghèo, người rộng tay làm phúc.
  Việc công chính luôn bền bỉ thi hành.
  Uy thế càng rực rỡ vươn cao.
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
        \voiceOne \key ef \major \time 2/4 \nhacDiepKhucSop
      }
      \new Voice = beBas {
        \override NoteHead.font-size = #-2
        \voiceTwo \key ef \major \time 2/4 \nhacDiepKhucBas
      }
    >>
    \new Lyrics \lyricsto beSop \loiDiepKhuc
  >>
  \layout {
    \override Lyrics.LyricText.font-series = #'bold
    \override Lyrics.LyricText.font-size = #+3
    \override Lyrics.LyricSpace.minimum-distance = #3.4
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
        \key ef \major \time 2/4 \nhacPhienKhucMot
      }
    >>
    \new Lyrics \lyricsto beSop \loiPhienKhucMot
  >>
  \layout {
    \override Staff.TimeSignature.transparent = ##t
    \override Lyrics.LyricText.font-size = #+3
    \override Lyrics.LyricSpace.minimum-distance = #1.7
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
        \key ef \major \time 2/4 \nhacPhienKhucHai
      }
    >>
    \new Lyrics \lyricsto beSop \loiPhienKhucHai
  >>
  \layout {
    \override Staff.TimeSignature.transparent = ##t
    \override Lyrics.LyricText.font-size = #+3
    \override Lyrics.LyricSpace.minimum-distance = #1.6
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
        \key ef \major \time 2/4 \nhacPhienKhucBa
      }
    >>
    \new Lyrics \lyricsto beSop \loiPhienKhucBa
  >>
  \layout {
    \override Staff.TimeSignature.transparent = ##t
    \override Lyrics.LyricText.font-size = #+3
    \override Lyrics.LyricSpace.minimum-distance = #1.9
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
  }
}
