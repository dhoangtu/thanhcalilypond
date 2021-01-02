\version "2.18.2"

\header {
  title = "O Bread Of Heaven"
  composer = "Tr. Rev. E. VAUGHAN, C.SS.R."
  tagline = ##f
}

global= {
  \key c \major
  \time 3/4
  \tempo "Moderato"
  \dynamicUp
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
  \mark "Chorus"
  g'4 \p a b |
  c2-> e,4 |
  e (a) g |
  f2 \> (e4) \! \breathe |
  g a b |
  c2-> c4 |
  d2-> b4 |
  c2-> r4 \bar "||"
  \mark "Solo"
                  e \f d c |
  c \> (b) \! a |
  g (c) d |
  c2 \> (b4) \! \breathe |
  e d c |
  c \> (b) \! a |
  d2 fis,4 |
  g2 r4 \bar "||"
  \mark "Chorus"
                  g a b |
  c2 e,4 |
  e (a) g |
  f2 \> (e4) \! \breathe |
  g \mf a b |
  c2-> c4 |
  d2-> \mark "rall." b4 |
  c2 r4 \bar "|."
}

% Alto verse music
musicVerseAlto = \relative c' {
  e4 f f |
  g2 c,4 |
  c (e) d |
  d2 (c4) |
  e f f |
  g2 a4 |
  a2 g4 |
  g2 r4 \bar "||"
  e e e |
  e2 c4 |
  e (g) a |
  g2 (g4) |
  g fis g |
  d2 e4 |
  d2 c4 |
  d2 r4 \bar "||"
  d e f |
  g2 c,4 |
  c (e) d |
  d2 (c4) |
  e e e |
  e2 e4 |
  d2 d4 |
  e2 r4 \bar "|."
}

% Tenor verse music
musicVerseTenor = \relative c' {
  c4 c d |
  c2 g4 |
  a (c) g |
  g2. \breathe |
  c4 c d |
  c2 e4 |
  d2 d4 |
  e2 r4 \bar "||"
  g, gis a |
  a (gis) a |
  c2 a4 |
  e'2 (d4) \breathe |
  c a g |
  a (b) c |
  g2 a4 |
  b2 r4 \bar "||"
  b c d |
  e2 g,4 |
  a (c) g |
  g2. \breathe |
  c4 c b |
  a2 a4 |
  a2 g4 |
  g2 r4 \bar "|."
}

% Basso verse music
musicVerseBasso = \relative c {
  c4 f d |
  e2 c4 |
  a2 b4 |
  c2. |
  c4 f d |
  e2 a4 |
  f2 g4 |
  c,2 r4 |
  c b a |
  e'2 f4 |
  c (e) f |
  g2 (g4) |
  c, d e |
  fis (g) c, |
  b2 a4 |
  g2 r4 |
  g' g g |
  c,2 c4 |
  a2 b4 |
  c2. |
  c'4 a gis |
  a2 g!4 |
  f2 g4 |
  c,2 r4 \bar "|."
}

% Verse lyrics
verseOne = \lyricmode {
  \set stanza = #"1."
  O Bread of Heav'n be -- neath this veil, Thou dost my ver -- y God con -- ceal.
  My Je -- sus, dear -- est treas -- ure, hail! I love Thee, and a -- dor -- ing, kneel.
  Each lov -- ing soul by Thee is fed, with Thine own self in form of bread.
}

verseTwo = \lyricmode {
  \set stanza = #"2."
  O food of live! Thou who dost give the pledge of im -- mor -- tal -- i -- ty!
  I live; no, 'tis not I that live, God gives me life, God lives in me.
  He feeds my soul, He guides my ways, and with joy ev -- 'ry grief re -- pays.
}

verseThree = \lyricmode {
  \set stanza = #"3."
  My dear -- est Good, who dost so bind. My herat with count -- less chains to Thee!
  O sweet -- est love, my soul shall find in Thy dear bonds true li -- ber -- ty.
  Thy -- self, Thou hast best -- owed on me, Thine, Thine for e -- ver I will be.
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
      \new Lyrics \printItalic \lyricsto sopranos \verseThree
      \new Staff <<
        \clef "bass"
        \new Voice = "tenor" { \voiceOne \global \stemUp \slurUp \musicVerseTenor }
        \new Voice = "basso" { \voiceTwo \global \stemDown \slurDown \musicVerseBasso }
      >>
    >>
}
