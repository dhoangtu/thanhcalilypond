% Cài đặt chung
\version "2.20.0"
\include "english.ly"

\header {
  title = "Ngợi Ca"
  composer = "Nguyễn Duy"
  tagline = ##f
}

global = {
  \key c \major
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

inNghieng = { \override LyricText.font-shape = #'italic }

% Nhạc điệp khúc
nhacDiepKhucSop = \relative c'' {
  \partial 4 g8 g |
  \once \override Score.RehearsalMark.font-size = #0.1
  \mark \markup { \musicglyph #"scripts.segno" }
  c4. c8 \tuplet 3/2 { d4 e c } |
  \acciaccatura { g16 a } g4. e8 \tuplet 3/2 { g4 a g } |
  \acciaccatura { e16 f } e4. c8 \tuplet 3/2 { c4 g' a } |
  \acciaccatura { g16 a } g2. g8 g |
  d'4. d8 \tuplet 3/2 { d4 c d } |
  e4. e8 \tuplet 3/2 { e4 d e } |
  a,4. a8 \tuplet 3/2 { b4 b d } |
  c2. 
}

nhacDiepKhucBass = \relative c'' {
  \omit TupletNumber
  \override TupletBracket.bracket-visibility = ##f
  
  \partial 4 g8 g |
  e4. e8 \tuplet 3/2 { f4 g f } |
  e4. c8 \tuplet 3/2 { e4 f e } |
  c4. a8 \tuplet 3/2 { a4 b c } |
  b2. e8 e |
  g4. g8 \tuplet 3/2 { g4 a b } |
  c4. c8 \tuplet 3/2 { c4 a g } |
  f4. f8 \tuplet 3/2 { g4 g f } |
  e2.
}

% Nhạc phiên khúc
nhacPhienKhuc = \relative c'' {
  \set Score.currentBarNumber = #15
  \tupletUp
  \partial 4 g8 g |
  g4. g8 \tuplet 3/2 { c4 c b } |
  a2. f8 f |
  f4. f8 \tuplet 3/2 { b4 b a } |
  g2. g8 g |
  g4. g8 \tuplet 3/2 { c4 c d } |
  e2. a,8 a |
  a4. a8 \tuplet 3/2 { b4 a g } |
  c2. g8 g \bar "||"
  \once \override Score.RehearsalMark.font-size = #0.1
  \mark \markup { \musicglyph #"scripts.segno" }
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  \set stanza = #"ĐK:"
  Từ bình minh con dâng hết tâm tình
  tụng ca Chúa Thiên đình một bài thơ kính tin.
  Trọn tình yêu khi đêm về sao sáng
  con dâng lời chúc tụng ngợi ca danh Chúa luôn.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Trọn một đời là tiếng hát dâng lên,
  là điệu đàn hòa tấu khúc tri ân.
  Vào cuộc trần để ca khen danh Chúa,
  ngày lại ngày Ngài mến thương đời con.
  Từ bình...
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Vì tình Ngài, tình bát ngát không gian,
  tình diệu huyền gọi nắng đong mưa sang.
  Ngày lại ngày thời gian trôi phiêu lãng,
  một phận người Ngài đỡ nâng ủi an.
}

% Dàn trang
\score {
  \new ChoirStaff <<
    \new Staff = chorus <<
      \new Voice = "sopranos" {
        \voiceOne \global \stemUp \nhacDiepKhucSop
      }
      \new Voice = "basses" {
        \voiceTwo \global \stemDown \nhacDiepKhucBass
      }
    >>
    \new Lyrics = basses
    \context Lyrics = basses \lyricsto sopranos \loiDiepKhuc
  >>
}

\score {
  \new ChoirStaff <<
    \new Staff = verses <<
      \override Staff.TimeSignature.transparent = ##t
      \new Voice = "verse" {
        \global \stemNeutral \nhacPhienKhuc
      }
    >>
    \new Lyrics \lyricsto verse \loiPhienKhucMot
    \new Lyrics \with \inNghieng \lyricsto verse \loiPhienKhucHai
  >>
}
