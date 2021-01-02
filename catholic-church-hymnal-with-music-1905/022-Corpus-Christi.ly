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
  title = "022. Corpus Christi"
  subtitle = "Verbum supernum prodiens"
  %poet = ""
  composer = "W. Ratcliffe"
  tagline = ##f
  source = "Catholic Church Hymnal with Music (1905), p.99"
  %site = ""
}

globalSettings= {
  \key d \major
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
  \partial 4 fis4 |
b b a fis |
g a fis a \break \bar "|"
d cis b a |
b cis a \fermata \bar "||" d |
b cis a fis \break \bar "|"
g a fis fis |
b b a fis |
e fis d \fermata \bar "|."
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 3. Alto verse music
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
musicVerseAlto = \relative c' {
  \partial 4 d4 |
d cis d d |
d cis d fis |
fis fis fis a |
a gis a a |
g g fis d |
e e d d |
d e a, d |
d cis d
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 4. Tenor verse music
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
musicVerseTenor = \relative c' {
  \partial 4 a4 |
g g a a |
b a a a |
b ais b cis |
fis e8 d cis4 d |
d cis cis d |
b a a b |
b cis d a |
b a8 g fis4
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 5. Basso verse music
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
musicVerseBasso = \relative c {
  \partial 4 d4 |
g e fis fis |
e a, d d |
b cis d fis |
d e a \fermata fis |
g e fis b |
e, cis d b8 a |
g4 g' fis d |
g, a d \fermata 

}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 6. Verse lyrics
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
lyricVerseOne = \lyricmode {
  \set stanza = #"1."
  The Word, de -- scend -- ing from a -- bove,
  Though with the Fa -- ther still on high,
  Went forth up -- on His work of love,
  And soon to life's last eve drew nigh.
}

lyricVerseTwo = \lyricmode {
  \set stanza = #"2."
  He short -- ly to a death ac -- cursed
  By a dis -- ci -- ple shall be given;
  But, to his twelve dis -- ci -- ples, first 
  He gives Him -- self, the Bread from heaven.
}

lyricVerseThree = \lyricmode {
  \set stanza = #"3."
  Him -- self in ei -- ther kind He gave;
  He gave his Flesh, He gave His Blood;
  Of flesh and blood all men are made;
  And He of man would be the Food.
}

lyricVerseFour = \lyricmode {
  \set stanza = #"4."
  At birth our Bro -- ther He be -- came;
  At meat Him -- self as food He gives;
  To ran -- som us He died in shame;
  As our re -- ward, in bliss He lives.
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
      %\new Lyrics \lyricsto soprano \lyricVerseFive
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

