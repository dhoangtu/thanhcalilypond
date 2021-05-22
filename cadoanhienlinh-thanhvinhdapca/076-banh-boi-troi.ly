% Cài đặt chung
\version "2.20.0"
\include "english.ly"

\header {
  title = \markup { \fontsize #3 "Bánh Bởi Trời" }
  poet = "TV. 77"
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
  b2 gs4 |
  gs cs, e |
  fs2 cs4 |
  b2 \breathe fs'4 |
  fs ds e |
  fs2 b,4 |
  e2. ( |
  e4) r2 \bar "|."
}

nhacDiepKhucBass = \relative c'' {
  gs2 e4 |
  e a, cs |
  ds2 a4 |
  gs2 ds'4 |
  ds b cs |
  ds2 gs,4 |
  b2. ( |
  b4) r2
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c' {
  fs8 b a b fs a b4 \breathe
  e,8 gs gs a fs ds b4 \breathe
  cs8 b b e gs e fs fs4 \breathe
  fs8 fs b fs4 fs8 a a b e,4 (e) \bar "||"
}

nhacPhienKhucHai = \relative c'' {
  b8 fs fs a a fs a \acciaccatura a8 b4 \breathe
  e,8 e fs e gs fs fs4 \breathe
  fs8 ds ds cs b e fs gs4 \breathe
  a8 fs b a fs4 fs8 gs e4 (e) \bar "||"
}

nhacPhienKhucBa = \relative c'' {
  a8 fs a fs a b b gs e4 \breathe
  cs8 e b b fs' e gs fs4 \breathe
  b8 a a fs fs a b4 \breathe
  a8 b fs cs' ds cs b4 (b) \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  Chúa cho dân được ăn bánh bởi trời,
  cho dân được ăn bánh trường sinh.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Điều chúng ta đã từng nghe biết,
  Bậc cha ông kể lại cho mình,
  Sẽ tường thuật cho thế hệ mai sau:
  Sự nghiệp lẫy lừng, quyền uy của Chúa Trời.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Chúa hạ lệnh cho mây tầng cao thẳm,
  lại truyền mở rộng cảnh thiên môn.
  Khiến Man -- na, tựa hồ mưa rơi xuống.
  Ấy là bánh bởi trời nuôi dưỡng họ.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Kẻ phàm nhân được ăn bánh các Thiên Thần,
  Được no lòng nhờ lương thực Chúa ban.
  Chúa đưa dân vào miền đất hứa.
  Vùng núi đồi Chúa đã ra tay.
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
        \voiceOne \key e \major \time 3/4 \nhacDiepKhucSop
      }
      \new Voice = beBas {
        \voiceTwo \key e \major \time 3/4 \nhacDiepKhucBass
      }
    >>
    \new Lyrics \lyricsto beSop \loiDiepKhuc
  >>
  \layout {
    \override Lyrics.LyricText.font-series = #'bold
    \override Lyrics.LyricText.font-size = #+3
    \override Lyrics.LyricSpace.minimum-distance = #3.5
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
        \key e \major \time 3/4 \nhacPhienKhucMot
      }
    >>
    \new Lyrics \lyricsto beSop \loiPhienKhucMot
  >>
  \layout {
    \override Staff.TimeSignature.transparent = ##t
    \override Lyrics.LyricText.font-size = #+3
    \override Lyrics.LyricSpace.minimum-distance = #0.5
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
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
        \key e \major \time 3/4 \nhacPhienKhucHai
      }
    >>
    \new Lyrics \lyricsto beSop \loiPhienKhucHai
  >>
  \layout {
    \override Staff.TimeSignature.transparent = ##t
    \override Lyrics.LyricText.font-size = #+3
    \override Lyrics.LyricSpace.minimum-distance = #0.5
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
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
        \key e \major \time 3/4 \nhacPhienKhucBa
      }
    >>
    \new Lyrics \lyricsto beSop \loiPhienKhucBa
  >>
  \layout {
    \override Staff.TimeSignature.transparent = ##t
    \override Lyrics.LyricText.font-size = #+3
    \override Lyrics.LyricSpace.minimum-distance = #0.5
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \set Score.barAlways = ##t
    \set Score.defaultBarType = ""
  } 
}