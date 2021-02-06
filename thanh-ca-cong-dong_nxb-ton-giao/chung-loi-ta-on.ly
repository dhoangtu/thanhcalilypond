% Cài đặt chung
\version "2.20.0"
\include "english.ly"

\header {
  title = "Chung Lời Tạ Ơn"
  composer = "Nguyễn Duy"
  tagline = ##f
}

global = {
  \key g \major
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

% Nhạc điệp khúc
sopChorus = \relative c'' {
  \partial 4 g8 g |
  g8. a16 g8 b, |
  d4 a'8 a |
  a8. b16 c8 a |
  b4 g8 g |
  e'4 d |
  a8 b c4 |
  fs, a |
  g2 ( |
  g4) \bar "|."
}

bassChorus = \relative c'' {
  \partial 4 g8 g |
  g8. a16 g8 b, |
  d4 a'8 a |
  a8. b16 c8 a |
  b4 g8 g |
  c4 b |
  fs8 g e4 |
  d c |
  b2 ( |
  b4)
}

% Nhạc phiên khúc
verseMusic = \relative c' {
  \set Score.currentBarNumber = #10
  \partial 4 d8 d |
  ef8. d16 c8 ef |
  d4 g8 a |
  b b b16 (a) g8 |
  a4 b8 b |
  c8. b16 a8 c |
  b4 a8 b |
  d, g fs a |
  g2 ( |
  g4) \bar "||"
}

% Lời điệp khúc
choruslyric = \lyricmode {
  \set stanza = #"ĐK:"
  Trong hân hoan chúng con về đây,
  mang tin yêu mơ ước nồng say,
  cùng hợp tiếng ca
  tạ ơn Chúa lời thiết tha.
}

% Lời phiên khúc
verseOne = \lyricmode {
  \set stanza = #"1."
  Bao năm tháng con hằng ước mơ
  về bên Chúa hát khúc tạ ơn.
  Ôi giây phút chan hòa thánh ân,
  trong cõi lòng dâng tràn ý xuân.
}

verseTwo = \lyricmode {
  \set stanza = #"2."
  Như nai khát mong nguồn nước trong
  hồn con khát chính Chúa tình thương.
  Con vui sướng trở về thánh cung,
  cho cõi lòng vuông tròn ước mong.
}

verseThree = \lyricmode {
  \set stanza = #"3."
  Xin hiệp nhất muôn người chúng con
  tình yêu Chúa nối kết đoàn con.
  Xin dâng Chúa trong một khúc ca,
  lời cảm tạ muôn đời thiết tha.
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
    \context Lyrics = basses \lyricsto sopranos \choruslyric
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
    \new Lyrics \with \printItalic \lyricsto verse \verseTwo
    \new Lyrics \lyricsto verse \verseThree
  >>
}
