% Cài đặt chung
\version "2.20.0"
\include "english.ly"

\header {
  title = "Dòng Dõi Trường Tồn"
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
nhacDiepKhucSop = \relative c'' {
  \override Lyrics.LyricSpace.minimum-distance = #4.0
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  g8 _(fs) e _(fs) |
  d2 |
  a'4 c, |
  c2 |
  g'4 b, |
  b d |
  d (g8) r |
  b _(a) g4 |
  g2 |
  c8 _(b) a4 |
  a2 |
  d8 d g,4 |
  g2 ( |
  g4) r \bar "|."
}

nhacDiepKhucBass = \relative c' {
  \override Lyrics.LyricSpace.minimum-distance = #4.0
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \skip 2
  b2 |
  d4 a |
  a2 |
  e'4 g, |
  g b |
  b (d8) r |
  g ^(fs) e4 |
  e2 |
  a8 ^(g) d4 |
  d2 |
  b'8 b d,4 |
  g2 ( |
  g4) r
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c'' {
  \set Score.barAlways = ##t
  \set Score.defaultBarType = ""
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  g8 a (b) b4 b8 b a b g \breathe
  e e e e g g a (g) b, d4 \breathe
  c8 c e4 g8 a g e fs d4 \breathe
  d8 d d d'4 \fermata b8 fs a g g4 \bar "||"
}

nhacPhienKhucHai = \relative c'' {
  \set Score.barAlways = ##t
  \set Score.defaultBarType = ""
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  g8 a (b) b b4 b8 a a b g4 \breathe
  a8 g e e g a a (g) b, d4 \breathe
  c \breathe e8 g d g a b a g a4 \breathe
  e \breathe a8 e a \breathe a d4 \fermata
  d8 b a fs g4 \bar "||"
}

nhacPhienKhucBa = \relative c'' {
  \set Score.barAlways = ##t
  \set Score.defaultBarType = ""
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  g8 a (b) b b a a b a b g4 \breathe
  e8 g a g e4 \breathe
  e8 g g b, d4 \breathe
  \tempo "Rall" d8 d'4 \fermata b8 (a) fs g4 \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  \override Lyrics.LyricText.font-series = #'bold
  Dòng dõi người sẽ trường tồn, sẽ trường tồn vạn kỷ,
  sẽ trường tồn, sẽ trường tồn, mãi mãi trường tồn.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Ân nghĩa Chúa con không ngừng ca tụng.
  Đời lại đời miệng rao giảng Chúa thành tín.
  Vì Ngài phán: Ân nghĩa Ta được xây dựng
  và lòng thành tín vững bền tới thiên thu.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Ta đã giao ước với người Ta tuyển chọn,
  đã đoan thề cùng Đa -- vít nghĩa bộc Ta.
  Rằng: Dòng dõi người Ta giữ vững muôn ngàn năm.
  Rằng: Ngai vàng ngươi Ta thiết lập tới muôn ngàn đời.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Ngươi sẽ thưa Ta rằng: Ngài chính là Thân phụ,
  là Thiên Chúa con thờ,
  là nơi con tựa nương,
  là Đấng cứu độ con.
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
