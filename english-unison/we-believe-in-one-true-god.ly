\version "2.18.2"

\header {
  title = "We Believe In One True God"
  composer = "Fred Til Bod, Tobias Clasunitzer"
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
musicVerseSoprano = \relative c'' {
  c4 g e g8 (f) |
  e4 c d2 |
  e4. g8 fis4 g |
  b a g2 |
  c4 g e g8 (f) |
  e4 c d2 |
  e4. g8 fis4 g |
  b a g2 |
  a4 g a8 (b) c4 |
  g f e2 |
  f4. f8 g4 e |
  d d c2 \bar "|."
}

% Verse lyrics
verseOne = \lyricmode {
  \set stanza = #"1."
  We be -- lieve in one true God,
  Fa -- ther, Son, and Ho -- ly Ghost.
  Ev -- er pres -- ent help in need,
  Praised by all the heav'n -- ly hosts;
  By whose might -- y pow'r a -- lone
  All is made and wrought and done.
}

verseTwo = \lyricmode {
  \set stanza = #"2."
  We be -- lieve in Je -- sus Christ,
  Son of God and Ma -- ry's son,
  Who des -- cend -- ed from his throne
  And for us sal -- va -- tion won;
  By whose cross and death are we
  Res -- cued from sin's mis -- er -- y.
}

verseThree = \lyricmode {
  \set stanza = #"3."
  We con -- fess the Ho -- ly Ghost,
  Who from both for e'er pro -- ceeds;
  Who up -- holds and com -- forts us
  In all tri -- als, fears, and needs;
  Blest and Ho -- ly Tri -- ni -- ty,
  Praise to you e -- ter -- nal -- ly.
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
