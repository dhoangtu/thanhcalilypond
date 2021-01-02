\version "2.18.2"

\header {
  title = "On This Day, O Beautiful Mother"
  composer = "Rohr's Catholic Melodies, Louis Lambillotte, SJ."
  tagline = ##f
  source="https://musicasacra.com/music/english-hymns-in-the-commons/"
  license="thanhcalilypond.net - License CC0 1.0"
}

globalSettings = {
  \key c \major
  \time 3/4
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
}

printItalic = \with {
  \override LyricText.font-shape = #'italic
}

% Chorus music
musicChorusSoprano = \relative c' {
  e4 (d) e |
  g2 g4 |
  f e f |
  a2 g4 |
  e (d) e |
  g2 g4 |
  d e f |
  e2. |
  e4 d e |
  g2 g4 |
  f e f |
  a2 g4 |
  e d e |
  g2 g4 |
  d (e) d |
  c2.
  \once  \override Score.RehearsalMark.self-alignment-X = #RIGHT
  \once \override Score.RehearsalMark.font-shape = #'italic
  \mark "Fine"
  \bar "|."
}

% Verse music
musicVerseSoprano = \relative c'' {
  \set Score.currentBarNumber = #17
  c2 b4 |
  a2 g4 |
  a2 g4 |
  g2. |
  c2 b4 |
  a2 g4 |
  f2 d4 |
  e2. |
  g2 fis4 |
  a2 g4 |
  c (b) a |
  a2 (g4) |
  g2 fis4 |
  a2 g4 |
  c2 fis,4 |
  g2 (fis8 f!)
  \once \override Score.RehearsalMark.self-alignment-X = #RIGHT
  \once \override Score.RehearsalMark.font-shape = #'italic
  \mark "D.S. al Fine"
  \bar "||"
}

% Chorus lyrics
lyricChorus = \lyricmode {
  On this day, O beau -- ti -- ful Mo -- ther,
  On this day we give thee our love.
  Near thee, Ma -- don -- na, fond -- ly we ho -- ver,
  Trust -- ing thy gen -- tle care to prove.
}

% Verse lyrics
lyricVerseOne = \lyricmode {
  \set stanza = #"1."
  On this day we ask to share,
  Dear -- est Mo -- ther, thy sweet care;
  Aid us ere our feet a -- stray
  Wan -- der from thy guid -- ing way.
}

lyricVerseTwo = \lyricmode {
  \set stanza = #"2."
  Queen of an -- gels, deign to hear
  Lisp -- ing child -- ren's hum -- ble prayer;
  youn hearts gain, O vir -- gin pure,
  Sweet -- ly to thy -- self al -- lure.
}

lyricVerseThree = \lyricmode {
  \set stanza = #"3."
  Rose of Sha -- ron, love -- ly flow'r,
  Beau -- teous bud of e -- den's bow'r.
  Cher -- ished li -- ly of the vale,
  Vir -- gin Mo -- ther's Queen we hail
}

lyricVerseFour = \lyricmode {
  \set stanza = #"4."
  In_vain the flow'rs of love we bring,
  In_vain sweet mus -- ic's note we sing,
  If_con -- trite heart and low -- ly pray'r,
  Guid_not our gifts to thy bright sphere.
}

lyricVerseFive = \lyricmode {
  \set stanza = #"5."
  Fast our days of life we run,
  Soon the night of death will come;
  Tower of strength in that dread hour,
  Come with all thy gen -- tle power.
}

% Layout
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

\score {
    \new ChoirStaff <<
      \new Staff <<
        \clef "treble"
        \override Staff.TimeSignature #'stencil = ##f
        \new Voice = "soprano" {
          \voiceOne \globalSettings \verseSettings \stemUp \slurUp \musicVerseSoprano
        }
      >>
      \new Lyrics \lyricsto soprano \lyricVerseOne
      \new Lyrics \printItalic \lyricsto soprano \lyricVerseTwo
      \new Lyrics \lyricsto soprano \lyricVerseThree
      \new Lyrics \printItalic \lyricsto soprano \lyricVerseFour
      \new Lyrics \lyricsto soprano \lyricVerseFive
    >>
}
