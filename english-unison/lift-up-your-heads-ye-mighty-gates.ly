\version "2.18.2"

\header {
  title = "Lift Up Your Heads, Ye Mighty Gates"
  composer = "Thomas John Williams, Georg Weissel, Catherine Winkworth"
  tagline = ##f
  source="https://musicasacra.com/music/english-hymns-in-the-commons/"
  license="thanhcalilypond.net - License CC0 1.0"
}

global= {
  \key c \major
  \time 4/4
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \override Lyrics.LyricSpace.minimum-distance = #3.0
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
  system-system-spacing = #'((basic-distance . 3) (padding . 3))
}

printItalic = \with {
  \override LyricText.font-shape = #'italic
}

% Verse music
musicVerseSoprano = \relative c' {
  c2 e4. f8 |
  g2. g4 |
  a2 b |
  c2. g4 |
  c2 g |
  f4 (e) d (c) |
  f2 e |
  d2. d4 |
  g2 a |
  b2. d4 |
  d (c) b (a) |
  g2. g4 |
  g2 c |
  d,4 (a') g (f) |
  e2 d |
  c1 \bar "|."
}

% Verse lyrics
verseOne = \lyricmode {
  \set stanza = #"1."
  Lift up your heads, ye might -- y gates;
  Be -- hold the King of glo -- ry waits!
  The King of kings is draw -- ing near;
  The Sav -- iour of the world is here.
}

verseTwo = \lyricmode {
  \set stanza = #"2."
  O blest the land, the ci -- ty blest,
  Where Christ the rul -- er is con -- fest!
  O hap -- py hearts and hap -- py homes
  To whom this King of tri -- umph comes!
}

verseThree = \lyricmode {
  \set stanza = #"3."
  Fling wide the por -- tals of your heart;
  Make it a tem -- ple, set a -- part
  From earth -- ly use for heav'n's em -- ploy,
  A -- dorned with prayer and love and joy.
}

verseFour = \lyricmode {
  \set stanza = #"4."
  Re -- deem -- er, come, with us a -- bide;
  Our hearts to Thee we o -- pen wide;
  Let us thy in -- ner pres -- ence feel;
  Thy grace and love in us re -- veal.
}

verseFive = \lyricmode {
  \set stanza = #"5."
  Thy Ho -- ly Spi -- rit lead us on
  Un -- til our glor -- ious goal is won;
  E -- ter -- nal praise, e -- ter -- nal fame
  Be of -- fered, Sav -- iour, to thy Name.
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
    >>
}
