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
  title = "024. Most Sacred Heart of Jesus"
  subtitle = "Summi Parentis Filio"
  %poet = ""
  composer = "H. Whitehead"
  tagline = ##f
  source = "Catholic Church Hymnal with Music (1905), p.110"
  %site = ""
}

globalSettings= {
  \key g \major
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
\partial 4 g'4 |
g g a d, |
b'2. b4 \break \bar "|"
b b c b |
a2. \bar "||" d4 |
d c8 (b) c4 c \break \bar "|"
c b8 (a) g (a) b (c) |
d4-> b-> a4.-> g8 |
g2. r4 \bar "||"
g1 |
g1 \bar "|."

  }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 3. Alto verse music
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
musicVerseAlto = \relative c' {
\partial 4 d4 |
e d e d |
d2. dis4 |
e f e e |
fis2. fis4 |
g gis a g |
fis fis g8 (fis) g4 |
g g fis4. g8 |
g2. r4 |
e1 |
d1
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 4. Tenor verse music
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
musicVerseTenor = \relative c' {
\partial 4 b4 |
b g g fis |
g2. fis4 |
g g g g |
fis2. b4 |
b e e ees |
d d d8 (c) b (a) |
b4 d c4. b8 |
b2. r4 |
c1 |
b1
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 5. Basso verse music
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
musicVerseBasso = \relative c {
\partial 4 g'4 |
e b c d |
g,2. b4 |
e d c cis |
d2. b4 |
e e a a |
d, d'8 (c) b (a) g (e) |
d4-> d-> d4.-> e8 |
g2. r4 |
c,1 |
g'1
  }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 6. Verse lyrics
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
lyricVerseOne = \lyricmode {
  \set stanza = #"1."
  To Christ, the Prince of Peace,
  And Son of God most high,
  The Fa -- ther of the world to come,
  Sing we with ho -- ly joy.
}

lyricVerseTwo = \lyricmode {
  \set stanza = #"2."
  Deeps in His Heart for us
  The Wound of love He bore;
  That love, where -- with He still in -- flames
  The hearts that Him a -- dore.
}

lyricVerseThree = \lyricmode {
  \set stanza = #"3."
 O Je -- su, Vic -- tim blest,
 What else but love di -- vine
 Could Thee con -- strain to o -- pen thus
 That sa -- cred Heart of Thine? A -- men.
}

lyricVerseFour = \lyricmode {
  \set stanza = #"4."
  O Found of end -- less life
  O Spring of wa -- ters clear,
  O Flame ce -- les -- tial, clean -- sing all
  Who un -- to The draw near.
}

lyricVerseFive = \lyricmode {
  \set stanza = #"5."
  Hide me in Thy dear Heart,
  For hith -- er do I fly;
  There seek Thy grace through life, in death
  Thine im -- mor -- tal -- i -- ty.
}

lyricVerseSix = \lyricmode {
  \set stanza = #"6."
  Praise to the Fa -- ther be,
  And sole be -- got -- ten Son;
  Praise, ho -- ly Pa -- ra -- clette, to Thee,
  While end -- less ag -- es run.
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

