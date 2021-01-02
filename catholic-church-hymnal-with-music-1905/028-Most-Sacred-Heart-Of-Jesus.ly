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
  title = "028. Most Sacred Heart of Jesus"
  subtitle = "Cor amans"
  %poet = ""
  composer = "C. Schmidt"
  tagline = ##f
  source = "Catholic Church Hymnal with Music (1905), p.116"
  %site = ""
}

globalSettings= {
  \key ees \major
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
\partial 4 ees4 |
f g aes c |
bes f g bes \break
ees, aes f f |
g2. \bar "||" g4 |
c d ees c \break
g d' c g |
f ees f f |
ees2. \bar "|."
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 3. Alto verse music
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
musicVerseAlto = \relative c' {
\partial 4 bes4 |
d ees ees aes |
f d ees bes |
c c c c |
d2. d4 |
c g' g g |
d g ees ees |
c c c d |
ees2.
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 4. Tenor verse music
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
musicVerseTenor = \relative c' {
\partial 4 g4 |
bes bes c ees |
d bes bes f |
g aes aes c |
b2. b4 |
g b c c |
c b c bes |
aes g aes f |
g2.
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 5. Basso verse music
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
musicVerseBasso = \relative c {
\partial 4 ees4 |
bes ees aes aes, |
bes bes ees d |
c f aes aes |
g2. g4 |
ees d c ees |
g g aes ees |
f c aes bes |
ees2.
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 6. Verse lyrics
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
lyricVerseOne = \lyricmode {
  \set stanza = #"1."
  I dwell a cap -- tive in this Heart,
  In -- lamed with love di -- vine;
  'Tis here I live a -- lone in peace,
  And con -- stant joy is mine.
}

lyricVerseTwo = \lyricmode {
  \set stanza = #"2."
 It is the Heart of God's own Son
 In His Hu -- man -- i -- ty,
 Who, all en -- am -- ored of my soul,
 Here burns with love of me.
}

lyricVerseThree = \lyricmode {
  \set stanza = #"3."
  Here like the dove with -- in the ark
  Se -- cure -- ly I re -- pose;
  Since now the Lord is my de -- fence,
  I fear no earth -- ly foes.
}

lyricVerseFour = \lyricmode {
  \set stanza = #"4."
  What though I suf -- fer, still in love
  I ev -- er true will be;
  My love of God shall deep -- er grow
  When cross -- es fall on me.
}

lyricVerseFive = \lyricmode {
  \set stanza = #"5."
  From ev -- ery bond of earth, O Lord,
  Thy grace hath set me free;
  My soul de -- li -- vered from the snare
  En -- joys true li -- ber -- ty.
}

lyricVerseSix = \lyricmode {
  \set stanza = #"6."
  Naught more can I de -- sire than this,
  To see Thy Face in Heaven;
  And this I hope since He on earth
  His Heart in pledge hath given.
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

