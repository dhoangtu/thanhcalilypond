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
  title = "027. Most Sacred Heart of Jesus"
  subtitle = "Cor amans"
  %poet = ""
  composer = "L. Behr"
  tagline = ##f
  source = "Catholic Church Hymnal with Music (1905), p.115"
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
a b c a |
g a b b |
cis d d cis |
d2. \break \bar "||" d4 |
e d b c |
b fis g e |
g b g fis |
g2. \bar "|."
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 3. Alto verse music
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
musicVerseAlto = \relative c' {
\partial 4 d4 |
d g g fis |
e fis g fis |
g fis g g |
fis2. g4 |
g g fis a |
fis fis e e |
d g e d |
d2.
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 4. Tenor verse music
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
musicVerseTenor = \relative c' {
\partial 4 b4 |
a d e c ||
b d d d |
e d e e |
d2. b4 |
c b d e |
d c b c |
g d' c a |
b2.
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 5. Basso verse music
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
musicVerseBasso = \relative c {
\partial 4 g'4 |
fis g c, d |
e d g b |
ais b e, a |
d,2. g4 |
c g b a |
d, dis e c |
b g c d |
g2.
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 6. Verse lyrics
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
lyricVerseOne = \lyricmode {
  \set stanza = #"1."
  O Heart of Je -- sus, Heart of God,
  O source of bound -- less love,
  By an -- gels praised, by Saints a -- dored,
  From their bright thrones a -- bove!
}

lyricVerseTwo = \lyricmode {
  \set stanza = #"2."
 The poor -- est, sad -- dest heart on earth
 May claim Thee for its own;
 O burn -- ing, throb -- bing Heart of Christ,
 Too late, too lit -- tle known!
}

lyricVerseThree = \lyricmode {
  \set stanza = #"3."
  The ver -- y sound of those sweet words
  The Sacr -- ed Heart, can give
  To the most lone and bur -- dened soul
  Strength to en -- dure and live.
}

lyricVerseFour = \lyricmode {
  \set stanza = #"4."
  A mo -- ther may for -- get her child,
  A fa -- the prove un -- true;
  A bro -- ther or a sis -- ter turn
  Un -- kind and thank -- less too.
}

lyricVerseFive = \lyricmode {
  \set stanza = #"5."
  The hearts of men are oft -- en hard
  And full of sel -- fish care:
  But in the sacr -- ed Heart we find
  A re -- fuge from des -- pair.
}

lyricVerseSix = \lyricmode {
  \set stanza = #"6."
  To Thee, my Je -- sus, then I come,
  A poor and help -- less child;
  And on Thine own words: Come to Me;
  My on -- ly hope I build.
}

lyricVerseSeven = \lyricmode {
  \set stanza = #"7."
  The world is cold, and life is sad,
  I crave the bless -- ed rest;
  Of those who lay their wear -- y heads
  Up -- on Thy sacr -- ed Breast.
}

lyricVerseEight = \lyricmode {
  \set stanza = #"8."
  For love is strong -- er far than death,
  And who can love like Thee,
  My Sa -- vior, Whose ap -- peal -- ing Heart,
  Broke on the Cross for me?
}

lyricVerseNine = \lyricmode {
  \set stanza = #"9."
  The pur -- est, deep -- est earth -- ly love,
  What is it, Lord, to Thine?
  A sing -- le drop from that great fount,
  E -- ter -- nal and di -- vine.
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

