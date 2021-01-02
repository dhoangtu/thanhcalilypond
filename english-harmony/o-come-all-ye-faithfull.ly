\version "2.18.2"

\header {
  title = "O Come, All Ye Faithful"
  composer = "John Francis Wade (1711–1786), Frederick Oakley (1802–1880)"
  tagline = ##f
  copyright = "Public Domain"
}

globalSettings = {
  \set Score.barNumberVisibility = #all-bar-numbers-visible
  \key g \major
  \time 4/4
}

verseSettings = {
  \phrasingSlurDashed
}

\paper {
  #(set-paper-size "a4")
  top-margin = 15\mm
  bottom-margin = 15\mm
  left-margin = 20\mm
  right-margin = 20\mm
  indent = #0
  #(define fonts
	 (make-pango-font-tree "Liberation Serif"
	 		       "Liberation Serif"
			       "Liberation Serif"
			       (/ 20 20)))
}

printItalic = \with {
  \override LyricText.font-shape = #'italic
}

% Soprano verse music
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

% Alto verse music
musicVerseAlto = \relative c' {
  \partial 4 d4 |
  d2 d4 \(d\) |
  e2 \(d\) |
  d4 \(d\) d \(e\) |
  d2 \(d4\) b |
  b (cis) d cis |
  d \(d\) d d |
  d2 (cis4.) d8 |
  d2. r4 |
  d2 e8 \(fis g4\) |
  \slurDashed g \( (fis) g2 \)|
  d4 \(d\) e \(e\) |
  d2 d4 \bar "||"
}

% Tenor verse music
musicVerseTenor = \relative c' {
  \partial 4 b4 |
  b2 b4 \(b\) |
  c2 \(a\) |
  g4 \(a\) g \(g\) |
  g2 \(fis4\) g |
  g2 a4 a |
  a \(g\) fis d |
  a'2 (g4.) fis8 |
  fis2. r4 |
  b2 c4 \(d\) |
  c2 \(d\) |
  d4 \(g,\) b \(c\) |
  a4. (g8) fis4 \bar "||"
}

% Basso verse music
musicVerseBasso = \relative c' {
  \partial 4 g4 |
  g2 g4 \(g\) |
  g2 \(fis\) |
  g4 \(fis\) g \(c,\) |
  d2 \(d4\) e |
  e2 d4 a |
  d \(b\) fis g |
  a2 (a4.) a8 |
  d2. r4 |
  b'2 a4 \(g\) |
  a2 \(g\) |
  fis4 \(g\) e \(c\) |
  d2 d4 \bar "||"
}

% Soprano chorus music
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

% Alto chorus music
musicChorusAlto = \relative c' {
  \partial 4 d4 |
  d1 ( |
  d2. ) d4 |
  d d d d |
  d2 d4 g |
  fis g d d8 cis |
  d2 d4 (e) |
  d2 (d4.) b8 |
  b2. \bar "|."
}

% Tenor chorus music
musicChorusTenor = \relative c' {
  \partial 4 b4 |
  b a b c |
  b2. g4 |
  g fis g a |
  g2 fis4 d' |
  d d a a |
  a2 g |
  g (fis4.) g8 |
  g2. \bar "|."
}

% Basso chorus music
musicChorusBasso = \relative c' {
  \partial 4 r4 |
  r1 |
  r1 |
  r1 |
  r2 r4 g |
  a g fis e |
  d (c) b (c) |
  d2 (d4.) g,8 |
  g2. \bar "|."
}

% 10. Verse lyrics
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

% 11. Chorus lyrics
lyricChorus = \lyricmode {
  \set stanza = #"Refrain:"
  O come, let us a -- dore Him
  O come, let us a -- dore Him
  O come, let us a -- dore Him
  Christ the Lord
}

% 12. Layout
\score {
    \new ChoirStaff <<
      \new Staff <<
        \clef "treble"
        \new Voice = "soprano" {
          \voiceOne \globalSettings \verseSettings \stemUp \slurUp \musicVerseSoprano
        }
        \new Voice = "alto" {
          \voiceTwo \globalSettings \verseSettings \stemDown \slurDown \musicVerseAlto
        }
      >>
      \new Lyrics \lyricsto soprano \lyricVerseOne
      \new Lyrics \printItalic \lyricsto soprano \lyricVerseTwo
      \new Lyrics \lyricsto soprano \lyricVerseThree
      \new Lyrics \printItalic \lyricsto soprano \lyricVerseFour
      \new Staff <<
        \clef "bass"
        \new Voice = "tenor" {
          \voiceOne \globalSettings \verseSettings \stemUp \slurUp \musicVerseTenor
        }
        \new Voice = "basso" {
          \voiceTwo \globalSettings \verseSettings \stemDown \slurDown \musicVerseBasso
        }
      >>
    >>
}

\score {
    \new ChoirStaff <<
      \new Staff <<
        \clef "treble"
        \new Voice = "soprano" {
          \voiceOne \globalSettings \stemUp \slurUp \musicChorusSoprano
        }
        \new Voice = "alto" {
          \voiceTwo \globalSettings \stemDown \slurDown \musicChorusAlto
        }
      >>
      \new Lyrics \lyricsto soprano \lyricChorus
      \new Staff <<
        \clef "bass"
        \new Voice = "tenor" {
          \voiceOne \globalSettings \stemUp \slurUp \musicChorusTenor
        }
        \new Voice = "basso" {
          \voiceTwo \globalSettings \stemDown \slurDown \musicChorusBasso
        }
      >>
    >>
}
