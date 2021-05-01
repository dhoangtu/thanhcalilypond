% Cài đặt chung
\version "2.20.0"
\include "english.ly"

\header {
  title = "Này Con Xin Đến"
  composer = "TV. 39"
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
nhacDiepKhucSop = \relative c' {
  \override Lyrics.LyricSpace.minimum-distance = #1.7
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \partial 4 c4 |
  a'4 \tuplet 3/2 { f8 g g } |
  a4 \tuplet 3/2 { g8 a bf } |
  c4 f,8 f |
  g4 a8 a |
  a4 \breathe c,4 |
  a' \tuplet 3/2 { f8 g g } |
  a4 \tuplet 3/2 { g8 a bf } |
  c4 f,8 f |
  g4 a8 a |
  \acciaccatura a8 f2 ( |
  f4) r \bar "|."
}

nhacDiepKhucBass = \relative c' {
  \override Lyrics.LyricSpace.minimum-distance = #1.7
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \override NoteHead.font-size = #-2
  \partial 4 c4 |
  f4 \tuplet 3/2 { d8 e e } |
  f4 \tuplet 3/2 { e8 f g } |
  a4 d,8 d |
  e4 f8 f |
  f4 c |
  f \tuplet 3/2 { d8 e e } |
  f4 \tuplet 3/2 { e8 f g } |
  a4 bf,8 bf |
  c4 c8 c |
  a2 ( |
  a4) r
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c'' {
  \override Lyrics.LyricSpace.minimum-distance = #2.0
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \partial 4 c8 d |
  f, g a g |
  c2 |
  r4 bf8 c |
  g bf c g |
  f2 |
  r4 d8 f |
  c f a e16 f |
  g2 |
  r4 g8 c |
  bf g c d |
  c2 ( |
  c4) r \bar "||"
}

nhacPhienKhucHai = \relative c'' {
  \override Lyrics.LyricSpace.minimum-distance = #2.0
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \partial 4 c8 d |
  f, g a g16 c |
  c2 |
  r4 bf8 c |
  g bf c g |
  f2 |
  r4 d8 f |
  c f a f |
  g4 \breathe g8 e |
  c4 \fermata \breathe g'8 e |
  g e g bf |
  c2 ( |
  c4) r \bar "||"
}

nhacPhienKhucBa = \relative c' {
  \override Lyrics.LyricSpace.minimum-distance = #2.0
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \partial 4 f4 |
  bf2 |
  bf8 bf c f,16 (g) |
  a2 |
  g4. bf8 |
  c g bf c |
  c2 |
  r4 bf8 c |
  g2 ( |
  g8) bf \acciaccatura bf8 c g |
  f2 ( |
  f4) r \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  \override Lyrics.LyricText.font-series = #'bold
  Lạy Chúa, này con xin đến, này con xin đến,
  để thực thi Thánh ý Chúa.
  Lạy Chúa, này con xin đến, này con xin đến,
  để thực thi Thánh ý Chúa.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Tôi hết lòng cậy trông Thượng Đế.
  Người đoái nhìn nghe tiếng tôi cầu.
  Ngưởi mở miệng tôi hát bài ca mới.
  Bài tán dương Thượng Đế chúng ta.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Chúa chẳng chuộng hy lễ và hiến lễ.
  Ngài mở rộng tai con đêm ngày.
  Lễ xá tội và lễ toàn thiêu,
  Chúa chẳng đòi.
  Con liền thưa: Này con xin đến.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Lạy Chúa, sách đã chép về con.
  Rằng con thích làm theo ý Chúa.
  Tận đáy lòng ấp ủ tình Ngài.
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