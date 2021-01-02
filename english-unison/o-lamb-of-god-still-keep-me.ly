\version "2.18.2"

\header {
  title = "O Lamb Of God, Still Keep Me"
  composer = "St. Christopher, Frederick C. Maker, James George Deck"
  tagline = ##f
  source="https://musicasacra.com/music/english-hymns-in-the-commons/"
  license="thanhcalilypond.net - License CC0 1.0"
}

global= {
  \key des \major
  \time 4/4
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \override Lyrics.LyricSpace.minimum-distance = #2.0
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
                    \partial 4 aes4 |
  aes4. aes8 ges4 bes |
  aes2 f4 f |
  ees4. f8 ges4 ges |
  f2.  f4 |
  des'4. des8 des4 c |
  bes (aes) ges f |
  ees4. ees8 e!4 e |
  f2. f4 |
  f4. ees8 des4 ees |
  f (ges) aes aes |
  bes4. bes8 bes4 f |
  ges2. ges4 |
  c4. bes8 aes4 ges |
  f2 aes4 ges |
  f4. des8 f4 ees |
                    des2. \bar "|."
}

% Verse lyrics
verseOne = \lyricmode {
  \set stanza = #"1."
  O Lamb of God, still keep me
  Near to thy wound -- ed side;
  'Tis on -- ly there in safe -- ty
  And peace I can a -- bide.
  What foes and snares sur -- round me;
  What lusts and fears with -- in!
  The grace that sought and found me
  A -- lone can keep me clean.
}

verseTwo = \lyricmode {
  \set stanza = #"2."
  'Tis on -- ly in Thee hid -- ing,
  I feel my life se -- cure;
  In Thee a -- lone a -- bi -- ding,
  The con -- flict can en -- dure:
  Tine arm the vic -- t'ry gain -- eth
  O'er ev -- 'ry hurt -- ful foe;
  Thy love my heart sus -- tain -- eth
  In all its care and woe.
}

verseThree = \lyricmode {
  \set stanza = #"3."
  Soon shall my eyes be -- hold Thee,
  With rap -- ture, face to face;
  One half hath not been told me
  Of all thy power and grace;
  Thy beau -- ty, Lord, and glo -- ry,
  The won -- ders of thy love,
  Shall be the end -- less sto -- ry
  Of all thy saints a -- bove.
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
