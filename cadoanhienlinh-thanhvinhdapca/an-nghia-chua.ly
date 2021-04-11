% Cài đặt chung
\version "2.20.0"
\include "english.ly"

\header {
  title = "Ân Nghĩa Chúa"
  composer = "TV. 88"
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
nhacDiepKhucSop= \relative c'' {
  \override Lyrics.LyricSpace.minimum-distance = #4.0
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  g4 a |
  b2 |
  b8 a4 b8 |
  g2 |
  g4 fs |
  e2 |
  g8 g4 b8 |
  d,2 |
  e4 g |
  d4. d8 |
  d'4 a8 fs |
  g2 \bar "|."
}

nhacDiepKhucBass= \relative c' {
  \override Lyrics.LyricSpace.minimum-distance = #4.0
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \override NoteHead.font-size = #-2
  e4 d |
  g2 |
  g8 fs4 e8 |
  d2 |
  e4 c |
  b2 |
  b8 b4 g8 |
  b2 |
  c4 e |
  a,4. a8 |
  fs'4 d8 b |
  g'2
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c'' {
  \set Score.barAlways = ##t
  \set Score.defaultBarType = ""
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  g8 a _(b) b4 b8 b a b g \breathe
  e e e e g g a (g) b, d4 \breathe
  c8 c e4 g8 a g e fs d4 \breathe
  d8 d d b'4 \fermata b8 fs a g g4 \bar "||"
}

nhacPhienKhucHai = \relative c'' {
  \set Score.barAlways = ##t
  \set Score.defaultBarType = ""
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  g8 a _(b) b4 b8 a b a g4 \breathe
  e8 g e4 e8 g4 a8 g e b d4 \breathe
  d8 e d b' b a g a4 a8 e e g d'4 \fermata
  d,8 d d g g4 \bar "||"
}

nhacPhienKhucBa = \relative c'' {
  \set Score.barAlways = ##t
  \set Score.defaultBarType = ""
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  g8 g a b b a b b a (g) g4 \breathe
  e8 g a a g a g b, d4 \breathe
  e4 e d e4 d8 d g a b4 \breathe
  d,8 d d' d fs, a g g4 \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  \override Lyrics.LyricText.font-series = #'bold
  Ân nghĩa Chúa, ca ngợi không ngừng.
  Ân nghĩa Ngài con ca tụng luôn.
  Ân nghĩa Ngài bền vững muôn ngàn đời.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Ân nghĩa Chúa con không ngừng ca tụng.
  Đời lại đời miệng rao giảng Chúa thành tín.
  Vì Ngài phán: Ân nghĩa Ta được xây dựng
  và lòng thành tính vững bền tới thiên thu.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Hạnh phúc thay dân nào biết ca ngợi.
  Họ tiến hành, Lạy Chúa bới nghe danh Ngài luôn.
  Họ suốt ngày, hớn hở reo mừng vui.
  Ấy vì Ngài công chính mà họ được hiên ngang.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Hùng cường hiển hách sức của dâng chính là Ngài.
  Làm uy vũ chúng con trổi cao rạng rỡ.
  Đấng bảo vệ dân là người của Thiên Chúa,
  thuộc quyền Đức Thánh của Is -- ra -- el.
}


% Dàn trang
\score {
  \new ChoirStaff <<
    \new Staff = chorus \with {
        \consists "Merge_rests_engraver"
      }
      <<
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
