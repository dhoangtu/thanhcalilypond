% Cài đặt chung
\version "2.20.0"
\include "english.ly"

\header {
  title = "Thức Giấc Rồi"
  composer = "TV. 16"
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
  a' a8 a |
  d,4 d8 c |
  a d f f |
  e2 |
  g8 e c e |
  g4 f8 e |
  d2 ( |
  d4) r \bar "|."
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c' {
  \set Score.barAlways = ##t
  \set Score.defaultBarType = ""
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  d8 a'4 a8 g bf a a4
  a8 g g a d, e f4 \breathe
  a8 bf g c d c a4 \breathe
  a8 g f e g4
  f8 e d4 (d) \bar "||"
  
}

nhacPhienKhucHai = \relative c'' {
  \set Score.barAlways = ##t
  \set Score.defaultBarType = ""
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  a8 a bf g g d' a4
  g8 g a d, d e f4 \breathe
  a8 a g bf c bf a4 \breathe
  g8 g g e g f a4 \breathe
  e8 e e f g e f4 \breathe
  a8 g e g f g a4 \breathe
  a8 e g e f e d4 \bar "||"
}

nhacPhienKhucBa = \relative c'' {
  \set Score.barAlways = ##t
  \set Score.defaultBarType = ""
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  a8 bf a a g a a4 \breathe
  a8 a d,4 f8 f g a4 \breathe
  a8 g a4 g8 d d f f4 \breathe
  a8 a g4 a8 g a c d e d4 (d) \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  \override Lyrics.LyricText.font-series = #'bold
  Lạy Chúa, thức giấc rồi,
  con thỏa tình chiêm ngưỡng Thánh Nhan.
  Con thỏa tình chiêm ngưỡng Tôn Nhan Ngài.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Lạy Chúa, xin Ngài xét cho con,
  lắng tai nghe nỗi lòng ai oán.
  Xin đoái nhận bao tiếng van nài
  thốt ra từ miệng lưỡi chẳng điêu ngoa.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Con tuân giữ mọi điều Chúa dạy.
  Đi theo sát đường Ngài đã chỉ,
  không khi nào lỡ bước sa chân.
  Con kêu lên Ngài,
  muôn lạy Chúa, bởi vì Ngài vẫn đáp lời con.
  Cúi xin Ngài lắng tai nghe rõ
  những lời con tha thiết nguyện cầu.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Xin giữ con như thể con ngươi.
  Dưới bóng Ngài, xin thương che chở.
  Sống công chính, con được nhìn thấy Chúa.
  Thức giấc rồi, con thỏa tình chiêm ngưỡng Thánh Nhan.
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
