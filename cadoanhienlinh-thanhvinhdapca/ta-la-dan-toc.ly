% Cài đặt chung
\version "2.20.0"
\include "english.ly"

\header {
  title = "Ta Là Dân Tộc"
  composer = "TV. 99"
  arranger = " "
  tagline = ##f
}

global = {
  \key f \major
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
nhacDiepKhuc = \relative c'' {
  \override Lyrics.LyricSpace.minimum-distance = #1.7
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \partial 4. a8 g a |
  d,4. d16 d |
  a'8 g16 _(a) bf _(a) a _(g) |
  a2 |
  r8 g f g |
  c4. c16 c |
  e8 d f16 (e) d8 |
  d2 ( |
  d4) r \bar "|."
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c'' {
  \override Lyrics.LyricSpace.minimum-distance = #2.0
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \partial 4 d,8 d |
  d'4. a16 c |
  c4 f,8 bf |
  bf c4 bf8 |
  a2 |
  r4 a8 e |
  e4 g8 d |
  d4. a16 e' |
  g4. f8 |
  f2 |
  r4 c8 c |
  e4 e8 e |
  g4. bf8 |
  a e4 f8 |
  d2 ( |
  d4) r \bar "|."
}

nhacPhienKhucHai = \relative c'' {
  \override Lyrics.LyricSpace.minimum-distance = #2.0
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  f,4 d8 d |
  d'4 c8 d |
  e4. c16 e |
  d4 \tuplet 3/2 { a8 a c } |
  c4. c8 |
  a8 g4 a8 |
  f4 \tuplet 3/2 { f8 e a } |
  \tempo "Rall" d,4 c8 e |
  d g bf \fermata a |
  a2 ( |
  a4) r \bar "||"
}

nhacPhienKhucBa = \relative c'' {
  \override Lyrics.LyricSpace.minimum-distance = #2.0
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \partial 8 d,8 |
  a'4 f8 e |
  d4 d8 f |
  f4. g8 |
  a4. g8 |
  c4 bf8 a |
  g4 a8 g |
  f4. a8 |
  a4 \afterGrace c (d8) |
  d2 ( |
  d4) r \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  \override Lyrics.LyricText.font-series = #'bold
  Ta là dân tộc, là đoàn chiên của Chúa dẫn dắt.
  Ta là dân tộc, là đoàn chiên của Chúa chăn nuôi.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Toàn cầu hỡi, nào tung hô, nào tung hô Chúa chúng ta.
  Đến phụng thờ, đến phụng thờ, thật hớn hở vui tươi.
  Vào triều bái, vào triều bái, cất cao giọng reo hò.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Hãy nhìn nhận Chúa là Thượng Đế của chúng ta.
  Người dựng nên ta, ta là của riêng Người.
  Dân Người tuyển chọn, đoàn chiên Người dẫn lối ta đi.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Vì Chúa thật nhân lành, hằng yêu thương mãi mãi.
  Vì Chúa rất nhân hậu, vốn trung thành vạn đại thiên thu.
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
