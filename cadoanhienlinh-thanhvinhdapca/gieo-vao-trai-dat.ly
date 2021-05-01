% Cài đặt chung
\version "2.20.0"
\include "english.ly"

\header {
  title = "Gieo Vào Trái Đất"
  composer = "TV. 64"
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
  \override Lyrics.LyricSpace.minimum-distance = #4.0
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  d8 e d a' |
  a2 |
  g8 bf g d' |
  d2 |
  e8 d d bf |
  a f c e |
  d2 \bar "|."
}

nhacDiepKhucBass = \relative c' {
  \override Lyrics.LyricSpace.minimum-distance = #4.0
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \override NoteHead.font-size = #-2
  bf8 a bf f' |
  f2 |
  d8 g d bf' |
  bf2 |
  a8 g g g |
  e c a c |
  d2
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c'' {
  \set Score.barAlways = ##t
  \set Score.defaultBarType = ""
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \tempo "Ad. lib." g8 a a g d a' \acciaccatura g8 a4 \breathe
  g8 c, c e g e d4 \breathe
  a'8 d, d' d c g4 \breathe
  a8 a e e4 bf'8 g g a4 \bar "||"
}

nhacPhienKhucHai = \relative c' {
  \set Score.barAlways = ##t
  \set Score.defaultBarType = ""
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  d8 a' a g d g \acciaccatura g8 a4 \breathe
  g8 d f e c e d4 \breathe
  a'8 g d' d g, a4 \breathe
  e8 g e a4 e8 c e d4 \bar "||"
}

nhacPhienKhucBa = \relative c' {
  \set Score.barAlways = ##t
  \set Score.defaultBarType = ""
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  d8 a' g g d g \acciaccatura g8 a4 \breathe
  bf8 bf g bf \acciaccatura g8 d' c c4 \breathe
  a8 e e bf' g a4 \breathe
  g8 d a' a4 d,16 (e) f (e) d8 d4 \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  \override Lyrics.LyricText.font-series = #'bold
  Hạt gieo vào đất tốt.
  Hạt gieo vào đất tốt.
  Sẽ sinh hoa kết quả dồi dào gấp trăm.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Thăm trái đất mưa nhuần Chúa rải,
  cho tràn trề của cải sinh ra.
  Suối trời chứa nước chan hòa,
  sẵn để làm mùa chuẩn bị ruộng nương.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Ngài tưới luống san từng tảng đất,
  khiến dầm mưa cho hạt nẩy mầm.
  Bốn mùa Chúa đổ hồng ân.
  Ngài gieo mầu mỡ ngập tràn lối đi.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Vùng hoang địa xanh rì ngọn cỏ.
  Khắp núi đồi hoa nở tươi xinh.
  Chiên bò gặm cỏ đồng xanh.
  Nương vàng sóng lúa lượn quanh dạt dào.
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
