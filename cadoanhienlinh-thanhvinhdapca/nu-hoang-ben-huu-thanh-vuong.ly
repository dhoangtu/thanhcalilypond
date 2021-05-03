% Cài đặt chung
\version "2.20.0"
\include "english.ly"

\header {
  title = "Nữ Hoàng Bên Hữu Thánh Vương"
  composer = "TV. 44"
  arranger = " "
  tagline = ##f
}

global = {
  \key f \major
  \time 4/4
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
nhacDiepKhuc = \relative c'' {
  \override Lyrics.LyricSpace.minimum-distance = #1.7
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \partial 4 \tuplet 3/2 { c8 (d c) } |
  a4. a8 g a bf c |
  a2 r8 g a bf |
  c4 r8 e, c4 g'8 (a) |
  f1 \bar "|."
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c' {
  \set Score.barAlways = ##t
  \set Score.defaultBarType = ""
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  c8 f a4 a16 bf d,4 f16 (g) a4 \breathe
  g8 a c,4 a8 c g'16 (a) g4 \breathe
  bf8 bf g4 bf8 bf b! c4 \bar "||"
}

nhacPhienKhucHai = \relative c'' {
  \set Score.barAlways = ##t
  \set Score.defaultBarType = ""
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  a16 a bf4 a8 bf a d,4 f16 e d4 bf8 f' d c4 \breathe
  g'8 g c,4 g'8 g f bf a4 \breathe
  bf8 bf bf g4
  bf8 bf b! c4 d8 g, e e4 c8 g' d' c f,4 \bar "||"
}

nhacPhienKhucBa = \relative c' {
  \set Score.barAlways = ##t
  \set Score.defaultBarType = ""
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  8 f a4 c,8 f a a4 \breathe
  d,8 g bf4 d,8 g c c4 \breathe
  d8 c a4 \breathe
  bf8 g e4 d8 d4 c f \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  \override Lyrics.LyricText.font-series = #'bold
  Nữ Hoàng, Nữ Hoàng bên hữu Thánh Vương,
  điểm trang lộng lẫy, toàn vàng ô -- phia.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Hàng tôn nữ có những vì công chúa,
  bên hữu Ngài, Hoàng Hậu sánh vai,
  trang điểm vàng ô -- phia lộng lẫy.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Tôn nương hỡi, xin hãy nghe nào.
  Đưa mắt nhìn và hãy lắng tai.
  Quên dân tộc, quên đi nhà thân phụ.
  Sắc nước hương trời, Quân vương sủng ai.
  Hãy vào phục lạy, Người là Chúa của Bà.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Lòng hớn hở, đoàn người tiến bước.
  Lòng hớn hở, đoàn người bước tới.
  Vẻ tưng bừng, vẻ tưng bừng vào tận hoàng cung.
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