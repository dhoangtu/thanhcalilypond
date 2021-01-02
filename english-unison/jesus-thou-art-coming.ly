\version "2.18.2"

\header {
  title = "Jesus, Thou Art Coming"
  composer = "Charles Gounod, Sr. Marie Xavier"
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
  bes4 bes aes aes |
  g g ees f |
  g2 f |
  ees2. r4 |
  bes'4 bes aes aes |
  g g ees f |
  g2 f |
  ees2. r4 |
  f4 g bes aes |
  g aes c bes |
  aes2 g |
  f2. r4 |
  bes4 ees d c |
  bes g ees aes |
  g2 f |
  ees1 \bar "|."
}

% Verse lyrics
verseOne = \lyricmode {
  \set stanza = #"1."
  Je -- sus, Thou art com -- ing,
  Ho -- ly as Thou art,
  Thou, the God who made me,
  To my sin -- ful heart.
  Je -- sus I be -- lieve it
  On thy on -- ly word;
  Kneel -- ing I a -- dore Thee
  As my King and Lord.
}

verseTwo = \lyricmode {
  \set stanza = #"2."
  Who am I my Je -- sus,
  That Thou com'st to me?
  I have sinned a -- gainst Thee,
  Of -- ten griev -- ous -- ly;
  I am ver -- y sor -- ry
  I have caused Thee pain.
  I will nev -- er, nev -- er
  Wound thy heart a -- gain.
}

verseThree = \lyricmode {
  \set stanza = #"3."
  Dear -- est Lord, I love Thee
  With my whole, whole heart,
  Not for what Thou giv -- est,
  But for what Thou art.
  Come, oh, come sweet Sav -- ior!
  Come to me and stay,
  For I want Thee, Je -- sus,
  More than I can say.
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
