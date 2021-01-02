\version "2.18.2"

\header {
  title = "Be Thou My Vision"
  composer = "Traditional Irish, Mark Hamilton Dwey"
  tagline = ##f
  source="https://musicasacra.com/music/english-hymns-in-the-commons/"
  license="thanhcalilypond.net - License CC0 1.0"
}

global= {
  \key ees \major
  \time 3/4
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
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
  ees4 ees f8 (ees) |
  c4 bes bes8 (c) |
  ees4 ees f |
  g2. |
  f4 f f |
  f g bes |
  c bes g |
  bes2. |
  c4 c8 (d) ees d |
  c4 bes g |
  bes ees, d |
  c2 bes4 |
  ees g bes |
  c8 bes g4 ees8 (g) |
  f4 ees ees |
  ees2. \bar "|."
}

% Verse lyrics
verseOne = \lyricmode {
  \set stanza = #"1."
  Be Thou my vis -- ion, through night and come day;
  'Light on me al -- ways, thy Spir -- it to stay
  Thou, E -- ter -- nal Fa -- ther, the Great and the Last,
  The wise and true sov - 'reign of all that shall pass.
}

verseTwo = \lyricmode {
  \set stanza = #"2."
  Be Thou my wis -- dom, my staff and my stay,
  Shine through the dark -- ness; give light to my way!
  Be Thou the _ true source of all I en -- joy,
  So let car -- nal plea - sures no lon -- ger an -- noy.
}

verseThree = \lyricmode {
  \set stanza = #"3."
  The Thou my Guar -- dian, my sword in the fight;
  Be Thou my dig -- ni -- ty, Thou my de -- light;
  Thou my soul's _ shel -- ter and Thou my high tow'r,
  Wilt Thou raise me hea -- ven -- ward, O pow'r of my pow'r.
}

verseFour = \lyricmode {
  \set stanza = #"4."
  Rich -- es I heed not, or man's emp -- ty praise,
  Thou mine in -- her -- i -- tance,
  Now and al -- ways;
  Thou and Thou _ on -- ly, still first in my heart,
  The high King of hea - ven, my trea -- sure Thou art.
}

verseFive = \lyricmode {
  \set stanza = #"5."
  High King of hea -- ven, my vic -- to -- ry won,
  May I reach heav -- en's joys, O bright heav'ns sun!
  Heart of my _ own heart, what -- ev -- er be -- fall,
  Still be Thou my vi - sion, O ru -- ler of all.
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
      \new Lyrics \lyricsto sopranos \verseFive
    >>
}
