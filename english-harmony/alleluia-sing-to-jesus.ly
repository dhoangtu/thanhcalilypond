\version "2.18.2"

\header {
  title = "Alleluia, Sing To Jesus"
  arranger = "M: Rowland H. Prichard, W: William Chatterton Dix"
  tagline = ##f
  copyright = "Public Domain"
}

global= {
  \key f \major
  \time 3/4
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

minorNote = #(define-music-function
  (parser location note)
  (ly:music?)
  #{
    \tweak font-size #-3
    #note
  #}
)

% Soprano verse music
musicVerseSoprano = \relative c' {
  f2 g4
  f4. (g8) a4
  bes2 a4
  g (f) g
  c2 bes4
  a2 a4
  g (f) g
  f2.
  f2 g4
  f4. (g8) a4
  bes2 a4
  g (f) g
  c2 bes4
  a2 a4
  g (f) g
  f2.
  c'2 c4
  c (bes) a
  bes2 bes4
  bes (a) g
  a2 a4
  a (bes) c
  c (bes) a
  g2.
  c4 (a) c
  bes (g) bes
  a (f) a
  g8 (a bes a) g4
  c2 c4
  d (c) bes
  a2 g4
                    f2. \bar "|."
}

% Alto verse music
musicVerseAlto = \relative c' {
  c2 e4
  f2 f4
  g2 f4
  e (d) e
  f (c) d8 e
  f2 f8 e
  d4 (d) e
  f2.
  c2 e4
  f2 f4
  g2 f4
  e (d) e
  f (c) d8 (e)
  f2 f8 e
  d4 (d) e
  f2.
  e2 e4
  f2 f4
  f (e) d
  e (f) c
  c2 f4
  f (g) a
  a (g) f
  f2 (f4)
  f2 a4
  g2 g4
  f (c) f
  g8 (e f4) c
  c (f) ees
  d (f) f
  f2 e4
                    f2. \bar "|."
}

% Tenor verse music
musicVerseTenor = \relative c {
  <\minorNote f a>2 g4
  a4. (bes8) c4
  d (c) c
  c (a) c
  c2 c4
  c2 c4
  bes (a) c
  a2.
  <\minorNote f a>2 g4
  a4. (bes8) c4
  d (c) c
  c (a) c
  c2 c4
  c2 c4
  bes (a) c
  a2.
  c2 c4
  f, (g) a
  g2 g4
  g (c) bes
  a2 c4
  d2 c4
  d2 d4
  g,2.
  c2 d4
  d2 c4
  c (a) b!
  c (bes) bes
  a2 c4
  bes (c) d
  c2 bes4
                    f2. \bar "|." %32
}

% Basso verse music
musicVerseBasso = \relative c {
  f,4 (a) c
  f2 f4
  f (e) f
  c (d) c
  a'2 g4
  f2 a,4
  bes (d) c
  f2.
  f,4 (a) c
  f2 f4
  f (e) f
  c (d) c
  a'2 g4
  f2 a,4
  bes (d) c
  f2.
  a2 a4
  d,2 d4
  g2 g4
  c, (d) e
  f2 e4
  d2 a4
  g2 bes4
  c2.
  a'2 f4
  f (e8 d) e4
  f (e) d
  e8 (c d4) e
  f2 a,4
  bes (a) bes
  c2 c4
                    f,2. \bar "|." %32
}

% Verse lyrics
verseOne = \lyricmode {
  \set stanza = #"1."
  Al -- le -- lu -- ia! sing to Je -- sus,
  His the scep -- ter, His the throne;
  Al -- le -- lu -- ia! His the tri -- umph,
  His the vic -- to -- ry a -- lone.
  Hear the songs of ho -- ly Zi -- on
  thun -- der like a might -- y flood:
  Je -- sus out of ev -- ery na -- tion
  has re -- deemed us by His blood.
}

verseTwo = \lyricmode {
  \set stanza = #"2."
  Al -- le -- lu -- ia! not as or -- phans
  are we left in sor -- row now:
  Al -- le -- lu -- ia! he is near us;
  faith be -- lieves, but knows not how.
  Though the cloud from sight re -- ceived him
  whom the an -- gels now a -- dore,
  shall our hearts for -- get his pro -- mise,
  'I am with you ev -- er -- more'?
}

verseThree = \lyricmode {
  \set stanza = #"3."
  Al -- le -- lu -- ia! bread of hea -- ven,
  here on earth our food, our stay:
  Al -- le -- lu -- ia! here the sin -- ful
  come to you from day to day.
  In -- ter -- ces -- sor, friend of sin -- ners,
  earth's re -- deem -- er, plead for me,
  where the songs of all the sin -- less
  sweep ac -- ross the crys -- tal sea.
}

verseFour = \lyricmode {
  \set stanza = #"4."
  Al -- le -- lu -- ia! King e -- ter -- nal,
  you, the Lord of lords we own;
  Al -- le -- lu -- ia! born of Mary,
  earth your foot -- stool, hea -- ven your throne:
  you, with -- in the veil have en -- tered,
  robed in flesh, our great high priest;
  yours the blood and yours the bo -- dy,
  in our eu -- char -- ist -- ic feast.
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
      \new Lyrics \printItalic \lyricsto sopranos \verseFour
      \new Staff <<
        \clef "bass"
        \new Voice = "tenor" { \voiceThree \global \stemUp \slurUp \musicVerseTenor }
        \new Voice = "bass" { \voiceThree \global \stemDown \slurDown \musicVerseBasso }
      >>
    >>
}
