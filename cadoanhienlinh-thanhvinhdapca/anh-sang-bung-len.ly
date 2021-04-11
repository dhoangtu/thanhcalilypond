% Cài đặt chung
\version "2.20.0"
\include "english.ly"

\header {
  title = "Ánh Sáng Bừng Lên"
  composer = "TV. 96"
  arranger = " "
  tagline = ##f
}

global = {
  \key d \major
  \time 2/4
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
nhacDiepKhucSop= \relative c'' {
  \override Lyrics.LyricSpace.minimum-distance = #4.0
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  a8 a b a |
  fs g a d, |
  e4. g8 |
  fs2 \breathe |
  d8 e fs e |
  b4. cs8 |
  b e cs e |
  d2 ( |
  d4) r \bar "|."
}

nhacDiepKhucBass= \relative c' {
  \override Lyrics.LyricSpace.minimum-distance = #4.0
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \override NoteHead.font-size = #-2
  fs8 fs g fs |
  d d cs b |
  cs4. b8 |
  d2 |
  b8 cs d cs |
  g4. a8 |
  g cs a4 |
  d2 ( |
  d4) r
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c'' {
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  b8 fs a b |
  fs4 fs8 d |
  b4 g'16 g e8 |
  fs2 |
  r4 e8 e |
  cs4. a8 |
  e'4 \acciaccatura e8 fs4 |
  \acciaccatura cs8 d2 \bar "||"
}

nhacPhienKhucHai = \relative c' {
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \partial 4. d8 g a |
  b fs d fs |
  b,2 |
  r4 e8 cs |
  cs4. a8 |
  fs'4 e8 fs |
  d2 \bar "||"
}

nhacPhienKhucBa = \relative c'' {
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \partial 4 a8 a |
  d,8 e d e |
  fs2 |
  e8 a a a |
  gs4b8 gs |
  a2 |
  r4 fs8 g |
  a4 \tuplet 3/2 { d,8 g fs } |
  e4 g8 g |
  fs2 |
  r8 e a a |
  g4 e8 g |
  fs4 e |
  d2 ( |
  e4) r \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  \override Lyrics.LyricText.font-series = #'bold
  Hôm nay chúng ta được ánh sáng bừng lên chiếu soi.
  Vì Chúa đã giáng trần, giáng trần cứu độ chúng ta.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Chúa là Vua hiển trị, hỡi địa cầu, hãy nhảy mừng lên!
  Vui đi nào, ngàn muôn hải đảo.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Trời xanh tuyên bố rằng Người chính trực.
  Khắp mọi dân được thấy vinh hiển Người.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Ánh sáng bừng soi người công chính.
  Niềm hân hoan chiếu rọi kẻ lòng ngay.
  Người hiền đức, nào hãy vui mừng trước Thánh Nhan.
  Tưởng nhứo Thánh Danh mà dâng lời cảm tạ.
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
        \global \stemNeutral \nhacPhienKhucMot
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
        \global \stemNeutral \nhacPhienKhucHai
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
        \global \stemNeutral \nhacPhienKhucBa
      }
    >>
    \new Lyrics \lyricsto verse \loiPhienKhucBa
  >>
}
