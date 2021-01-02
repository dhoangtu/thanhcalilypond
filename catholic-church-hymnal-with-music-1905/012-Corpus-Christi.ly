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
  title = "012. Ascension Tide"
  subtitle = "Aeterne Rex altissime"
  %poet = ""
  composer = "A. Edmonds Tozer"
  tagline = ##f
  source = "Catholic Church Hymnal with Music (1905), p.95"
  %site = ""
}

globalSettings= {
  \key e \major
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
\partial 4 e4 |
  gis4. gis8 gis4 e |
  b'4. b8 b4 gis |
  cis e e dis \break \bar "|"
  cis2. e4 |
  b4. cis8 b4 gis |
  fis eis fis gis |
  e e b' gis |
  fis2. \break \bar "|"
  \partial 4 e4 |
  e4. e8 fis4 e |
  gis fis e e |
  gis4. gis8 ais4 ais |
  b2. b4 \break \bar "|"
  cis4. dis8 b4 cis |
  a b gis gis |
  gis4. fis8 e4 dis |
  e2. r4 |
  a1 |
  gis1 \bar "|."
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 3. Alto verse music
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
musicVerseAlto = \relative c' {
\partial 4 e4 |
  gis4. gis8 gis4 e |
  b'4. b8 b4 gis |
  gis gis gis fis |
  e2. e4 |
  e4. e8 e4 e |
  dis cisis dis dis |
  cis cis e e |
  dis2. e4 |
  b4. e8 dis 4 e |
  dis dis e e |
  dis4. gis8 gis4 fisis |
  gis2. gis4 |
  a4. a8 gis4 gis |
  fis fis e d |
  cis4. cis8 b4 b |
  b2. r4 |
  e1 |
  e1
  
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 4. Tenor verse music
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
musicVerseTenor = \relative c' {
\partial 4 e,4 |
  gis4. gis8 gis4 e |
  b'4. b8 b4 gis |
  gis cis cis bis |
  cis2. cis4 |      
  b4. ais8 b4 b |
  a gis a b |
  gis gis b b |
  b2. gis4 |
  gis4. gis8 a4 gis |
  b a gis cis |
  b4. b8 ais4 dis |
  dis2. e4 |
  e4. dis8 dis4 cis |
  cis b b b |
  b4. a8 gis4 fis |
  gis2. r4 |
  cis1 |
  b1
  
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 5. Basso verse music
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
musicVerseBasso = \relative c {
\partial 4 e4 |
  gis4. gis8 gis4 e |
  b'4. b8 b4 gis |
  e cis gis gis' |
  cis,2. a'4 |
  gis4. fisis8 gis4 e |
  b b b b |
  cis cis gis gis8 a8 |
  b2. e4 |
  e4. e8 e4 e |
  b b e cis |
  dis4. dis8 dis4 dis |
  gis2. e4 |
  a4. fis8 gis4 e |
  fis dis e e |
  a,4. a8 b4 b |
  e2. r4 |
  a,1 |
  e'1
  
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 6. Verse lyrics
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
lyricVerseOne = \lyricmode {
  \set stanza = #"1."
  O Thou e -- ter -- nal King most high!
  Who didst the world re -- deem
  And, conque -- ring death and hell,
  re -- ceive A dig -- ni -- ty su -- preme.
  Thou, through the star -- ry orbs, this day,
  Didst to Thy throne as -- cend;
  Thence -- forth to reign in sover -- reign power,
  And gloy -- ry with -- out end.
}

lyricVerseTwo = \lyricmode {
  \set stanza = #"2."
  There, seat -- ed in Thy maj -- es -- ty,
  To Thee sub -- mis -- sive bow
  The heaven of heavens, the earth be -- neath,
  The realms of hell be -- low.
  With rem -- bling there the ang -- els see
  The changed es -- tate of man;
  The flesh which sinned by Flesh re -- deemed;
  Man in the God -- head reign. A -- men.
}

lyricVerseThree = \lyricmode {
  \set stanza = #"3."
  There, wait -- ing for Thy faith -- ful souls,
  Be Thou to us, O Lord!
  Our Joy of joys while here we stay,
  In heaven our great re -- ward.
  Re -- new our strength, our sins for -- give,
  Our mis -- e -- ries ef -- face;
  And lift our souls a -- loft to Thee,
  By Thy ce -- les -- tial grace.
}

lyricVerseFour = \lyricmode {
  \set stanza = #"4."
  So, when Thou shin -- est on the clouds,
  With Thy ang -- e -- lic train,
  May we be saved from dead -- ly doom
  And our lost crown re -- gain.
  To Christ re -- turn -- ing glo -- rious -- ly
  With vic -- to -- ry to heaven,
  Praise with the Fa -- ther e -- ver -- more
  And Holy Ghost be giv -- en.
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

