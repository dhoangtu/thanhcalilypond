% Cài đặt chung
\version "2.20.0"
\include "english.ly"

\header {
  title = "Nhan Thánh Chúa"
  composer = "TV. 4"
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
nhacDiepKhucSop= \relative c' {
  \override Lyrics.LyricSpace.minimum-distance = #4.0
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \partial 4 c4 |
  a'2 |
  c8 a a f |
  g2 |
  g8 e e c |
  d4 d |
  a'8 a g8. f16 |
  f2 ( |
  f4) r4 \bar "|."
}

nhacDiepKhucBass= \relative c' {
  \override Lyrics.LyricSpace.minimum-distance = #4.0
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \override NoteHead.font-size = #-2
  \skip 4
  f2 |
  a8 f f d |
  e2 |
  c8 c c f, |
  bf4 bf |
  d8 d c8. c16 |
  f2 ( |
  f4) r
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c'' {
  \set Score.barAlways = ##t
  \set Score.defaultBarType = ""
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  bf16 (g) c4 bf16 (g) g8 g bf c4 \breathe
  bf8 bf bf16 (g) g8 g a g f4 \breathe
  f8 d c4 \breathe
  f8 g a a g g4 \breathe
  c8 c bf4 (bf8) 
  g a g f4 (f) \bar "||"
}

nhacPhienKhucHai = \relative c'' {
  \set Score.barAlways = ##t
  \set Score.defaultBarType = ""
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  c16 (bf) bf (g) g8 bf c a a4 g8 f f g g g c, a'4 \breathe
  bf16 (g) c4 g8 c bf bf f g4 a8 g a f f4 (f) \bar "||"
}

nhacPhienKhucBa = \relative c'' {
  \set Score.barAlways = ##t
  \set Score.defaultBarType = ""
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  bf16 (c) c (bf) g8 a4 \breathe
  g8 g bf bf16 (c)
  \acciaccatura { f,8 g } f4 \breathe
  d8 d16 (f) g (f) d (c) c4 f8 (g) a4 bf8 bf bf
  g g16 (a) g8 f4 (f) \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  \override Lyrics.LyricText.font-series = #'bold
  Lạy Chúa, chúng con chỉ cầu mong,
  chúng con chỉ cầu mong nhìn thấy Thánh Nhan rạng ngời.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Lạy Chúa, là đèn trời soi xét.
  Khi con kêu cầu nguyện Chúa đáp lời.
  Lúc ngặt nghèo, Chúa mở lối thoát cho con.
  Xin thương nghe lời con khẩn cầu.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Biết bao người than thở kêu ca.
  Trên đời này, ai cho ta hạnh phúc?
  Lạy Chúa, phần chúng con chỉ cầu mong
  thấy Nhan Thánh rạng ngời.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Thư thái bình an, vừa nằm con đã ngủ vì chỉ có mình Ngài.
  Lạy Chúa, ban cho con cuộc sống yên hàn.
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
