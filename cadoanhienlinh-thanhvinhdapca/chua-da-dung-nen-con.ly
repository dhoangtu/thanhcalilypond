% Cài đặt chung
\version "2.20.0"
\include "english.ly"

\header {
  title = "Chúa Đã Dựng Nên Con"
  composer = "TV. 138"
  arranger = " "
  tagline = ##f
}

global = {
  \key f \major
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
nhacDiepKhucSop = \relative c' {
  \override Lyrics.LyricSpace.minimum-distance = #4.0
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \partial 2 f4 g |
  c4. c8 bf4 c |
  c4. c8 f,4 g |
  a c2 bf8 (g) |
  f4. f8 d4 f |
  f g2 e8 (d) |
  c4. g'8 g e4 g8 |
  f1 \bar "|."
}

nhacDiepKhucBass = \relative c' {
  \override Lyrics.LyricSpace.minimum-distance = #4.0
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \partial 2 f4 g |
  a4. a8 g4 a |
  a4. a8 d,4 c |
  f a2 g8 (e) |
  f4. f8 d4 f |
  d d2 c8 (bf) |
  f4. c'8 c4 bf |
  a1
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c' {
  \set Score.barAlways = ##t
  \set Score.defaultBarType = ""
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  f8 (g) c4 bf8 bf c (d) c4
  bf8 bf c d4 d8 c g a c g f4 \breathe
  f8 d d d4 c8 f a f g4 \breathe
  g8 c, g' a g \breathe
  g8 e bf' c4
  bf8 d c c4
  g8 bf c g f4 (f) \bar "||"
}

nhacPhienKhucHai = \relative c' {
  \set Score.barAlways = ##t
  \set Score.defaultBarType = ""
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  f8 g c4 c8 c bf c g4 \breathe
  d8 f d c g' f a g4 \breathe
  f8 f f c' bf c c d c bf4 \breathe
  bf8 g g c a g f4 \breathe
  ef8 g g bf c e, f4 (f) \bar "||"
}


nhacPhienKhucBa = \relative c'' {
  \set Score.barAlways = ##t
  \set Score.defaultBarType = ""
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  c8 bf c bf c bf c g4 \breathe
  bf8 bf f f f4 gf \fermata g \fermata
  bf f4 \breathe
  f8 g! f f f4
  a8 f c' d bf4 (bf) \bar "||"
}

% Lời điệp khúc
loiDiepKhucSop = \lyricmode {
  \override Lyrics.LyricText.font-series = #'bold
  Cảm tạ Chúa đã dựng nên con,
  đã dựng nên con cách lạ lùng,
  đã dựng nên con cách lạ lùng.
  Con dâng lời cảm tạ.
}

loiDiepKhucBass = \lyricmode {
  \override Lyrics.LyricText.font-series = #'bold
  Cảm tạ Chúa đã dựng nên con,
  đã dựng nên con cách lạ lùng,
  đã dựng nên con cách lạ lùng.
  Con xin cảm tạ.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Lạy Chúa, Ngài dò xét con và Ngài biết rõ,
  biết con cả khi đứng khi ngồi.
  Con nghĩ tưởng gì, Ngài thấu suốt từ xa.
  Đi lại hay nghỉ ngơi, Chúa đều xem xét.
  Đường lối con theo, Ngài biết rõ ngọn nguồn.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Tạng phủ con, ấy chính Ngài cấu tạo dệt tấm hình hài,
  trong dạ mẫu thân.
  Cảm tạ Ngài, đã dựng nên con cách lạ lùng.
  Công trình Ngài xiết bao kỳ diệu.
  Hồn con đây, biết rõ mười mươi.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Chi thể con, Ngài không lạ lẫm gì,
  Khi con được hình thành trong nơi bí ẩn.
  Được thêu dệt tài tình trong lòng đất thẳm sâu.
}


% Dàn trang
\score {
  \new ChoirStaff <<
    \new Staff <<
      \new Voice = "Bass" {
        \clef treble \global \nhacDiepKhucSop
      }
      \new Lyrics \lyricsto Bass \loiDiepKhucSop
    >>
    \new Staff <<
      \new Voice = "Soprano" {
        \clef treble \global \nhacDiepKhucBass
      }
      \new Lyrics \lyricsto Soprano \loiDiepKhucBass
    >>
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
