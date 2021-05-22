% Cài đặt chung
\version "2.20.0"
\include "english.ly"

\header {
  title = \markup { \fontsize #3 "Chúa Là Nơi Con Ẩn Náu" }
  poet = "TV. 31"
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
  \partial 4 a8 d, |
  fs fs e _(fs) |
  a4 a8 b |
  a b a4 |
  cs8 e d e |
  d2 |
  g,8 g b d |
  d4 d,8 d |
  fs a a4 |
  e8 _(g) fs e |
  d2 ( |
  d4) r \bar "|."
}

nhacDiepKhucBass = \relative c' {
  \override NoteHead.font-size = #-2
  \partial 4 fs8 a, |
  d d cs ^(d) |
  fs4 fs8 g |
  fs g fs4 |
  a8 a b cs |
  a2 |
  d,8 d g b |
  b4 b,8 b |
  d fs fs4 |
  a, d8 cs |
  a2 ( |
  a4) r
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c' {
  \partial 4 d8 fs |
  e4 d8. a'16 |
  g8 e e g |
  a4 cs8 a |
  a a e g |
  fs2 ( |
  fs8) r d fs |
  e4 d8. a'16 |
  g8 e e g |
  a4 \breathe d,8 d |
  d e fs e |
  d2 ( |
  d4) \bar "||"
}

nhacPhienKhucHai = \relative c' {
  \partial 4 e8 d |
  fs4 a8. a16 |
  g8 a \afterGrace e4 (a8) |
  r8 a cs e |
  a, e g g |
  fs2 ( |
  fs8) r e d |
  \acciaccatura e8 fs4 a8. a16 |
  g8 e a4 |
  r8 d, d fs |
  e4 e8 fs |
  d2 ( |
  d4) \bar "||"
}

nhacPhienKhucBa = \relative c'' {
  \partial 4 a8 fs |
  d'4 d8 d |
  cs4 d |
  e b8 b |
  a2 |
  r4 g8 e |
  a4 fs8 g |
  e g \acciaccatura e8 g4 \fermata |
  \tempo "Rall" e8 g \acciaccatura e8 a fs |
  d2 ( |
  d4) r \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  Chúa là nơi con ẩn náu, con cất lên tiếng ca,
  con cất lên tiếng ca.
  Vì Ngài thương cứu giúp,
  vì Ngài thương cứu giúp chở che đêm ngày.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Hạnh phúc thay! Kẻ lỗi lầm mà được tha thứ.
  Bao tội tình đã được bỏ qua.
  Hạnh phúc thay! Người Chúa không hạch tội tra xét.
  Và lòng dạ chẳng chút gian tà.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Bao tội lỗi con đã đầu thú cả.
  Tỏ hết với ngài chẳng dấu diếm chi.
  Con tự nhủ: Ta thú tội cùng Chúa,
  Ngài liền thứ tha mọi lỗi lầm.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Nhảy mừng lên! Hỡi những ai công chính,
  hãy vui mừng.
  Nhảy mừng lên, mọi tâm hồn ngay thẳng.
  Nào vui sướng reo hò.
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
        \voiceOne \key d \major \time 2/4 \nhacDiepKhucSop
      }
      \new Voice = beBas {
        \voiceTwo \key d \major \time 2/4 \nhacDiepKhucBass
      }
    >>
    \new Lyrics \lyricsto beSop \loiDiepKhuc
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
        \key d \major \time 2/4 \nhacPhienKhucMot
      }
    >>
    \new Lyrics \lyricsto beSop \loiPhienKhucMot
  >>
  \layout {
    \override Staff.TimeSignature.transparent = ##t
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
        \key d \major \time 2/4 \nhacPhienKhucHai
      }
    >>
    \new Lyrics \lyricsto beSop \loiPhienKhucHai
  >>
  \layout {
    \override Staff.TimeSignature.transparent = ##t
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
        \key d \major \time 2/4 \nhacPhienKhucBa
      }
    >>
    \new Lyrics \lyricsto beSop \loiPhienKhucBa
  >>
  \layout {
    \override Staff.TimeSignature.transparent = ##t
    \override Lyrics.LyricText.font-size = #+3
    \override Lyrics.LyricSpace.minimum-distance = #0.5
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
  }
}