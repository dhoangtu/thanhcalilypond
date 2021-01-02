\version "2.18.2"

\header {
  title = "All Glory, Laud and Honor"
  arranger = "Theodulph of Orleans, Melchior Teschner"
  tagline = ##f
  copyright = "Public Domain"
}

global= {
  \key bes \major
  \time 4/4
  % \override Score.BarNumber.break-visibility = ##(#t #t #t)
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

% Verse music
musicVerseSoprano = \relative c' {
                   \partial 4 bes4 |
  f' f g a |
  bes2 bes4 d |
  c bes bes a |
  bes2. bes,4 |
  f' f g a |
  bes2 bes4 d |
  c bes bes a |
  bes2. bes4 |
  d d c bes |
  a (g) f a |
  bes a g g |
  f2. f4 |
  d f g f |
  f (ees) d f |
  ees d c c |
                    bes2. \bar "|."
}

musicVerseAlto = \relative c' {
                   \partial 4 bes4 |
  c bes bes ees |
  ees (d8 c) d4 f |
  f8 ees d4 c c |
  d2. bes4 |
  c bes bes ees |
  ees (d8 c) d4 f4 |
  f8 ees d4 c c |
  d2. d4 |
  f g8 f e!4 f8 g |
  f4 (e!) f f |
  d8 e! f4 f e |
  f2. c4 |
  bes bes ees d |
  c (a) bes bes |
  bes bes bes a |
                    bes2. \bar "|."
}

musicVerseTenor = \relative c {
                   \partial 4 d4 |
  f d ees f |
  f2 f4 bes |
  a bes g f |
  f2. d4 |
  f d ees f |
  f2 f4 bes |
  a bes a f |
  f2. f4 |
  bes bes8 a g4 d' |
  c (bes) a d |
  bes c d c8 (bes) |
  a2. f4 |
  f bes bes bes |
  f2 f4 f |
  g f f4. ees8 |
                   d2. \bar "|."
}

musicVerseBasso = \relative c {
                   \partial 4 bes4 |
  a bes ees c |
  bes2 bes4 bes' |
  f g ees f |
  bes,2. bes4 |
  a bes ees c |
  bes2 bes4 bes |
  f' g f f |
  bes,2. bes4 |
  bes bes c d8 e! |
  f4 (c) d d |
  g, a bes c |
  f2. a,4 |
  bes d ees bes |
  a (f) bes d |
  ees bes f f |
                    bes2. \bar "|."
}

% Verse lyrics
verseOne = \lyricmode {
  \set stanza = #"1."
  All glo -- ry, laud, and hon -- or
  To thee, Re -- deem -- er, King
  To whom the lips of chil -- dren
  Made sweet ho -- san -- nas ring
  Thou art the King of Is -- rael
  Thou Da -- vid's roy -- al Son
  Who in the Lord's name com -- est
  The King and Bless -- ed One.
}

verseTwo = \lyricmode {
  \set stanza = #"2."
  The com -- pa -- ny of an -- gels
  Are prai -- sing thee on high
  And mor -- tal men and all things
  Cre -- at -- ed make re -- ply
  The peo -- ple of the He -- brews
  With palms be -- fore thee went;
  Our praise and love and an -- thems
  Be -- fore thee we pre -- sent.
}

verseThree = \lyricmode {
  \set stanza = #"3."
  To thee, be -- fore thy pas -- sion
  They sang their hymns of praise;
  To thee, now high ex -- alt -- ed
  Our me -- lo -- dy we raise
  Thou didst ac -- cept their prais -- es;
  Ac -- cept the love we bring
  Who in all good de -- light -- est
  Thou good and gra -- cious King.
}

% Layout
\score {
    \new ChoirStaff <<
      \new Staff <<
        \clef "treble"
        \new Voice = "sopranos" { \voiceOne \global \stemUp \slurUp \musicVerseSoprano }
        \new Voice = "alto" { \voiceTwo \global \stemDown \slurDown \musicVerseAlto }
      >>
      \new Lyrics \lyricsto sopranos \verseOne
      \new Lyrics \printItalic \lyricsto sopranos \verseTwo
      \new Lyrics \lyricsto sopranos \verseThree
      \new Staff <<
        \clef "bass"
        \new Voice = "tenor" { \voiceThree \global \stemUp \slurUp \musicVerseTenor }
        \new Voice = "bass" { \voiceThree \global \stemDown \slurDown \musicVerseBasso }
      >>
    >>
}

