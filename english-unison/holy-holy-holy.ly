\version "2.18.2"

\header {
  title = "Holy, Holy, Holy!"
  composer = "Reginald Heber"
  tagline = ##f
  source="https://musicasacra.com/music/english-hymns-in-the-commons/"
  license="thanhcalilypond.net - License CC0 1.0"
}

global= {
  \key d \major
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
  d4 d fis fis |
  a2 a |
  b4. b8 b4 b |
  a2 fis |
  a4. a8 a4 a |
  d d cis a |
  e a b4. a8 |
  a1 |
  d,4 d fis fis |
  a a a2 |
  b4. b8 b4 b |
  a2 a |
  d2 a4 a |
  b2 fis |
  g4 e e4. d8 |
  d1 \bar "|."
}

% Verse lyrics
verseOne = \lyricmode {
  \set stanza = #"1."
  Ho -- ly, ho -- ly, ho -- ly! Lord _ God Al -- might -- y!
  Earl -- y in the morn - ing our song shall rise to Thee.
  Ho -- ly, ho -- ly, ho - ly! Mer -- ci -- ful and might -- y,
  God in three per -- sons, bles -- sed Tri -- ni -- ty.
}

verseTwo = \lyricmode {
  \set stanza = #"2."
  Ho -- ly, ho -- ly, ho -- ly! All the saints a -- dore thee,
  Cast -- ing down their gol -- den crowns a -- round the glas -- sy sea;
  Che -- ru -- bim and Se -- ra -- phim fal -- ling down be -- fore thee,
  which wert, and art, and ev -- er -- more shalt be.
}

verseThree = \lyricmode {
  \set stanza = #"3."
  Ho -- ly, ho -- ly, ho -- ly! Though the dark -- ness hide thee,
  Though the eye of sin -- ful man thy glo -- ry may not see,
  on -- ly thou art ho - ly, there is none be -- side thee,
  per -- fect in power, in love and pur -- i -- ty.
}

verseFour = \lyricmode {
  \set stanza = #"4."
  Ho -- ly, ho -- ly, ho -- ly! Lord _ God Al -- might -- y!
  All thy works shall praise thy name, in earth and sky and sea.
  Ho -- ly, ho -- ly, ho - ly Mer -- ci -- ful and migh -- ty,
  God in three per -- sons, bles -- sed Tri -- ni -- ty.
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
