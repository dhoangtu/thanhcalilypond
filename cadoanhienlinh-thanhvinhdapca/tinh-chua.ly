% Cài đặt chung
\version "2.20.0"
\include "english.ly"

\header {
  title = "Tình Chúa"
  composer = "TV. 89"
  arranger = " "
  tagline = ##f
}

global = {
  \key f \major
  \time 3/8
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
  print-page-number = #f
}

% Nhạc điệp khúc
nhacDiepKhucSop = \relative c'' {
  \override Lyrics.LyricSpace.minimum-distance = #1.7
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  a8 a g |
  a4 d,8 |
  e f d |
  a'4. |
  g8 bf a |
  g4 a8 |
  a4 f8 |
  f4. |
  e8 g f |
  e4 g8 |
  g4 e8 |
  d4. ( |
  d4) r8 \bar "|."
}

nhacDiepKhucBass = \relative c' {
  \override Lyrics.LyricSpace.minimum-distance = #1.7
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \override NoteHead.font-size = #-2
  f8 f d |
  f4 bf,8 |
  c c a |
  f'4. |
  e8 f f |
  e4 f8 |
  f4 d8 |
  c4. |
  c8 d d |
  c4 d8 |
  d4 c8 |
  d4. ( |
  d4) r8
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c'' {
  \override Lyrics.LyricSpace.minimum-distance = #2.0
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  a8 g bf |
  a4 a8 |
  f e d |
  a'4 \breathe g8 |
  e f g |
  c,4 d8 |
  d4. ( |
  d8) r d |
  a'4. |
  r8 bf g |
  g4 g8 |
  bf \acciaccatura d8 e d |
  a4 \breathe g8 |
  e e g |
  a4 \fermata \breathe e'8 |
  d e \acciaccatura bf8 a |
  d4. ( |
  d4) r8 \bar "||"
}

nhacPhienKhucHai = \relative c' {
  \override Lyrics.LyricSpace.minimum-distance = #2.0
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \partial 4 d8 f |
  a4. |
  a8 a g |
  a4 d,8 |
  e f d |
  a'4. |
  bf8 a g ( |
  g) bf (bf) |
  e e d |
  d4. ( |
  d4) c8 |
  c bf d |
  c g a |
  \acciaccatura g8 a4. |
  e8 g a |
  f4 \breathe e8 |
  g a a |
  e4 f8 |
  d4. ( |
  d4) r8 \bar "||"
}

nhacPhienKhucBa = \relative c' {
  \override Lyrics.LyricSpace.minimum-distance = #2.0
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  f8 d a' |
  a4 d,8 |
  f e d |
  a'4 \breathe e8 |
  g f e |
  g e f |
  d4. ( |
  d4) g8 |
  bf g bf |
  d e d |
  a a4 |
  r4 g8 |
  bf c a |
  f4. |
  f8 e f |
  g4 e8 |
  f g e |
  f g e |
  d4. ( |
  d4) r8 \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  \override Lyrics.LyricText.font-series = #'bold
  Xin cho đoàn con được no say tình Chúa,
  Để chúng con được hớn hở vui ca,
  Để chúng con được hớn hở ca mừng.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Xin dạy chúng con biết tuổi đời là mấy.
  Ngõ hầu tâm trí được khôn ngoan.
  Lạy Chúa, xin trở lại!
  Ngài đợi đến bao giờ?
  Xin chạnh lòng thương xót những tôi tớ Ngài đây.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Từ buổi mai, xin cho đoàn con được no say tình Chúa.
  Để mọi ngày được hớn hở vui ca.
  Xin ban tặng chúng con niềm hoan hỷ.
  Bù những tháng năm, Ngài đã bắt nếm nhục nuốt sầu.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Cho bày tôi đây được thấy công trình Chúa,
  và cháu con chiêm ngưỡng vinh hiển Ngài.
  Xin Chúa hằng chiếu tỏa ánh huy hoàng Ngài.
  Việc tay chúng con làm, xin Ngài củng cố.
  Xin củng cố việc tay chúng con làm.
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
