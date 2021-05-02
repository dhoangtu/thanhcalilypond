% Cài đặt chung
\version "2.20.0"
\include "english.ly"

\header {
  title = "Xin Hãy Nhớ"
  composer = "TV. 24"
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
  a' a8 b! |
  c4 c8 d |
  d4 f,8 g |
  a4 f8 (g) |
  d4. d8 |
  c d a (c) |
  d4. d8 |
  g4 e8 f |
  d2 \bar "|."
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c' {
  \set Score.barAlways = ##t
  \set Score.defaultBarType = ""
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  d8 (f) a4 a8 g a a g a a4 \breathe
  a8 d, f e c e d4 (d) \breathe
  a'8 g a4 bf8 bf g bf c4 \breathe
  f,8 f a d, g4 \breathe
  g8 a bf c g a4 \breathe
  a8 f f a e g f e f d4 \bar "||"
}

nhacPhienKhucHai = \relative c' {
  \set Score.barAlways = ##t
  \set Score.defaultBarType = ""
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  d8 a' f d4 g8  bf g g g g a4 \breathe
  a8 cs4 a8 d c bf a4 \breathe
  a8 bf c a g d f4 \breathe
  g8 f e bf' a4 bf8 a cs \afterGrace cs8 (d) d4 \breathe
  a8 g bf g f e d4 \bar "||"
}

nhacPhienKhucBa = \relative c'' {
  \set Score.barAlways = ##t
  \set Score.defaultBarType = ""
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  g8 a a f d a' f4
  g8 bf a g g g g bf g a4
  cs8 cs a d d a g f g e4
  e8 g a e g f (e) d4 \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  \override Lyrics.LyricText.font-series = #'bold
  Lạy Chúa, xin hãy nhớ, xin hãy nhớ lòng thương xót của Ngài.
  Nghĩa nặng với tình sâu, giờ đây xin nhớ lại.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Lạy Chúa, xin dạy con biết đường lối Chúa.
  Nẻo Ngài đi xin chỉ bảo con.
  Xin Ngài thương hướng dẫn lời chân lý  mà dạy dỗ bảo ban.
  Vì Thiên Chúa cứu độ con, chính là Ngài,
  Đấng lòng con mong đợi suốt ngày.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Tình sâu nghĩa nặng, Ngài đã từng biểu lộ ngàn xưa.
  Lạy Chúa giờ đây xin nhớ lại.
  Tuổi xuân trót dại bao lầm lỗi,
  dám xin Ngài bỏ qua.
  Bởi Ngài vốn xót thương xin đừng nỡ quên con bao giờ.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Thiên Chúa rất nhân từ chính trực,
  đưa những ai lầm lạc về nẻo chính đường ngay.
  Hướng dẫn kẻ khiêm cung sống cuộc đời ngay thẳng,
  dạy cho biết đường lối của Người.
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
