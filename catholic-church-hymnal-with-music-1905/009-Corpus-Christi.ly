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
  title = "009. Corpus Christi"
  subtitle = "(To Jesus in the Blessed Sacrament)"
  %poet = ""
  composer = "A. Edmonds Tozer"
  tagline = ##f
  source = "Catholic Church Hymnal with Music (1905), p.93"
  %site = ""
}

globalSettings= {
  \key c \minor
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
  ees4 g aes f |
  bes2 g |
  bes4 ees, f aes |
  g1 \break \bar "|"
  g4 bes c a |
  d2 bes |
  d4 bes d c |
  bes1 \break \bar "|"
  aes4 f c' bes |
  aes2 c |
  des4 bes ees des |
  c1 \break \bar "|"
  d4 d c bes | 
  ees2 bes |
  g4 bes ees, f |
  ees1 
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 3. Alto verse music
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
musicVerseAlto = \relative c' {
  bes4 ees d d |
  ees2 ees |
  f4 ees ees d |
  ees1 \break \bar "|"
  d4 g a fis |
  g2 g |
  bes4 f a a |
  f1 \break \bar "|"             
  f4 f g g |
  f (g) f (aes) |
  g4 g aes g |
  aes1 \break \bar "|"
  bes4 f f f |
  ees2 ees4 (f) |
  ees4 ees c d |
  ees1 
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 4. Tenor verse music
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
musicVerseTenor = \relative c' {
  g4  bes bes bes |
  bes2 bes |
  f4 g aes bes |
  bes1 \break \bar "|"              
  bes4 d ees ees |
  d2 d4 (ees) |
  f4 d f ees |
  d1 \break \bar "|"              
  c4 aes bes des |
  c (bes) aes2 |
  bes4 bes aes ees' |
  ees1 \break \bar "|"  
  f4 bes, c d |
  bes4 (aes) g (bes) |
  bes4 g g aes |
  g1
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 5. Basso verse music
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
musicVerseBasso = \relative c {
  ees4 ees ees aes |
  g2 ees |
  d4 c bes bes |
  ees1 \break \bar "|"                
  g4 g fis c' |
  bes4 (a) g2 |
  f4 f f f |
  bes1 \break \bar "|"  
  f4 f e e |
  f2 f4 (fes) |
  ees4 des c ees |
  aes1 \break \bar "|"  
  bes4 aes aes aes |
  g4 (f) ees (d) |
  ees4 ees bes bes |
  ees1 \bar "|."
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 6. Verse lyrics
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
lyricVerseOne = \lyricmode {
  \set stanza = #"1."
  When the lov -- ing Shep -- herd,
  Ere He left the earth,
  Shed to pay our ran -- som,
  Blood of price -- less worth
  These His lambs so cher -- ished,
  Pur -- chased for His own,
  He would not a -- ban -- don
  In the world a -- lone.
}

lyricVerseTwo = \lyricmode {
  \set stanza = #"2."
  Ere He makes us part -- ners
  Of His realm on high,
  Hap -- py and im -- mor -- tal
  With Him in the sky
  Love im -- mense, stu -- pen -- dous,
  Makes Him here be -- low
  Part -- ner of our ex -- ile
  In this world of woe.
}

lyricVerseThree = \lyricmode {
  \set stanza = #"3."
  Je -- sus, food of an -- gels,
  Mon -- arch of the heart,
  Oh, that I could nev -- er 
  From Thy Face de -- part,
  Yes, Thou ev -- er dwell -- est
  Here for love of me,
  Hid -- den Thou re -- main -- est
  God of Maj -- es -- ty.
}

lyricVerseFour = \lyricmode {
  \set stanza = #"4."
  Soon I hope to see Thee,
  And en -- joy Thy love,
  Face to face, sweet Je -- sus,
  In Thy heaven a -- bove.
  But on earth an ex -- ile,
  My de -- light shall be
  E -- ver to be near Thee,
  Veiled for love of me.
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

