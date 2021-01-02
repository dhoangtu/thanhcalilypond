\version "2.18.2"

\header {
  title = "Sweet Sacrament Divine"
  composer = "Fr. E. Stanfield"
  tagline = ##f
  source="https://musicasacra.com/music/english-hymns-in-the-commons/"
  license="thanhcalilypond.net - License CC0 1.0"
}

global= {
  \key ees \major
  \time 6/4
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
musicVerseSoprano = \relative c'' {
  \partial 2 g2 |
  bes2. aes4 f g |
  ees1 g2 |
  c,2. d4 ees f |
  g2 (f) g |
  bes2. aes4 f g |
  ees1 g2 |
  aes2. aes4 g f |
  ees1 ees2 |
  ees'2. ees4 d c |
  bes4. aes8 g2. g4 |
  c2. c4 bes g |
  f ees f2 g |
  bes2. aes4 f g |
  ees1 g2 |
  aes2. aes4 g f |
  ees1. \bar "|."
}

% Verse lyrics
verseOne = \lyricmode {
  \set stanza = #"1."
  Sweet sa -- cre -- ment di -- vine!
  Hid in thine earth -- ly home,
  Lo! 'round thy low -- ly shrine,
  With sup -- pliant hearts we come.
  Dear Lord, to Thee our voice we raise,
  in songs of love and heart -- felt praise,
  Sweet sa -- cra -- ment di -- vine!
  Sweet sa -- cra -- ment di -- vine!
}

verseTwo = \lyricmode {
  \set stanza = #"2."
  Sweet sa -- cra -- ment of peace!
  Dear home of ev -- 'ry heart,
  Where rest -- less yearn -- ings cease,
  And sor -- rows all de -- part.
  There in thine ear, all trust -- ful -- ly,
  We tell our tale of mis -- er -- y,
  Sweet sa -- cra -- ment of peace!
  Sweet sa -- cra -- ment of peace!
}

verseThree = \lyricmode {
  \set stanza = #"3."
  Sweet sa -- cra -- ment of rest! Ark from the o -- cean's roar,
  With -- in thy shel -- ter blest,
  Soon may we reach the shore.
  Save us, for still the tem -- pest races;
  Save lest we sink be -- neath the waves.
  Sweet sa -- cra -- ment of rest!
  Sweet sa -- cra -- ment of rest!
}

verseFour = \lyricmode {
  \set stanza = #"4."
  Sweet sa -- cra -- ment di -- vine!
  Earth's light and Ju -- bi -- lee,
  In thy far depths doth shine
  Thy God -- head's ma -- jes -- ty.
  Sweet light, so shine on us, we pray,
  That earth -- ly joys may fade a -- way,
  Sweet sa -- cra -- ment di -- vine!
  Sweet sa -- cra -- ment di -- vine!
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
