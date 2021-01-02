\version "2.18.2"

\header {
  title = "Faith Of Our Fathers"
  composer = "Henri F. Hemy, Frederick Faber"
  tagline = ##f
  source="https://musicasacra.com/music/english-hymns-in-the-commons/"
  license="thanhcalilypond.net - License CC0 1.0"
}

global= {
  \key g \major
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

printBold = {
  \override Lyrics.LyricText.font-series = #'bold
}

% Verse music
musicVerseSoprano = \relative c'' {
  b4 a g |
  g fis (g) |
  a (e) fis |
  g2. |
  g4 fis e |
  d2 g4 |
  g (fis) g |
  a2. |
  b4 a g |
  g (fis) g |
  a (e) fis |
  g2. |
  g4 fis e |
  d2 b'4 |
  a (b) a |
  g2. \bar "||" \break
  c4 c c |
  b2 b4 |
  a2 a4 |
  b2. |
  b4 a g |
  e2 g4 |
  a2 a4 |
  g2. \bar "|."
}

% Verse lyrics
verseOne = \lyricmode {
  \set stanza = #"1."
  Faith of our fa -- thers, liv -- ing still,
  In spite of dun -- geon, fire and sword;
  O how our hearts beat high with joy
  When -- ever we hear that glo -- rious word!
  
  \printBold
  
  Faith of our fa -- thers, ho -- ly faith!
  We will be true to thee till death.
}

verseTwo = \lyricmode {
  \set stanza = #"2."
  Faith of our fa -- thers, we will strive
  To win all na -- tions un -- to thee;
  And through the truth that comes from God,
  We all shall then be tru -- ly free.
}

verseThree = \lyricmode {
  \set stanza = #"3."
  Faith of our fa -- thers, we will love
  Both friend and foe in all our strife;
  And preach thee, too, as love knows how
  By kind -- ly words and vir -- tuous life.
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
