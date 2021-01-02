\version "2.18.2"

\header {
  title = "Soul Of My Savior"
  composer = "ANIMA CHRISTI, Dobici"
  tagline = ##f
  source="https://musicasacra.com/music/english-hymns-in-the-commons/"
  license="thanhcalilypond.net - License CC0 1.0"
}

global= {
  \key f \major
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
  a2 bes4 a |
  g2 g |
  g4 a f g |
  a1 |
  c2 d4 c |
  bes2 a |
  a4 g f a |
  g1 |
  g2 a4 g |
  f2 f |
  a4 a bes a |
  g1 |
  d'2 c4 bes |
  bes2 a |
  g4 a bes g |
  f1 \bar "|."
}

% Verse lyrics
verseOne = \lyricmode {
  \set stanza = #"1."
  Soul of my Sav -- ior sanc -- ti -- fy my breast,
  Bod -- y of Christ, be Thou my sav -- ing guest;
  Blood of my Sav -- ior, bathe me in thy tide,
  Wash me with wa -- ter flow -- ing from thy side.
}

verseTwo = \lyricmode {
  \set stanza = #"2."
  Strength and pro -- tec -- tion may thy pas -- sion be;
  O bless -- ed Je -- sus, hear and an -- swer me;
  Deep in thy wounds, Lord, hide and shel -- ter me,
  So shall I nev -- er, nev -- er part from Thee.
}

verseThree = \lyricmode {
  \set stanza = #"3."
  Guard and de -- fend me from the foe ma -- lign;
  In death's dread mo -- ments make me on -- ly thine;
  Call me and bid me come to Thee on high,
  Where I may praise Thee with thy saints for aye.
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
