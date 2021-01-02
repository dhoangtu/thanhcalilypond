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
  title = "020. Most Holy Trinity"
  subtitle = "Tu Trinitatis Unitas"
  %poet = ""
  composer = "H. Whitehead"
  tagline = ##f
  source = "Catholic Church Hymnal with Music (1905), p.112"
  %site = ""
}

globalSettings= {
  \key g \minor
  \time 4/4
  %\override Score.BarNumber.break-visibility = ##(#t #t #t)
  \override Score.BarNumber.break-visibility = ##(#t #t #t)
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
  bes a c bes |
  ees d c d \break \bar "|"
  d c g a |
  bes c f, fis |
  g a bes c |
  d2. \break \bar "||" d4 |
  d bes ees d |
  c a d c |
  bes g c bes \break \bar "|"
  a a a a |
  d g, bes a |
  g2. r4 \bar "||"
  g1 |
  g1 \bar "|."
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 3. Alto verse music
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
musicVerseAlto = \relative c' {
   \partial 4 g'4 |
  g g g g |
  g g g fis |
  f ees g f |
  f f f d |
  d d d g |
  fis2. fis4 |
  f f ees f |
  g g fis a |
  g g g g |
  g g fis fis |
  g g g fis |
  g2. r4 |
  ees1 |
  d1
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 4. Tenor verse music
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
musicVerseTenor = \relative c' {
  \partial 4 bes4 |
  d c ees d |
  c d ees d |
  b c c c |
  bes ees d c |
  bes a g g |
  a2. a4 |
  bes bes bes a |
  c ees d d |
  d bes c d |
  ees e d d |
  d ees d c |
  bes2. r4 |
  c1 |
  b1
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 5. Basso verse music
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
musicVerseBasso = \relative c {
  \partial 4 g'4 |
  g g g g |
  c bes a d, |
  g c, ees f |
  d a bes d |
  g fis g ees |
  d2. d4 |
  bes d g f |
  ees c d fis |
  g f ees d |
  c cis d c |
  bes c d d |
  g2. r4 |
  c,1 |
  g1
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 6. Verse lyrics
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
lyricVerseOne = \lyricmode {
  \set stanza = #"1."
  Blest Three in One and One in Three,
  Great ru -- ler of the world,
  to Thee Thy sup -- pliant peo -- ple kneel;
  Oh, list -- en from Thy throne on high,
  And grant of Thy great clem -- en -- cy
  Thy balm our wounds to heal.
}

lyricVerseTwo = \lyricmode {
  \set stanza = #"2."
  What -- e'ver in us hath been de -- cayed
  By Sa -- tan's fraud, Lord, with Thy aid
  As -- sist us to re -- new;
  With bod -- ies pure and kin -- dling hearts,
  And shield -- ed from temp -- ta -- tion's darts,
  May we our path pur -- sue. A -- men.
}

lyricVerseThree = \lyricmode {
  \set stanza = #"3."
  O Light of light, with Thy blest ray,
  Di -- rect our steps through -- out this day
  We hum -- bly Thee im -- plore;
  Praise we the Fa -- ther, praise the Son,
  And Ho -- ly Ghost, blest Three in One,
  Both now and ev -- er -- more.
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
      %\new Lyrics \printItalic \lyricsto soprano \lyricVerseFour
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

