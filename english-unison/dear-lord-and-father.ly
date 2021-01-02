\version "2.18.2"

\header {
  title = "Dear Lord, And Father"
  composer = "John Greenleaf Whittier"
  tagline = ##f
  source="https://musicasacra.com/music/english-hymns-in-the-commons/"
  license="thanhcalilypond.net - License CC0 1.0"
}

global= {
  \key ees \major
  \time 4/4
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
}

\paper {
  #(set-paper-size "a5")
  top-margin = 5\mm
  bottom-margin = 5\mm
  left-margin = 10\mm
  right-margin = 10\mm
  indent = #0
  #(define fonts
	 (make-pango-font-tree "Liberation Serif"
	 		       "Liberation Serif"
			       "Liberation Serif"
			       (/ 20 20)))

  page-count = #1
}

printItalic = \with {
  \override LyricText.font-shape = #'italic
}

% Verse music
musicVerseSoprano = \relative c' {
                    \partial 4 ees4 |
  bes'4. bes8 c (bes) g (aes) |
  bes4. bes8 ees,4 ees |
  aes g d ees |
  bes2. bes4 |
  c g' f ees |
  d aes' g f |
  ees4. ees8 c'4 aes |
  f g8 (aes) bes4 c8 (d) |
  ees4 bes c8 (bes) g aes |
  bes2. bes4 |
  aes c, ees4. d8
  ees2. \bar "|."
}

% Verse lyrics
verseOne = \lyricmode {
  \set stanza = #"1."
  Dear Lord and Fa -- ther of man -- kind, for give our fool -- ish ways;
  re -- clothe us in our right -- ful mind, in pur -- er lives thy ser -- vice find,
  in deep -- er rev -- er -- ence, -
  In deep -- er rev -- erence praise.
}

verseTwo = \lyricmode {
  \set stanza = #"2."
  In sim -- ple trust like theirs who heard, be -- side the Syr -- ian sea,
  the gra -- cious call -- ing of the Lord, let us, like them, with -- out a word,
  rise up and fol -- low - Thee,
  Rise up, and fol -- low Thee.
}

verseThree = \lyricmode {
  \set stanza = #"3."
  O sab -- bath rest by Ga -- li -- lee, O calm of hills a -- bove,
  where Je -- sus knelt to share with Thee the si -- lence of e -- ter -- ni -- ty,
  in -- ter -- pret -- ed by - love,
  In -- ter -- pret -- ed by love.
}

verseFour = \lyricmode {
  \set stanza = #"4."
  Drop thy still dews of qui -- et -- ness, till all our striv -- ings cease;
  take from our souls the strain and stress, and let our or -- dered lives con -- fess,
  the beau -- ty of thy - peace,
  The beau -- ty of thy peace.
}

verseFive = \lyricmode {
  \set stanza = #"5."
  Breathe through the heats of our de -- sire thy cool -- ness and thy balm;
  let sense be dumb, let flesh re -- tire; speak through the earth -- quake, wind, and fire,
  O still, small voice of - calm, O still small voice of calm.
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
