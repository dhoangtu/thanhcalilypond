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
  title = "001. Hail, Virgin, Dearest Mary"
  arranger = "Adapted from Rev. L. L."
  tagline = ##f
  copyright = "Copyright 1913, by P.J. Kennedy & Son"
  source = "The Army and Navy Hymnal (1921), p.343"
  site = "hymnary.org"
}

globalSettings= {
  \key d \major
  \time 6/8
  % \override Score.BarNumber.break-visibility = ##(#t #t #t)
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
% 2. Soprano chorus music
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
musicChorusSoprano = \relative c' {
  \partial 8 fis8 |
  fis4 fis8 fis (e) fis |
  a4. g4 g8 |
  fis4 fis8 fis (g) fis |
  e4. (e8) r fis |
  fis4 fis8 fis (e) fis |
  a4. g4 g8 |
  fis4 fis8 e (fis) e |
  d4. (d4) \bar "|."
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 3. Alto chorus music
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
musicChorusAlto = \relative c' {
  \partial 8 d8 |
  d4 d8 d cis d |
  fis4. e4 e8 |
  d4 d8 d e d |
  cis4. (cis8) r d |
  d4 d8 d cis d |
  d4. e4 e8 |
  d4 d8 cis4 cis8 |
  d4. d4 \bar "|."
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 4. Tenor chorus music
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
musicChorusTenor = \relative c' {
  \partial 8 a8 |
  a4 a8 a4 a8 |
  a4. a4 a8 |
  a4 a8 a4 a8 |
  a4. (a8) r a |
  a4 a8 a4 a8 |
  a4. b4 b8 |
  a4 a8 g a g |
  fis4. (fis4) \bar "|."
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 5. Basso chorus music
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
musicChorusBasso = \relative c {
  \partial 8 d8 |
  d4 d8 d4 d8 |
  d4. a4 cis8 |
  d4 d8 d cis d |
  a4. (a8) r d |
  d4 d8 d4 d8 |
  fis,4. g4 g8 |
  a4 a8 a4 a8 |
  d4. (d4) \bar "|."
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 6. Soprano verse music
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
musicVerseSoprano = \relative c'' {
  \set Score.currentBarNumber = #9
  \partial 8 a8 |
  a4 a8 a (b) cis |
  d4. e4 d8 |
  cis4 cis8 (b) cis b |
  a4. (a4) a8 |
  a4 a8 a (b) cis |
  d4. e4 d8 |
  cis4 cis8 b (cis) b |
  a4. (a4) \bar "||"
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 7. Alto verse music
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
musicVerseAlto = \relative c'' {
  \set Score.currentBarNumber = #9
  \partial 8 a8 |
  a4 a8 a b a |
  a4. a4 a8 |
  a4 a8 gis4 gis8 |
  e4. (e4) e8 |
  e4 e8 e fis a |
  a4. a4 a8 |
  a4 a8 gis4 gis8 |
  e4. (e4) \bar "||"
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 8. Tenor verse music
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
musicVerseTenor = \relative c' {
  \set Score.currentBarNumber = #9
  \partial 8 a8 |
  a4 a8 cis d e |
  d4. cis4 d8 |
  e4 e8 d e d |
  cis4. (cis4) cis8 |
  cis4 cis8 cis d e |
  d4. cis4 d8 |
  e4 e8 d e d |
  e4. (e4) \bar "||"
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 9. Basso verse music
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
musicVerseBasso = \relative c' {
  \set Score.currentBarNumber = #9
  \partial 8 a8 |
  a4 a8 g4 g8 |
  fis4. g4 fis8 |
  e4 e8 e4 e8 |
  a4. (a4) a8 |
  a4 a8 a4 g8 |
  fis4. g4 fis8 |
  e4 e8 e4 e8 |
  a4. (a4) \bar "||"
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 10. Chorus lyrics
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
lyricChorus = \lyricmode {
  \set stanza = #"Refrain:"
  Hail, Vir -- gin, dear -- est Ma -- ry!
  Our love -- ly Queen of May,
  O spot -- less, bless -- ed La -- dy,
  Our love -- ly Queen of May.
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 11. Verse lyrics
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
lyricVerseOne = \lyricmode {
  \set stanza = #"1."
  Thy chil -- dren, hum -- bly bend -- ing,
  Sur -- round thy shrine so dear;
  With heart and voice as -- cend -- ing,
  Sweet Ma -- ry hear our prayer.
}

lyricVerseTwo = \lyricmode {
  \set stanza = #"2."
  Be -- hold earth's blos -- soms spring -- ing
  In beau -- teous form and hue;
  All na -- ture glad -- ly bring -- ing
  Her sweet -- est charms to you.
}

lyricVerseThree = \lyricmode {
  \set stanza = #"3."
  We'll gath -- er fresh, bright flow -- ers,
  To bind our fair Queen's brow;
  From gay and ver -- dant bow -- ers,
  We haste to crown thee now.
}

lyricVerseFour = \lyricmode {
  \set stanza = #"4."
  And now, our bless -- ed Moth -- er,
  Smile on our fes -- tal day,
  Ac -- cept our wreath of flow -- ers,
  And be our Queen of May.
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 12. Layout
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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
