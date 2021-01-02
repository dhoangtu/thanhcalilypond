%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% CONTENTS OF THIS DOCUMENT
% 1. Common settings
% 2. Soprano verse music
% 3. Alto verse music
% 4. Tenor verse music
% 5. Basso verse music
% 6. Verse lyrics
% 7. Layout
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 1. Common settings
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\version "2.18.2"

\header {
  title = "013. Ascension Tide"
  subtitle = "Opus peregisti tuum"
  %poet = ""
  composer = "Dr. C. Harford Lloyd"
  tagline = ##f
  source = "Catholic Church Hymnal with Music (1905), p.96"
  %site = ""
}

globalSettings= {
  \key g \major
  \time 4/4
  %\override Score.BarNumber.break-visibility = ##(#t #t #t)
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
}

verseSettings = {
  \phrasingSlurDashed
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

printItalic = \with {
  \override LyricText.font-shape = #'italic
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 2. Soprano verse music
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
musicVerseSoprano = \relative c' {
\partial 4 g'4 |
  e fis g g |
  c b8 (a) b4 g \break \bar "|"
  b cis d b |
  a4. g8 fis4 \fermata g4 |
  e fis g g \break \bar "|"
  c b8 (a) b4 g |
  b cis d a8 (g) |
  fis4. e8 d4 \fermata \break \bar "|"
 \partial 4 d4 |
  e4. f8 f4 e |
  a4. g8 fis4 d \break \bar "|"
  e fis g g |
  c4. d8 b4 \fermata g4 |
  e'4. e8 d4 g, \break \bar "|"
  c d b a |
  g e d g |
  a4. g8 g2 \fermata |
  g1 |
  g1 \bar "|."
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 3. Alto verse music
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
musicVerseAlto = \relative c' {
\partial 4 b4 |
  c d d b |
  e d d g |
  d e d e |
  fis e d d |
  d c b f' |
  e fis g g |
  d g fis fis8 e8 |
  d4 cis d4 a |
  b4. b8 cis4 cis |
  e4. e8 d4 d |
  d d d b |
  e d d f |
  e4. fis8 g4 g |
  g fis g f |
  e c b d |
  fis4. g8 g2 |
  e1 |
  d1
  
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 4. Tenor verse music
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
musicVerseTenor = \relative c' {
\partial 4 g4 |
  g a g g |
  g fis g d' |
  b g a d |
  d cis a g |
  g a g b |
  c c b d8 c |
  b a g4 a b |
  a g fis fis |
  gis4. gis8 a4 a4 |
  c4. b8 a4 fis |
  g a g g |
  g fis g b |
  c4. c8 d4 d |
  e d d b |
  c g g b |
  c4. c8 b2 |
  g1 |
  b1
  
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 5. Basso verse music
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
musicVerseBasso = \relative c {
\partial 4 g4 |
  c c b e |
  a, d g b |
  g e fis g |
  a a, d \fermata b |
  c a e' d |
  c d g b8 a |
  g fis e4 d g |
  a a, d \fermata d |
  d4. d8 c4 c |
  a4. a8 d4 d |
  d c b e |
  a, d g, \fermata g' |
  c4. a8 b4 b |
  a d, g g, |
  c c d d |
  d4. d8 g,2 \fermata |
  c1 |
  g'1
  
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 6. Verse lyrics
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
lyricVerseOne = \lyricmode {
  \set stanza = #"1."
  Thy sa -- cred race, O Lord, is run,
  Thy work is wrought, Thy vic -- tory won;
  The glo -- ry Thou didst leave re -- quires
  Thy pres -- ence in su -- per -- nal choirs.
  The clouds Thy char -- iot, earth a -- far 
  Be neath Thy feet, a lit -- tle star;
  Ten thou -- sand thou -- sand ang -- els sing,
  To wel -- come their re -- turn -- ing King.
}

lyricVerseTwo = \lyricmode {
  \set stanza = #"2."
  The gates of heaven o -- bey the call,
  And o -- pen to the Lord of all;
  His throne re -- ceives the-e -- ter -- nal Son,
  Both God and Man for -- ev -- er One.
  Thou Me -- di -- a -- tor and High -- Priest,
  Fresh from the sac -- ri -- fice re -- leased.
  By love cons -- trained doth hith -- er bring
  Thy smit -- ten Heart's best of -- fer -- ing. A -- men
}

lyricVerseThree = \lyricmode {
  \set stanza = #"3."
  And she who from Thy o -- pened Side
  Her be -- ing took, Thy ho -- ly Bride,
  Still nour -- ished from Thy Side sur -- vives,
  And life and all from Thee de -- rives.
  Hence, in the thick -- est of the fight,
  Thy war -- riors win their heaven -- ly might;
  And hence Thy mar -- tyrs sing their psalms,
  And joy -- ous wave tri -- umph -- al palms.
}

lyricVerseFour = \lyricmode {
  \set stanza = #"4."
  Where Thou, the Head art gone, Thy voice
  Calls all Thy mem -- bers to re -- joice;
  Ah, let them cleave the shin -- ing way
  Thy foot -- prints through the eth -- er fray.
  To Thee be glo -- ry, con -- quering King,
  Who un -- to heaven Thy way dost wing,
  Great Son of the e -- ter -- nal Sire,
  Whose Spi -- rit is our one de -- sire.
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 7. Layout
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\score {
    \new ChoirStaff <<
      \new Staff <<
        \clef "treble"
        \new Voice = "soprano" {
          \voiceOne \globalSettings \verseSettings \stemUp \slurUp \musicVerseSoprano
        }
        \new Voice = "alto" {
          \voiceTwo \globalSettings \verseSettings \stemDown \slurDown \musicVerseAlto
        }
      >>
      \new Lyrics \lyricsto soprano \lyricVerseOne
      \new Lyrics \printItalic \lyricsto soprano \lyricVerseTwo
      \new Lyrics \lyricsto soprano \lyricVerseThree
      \new Lyrics \printItalic \lyricsto soprano \lyricVerseFour
      %\new Lyrics \printItalic \lyricsto soprano \lyricVerseFive
      %\new Lyrics \printItalic \lyricsto soprano \lyricVerseSix
      \new Staff <<
        \clef "bass"
        \new Voice = "tenor" {
          \voiceOne \globalSettings \verseSettings \stemUp \slurUp \musicVerseTenor
        }
        \new Voice = "basso" {
          \voiceTwo \globalSettings \verseSettings \stemDown \slurDown \musicVerseBasso
        }
      >>
    >>
}

