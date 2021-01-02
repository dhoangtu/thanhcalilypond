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
  title = "018. Whitsun Tide"
  subtitle = "Iam Christus astra ascenderat"
  %poet = ""
  composer = "H. Noble Pottle"
  tagline = ##f
  source = "Catholic Church Hymnal with Music (1905), p.108"
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
\partial 4 gis'4 |
  b cis gis fis |
  e2. e'4 |
  dis cis b a |
  gis2 (fis4) \break \bar "||" fis4 |
  e a gis e |
  e cis' b a |
  gis fis e fis |
  e2. r4 \bar "||" 
  a1 |
  gis1 \bar "|."
  }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 3. Alto verse music
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
musicVerseAlto = \relative c' {
\partial 4 e4 |
  e e dis dis |
  dis2 (cis4) e |
  fis e e e |
  e2 (dis4) dis |
  cis e d d |
  cis e d fis |
  cis cis cis dis |
  e2. r4 \bar "||"
  e1 |
  e1
  
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 4. Tenor verse music
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
musicVerseTenor = \relative c' {
\partial 4 e4 |
  dis cis b a |
  gis2. cis4 |
  bis cis gis a |
  b2. a4 |
  gis a b gis |
  a e eis fis |
  b a fis a |
  gis2. r4 |
  cis1 |
  b1
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 5. Basso verse music
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
musicVerseBasso = \relative c {
\partial 4 e4 |
  gis, a b bis |
  cis2. cis4 |
  gis a b cis |
  b2. b4 |
  cis cis b b |
  a a gis fis |
  gis a b b |
  e2. r4 |
  a,1 |
  e'1
  }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 6. Verse lyrics
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
lyricVerseOne = \lyricmode {
  \set stanza = #"1."
  A -- bove the star -- ry spheres
  To where He was be -- fore
  Christ had gone up, soon from on high
  The Fa -- ther's gift to pour;
}

lyricVerseTwo = \lyricmode {
  \set stanza = #"2."
  And now had ful -- ly come, 
  On mys -- tic cir -- cle borne
  Of seven times seven re -- volv -- ing days,
  The Pen -- te -- cos -- tal morn: A -- men.
}

lyricVerseThree = \lyricmode {
  \set stanza = #"3."
  When, as the Apos -- tles knelt
  At the third hour in prayer,
  A sud -- den rush -- ing sound pro -- claimed
  The God of glo -- ry near.
}

lyricVerseFour = \lyricmode {
  \set stanza = #"4."
  Forth -- with a tongue of fire
  A -- lights on eve -- ry brow;
  Each breast re -- ceives the Fa -- ther's light,
  The Word's en -- kindl -- ing glow.
  
}

lyricVerseFive = \lyricmode {
  \set stanza = #"5."
  The Ho -- ly Gosht on all
  Is migh -- ti -- ly out -- poured,
  Who straight in di -- vers tongues de -- clare
  The wond -- ers of the Lord.
}

lyricVerseSix = \lyricmode {
  \set stanza = #"6."
  While strang -- ers of all climes
  Flock round from far and near,
  And with a -- maze -- ment, each at once
  Their na -- tive ac -- cents hear.
}

lyricVerseSeven = \lyricmode {
  \set stanza = #"7."
  But faith -- less still, the Jews
  De -- ny the Hand di -- vine,
  And mad -- ly jeer the Saints of Christ,
  As drunk with new -- made wine.
}

lyricVerseEight = \lyricmode {
  \set stanza = #"8."
  Till Pe -- ter in the midst
  Stood up, and spake a -- loud;
  And their per -- fi -- dious fals -- i -- ty
  By Jo -- el's wit -- ness showed.
}

lyricVerseNine = \lyricmode {
  \set stanza = #"9."
  Praise to the Fa -- ther be!
  Praise to the Son Who rose!
  Praise, ho -- ly Pa -- ra -- clete, to Thee,
  While age on ag -- es flows!
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
	  \new Lyrics \lyricsto soprano \lyricVerseSeven
	  \new Lyrics \printItalic \lyricsto soprano \lyricVerseEight
	  \new Lyrics \lyricsto soprano \lyricVerseNine
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

