% Cài đặt chung
\version "2.20.0"
\include "english.ly"

\header {
  title = "Rao Giảng Tin Mừng"
  composer = "TV. 116"
  arranger = " "
  tagline = ##f
}

global = {
  \key g \major
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
  \override Lyrics.LyricSpace.minimum-distance = #1.7
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \partial 8 d8 |
  b b a b |
  g4. b8 |
  a g e g |
  d4 a'8 b |
  g2 ( |
  g4) r \bar "|."
}

nhacDiepKhucBass = \relative c' {
  \override Lyrics.LyricSpace.minimum-distance = #1.7
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \override NoteHead.font-size = #-2
  \partial 8 d8 
  g g e g |
  d4. d8 |
  e d c d |
  b4 c8 d |
  b2 ( |
  b4) r
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c'' {
  \override Lyrics.LyricSpace.minimum-distance = #2.0
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \partial 4 c8 c |
  d4 \breathe a8 b |
  g4 \tuplet 3/2 { e8 g a } |
  b2 |
  r4 d,8 a' |
  a4 \tuplet 3/2 { a8 fs e } |
  d4. e8 |
  d c' b a |
  g2 ( |
  g4) r \bar "||"
}

nhacPhienKhucHai = \relative c' {
  \override Lyrics.LyricSpace.minimum-distance = #2.0
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \partial 8 e16 e |
  c'8 b b e, |
  g2 |
  r8 d16 d d8 a' |
  a a g a |
  b4. e,16 c' |
  b8 e, a fs |
  d4. a'8 |
  a4 g8 e |
  g2 ( |
  g4) r \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  \override Lyrics.LyricText.font-series = #'bold
  Hãy đi rao giảng tin mừng.
  Hãy đi rao giảng tin mừng khắp thế gian.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Muôn nước hỡi, nào ca ngợi, nào ca ngợi Chúa.
  Ngàn dân ơi, hãy chúc tụng Người,
  chúc tụng Thánh Danh muôn đời.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Vì tình Chúa thương ta bền vững.
  Vì tình Người yêu ta không bờ không bến.
  Lòng tín trung Người mãi muôn đời, mãi mãi muôn đời sau.
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
