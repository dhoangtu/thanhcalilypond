\version "2.18.2"
\include "english.ly"


\header {
  title = "Tiếng Nhạc Oai Hùng"
  composer = "Nhạc & Lời: Hải Linh, 1987"
  arranger = "Hòa âm: Lm. Ngô Duy Linh"
  tagline = ##f
}

globalSettings = {
  \set Score.barNumberVisibility = #all-bar-numbers-visible
  \key c \major
  \time 4/4
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
  print-page-number = #f
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
  c2\f g4.. a16 |
  g2. \breathe e8. e16 |
  f4-^ e-^ c-^ d-^ |
  g1 |
  e'2 c4.. d16 |
  e2 r8 e e8. f16 |
  d4 g, d' c8. b16 |
  c2. \breathe g4 |
  c2 g8. a16 g4 |
  e2 e'8. f16 e4 |
  c2 e8. f16 g8 f |
  e c d e f e d c |
  b4 \tuplet 3/2 {a8 [(b a)]} g4 g |
  c2 g8. a16 g4 |
  e2 \breathe e'8. f16 e4 |
  c2 e8. f16g8 e |
  c8 d e f d4. e8 |
  c2. r4 |
  c4.^\markup{\bold{Dolce}} c8 a4 c |
  g e g2 \breathe |
  e'4.\mf e8 e4 f |
  d4. d8 d4 d8 e |
  g,2 e8 (g) c d |
  e2. r4 |
  c4. c8 a4 c |
  g e g2 \breathe |
  e'4\mf e8 e e4 f |
  d4. d8 d4 d8 e |
  g,2 a8 (c) e d |
  c2. r4 |
}

% Alto chorus music
musicChorusAlto = \relative c'' {
  c2 g4.. a16 |
  g2. \breathe e8. e16 |
  f4 e c c |
  b1 |
  g'2 e4.. g16 |
  c2 r8 c c8. c16 |
  d4 f, a f8. d16 |
  e2. g4 |
  c2 e,8. f16 e4 |
  c2 c'8. d16 c4 |
  a2 c8. d16 e8 d |
  c g a b c b a a |
  g4 g8 (fs) g4 r |
  r2 e8. f16 e4 |
  c2 c'8. d16 c4 |
  a2 c8. d16 e8 c |
  g a b c b (g a) f |
  e2. r4 |
  c'4. c8 a4 c |
  g e g2 |
  g4. g8 g4 a8 c |
  b4. b8 b4 g8 e |
  d (b c d) e (c) e f |
  c'4 (a gs) r |
  c4. c8 a4 c |
  g e g2 |
  g4 g8 g g4 d'8 (c) |
  b4. b8 b4 g8 e |
  d4 (e) e8 (g) c b |
  g2. r4
}

% Basso chorus music
musicChorusBasso = \relative c {
  r1 |
  r8 f^\f e d c4 \breathe c8. c16 |
  d4^^ c^^ a^^ a^^ |
  e1 |
  r1 |
  r8 g' g, b g'4 \breathe g8. a16 |
  f4 d b a8. e16 |
  c'2. r4 |
  r8 e g e c2 ( |
  c8) c' d c g2 ( |
  g8) f a f d2 ( |
  d8) e f g a g fs fs |
  g4 d <g, b> r4 |
  r8 e' g e c2 ( |
  c8) c'd c g2 ( |
  g8) g a f e2 ( |
  e8) f g a f (e f) g |
  c,2. r4 |
  c'4. c8 a4 c |
  g e g2 \breathe |
  c,8\p-. c-. c-. d-. c-. c-. c-. f-. |
  g-. g-. g-. af-. g-. g-. g-. c,-. |
  b g a b c2 ( |
  c8) b c d e4 r4 |
  c'4. c8 a4 c |
  g e g2 \breathe |
  c,8\p-. c-. c-. d-. b-. c-. d-. r |
  g-. g-. g-. af-. f-. g-. g-. c,-. |
  b b c r c (e) g <g f> |
  <e c>2. r4
}

% Soprano verse music
musicVerse = \relative c' {
  \set Score.currentBarNumber = #31
  \repeat volta 2
  {
      e2 g4. a8 |
    g2 r8 g8 fs g |
    c4 d c d |
    e2 r8 e f8. e16 |
    d4 b8 d b4 a16 (b) a8 |
    g2. r4 |
    <e c>2 <g e>4. <a f>8 |
    <g e>2 r8 <g e> <fs ds> <g e> |
    <c a>4 <b g> <c a>8 (<d b>) <e c> (<f d>) |
    <g b,>2 (<g b,>8) f g8. f16 |
  }
  \alternative  {
    {
      e4 g, <e' g,> <d f,>8. <e g,>16 |
      <c e,>2. r4 
    }
    {
      e4 g, e'2 |
      d c ( |
      c) r8 g g g |
      d'2 r8 g, g g |
      g'2 (g4) r8 c, ( |
      c1) \bar "|."
    }
  }
}


% 11. Chorus lyrics
lyricChorusSoprano = \lyricmode {
  \set stanza = #"ĐK:"
  Tiếng nhạc oai hùng vang trên khắp cõi trời Việt Nam.
  Tiếng lòng tha thiết con dân nước Nam hòa khúc khải hoàn ca.
  Đồng thanh ta hát khen mừng
  Bao Đấng Anh Hùng xưa đã thắng gian lao
    tòa cao chói lói trên trời hiển vinh muôn đời.
  Đồng thanh ta hát khen mừng
  Bao Đấng Anh Hùng nay chiến thắng khải hoàn trên chốn phúc vinh sáng ngời.
  Hãy lắng nghe chúng con nài xin:
    Cho quê hương thoát cơn đau thương mau tới ngày bình an tươi sáng.
  Hãy lắng nghe chúng con nài xin:
    Qua cơn gian nan Giáo Hội vinh quang mau tới ngày rạng chiếu huy hoàng.
}

lyricChorusBasso = \lyricmode {
  Tiếng nhạc oai hùng vang trên khắp cõi trời Việt Nam.
  Tiếng lòng yêu mến con nước Nam hòa khúc khải hoàn ca.
  Ta hát khen mừng,
  ta hát khen mừng,
  Bao Đấng Anh Hùng tòa cao chói lói trên trời hiển vinh muôn đời.
  Ta hát khen mừng,
  ta hát khen mừng,
  Bao Đấng Anh Hùng trên chốn phúc vinh sáng ngời.
  Hãy lắng nghe chúng con nài xin:
    Cho quê hương thoát cơn đau thương thoát cơn đau thương
    thoát cơn đau thương tới ngày bình an tươi sáng, bình an tươi sáng.
  Hãy lắng nghe chúng con nài xin:
    Qua gian nan Giáo Hội vinh quang,
    Qua gian nan Giáo Hội vinh quang tới ngày rạng chiếu,
    rạng chiếu huy hoàng.
}

% 10. Verse lyrics
lyricVerseOne = \lyricmode {
  \set stanza = #"1."
  Kìa gương hiếu trung xưa đã nêu cao tinh thần chiến đấu.
  Đau đớn gian nan không thở than qua một lời.
  Ngày nay hiển vinh khắp trời Việt Nam ngàn thu lưu dấu.
  Muôn giới hỷ hoan mừng hát vang khắp trời.
}

lyricVerseTwo = \lyricmode {
  \set stanza = #"2."
  Một lòng sắt son xưa chịu gươm đao gông cùm trăng trói.
  Lướt thắng gian lao ghi chiến công để muôn đời.
  Ngày nay hiển vinh trên trời mừng vui triền miên chói lói.
  Muôn kiếp vẻ vang hạnh phúc trên cõi trời.
  
  vang hạnh phúc trên trời (hơ hơ hơ hơ hơ hơ hơ hơ hơ)
}

% 12. Layout
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
      \new Lyrics \lyricsto soprano \lyricChorusSoprano
      
      \new Staff <<
        \clef "bass"
        \new Voice = "basso" {
          \globalSettings \stemNeutral \slurDown \musicChorusBasso
        }
      >>
      \new Lyrics \lyricsto basso \lyricChorusBasso
    >>
}

\score {
  \new ChoirStaff <<
    \new Staff = verses <<
      \new Voice = "verse" {
        \globalSettings \stemNeutral \musicVerse
      }
    >>
    \new Lyrics \lyricsto verse \lyricVerseOne
    \new Lyrics \printItalic \lyricsto verse \lyricVerseTwo
  >>
}


