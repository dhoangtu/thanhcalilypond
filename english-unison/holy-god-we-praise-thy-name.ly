\version "2.18.2"

\header {
  title = "Holy God, We Praise Thy Name"
  composer = "GROSSER GOTT, Katholisches Gesangbuch"
  tagline = ##f
  source="https://musicasacra.com/music/english-hymns-in-the-commons/"
  license="thanhcalilypond.net - License CC0 1.0"
}

global= {
  \key f \major
  \time 3/4
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \override Lyrics.LyricSpace.minimum-distance = #4.0
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
  print-page-number = #f
}

printItalic = \with {
  \override LyricText.font-shape = #'italic
}

% Verse music
musicVerseSoprano = \relative c' {
  f2 f4 |
  f (e) f |
  g (a) g |
  f2. |
  a2 a4 |
  a (g) f |
  c' (bes) a |
  a g r |
  f2 f4 |
  f (e) f |
  g (a) g |
  f2. |
  a2 a4 |
  a (g) f |
  c' (bes) a |
  a g r |
  
  \repeat volta 1 {
    g2 a8 (c) |
    bes4 (a) g |
    a2 bes8 (d) |
    c2. |
    d2 d4 |
    c (bes) a |
    bes (a) g |
    f2. \bar "|."
  }
}

% Verse lyrics
verseOne = \lyricmode {
  \set stanza = #"1."
  Ho -- ly God, we praise thy name!
  Lord of all, we bow be -- fore Thee!
  All on earth thy scep -- tre claim,
  All in heav'n a -- bove a -- dore Thee:
  In fi -- nite thy vast do -- main,
  Ev -- er -- last -- ing is thy name.
}

verseTwo = \lyricmode {
  \set stanza = #"2."
  Hark! The loud ce -- les -- tial hymn
  An -- gel choirs a -- bove are rais -- ing,
  Che -- ru -- bim and Se -- ra -- phim,
  In un -- ceas -- ing cho -- rus prais -- ing;
  Fill the heavens with sweet ac -- cord:
  Ho -- ly, ho -- ly, ho -- ly, Lord.
}

verseThree = \lyricmode {
  \set stanza = #"3."
  Lo! The ap -- os -- tol -- ic train
  Join the sac -- red name to hal -- low;
  Phoph -- ets swell the loud re -- frain,
  And the white robed mar -- tyrs fol -- low;
  And from morn to set of sun,
  Through the Church the song goes on.
}

verseFour = \lyricmode {
  \set stanza = #"4."
  Ho -- ly Fa -- ther, Ho -- ly Son,
  Ho -- ly Spir -- it, Three we name Thee;
  While in es -- sence on -- ly One,
  Un -- di -- vid -- ed God we claim Thee;
  And a -- dor -- ing bend the knee,
  While we own the mys -- ter -- y.
}

verseFive = \lyricmode {
  \set stanza = #"5."
  Thou art King of glo -- ry, Christ:
  Son of God, yet born of Ma -- ry;
  For us sin -- ners sac -- ri -- ficed,
  And to death a trib -- u -- tar -- y:
  First to break the bars of death,
  Thou has o -- pened heav'n to faith.
}

verseSix = \lyricmode {
  \set stanza = #"6."
  From thy high ce -- les -- tial home,
  Judge of all, a -- gain re -- turn -- ing,
  we be -- lieve that Thou shalt come
  In the dread -- ed dooms -- day morn -- ing;
  When Thou voice shall shake the earth,
  And the star -- tled dead come forth.
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
      \new Lyrics \lyricsto sopranos \verseFive
      \new Lyrics \printItalic \lyricsto sopranos \verseSix
    >>
}
