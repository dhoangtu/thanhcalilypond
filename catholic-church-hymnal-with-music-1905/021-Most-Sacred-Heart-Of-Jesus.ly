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
  title = "021. Most Holy Trinity"
  subtitle = "Ter sancte, ter potens Deus"
  %poet = ""
  composer = "H. Mc Clelland"
  tagline = ##f
  source = "Catholic Church Hymnal with Music (1905), p.113"
  %site = ""
}

globalSettings= {
  \key a \major
  \time 4/4
  %\override Score.BarNumber.break-visibility = ##(#t #t #t)
  \override Score.BarNumber.break-visibility = ##(#ft #f #f)
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
  cis'4 b a e |
  fis a e2 \break \bar "|"
  a4 cis b gis |
  gis fis e2 \bar "||"
  a4 cis fis, d' \break \bar "|"
  cis b8 (a) gis2 |
  a4 gis8 (fis) e4 a |
  fis gis a2 \bar "|."
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 3. Alto verse music
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
musicVerseAlto = \relative c' {
  e4 e e cis |
  d a8 b cis2 |
  cis4 fis gis8 fis e4 |
  e dis e2 |
  e4 e fis fis8 gis |
  a gis fis4 e2 |
  cis4 bis cis e |
  %{  8%}fis8 e d4 cis2 
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 4. Tenor verse music
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
musicVerseTenor = \relative c' {
  a4 gis a a |
  a d cis2 |
  a4 a gis8 a b cis |
  b4. a8 gis2 |
  a4 a a d |
  e d8 cis b2 |
  a4 a a8 b cis4 |
  d8 cis b4 a2 
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 5. Basso verse music
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
musicVerseBasso = \relative c {
  a4 e'8 d cis4 a |
  d fis8 gis a2 |
  fis4 dis e8 fis gis a |
  b4 b,4 e2 |
  cis4 a d b |
  cis d e2 |
  fis4 dis e e |
  e e a,2
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 6. Verse lyrics
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
lyricVerseOne = \lyricmode {
  \set stanza = #"1."
  Lord thrice ho -- ly! Lord of might!
  God in -- com -- pre -- hen -- si -- ble!
  Ev -- er -- last -- ing liv -- ving light,
  Fount of joys in -- ef -- fa -- ble!
}

lyricVerseTwo = \lyricmode {
  \set stanza = #"2."
  O Thou Love for ev -- er new!
  O Thou Ver -- i -- ty di -- vine!
  O Thou U -- ni -- ty most true!
  Ev -- er one, yet ev -- er Trine!
}

lyricVerseThree = \lyricmode {
  \set stanza = #"3."
  All a -- round Thee count -- less rays
  Make a dark -- ness thick as night;
  When the Ser -- aphs turn their gaze,
  Blind -- ed with ex -- cess of light!
}
lyricVerseFour = \lyricmode {
  \set stanza = #"4."
  Born in Thy tri -- un -- al Name,
  Born in Thee to frace a -- new,
  Thee the sons of men pro -- claim,
  And ex -- tol with glo -- ry due!
}

lyricVerseFive = \lyricmode {
  \set stanza = #"5."
  Thee, the Lord of earth and skies,
  Own -- ing here in faith and love;
  E'en on earth they taste the joys
  Stored for happ -- y souls a -- bove.
}

lyricVerseSix = \lyricmode {
  \set stanza = #"6."
  Make us, Ho -- ly Ghost, to will,
  Teach us, on -- ly Son, to know,
  Grant us, Fa -- ther, to ful -- fil,
  All Thou will -- est us to do!
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
      \new Lyrics \printItalic \lyricsto soprano \lyricVerseSix
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

