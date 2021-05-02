% Cài đặt chung
\version "2.20.0"
\include "english.ly"

\header {
  title = "Đức Thánh Quân"
  composer = "TV. 92"
  arranger = " "
  tagline = ##f
}

global = {
  \key g \major
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
nhacDiepKhucSop = \relative c'' {
  \override Lyrics.LyricSpace.minimum-distance = #1.7
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  b4 g8 |
  c c b |
  a g r |
  e a g |
  g e fs |
  d4. |
  g8 d' c |
  c a b |
  g4. ( |
  g4) r8 \bar "|."
}

nhacDiepKhucBass = \relative c'' {
  \override Lyrics.LyricSpace.minimum-distance = #1.7
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \override NoteHead.font-size = #-2
  g4 e8 |
  a a g |
  fs d r |
  c fs e |
  e c d |
  b4. |
  e8 b' a |
  a d, d |
  g4. ( |
  g4) r8
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c'' {
  \override Lyrics.LyricSpace.minimum-distance = #2.0
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  b4 g8 |
  c c b |
  a g r |
  e a g |
  g e fs |
  d4. |
  e8 c a' |
  a4. |
  e4 b'8 |
  g4. ( |
  g4) r8 \bar "||"
}

nhacPhienKhucHai = \relative c'' {
  \override Lyrics.LyricSpace.minimum-distance = #2.0
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \partial 8 b8 |
  g b g |
  e4 fs8 |
  d g a |
  b4. |
  c4 a8 |
  c4 d8 |
  e d cs |
  d4. |
  fs,4 g8 |
  a4. |
  e4 fs8 |
  d g a |
  b4. |
  fs8 g a |
  b4 g8 |
  g4. ( |
  g4) r8 \bar "||"
}

nhacPhienKhucBa = \relative c'' {
  \override Lyrics.LyricSpace.minimum-distance = #2.0
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  g4 g8 |
  g4 b8 |
  e, e' cs |
  d4. |
  c4 a8 |
  a4 a8 |
  b a b |
  e,4. |
  e8 g g |
  a e d |
  a'4 fs8 |
  g4. ( |
  g4) r8 \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  \override Lyrics.LyricText.font-series = #'bold
  Chúa là Đức Thánh Quân hiển trị,
  mặc lấy oai phong tựa cẩm bào,
  mặc lấy oai phong tựa cẩm bào.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Chúa là Đức Thánh Quân hiển trị,
  mặc lấy oai phong tựa cẩm bào,
  long cổn cân đai tựa dũng lực.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Chúa củng cố địa cầu vững vàng không lay chuyển.
  Ngai vàng Chúa kiên vững tựa ngàn xưa.
  Ngài hiện hữu tự muôn đời,
  muôn muôn thuở, và mãi mãi đến thiên thu.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Lời Ngài dạy vững bền đáng cậy tin.
  Nơi đền vàng, rực lên toàn thánh thiện,
  triền miên qua hết mọi thờ, hết mọi nơi.
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
