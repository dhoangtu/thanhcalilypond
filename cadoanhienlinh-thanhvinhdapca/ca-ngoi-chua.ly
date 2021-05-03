% Cài đặt chung
\version "2.20.0"
\include "english.ly"

\header {
  title = "Ca Ngợi Chúa"
  composer = "TV. 112"
  arranger = " "
  tagline = ##f
}

global = {
  \key c \major
  \time 2/2
}

\paper {
  #(set-paper-size "a4")
  top-margin = 20\mm
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

% Nhạc điệp khúc
nhacDiepKhuc = \relative c' {
  \override Lyrics.LyricSpace.minimum-distance = #1.7
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \partial 2 e4 \tuplet 3/2 { g8 a g } |
  c2 r4 a8 e' |
  d4. d8 d b4 g8 |
  f2 r4 d8 e |
  f4. g8 g \acciaccatura d8 e4 d8 |
  c1 \bar "|."
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c'' {
  \override Lyrics.LyricSpace.minimum-distance = #2.0
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \partial 4. g8 a c |
  c4 c8 b a b g4 |
  r d8 e d f g f |
  e2 f8 e g a |
  c2 r4 a8 a |
  c4 d8 e e4 \fermata d |
  c1 \bar "||"
}

nhacPhienKhucHai = \relative c'' {
  \override Lyrics.LyricSpace.minimum-distance = #2.0
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \partial 2. c8 a f a c e, |
  g2 r4 f8 f |
  d4 f8 e c4 e |
  g2 r4 g8 g |
  fs g a b a2 |
  b8 g d' b g2 |
  a8 g a g g4 b |
  c1 \bar "||"
}

nhacPhienKhucBa = \relative c' {
  \override Lyrics.LyricSpace.minimum-distance = #2.0
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \partial 4 d8 e |
  c4 g'8 f g4 d8 e |
  c2. e8 c |
  g'4 fs8 g a4 d,8 g |
  g4 \breathe f8 f a a g g |
  b4 g8 g e'4 d |
  c1 \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  \override Lyrics.LyricText.font-series = #'bold
  Nào ta ca ngợi Chúa,
  Người đỡ nâng, cất nhắc kẻ cơ hàn.
  Người nâng đỡ, cất nhắc kẻ nghèo hèn.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Hỡi tôi tớ Chúa hãy dâng lời ca ngợi.
  Nào ca ngợi danh Thánh Chúa đi.
  Chúc tụng danh Thánh Chúa,
  tự giờ đây cho mãi đến muôn đời.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Chúa siêu việt trên hết mọi dân.
  Vinh quang Người vượt xa trời cao thẳm.
  Ai sánh tày Thượng Đế Chúa ta.
  Đấng ngự chốn cao vời cúi mình xem bầu trời trái đất.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Kẻ yếu hèn, Chúa nâng đỡ từ cát bụi.
  Ai nghèo túng, Người cất nhắc khỏi phân tro.
  Đặt ngồi chung với hàng quyền quý.
  Hàng quyền quý dân Người.
}


% Dàn trang
\score {
  \new ChoirStaff <<
    \new Staff = chorus <<
      \new Voice = "sopranos" {
        \global \stemNeutral \nhacDiepKhuc
      }
    >>
    \new Lyrics = basses
    \context Lyrics = basses 
      %\with \override LyricText.font-shape = #'bold
      \lyricsto sopranos \loiDiepKhuc
  >>
}

\score {
  \new ChoirStaff <<
    \new Staff = verses <<
      \override Staff.TimeSignature.transparent = ##t
      \new Voice = "verse" {
        \global \stemNeutral \nhacPhienKhucMot
      }
    >>
    \new Lyrics \lyricsto verse \loiPhienKhucMot
  >>
}

\score {
  \new ChoirStaff <<
    \new Staff = verses <<
      \override Staff.TimeSignature.transparent = ##t
      \new Voice = "verse" {
        \global \stemNeutral \nhacPhienKhucHai
      }
    >>
    \new Lyrics \lyricsto verse \loiPhienKhucHai
  >>
}

\score {
  \new ChoirStaff <<
    \new Staff = verses <<
      \override Staff.TimeSignature.transparent = ##t
      \new Voice = "verse" {
        \global \stemNeutral \nhacPhienKhucBa
      }
    >>
    \new Lyrics \lyricsto verse \loiPhienKhucBa
  >>
}