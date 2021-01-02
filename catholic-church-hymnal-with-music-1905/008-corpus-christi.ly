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
  title = "008. Corpus Christi"
  subtitle = "(Gesu Sacramentato)"
  %poet = ""
  composer = "Rev. F. Stanfield"
  tagline = ##f
  source = "Catholic Church Hymnal with Music (1905), p.92"
  %site = ""
}

globalSettings= {
  \key e \major
  \time 3/2
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
 \partial 2 gis'2 |
  b2. a4 fis gis |
  e1 gis2 |
  cis,2. dis4 e fis |
  gis2 (fis) \break \bar "|"
                gis2 |
  b2. a4 fis gis |
  e1 gis2 |
  a2. a4 gis fis |
  e1 \break \bar "|"
                e2 |
  e'2. e4 dis cis |
  b4. a8 gis2. gis4 |
  cis2. cis4 b gis \break \bar "|"
  fis4 e fis2 gis |
  b2. a4 fis gis |
  e1 gis2 |
  a2. a4 gis fis |
  e1 \bar "||"
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 3. Alto verse music
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
musicVerseAlto = \relative c' {
  \partial 2 e2 |
  e2. e4 dis dis |
  e1 dis2 |
  cis2. b4 b e |
  e2 (dis2) \break \bar "|"
               e2 |
  fis2. e4 e dis |
  e1 e2 |
  e2. e4 e dis |
  e1 \break \bar "|"
                e2 |
  gis2. gis4 gis a |
  e4. dis8 e2. e4 |
  fis2. dis4 e e \break \bar "|"
  e4 cis dis2 e2 |
  fis2. e4 e dis |
  e1 e2 |
  e2. e4 dis dis |
  e1 \bar "||"			
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 4. Tenor verse music
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
musicVerseTenor = \relative c' {
  \partial 2 b2 |
  gis2. cis4 a b |
  gis1 gis2 |
  a2. fis4 e cis' |
  b1 \break \bar "|"
                  b2 |
  fis2. a4 cis b |
  gis1 d'2 |
  cis2. c4 b a | 
  gis1 \break \bar "|"
                  gis2 |
  cis2. e4 e e |
    b4. b8 b2. e4 |
    dis2. b4 b cis |
    ais4 ais b2 b2|
    fis2. a4 cis b |
    gis1 d'2 |
    cis2. c4 b a |
    gis1 
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 5. Basso verse music
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
musicVerseBasso = \relative c {
  \partial 2 e2 |
  e2. a,4 b b |
  cis1 b2 |
  a2. a4 gis a |
  b1 \break \bar "|"
                  e2 |
  dis2. cis4 a b |
  cis1 e2 |
  a2. fis4 b, b |
  e1 \break \bar "|"
                  e2 |
  cis2. cis'4 b a |
    gis4. fis8 e2. e4 |
    a2. a4 gis cis, |
    fis4 fis b,2 e|
    dis2. cis4 a b |
    cis1 e2 |
    a2. fis4 b, b |
    e1
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 6. Verse lyrics
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
lyricVerseOne = \lyricmode {
  \set stanza = #"1."
  Sweet Sa -- cra -- ment di -- vine!
  Hid in Thine earth -- ly home,
  Lo! round Thy low -- ly shirne, 
  With sup -- pliant hearts we come;
  Je -- sus, to Thee our voice we raise,
  In songs of love and heart -- felt praise,
  Sweet Sa -- cra -- ment di -- vine!
  Sweet Sa -- cra -- ment di -- vine!
}

lyricVerseTwo = \lyricmode {
  \set stanza = #"2."
  Sweet Sa -- cra -- ment of peace!
  Dear home of ev -- ery heart
  Where rest -- less year -- nings cease,
  And sor -- rows all de -- part;
  There in Thine ear, all trust -- ful -- ly,
  We tell our tale of mis -- er -- y,
  Sweet Sa -- cra -- ment of peace!
  Sweet Sa -- cra -- ment of peace!
}

lyricVerseThree = \lyricmode {
  \set stanza = #"3."
  Sweet Sa -- cra -- ment of rest!
  Ark from the o -- cean's roar,
  With -- in Thy shelt -- er blest,
  Soon may we reach the shore.
  Save us, for still the tem -- pest raves,
  Save, lest we sink be -- neath the waves,
  Sweet Sa -- cra -- ment of rest!
  Sweet Sa -- cra -- ment of rest!
}

lyricVerseFour = \lyricmode {
  \set stanza = #"4."
  Sweet Sa -- cra -- ment di -- vine!
  Earth's light and ju -- bi -- lee,
  In Thy far depths doth shine
  Thy God -- head's ma -- jes -- ty:
  Sweet Light, so shine on us, we pray,
  That earth -- ly joys may fade a -- way,
  Sweet Sa -- cra -- ment di -- vine!
  Sweet Sa -- cra -- ment di -- vine!
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
      %\new Lyrics \printItalic \lyricsto soprano \lyricVerseFive
      %\new Lyrics \printItalic \lyricsto soprano \lyricVerseSix
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

