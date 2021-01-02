\version "2.18.2"

\header {
  title = "O Come, O Come, Emmanuel"
  composer = "15th Century French, John Mason Neale"
  tagline = ##f
  source="https://musicasacra.com/music/english-hymns-in-the-commons/"
  license="thanhcalilypond.net - License CC0 1.0"
}

global= {
  % \override Score.BarNumber.break-visibility = #all-visible
  \key e \minor
  \time 4/4
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
}

\paper {
  #(set-paper-size "a5")
  top-margin = 10\mm
  bottom-margin = 5\mm
  left-margin = 10\mm
  right-margin = 10\mm
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

% Soparno Verse music
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

% Verse lyrics
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
  And o -- pen wide our hea -- v'nly home
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
  In one the hearts of all man -- kind
  Bid Thou our sad di -- vi -- sions cease
  And be Thy -- self our King of peace.
}

% 11. Chorus lyrics
lyricChorus = \lyricmode {
  \set stanza = #"Refrain:"
  Re -- joice! Re -- joice! Em  -- man -- u -- el
  Shall come to thee, O Is -- ra -- el.
}

% Layout
\score {
    \new ChoirStaff <<
      \new Staff <<
        \clef "treble"
        \new Voice = "sopranos" {
          \voiceOne \global \stemUp \slurUp \musicVerseSoprano
        }
      >>
      \new Lyrics \lyricsto sopranos \lyricVerseOne
      \new Lyrics \printItalic \lyricsto sopranos \lyricVerseTwo
      \new Lyrics \lyricsto sopranos \lyricVerseThree
      \new Lyrics \printItalic \lyricsto sopranos \lyricVerseFour
      \new Lyrics \lyricsto sopranos \lyricVerseFive
      \new Lyrics \printItalic \lyricsto sopranos \lyricVerseSix
      \new Lyrics \lyricsto sopranos \lyricVerseSeven
    >>
}

\score {
    \new ChoirStaff <<
      \new Staff <<
        \clef "treble"
        \new Voice = "sopranos" {
          \voiceOne \global \stemUp \slurUp \musicChorusSoprano
        }
      >>
      \new Lyrics \lyricsto sopranos \lyricChorus
    >>
}
