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
  title = "026. Most Sacred Heart of Jesus"
  subtitle = "Auctor beate soeculi"
  %poet = ""
  composer = "E. A. Hedgcock"
  tagline = ##f
  source = "Catholic Church Hymnal with Music (1905), p.114"
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
gis4. gis8 gis4 fis |
e fis gis e \break \bar "|"
cis'4. dis8 e4 b |
b a gis \bar "||" e |
cis'4. cis8 fis,4 gis8 (a) \break \bar "|"
b4. b8 e,4 fis8 (gis) |
a4 gis fis cis |
gis' fis e r4 \bar "||"
e1 |
e1 \bar "|."
  }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 3. Alto verse music
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
musicVerseAlto = \relative c' {
\partial 4 e4 |
d4. d8 cis4 cis |
b dis e e |
e4. fis8 e4 gis8 fis |
e4 fis e b |
e4. e8 dis4 dis |
e4. e8 e4 cis |
cis cis cis gis |
ais b b r4 |
cis1 |
b1
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 4. Tenor verse music
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
musicVerseTenor = \relative c' {
\partial 4 b4 |
b4. b8 b4 a |
gis a gis b |
cis4. b8 b4 e8 dis |
cis4 dis e d |
cis4. cis8 c4 c |
b4. d8 cis4 fis, |
fis eis fis e |
e dis8 a' gis4 r4 |
a1 |
gis1
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 5. Basso verse music
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
musicVerseBasso = \relative c {
\partial 4 e4 |
e4. e8 a,4 a |
b b e gis |
a4. a8 gis4 e |
fis b, e gis |
a4. a8 a4 a |
gis4. gis8 a4 a, |
fis gis a cis |
fis, b e r4 |
a,1 |
e'1
  }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 6. Verse lyrics
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
lyricVerseOne = \lyricmode {
  \set stanza = #"1."
  Je -- su, Cre -- a -- tor of the world,
  Of all man -- kind Re -- deem -- er blest;
  True God of God, in Whom we see 
  The Fa -- ther's im -- age clear ex -- pressed:
}

lyricVerseTwo = \lyricmode {
  \set stanza = #"2."
  That self -- same love which made the sky,
  Which made the sea, and stars, and earth,
  Took pit -- y on our mis -- er -- y,
  And broke the bond -- age of our birth.
}

lyricVerseThree = \lyricmode {
  \set stanza = #"3."
 O Je -- su, in Thy Heart di -- vine
 Shall that same love for ev -- er glow,
 For ev -- er mer -- cy to man -- kind
 From that ex -- haust -- less fount -- ain flow. A -- men.
}

lyricVerseFour = \lyricmode {
  \set stanza = #"4."
 For this Thy sacr -- ed Hear was pierced,
 And both with Blood and Wa -- ter ran;
 To cleanse us from the stains of guilt,
 And be the hope and strength of man.
}

lyricVerseFive = \lyricmode {
  \set stanza = #"5."
 To God the Fa -- ther and the Son,
 All praise and power and glo -- ry be,
 With Thee, O ho -- ly Pa -- ra -- clete,
 Hence -- forth through all e -- ter -- ni -- ty.
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

