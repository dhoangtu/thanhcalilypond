% Cài đặt chung
\version "2.20.0"
\include "english.ly"

\header {
  title = "Sống Đời Hoàn Hảo"
  composer = "TV. 49"
  arranger = " "
  tagline = ##f
}

global = {
  \key g \major
  \time 2/4
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
nhacDiepKhuc= \relative c' {
  \override Lyrics.LyricSpace.minimum-distance = #4.0
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  d8 e b d |
  \acciaccatura d8 g4. g8 |
  g fs a b |
  d,4. d8 |
  \tuplet 3/2 { b'8 a b } g a |
  g2 ( |
  g4) \bar "|."
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c'' {
  \set Score.barAlways = ##t
  \set Score.defaultBarType = ""
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  g8 g \breathe
  e g g a4 \breathe
  a8 g a b4 \breathe
  c8 c b b4 \breathe
  g8 a a e e4 \breathe
  g8 g a4 a8 b b a g a b4 \breathe
  c8 a b a b e, fs g b g a4 a g (g) \bar "||"
}

nhacPhienKhucHai = \relative c'' {
  \set Score.barAlways = ##t
  \set Score.defaultBarType = ""
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  a8 g b4 \breathe
  a8 a g b a a4 \breathe
  g8 a b b a g b a fs \acciaccatura e8 g4 \breathe
  g8 a g b g b a a4 \breathe
  b8 a a4 b8 fs d e4 g (g) \bar "||"
}

nhacPhienKhucBa = \relative c'' {
  \set Score.barAlways = ##t
  \set Score.defaultBarType = ""
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  g8 b a b g a b e,4 \breathe
  e8 g a g a g e fs d4 \breathe
  e8 e d g g fs fs a4 \breathe
  a8 b c b4 a8 d d g, e fs4 g (g) \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  \override Lyrics.LyricText.font-series = #'bold
  Ai sống đời hoàn hảo,
  Chúa cho được ơn cứu độ,
  được hưởng ơn cứu độ muôn đời.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Đức Chúa, Thượng Đế Chí Tôn,
  nay Người lên tiếng,
  Khắp cõi đông tây,
  Người triệu tập hoàn cầu:
  Dân ta hỡi, Ta chẳng trách ngươi về lễ tế.
  Lễ toàn thiêu của ngươi,
  hằng nghi ngút trước mặt Ta đêm ngày.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Ta mà đói, Ta đâu cần nói ngươi hay.
  Vì trái đất với mọi loài,
  chính Ta làm chủ.
  Thịt trâu bò, há là thức Ta ăn?
  Máu chiên dê, há là đồ Ta uống?
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Hãy tiến dâng Chúa Trời lễ tán tạ,
  cùng Đấng Tối Cao, phải lo trọn khấn nguyện.
  Hãy kêu cầu Ta trong ngày cùng khốn.
  Ta giải thoát cho, và ngươi sẽ làm hiển danh Ta.
}


% Dàn trang
\score {
  \new ChoirStaff <<
    \new Staff = chorus \with {
        \consists "Merge_rests_engraver"
      }
      <<
      \new Voice = "sopranos" {
        \global \stemNeutral \nhacDiepKhuc
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
        \key g \major \stemNeutral \nhacPhienKhucMot
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
        \key g \major \stemNeutral \nhacPhienKhucHai
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
        \key g \major \stemNeutral \nhacPhienKhucBa
      }
    >>
    \new Lyrics \lyricsto verse \loiPhienKhucBa
  >>
}
