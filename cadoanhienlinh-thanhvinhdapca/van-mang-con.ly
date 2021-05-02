% Cài đặt chung
\version "2.20.0"
\include "english.ly"

\header {
  title = "Vận Mạng Con"
  composer = "TV. 53"
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
nhacDiepKhucSop = \relative c' {
  \override Lyrics.LyricSpace.minimum-distance = #4.0
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \partial 4 e4 |
  b' g8 g |
  a a e g |
  g4 e8 e |
  fs fs d fs |
  e2 \bar "|."
}

nhacDiepKhucBass = \relative c'' {
  \override Lyrics.LyricSpace.minimum-distance = #4.0
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \override NoteHead.font-size = #-2
  \skip 4
  g4  e8 e |
  fs fs c e |
  e4 c8 c |
  d d b d |
  b2
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c' {
  \set Score.barAlways = ##t
  \set Score.defaultBarType = ""
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  fs8 g e4 b'8 c b b a c a b4 (b) \breathe
  a8 b a a e b' g g4 (g8)
  fs8 fs d e c d c b4 \breathe
  a8 c e b4
  \tempo "Rall." fs'8 d a' \fermata e4 (e) \bar "||"
}

nhacPhienKhucHai = \relative c' {
  \set Score.barAlways = ##t
  \set Score.defaultBarType = ""
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  e8 g g e g a b4
  a8 fs fs e e d g4 \breathe
  e8 g g e a \breathe
  fs8 a b e,4 (e) \bar "||"
}

nhacPhienKhucBa = \relative c'' {
  \set Score.barAlways = ##t
  \set Score.defaultBarType = ""
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  g8 e e b' a c b \breathe
  g g a a e g g4
  fs8 d d e b e g4 \breathe
  e8 b'4 c8 c a d b4 \breathe
  \tempo "Rall." a8 g fs d
  \acciaccatura d8 e4 (e) \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  \override Lyrics.LyricText.font-series = #'bold
  Lạy Chúa, vận mạng con chính Ngài nắm giữ,
  vận mạng con tay Ngài đỡ nâng.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Lạy Chúa Trời, xin lấy uy danh mà cứu độ con.
  Minh xử cho con bằng sức mạnh Ngài.
  Xin nghe lời con tha thiết nguyện cầu,
  lời con thưa gửi xin Ngài lắng tai.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Phường kiêu hãnh nhằm con chống đối,
  quân bạo tàn tìm hại mạng con,
  mà cũng chẳng kể chi, kể chi đến Ngài.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Nhưng mà này Chúa trợ giúp con,
  vận mạng con chính Ngài nắm giữ.
  Con tự nguyện dâng Ngài lễ tế.
  Lạy Chúa, con xưng tụng danh Ngài.
  Danh Ngài thật thiện hảo.
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
