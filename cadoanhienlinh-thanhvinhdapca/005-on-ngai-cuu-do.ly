% Cài đặt chung
\version "2.20.0"
\include "english.ly"

\header {
  title = \markup { \fontsize #3 "Ơn Ngài Cứu Độ" }
  poet = "TV. 84"
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
nhacDiepKhucSop= \relative c' {
  \partial 4 c4 |
  a' a8. bf16 |
  g8 f f a |
  c4 \tuplet 3/2 { c8 bf d } |
  bf4 \tuplet 3/2 { bf8 g c } |
  a4 g8 g |
  d e4 g8 |
  f2 ( |
  f8) r8 r4 \bar "|."
}

nhacDiepKhucBas = \relative c' {
  \partial 4 c4 |
  f f8. e16 |
  d8 c c f |
  a4 \tuplet 3/2 { a8 g bf } |
  f4 \tuplet 3/2 { g8 e a } |
  d,4 d8 d |
  bf c4 bf8 |
  a2 ( |
  a8) r8 r4
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c'' {
  r8 c d d |
  c4 \tuplet 3/2 { f,8 f a } |
  d,2 ( |
  d8) g c,8. a16 |
  c8 f a bf |
  g2 ( |
  g8) bf c c |
  bf4 \tuplet 3/2 { e,8 e g } |
  c,4. g'8 |
  c,4 \tuplet 3/2 { g'8 g bf } |
  a2 |
  g8 g c e, |
  f2 ( |
  f4) r \bar "||"
}

nhacPhienKhucHai = \relative c' {
  r8 c' d8. d16 |
  c8 a bf d, |
  d2 ( |
  d8) a c8. f16 |
  a8 a bf a |
  g2 ( |
  g8) f bf8. d,16 |
  f8 d4 g8 |
  a8 a4 r8 |
  r g c,8. e16 |
  g8 e4 c8 |
  f f4 r8 \bar "||"
}

nhacPhienKhucBa = \relative c' {
  r8 c' d d |
  c8. a16 f8. a16 |
  d,2 ( |
  d8) g e8. d16 |
  c8. c16 f8. g16 |
  a2 ( |
  a08) bf bf8. g16 |
  g8 bf4 c8 |
  c2 ( |
  c8) g g8. e16 |
  c8 g' a g |
  f2 ( |
  f4) r \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  Lạy Chúa, xin tỏ ra lòng Ngài nhân ái.
  Ơn Ngài cứu độ, ơn Ngài cứu độ xin ban tặng cho chúng con.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Tôi đã lắng nghe điều Ngài phán dạy:
  Thái bình thịnh vượng cho kẻ tín trung.
  Tôi đã lắng nghe điều Ngài phán truyền:
  sẵn sàng ban ơn cứu độ cho ai kính sợ Người.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Ân nghĩa tín trung nay đã hội ngộ,
  hòa bình công lý nay đã giao duyên.
  Thành tín mọc lên từ cõi đất thấp.
  Công bình ngó xuống từ trời cao xanh.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Thiên Chúa chúng ta ban nguồn ân huệ
  Đất đai dồi dào trổ sinh hoa trái.
  Công lý mở đường đi trước Chúa.
  Ơn cứu độ cùng theo bước chân Người.
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
        \voiceOne \key f \major \time 2/4 \nhacDiepKhucSop
      }
      \new Voice = beBas {
        \override NoteHead.font-size = #-2
        \voiceTwo \key f \major \time 2/4 \nhacDiepKhucBas
      }
    >>
    \new Lyrics \lyricsto beSop \loiDiepKhuc
  >>
  \layout {
    \override Lyrics.LyricText.font-series = #'bold
    \override Lyrics.LyricText.font-size = #+3
    \override Lyrics.LyricSpace.minimum-distance = #2.0
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
        \key f \major \time 2/4 \nhacPhienKhucMot
      }
    >>
    \new Lyrics \lyricsto beSop \loiPhienKhucMot
  >>
  \layout {
    \override Staff.TimeSignature.transparent = ##t
    \override Lyrics.LyricText.font-size = #+3
    \override Lyrics.LyricSpace.minimum-distance = #2.0
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
        \key f \major \time 2/4 \nhacPhienKhucHai
      }
    >>
    \new Lyrics \lyricsto beSop \loiPhienKhucHai
  >>
  \layout {
    \override Staff.TimeSignature.transparent = ##t
    \override Lyrics.LyricText.font-size = #+3
    \override Lyrics.LyricSpace.minimum-distance = #2.0
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
        \key f \major \time 2/4 \nhacPhienKhucBa
      }
    >>
    \new Lyrics \lyricsto beSop \loiPhienKhucBa
  >>
  \layout {
    \override Staff.TimeSignature.transparent = ##t
    \override Lyrics.LyricText.font-size = #+3
    \override Lyrics.LyricSpace.minimum-distance = #2.0
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
  }
}