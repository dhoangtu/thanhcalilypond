\version "2.18.2"

\header {
  title = "Now My Tongue, The Mystery Telling"
  composer = "Pange Lingua"
  tagline = ##f
  source="https://musicasacra.com/music/english-hymns-in-the-commons/"
  copyright = \markup { \abs-fontsize #8 { \char ##x00A9 "Creative Commons Attribution 3.0, for non-commercial use." } }
}

global= {
  \key c \major
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
  system-system-spacing = #'((basic-distance . 3) (padding . 3))
}

printItalic = \with {
  \override LyricText.font-shape = #'italic
}

% Verse music
musicVerseSoprano = \relative c'' {
  c4 b8 (a) g4 e |
  e f g g |
  g a8 (b) c4 c |
  c b c2 |
  c4 b8 (a) g4 e |
  e f g g |
  g a8 (b) c4 c |
  b a g2 |
  fis4 fis fis fis |
  fis4 g8 (a) b4 b |
  c b8 (a) g4 c |
  c b c2 \bar "|."
}

% Verse lyrics
verseOne = \lyricmode {
  \set stanza = #"1."
  Now my tongue, the mys -- t'ry tell -- ing,
  Of the glo -- rious bod -- y sing,
  And the blood, all price ex -- cel -- ling,
  Which the na -- tions' Lord and King,
  Once on earth a -- mong us dwell -- ing,
  Shed for this world's ran -- som -- ing.
}

verseTwo = \lyricmode {
  \set stanza = #"2."
  That last night, at sup -- per ly -- ing,
  with the twelve, his cho -- sen band.
  Je -- sus with the law com -- ply -- ing,
  Keeps the feast its rites de mand.
  Then, more pre -- cious food sup -- ply -- ing,
  Gives him -- self with his own hand.
}

verseThree = \lyricmode {
  \set stanza = #"3."
  There -- fore we, be -- fore him bend -- ing,
  This great Sac -- ra -- ment re -- vere;
  Faith, her aid to sight is lend -- ing;
  Though un -- seen, the Lord is near;
  An -- cient types and shad -- ows end -- ing,
  Christ our pas -- chal lamb is here.
}

verseFour = \lyricmode {
  \set stanza = #"4."
  Glo -- ry let us give, and bless -- ing,
  To the Fath -- er and the Son.
  Hon -- or, thanks and praise ad -- dress -- ing
  While e -- ter -- nal a -- ges run,
  And the Spir -- it's pow'r con -- fess -- ing,
  Who from both with both is one.
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
      \new Lyrics \printItalic \lyricsto sopranos \verseTwo
    >>
}
