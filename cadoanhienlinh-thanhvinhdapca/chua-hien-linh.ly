% Cài đặt chung
\version "2.20.0"
\include "english.ly"

\header {
  title = "Chúa Hiển Linh"
  composer = "TV. 71"
  tagline = ##f
}

global = {
  \key f \major
  \time 2/4
}

inNghieng = { \override LyricText.font-shape = #'italic }

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
nhacDiepKhucSop = \relative c' {
  \override Lyrics.LyricSpace.minimum-distance = #4.0
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \partial 4 c4 |
  a' f8 g |
  c,4 d8 c |
  a4 f'16 f g8 |
  a4 bf8 bf |
  g4 g8 e |
  c4 c16 g' a8 |
  bf4 c8 c |
  a2 ( |
  a4) r \bar "|."
}

% Nhạc phiên khúc
nhacPhienKhucSop = \relative c' {
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \stemDown
  \partial 4. f4 e8 |
  a4. a16 a |
  f8 bf a g |
  g4. g16 g |
  a8 g g e |
  \slashedGrace { \stemDown d8 ^( } e2) _( |
  e8)
  \stemUp e4 f8 |
  g4. g16 g |
  a8 a f e |
  d4. d16 c |
  c8 e g e |
  f2 ( |
  f4) r \bar "||"
}

nhacPhienKhucBass = \relative c'' {
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \override NoteHead.font-size = #-2
  \stemUp
  c4 a8 |
  d4. d16 d |
  bf8 e d d |
  c4. c16 c |
  d8 c bf g |
  \slashedGrace { g8 ( } a2) ^( |
  a8)
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  \override Lyrics.LyricText.font-series = #'bold
  Lạy Chúa mọi dân tộc trên địa cầu đều thờ lạy Chúa,
  mọi dân tộc trên địa cầu đều thờ lạy Chúa,
  Chúa chúng ta.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Tâu Thượng Đế, Xin ban quyền bính cho Tân Vương,
  trao công lý trong tay Hoàng Tử
  Để Tân Vương theo công lý xét xử dân Người
  bênh quyền lợi kẻ khó nghèo luôn.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Vương triều sẽ luôn đua nở thắm hoa công minh.
  Thiên thu mãi an ninh thịnh trị.
  Người quản cai qua sông cái đến tận địa cầu,
  từ biển này và tới biển kia.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Bao Hoàng Đế đến mãi từ thác Si -- sa -- ba.
  Hay nơi thẳm xa bao quần đảo.
  Cùng vương công chen nhau bước tới từ Ả -- rập,
  đem phẩm vật triều cống phục suy.
}

% Dàn trang
\score {
  \new ChoirStaff <<
    \new Staff = chorus \with {
        \consists "Merge_rests_engraver"
      }
      <<
      \new Voice = "sopranos" {
        \global \nhacDiepKhucSop
      }
    >>
    \new Lyrics = basses
    \context Lyrics = basses \lyricsto sopranos \loiDiepKhuc
  >>
}

\score {
  \new ChoirStaff <<
    \new Staff = chorus \with {
        \consists "Merge_rests_engraver"
      }
      <<
        \override Staff.TimeSignature.transparent = ##t
        \new Voice = "sopranos" {
          \global \nhacPhienKhucSop
        }
        \new Voice = "basses" {
          \voiceTwo \global \nhacPhienKhucBass
        }
    >>
    \new Lyrics \lyricsto sopranos \loiPhienKhucMot
    \new Lyrics \with \inNghieng \lyricsto sopranos \loiPhienKhucHai
    \new Lyrics \lyricsto sopranos \loiPhienKhucBa
  >>
}
