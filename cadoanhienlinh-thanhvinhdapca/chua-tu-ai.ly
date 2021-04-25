% Cài đặt chung
\version "2.20.0"
\include "english.ly"

\header {
  title = "Chúa Từ Ái"
  composer = "TV. 129"
  arranger = " "
  tagline = ##f
}

global = {
  \key c \major
  \time 3/4
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
nhacDiepKhucSop= \relative c'' {
  \override Lyrics.LyricSpace.minimum-distance = #4.0
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  c4. c8 b a |
  d2 g,4 |
  g2 f8 e |
  d4 c8 c e d |
  g2 \breathe b8 d |
  d,4 d8 d g d |
  c2. ( |
  c2) r4 \bar "|."
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c' {
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \partial 4 c8 d |
  ef4. g8 g g |
  c,2 af'4 |
  g8 r c2 (\grace d16) |
  b!8 b a! b c4 |
  af8 g f af g4 |
  r8 f16 ef f8 f g ef |
  d2 r8 ef |
  f af g4. e!8 |
  c2. \bar "||"
}

nhacPhienKhucHai = \relative c' {
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \partial 4 ef8 c |
  g'4. af16 g f8 bf |
  g2 g4 |
  c16 b! c8 d4 f, |
  g2 c8 c |
  c af f4 bf |
  g2 f8 af |
  g d g (f) e! (d) |
  c2. \bar "||"
}

nhacPhienKhucBa = \relative c'' {
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \set Staff.keyAlterations = #`(((0 . 6) . ,NATURAL)
                                 ((1 . 2) . ,NATURAL)
                                 ((0 . 5) . ,NATURAL))
  \partial 4 g8 e |
  c'4 d8 e a, c |
  g2 r8 e' |
  d8. c16 a8 a4 r8 |
  a c d c8. a16 g8 |
  g2 a8 c |
  a f d4. g8 |
  b4 d16 c e8 d c |
  a2 g8 (b) |
  c2. \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  \override Lyrics.LyricText.font-series = #'bold
  Chúa vẫn luôn từ ái một niềm,
  ơn cứu độ Người hằng ban rộng rãi.
  Ơn cứu độ Người hằng ban lâu dài.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Từ vực thẳm, con kêu lên Ngài.
  Chúa ơi, Chúa ơi xin hãy nghe con.
  Dám xin Ngài lắng tai nghe lời con tha thiết nguyện cầu,
  lời con thiết tha nguyện cầu.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Ôi lạy Chúa, nếu như Ngài chấp tội
  nào có ai đứng vững được chăng?
  Nhưng Chúa thường rộng lòng thứ tha.
  Để chúng con hằng kính sợ Người.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Mong đợi Chúa tôi hết lòng mong đợi.
  Vững tin ở Lời Người.
  Hồn tôi vẫn trông mong chờ Người,
  hơn lính canh mong đợi hừng đông.
  Hơn cả lính canh mong đợi hừng đông.
}


% Dàn trang
\score {
  \new ChoirStaff <<
    \new Staff = chorus \with {
        \consists "Merge_rests_engraver"
      }
      <<
      \new Voice = "sopranos" {
        \global \stemNeutral \nhacDiepKhucSop
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
        \key ef \major \time 3/4 \stemNeutral \nhacPhienKhucMot
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
        \key ef \major \time 3/4 \stemNeutral \nhacPhienKhucHai
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
        \key c \major \time 3/4 \stemNeutral \nhacPhienKhucBa
      }
    >>
    \new Lyrics \lyricsto verse \loiPhienKhucBa
  >>
}
