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
  title = "019. Most Holy Trinity"
  subtitle = "Sanctus, sanctus, sanctus"
  %poet = ""
  composer = "E. T. Cook"
  tagline = ##f
  source = "Catholic Church Hymnal with Music (1905), p.109"
  %site = ""
}

globalSettings= {
  \key a \major
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
  e4 e a a |
  a2 (gis4) b |
  e,2 gis4 b |
  cis2 cis \break \bar "|"
  e4. e8 e4 e |
  e2 dis4 cis |
  b b cis b |
  b2 (e,) \break \bar "|"
  e4 e a a |
  a2 gis4 (b) |
  d4. d8 cis4 b |
  d2 cis \break \bar "|"
  e2 e4 e |
  e2 d4 (cis) |
  b fis cis'4. b8 |
  a1 \bar "|."
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 3. Alto verse music
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
musicVerseAlto = \relative c' {
  cis4 cis e e |
  d2. d4 |
  d2 d4 d |
  cis2 e |
  e4. e8 e4 e |
  e2 g4 g |
  gis gis a a |
  gis (fis e d) |
  cis cis e e |
  d2 d |
  fis4. fis8 e4 e |
  fis2 fis |
  e2 e4 e |
  e2 g |
  fis4 fis gis4. gis8 |
  a1
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 4. Tenor verse music
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
musicVerseTenor = \relative c' {
  a4 a cis cis |
  b2. b4 |
  b2 b4  gis |
  a2 a |
  b4. b8 bis4 bis |
  cis2 e4 e |
  e e dis dis |
  e (d cis b) |
  a a cis cis |
  b2 b |
  b4. b8 b4 gis |
  a2 a |
  b2 bis4 bis |
  cis2 e |
  d4 d e4. e8 |
  cis1
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 5. Basso verse music
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
musicVerseBasso = \relative c {
  a'4 a fis fis |
  b,2 (b'4) a |
  gis (fis) e e |
  a2 a |
  gis4. gis8 gis4 gis |
  a2 ais4 ais |
  b b b b |
  e,1 |
  a4 a fis fis |
  b,2 b'4 (a) |
  gis4. gis8 cis,4 cis |
  fis2 fis |
  gis2 gis4 gis |
  a2 ais |
  b4 b e, e |
  a1
  }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 6. Verse lyrics
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
lyricVerseOne = \lyricmode {
  \set stanza = #"1."
  Ho -- ly, Ho -- ly, Ho -- ly! Lord God Al -- might -- y!
  Ear -- ly in the morn -- ing our song shall rise to Thee:
  Ho -- ly, Ho -- ly, Ho -- ly! Mer -- ci -- ful and might -- y!
  God in Three Per -- sons, bless -- ed Trin -- i -- ty!
}

lyricVerseTwo = \lyricmode {
  \set stanza = #"2."
  Ho -- ly, Ho -- ly, Ho -- ly! All--the Saints a -- dore Thee,
  Cast -- ing down their gol-den crowns a -- round the glas -- sy sea;
  Che -- ru -- bim and Ser-aph -- im fall -- ing down be -- fore Thee,
  Which wert, and art, and ev -- er -- more shalt be.
}

lyricVerseThree = \lyricmode {
  \set stanza = #"3."
  Ho -- ly, Ho -- ly, Ho -- ly! Though-the dark -- ness hide Thee,
  Though the eye of sin-ful man Thy glo -- ry may not see,
  On -- ly Thou art ho -- ly there is none be -- side Thee
  Per -- fect in power, in love and pur -- i -- ty.
}

lyricVerseFour = \lyricmode {
  \set stanza = #"4."
    Ho -- ly, Ho -- ly, Ho -- ly! Lord God Al -- might -- y!
	All Thy works shall praise Thy Name, in earth and sky and-sea:
	Ho -- ly, Ho -- ly, Ho -- ly! Mer -- ci -- ful and might -- y!
	God in Three Per -- sons, bless -- ed Trin -- i -- ty!
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

