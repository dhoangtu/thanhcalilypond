\version "2.18.2"

\header {
  title = "Virgin-Born, We Kneel Before Thee"
  composer = "Harriet, Medieval Melody"
  tagline = ##f
  source="https://musicasacra.com/music/english-hymns-in-the-commons/"
  license="thanhcalilypond.net - License CC0 1.0"
}

global= {
  \key f \major
  \time 3/4
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
  f2 a4 |
  c2 a4 |
  bes (c) d |
  c2 g4 |
  a (bes) c |
  bes (a) g |
  f2 d4 |
  e2 c4 |
  a'2 bes4 |
  c2 d4 |
  c2 g4 |
  a2. |
  bes2 bes4 |
  g (g) f |
  f (d) e |
  f2. \bar "|."
}

% Verse lyrics
verseOne = \lyricmode {
  \set stanza = #"1."
  Vir -- gin -- born, we kneel be -- fore thee;
  Bless -- ed was the womb that bore thee;
  Ma -- ry, Moth -- er meek and mild,
  Bless -- ed was she in her Child.
}

verseTwo = \lyricmode {
  \set stanza = #"2."
  Bless -- ed was the breast that fed thee;
  Bless -- ed was the hand that led thee;
  Bless -- ed was the watch she kept
  As the Ho -- ly Christ Child slept.
}

verseThree = \lyricmode {
  \set stanza = #"3."
  Bless -- ed she by all cre -- a -- tion,
  who brought forth the world's sal -- va -- tion,
  Bless -- ed they, for ev -- er blest,
  Who love most and serve thee best.
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
