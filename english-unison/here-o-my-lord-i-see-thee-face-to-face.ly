\version "2.18.2"

\header {
  title = "Here, O My Lord, I See Thee Face To Face"
  composer = "PENITENTIA, HORATIUS BONAR"
  tagline = ##f
  source="https://musicasacra.com/music/english-hymns-in-the-commons/"
  license="thanhcalilypond.net - License CC0 1.0"
}

global= {
  \key ees \major
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
musicVerseSoprano = \relative c'' {
  g2 g4 aes |
  bes2 ees, |
  f4. f8 g4 aes |
  g1 |
  g2 f4 ees |
  c'2 bes |
  bes4. bes8 aes4 g |
  f1 |
  g2 g4 aes |
  bes2 ees, |
  c'4. c8 c4 g |
  aes1 |
  aes2 g4 f |
  bes ees, ees aes |
  g2 f |
  ees1 \bar "|."
}

% Verse lyrics
verseOne = \lyricmode {
  \set stanza = #"1."
  Here, O my Lord, I see Thee face to face;
  Here would I touch and han -- dle things un -- seen,
  Here grasp with firm -- er hand e -- ter -- nal grace,
  And all my wea -- ri -- ness up -- on Thee lean.
}

verseTwo = \lyricmode {
  \set stanza = #"2."
  Here would I feed up -- on the bread of God,
  Here drink with Thee the roy -- al wine of heav'n.
  There would I lay a -- side each earth -- ly load,
  Here taste a -- fresh the calm of sin for -- giv'n.
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
    >>
}
