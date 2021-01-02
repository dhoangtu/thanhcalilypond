\version "2.18.2"

\header {
  title = "Hail, Queen Of Heaven"
  composer = "English Air"
  tagline = ##f
  source="https://musicasacra.com/music/english-hymns-in-the-commons/"
  license="thanhcalilypond.net - License CC0 1.0"
}

global= {
  \key ees \major
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
  system-system-spacing = #'((basic-distance . 2.5) (padding . 2.5))
}

printItalic = \with {
  \override LyricText.font-shape = #'italic
}

% Verse music
musicVerseSoprano = \relative c'' {
                    \partial 4 bes4 |
  bes (g) bes |
  bes2 ees4 |
  ees (d) c |
  bes2. |
  bes4 aes g |
  f (g) aes |
  g (bes) g |
  f2 bes4 |
  bes (g) bes |
  bes2 ees4 |
  ees (d) c |
  bes2. |
  bes4 aes g |
  f (g) aes |
  g2 f4 |
  ees2. |
  f4. g8 aes4 |
  g2. |
  bes4 g c |
  bes2. |
  c4 ees c |
  bes4. (aes8) g4 |
  aes2 f4 |
                    ees2 \bar "|."
}

% Verse lyrics
verseOne = \lyricmode {
  \set stanza = #"1."
  Hail Queen of heav'n, the o -- cean star,
  Guide of the wan -- d'rer here be -- low!
  Tossed on life's sea, I claim thy care,
  Save me from per -- il and from woe.
  Mo -- ther of Christ, Star of the sea,
  Pray for the wan -- d'rer pray for me.
}

verseTwo = \lyricmode {
  \set stanza = #"2."
  O gen -- tle, chaste, and spot -- less Maid,
  My sin -- ful soul now prays to thee;
  Re -- mind thy Son that He has paid
  My ran -- som from in -- i -- qui -- tu.
  Vir -- gin most pure, Star of the sea,
  Pray for the sin -- ner, pray for me.
}

verseThree = \lyricmode {
  \set stanza = #"3."
  So trav -- ers -- ing this vale of tears,
  To thee, blest ad -- vo -- cate, I cry;
  As -- suage my sor -- rows, calm my fears,
  And soothe with hope my mis -- e -- ry,
  Re -- fuge in grief, Star of the sea,
  Pray for the mourn -- er, pray for me.
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
