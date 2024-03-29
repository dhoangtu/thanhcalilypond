% Cài đặt chung
\version "2.20.0"
\include "english.ly"

\header {
  title = \markup { \fontsize #3 "Xin Hồi Phục" }
  poet = "Tv. 79"
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
nhacDiepKhucSop= \relative c' {
  r4 d4 |
  a'2 |
  g8 e e fs |
  d4 d8 fs 
  e d b4 |
  b8 d a e' |
  d2 ( |
  d4) r \bar "|."
}

nhacDiepKhucBass= \relative c' {
  r4 a'4 |
  d2 |
  b8 g g a |
  fs4 fs8 a |
  g fs e4 |
  e8 g e g |
  fs2 ( |
  fs4) r
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c' {
  e8 g a g b a a \breathe
  a g b a4 (a8) \breathe
  a g a a d, e fs4 (fs) \breathe
  a8 g e g b g a4 a16 fs d8 e4 \breathe
  e8 cs b cs a4 \breathe
  b8 a fs' e4 e8 g a d,4 (d) \bar "||"
}

nhacPhienKhucHai = \relative c' {
  e8 g a g a4 \breathe
  g8 a d,4 (d8) \breathe
  b d a4 a8 d fs d e4 (e8) \breathe
  a g g a a d, e fs4 \breathe
  a8 g a (a16) a8 b b16 b e,4 \breathe
  e8 e a4 \breathe
  cs,8 a e' fs d4 (d) \bar "||"
}

nhacPhienKhucBa = \relative c' {
  g'8 a g a a b e, g a4 \breathe
  g8 a g4 a8 a d, e e fs4 a8 g e g a cs b a4 (a8) \breathe
  cs b a (a16) cs8 cs a e'4 \breathe
  d16 fs e4 e8 d8 \fermata e \fermata d4 (d) \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  Lạy Chúa, xin hồi phục dân Ngài,
  nguyện Thánh Nhan chiếu rọi, để cứu độ chúng con.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Hỡi mục tử nhà Is -- ra -- el, xin hãy lắng nghe
  Đấng ngự trên các thần hộ giá.
  Dám xin Ngài giải sáng hiển linh.
  Dũng lực quyền uy, xin khơi dậy đi nào.
  Đến cùng chúng con và thương cứu độ.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Lạy Chúa tể càn khôn, xin đoái lại.
  Từ cõi trời, Ngài ngó xuống mà xem.
  Xin trở về thăm nom vườn nho cũ.
  Bảo vệ cây tay hữu Chúa đã trồng.
  Cây non ấy, Ngài từng cho sức mạnh.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Xin Chúa đặt tay trên Đấng ngồi bên hữu,
  là con người Chúa đã từng cho mạnh sức.
  Chúng con nguyện chẳng xa Chúa nữa đâu.
  Cúi xin Ngài ban cho được sống,
  để chúng con xưng tụng danh Ngài.
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
        \voiceTwo \key d \major \time 2/4 \nhacDiepKhucSop
      }
      \new Voice = beBas {
        \override NoteHead.font-size = #-2
        \voiceOne \key d \major \time 2/4 \nhacDiepKhucBass
      }
    >>
    \new Lyrics \lyricsto beSop \loiDiepKhuc
  >>
  \layout {
    \override Lyrics.LyricText.font-series = #'bold
    \override Lyrics.LyricText.font-size = #+3
    \override Lyrics.LyricSpace.minimum-distance = #2.0
    \override Score.BarNumber.break-visibility = ##(#f #f #f)    \override Score.SpacingSpanner.uniform-stretching = ##t
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
    \override Score.BarNumber.break-visibility = ##(#f #f #f)    \override Score.SpacingSpanner.uniform-stretching = ##t
    \set Score.barAlways = ##t
    \set Score.defaultBarType = ""
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
    \override Score.BarNumber.break-visibility = ##(#f #f #f)    \override Score.SpacingSpanner.uniform-stretching = ##t
    \set Score.barAlways = ##t
    \set Score.defaultBarType = ""
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
    \override Score.BarNumber.break-visibility = ##(#f #f #f)    \override Score.SpacingSpanner.uniform-stretching = ##t
    \set Score.barAlways = ##t
    \set Score.defaultBarType = ""
  } 
}
