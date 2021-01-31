% Cài đặt chung
\version "2.20.0"
\include "english.ly"

\header {
  title = "Lời Nguyện Đầu Tiên"
  composer = "Trung Chính"
  tagline = ##f
}

global = {
  \key d \minor
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
  \partial 4 \tuplet 3/2 { d,8 d d } |
  f4 \tuplet 3/2 { g8 g g } |
  a4 \tuplet 3/2 { g8 a f } |
  d4 \tuplet 3/2 { d8 e c } |
  a4 \tuplet 3/2 { d8 f d } |
  e2 ( |
  e4) \tuplet 3/2 { d8 d d } |
  f4 \tuplet 3/2 { g8 g g } |
  a4 \tuplet 3/2 { g8 a f } |
  d4 \tuplet 3/2 { d8 e c } |
  a4 \tuplet 3/2 { g'8 f e } |
  d2 ( |
  e4) r8.
}

% Nhạc điệp khúc
sopChorus = \relative c'' {
  \set Score.currentBarNumber = #13
  \partial 16 a16 |
  \tuplet 3/2 { a8 a a } c8. c16 |
  \tuplet 3/2 { c8 a c } d8. a16 |
  \tuplet 3/2 { d8 d a } f8. f16 |
  \tuplet 3/2 { g8 a f } g4 ( |
  g) \tuplet 3/2 { a8 \fermata a \fermata c \fermata } |
  d2 \bar "|."
}

bassChorus = \relative c'' {
  \partial 16 a16 |
  \tuplet 3/2 { a8 a a } g8. g16 |
  \tuplet 3/2 { g8 f g } a8. f16 |
  \tuplet 3/2 { a8 a f } d8. d16 |
  \tuplet 3/2 { e8 f d } e4 ( |
  e) \tuplet 3/2 { f8 f g } |
  f2
}

% Lời phiên khúc
verseOne = \lyricmode {
  \set stanza = #"1."
  Lời nguyện đầu tiên con dâng lên Chúa khi ánh dương về
  niềm tin tràn trề thành kính cầu xin.
  Lời nguyện đầu tiên con dâng lên Chúa khi nắng tươi hồng
  dâng Chúa cõi lòng, Chúa thương đoái nhìn.
}

verseTwo = \lyricmode {
  \set stanza = #"2."
  Lời nguyện đầu tiên con dâng lên Chúa
  khi đến nhà thờ bên ánh đèn mờ này Chúa ngự đây.
  Lời nguyện đầu tiên con dâng lên Chúa
  khi đến thánh đường sau mỗi đêm dài mến thương vơi đầy.
}

verseThree = \lyricmode {
  \set stanza = #"3."
  Lời nguyện đầu tiên khi con cất bước đi đến học đường
  đi tới nương đồng học khó cày sâu.
  Lời nguyện đầu tiên khi con vui bước
  đi đến phố phường đi tới thôn làng ngước lên kêu cầu.
}

% Lời điệp khúc
choruslyric = \lyricmode {
  \set stanza = #"ĐK:"
  Lời nguyện cầu đầu tiên khi con vừa thức giấc
  xin với hết tâm hồn là cho suốt đời con trọn niềm yêu Chúa.
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
    \new Lyrics \lyricsto verse \verseThree
  >>
}

\score {
  \new ChoirStaff <<
    \new Staff = chorus <<
      \override Staff.TimeSignature.transparent = ##t
      \new Voice = "sopranos" {
        \voiceOne \global \stemUp \sopChorus
      }
      \new Voice = "basses" {
        \voiceTwo \global \stemDown \bassChorus
      }
    >>
    \new Lyrics = basses
    \context Lyrics = basses \lyricsto sopranos \choruslyric
  >>
}

