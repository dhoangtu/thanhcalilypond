% Cài đặt chung
\version "2.20.0"
\include "english.ly"

\header {
  title = "Xin Chúa Giữ Gìn"
  composer = "TV. 130"
  arranger = " "
  tagline = ##f
}

global = {
  \key d \major
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
  d4 fs a |
  d2 cs8 (b) |
  a2 r4 |
  fs4 d e |
  g2 fs8 (e) |
  a,2 e'8 (fs) |
  d2. \bar "|."
}

nhacDiepKhucBass = \relative c'' {
  \override Lyrics.LyricSpace.minimum-distance = #1.7
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \override NoteHead.font-size = #-2
  \skip 2.
  \skip 2.
  \skip 2.
  a4 fs g |
  cs2 a4 |
  e2 g4 |
  fs2.
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c' {
  \override Lyrics.LyricSpace.minimum-distance = #2.0
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  d4 fs a |
  bf2 g4 |
  a2. |
  bf4 a g |
  d'2 cs4 |
  a2 e'4 |
  d2. \bar "||"
}

nhacPhienKhucHai = \relative c' {
  \override Lyrics.LyricSpace.minimum-distance = #2.0
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  d2 fs4 |
  cs2 e4 |
  b a4. fs'8 |
  fs2. |
  g2 fs4 |
  e2 cs4 |
  b' b4. gs8 |
  a2. |
  d,4 fs a |
  d2 cs8 (b) |
  a2. |
  fs4 d e |
  b2 a4 |
  e'2 e4 |
  d2. \bar "||"
}

nhacPhienKhucBa = \relative c'' {
  \override Lyrics.LyricSpace.minimum-distance = #2.0
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  bf2 a4 |
  bf4 bf g |
  g2 d4 |
  a'2. |
  c2 f,4 |
  bf2 d,4 |
  g2 ef4 |
  d2. |
  d4 g bf |
  c2 r8 ef |
  d2. |
  b!4 g a |
  c2 b!8 (a) |
  d,2 a'8 (b!) |
  g2. \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  \override Lyrics.LyricText.font-series = #'bold
  Hồn con xin Chúa giữ gìn.
  Sống kề bên Chúa an bình thảnh thơi.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Lòng con chẳng dám tự cao,
  mắt con chẳng dám tự hào Chúa ơi.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Đường cao vọng chẳng đời nào bước đến.
  Việc diệu kỳ vượt sức chẳng cầu mong.
  Hồn con, con giữ trước sau,
  an hòa thinh lặng là câu thanh bình.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Bé no sữa nép mình bên lòng mẹ,
  ấy hồn con lặng lẽ an vui.
  Cậy trông vào Chúa, Chúa ơi,
  bây giờ đến mãi muôn đời muôn đời.
}


% Dàn trang
\score {
  \new ChoirStaff <<
    \new Staff = chorus \with {
        \consists "Merge_rests_engraver"
      }
      <<
      \new Voice = "sopranos" {
        \global \stemDown \nhacDiepKhucSop
      }
      \new Voice = "basses" {
        \voiceTwo \global \stemUp \nhacDiepKhucBass
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
        \key bf \major \time 3/4 \stemNeutral \nhacPhienKhucBa
      }
    >>
    \new Lyrics \lyricsto verse \loiPhienKhucBa
  >>
}
