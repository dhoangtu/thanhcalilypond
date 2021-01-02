\version "2.18.2"

\header {
  title = "Soul Of My Savior"
  composer = "Austrian Song, J. Maher, S.J., ANIMA CHRISTI"
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
musicVerseSoprano = \relative c' {
  c2 f4 f |
  f2 e |
  f4 f g g |
  a1 |
  a2 g4 a |
  f2 e |
  e4 f e d |
  c1 |
  c'2 bes4 c |
  a2 g |
  c4 c bes c |
  a1 |
  g4 (bes) a g |
  f2 bes |
  a4 a g g |
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
