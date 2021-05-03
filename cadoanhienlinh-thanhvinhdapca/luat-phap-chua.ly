% Cài đặt chung
\version "2.20.0"
\include "english.ly"

\header {
  title = "Luật Pháp Chúa"
  composer = "TV. 118"
  arranger = " "
  tagline = ##f
}

global = {
  \key f \major
  \time 2/2
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
  \partial 2 e4 f |
  d2 d4 (f) |
  a2 c4. c8 |
  a _(c) d4 c2 |
  bf4. bf8 g4 e |
  f1 \bar "|."
}

nhacDiepKhucBass = \relative c' {
  \override Lyrics.LyricSpace.minimum-distance = #1.7
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \override NoteHead.font-size = #-2
  \partial 2 e4 f |
  d2 d4 (f) |
  f2 a4. a8 |
  f ^(g) bf4 a2 |
  g4. g8 e4 c
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c' {
  \override Lyrics.LyricSpace.minimum-distance = #2.0
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  f4 e8 d g4 a8 g |
  c2 c4. bf8 |
  d4 c bf g |
  g2 \breathe a4. g16 (a) |
  c4 a \acciaccatura g8 bf4 g8 (e) |
  f1 \bar "||"
}

nhacPhienKhucHai = \relative c' {
  \override Lyrics.LyricSpace.minimum-distance = #2.0
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \partial 2 f4. e8 |
  c4 f f g |
  a2 \breathe g4. g8 |
  e4 c g' g |
  f2 \breathe f4. e8 |
  d4 g g a |
  c2 \breathe bf4. d8 |
  a4 g c g |
  f1 \bar "||"
}

nhacPhienKhucBa = \relative c' {
  \override Lyrics.LyricSpace.minimum-distance = #2.0
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \partial 2 f4. e8 |
  d4 c f g |
  a2 \breathe g4. e8 |
  c4 g' bf e, |
  f2 \breathe f4. e8 |
  d4 g g a |
  c2 \breathe bf4. c8 |
  g4 bf \acciaccatura c8 d4 g,8 (e) |
  f1 \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  \override Lyrics.LyricText.font-series = #'bold
  Luật pháp Ngài, lạy Chúa,
  Con yêu chuộng biết bao,
  con yêu chuộng dường bao.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Gia nghiệp đời con chính là Chúa,
  con đã hứa tuân giữ lời Ngài.
  Con đã hứa tuân giữ lời Ngài.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Huấn lệnh Ngài con yêu con quý,
  hơn cả bạc vàng muôn muôn triệu.
  Huấn lệnh Ngài con luôn thẳng bước.
  Lòng ghét mọi đường lối gian tà.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Xin Chúa dủ tình thương an ủi.
  Theo lời Ngài hứa với bề tôi.
  Xin chạnh lòng thương cho được sống.
  Vì ocn hằng yêu thích luật Ngài.
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