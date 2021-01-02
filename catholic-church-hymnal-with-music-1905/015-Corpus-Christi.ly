%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% CONTENTS OF THIS DOCUMENT
% 1. Common settings
% 2. Soprano verse music
% 3. Alto verse music
% 4. Tenor verse music
% 5. Basso verse music
% 6. Verse lyrics
% 7. Layout
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 1. Common settings
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\version "2.18.2"

\header {
  title = "015. Whitsun Tide"
  subtitle = "Veni, sancte Spiritus"
  poet = "(Second tune)"
  composer = "E. M. Lott"
  tagline = ##f
  source = "Catholic Church Hymnal with Music (1905), p.101"
  %site = ""
}

globalSettings= {
  \key bes \major
  \time 4/4
  %\override Score.BarNumber.break-visibility = ##(#t #t #t)
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
}

verseSettings = {
  \phrasingSlurDashed
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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 2. Soprano verse music
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
musicVerseSoprano = \relative c' {
\partial 4 f8 f |
  g4 f g bes |
  bes2. bes8 a \break \bar "|"
  g4 g ees' c |
  a2. bes8 bes |
  c4 f, g g |
  f2. \break \bar "||" f8 f |
  a4 f e f |
  d2. d8 e |
  f4 d' c g \break \bar "|"
  a2. a8 a |
  bes2 c |
  d2. c4 |
  bes2. \bar "|."
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 3. Alto verse music
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
musicVerseAlto = \relative c' {
\partial 4 d8 d |
  ees4 f ees ees |
  ees2 (d4) d8 c |
  bes4 f' ees g |
  f2. f8 f |
  f4 f f e |
  f2. \break \bar "||" d8 d |
  e4 d d cis |
  d2. d8 d |
  d4 d f e |
  f2. ees8 ees |
  d2 ees |
  d4 (f g) a |
  bes2.
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 4. Tenor verse music
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
musicVerseTenor = \relative c' {
\partial 4 bes8 bes |
  bes4 bes bes g |
  f2. fis8 fis |
  g4 b c c |
  c2. bes8 bes |
  a4 a d c8 bes |
  a2. \break \bar "||" a8 a |
  a4 a bes a8 g |
  f2. f8 g |
  a4 bes a c |
  c2. c8 c |
  bes2 bes |
  bes4 (d ees) ees |
  d2.
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 5. Basso verse music
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
musicVerseBasso = \relative c {
\partial 4 bes8 bes |
  ees4 d ees ees |
  bes2. d8 d |
  ees4 d c ees |
  f2. d8 d |
  c4 d bes c |
  f2. \break \bar "||" d8 d |
  cis4 d g, a |
  d2. d8 d |
  d4 bes c c |
  f2. fis8 fis |
  g2 ges |
  f2. f4 |
  bes,2.
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 6. Verse lyrics
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
lyricVerseOne = \lyricmode {
  \set stanza = #"1."
  Ho -- ly Spir -- it, come and shine
  On our souls with beams di -- vine,
  Is -- suing from Thy ra -- diance bright.
  Come, O Fa -- ther of the poor,
  Ev -- er boun -- teous of Thy store,
  Come, our hearts' un -- fail -- ing Light.
}

lyricVerseTwo = \lyricmode {
  \set stanza = #"2."
  Come, Con -- so -- ler, kind -- est, best,
  Come, our bo -- som's dear -- est guest,
  Sweet re -- freah -- ment, sweet re -- pose.
  Rest in la -- bor, cool -- ness sweet,
  Tem -- per -- ing the burn -- ing heat,
  Tru -- est com -- fort of our woes.

}

lyricVerseThree = \lyricmode {
  \set stanza = #"3."
  O di -- vin -- est Light, im -- part
  Un -- to ev -- ery faith -- ful heart
  Plen -- teous strams from love's bright flood.
  But for Thy blest De -- i -- ty,
  Noth -- ing pure in man could be;
  Noth -- ing harm -- less, noth -- ing good.
}

lyricVerseFour = \lyricmode {
  \set stanza = #"4."
  Wash a -- way each sin -- ful stain;
  Gent -- ly shed Thy gra -- cious rain
  On the dry and fruit -- less soul.
  Heal each wound and bend each will,
  Warm our hearts be -- numbed and chill,
  All our way -- ward steps con -- trol.
}

lyricVerseFive = \lyricmode {
  \set stanza = #"5."
  Un -- to all Thy faith -- ful just,
  Who in Thee con -- fide and trust,
  Deign the seven -- fold gift to send.
  Grant us vir -- tue's blest in -- crease,
  Grant a death of hope and peace,
  Grant the joys that ne -- ver end.
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 7. Layout
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\score {
    \new ChoirStaff <<
      \new Staff <<
        \clef "treble"
        \new Voice = "soprano" {
          \voiceOne \globalSettings \verseSettings \stemUp \slurUp \musicVerseSoprano
        }
        \new Voice = "alto" {
          \voiceTwo \globalSettings \verseSettings \stemDown \slurDown \musicVerseAlto
        }
      >>
      \new Lyrics \lyricsto soprano \lyricVerseOne
      \new Lyrics \printItalic \lyricsto soprano \lyricVerseTwo
      \new Lyrics \lyricsto soprano \lyricVerseThree
      \new Lyrics \printItalic \lyricsto soprano \lyricVerseFour
      \new Lyrics \lyricsto soprano \lyricVerseFive
      \new Staff <<
        \clef "bass"
        \new Voice = "tenor" {
          \voiceOne \globalSettings \verseSettings \stemUp \slurUp \musicVerseTenor
        }
        \new Voice = "basso" {
          \voiceTwo \globalSettings \verseSettings \stemDown \slurDown \musicVerseBasso
        }
      >>
    >>
}

