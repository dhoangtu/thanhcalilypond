\version "2.18.2"

\header {
  title = "O Bread Of Heaven"
  composer = "Tr. Rev. E. Vaughan, C.SS.R."
  tagline = ##f
  source="https://musicasacra.com/music/english-hymns-in-the-commons/"
  license="thanhcalilypond.net - License CC0 1.0"
}

global= {
  \key c \major
  \time 3/4
  \tempo "Moderato"
  \dynamicUp
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
        \new Voice = "sopranos" { \global \stemUp \slurUp \musicVerseSoprano }
      >>
      \new Lyrics \lyricsto sopranos \verseOne
      \new Lyrics \printItalic \lyricsto sopranos \verseTwo
      \new Lyrics \printItalic \lyricsto sopranos \verseThree
    >>
}
