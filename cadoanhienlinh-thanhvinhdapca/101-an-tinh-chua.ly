% Cài đặt chung
\version "2.20.0"
\include "english.ly"

\header {
  title = \markup { \fontsize #3 "Ân Tình Chúa" }
  poet = "Tv. 102"
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
nhacDiepKhuc = \relative c' {
  f8 d bf' a |
  g4. d8 |
  d2 |
  r8 d e g |
  c,4. g'8 |
  e4 g |
  f2 \bar "|."
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c'' {
  \partial 4. c8 a c16 (d) |
  c4 f,8 g |
  a4. bf8 |
  a bf g4 |
  f8 d' e d |
  c2 |
  r8 c a c16 (d) |
  c4 f,8 g |
  a2 |
  bf8 bf a4 |
  f8 g f g |
  f2 ( |
  f4) r \bar "||"
}

nhacPhienKhucHai = \relative c'' {
  \partial 4. d8 c c |
  c f, g f |
  a2 |
  bf8 a g4 |
  d'8 b!4 g8 |
  c2 ( |
  c8) r d c |
  d c f, a |
  d,2 |
  r4 e8 c |
  g'4 c,8 c |
  a'4 g |
  f2 ( |
  f4) r \bar "||"
}

nhacPhienKhucBa = \relative c'' {
  \partial 4 c8 a |
  d c a f |
  f4. a8 |
  a a d, f |
  f4 a8 a |
  g2 |
  r8 c a c |
  f, f g g |
  a4. bf8 |
  bf g
  \autoBeamOff
  g b \fermata |
  \autoBeamOn
  d e4 d8 |
  c2 ( |
  c4) r \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  Ân tình Chúa thiên thu vạn đại.
  Dành cho kẻ nào hết dạ kính tôn.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Chúc tụng Chúa đi, hồn tôi hỡi.
  Chúc tụng danh Người bằng tất cả tâm can.
  Chúc tụng Chúa đi, hồn tôi hỡi.
  Chớ khá quên mọi ân huệ của Người.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Chúa tha cho người ngàn muôn tội lỗi,
  thương chữa lành các bệnh tật ngươi.
  Cứu ngươi khỏi chôn vùi đáy huyệt.
  Bao bọc người bằng tình nghĩa mặn mà.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Đông Đoài cách xa nhau ngàn dặm,
  Chúa cũng ném tội ta đi mãi chốn xa.
  Như người cha chạnh lòng thương con cái,
  Chúa cũng chạnh lòng thương kẻ kính tôn Người.
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
        \key f \major \time 2/4 \stemNeutral \nhacDiepKhuc
      }
    >>
    \new Lyrics \lyricsto beSop \loiDiepKhuc
  >>
  \layout {
    \override Lyrics.LyricText.font-series = #'bold
    \override Lyrics.LyricText.font-size = #+3
    \override Lyrics.LyricSpace.minimum-distance = #4.0
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
        \key f \major \time 2/4 \nhacPhienKhucMot
      }
    >>
    \new Lyrics \lyricsto beSop \loiPhienKhucMot
  >>
  \layout {
    \override Staff.TimeSignature.transparent = ##t
    \override Lyrics.LyricText.font-size = #+3
    \override Lyrics.LyricSpace.minimum-distance = #2.2
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
        \key f \major \time 2/4 \nhacPhienKhucHai
      }
    >>
    \new Lyrics \lyricsto beSop \loiPhienKhucHai
  >>
  \layout {
    \override Staff.TimeSignature.transparent = ##t
    \override Lyrics.LyricText.font-size = #+3
    \override Lyrics.LyricSpace.minimum-distance = #2.2
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
        \key f \major \time 2/4 \nhacPhienKhucBa
      }
    >>
    \new Lyrics \lyricsto beSop \loiPhienKhucBa
  >>
  \layout {
    \override Staff.TimeSignature.transparent = ##t
    \override Lyrics.LyricText.font-size = #+3
    \override Lyrics.LyricSpace.minimum-distance = #2.2
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
  } 
}
