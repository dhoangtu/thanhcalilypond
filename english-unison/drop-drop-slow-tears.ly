\version "2.18.2"

\header {
  title = "Drop, Drop, Slow Tears"
  composer = "Orlando Gibbons, Phineas Fletcher"
  tagline = ##f
  source="https://musicasacra.com/music/english-hymns-in-the-commons/"
  license="thanhcalilypond.net - License CC0 1.0"
}

global= {
  \key f \major
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
  system-system-spacing = #'((basic-distance . 3) (padding . 5))
}

printItalic = \with {
  \override LyricText.font-shape = #'italic
}

% Verse music
musicVerseSoprano = \relative c' {
  f2 a4 f |
  c'2. f,4 |
  bes4. bes8 bes4 a |
  g2. g4 |
  e f d c |
  f a g g |
  f1 \bar "|."
}

% Verse lyrics
verseOne = \lyricmode {
  \set stanza = #"1."
  Drop, drop, slow tears,
  And bathe those beau -- teous feet,
  Which brought from heav'n
  The news and Prince of peace.
}

verseThree = \lyricmode {
  \set stanza = #"3."
  In your deep floods
  Drown all my faults and fears;
  Nor let his eye
  See sin, but through my tears.
}

% Layout
\score {
    \new ChoirStaff <<
      \new Staff <<
        \clef "treble"
        \new Voice = "sopranos" { \global \stemUp \slurUp \musicVerseSoprano }
      >>
      \new Lyrics \lyricsto sopranos \verseOne
      \new Lyrics \lyricsto sopranos \verseThree
    >>
}
