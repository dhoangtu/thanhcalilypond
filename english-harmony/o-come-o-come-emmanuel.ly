\version "2.18.2"

\header {
  title = "O Come, O Come, Emmanuel"
  composer = "John Mason Neale (1818–1866), 15th Century French"
  tagline = ##f
  copyright = "Public Domain"
}

global= {
  % \override Score.BarNumber.break-visibility = #all-visible
  \key e \minor
  \time 4/4
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

% Soprano verse music
musicVerseSoprano = \relative c' {
  \partial 4 e4 |
  g b b b |
  a (c b) a |
  g2. a4 |
  b g e g |
  a (fis e) d |
  e2. a4 |
  a e e fis |
  g2 (fis4) e |
  d2. g4 |
  a b b b |
  a (c b) a | g2. \bar "||"
}

% Alto verse music
musicVerseAlto = \relative c' {
  \partial 4 b4 |
  e b d g |
  g2. fis4 |
  g2. d4 |
  d d c b |
  c2 (b4) b |
  b2. e8 d |
  c4 c e dis |
  e2 (d4) cis |
  d2. b4 |
  d d d g |
  g2. fis4 | g2. \bar "||"
}

% Tenor verse music
musicVerseTenor = \relative c' {
  \partial 4 g4 |
  b fis g d' |
  e2 (d4) c |
  b2. fis4 |
  g g g g |
  e (a g) fis |
  g2. a4 |
  a a b a |
  b (a a) g |
  fis2. g4 |
  fis fis g d' |
  e2 (d4) c | b2. \bar "||"
}

% Basso verse music
musicVerseBasso = \relative c {
  \partial 4 e4 |
  e d b g |
  c (a b) d |
  e2. d4 |
  g, b c e |
  a,2 (b4) b |
  e2. c8 b |
  a4 a' g fis |
  e (cis d) a |
  d2. e4 |
  d b g b |
  c (a b) d | g,2. \bar "||"
}

% Soprano chorus music
musicChorusSoprano = \relative c' {
  \set Score.currentBarNumber = #12
  \partial 4 d'4 |
  d2. b4 |
  b2. b4 |
  a (c b) a |
  g2. a4 |
  b g e g |
  a (fis e) d | g2. \bar "|."
}

% Alto chorus music
musicChorusAlto = \relative c' {
  \partial 4 g'4 |
  fis2. g4 |
  fis2. g4 |
  g2. fis4 |
  g2. fis4 |
  g d e e |
  e (c b) b | b2. \bar "|."
}

% Tenor chorus music
musicChorusTenor = \relative c' {
  \partial 4 b4 |
  a2. e'4 |
  d2. d4 |
  e2 (d4) c |
  b2. d4 |
  d d c b |
  a2 (g4) fis | g2. \bar "|."
}

% Basso chorus music
musicChorusBasso = \relative c' {
  \partial 4 g4 |
  d2. e4 |
  b2. g4 |
  c (a b) d |
  e2. d4 |
  g b, c e |
  c (a b) b | e2. \bar "|."
}

% 10. Verse lyrics
lyricVerseOne = \lyricmode {
  \set stanza = #"1."
  O come, O come, Em  -- man -- u -- el,
  And ran -- som cap -- tive Is -- ra -- el,
  That mourns in lone -- ly ex -- ile here
  Un -- til the Son of God ap -- pear.
}

lyricVerseTwo = \lyricmode {
  \set stanza = #"2."
  O come, O come, Thou Lord of might
  Who to Thy tribes, on Si -- nai's height
  In an -- cient times didst give the law
  In cloud, and maj -- es -- ty and awe.
}

lyricVerseThree = \lyricmode {
  \set stanza = #"3."
  O come, Thou Rod of Jes -- se, free
  Thine own from Sa -- tan's ty -- ran -- ny
  From depths of hell Thy peo -- ple save
  And give them vic -- t'ry o'er the grave.
}

lyricVerseFour = \lyricmode {
  \set stanza = #"4."
  O come, Thou Day -- spring, come and cheer
  Our spi -- rits by Thine ad -- vent here
  Dis -- perse the gloom -- y clouds of night
  And death's dark sha -- dows put to flight.
}

lyricVerseFive = \lyricmode {
  \set stanza = #"5."
  O come, Thou Key of Da -- vid, come
  And open wide our hea -- v'nly home
  Make safe the way that leads on high
  And close the path to mi -- ser -- y.
}

lyricVerseSix = \lyricmode {
  \set stanza = #"6."
  O come, Thou Wis -- dom from on high
  And or -- der all things, far and nigh
  To us the path of know -- ledge show
  And cause us in her ways to go.
}

lyricVerseSeven = \lyricmode {
  \set stanza = #"7."
  O come, de -- sire of na -- tions, bind
  In one the hearts of all mankind
  Bid Thou our sad di -- vi -- sions cease
  And be Thy -- self our King of peace.
}

% 11. Chorus lyrics
lyricChorus = \lyricmode {
  \set stanza = #"Refrain:"
  Re -- joice! Re -- joice! Em  -- man -- u -- el
  Shall come to thee, O Is -- ra -- el.
}

% 12. Layout
\score {
    \new ChoirStaff <<
      \new Staff <<
        \clef "treble"
        \new Voice = "sopranos" {
          \voiceOne \global \stemUp \slurUp \musicVerseSoprano
        }
        \new Voice = "alto" {
          \voiceTwo \global \stemDown \slurDown \musicVerseAlto
        }
      >>
      \new Lyrics \lyricsto sopranos \lyricVerseOne
      \new Lyrics \printItalic \lyricsto sopranos \lyricVerseTwo
      \new Lyrics \lyricsto sopranos \lyricVerseThree
      \new Lyrics \printItalic \lyricsto sopranos \lyricVerseFour
      \new Staff <<
        \clef "bass"
        \new Voice = "tenor" {
          \voiceOne \global \stemUp \slurUp \musicVerseTenor
        }
        \new Voice = "basso" {
          \voiceTwo \global \stemDown \slurDown \musicVerseBasso
        }
      >>
    >>
}

\score {
    \new ChoirStaff <<
      \new Staff <<
        \clef "treble"
        \new Voice = "sopranos" {
          \voiceOne \global \stemUp \slurUp \musicChorusSoprano
        }
        \new Voice = "alto" {
          \voiceTwo \global \stemDown \slurDown \musicChorusAlto
        }
      >>
      \new Lyrics \lyricsto sopranos \lyricChorus
      \new Staff <<
        \clef "bass"
        \new Voice = "tenor" {
          \voiceOne \global \stemUp \slurUp \musicChorusTenor
        }
        \new Voice = "basso" {
          \voiceTwo \global \stemDown \slurDown \musicChorusBasso
        }
      >>
    >>
}

\score {
    \new ChoirStaff <<
      \new Staff <<
        \clef "treble"
        \new Voice = "sopranos" {
          \voiceOne \global \stemUp \slurUp \musicVerseSoprano
        }
        \new Voice = "alto" {
          \voiceTwo \global \stemDown \slurDown \musicVerseAlto
        }
      >>
      \new Lyrics \lyricsto sopranos \lyricVerseFive
      \new Lyrics \printItalic \lyricsto sopranos \lyricVerseSix
      \new Lyrics \lyricsto sopranos \lyricVerseSeven
      \new Staff <<
        \clef "bass"
        \new Voice = "tenor" {
          \voiceOne \global \stemUp \slurUp \musicVerseTenor
        }
        \new Voice = "basso" {
          \voiceTwo \global \stemDown \slurDown \musicVerseBasso
        }
      >>
    >>
}
