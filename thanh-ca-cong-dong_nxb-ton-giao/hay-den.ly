% Cài đặt chung
\version "2.20.0"
\include "english.ly"

\header {
  title = "Hãy Đến"
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

printItalic = { \override LyricText.font-shape = #'italic }

% Nhạc điệp khúc
sopChorus = \relative c'' {
  \partial 8 e8 |
  e4 c8 c |
  d4. c8 |
  a bf d d |
  c4 r8 c, |
  c a' a g |
  g4. f8 |
  f d' d c |
  c4 \breathe c |
  g4. bf8 |
  a4 r8 c |
  d4 e |
  f2 ( \bar "|."
  e4)
}

bassChorus = \relative c'' {
  \partial 8 a8 |
  c8 (bf) a a |
  bf4. a8 |
  f g bf bf |
  a4 r8 c,8 |
  c f f f |
  e4. f8 |
  f bf bf bf |
  a4 f |
  e4. d8 |
  f4 r8 a |
  bf4 g |
  a2 (|
  a4)
}

% Nhạc phiên khúc
verseMusic = \relative c'' {
  \set Score.currentBarNumber = #14
  \partial 4 a8 (c) |
  f,4. f8 |
  d' d d \acciaccatura d f |
  c4 \breathe c8 (d) |
  c4. c8 |
  g c a g |
  f2 ( |
  f4) d8 (f) |
  g4. a8 |
  a g a c |
  g4 \breathe f8 (g) |
  d4. f16 (g) |
  a8 c a g |
  f2 ( |
  f4) r8 \bar "||"
}

% Lời điệp khúc
choruslyric = \lyricmode {
  \set stanza = #"ĐK:"
  Hãy đến tung hô Chúa
  reo mừng Đấng cứu thoát ta.
  Nào cùng đến trước Thiên Nhan,
  nào cùng đến trước Thiên Nhan
  dâng lời cảm tạ và tung hô Chúa.
}

% Lời phiên khúc
verseOne = \lyricmode {
  \set stanza = #"1."
  Chúa là nguồn quang minh tâm trí con
  sáng soi trên đường thế gian mịt mùng.
  Dìu con tiến bước về nơi ước mong
  dẫu ngàn nguy khó rắc gieo trên đường.
}

verseTwo = \lyricmode {
  \set stanza = #"2."
  Tiếng lòng giờ đây vang lên thiết tha
  ngát thơm như làn khói hương cao vời.
  Cùng chung với đất trời muôn tiếng ca
  chúc tụng Danh Chúa đến muôn muôn đời.
}

verseThree = \lyricmode {
  \set stanza = #"3."
  Hãy vào cùng khiêm cung dâng tiến lên
  tấm thân với lòng mến yêu chân thành.
  Dù cho sóng gió tràn lan bốn bên
  vững niềm tin kính Chúa luôn nhân lành.
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 6. Bố trí
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\score {
  \new ChoirStaff <<
    \new Staff = chorus \with {
        \consists "Merge_rests_engraver"
      }
      <<
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
