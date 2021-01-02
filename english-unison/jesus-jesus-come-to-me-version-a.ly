\version "2.18.2"

\header {
  title = "Jesus, Jesus Come To Me"
  composer = "Tr. Sister Jeanne Marie, Traditional Melody"
  tagline = ##f
  source="https://musicasacra.com/music/english-hymns-in-the-commons/"
  license="thanhcalilypond.net - License CC0 1.0"
}

global= {
  \key d \major
  \time 4/4
  \tempo "Slowly"
  \dynamicUp
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

% Soprano verse music
musicVerseSoprano = \relative c' {
  fis4 \p \< fis e fis \! |
  a4.-^ \> g8 g2 \! |
  g4 \< g fis g \! |
  b4.-^ \> a8 a2 \! |
  d4 \< d a b \! |
  b4.-^ \> a8 a2 \! |
  b4 b a \> fis |
  e4.-^ d8 d2 \! \bar "|."
}

% Basso verse music
musicVerseBasso = \relative c' {
  d4 d cis d |
  fis4. e8 e2 |
  cis4 cis d e |
  g4. fis8 fis2 |
  fis4 fis fis eis |
  eis4. fis8 fis2 |
  d4 d fis d |
  cis4. d8 d2 \bar "|."
}

% Verse lyrics
verseOne = \lyricmode {
  \set stanza = #"1."
  Je -- sus, Je -- sus, come to me, all my long -- ing is for Thee,
  Of all friends the best Thou art, make of me Thy coun -- ter -- part.
}

verseTwo = \lyricmode {
  \set stanza = #"2."
  Je - sus, I live for Thee, Je - sus, I die for Thee,
  I _ be - long to Thee, For - e'er in life and death.
}

% Layout
\score {
    \new ChoirStaff <<
      \new Staff <<
        \clef "treble"
        \new Voice = "sopranos" { \voiceOne \global \stemUp \slurUp \musicVerseSoprano }
        \new Voice = "basso" { \voiceTwo \global \stemDown \slurDown \musicVerseBasso }
      >>
      \new Lyrics \lyricsto sopranos \verseOne
      \new Lyrics \printItalic \lyricsto sopranos \verseTwo
    >>
}
