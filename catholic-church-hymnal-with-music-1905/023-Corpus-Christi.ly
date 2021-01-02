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
  title = "023. Corpus Christi"
  subtitle = "Hoste dum victo triumphans"
  %poet = ""
  composer = "J. C. Bowen"
  tagline = ##f
  source = "Catholic Church Hymnal with Music (1905), p.104"
  %site = ""
}

globalSettings= {
  \key bes \major
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
f4 g g f |
bes a g f |
g a bes c \break \bar "|"
d c c2 \bar "||"
bes4 a g f |
g a f d \break \bar "|"
f g c f, |
f e f2 \bar "||" 
f4 g g f \break \bar "|"
bes c d2 |
ees4 d c bes |
c2 c |
bes1 \bar "|."
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 3. Alto verse music
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
musicVerseAlto = \relative c' {
d4 ees ees c |
f f d d |
d f f e |
f e f2 |
f4 f d d |
d d d a |
d e f d |
c c c2 |
d4 ees ees d |
d f f (g) |
g g ees d |
g2 f4 (ees) |
d1
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 4. Tenor verse music
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
musicVerseTenor = \relative c' {
bes4 bes bes a |
bes c bes a |
bes c bes g |
bes g a2 |
bes4 c bes a |
bes a a f |
a c c bes |
g g a2 |
bes4 bes bes bes |
bes a a (bes) |
c bes g bes |
bes2 a |
bes1
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 5. Basso verse music
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
musicVerseBasso = \relative c {
bes4 ees ees f |
d f g d |
g f d c |
bes c f2 |
d4 f g d |
g f d d |
d c a bes |
c c f2 |
bes,4 ees ees bes |
g' f d (g) |
c, g' c, g' |
ees2 f |
f1
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 6. Verse lyrics
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
lyricVerseOne = \lyricmode {
  \set stanza = #"1."
  When the Pa -- triarch was re -- turn -- ing
  Corwned with tri -- umph from the fray,
  Him the peace -- ful king of Sa -- lem
  Came to meet up -- on his way;
  Meek -- ly bear -- ing bread and wine,
  Ho -- ly priest -- hood's aw -- ful sign.
}

lyricVerseTwo = \lyricmode {
  \set stanza = #"2."
  On the truth thus dim -- ly sha -- dowed
  La -- ter days a lus -- tre shed;
  When the freat High -- Priest e -- ter -- nal,
  Un -- der forms of wind and bread,
  For the world's im -- mor -- tal Food
  Gave His Flesh and gave his Blood.

}

lyricVerseThree = \lyricmode {
  \set stanza = #"3."
  Wond -- rous Gift! The Word Who fa -- shioned
  All things by His might di -- vine,
  Bread in -- to His Bod -- y chang -- es,
  In -- to His own Blood the wine;
  What though sense no change per -- ceives,
  Faith ad -- mires, a -- dores, be -- lieves.
}

lyricVerseFour = \lyricmode {
  \set stanza = #"4."
  He Who once to die a vic -- tim
  On the Cross did not re -- fuse,
  Day by day up -- on our al -- tars
  That same Sac -- ri -- fice re -- news;
  Through His ho -- ly priest -- hood's hands.
  Faith -- ful to His last com -- mands.
}

lyricVerseFive = \lyricmode {
  \set stanza = #"5."
  While the peo -- ple all u -- ni -- ting
  In the Sac -- ri -- fice sub -- lime,
  Of -- fer Christ to His high Fa -- ther,
  Of -- fer up them -- selves with Him;
  Then to -- ge -- ther with the priest
  On the liv -- ing Vic -- tim feast.
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

