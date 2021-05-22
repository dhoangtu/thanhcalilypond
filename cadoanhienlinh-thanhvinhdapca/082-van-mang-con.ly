% Cài đặt chung
\version "2.20.0"
\include "english.ly"

\header {
  title = \markup { \fontsize #3 "Vận Mạng Con" }
  poet = "TV. 53"
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
nhacDiepKhucSop = \relative c' {
  \partial 4 e4 |
  b' g8 g |
  a a e g |
  g4 e8 e |
  fs fs d fs |
  e2 \bar "|."
}

nhacDiepKhucBass = \relative c'' {
  \skip 4
  g4  e8 e |
  fs fs c e |
  e4 c8 c |
  d d b d |
  b2
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c' {
  fs8 g e4 b'8 c b b a c a b4 (b) \breathe
  a8 b a a e b' g g4 (g8)
  fs8 fs d e c d c b4 \breathe
  a8 c e b4
  \tempo "Rall." fs'8 d a' \fermata e4 (e) \bar "||"
}

nhacPhienKhucHai = \relative c' {
  e8 g g e g a b4
  a8 fs fs e e d g4 \breathe
  e8 g g e a \breathe
  fs8 a b e,4 (e) \bar "||"
}

nhacPhienKhucBa = \relative c'' {
  g8 e e b' a c b \breathe
  g g a a e g g4
  fs8 d d e b e g4 \breathe
  e8 b'4 c8 c a d b4 \breathe
  \tempo "Rall." a8 g fs d
  \acciaccatura d8 e4 (e) \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  Lạy Chúa, vận mạng con chính Ngài nắm giữ,
  vận mạng con tay Ngài đỡ nâng.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Lạy Chúa Trời, xin lấy uy danh mà cứu độ con.
  Minh xử cho con bằng sức mạnh Ngài.
  Xin nghe lời con tha thiết nguyện cầu,
  lời con thưa gửi xin Ngài lắng tai.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Phường kiêu hãnh nhằm con chống đối,
  quân bạo tàn tìm hại mạng con,
  mà cũng chẳng kể chi, kể chi đến Ngài.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Nhưng mà này Chúa trợ giúp con,
  vận mạng con chính Ngài nắm giữ.
  Con tự nguyện dâng Ngài lễ tế.
  Lạy Chúa, con xưng tụng danh Ngài.
  Danh Ngài thật thiện hảo.
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
        \voiceOne \key g \major \time 2/4 \nhacDiepKhucSop
      }
      \new Voice = beBas {
        \override NoteHead.font-size = #-2
        \voiceTwo \key g \major \time 2/4 \nhacDiepKhucBass
      }
    >>
    \new Lyrics \lyricsto beSop \loiDiepKhuc
  >>
  \layout {
    \override Lyrics.LyricText.font-series = #'bold
    \override Lyrics.LyricText.font-size = #+3
    \override Lyrics.LyricSpace.minimum-distance = #4.0
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
        \key g \major \time 2/4 \nhacPhienKhucMot
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
        \key g \major \time 2/4 \nhacPhienKhucHai
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
        \key g \major \time 2/4 \nhacPhienKhucBa
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
