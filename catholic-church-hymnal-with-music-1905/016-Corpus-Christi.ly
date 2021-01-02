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
  title = "016. Whitsun Tide"
  subtitle = "Veni, sancte Spiritus"
  %poet = ""
  composer = "Fr. Maher, S.J."
  tagline = ##f
  source = "Catholic Church Hymnal with Music (1905), p.102"
  %site = ""
}

globalSettings= {
  \key f \major
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
\partial 4 a'4 |
  a4. bes8 c4 a |
  d d c4. c8 \break \bar "|"
  c4 d bes4. a8 |
  bes4 c a a \break \bar "|"
  a4. (b8) c4 (d) |
  c b c \fermata \break \bar "||" bes |
  a4. bes8 c4 a |
  d d c4. c8 \break \bar "|"
  c4 d bes4. a8 |
  bes4 c a a \break \bar "|"
  a4. (bes8) c4 bes |
  a2 (g4.) f8 |
  f2. \bar "|."
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 3. Alto verse music
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
musicVerseAlto = \relative c' {
\partial 4 f4 |
  f4. e8 f4 f |
  f f g4. e8 |
  fis4 a g4. fis8 |
  g4 e f f |
  e4. (f8) g4 (a) |
  g f e g |
  f4. f8 e4 d |
  f f e4. g8 |
  f4 f f4. f8 |
  f4 g f e |
  f2 f4 g |
  f2 (e4.) f8 |
  f2.
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 4. Tenor verse music
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
musicVerseTenor = \relative c' {
\partial 4 c4 |
  c4. c8 c4 c |
  d d e4. c8 |
  d4 d d4. d8 |
  d4 c c d |
  c4. (d8) c4 (f) |
  e4 (d) c c |
  c4. f,8 g4 f |
  g aes g4. bes8 |
  a4 bes bes4. c8 |
  d4 e f c |
  d2 ees4 d |
  c2 (bes4.) a8 |
  a2.
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 5. Basso verse music
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
musicVerseBasso = \relative c {
\partial 4 f4 |
  f4. g8 a4 f |
  bes bes bes4. bes8 |
  a4 fis g4. d8 |
  g4 c, f d |
  a'4. (d,8) e4 (f) |
  g (g) c, e |
  f4. d8 c4 d |
  bes b c4. e8 |
  f4 bes, d4. f8 |
  d4 c f a, |
  d2 a4 bes |
  c2 (c4.) f8 |
  f2.
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 6. Verse lyrics
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
lyricVerseOne = \lyricmode {
  \set stanza = #"1."
  Come, Ho -- ly Ghost, send down those beams
  Which sweet -- ly flow in si -- lent streams
  From Thy bright throne a -- bove;
  O come, Thou Fa -- ther of the poor;
  O come, Thou source of all our store; -
  Come, fill our hearts with love.
}

lyricVerseTwo = \lyricmode {
  \set stanza = #"2."
  O Thou, of com -- fort -- ers the best;
  O Thou, the soul's de -- light -- ful guest,
  The pil -- grims' sweet re -- lief;
  Thou art true rest in toil and sweat,
  Re -- fresh -- ment in-(the) ex -- cess of heat, -
  And sol -- ace in our grief.

}

lyricVerseThree = \lyricmode {
  \set stanza = #"3."
  Thrice -- bless -- ed Light, shoot home Thy darts
  And pierce the cen -- tres of those hearts
  Whose faith as -- pires to Thee;
  With -- out Thy God -- head noth -- ing can
  Have an -- y price or worth in man - 
  Noth-ing can - harm -- less be.
}

lyricVerseFour = \lyricmode {
  \set stanza = #"4."
  Lord, wash our sin -- ful stains a -- way,
  Re -- fresh from heaven our bar -- ren clay,
  Our wounds and bruised - heal;
  To Thy sweet yoke our stiff necks bow,
  Warm with Thy fire our hearts of snow,
  Our wand -- er -- ing feet re -- peal.
}

lyricVerseFive = \lyricmode {
  \set stanza = #"5."
  Grant to Thy faith -- ful, dear -- est Lord,
  Whose on -- ly hope is Thy sure word,
  The seven gifts of-Thy Spi -- rit;
  Grant us in life Thy help -- ing grace,
  Grant us at death to see Thy Face,
  And end-less joy in -- her - -- it.
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

