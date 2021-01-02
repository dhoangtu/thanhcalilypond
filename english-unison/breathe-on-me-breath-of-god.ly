\version "2.18.2"

\header {
  title = "Breathe On Me, Breath Of God"
  composer = "John Chetham, Edwin Hatch"
  tagline = ##f
  source="https://musicasacra.com/music/english-hymns-in-the-commons/"
  license="thanhcalilypond.net - License CC0 1.0"
}

global= {
  \key g \major
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
musicVerseSoprano = \relative c' {
  e2 b'4 a |
  g2 fis |
  e1 |
  b'2 d4 c |
  b2 a |
  b1 |
  e,2 fis4 e |
  b'2 g |
  a4 g fis2 |
  fis2 b4 a |
  g2 fis |
  e1 \bar "|."
}

% Verse lyrics
verseOne = \lyricmode {
  \set stanza = #"1."
  Breathe on me, breath of God, fill me with life a -- new,
  that I may love what Thou dost love, and do what Thou wouldst do.
}

verseTwo = \lyricmode {
  \set stanza = #"2."
  Breathe on me, breath of God, un -- til my heart is pure,
  un -- til with Thee I wil one will, to do and to en -- dure.
}

verseThree = \lyricmode {
  \set stanza = #"3."
  Breathe on me, breath of God, till I am whol -- y thine,
  till all this earth -- ly part of me glows with thy fire di -- vine.
}

verseFour = \lyricmode {
  \set stanza = #"4."
  Breathe on me, breath of God, so shall I nev -- er die,
  but live with Thee the per -- fect life of tine e -- ter -- ni -- ty.
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
