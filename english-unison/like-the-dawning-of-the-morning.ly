\version "2.18.2"

\header {
  title = "Like The Dawning Of The Morning"
  composer = "Joseph Mohr"
  tagline = ##f
  source="https://musicasacra.com/music/english-hymns-in-the-commons/"
  license="thanhcalilypond.net - License CC0 1.0"
}

global= {
  \key d \major
  \time 4/4
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
}

\paper {
  #(set-paper-size "a5")
  top-margin = 10\mm
  bottom-margin = 5\mm
  left-margin = 10\mm
  right-margin = 10\mm
  indent = #0
  #(define fonts
	 (make-pango-font-tree "Liberation Serif"
	 		       "Liberation Serif"
			       "Liberation Serif"
			       (/ 20 20)))
  system-system-spacing = #'((basic-distance . 2.5) (padding . 2.5))
}

printItalic = \with {
  \override LyricText.font-shape = #'italic
}

% Verse music
musicVerseSoprano = \relative c' {
  fis4 fis a a |
  d, e fis fis |
  g fis b a |
  g fis d2 |
  fis4 fis a a |
  d, e fis fis |
  e gis a8 (b) c4 |
  b b a2 |
  a4 b8 (cis) d4 a |
  g fis fis e |
  a b8 (cis) d4 a |
  g fis e2 |
  fis4 fis a a |
  e g fis d |
  fis g8 (a) b4 g |
  fis e d \bar "|."
}

% Verse lyrics
verseOne = \lyricmode {
  \set stanza = #"1."
  Like the dawn -- ing of the morn -- ing
  On the moun -- tain's gold -- en heights,
  like the break -- ing of the moon -- means,
  On the gloom of cloud -- y nights,
  Like a se -- cret told by an -- gels
  Get -- ing known up -- on the earth, is the Moth -- er's
  ex -- pec -- ta -- tion
  Of Mes -- si -- ah's speed -- y birth.
}

verseTwo = \lyricmode {
  \set stanza = #"2."
  Thou wast hap -- py bless -- ed Moth -- er,
  With the ver -- y bliss of heav'n,
  Since the an -- gel's sal -- u -- ta -- tion
  In the rap -- tur'd ear was giv'n;
  Since the A -- ve of that mid -- night,
  When thou wast a -- noint -- ed Queen,
  Like a riv -- er o -- ver -- flow -- ing
  Hath the grace with -- in thee been.
  
}

verseThree = \lyricmode {
  \set stanza = #"3."
  Thou hast wait -- ed, child of Da -- vid,
  And Thy wait -- ing now is o'er;
  Thou hast seen him, bless -- ed Moth -- er,
  And wilt see him ev -- er -- more.
  Oh, his hu -- man face of fea -- tures,
  They were pass -- ing sweet to see;
  Thou be -- hold -- est them this mo -- ment;
  Moth -- er, show them now to me.
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
    >>
}
