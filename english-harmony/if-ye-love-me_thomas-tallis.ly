\version "2.18.2"

\header {
  title = "If ye love me"
  composer = "Thomas Tallis"
  tagline = ##f
  copyright = "Public Domain"
}

global= {
  \key c \major
  \time 4/2
  \autoBeamOff
}

\paper {
  #(set-paper-size "a4")
  top-margin = 20\mm
  bottom-margin = 20\mm
  left-margin = 20\mm
  right-margin = 20\mm
  indent = #0
  #(define fonts
	 (make-pango-font-tree "Liberation Serif"
	 		       "Liberation Serif"
			       "Liberation Serif"
			       (/ 20 20)))
}

% Soprano music
musicSoprano =   \relative c' {
  c1. c2 d1  % 1
  e1 ~ e2 e2 d2 c2   % 2
  f1 e1 r2  e2  % 3
  e2 e2 g1 f2 e2 ~   % 4
  e4 \melisma f4   d2 \melismaEnd   e1 r1    % 5
  r1  r2  d2 c2 c2   % 6
  f1. e2 ~ e2 c2   % 7
  e2 d2 ~ d2 c1 b2   % 8

  c1 \repeat volta 2{ r1    % 9
  r\breve    % 10
  r\breve    % 11
  r2  c2 g'1 (    % 12
  g2 )  f2 e2 d2   % 13
  c2 e2 d1   % 14
  d1 r1    % 15
  r\breve    % 16
  r2  g1 c,2   % 17
  g'2 f2 e1   % 18
  d2 c2 b2 a2   % 19
  g2 c1 g2   % 20
  a2 f2 \melisma  g1 \melismaEnd    % 21
  g1 }  % 22
}

% Soprano lyrics
lyricsSoprano = \lyricmode {
  If ye love me, keep my com -- mand -- ments.
  And I will pray the Fa -- ther,
  and he shall give you a -- no -- ther __ com -- for -- ter,
  that he may 'bide with you for -- ev -- er
  E'en the spirit of truth,
  E'en the spirit of truth,
  E'en the spirit of truth.
}

% Alto music
musicAlto =    \relative c' {
  g1. a2 b1   % 1
  c1 ~ c2 c2 b2 a2   % 2
  c1 c1 ~ c1   % 3
  r1  r\breve    % 4
  r2  a2 a2 a2 c1   % 5
  b2 a2 ~ a2 g2 a2 a2   % 6
  f2 f2 c'1 c2 g2   % 7
  c2   b2   a2 \melisma  f2 g2. \melismaEnd g4   % 8

  g1
  \repeat volta 2 { r1   % 9
  r1  c1   % 10
  f1. e2   % 11
  d2 c2 c2 b2   % 12
  c1 c2 g2   % 13
  a2 a2 a1   % 14
  b1 b1   % 15
  b2 e1 d2 ~    % 16
  d4  c4    c2 r2  c2 (    % 17
  c2 )  f,2 c'2 c2   % 18
  b2 g'1 c,2   % 19
  g'2 f2 e2 d2 (    % 20
  d4 )   c4  c1 b2   % 21

  c1 }  % 22
}

% Alto lyrics
lyricsAlto = \lyricmode {
  If ye love me, keep my com -- mand -- ments.
  And I will pray the Fa -- ther,
  and he shall give you a -- no -- ther __ _ com -- for -- ter,
  that he may 'bide with you for -- ev -- er,
  with you for -- ev -- er,
  E'en the spirit of __ _  truth,
  E'en the spirit of truth,
  E'en the spirit of truth,
  E'en the spirit of truth.
}

% Tenor music
musicTenor =  \relative c' {
  e1. c2 g'1   % 1
  g1 ~ g2 g2 g2 e2   % 2
  a1 g1 ~ g1   % 3
  r2  e2 e2 e2 a2. g4   % 4
  f1 e1 ~ e1   % 5
  r1  r1  r2  f2   % 6
  d2 d2 a'1 g2 e2   % 7
  g1   f4   e4     c2 d2. d4   % 8

  c1
  \repeat volta 2{
   g'1 % 9
  c1. b2   % 10
  a2 g2 f2 g2   % 11
  g2   e2   d2 d2   % 12
  e2 a2 g2 d2   % 13
  e2 e2 fis1   % 14
  g2 d'1 g,2   % 15
  d'2 c2 b2 a2   % 16
  g\breve   % 17
  e2 a1 g2 (    % 18
  g2 )  c,2 g'2 f2   % 19
  e2 a2 g2 d2   % 20
  e2 c2 d2 d2   % 21

  c1 } % 22
}

% Tenor lyrics
lyricsTenor = \lyricmode {
  If ye love me, keep my com -- mand -- ments.
  And I will pray the Fa -- ther,
  and he shall give you a -- no -- _ _ ther com -- for -- ter,
  that he may 'bide with you for -- ev -- _ er,
  that he may 'bide with you for -- ev -- er,
  E'en the spirit of truth,
  the spirit of truth,
  E'en the spirit of truth,
  the spirit of truth,
  the spirit of truth.
}

% Basso music
musicBass =    \relative c {
  c1. a2 g1   % 1
  c1 ~ c2 c2 g2 a2   % 2
  f1 c'1 ~ c\breve   r\breve    % 4
  r1  a1 a2 a2   % 5
  d2. c4 b1 a1   % 6
  r2  d2 a2 a2 c1   % 7
  c2 g2 a2 a2 g2 g2   % 8

  c1
  \repeat volta 2{ r1   % 9
  c1 f1 (    % 10
  f2 )  e2 d2 c2   % 11
  b2 c2 g1   % 12
  c2 c2 c2 b2   % 13
  a2 a2 d1   % 14
  g,1 r2  g'2 (    % 15
  g2 )  c,2 g'2 f2   % 16
  e1 c2 e2 (    % 17
  e4 )    c4 (    d2 )  c1   % 18
  r1  r2  c2 (    % 19
  c2 )  f,2 c'2 b2   % 20
  a2 a2 g2 g2   % 21

  c1  % 22
 }
}

% Basso lyrics
lyricsBass = \lyricmode {
  If ye love me, keep my com -- mand -- ments.
  And I will pray the Fa -- ther,
  and he shall give you a -- no -- ther com -- for -- ter,
  that he may 'bide with you for -- ev -- er,
  may 'bide with you for -- ev -- er,
  E'en the spirit of truth,
  the spirit of truth,
  the spirit of truth,
  e'en the spirit of truth.
}

% 10. Layout
\score {
  \transpose c g {
    \new ChoirStaff <<
      \new Staff <<
        \global
        \clef "treble"
        \new Voice = "sopranos" <<
          \musicSoprano
        >>
        \new Lyrics = sopranos
        \context Lyrics = sopranos \lyricsto sopranos \lyricsSoprano
      >>
      
      \new Staff <<
        \global
        \clef "treble"
        \new Voice = "altos" <<
          \musicAlto
        >>
        \new Lyrics = altos
        \context Lyrics = altos \lyricsto altos \lyricsAlto
      >>
      
      \new Staff <<
        \clef "treble"
        \global
        \new Voice = "tenors" <<
          \musicTenor
        >>
        \new Lyrics = tenors
        \context Lyrics = tenors \lyricsto tenors \lyricsTenor
      >>

      \new Staff <<
        \clef "bass"
        \global
        \new Voice = "basses" <<
          \musicBass
        >>
        \new Lyrics = basses
        \context Lyrics = basses \lyricsto basses \lyricsBass
      >>
    >>
  }
}
