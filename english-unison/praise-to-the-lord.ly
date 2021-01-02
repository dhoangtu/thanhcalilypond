\version "2.18.2"

\header {
  title = "Praise To The Lord"
  composer = "Lobe den Herren, Stralsund Gesangbuch"
  tagline = ##f
  source="https://musicasacra.com/music/english-hymns-in-the-commons/"
  license="thanhcalilypond.net - License CC0 1.0"
}

global= {
  \key f \major
  \time 3/4
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \override Lyrics.LyricSpace.minimum-distance = #2.5
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
  f4 f c' |
  a4. g8 f4 |
  e d c |
  d e f |
  g2. |
  f2. |
  f4 f c' |
  a4. g8 f4 |
  e d c |
  d e f |
  g2. |
  f2. |
  c'4 c c |
  d2. |
  a4 bes c |
  c bes a |
  g2. |
  c,4 d e |
  f g a |
  g2. |
  f2. \bar "|."
}

% Verse lyrics
verseOne = \lyricmode {
  \set stanza = #"1."
  Praise to the Lord, the Al -- might -- y, the King of cre -- a -- tion!
  O my soul, praise him, for He is your health and sal -- va -- tion!
  Let all who hear now to his tem -- ple draw near,
  Join -- ing in glad a -- do -- ra -- tion!
}

verseTwo = \lyricmode {
  \set stanza = #"2."
  Praise to the Lord, who o'er all things is won -- drous -- ly reign -- ing!
  And, as on wings of an ea -- gle, up -- lift -- ing, sus -- tain -- ing.
  Have you not seen all that is need -- ful has been
  Sent by his gra -- cious or -- dain -- ing?
}

verseThree = \lyricmode {
  \set stanza = #"3."
  Praise to the Lord, who will pros -- per your work and de -- fend you;
  Sure -- ly his good -- ness and mer -- cy shall dai -- ly at -- tend you.
  Pon -- der a -- new what the Al -- might -- y can do
  As with his love He be -- friends you.
}

verseFour = \lyricmode {
  \set stanza = #"4."
  Praise to the Lord! O, let all that is in me a -- dore him!
  All that has life and breath, come now with prais -- es be -- fore him!
  Let the a -- men sound from his peo -- ple a -- gain.
  Glad -- ly for -- ev -- er a -- dore him!
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
      \new Lyrics \printItalic \lyricsto sopranos \verseFour
    >>
}
