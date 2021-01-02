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
  title = "011. Easter"
  subtitle = "(Aurora coelum purpurat)"
  %poet = ""
  composer = "A. Edmonds Tozer"
  tagline = ##f
  source = "Catholic Church Hymnal with Music (1905), p.94"
  %site = ""
}

globalSettings= {
  \key c \minor
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
  bes4. bes8 c4 g |
  bes4. bes8 bes4 bes \break \bar "|"
  c4. c8 ees4 c |
  ees4. ees8 ees4 ees \! \fermata |
  d4. ees8 d4 c \break \bar "|"
  bes4. bes8 bes4 g | 
  aes4 bes c ees |
  ees4. d8 ees2 \! \fermata |
  ees1 |
  ees1 \bar "|."
  
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 3. Alto verse music
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
musicVerseAlto = \relative c' {
 \partial 4 ees4 |
  f4. ees8 ees4 ees |
  g4. aes8 g4 g \break \bar "|"
  aes4. aes8 bes4 aes |
  g4. aes8 g4 g |
  f4. ges8 f4 a \break \bar "|"
  g4. f8 ees4 g | 
  f ees aes g |
  bes4. aes8 g2 |
  aes1 |
  g1
 
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 4. Tenor verse music
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
musicVerseTenor = \relative c' {
\partial 4 bes4 |
  bes4. g8 g4 c |
  d4. d8 bes4 ees \break \bar "|"
  ees4. ees8 bes4 ees |
  ees4. c8 bes4 bes |
  bes4. c8 d4 ees \break \bar "|"
  d4. d8 ees4 des | 
  c bes ees ees | 
  f4. f8 ees2 |
  c1 |
  bes

}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 5. Basso verse music
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
musicVerseBasso = \relative c {
\partial 4 ees4 |
  d4. ees8 c4 ees |
  g4. f8 ees4 ees |
  aes4. aes8 g4 aes |
  c4. aes8 ees4 ees \! \fermata |
  bes'4. a8 bes4 f |
  g4. aes8 g4 ees |
  f g aes c |
  bes4. bes8 ees,2 \! \fermata |
  aes1 |
  ees1
 
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 6. Verse lyrics
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
lyricVerseOne = \lyricmode {
  \set stanza = #"1."
 Light's glit -- tering morn be -- decks the sky,
 Heaven thun -- ders forth its vic -- tor cry;
 The glad earth shouts its tri -- umph high,
 And groan -- ing hell makes wild re -- ply.
}

lyricVerseTwo = \lyricmode {
  \set stanza = #"2."
  While He, the King of glo -- rious might,
  Treads down death's strength in death's des -- pite,
  And tramp -- ling hell by vic -- tor's right,
  Brings forth His sleep -- ing Saints to light. 
}

lyricVerseThree = \lyricmode {
  \set stanza = #"3."
  Fast barred be -- neath the stone of late,
  In watch and ward where sol -- diers wait,
  Now shin -- ing in tri -- umph -- ant state,
  He ris -- es vic -- tor from death's gate. 
}

lyricVerseFour = \lyricmode {
  \set stanza = #"4."
  Hell's pains are loosed, and tears are fled;
  Cap -- ti -- vi -- ty is cap -- tive led;
  The Ang -- el, crowned with light, hath said:
  The Lord is ris -- en from the dead. A -- men.
}

lyricVerseFive = \lyricmode {
  \set stanza = #"5."
The A -- postles' hearts were full of pain
For their dear Lord so late -- ly slain,
That Lord his ser -- vants wick -- ed train
With bit -- ter scorn had dared arr -- aign.
}

lyricVerseSix = \lyricmode {
  \set stanza = #"6."
  We pray Thee, King with glo -- ry decked,
  In this our pas -- chal joy pro -- tect
  From all that death would fain ef -- fect,
  Thy ran -- somed flock, Thine own e -- lect.
}

lyricVerseSeven = \lyricmode {
  \set stanza = #"7."
  To Thee Who, dead, a -- gain dost live,
  All glo -- ry, Lord, Thy peo -- ple give:
  All glo -- ry, as is e -- ver meet,
  To Fa -- ther and to Pa -- ra -- clete.
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

