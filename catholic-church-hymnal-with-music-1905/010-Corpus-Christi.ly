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
  title = "010. Corpus Christi"
  subtitle = "(Verbum supernum prodiens)"
  %poet = ""
  composer = "G. Steiner"
  tagline = ##f
  source = "Catholic Church Hymnal with Music (1905), p.98"
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
  g'4 a b g |
  a4 g e g \break \bar "|"  
  a4 b c a |
  b4 g a2 |
  b4 c d b \break \bar "|" 
  c b g b |
  a b g e |
  g fis g2 |
  g1 |
  g1 \bar "|."
  
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 3. Alto verse music
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
musicVerseAlto = \relative c' {
  d4 fis g d | 
  e e c d \break \bar "|"
  fis g g fis |
  g d e2 |
  g4 a a g \break \bar "|" 
  g fis e fis |
  e fis e b |
  c d d2 |
  e1 |
  d1
 
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 4. Tenor verse music
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
musicVerseTenor = \relative c' {
  b4 d d d |
  c b c b \break \bar "|"
  d d e d |
  d d c2 |
  e4 e d d \break \bar "|"
  e d b d |
  c d b b |
  g a b2 |
  c1 |
  b1

}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 5. Basso verse music
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
musicVerseBasso = \relative c {
  g'4 d g b |
  a e a g \break \bar "|"
  d g c, d |
  g b a2 |   
  e4 a fis g \break \bar "|"
  c, d e b |
  c b e g | 
   e d g2 |
  c,1 |
  g'1
 
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 6. Verse lyrics
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
lyricVerseOne = \lyricmode {
  \set stanza = #"1."
 Word of God to earth de -- scend -- ing,
 With the Fa -- ther pres -- ent still,
 Near His earth -- ly jour -- ney's end -- ing
 Hastes His mis -- sion to ful -- fil.
}

lyricVerseTwo = \lyricmode {
  \set stanza = #"2."
  Well the trai -- tor's kiss fore -- know -- ing
  Mir -- a -- cle of love di -- vine
  See His Hands Him -- self be -- stow -- ing
  In the hal -- lowed Bread and Wine.
}

lyricVerseThree = \lyricmode {
  \set stanza = #"3."
  Ho -- ly Bod -- y Blood all pre -- cious,
  Given by Him to be our Food,
  With them Both He doth re -- fresh us,
  Formed like Him of flesh and blood. A -- men
}

lyricVerseFour = \lyricmode {
  \set stanza = #"4."
  Born, a Bro -- ther dear He gave us;
  At his board the Ban -- quet He;
  On the Cross He died to save us;
  Reig -- neth our fe -- li -- ci -- ty.
}

lyricVerseFive = \lyricmode {
  \set stanza = #"5."
  Might -- y Vic -- tim, earth's Sal -- va -- tion,
  Heaven's own gate un -- fold -- ing wide,
  Help Thy peo -- ple in temp -- ta -- tion,
  Feed them from Thy bleed -- ing Side.
}

lyricVerseSix = \lyricmode {
  \set stanza = #"6."
  Un -- to Thee, the hid -- den Man -- na,
  Fa -- ther, Spi -- rit, un -- to Thee
  Let us raise the loud hos -- an -- na,
  And a -- dor -- ing bend the knee.
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
      \new Lyrics \lyricsto soprano \lyricVerseFive
      \new Lyrics \printItalic \lyricsto soprano \lyricVerseSix
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

