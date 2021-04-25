% Cài đặt chung
\version "2.20.0"
\include "english.ly"

\header {
  title = "Chúa Nhân Hậu Từ Bi"
  composer = "TV. 102"
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
nhacDiepKhucSop= \relative c'' {
  \override Lyrics.LyricSpace.minimum-distance = #4.0
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  c4. a8 |
  f g c, a |
  c4. c8 |
  d e a bf |
  g f4 g8 |
  f2 ( |
  f4) r \bar "|."
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c'' {
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \partial 4. c8 a c16 (d) |
  c4 f,8 g |
  a4. bf8 |
  a bf g4 |
  f8 d' e d |
  c2 |
  r8 c a c16 (d) |
  c4 f,8 g |
  a2 |
  bf8 bf a4 |
  f8 g f g |
  f2 ( |
  f4) r \bar "||"
}

nhacPhienKhucHai = \relative c'' {
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \partial 4. d8 c c |
  c f, g f |
  a2 |
  bf8 a g4 |
  d'8 b!4 g8 |
  c2 ( |
  c8) r d c |
  d c f, a |
  d,2 |
  r4 e8 c |
  g'4 c,8 c |
  a'4 g |
  f2 ( |
  f4) r \bar "||"
}

nhacPhienKhucBa = \relative c'' {
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \partial 4 c8 a |
  d c c f, |
  f4. a8 |
  a a d, f |
  f4 a8 a |
  g2 |
  r8 c a c |
  f, f g g |
  a4. bf8 |
  bf g g b \fermata |
  d e4 d8 |
  c2 ( |
  c4) r \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  \override Lyrics.LyricText.font-series = #'bold
  Chúa một niềm nhân hậu từ bi,
  giàu lòng thương xót thứ tha mọi lỗi lầm.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Chúc tụng Chúa đi, hồn tôi hỡi.
  Chúc tụng danh Người bằng tất cả tâm can.
  Chúc tụng Chúa đi, hồn tôi hỡi.
  Chớ khá quên mọi ân huệ của Người.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Chúa tha cho người ngàn muôn tội lỗi,
  thương chữa lành các bệnh tật ngươi.
  Cứu ngươi khỏi chôn vùi đáy huyệt.
  Bao bọc người bằng tình nghĩa mặn mà.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Đông Đoài cách xa nhau ngàn dặm,
  Chúa cũng ném tội ta đi mãi chốn xa.
  Như người cha chạnh lòng thương con cái,
  Chúa cũng chạnh lòng thương kẻ kính tôn Người.
}


% Dàn trang
\score {
  \new ChoirStaff <<
    \new Staff = chorus \with {
        \consists "Merge_rests_engraver"
      }
      <<
      \new Voice = "sopranos" {
        \global \stemUp \nhacDiepKhucSop
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
