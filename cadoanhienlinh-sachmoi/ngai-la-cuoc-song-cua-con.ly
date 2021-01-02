\version "2.18.2"
\include "english.ly"


\header {
  title = "Ngài Là Cuộc Sống Của Con"
  composer = "Nhạc: P.Sequeri"
  opus = "Hòa âm: Ngọc Kôn"
  arranger = "Lời Việt: Thanh Lâm"
  tagline = ##f
}

globalSettings = {
  \set Score.barNumberVisibility = #all-bar-numbers-visible
  \key g \major
  \time 4/4
}

verseSettings = {
  \phrasingSlurDashed
}

\paper {
  #(set-paper-size "a4")
  %top-margin = 15\mm
  %bottom-margin = 15\mm
  left-margin = 20\mm
  right-margin = 20\mm
  print-page-number = #f
  indent = #0
  #(define fonts
	 (make-pango-font-tree "Liberation Serif"
	 		       "Liberation Serif"
			       "Liberation Serif"
			       (/ 20 20)))
  page-count = #1
}

printItalic = \with {
  \override LyricText.font-shape = #'italic
}

% Soprano music
musicSoprano = \relative c' {
  e8 e e fs g4 g |
  fs8 g fs d b4 b |
  e8 e e fs g4 g |
  fs8 g a c b2 |
  c8 b c e, e (fs) fs4 |
  b8 a b d, e2 |
  e8 fs g e fs g a fs |
  g a b c b2 |
  c8 b c e, e fs fs4 |
  b8 a b d, e2 |
  e8 fs g e fs g fs4 |
  e4 e2 r4 \bar "|."
}

% Alto music
musicAlto = \relative c' {
  b8 b e ds e4 e |
  d8 d d a g4 g |
  b8 b e ds e4 e |
  d8 d d fs g2 |
  fs8 g e d cs (d) d4 |
  d8 d d b c2 |
  e8 ds e b fs' e fs c |
  g' fs g fs g2 |
  fs8 g e d cs d d4 |
  d8 d d b c2 |
  e8 ds e c c b b (a) |
  a4 g2 r4
}

% Basso music
musicBasso = \relative c' {
  g8 g g fs e4 c |
  c'8 b a fs g4 g |
  g8 g g fs e4 c |
  c'8 b fs d g2 |
  d8 g a g a16 (g fs8) fs4 |
  g8 fs g g c,2 |
  g'8 fs e g a g fs a |
  b a g d g2 |
  d8 g a g a16 (g fs8) fs4 |
  g8 fs g g c,2 |
  g'8 fs e a a ds, ds4 |
  e e2 r4
}


% 11. Chorus lyrics
lyricVerseOne = \lyricmode {
  \set stanza = #"1."
  Ngài là đường con bước tới, chân lý quang minh rạng ngời.
  Nhờ lời Ngài soi dẫn lối, đời con sợ hãi chi?
  Chúa ơi, hãy ở bên con, sớm mai tới chiều hôm.
  Từng giây phút đời con có Chúa, Ngài là cuộc sống của con.
  Chúa ơi hãy ở lại bên con bóng đêm đã dần buông.
  Từng nhịp sống đời con mãi dâng về Ngài.
}

lyricVerseTwo = \lyricmode {
  \set stanza = #"2."
  Ngài là Người Con chí ái Cha đã sai vào cuộc đời.
  Và Ngài đã sinh ra bởi lòng Mẹ Ma -- ri -- a
  Cảm thông nỗi niềm nhân gian, sớt chia những than lầm.
  Và Ngài đã vì yêu, hy sinh chịu treo trên thánh giá cao.
  Chúa ban Máu Thịt mình cho con, dưỡng nuôi xác hồn con.
  Từng nhịp sống đời con mãi dâng về Ngài.
}

% 10. Verse lyrics
lyricVerseThree = \lyricmode {
  \set stanza = #"3."
  Trọn niềm cậy trông phó thác, con nép thân bên tình Ngài.
  Lòng ngập tràn nhiềm an vui, đời tự do hát ca.
  Cánh tay dũng lực uy linh, Chúa luôn ấp ủ con.
  Từ nay không điều gì ngăn cách tình con xa Chúa, Chúa ơi!
  Trái tim Chúa dịu hiền bao dung, mãi luôn ấp ủ con.
  Từng nhịp sống đời con mãi dâng về Ngài.
}

lyricVerseFour = \lyricmode {
  \set stanza = #"4."
  Trọn một niềm tin kính Chúa Cha, Đấng tác sinh trần hoàn.
  Trọn một niềm tín thác Ngôi Lời chuộc cứu thế gian.
  Thánh Linh suối nguồn yêu thương khấng xin đến cùng con.
  Từ muôn nẻo đường, Ngài hiệp nhất đoàn con trong Chúa, Chúa ơi!
  Bước theo Chúa một đời hoan ca, trái tim mãi nở hoa.
  Từng nhịp sống đời con mãi dâng về Ngài.
}

% 12. Layout
\score {
    \new ChoirStaff <<
      \new Staff <<
        \clef "treble"
        \new Voice = "soprano" {
          \voiceOne \globalSettings \stemUp \slurUp \musicSoprano
        }
        \new Voice = "alto" {
          \voiceTwo \globalSettings \stemDown \slurDown \musicAlto
        }
      >>
      \new Lyrics \lyricsto soprano \lyricVerseOne
      \new Lyrics \printItalic \lyricsto soprano \lyricVerseTwo
      \new Lyrics \lyricsto soprano \lyricVerseThree
      \new Lyrics \printItalic \lyricsto soprano \lyricVerseFour
      
      \new Staff <<
        \clef "bass"
        \new Voice = "basso" {
          \globalSettings \stemNeutral \slurDown \musicBasso
        }
      >>
    >>
}



