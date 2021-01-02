\version "2.18.2"

\header {
  title = "Love Divine, All Loves Excelling"
  composer = "HYFRODOL, Charles Wesley"
  tagline = ##f
  source="https://musicasacra.com/music/english-hymns-in-the-commons/"
  license="thanhcalilypond.net - License CC0 1.0"
}

global= {
  \key f \major
  \time 3/4
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
}

\paper {
  #(set-paper-size "a5")
  top-margin = 5\mm
  bottom-margin = 5\mm
  left-margin = 10\mm
  right-margin = 10\mm
  indent = #0
  #(define fonts
	 (make-pango-font-tree "Liberation Serif"
	 		       "Liberation Serif"
			       "Liberation Serif"
			       (/ 20 20)))
  page-count = #1
}

printItalic = \with {
  \override LyricText.font-shape = #'italic
}

% Verse music
musicVerseSoprano = \relative c' {
  f2 g4 |
  f4. (g8) a4 |
  bes2 a4 |
  g (f) g |
  c2 bes4 |
  a2 a4 |
  g (f) g |
  f2. |
  f2 g4 |
  f4. (g8) a4 |
  bes2 a4 |
  g (f) g |
  c2 bes4 |
  a2 a4 |
  g (f) g |
  f2. |
  c'2 c4 |
  c (bes) a |
  bes2 bes4 |
  bes (a) g |
  a2 a4 |
  a (bes) c |
  c (bes) a |
  g2. |
  c4 (a) c |
  bes (g) bes |
  a (f) a |
  g8 (a bes a) g4 |
  c2 c4 |
  d (c) bes |
  a2 g4 |
  f2. \bar "|."
}

% Verse lyrics
verseOne = \lyricmode {
  \set stanza = #"1."
  Love di -- vine, all loves ex -- cel -- ling,
  Joy of heaven to earth come down;
  Fix in us thy hum -- ble dwell -- ing;
  All thy faith -- ful mer -- cies crown!
  Je -- sus, Thou art all com -- pas -- sion,
  Pure un -- bound -- ed love Thou art;
  Vi -- sit us with thy sal -- va -- tion;
  En -- ter ev -- ery trem -- bling heart.
}

verseTwo = \lyricmode {
  \set stanza = #"2."
  Breathe, O breathe thy lov -- ing Spi -- rit,
  In -- to ev -- ery troub -- led breast!
  Let us all in thee in -- he -- rit;
  Let us find that se -- cond rest.
  Take _ a -- way bent to sin -- ning;
  Al -- pha and o -- me -- ga be;
  End of faith, as its be -- gin -- ning,
  Set our hearts at li -- bert -- y.
}

verseThree = \lyricmode {
  \set stanza = #"3."
  Come, Al -- might -- y to de -- li -- ver,
  Let us all thy life re -- ceive;
  Sud -- den -- ly re -- turn and nev -- er,
  Nev -- er more thy tem -- ples leave.
  Thee we would be al -- ways bles -- sing,
  Serve Thee as thy hosts a -- bove,
  Pray and praise Thee with -- out ceas -- ing,
  Glo -- ry in thy per -- fect love.
}

verseFour = \lyricmode {
  \set stanza = #"4."
  Fin -- ish, then, thy new cre -- a -- tion;
  Pure and spot -- less let us be.
  Let us see thy great sal -- va -- tion
  Per -- fect -- ly re -- stored in thee;
  Changed from glo -- ry in -- to glo -- ry,
  Till in heaven we take our place,
  Till we cast our crowns be -- fore Thee,
  Lost in won -- der, love, and praise.
}

% Layout
\score {
    \new ChoirStaff <<
      \new Staff <<
        \clef "treble"
        \new Voice = "sopranos" { \global \stemUp \slurUp \musicVerseSoprano }
      >>
      \new Lyrics \lyricsto sopranos \verseOne
      \new Lyrics \printItalic \lyricsto sopranos \verseTwo
      \new Lyrics \lyricsto sopranos \verseThree
      \new Lyrics \printItalic \lyricsto sopranos \verseFour
    >>
}
