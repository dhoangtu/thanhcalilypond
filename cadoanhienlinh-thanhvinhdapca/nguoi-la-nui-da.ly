% Cài đặt chung
\version "2.20.0"
\include "english.ly"

\header {
  title = "Người Là Núi Đá"
  composer = "TV. 17"
  arranger = " "
  tagline = ##f
}

global = {
  \key c \major
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
nhacDiepKhucSop = \relative c'' {
  \override Lyrics.LyricSpace.minimum-distance = #4.0
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  g8  g af af |
  g4 g8 e |
  c2 |
  r4 \tuplet 3/2 { c8 c g' } |
  g4 \tuplet 3/2 { f8 f a } |
  a4 \tuplet 3/2 { g8 g d' } |
  \afterGrace d4 (e8) d d |
  c2 ( |
  c4) r \bar "|."
}

nhacDiepKhucBass = \relative c' {
  \override Lyrics.LyricSpace.minimum-distance = #4.0
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \override NoteHead.font-size = #-2
  \skip 2
  \skip 2
  \skip 2
  r4 \tuplet 3/2 { a8 a e' } |
  e4 \tuplet 3/2 { d8 d f } |
  f4 \tuplet 3/2 { e8 e b' } |
  b4 g8 f |
  e2 ( |
  e4) r
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c'' {
  \set Score.barAlways = ##t
  \set Score.defaultBarType = ""
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  g8 g af af f4 c' g (g) \breathe
  c8 c d e d d (c) a!4 \breathe
  a8 a d c c c (a) g4 \breathe
  f8 af4 \fermata
  c8 d c4 (c) \bar "||"
}

nhacPhienKhucHai = \relative c'' {
  \set Score.barAlways = ##t
  \set Score.defaultBarType = ""
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  g8 g af af c f, g4 \breathe
  c8 c d e \breathe
  a, c g4 f8 f af4 \fermata
  \acciaccatura c8 d c4 \breathe
  c8 a g c c c c d4 \breathe
  c8 e d b a g g4 \bar "||"
}

nhacPhienKhucBa = \relative c'' {
  \set Score.barAlways = ##t
  \set Score.defaultBarType = ""
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  g8 g af4 c8 f, g4 \breathe
  d'8 \afterGrace e (d) a4 d8 \breathe
  \afterGrace b (a!) g4
  d'8 d b4 g8 d' c b c4 \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  \override Lyrics.LyricText.font-series = #'bold
  Con yêu Chúa, Chúa ơi, hết tâm hồn.
  Người là núi đá, Người là núi đá,
  Người là núi đá con nương nhờ.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Con yêu Chúa hết lòng Chúa ơi!
  Người là núi đá con nương nhờ,
  là thành lũy cho con ẩn mình,
  là Đấng giải thoát con.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Tôi ẩn náu nơi Chúa Trời tôi,
  Người là núi đá,
  là khiên mộc, là thành lũy chở che.
  Tôi chỉ cần hô lên: Tôn Vin Chúa,
  là thắng ngay hết mọi địch thù.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Vạn vạn tuế Chúa Trời tôi.
  Muôn chúc tụng Đấng hộ phù
  Tôn Vinh Người là Đấng Cứu Độ tôi.
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
