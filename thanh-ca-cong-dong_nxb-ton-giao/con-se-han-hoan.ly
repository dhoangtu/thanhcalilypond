% Cài đặt chung
\version "2.20.0"
\include "english.ly"

\header {
  title = "Con Sẽ Hân Hoan"
  composer = "Kim Long"
  tagline = ##f
}

global = {
  \key d \minor
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
  
}

bassChorus = \relative c' {
  f4 e f |
  
}

% Nhạc phiên khúc
verseMusic = \relative c'' {
  a4 a8 (c) a (g) |
  
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
      \new Voice = "verse" {
        \global \stemNeutral \verseMusic
      }
    >>
    \new Lyrics \lyricsto verse \verseOne
    \new Lyrics \lyricsto verse \verseTwo
    \new Lyrics \lyricsto verse \verseThree
  >>
}
