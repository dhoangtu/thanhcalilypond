\version "2.18.2"

\header {
  title = "Round The Lord, In Glory Seated"
  composer = "Rustington, Richard Mant"
  tagline = ##f
  source="https://musicasacra.com/music/english-hymns-in-the-commons/"
  license="thanhcalilypond.net - License CC0 1.0"
}

global= {
  \key f \major
  \time 4/4
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \override Lyrics.LyricSpace.minimum-distance = #2.0
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
  \partial 2 f4. f8 |
  bes4 a g4. f8 |
  e4 c f f |
  d' c bes4. c8 |
  a2 g4 c |
  b! a g4. f8 |
  e4 c g' f |
  e c d4. d8 |
  c2 c4 ees |
  d4. d8 d4 f |
  f e e g |
  f4. f8 f4 bes |
  g2 g4 d' |
  c ees d c |
  bes a g bes |
  a g d e |
                    f2 \bar "|."
}

% Verse lyrics
verseOne = \lyricmode {
  \set stanza = #"1."
  Round the Lord in glo -- ry seat -- ed, Che -- ru -- bim and Se -- ra -- phim
  filled his tem -- ple, and re -- peat -- ed each to each the_al -- ter -- nate hymn:
  ''Lord, thy glo -- ry fills the heav -- en, earth is with its ful -- ness stored;
  un -- to Thee be glo -- ry gi -- ven, ho -- ly, ho -- ly, ho -- ly Lord!''
}

verseTwo = \lyricmode {
  \set stanza = #"2."
  Heav'n is still with glo -- ry ring -- ing, earth takes up the an -- gels' cry,
  ''Ho -- ly, ho -- ly, ho -- ly,'' sing -- ing ''Lord of hosts, the Lord most high.''
  With his se -- raph train be -- fore him, with his ho -- ly Church be -- low,
  thus con -- spire we to a -- dore him, bid we thus our an -- them flow.
}

verseThree = \lyricmode {
  \set stanza = #"3."
  ''Lord, thy glo -- ry fills the heav -- en, earth is with its ful -- ness stored;
  un -- to Thee be glo -- ry gi -- ven, ho -- ly, ho -- ly, ho -- ly Lord!''
  Thus thy glo -- rious name con -- fes -- sing, we a -- dopt thine an -- gels' cry,
  ''Ho -- ly, ho -- ly, ho -- ly,'' bless -- ing Thee, the Lord of hosts most high.
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
