%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% CONTENTS OF THIS DOCUMENT
% 1. Common settings
% 2. Soprano chorus music
% 3. Alto chorus music
% 4. Tenor chorus music
% 5. Basso chorus music
% 6. Soprano verse music
% 7. Alto verse music
% 8. Tenor verse music
% 9. Basso verse music
% 10. Chorus lyrics
% 11. Verse lyrics
% 12. Layout
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 1. Common settings
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\version "2.18.2"

\header {
  title = "003. To Jesus' Heart All Burning"
  subtitle = "(Cor Amoris)"
  poet = "Traditional Air"
  composer = "Rev. A. J. Christe, S.J."
  tagline = ##f
  source = "To Jesus' heart all burning-The Army and Navy Hymnal (1921), p.342"
  site = "hymnary.org"
}

globalSettings= {
  \key d \major
  \time 4/4
  \override Score.BarNumber.break-visibility = ##(#t #t #t)
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
% 6. Soprano verse music
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
musicVerseSoprano = \relative c' {
  \partial 4 fis8 (g) |
  a4 a gis b |
  a4. (d8) fis,4 fis |
  e fis g8 (b) a (g) |
  fis2 r4 \break \bar "|" fis8 (g) |
  a4 a gis b |
  a4. (d8) fis,4 fis |
  e a8 (cis) d4 b |
  a2 r4 \bar "||"
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 7. Alto verse music
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
musicVerseAlto = \relative c' {
  \partial 4 d8 (e) |
  fis4 fis f! f |
  fis!2 d4 d |
  cis d e8 (g) fis (e) |
  d2 r4 d8 (e) |
  fis4 fis f! f |
  fis!2 d4 d |
  cis e8 (a) gis4 e |
  e2 r4
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 8. Tenor verse music
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
musicVerseTenor = \relative c' {
  \partial 4 a4 |
  a a b gis |
  a2 a4 a |
  a a a a |
  a2 r4 a4 |
  a a b gis |
  a2 a4 a |
  a cis b d |
  cis2 r4
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 9. Basso verse music
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
musicVerseBasso = \relative c {
  \partial 4 fis8 (e) |
  d4 d d d |
  d2 d4 fis, |
  a a a cis |
  d2 r4 fis8 (e) |
  d4 d d d |
  d2 d4 b |
  e e e e |
  a2 r4
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 2. Soprano chorus music
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
musicChorusSoprano = \relative c'' {
  \set Score.currentBarNumber = #9
  \partial 4 a4 |
  cis4. cis8 cis4 cis |
  d2 (a4) a |
  e'4. d8 cis (b) a (g) |
  fis2 r4 \break \bar "|" fis8 (g) |
  a4 a a d |
  d2 b4 b |
  a a g4. g8 |
  fis2 r4 \bar "|."
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 3. Alto chorus music
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
musicChorusAlto = \relative c'' {
  \set Score.currentBarNumber = #9
  \partial 4 a4 |
  e4. eis8 fis4 g! |
  fis2 (fis4) fis |
  g4. fis8 g4 e |
  d2 r4 d8 (e) |
  fis4 cis d fis |
  g2 g4 d |
  d fis e4. e8 |
  d2 r4
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 4. Tenor chorus music
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
musicChorusTenor = \relative c' {
  \set Score.currentBarNumber = #9
  \partial 4 a4 |
  a4. b8 a4 a |
  a2 (a4) a |
  a4. a8 a4 a |
  a2 r4 a |
  a a a a |
  b2 d4 g, |
  fis a a4. a8 |
  a2 r4
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 5. Basso chorus music
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
musicChorusBasso = \relative c' {
  \set Score.currentBarNumber = #9
  \partial 4 a4 |
  a4. gis8 fis4 e |
  d2 (d4) d |
  cis4. d8 e4 cis |
  d2 r4 fis8 (e) |
  d4 e fis d |
  g,2 g4 g |
  a a a4. cis8 |
  d2 r4
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 11. Verse lyrics
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
lyricVerseOne = \lyricmode {
  \set stanza = #"1."
  To Je -- sus' Heart all burn -- ing
  With fer -- vent love for men,
  My heart, with fond -- est yearn -- ing,
  Shall raise its joy -- ful strain.
}

lyricVerseTwo = \lyricmode {
  \set stanza = #"2."
  O Heart, for me on fire _
  With love no tongue can speark,
  My yet un -- told de -- sire _
  God gives me for thy sake.
}

lyricVerseThree = \lyricmode {
  \set stanza = #"3."
  Too true, I have for -- sak -- en
  Thy love by wil -- ful sin;
  Yet now let me be tak -- en
  Back by thy grace a -- gain.
}

lyricVerseFour = \lyricmode {
  \set stanza = #"4."
  As thou art meek and low -- ly,
  And ev -- er pure of Heart,
  So may my heart be whol -- ly
  Of thine the coun -- ter -- part.
}

lyricVerseFive = \lyricmode {
  \set stanza = #"5."
  Oh! That to me were giv -- en
  The pin -- ions of a dove,
  I'd speed a -- loft to heav -- en,
  My Je -- sus' love to prove.
}

lyricVerseSix = \lyricmode {
  \set stanza = #"6."
  When life a -- way is fly -- ing,
  And earth's false glare is done;
  Still, Sa -- cred Heart, in dy -- ing
  I'll say I'm all thine own.
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 10. Chorus lyrics
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
lyricChorus = \lyricmode {
  \set stanza = #"Refrain:"
  While a -- ges course a -- long,
  Blest be with loud -- est song,
  The Sa -- cred Heart of Je -- sus,
  By ev -- ery heart and tongue.
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 12. Layout
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
      \new Lyrics \printItalic \lyricsto soprano \lyricVerseFive
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

\score {
    \new ChoirStaff <<
      \new Staff <<
        \clef "treble"
        \new Voice = "soprano" {
          \voiceOne \globalSettings \stemUp \slurUp \musicChorusSoprano
        }
        \new Voice = "alto" {
          \voiceTwo \globalSettings \stemDown \slurDown \musicChorusAlto
        }
      >>
      \new Lyrics \lyricsto soprano \lyricChorus
      \new Staff <<
        \clef "bass"
        \new Voice = "tenor" {
          \voiceOne \globalSettings \stemUp \slurUp \musicChorusTenor
        }
        \new Voice = "basso" {
          \voiceTwo \globalSettings \stemDown \slurDown \musicChorusBasso
        }
      >>
    >>
}
