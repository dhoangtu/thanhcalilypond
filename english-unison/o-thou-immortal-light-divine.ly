\version "2.18.2"

\header {
  title = "O Thou Immortal Light Divine"
  composer = " "
  tagline = ##f
  source="https://musicasacra.com/music/english-hymns-in-the-commons/"
  license="thanhcalilypond.net - License CC0 1.0"
}

global= {
  \key c \major
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
  system-system-spacing = #'((basic-distance . 3) (padding . 3))
}

printItalic = \with {
  \override LyricText.font-shape = #'italic
}

% Verse music
musicVerseSoprano = \relative c'' {
                    \partial 4 g4 |
  f (e) f |
  d (e) f |
  g (a4.) a8 |
  g2 g4 |
  f (e) f |
  d (e) f |
  g (a4.) a8 |
  g2 a4 |
  c (b) c |
  a (g) f |
  g (f4.) e8 |
  d2 g4 |
  f (e) f |
  d (e) f |
  g (a4.) a8 |
                    g2 \bar "|."
}

% Verse lyrics
verseOne = \lyricmode {
  \set stanza = #"1."
  O Thou im -- mor -- tal light di -- vine!
  Dread Tri -- ni -- ty in U -- ni try!
  Al -- might -- y One! Al -- might -- y Trine!
  Give ear to thy cre -- a -- tion's cry.
}

verseTwo = \lyricmode {
  \set stanza = #"2."
  Three Per -- sons, one im -- men -- si -- ty
  En cir -- cling ut -- most space and time
  One great -- ness, glo -- ry, sanc -- ti -- ty,
  One ev -- er -- last -- ing truth sub -- lime.
}

verseThree = \lyricmode {
  \set stanza = #"3."
  To Fa -- ther, Son, and Ho -- ly Ghost,
  Tri -- u -- nal Lord of earth and heav'n:
  From earth and from the heav'n -- ly host
  Be sem -- pi -- ter -- nal glo -- ry given!
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
