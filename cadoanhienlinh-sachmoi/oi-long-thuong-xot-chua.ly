\version "2.18.2"
\include "english.ly"

\header {
  title = "Ôi Lòng Thương Xót Chúa"
  composer = "An-tôn Tiến Linh 14.7.2018"
  tagline = ##f
}

globalSettings = {
  \set Score.barNumberVisibility = #all-bar-numbers-visible
  \key af \major
  \time 4/4
  \override Lyrics.LyricSpace.minimum-distance = #1.0
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
  print-page-number = ##f
}

printItalic = \with {
  \override LyricText.font-shape = #'italic
}

% Soprano chorus music
musicChorusSoprano = \relative c'' {
  \partial 2. af4. ef8 af c |
  ef df df4 r8 af f af |
  df c c4 r8 af ef af |
  c bf bf4 r8 f df f |
  bf af af4 (af8) f g (bf) |
  af2. r4 |
  af8 (g) af (bf) c4 c |
  df r8 f16 (ef) df4 f |
  ef r8 c16 (bf) af4 c |
  bf r8 f'16 ((ef) df4. ef16 (df) |
  c4. df16 (c) bf2 \break |
  
  \set Staff.printKeyCancellation = ##f
  \key a \major
  
  gs2. r4 |
  r4 a4. e8 a cs |
  e d d4 r8 a fs a |
  d cs cs4 r8 a e a |
  cs b b4 r8 fs d fs |
  b a a4 (a8) fs gs b |
  a4 \breathe a8 (b) cs4 cs |
  d r8 fs16(e) d4 fs |
  e r8 cs16 (b) a4 cs |
  b r8 fs'16 (e) d4. e16 (d) |
  cs4. d16 (cs) b2 |
  a2 \breathe a8 e a cs |
  e d d4 r8 a fs a |
  d cs cs4 r8 a e a |
  cs b b4 r8 fs d fs |
  b a a4 (a8) fs gs (b) |
  a2. r4 \bar "|."
}

% Alto chorus music
musicChorusAlto = \relative c' {
  \partial 2. c4. c8 ef af |
  f f f4 r8 df df df |
  ef ef ef4 r8 ef c ef |
  df df df4 r8 bf bf bf |
  c c c4 (df8) df df4 |
  c2 (df4) r |
  c8 (bf) c (df) ef4 ef |
  f r8 af16 (g) f4 af |
  af r8 ef16 (df) c4 ef |
  df r8 af'8 f4 f |
  ef2 df |
  
  \set Staff.printKeyCancellation = ##f
  \key a \major
  
  b2. r4 |
  r4 cs4. cs8 e a |
  fs fs fs4 r8 d d d |
  e e e4 r8 e cs e |
  d d d4 r8 b b b |
  cs cs cs4 (d8) d d d |
  cs4 cs fs g! |
  fs r8 a16 (gs) fs4 a |
  a r8 e16 (d) cs4 e |
  d r8 a' fs4 fs |
  e2 d cs cs8 cs e a |
  fs fs fs4 r8 d d d |
  e e e4 r8 e cs e |
  d d d4 r8 b b b |
  cs cs cs4 (d8) d d4 |
  cs2. r4
}

% Tenor chorus music
musicChorusTenor = \relative c {
  ef4. af8 af af |
  af af af4 r8 af af af |
  af af af4 r8 af af af |
  f f f4 r8 f f f |
  ef ef ef4 (ef8) ef ef4 |
  f2 (df4) r |
  ef ef af af |
  af r8 df af4 df |
  c r8 af ef4 af |
  af r8 df af4 af |
  af2 (af4)  g |
  
  \set Staff.printKeyCancellation = ##f
  \key a \major
  
  gs2. r4 |
  r4 e4. a8 a a |
  a a a4 r8 a a a |
  a a a4 r8 a a a |
  fs fs fs4 r8 fs fs fs |
  e e e4 (e8) e e e |
  a4 a a a |
  a r8 d a4 d |
  cs r8 a e4 a |
  a r8 d a4 a |
  a2 a4 (gs) |
  e2 e8 a a a |
  a a a4 r8 a a a |
  a a a4 r8 a a a |
  fs fs fs4 r8 fs fs fs |
  e e e4 (e8) e e4 |
  e2. r4
}

% Basso chorus music
musicChorusBasso = \relative c {
  af4. af8 c ef |
  df df df4 r8 f df f |
  af af, af4 r8c af c |
  bf bf bf4 r8 df bf df |
  ef ef ef4 (ef8) ef ef4 |
  f2 (df4) r |
  af af af af |
  df r8 df df4 df |
  af r8 af af4 af |
  bf r8 bf bf4 bf |
  ef2 ef |
  
  \set Staff.printKeyCancellation = ##f
  \key a \major
  
  e2. r4 |
  r a,4. a8 cs e |
  d d d4 r8 fs d fs |
  a a a4 r8 cs, a cs |
  b b b4 r8 d b d |
  e e e4 (e8) e e e |
  fs4 fs fs e |
  d r8 d d4 d |
  a r8 a a4 a |
  b r8 b b4 b |
  e2 e |
  a, a8 a cs e |
  d d d4 r8 fs d fs |
  a a, a4 r8 cs a cs |
  b b b4 r8 d b d |
  e e e4 (e8) e e4 |
  a,2. r4
}

% Chorus lyrics
lyricChorus = \lyricmode {
  Ôi Lòng Thương Xót Chúa bao la
  đất trời khắp chốn cao xa
  đong đầy trong trái tim ta
  muôn lòng vang khúc hoan ca
  lời cảm tạ.
  Đây Thịt Máu Con Chúa
  dưỡng nuôi thế nhân
  để được thông phần
  phúc vinh trên trời
  đến muôn đời.
  Ôi Lòng Thương Xót Chúa bao la
  hiến mình làm lễ hy sinh
  trở thành tấm bánh cho ta
  bánh Thần linh Chúa trao ban
  sự sống vĩnh hằng.
  Thịt Máu Con Chúa dưỡng nuôi thế nhân
  để được thông phần
  phúc vinh trên trời
  đến muôn đời.
  Ôi Lòng Thương Xót Chúa bao la
  đất trời khắp chốn cao xa
  đong đầy trong trái tim ta
  muôn lòng vang khúc hoan ca
  lời cảm tạ.
}

% Layout
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

