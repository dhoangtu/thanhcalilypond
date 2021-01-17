\version "2.20.0"
\include "english.ly"

\header {
  title = "Kính Chào Đức Nữ "
  composer = "Thơ: Đỗ Xuân Quế - Nhạc: Hải Triều"
  arranger = "Hòa âm: Cát Minh"
  tagline = ##f
}

globalSettings = {
  %\set Score.barNumberVisibility = #all-bar-numbers-visible
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \key f \major
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

printItalic = { \override LyricText.font-shape = #'italic }

% Soprano chorus music
musicChorusSoprano = \relative c'' {
  \partial 4 a4 |
  d, a'8 bf16 (a) |
  g2 |
  f8 g a f |
  e4. d8 |
  d8 (f) g f16 (g) |
  a4 \breathe bf |
  a e'8 f16 (e) |
  d2 |
  
  
  \breathe
  a4. a8 |
  a8 (g) f (e) |
  d4 \breathe d'8 (e) |
  f4. e8 |
  e4 ( f8 e) |
  d2
}

% Alto chorus music
musicChorusAlto = \relative c'' {
  \partial 4 a4 |
  d, a'8 bf16 (a) |
  g2 |
  d8 e f d |
  cs4. d8 |
  d8 f e d16 (e) |
  f4 f |
  e g8 a16 (g) |
  f2
  
  
  f4. f8 |
  f (e) d (cs) |
  d4 f |
  bf4. bf8 |
  a4 (g) |
  fs2
}

% Tenor chorus music
musicChorusTenor = \relative c' {
  \partial 4 a4 |
  f a8 bf16 (a) |
  g2 |
  a4. a8 |
  a4 (g8) g |
  f (bf) c c |
  c4 \breathe d |
  d cs8 cs |
  d2
  
  
  d4. c8 bf4 a8 (g) |
  f4 \breathe d' |
  d4. d8 |
  d4 (cs) |
  a2
}

% Basso chorus music
musicChorusBasso = \relative c' {
  \partial 4 a4 |
  f a8 bf16 (a) |
  g2 |
  d4. d8 |
  a4. bf8 |
  bf (d) c c |
  f4 d |
  a  a'8 a |
  <a d,>2
  
  
  f4. f8 |
  g,4 a |
  bf bf'8 (a) |
  g8 (f g) g |
  a4 (a,) |
  d2
}

% Verse music
verseMusic = \relative c'' {
  r8 a a f16 (e) |
  d4. g8 |
  bf4 g |
  a4. a8 |
  d8. d16 bf8 a |
  g2 |
  r8 a a g16 (f) |
  e4. f8 |
  g4 f8 (g) |
  a4. g8 |
  f g e f16 (e) |
  d4  \bar "||"
}

% Coda music
codaMusic = \relative c'' {
  
}


% Chorus lyrics
lyricChorus = \lyricmode {
  \set stanza = #"ĐK."
  Kính chào Đức Nữ Vương nguồn lân tuất hy vọng ngọt ngào cho cuộc sống.
  Kính chào Đức Nữ Vương.
  
  Ôi khoan nhân dịu hòa Trinh Nữ Ma -- ri -- a.
}

% Verse lyrics
lyricVerseOne = \lyricmode {
  \set stanza = #"1."
  Giữa chốn lưu đày kêu khóc thở than, trải qua đắng cay muôn vàn.
  Ngước mắt trông nhìn Trạng Sư từ nhân, hy vọng phấn khởi tinh thần.
}

lyricVerseTwo = \lyricmode {
  \set stanza = #"2."
  Đến lúc linh hồn siêu thoát trần gian, Mẹ đến đón lên Thiên Đàng.
  Mắt ngắm Con Mẹ: Giê -- su từ nhân, muôn đời sống trong ân tình.
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

\score {
  \new ChoirStaff <<
  \new Staff = verses <<
    \override Staff.TimeSignature.transparent = ##t
      \new Voice = "verse" {
        \globalSettings \stemNeutral \verseMusic
      }
    >>
    \new Lyrics \lyricsto verse \lyricVerseOne
    \new Lyrics \with \printItalic \lyricsto verse \lyricVerseTwo 
  >>
}

