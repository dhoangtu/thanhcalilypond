\version "2.18.2"

\header {
  title = "Word Of God To Earth Descending"
  composer = "St. Thomas Aquinas, Robert Campbell"
  tagline = ##f
}

global= {
  \key ees \major
  \time 4/4
}

\paper {
  #(set-paper-size "a4")
  top-margin = 15\mm
  bottom-margin = 15\mm
  left-margin = 20\mm
  right-margin = 20\mm
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

% Soprano verse music
musicVerseSoprano = \relative c' {
  g'4 g bes g |
  g4. f8 f4 g |
  aes aes c aes |
  g f g2 |
  bes4 bes c c |
  d c8 (bes) ees4 bes |
  aes g8 (f) bes4 ees, |
  g4. f8 ees2 \bar "|."
}

% Alto verse music
musicVerseAlto = \relative c' {
  ees4 ees ees ees |
  ees4. d8 d4 ees |
  f f f f |
  ees d ees2 |
  g4 ees ees f |
  f d ees ees |
  ees d ees ees |
  ees d bes2 \bar "|."
}

% Tenor verse music
musicVerseTenor = \relative c' {
  bes4 bes bes bes |
  c4. c8 bes4 bes |
  c c c c |
  bes bes bes2 |
  bes4 bes bes a! |
  bes f' bes, bes |
  c bes bes c |
  bes aes g2 \bar "|."
}

% Basso verse music
musicVerseBasso = \relative c {
  ees4 ees g ees |
  aes4. aes8 aes4 g |
  f f aes f |
  bes bes, ees2 |
  ees4 g f f |
  bes aes! g g |
  f aes g aes |
  bes bes, ees2 \bar "|."
}

% Verse lyrics
verseOne = \lyricmode {
  \set stanza = #"1."
  Word of God to earth de -- scend -- ing, with the Fa -- ther pres -- ent still,
  Near His earth -- ly jour -- ney's end -- ing, Hastes his mis -- sion to ful -- fil.
}

verseTwo = \lyricmode {
  \set stanza = #"2."
  Might -- y Vic -- tim, earth's sal -- va -- tion, Heav'n -- ly gates un -- fold -- ing wide,
  Help thy peo -- ple in temp -- ta -- tion, Feed them from Thy bleed -- ing side.
}

verseThree = \lyricmode {
  \set stanza = #"3."
  Ho -- ly bo -- dy, blood all pre -- cious, Giv'n  by him to be our food,
  With them both he doth re -- fresh us, Formed like him of flesh and blood.
}

verseFour = \lyricmode {
  \set stanza = #"4."
  Un -- to Thee, the hid -- den man -- na, Fa -- ther, Spi -- rit, un -- to Thee,
  Let us raise the loud ho -- san -- na, And a -- dor -- ing bend the knee.
}

% Layout
\score {
    \new ChoirStaff <<
      \new Staff <<
        \clef "treble"
        \new Voice = "sopranos" { \voiceOne \global \stemUp \slurUp \musicVerseSoprano }
        \new Voice = "alto" { \voiceTwo \global \stemDown \slurDown \musicVerseAlto }
      >>
      \new Lyrics \lyricsto sopranos \verseOne
      \new Lyrics \printItalic \lyricsto sopranos \verseTwo
      \new Lyrics \lyricsto sopranos \verseThree
      \new Lyrics \printItalic \lyricsto sopranos \verseFour
      \new Staff <<
        \clef "bass"
        \new Voice = "tenor" { \voiceOne \global \stemUp \slurUp \musicVerseTenor }
        \new Voice = "basso" { \voiceTwo \global \stemDown \slurDown \musicVerseBasso }
      >>
    >>
}
