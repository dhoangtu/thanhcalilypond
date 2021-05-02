% Cài đặt chung
\version "2.20.0"
\include "english.ly"

\header {
  title = "Vì Yêu Thương"
  composer = "TV. 67"
  arranger = " "
  tagline = ##f
}

global = {
  \key c \major
  \time 3/8
}

\paper {
  #(set-paper-size "a4")
  top-margin = 20\mm
  bottom-margin = 15\mm
  left-margin = 20\mm
  right-margin = 20\mm
  indent = #0
  #(define fonts
	 (make-pango-font-tree "Liberation Serif"
	 		       "Liberation Serif"
			       "Liberation Serif"
			       (/ 20 20)))
}

% Nhạc điệp khúc
nhacDiepKhucSop = \relative c' {
  \override Lyrics.LyricSpace.minimum-distance = #4.0
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  e4 g8 |
  c4 d8 |
  e,4 g8 |
  a4. |
  d,4 e8 |
  f4 g8 |
  g a e |
  d4 g8 |
  c,4. ( |
  c4) r8 \bar "|."
}

nhacDiepKhucBass = \relative c' {
  \override Lyrics.LyricSpace.minimum-distance = #4.0
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \override NoteHead.font-size = #-2
  c4 e8 |
  g4 b8 |
  c,4 e8 |
  f4. |
  b,4 c8 |
  d4 e8 |
  e f c |
  b4 b8 |
  c4. ( |
  c4) r8
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c'' {
  \set Score.barAlways = ##t
  \set Score.defaultBarType = ""
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  g8 f e g c4 \breathe
  c8 b b c4 b8 c d a b g4
  f8 g e c d4 (d) \breathe
  g8 g e g c4 b8 c e c g4
  b8 g g b c4 (c) \bar "||"
}

nhacPhienKhucHai = \relative c'' {
  \set Score.barAlways = ##t
  \set Score.defaultBarType = ""
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  g8 g e g c4
  c8 b c d g,4 \breathe
  f8 e g a d, g a e4 (e) \breathe
  e8 g c c b d b g4 \breathe
  a8 g g4 g8 g a b c4 (c) \bar "||"
}

nhacPhienKhucBa = \relative c' {
  \set Score.barAlways = ##t
  \set Score.defaultBarType = ""
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  e8 g c4
  b8 d c a g4 \breathe
  f8 d d e e c \acciaccatura c8 d4
  fs8 fs a g4 (g) \breathe
  g8 e g4 \tuplet 3/2 { c,8 c d } e4 \breathe
  \tuplet 3/2 { f8 e f } d4 d8 d a'4 \breathe
  a8 a b c d e c4 (c) \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  \override Lyrics.LyricText.font-series = #'bold
  Vì yêu thương, Chúa từng dọn sẵn,
  từng dọn sẵn nơi an trú cho kẻ khốn cùng.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Hết những người công chính múa nhảy mừng vui,
  mừng vui trước mặt Chúa Trời,
  niềm hoan lạc trào dâng.
  Hãy hát mừng Thiên Chúa đàn ca kính danh Người,
  Danh Người là Đức Chúa.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Cha nuôi dưỡng cô nhi, Đấng đỡ bênh quả phụ
  Chính là Thiên Chúa ngự nơi Thánh Điện.
  Người cô thân Chúa cho cửa cho nhà.
  Kẻ tù đày được tự do hạnh phúc.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Lạy Thiên Chúa, Ngài đổ mưa ân hậu.
  Gia nghiệp Ngài tiêu hao mòn mỏi Ngài bổ sức cho.
  Nơi đàn chiên Ngài được an trú
  Chính là nơi Ngài từng dọn sẵn,
  vì lòng yêu thương kẻ khốn cùng.
}


% Dàn trang
\score {
  \new ChoirStaff <<
    \new Staff = chorus \with {
        \consists "Merge_rests_engraver"
      }
      <<
      \new Voice = "sopranos" {
        \voiceOne \global \stemUp \nhacDiepKhucSop
      }
      \new Voice = "basses" {
        \voiceTwo \global \stemDown \nhacDiepKhucBass
      }
    >>
    \new Lyrics = basses
    \context Lyrics = basses \lyricsto sopranos \loiDiepKhuc
  >>
}

\score {
  \new ChoirStaff <<
    \new Staff = verses <<
      \override Staff.TimeSignature.transparent = ##t
      \new Voice = "verse" {
        \key c \major \stemNeutral \nhacPhienKhucMot
      }
    >>
    \new Lyrics \lyricsto verse \loiPhienKhucMot
  >>
}

\score {
  \new ChoirStaff <<
    \new Staff = verses <<
      \override Staff.TimeSignature.transparent = ##t
      \new Voice = "verse" {
        \key c \major \stemNeutral \nhacPhienKhucHai
      }
    >>
    \new Lyrics \lyricsto verse \loiPhienKhucHai
  >>
}

\score {
  \new ChoirStaff <<
    \new Staff = verses <<
      \override Staff.TimeSignature.transparent = ##t
      \new Voice = "verse" {
        \key c \major \stemNeutral \nhacPhienKhucBa
      }
    >>
    \new Lyrics \lyricsto verse \loiPhienKhucBa
  >>
}
