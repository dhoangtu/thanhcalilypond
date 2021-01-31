% Cài đặt chung
\version "2.20.0"
\include "english.ly"

\header {
  title = "Con Sẽ Hân Hoan"
  composer = "Kim Long"
  tagline = ##f
}

global = {
  \key f \major
  \time 3/4
}

\paper {
  #(set-paper-size "a4")
  top-margin = 15\mm
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
sopChorus = \relative c'' {
  a4 c a |
  g2 a4 |
  f2 g4 |
  a2 r4 |
  r2 r4 |
  r2 c,4 |
  a' a a |
  a2 c4 |
  f,2 g4 |
  a2 a4 |
  bf4. bf8 a4 |
  g2 r4 |
  r2 r4 |
  r2 c4 |
  a4. bf8 d4 |
  c2 a4 |
  f4. g8 bf4 |
  a2 g4 |
  f2. \bar "|."
}

bassChorus = \relative c' {
  f4 e f |
  c2 f4 |
  d2 c4 |
  f2 f4 |
  d2 g8 (f) |
  c2 c4 |
  f f f |
  f2 e4 |
  d2 c4 |
  f2 f4 |
  g4. g8 f4 |
  c2 c4 |
  f2 a8 (g) |
  c2 a4 |
  f4. g8 bf4 |
  a2 f4 |
  d4. e8 g4 |
  f4 (c) bf |
  a2.
}

% Nhạc phiên khúc
verseMusic = \relative c'' {
  \set Score.currentBarNumber = #20
  a4 a8 (c) a (g) |
  d4. (c8) d8 (f) |
  g2. |
  g4. g8 f (g) |
  c2 d8 (c) |
  a2. |
  a4 a a |
  r8 a8 f4 g |
  d2. |
  d4 (f) d8 (c) |
  a4 c (d8) f |
  f2. \bar "||"
}

% Lời điệp khúc
choruslyric = \lyricmode {
  \set stanza = #"ĐK:"
  Con sẽ hân hoan tiến vào cung thánh.
  Tới gần Chúa Trời tuổi thanh xuân reo vang khúc nhạc êm ái
  vương ánh sáng nơi nơi.
  Gần bàn thờ Chúa tâm hồn con thảnh thơi
  trong nguồn vui thánh ân muôn đời.
}

% Lời phiên khúc
verseOne = \lyricmode {
  \set stanza = #"1."
  Ôi nói sao được niềm vui khi lên đền Thánh Chúa Trời.
  Gia -- liêm đây thôi dừng chân lại. Đến nơi rồi hồn ta ơi.
}

verseTwo = \lyricmode {
  \set stanza = #"2."
  Ôi Thánh đô đầy quang vinh vang vang lời chúc thái bình.
  Đức Chúa đây chính nguồn hoan lạc. Hãy vui mừng hồn ta ơi.
}

verseThree = \lyricmode {
  \set stanza = #"3."
  Đây chốn sum vầy yên vui mong sao được sống suốt đời.
  Bao anh em chung lời ca ngợi. Hát lên nào hồn ta ơi.
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 6. Bố trí
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\score {
  \new ChoirStaff <<
    \new Staff = chorus <<
      \new Voice = "sopranos" {
        \voiceOne \global \stemUp \sopChorus
      }
      \new Voice = "basses" {
        \voiceTwo \global \stemDown \bassChorus
      }
    >>
    \new Lyrics = basses
    \context Lyrics = basses \lyricsto basses \choruslyric
  >>
}

\score {
  \new ChoirStaff <<
    \new Staff = verses <<
      \override Staff.TimeSignature.transparent = ##t
      \new Voice = "verse" {
        \global \stemNeutral \verseMusic
      }
    >>
    \new Lyrics \lyricsto verse \verseOne
    \new Lyrics \lyricsto verse \verseTwo
    \new Lyrics \lyricsto verse \verseThree
  >>
}
