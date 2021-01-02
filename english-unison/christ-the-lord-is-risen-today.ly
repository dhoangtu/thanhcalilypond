\version "2.18.2"

\header {
  title = "Christ The Lord Is Risen Today"
  composer = "Charles Wesley"
  tagline = ##f
  source="https://musicasacra.com/music/english-hymns-in-the-commons/"
  license="thanhcalilypond.net - License CC0 1.0"
}

global= {
  \key g \major
  \time 2/4
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
  b'4 d |
  g, a8 (b) |
  c4 b |
  a2 |
  b4 c |
  a2 |
  g |
  b4 d |
  g, a8 (b) |
  c4 b |
  a2 |
  fis4 g |
  e2 |
  d |
  d4 g |
  fis d |
  g a |
  b2 |
  b4 d |
  d (cis) |
  d2 |
  b4 d |
  g, a8 (b) |
  c4 b |
  a2 |
  b4 c |
  a2 |
  g \bar "|."
}

% Verse lyrics
verseOne = \lyricmode {
  \set stanza = #"1."
  Christ the Lord is risen to -- day, Al -- le -- lu -- ia!
  Earth and heaven in cho -- rus say, Al -- le -- lu -- ia!
  Raise your joys and tri -- umphs high, Al -- le -- lu -- ia!
  Sing, ye heavens, and earth re -- ply, Al -- le -- lu -- ia!
}

verseTwo = \lyricmode {
  \set stanza = #"2."
  Soar we now where Christ has led, Al -- le -- lu -- ia!
  Fol'w -- ing our ex -- al -- ted Head, Al -- le -- lu -- ia!
  Made like him, like him we rise, Al -- le -- lu -- ia!
  Ours the cross, the grace, the skies, Al -- le -- lu -- ia!
}

verseThree = \lyricmode {
  \set stanza = #"3."
  King of glo -- ry, soul of bliss, Al -- le -- lu -- ia!
  Ev -- er -- last -- ing life is this, Al -- le -- lu -- ia!
  Thee to know, thy power to prove, Al -- le -- lu -- ia!
  Thus to sing, and thus to love, Al -- le -- lu -- ia!
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
