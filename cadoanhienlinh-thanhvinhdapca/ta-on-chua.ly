% Cài đặt chung
\version "2.20.0"
\include "english.ly"

\header {
  title = "Tạ Ơn Chúa"
  composer = "TV. 91"
  arranger = " "
  tagline = ##f
}

global = {
  \key c \major
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
nhacDiepKhuc = \relative c' {
  \override Lyrics.LyricSpace.minimum-distance = #1.7
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \partial 2 c4 (e) |
  g2 f4 a |
  g4. e8 e4 g |
  c2 \breathe a4 d |
  c4. <b g>8 <b g>4 <d b> |
  <c g>2 r4 \bar "|."
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c' {
  \override Lyrics.LyricSpace.minimum-distance = #2.0
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \partial 4 c8 e |
  d4 \tuplet 3/2 { f8 f a } c2 ( |
  c8) c e c g4 \tuplet 3/2 { d8 f f } |
  e2 r4 c8 e |
  g4. a8 a f4 g8 |
  d2 r4 g8 f |
  e2 b8 c d e |
  c2 r \bar "||"
}

nhacPhienKhucHai = \relative c' {
  \override Lyrics.LyricSpace.minimum-distance = #2.0
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \partial 4 c8 e |
  g4 f8 f a8. a16 g8 b |
  c2 r4 e8 c |
  g2 d8 f g f |
  e2 r4 c8 e |
  g4. a8 g a4 g8 |
  b2 b8 d d a |
  a4. g8 d'4 e |
  c2 r \bar "||"
}

nhacPhienKhucBa = \relative c' {
  \override Lyrics.LyricSpace.minimum-distance = #2.0
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \partial 4 d8 e |
  c2 a'8 g g f |
  \acciaccatura d8 e2 r4 \tuplet 3/2 { f8 f f } |
  a2 a8 d4 c8 |
  c2 r4 c8 a |
  g4. a8 d, d4 g8 |
  \acciaccatura d8 g2 \tuplet 3/2 { b4 a a } |
  g2 \tuplet 3/2 { b4 c d } |
  c2 r \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  \override Lyrics.LyricText.font-series = #'bold
  Lạy Chúa, hạnh phúc thay được tạ ơn Chúa.
  Hạnh phúc thay được tạ ơn Ngài.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Hạnh phúc thay được tạ ơn Chúa.
  Mừng hát danh Ngài, lạy Đấng Chí Tôn.
  Từ buổi sớm, tuyên xưng Ngài nhân hậu.
  Suốt canh khuya, truyền giảng Chúa tín thành.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Người công chính thịnh đạt như cây dừa tươi tốt.
  Sức vươn mình tựa hương bá Li -- băng,
  Chẳng khác chi cây trồng nơi nhà Chúa,
  mơn mởn giữa khuôn viên Đền Thánh của Người.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Già cỗi rồi vẫn sinh hoa kết quả.
  Tràn đầy nhựa sống, cành lá xanh tươi.
  Thế mới hay, Chúa thực là ngay thẳng
  Đấng tôi nương nhờ, chẳng chút bất công.
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
        \global \stemNeutral \nhacPhienKhucMot
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
        \global \stemNeutral \nhacPhienKhucHai
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
        \global \stemNeutral \nhacPhienKhucBa
      }
    >>
    \new Lyrics \lyricsto verse \loiPhienKhucBa
  >>
}
