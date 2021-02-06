% Cài đặt chung
\version "2.20.0"
\include "english.ly"

\header {
  title = "Đi Về Nhà Chúa"
  composer = ""
  tagline = ##f
}

global = {
  \key bf \major
  \time 2/4
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

printItalic = { \override LyricText.font-shape = #'italic }

% Nhạc phiên khúc
verseMusic = \relative c'' {
  \partial 4. g8 d g |
  bf4 bf |
  a g |
  d2 ( |
  d8) g bf c |
  d4 c |
  c ef |
  d2 ( |
  d8) c c d |
  c4 g |
  bf a |
  a2 ( |
  a8) d bf a |
  a4 c |
  bf a |
  g2 ( |
  g4)
}

% Nhạc điệp khúc
sopChorus = \relative c'' {
  \set Score.currentBarNumber = #17
  \partial 4 b!8 b |
  
  \set Staff.printKeyCancellation = ##f
  \key g \major
  
  g4 g |
  a c |
  b2 ( |
  b8) a a a |
  a4 fs |
  g e |
  d2 _( |
  d4) e8 e |
  c4 e |
  g a |
  b2 ( |
  b8) a a a |
  a4 fs |
  a d, |
  g2 \bar "|."
}

bassChorus = \relative c'' {
  \override NoteHead.font-size = #-2
  \partial 4 d8 d |
  
  \set Staff.printKeyCancellation = ##f
  \key g \major
  
  b4 b |
  c e |
  d2 ( |
  e8) c c c |
  c4 a |
  d c |
  b2 ^( |
  b4) b8 b |
  g4 g |
  b c |
  d2 ( |
  d8) c c c |
  c4 a |
  c a |
  b2
}

% Lời phiên khúc
verseOne = \lyricmode {
  \set stanza = #"1."
  Đi về nhà Chúa sướng vui chan hòa.
  Được gần bên Chúa Cha ta dấu yêu.
  Dâng lên tiếng ca lời hát ngây thơ.
  Hợp với anh em hát khen danh Ngài.
}

verseTwo = \lyricmode {
  \set stanza = #"2."
  Đi về nhà Chúa chúng con hy vọng.
  Thành đô Thiên quốc, quê hương ngóng trông.
  Nghe vang tiếng Cha đã hứa khi xưa.
  Hạnh phúc cho ai trở nên thơ dại.
}

% Lời điệp khúc
choruslyric = \lyricmode {
  \set stanza = #"ĐK:"
  Ta tiến về thành đô Chúa ta.
  Jê -- ru -- sa -- lem vùng đất hiền hòa.
  Ta tiến về thành đô Thiên quốc,
  quê hương thiên thu vùng đất tuổi thơ.
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 6. Bố trí
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\score {
  \new ChoirStaff <<
    \new Staff = verses <<
      \new Voice = "verse" {
        \global \stemNeutral \verseMusic
      }
    >>
    \new Lyrics \lyricsto verse \verseOne
    \new Lyrics \with \printItalic \lyricsto verse \verseTwo
  >>
}

\score {
  \new ChoirStaff <<
    \new Staff = chorus <<
      \override Staff.TimeSignature.transparent = ##t
      \new Voice = "sopranos" {
        \voiceOne \global \stemDown \sopChorus
      }
      \new Voice = "basses" {
        \voiceTwo \global \stemUp \bassChorus
      }
    >>
    \new Lyrics = basses
    \context Lyrics = basses \lyricsto sopranos \choruslyric
  >>
}

