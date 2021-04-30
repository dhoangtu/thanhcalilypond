% Cài đặt chung
\version "2.20.0"
\include "english.ly"

\header {
  title = "Con Sẽ Loan Truyền"
  composer = "TV. 70"
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
nhacDiepKhuc= \relative c' {
  \override Lyrics.LyricSpace.minimum-distance = #4.0
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \partial 4 d4 |
  a'2 |
  g8 a bf a |
  g4 a8 g |
  f4 e8 f |
  c4 a |
  d2 \bar "|."
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c' {
  \set Score.barAlways = ##t
  \set Score.defaultBarType = ""
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  d8 a'4 a8 bf c bf a4 \breathe
  a8 g g c c g a \acciaccatura g8 a4 \breathe
  a8 f f a d, f g4
  e8 f g c, e f d4 (d) \bar "||"
}

nhacPhienKhucHai = \relative c' {
  \set Score.barAlways = ##t
  \set Score.defaultBarType = ""
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  d8 a'4 a8 g a g c bf a4 \breathe
  a8 g g a bf a g a g f4 \breathe
  f8  bf g c a \fermata g g g c c bf a4 \breathe
  g8 g a g e f e d4 (d) \bar "||"
}

nhacPhienKhucBa = \relative c' {
  \set Score.barAlways = ##t
  \set Score.defaultBarType = ""
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  d8 d a'4 a8 g g bf a g f4 \breathe
  e8 e f g g f e d4 \breathe
  a'8 a g g c g c bf a4 \breathe
  a8 cs cs \fermata d d a g f4 \breathe
  g8 a f e g f a4 \breathe
  a8 e e4 \breathe
  g8 a e g a f e d4 (d) \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  \override Lyrics.LyricText.font-series = #'bold
  Lạy Chúa, miệng con sẽ loan truyền,
  sẽ loan truyền ơn cứu độ Ngài ban.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Lạy Chúa, con nương ẩn nơi Ngài.
  Xin đừng để con muôn đời tủi hổ.
  Bởi vì Ngài chính trực công minh.
  Xin cứu thoát và giải phóng con.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Lạy Chúa, xin Ngài như tảng đã dung thân.
  Như tòa nhà kiên cố, cho con sống an toàn.
  Vì Chúa là sức mạnh và là đồn lũy chở che con.
  Xin giải thoát con khỏi tay kẻ thù.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Vì lạy Chúa, chính Ngài là Đấng con mong đợi.
  Từ độ thanh xuân con trông cậy Ngài.
  Con nương tựa vào Chúa từ thuở sơ sinh.
  Ngài đã kéo con ra khỏi lòng mẹ.
  Con đã được Ngài thương dạy dỗ.
  Tới giờ này ' ' ' ' ' ' ' '
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
        \key f \major \stemNeutral \nhacPhienKhucMot
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
        \key f \major \stemNeutral \nhacPhienKhucHai
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
        \key f \major \stemNeutral \nhacPhienKhucBa
      }
    >>
    \new Lyrics \lyricsto verse \loiPhienKhucBa
  >>
}
