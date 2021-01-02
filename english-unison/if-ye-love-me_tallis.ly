\version "2.18.2"

\header {
  title = "If Ye Love Me"
  composer = "Thomas Tallis"
  tagline = ##f
  source="https://musicasacra.com/music/english-hymns-in-the-commons/"
  license="thanhcalilypond.net - License CC0 1.0"
}

global= {
  \key f \major
  \time 4/4
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
  system-system-spacing = #'((basic-distance . 3) (padding . 3))
}

printItalic = \with {
  \override LyricText.font-shape = #'italic
}

% Verse music
musicVerseSoprano = \relative c' {
  f2. f4 |
  g2 a ( |
  a4) a g f |
  bes2 a ( |
  a4) a a a |
  c2 bes4 a ( |
  a8) bes g4 a2 ( |
  
  a4) g f f |
  bes2. a4 ( |
  a) f a g ( |
  g) f2 e4 |
  f2
  
  \repeat volta 1 {
    
    
    f4 c'4 ( |
    c4) bes a g |
    f a g2 |
    g
    
    c4 f,4 |
    c'4 bes a2 |
  }
  g4 f e d |
  c f2 c4 |
  d bes (c2) |
  c1 \bar "|."
}

% Verse lyrics
verseOne = \lyricmode {
  If ye love me, keep my com -- mand -- ments,
  and I will pray the Fa _ _ ther,
  and He shall give you a -- no -- ther com -- fort -- er,
  that He may bide with you for -- ev -- er, ev'n the spirit of truth,
  
  ev'n the spirit of truth, ev'n the spirit of truth.
}


% Layout
\score {
    \new ChoirStaff <<
      \new Staff <<
        \clef "treble"
        \new Voice = "sopranos" { \global \stemUp \slurUp \musicVerseSoprano }
      >>
      \new Lyrics \lyricsto sopranos \verseOne
    >>
    %{
    \midi {
    \tempo 4 = 100
    }
    %}
}
