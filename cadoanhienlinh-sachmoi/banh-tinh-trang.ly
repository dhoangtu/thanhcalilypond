\version "2.18.2"
\include "english.ly"

\header {
  title = "Bánh Tinh Trắng"
  composer = "Kim Long - Hòa âm: Tiến Linh"
  tagline = ##f
}

globalSettings = {
  \set Score.barNumberVisibility = #all-bar-numbers-visible
  \key g \major
  \time 2/4
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

% Soprano chorus music
musicChorusSoprano = \relative c'' {
  \partial 8 d8 |
  \set Score.repeatCommands = #'(start-repeat)
  b (a) b (c) |
  d4 r8 e, |
  e (g) a (g) |
  d4 r8 d |
  b' b c c |
  a a d d |
  b2 ( |
  b4) r8 g |
  a (b) a (g) |
  e4. e8 |
  e (g) a (g) |
  d4 r8 d |
  b' b c c |
  a a d d |
  g,2 \mark "Fine" \bar "|."
}

% Alto chorus music
musicChorusAlto = \relative c'' {
  \partial 8 a8 |
  g4. g8 |
  fs4 r8 b, |
  c4 b |
  a r8 d |
  d d c c |
  d d d d |
  d4. ds8 |
  e4 r8 b |
  d4. d8 |
  c4. c8 |
  cs4 cs |
  d r8 d |
  d d c c |
  d d fs fs |
  d2
}

% Tenor chorus music
musicChorusTenor = \relative c' {
  \partial 8 d8 |
  d4. c8 |
  a4 r8 g |
  g4 g |
  fs r8 fs |
  g g g g |
  g fs g a |
  g4. a8 |
  g4 r8 g |
  fs4. g8 |
  g4. g8 |
  a4 a |
  a r8 a |
  g g g g |
  g fs a a |
  b2
}

% Basso chorus music
musicChorusBasso = \relative c {
  \partial 8 fs8 |
  g4. e8 |
  d4 r8 d |
  c4 cs |
  d r8 d |
  g g e e |
  d d e fs |
  g4. fs8 |
  e4 r8 e |
  d4. b8 |
  c4. b8 |
  a4 g' |
  fs r8 fs |
  g g e e |
  d d d d |
  g2
}

% Verse music
verseMusic = \relative c'' {
  \bar "" \set Score.currentBarNumber = #16
  r8 g b16 (c) b8 |
  a4. a8 |
  fs fs g16 (a) g8 |
  d2 |
  r8 b d fs |
  a4. a16 a |
  g8 g c b |
  d2 ( |
  d4) r8 <d a d fs>
  \set Score.repeatCommands = #'(end-repeat)
}


% Chorus lyrics
lyricChorus = \lyricmode {
  Bánh đây tinh trắng. Rượu này thắm nồng
  Đoàn con chung kết tấm lòng thành kính tiến dâng (tiến dâng)
  Nguyện Chúa thương nhận và gửi Thánh Thần
  Dùng ân thiêng thánh hóa thành nguồn sống thế trần.
}

% Verse lyrics
lyricVerseOne = \lyricmode {
  \set stanza = #"1."
  Của lễ hôm nay không còn là máu chiên bò
  Mà là rượu bánh sẽ trở thành Thịt Máu Con Chúa.
  Bánh
}

lyricVerseTwo = \lyricmode {
  \set stanza = #"2."
  Thành kính xin dâng bao sầu buồn với vui mừng
  Cuộc đời nhân thế Chúa đoái nhìn cùng với của lễ.
}

lyricVerseThree = \lyricmode {
  \set stanza = #"3."
  Tựa khói hương bay bao lời cầu khấn chân thành
  Thịt dâng lên Chúa với lễ vật đặt trên bàn thánh.
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
      \new Lyrics \lyricsto alto \lyricChorus
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
  \new Staff = verses <<
    \override Staff.TimeSignature.transparent = ##t
      \new Voice = "verse" {
        \globalSettings \stemNeutral \verseMusic
      }
    >>
    \new Lyrics \lyricsto verse \lyricVerseOne
    \new Lyrics \printItalic \lyricsto verse \lyricVerseTwo
    \new Lyrics \lyricsto verse \lyricVerseThree
  >>
}

