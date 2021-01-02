\version "2.18.2"

\header {
  title = "O Come, All Ye Faithful"
  composer = "John Francis Wade, Frederick Oakley"
  tagline = ##f
  source="https://musicasacra.com/music/english-hymns-in-the-commons/"
  license="thanhcalilypond.net - License CC0 1.0"
}

globalSettings = {
  \set Score.barNumberVisibility = #all-bar-numbers-visible
  \key g \major
  \time 4/4
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
}

verseSettings = {
  \phrasingSlurDashed
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
  \partial 4 g'4 |
  g2 d4 \(g\) |
  a2 \(d,\) |
  b'4 \(a\) b \(c\) |
  b2 \(a4\) g |
  g2 fis4 e |
  fis \(g\) a b |
  fis2 (e4.) d8 |
  d2. r4 |
  d'2 c4 \(b\) |
  c2 \(b\) |
  a4 \(b\) g \(a\)
  fis4. (e8) d4 \bar "||"
}

% Chorus music
musicChorusSoprano = \relative c' {
  \set Score.currentBarNumber = #13
  \partial 4 g'4 |
  g fis g a |
  g2 d4 b' |
  b a b c |
  b2 a4 b |
  c b a g |
  fis2 g4 (c) |
  b2 (a4.) g8 |
  g2. \bar "|."
}

% Verse lyrics
lyricVerseOne = \lyricmode {
  \set stanza = #"1."
  Oh, come, all ye faith -- ful,
  Joy -- ful and tri -- um -- phant!
  Oh, come ye, oh come - ye to Beth -- le -- hem.
  Come and be -- hold him,
  Born the King of an -- gels;
}

lyricVerseTwo = \lyricmode {
  \set stanza = #"2."
  — God, of — God,
  — Light — of — Light, —
  — Lo, He ab -- hors — not the Vir -- gins womb;
  Ve -- ry - God, be -- got -- ten, not cre -- at -- ed:
}

lyricVerseThree = \lyricmode {
  \set stanza = #"3."
  — Sing, choirs of an -- gels,
  Sing in ex -- ul -- ta -- tion;
  — Sing, all ye ci -- ti -- zens of heav’n a -- bove!
  Glo -- ry to God, -
  Glo -- ry in the high -- est;
}

lyricVerseFour = \lyricmode {
  \set stanza = #"4."
  — Yea, Lord, we greet thee,
  Born this hap -- py morn -- ing;
  — Je -- sus, to thee - - be glo -- ry giv’n.
  Son of the Fa -- ther,
  Now in flesh ap -- pear -- ing;
}

% Chorus lyrics
lyricChorus = \lyricmode {
  \set stanza = #"Refrain:"
  O come, let us a -- dore Him
  O come, let us a -- dore Him
  O come, let us a -- dore Him
  Christ the Lord
}

% Layout
\score {
    \new ChoirStaff <<
      \new Staff <<
        \clef "treble"
        \new Voice = "soprano" {
          \globalSettings \verseSettings \stemUp \slurUp \musicVerseSoprano
        }
      >>
      \new Lyrics \lyricsto soprano \lyricVerseOne
      \new Lyrics \printItalic \lyricsto soprano \lyricVerseTwo
      \new Lyrics \lyricsto soprano \lyricVerseThree
      \new Lyrics \printItalic \lyricsto soprano \lyricVerseFour
    >>
}

\score {
    \new ChoirStaff <<
      \new Staff <<
        \clef "treble"
        \new Voice = "soprano" {
          \globalSettings \stemUp \slurUp \musicChorusSoprano
        }
      >>
      \new Lyrics \lyricsto soprano \lyricChorus
    >>
}
