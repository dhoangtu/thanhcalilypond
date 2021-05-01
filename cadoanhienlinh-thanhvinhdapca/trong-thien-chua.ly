% Cài đặt chung
\version "2.20.0"
\include "english.ly"

\header {
  title = "Trong Thiên Chúa"
  composer = "TV. 61"
  arranger = " "
  tagline = ##f
}

global = {
  \key g \major
  \time 3/4
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
  \override Lyrics.LyricSpace.minimum-distance = #1.7
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  b4 d e |
  g2 b,4 |
  d2. |
  d4 e g |
  b2 c4 |
  a2 fs4 |
  g2. \bar "|."
}

nhacDiepKhucBass = \relative c' {
  \override Lyrics.LyricSpace.minimum-distance = #1.7
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \override NoteHead.font-size = #-2
  \skip 2.
  \skip 2.
  \skip 2.
  b4 c d |
  g2 e4 |
  fs2 d4 |
  b2.
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c' {
  \override Lyrics.LyricSpace.minimum-distance = #2.0
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  b4 d e |
  g2 b,4 |
  d2. |
  d4 e g |
  e2 g4 |
  a2 a4 |
  g2. |
  fs2 a4 |
  d,2 e4 |
  b2 e4 |
  g2 \breathe g4 |
  e4 e g |
  a4. a8 g (a) |
  b2. |
  a4 d c |
  b2 a8 g |
  e2 fs4 |
  g2. \bar "||"
}

nhacPhienKhucHai = \relative c' {
  \override Lyrics.LyricSpace.minimum-distance = #2.0
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  b4 d e |
  g2 b,4 |
  d2. |
  b4 e g |
  e2 g4 |
  a2 a4 |
  g2. |
  fs4 d d |
  e2 e4 |
  b2 e4 |
  g2 \breathe g4 |
  e4 e g |
  a4. a8 g (a) |
  b2. |
  a4 d c |
  b2 a8 g |
  e2 fs4 |
  g2. \bar "||"
}

nhacPhienKhucBa = \relative c' {
  \override Lyrics.LyricSpace.minimum-distance = #2.0
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  b2 e4 |
  g2. |
  a4 g b |
  g2 g8 a |
  a2. |
  a4 a d |
  d2 c4 |
  a2 b4 |
  b2. |
  g4 a a |
  b2 b4 |
  a2 b4 |
  b2. |
  a2 b4 |
  d2 c4 |
  a b4. g8 |
  a2. |
  b2 a4 |
  fs2 a4 |
  fs d4. g8 |
  g2. \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  \override Lyrics.LyricText.font-series = #'bold
  Chỉ trong Thiên Chúa mà thôi.
  Này hồn tôi hãy nghỉ ngơi bằng yên.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Chỉ trong Thiên Chúa mà thôi.
  Hồn tôi mới được nghỉ ngơi yên hàn.
  Ơn cứu độ do Người mà đến.
  Duy Người là núi đá độ trì tôi.
  Thành lũy chở che, tôi chẳng hề nao núng.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Chỉ trong Thiên Chúa mà thôi,
  hồn tôi mới được nghỉ ngơi yên hàn.
  Hy vọng của tôi do Người mà có.
  Duy Người là núi đá độ trì tôi.
  Thành lũy chở che, tôi chẳng hề nao núng.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Nhờ Thiên Chúa, tôi được cứu độ và vinh quang.
  Người là núi đá vững vàng cho tôi.
  Ở nơi Thiên Chúa tôi hằng nương thân.
  Toàn dân hỡi luôn cậy trông vào Chúa.
  Trước mặt Người, hãy thổ lộ tâm can.
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
