% Cài đặt chung
\version "2.20.0"
\include "english.ly"

\header {
  title = "Lên Đền Thánh"
  composer = "Thành Tâm"
  tagline = ##f
}

global = {
  \key a \major
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
sopChorus = \relative c' {
  \partial 4 cs8 d |
  e4 e8 ds |
  e4 fs |
  e4. d8 |
  b4 b8 cs |
  d4 d8 cs |
  b4 e |
  cs2 ( |
  cs4) cs8 d |
  e4 e8 ds |
  e4 a8. (b16) |
  b4. a8 |
  fs r fs gs |
  e4 gs |
  b a8 gs |
  a2 |
  r4 cs8 cs |
  cs4. b8 |
  
}

bassChorus = \relative c'' {
  \skip 1.
  \skip 1.
  \skip 1.
  \skip 1.
  \skip 1.
  \skip 4
  r4 e8 e |
  e4. d8 |
  
}

% Nhạc phiên khúc
verseMusic = \relative c' {
  \set Score.currentBarNumber = #15
  
}

% Lời điệp khúc
choruslyric = \lyricmode {
  \set stanza = #"ĐK:"
  Từ muôn phương ta về đây sánh vai lên đường,
  đường đưa ta đi lên đền Chúa ta.
  Lòng hân hoan ta hòa chung tiếng hát nhịp nhàng,
  vui hát mừng danh Chúa cứu độ ta.
  Tiến tiến bước lên đền đền thánh của Người.
  Cất tiếng hát vui lên dân thánh của Người.
  Tiến tiến bước loan truyền hồng ân Thiên Chúa Trời,
  ta hát mừng tình thiên thu Chúa ta.
}

% Lời phiên khúc
verseOne = \lyricmode {
  \set stanza = #"1."
  Vui mừng khi người ta bảo tôi:
  Ta về thăm nhà Cha chúng ta.
  Một ngày trong nhà Cha dấu yêu,
  sướng vui thay hơn trăm ngày ở xa quê nhà.
}

verseTwo = \lyricmode {
  \set stanza = #"2."
  Như ngày nào đoàn dân Chúa xưa,
  băng rừng sâu vượt qua biển khơi.
  Lên đường đi hồi hương thánh đô.
  Chúng ta đi đi lên đền Chúa ta thân yêu.
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 6. Bố trí
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\score {
  \new ChoirStaff <<
    \new Staff = chorus <<
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
  >>
}
