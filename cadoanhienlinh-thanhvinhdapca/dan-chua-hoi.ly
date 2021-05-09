% Cài đặt chung
\version "2.20.0"
\include "english.ly"

\header {
  title = "Dân Chúa Hỡi"
  composer = "TV. 77"
  arranger = " "
  tagline = ##f
}

global = {
  \key g \major
  \time 2/2
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
nhacDiepKhuc = \relative c' {
  \override Lyrics.LyricSpace.minimum-distance = #1.7
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \partial 2 d4 e |
  e4. d8 g4 a |
  b2 a4 d |
  b4. a8 g4 a |
  e2 e4 b' |
  a4. g8 fs4 g |
  d4. b8 d4 d |
  e4. d8 g4 a |
  c4. b8 fs4 a |
  g1 \bar "|."
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c'' {
  \set Score.barAlways = ##t
  \set Score.defaultBarType = ""
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \tempo "Ad. lib."
  c8 c d4 c8 d d g, \acciaccatura g8 bf4 \breathe
  c8 bf a4 bf8 f d a' f g4 \breathe
  c8 d d c c d \acciaccatura g,8 bf4 \breathe
  a8 c f, d d4 a'8 \fermata g8 g4 (g) \bar "||"
}

nhacPhienKhucHai = \relative c'' {
  \set Score.barAlways = ##t
  \set Score.defaultBarType = ""
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  d8 d c bf4
  g8 bf a g bf4 \breathe
  c8 bf a4 g8 a bf a g4 \breathe
  d'8 d bf4
  c8 d d c c \acciaccatura g8 bf4 \breathe
  c8 c bf a4 f8 a a g4 (g) \bar "||"
}

nhacPhienKhucBa = \relative c'' {
  \set Score.barAlways = ##t
  \set Score.defaultBarType = ""
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  c8 d c d c d \acciaccatura g,8 bf4 \breathe
  a8 c c f, a a f g4 \breathe
  g8 g g g d' c d d4 \breathe
  a8 a c4 bf8 \tempo "Rall." c d d g,4 (g) \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  \override Lyrics.LyricText.font-series = #'bold
  Dân Chúa hỡi, nào dân Chúa hỡi,
  đừng lãng quên những việc Chúa làm,
  đừng lãng quên những việc Chúa làm.
  Và luôn ghi nhớ, và luôn ghi nhớ,
  xin đừng lãng quên.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Dân tôi hỡi, này nghe tôi dạy bảo.
  Lắng tai nghe đón nhận lời lẽ miệng tôi.
  Tôi sẽ nói một bài huấn dụ.
  Công bố điều huyền diệu thuở xa xưa.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Thấy Chúa tiêu diệt, họ mới đi tìm Chúa.
  Mới trở lại, và đon đả kiếm Người.
  Mới nhớ rằng: Thiên Chúa, Đấng luôn che chở.
  Đấng cứu chuộc họ là Đấng Tối Cao.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Họ chỉ thơn thớt ngoài môi miệng.
  Đầu lưỡi phỉnh phờ dối trá mà thôi.
  Còn lòng dạ chẳng chút gì gắn bó.
  Chẳng thủy chung giữ giao ước với Người.
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
        \key bf \major \stemNeutral \nhacPhienKhucMot
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
        \key bf \major \stemNeutral \nhacPhienKhucHai
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
        \key bf \major \stemNeutral \nhacPhienKhucBa
      }
    >>
    \new Lyrics \lyricsto verse \loiPhienKhucBa
  >>
}