\version "2.18.2"

\header {
  title = "Praise, My Soul, The King Of Heaven"
  composer = "John Goss, Henry Francis Lyte"
  tagline = ##f
  source="https://musicasacra.com/music/english-hymns-in-the-commons/"
  license="thanhcalilypond.net - License CC0 1.0"
}

global= {
  \key d \major
  \time 2/4
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
  a4 a |
  a a |
  d cis |
  b2 |
  a |
  g4 fis |
  b a |
  fis g |
  e2 |
  fis4 fis |
  fis fis |
  b a |
  a gis |
  a b |
  cis d |
  fis, gis |
  a2 |
  d4 cis |
  b a |
  d cis |
  b a |
  b a |
  g e |
  d cis |
  d2 \bar "|."
}

% Verse lyrics
verseOne = \lyricmode {
  \set stanza = #"1."
  Praise, my soul, the King of heav -- en;
  To his feet thy tri -- bute bring;
  Ran -- somed, healed re -- stored, for -- giv -- en,
  Ev -- er -- more his prais -- es sing;
  Praise him! Praise him! Praise him! Praise him!
  Praise the ev -- er -- last -- ing King.
}

verseTwo = \lyricmode {
  \set stanza = #"2."
  Praise him for his grace and fa -- vor to our fa -- thers in dis -- tress;
  Praise him, still, the same as ev -- er,
  slow to chide, and swift to bless:
  Al -- le -- lu -- ia! Al -- le -- lu -- ia!
  Glo -- rious in his faith -- ful -- ness.
}

verseThree = \lyricmode {
  \set stanza = #"3."
  Fa -- ther like He tends and spares us;
  well our fee -- ble frame He knows;
  In his hand He gen -- tly bears us,
  Res -- cues us from all our foes.
  Al -- le -- lu -- ia! Al -- le -- lu -- ia!
  Wide -- ly yet his mer -- cy flows.
}

verseFour = \lyricmode {
  \set stanza = #"4."
  An -- gels help us to a -- dore him;
  Ye be -- hold him face to face;
  Sun and moon, bow down be -- fore him,
  dwell -- ers all in time and space.
  Al -- le -- lu -- ia! Al -- le -- lu -- ia!
  Praise with us the God of grace.
}

% Layout
\score {
    \new ChoirStaff <<
      \new Staff <<
        \clef "treble"
        \new Voice = "sopranos" { \voiceOne \global \stemUp \slurUp \musicVerseSoprano }
      >>
      \new Lyrics \lyricsto sopranos \verseOne
      \new Lyrics \printItalic \lyricsto sopranos \verseTwo
      \new Lyrics \lyricsto sopranos \verseThree
      \new Lyrics \printItalic \lyricsto sopranos \verseFour
    >>
}
