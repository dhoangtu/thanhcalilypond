% Cài đặt chung
\version "2.20.0"
\include "english.ly"

\header {
  title = \markup { \fontsize #3 "Xin Ngự Đến" }
  poet = "Tv. 103"
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
  \partial 4 e4 |
  a2 |
  g8 f e d |
  g4. f8 |
  e2 |
  a8 g a e |
  c'4 a8 c |
  d4 b8 g | a2 ( |
  a4) r \bar "|."
}

nhacDiepKhucBass= \relative c' {
  \skip 4
  \skip 2
  \skip 2
  \skip 2
  \skip 2
  f8 e f c |
  a'4 f8 a |
  b4 f8 d |
  e2 ( |
  e4) r
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c'' {
  a8 g a4 g8 a c4
  b8 b d b g4 (g8)
  a f d e c4 (c) \breathe
  e8 a4 a8 g g b g b g a4 a8 a c4 a8 a a d4
  a8 g e a4 (a) \bar "||"
}

nhacPhienKhucHai = \relative c'' {
  a8 a g a \acciaccatura g8 a4 \breathe
  a8 g a \acciaccatura g8 a4 \breathe
  f8 e d g c,4 (c8) d e c a d4
  e8 a g a e4 (e8)
  a a a c c b b d d c c4 (c) \bar "||"
}

nhacPhienKhucBa = \relative c'' {
  a8 g a4 g8 a c b a4 \breathe
  f8 d g c,4 f8 g f e4 (e8) \breathe
  g a g4 g8 g a c c4 (c8) \breathe
  a c c b d d4 c8 c b ([d]) c ([b]) a4 (a) \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  Lạy Chúa, xin cử Thánh Thần xuống muôn ơn.
  Xin cử Thánh Thần tới để canh tân mặt địa cầu.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Chúc tụng Chúa hồn tôi hỡi,
  lạy Thượng Đế con thờ.
  Chúa muôn trùng cao cả.
  Lạy Chúa, công trình Ngài quả thiện hảo dường bao,
  sự nghiệp Chúa tràn đầy mặt đất, tràn đầy mặt đất.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Chúa lấy sinh khí lại, chúng liền tắt thở mà trở về cát bụi.
  Sinh khí Ngài gửi tới, là muôn vật tạo thành.
  Mặt địa cầu chính Chúa canh tân,
  chính Chúa canh tân.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Vinh hiển Chúa nguyện muôn năm tồn tại.
  Sự nghiệp Chúa làm, Chúa mãi hân hoan.
  Nguyện tiếng lòng làm thỏa vui Thánh ý.
  Phần tôi đây, phần tôi đây, tôi hoan hỉ trong Ngài.
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
        \voiceOne \key c \major \time 2/4 \nhacDiepKhucSop
      }
      \new Voice = beBas {
        \override NoteHead.font-size = #-2
        \voiceTwo \key c \major \time 2/4 \nhacDiepKhucBass
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
        \key c \major \time 2/4 \nhacPhienKhucMot
      }
    >>
    \new Lyrics \lyricsto beSop \loiPhienKhucMot
  >>
  \layout {
    \override Staff.TimeSignature.transparent = ##t
    \override Lyrics.LyricText.font-size = #+3
    \override Lyrics.LyricSpace.minimum-distance = #1.8
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
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
        \key c \major \time 2/4 \nhacPhienKhucHai
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
        \key c \major \time 2/4 \nhacPhienKhucBa
      }
    >>
    \new Lyrics \lyricsto beSop \loiPhienKhucBa
  >>
  \layout {
    \override Staff.TimeSignature.transparent = ##t
    \override Lyrics.LyricText.font-size = #+3
    \override Lyrics.LyricSpace.minimum-distance = #1.8
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
    \set Score.barAlways = ##t
    \set Score.defaultBarType = ""
  } 
}
