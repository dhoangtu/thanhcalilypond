% Cài đặt chung
\version "2.20.0"
\include "english.ly"

\header {
  title = \markup { \fontsize #3 "Xin Dủ Lòng Xót Thương" }
  poet = "Tv. 50"
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
  \partial 4 d4 |
  bf' a8 f |
  d _(f) g _(a) |
  g4 g8 d' |
  c ef c d |
  a4 a8 c |
  bf bf a f |
  g2 \bar "|."
}

nhacDiepKhucBas = \relative c'' {
  \skip 4
  \skip 2
  \skip 2
  \skip 4. bf8 |
  a c a bf |
  f4 f8 a |
  g g ef c |
  d2
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c' {
  \partial 4 d4 |
  d' d8 d |
  d4 d8 bf |
  bf c g4 ( |
  g) \tuplet 3/2 { g8 f g } |
  d4 \tuplet 3/2 { bf'8 bf g } |
  a4 \tuplet 3/2 { bf8 a bf } |
  \autoBeamOff
  g4 \tuplet 3/2 { ef'8 \fermata ef \fermata c \fermata } |
  \autoBeamOn
  d2 ( |
  d8) r c bf |
  c a bf a |
  g4 g8 f |
  g f g16 (bf) g (f) |
  d4. c8 |
  ef g d4 |
  c'4. a16 ef' |
  d2 ( |
  d4) r \bar "||"
}

nhacPhienKhucHai = \relative c'' {
  \partial 4 g4 |
  d' d16 ef c c |
  d4 c8 bf |
  g2 |
  r8 f \tuplet 3/2 { bf8 g f } |
  g f bf a |
  a2 ( |
  a8) r \tuplet 3/2 { a8 c a } |
  c8 c ef ef |
  d4 \fermata \breathe g,16 bf a g |
  a4 \fermata \breathe a8 f |
  d4. f16 (g) |
  g2 ( |
  g4) r \bar "||"
}

nhacPhienKhucBa = \relative c'' {
  \partial 4 c8. c16 |
  c8 c bf g |
  bf4 \fermata a8. a16 |
  a8 a f d |
  g2 |
  f8 f bf d |
  c2 |
  r4 a8 bf |
  g c ef c |
  d2 |
  c8 c c d ( |
  d) r g,16 (a) bf (a) |
  g2 ( |
  g4) r \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  Lạy Chúa, xin dủ lòng xót thương
  vì chúng con đắc tội với Ngài,
  vì chúng con đắc tội cùng Ngài.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Lạy Chúa, xin thương con bởi lòng Ngài nhân hậu.
  Lấy lượng hải hà xóa bỏ tội con,
  lấy lượng hải hà xóa bỏ tội con.
  Xin rửa con sạch hết lỗi lầm,
  xin rửa con sạch hết lỗi lầm,
  tội con đã phạm xin Ngài thứ tha.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Lạy Chúa, xin tái tạo lòng con nên trong sạch.
  Đổi mới tinh thần cho bền vững trung kiên.
  Đừng nỡ đuổi con xa cách Thánh Nhan.
  Đừng cất khỏi lòng con Thánh Thần Ngài trao ban.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Nhưng cho con thấy lại niềm vui,
  nhưng cho con thấy lại niềm vui
  được Ngài thương thứ tha.
  Lạy Chúa Trời xin mở miệng con,
  cho con vang tiếng ngợi khen Ngài.
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
        \voiceOne \key bf \major \time 2/4 \nhacDiepKhucSop
      }
      \new Voice = beBas {
        \override NoteHead.font-size = #-2
        \voiceTwo \key bf \major \time 2/4 \nhacDiepKhucBas
      }
    >>
    \new Lyrics \lyricsto beSop \loiDiepKhuc
  >>
  \layout {
    \override Lyrics.LyricText.font-series = #'bold
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
        \key bf \major \time 2/4 \nhacPhienKhucMot
      }
    >>
    \new Lyrics \lyricsto beSop \loiPhienKhucMot
  >>
  \layout {
    \override Staff.TimeSignature.transparent = ##t
    \override Lyrics.LyricText.font-size = #+3
    \override Lyrics.LyricSpace.minimum-distance = #1.0
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
        \key bf \major \time 2/4 \nhacPhienKhucHai
      }
    >>
    \new Lyrics \lyricsto beSop \loiPhienKhucHai
  >>
  \layout {
    \override Staff.TimeSignature.transparent = ##t
    \override Lyrics.LyricText.font-size = #+3
    \override Lyrics.LyricSpace.minimum-distance = #1.2
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
        \key bf \major \time 2/4 \nhacPhienKhucBa
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
