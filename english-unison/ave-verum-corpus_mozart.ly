\version "2.18.2"

\header {
  title = "Ave Verum Corpus"
  composer = "W.A. Mozart"
  tagline = ##f
  source="https://musicasacra.com/music/english-hymns-in-the-commons/"
  license="thanhcalilypond.net - License CC0 1.0"
}

global= {
  \key d \major
  \time 4/4
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
}

printItalic = \with {
  \override LyricText.font-shape = #'italic
}

% Verse music
musicVerseSoprano = \relative c'' {
  a2 d4 (fis,) |
  a (gis) g!2 |
  g4 (b) a (g) |
  g (fis) fis2 |
  e2. e4 |
  fis fis g g |
  g2 (fis4) fis |
  e1 |
  e2. a4 |
  a (gis) gis2 |
  e4 (gis2) b4 |
  b (a) a a |
  d1 ( |
  d4 cis) b a |
  a2 (gis4) gis |
  a1 |
  a2. a4 |
  a (bes) bes2 |
  bes4 (d) c! (bes) |
  bes (a) a2 |
  g2. g4 |
  g4 (bes) a g |
  g2 (f!8 e) f4 |
  e2 r2 |
  fis2. fis4 |
  fis (e) d (g) |
  g2. g4 |
  g (fis) e a |
  a1 ( |
  a4 g) a b |
  fis2 (e4.) fis8 |
  g2 g |
  d'1 ( |
  d2 dis |
  e4 b cis d! |
  cis b8 a) d4 g, |
  fis2 (e4.) e8 |
  d1 \bar "|."
}

% Verse lyrics
verseOne = \lyricmode {
  A -- ve, a -- ve ve -- rum cor -- pus,
  na -- tum de Ma -- ri -- a vir -- gi -- ne,
  ve -- re pas -- sum im -- mo la -- tum in cru -- ce pro ho -- mi -- ne.
  Cu -- jus la -- tus per -- fo -- ra -- tum un -- da flu -- xit et san -- gui -- ne,
  es -- to no -- bis prae -- gus -- ta -- tum in mor -- tis ex -- a -- mi -- ne,
  in mor -- tis ex -- a -- mi -- ne.
}


% Layout
\score {
    \new ChoirStaff <<
      \new Staff <<
        \clef "treble"
        \new Voice = "sopranos" { \global \stemUp \slurUp \musicVerseSoprano }
      >>
      \new Lyrics \lyricsto sopranos \verseOne
    >>
}
