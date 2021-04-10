% Cài đặt chung
\version "2.20.0"
\include "english.ly"

\header {
  title = "Ngợi Khen Chúa"
  composer = "Lc 1, 46-54"
  arranger = " "
  tagline = ##f
}

global = {
  \key c \major
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
  print-page-number = #f
}

% Nhạc điệp khúc
nhacDiepKhucSop= \relative c' {
  \override Lyrics.LyricSpace.minimum-distance = #4.0
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  g'8 e a g |
  e4 c8 d |
  g2 |
  a8. f16 f4 |
  a8 b c a |
  g2 |
  b8. g16 g4 |
  a8 a g d' |
  c4 b |
  c2 ( |
  c4) r4 \bar "|."
}

nhacDiepKhucBass= \relative c' {
  \override Lyrics.LyricSpace.minimum-distance = #4.0
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  e8 c f e |
  c2 |
  r4 f8 a |
  c2 |
  c8. a16 a4 |
  c8 d e d |
  d2 |
  d8. g,16 g4 |
  a8 f d g |
  c,2 ( |
  c4) r
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c' {
  \set Score.barAlways = ##t
  \set Score.defaultBarType = ""
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  a'8 g a g a b c4 \breathe
  a8 c c c c a g4
  f8 f e f e c d4 \breathe
  c8 d a4 a8 e' d c g'4
  gs8 f g! g e4 \breathe
  e8 d d c a b c4 (c) \bar "||"
}

nhacPhienKhucHai = \relative c' {
  \set Score.barAlways = ##t
  \set Score.defaultBarType = ""
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  a'8 a c a c c e, f g4
  g8 c, d e4 \breathe
  a8 g fs4 a8 b a g4 \breathe
  f!8 a a f g g g e4 \breathe
  c8 fs fs g g d c4 (c) \bar "||"
}

nhacPhienKhucBa = \relative c' {
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  f4 a |
  f c'8 a |
  c4 e,8 (f) |
  g2 |
  c,4 c |
  e c8 e |
  a,4 c |
  d2 |
  a'4 f |
  f a8 g |
  g4 a |
  b2 |
  r4 b8 g |
  g4. d'8 |
  a4 g |
  c2 ( |
  c4) r4 \bar "||"
}

% Lời điệp khúc
loiDiepKhucSop = \lyricmode {
  \override Lyrics.LyricText.font-series = #'bold
  Tôi mừng rỡ muôn phần nhờ Thiên Chúa.
  Vâng nhờ Người, tôi hớn hở hân hoan.
  Vâng nhờ Người, tôi vui mừng biết bao, dường bao.
}

loiDiepKhucBass = \lyricmode {
  \override Lyrics.LyricText.font-series = #'bold
  Tôi mừng rỡ muôn phần nhờ Thiên Chúa.
  Vâng nhờ Người, tôi hớn hở bân hoan.
  Vâng nhờ Người, tôi vui mừng biết bao.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Linh hồn tôi ngợi khen Thiên Chúa,
  thần trí tôi hớn hở reo mừng
  trong Chúa là Đấng cứu độ tôi.
  Phận nữ tỳ, Người đoái thương nhìn tới.
  Khiến từ nay muôn đời sẽ khen tôi thật là diễm phúc.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Bởi vì Đấng Toàn Năng đã làm cho tôi những điều cao cả.
  Thật danh Ngài Chí Thánh Chí Tôn.
  Tình thương Chúa trải qua bao thế hệ
  dành cho ai biết kính sợ Ngài.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Kẻ đói nghèo, Chúa ban của đầy dư.
  Người giàu có lại đuổi về tay trắng.
  Chúa độ trì Is -- ra -- el tôi tớ.
  Bởi vì Người nhớ lại tình thương.
}


% Dàn trang
\score {
  \new ChoirStaff <<
    \new Staff <<
      \new Voice = "Soprano" {
        \clef treble \global \nhacDiepKhucSop
      }
      \new Lyrics \lyricsto Soprano \loiDiepKhucSop
    >>
    \new Staff <<
      \new Voice = "Bass" {
        \clef treble \global \nhacDiepKhucBass
      }
      \new Lyrics \lyricsto Bass \loiDiepKhucBass
    >>
  >>
}

\score {
  \new ChoirStaff <<
    \new Staff = verses <<
      \override Staff.TimeSignature.transparent = ##t
      \new Voice = "verse" {
        \key c \major \stemNeutral \nhacPhienKhucMot
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
        \key c \major \stemNeutral \nhacPhienKhucHai
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
