% Cài đặt chung
\version "2.20.0"
\include "english.ly"

\header {
  title = "Con Hân Hoan"
  composer = "Kim Long"
  tagline = ##f
}

global = {
  \key f \major
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

% Nhạc điệp khúc
sopChorus = \relative c'' {
  c4 c8 c |
  d4 c |
  a4. bf8 |
  c4 a8 (c) |
  f,4. g8 |
  c, c a' a |
  a2 |
  c4 c8 c |
  d4 c |
  a4. bf8 |
  c4 a8 (c) |
  f,4. g8 |
  c,8 bf' a g |
  f2 \bar "|."
}

bassChorus = \relative c'' {
  a4 a8 a |
  bf4 a |
  f4. g8 |
  a4 f8 (e) |
  d4. c8 |
  a a c d |
  f2 |
  a4 a8 a |
  bf4 a |
  f4. g8 |
  a4 f8 (e) |
  d4. c8 |
  a d c bf |
  a2
}

% Nhạc phiên khúc
verseMusic = \relative c' {
  \set Score.currentBarNumber = #15
  c4 d16 (g d c) |
  f2 |
  g8 a g f |
  c4 g'8 f |
  d f d c |
  a'2 |
  g8 g a g |
  f4 g8 f |
  d f d c |
  f2 \bar "||"
}

% Lời điệp khúc
choruslyric = \lyricmode {
  \set stanza = #"ĐK:"
  Con hân hoan bước lên bàn thờ Chúa,
  Chúa là hoan lạc tuổi xuân xanh con.
  Con nâng muôn phím tơ ngợi khen Chúa
  tiếng lòng rung nhịp với muôn tâm hồn.
}

% Lời phiên khúc
verseOne = \lyricmode {
  \set stanza = #"1."
  Vào thánh cung dâng tiến hương nguyện cầu
  ngát bay tỏa trước ngai tòa Chúa.
  Tâm tư sẽ reo mừng hướng lên bàn thánh trong niềm vui.
}

verseTwo = \lyricmode {
  \set stanza = #"2."
  Hồn ta ơi sao đớn đau tơi bời hãy tín nhiệm sức mạnh của Chúa.
  Sao xao xuyến băn khoăn Chúa chính là suối mạch ủi an.
}

verseThree = \lyricmode {
  \set stanza = #"3."
  Lạy Chúa_Trời con sao để con u hoài để kẻ thù ác tâm dày xéo.
  Xin thương cứu giúp con thát tay bọn bất trung tà tâm.
}

verseFour = \lyricmode {
  \set stanza = #"4."
  Cầu Chúa thương soi ánh quang huy hoàng dẫn đưa cont ới cung điện Chúa.
  Con nâng phím tơ vàn tán dương lòng Chúa bao tình thương.
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
    \new Lyrics \lyricsto verse \verseTwo
    \new Lyrics \lyricsto verse \verseThree
    \new Lyrics \lyricsto verse \verseFour
  >>
}
