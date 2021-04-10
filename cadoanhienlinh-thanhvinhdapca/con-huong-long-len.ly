% Cài đặt chung
\version "2.20.0"
\include "english.ly"

\header {
  title = "Con Hướng Lòng Lên"
  composer = "TV. 24"
  arranger = " "
  tagline = ##f
}

global = {
  \key d \major
  \time 2/4
}

smallNote = #(define-music-function
  (parser location note)
  (ly:music?)
  #{
    \tweak font-size #-3
    #note
  #}
)

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
  \partial 4 d4 |
  a' a8 bf |
  g a a4 |
  a8 b g (a) |
  b b a (cs) |
  d2 \bar "|."
}

nhacDiepKhucBass= \relative c' {
  \override Lyrics.LyricSpace.minimum-distance = #4.0
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \override NoteHead.font-size = #-2
  \skip 4
  fs4 fs8 g |
  d fs fs4 |
  fs8 g d (fs) |
  g g fs (d) |
  d2
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c' {
  \set Score.barAlways = ##t
  \set Score.defaultBarType = ""
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  e8 a4 a8 g a a g (e) g (a) a4
  d,8 e fs4 e8 cs e cs a4 (a) \breathe
  e'8 cs e g g4 a8 g16 (e) g8 (a) a4
  g8 g b g a4 (a) d,8 e fs a gs a4
  gs8 \fermata e \fermata d4 (d) \bar "||"
}

nhacPhienKhucHai = \relative c' {
  \set Score.barAlways = ##t
  \set Score.defaultBarType = ""
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  e8 a4 e8 g fs e d4 (d8) b cs e a,4
  e'8 g e e e e fs4 (fs) \breathe
  g8 e g b a gs a4 \breathe
  g8 e g fs e \fermata e d4 (d) \bar "||"
}

nhacPhienKhucBa = \relative c' {
  \set Score.barAlways = ##t
  \set Score.defaultBarType = ""
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  g'8 a a g e a \acciaccatura g (a4) \breathe
  fs8 g fs b, b4 a8 cs g' e fs4 (fs) \breathe
  a8 b b a a4 g8 e cs e a,4 (a) e'8 fs g4
  e8 b' \fermata a \fermata (\grace b) d,4 (d) \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  \override Lyrics.LyricText.font-series = #'bold
  Lạy Chúa, con hướng lòng con lên,
  con hướng lòng con lên cùng Chúa.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Lạy Chúa, xin dạy con biết đường lối Chúa.
  Nẻo Ngài đi, xin chỉ bảo con cùng.
  Xin Ngài thương hướng dẫn, lấy lời chân lý mà dạy dỗ bảo ban
  vì Thiên Chúa cứu độ con, chính là Ngài.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Lạy Chúa, giờ đây xin nhớ lại.
  Tình sâu nghĩa nặng, Ngài đã từng biểu lộ ngàn xưa
  Bởi Ngài vốn xót thương từ ái.
  Xin đừng nỡ quên con bao giờ.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Thiên Chúa rất nhân từ chính trực.
  Đưa những ai lầm lạc về nẻo chính đường ngay.
  Hướng dẫn kẻ khiêm cung sống cuộc đời ngay thẳng.
  Dạy cho biết đường lối của Người.
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
        \key d \major \stemNeutral \nhacPhienKhucMot
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
        \key d \major \stemNeutral \nhacPhienKhucHai
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
        \key d \major \stemNeutral \nhacPhienKhucBa
      }
    >>
    \new Lyrics \lyricsto verse \loiPhienKhucBa
  >>
}
