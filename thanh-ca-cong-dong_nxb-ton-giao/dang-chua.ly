% Cài đặt chung
\version "2.20.0"
\include "english.ly"

\header {
  title = "Dâng Chúa"
  composer = "Kim Long"
  tagline = ##f
}

global = {
  \key f \major
  \time 2/4
}

\paper {
  #(set-paper-size "a4")
  top-margin = 15\mm
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

inNghieng = { \override LyricText.font-shape = #'italic }

% Nhạc điệp khúc
nhacDiepKhucSop = \relative c'' {
  c2 |
  a4. f8 |
  g4 c,8 c |
  f4 a |
  f8 _(g) a bf |
  c2 |
  bf |
  d4. bf8 |
  g4 g8 g |
  c4 bf |
  a g |
  f2 \bar "|."
}

nhacDiepKhucBass = \relative c'' {
  a2 |
  f4. d8 |
  c4 c8 bf |
  a4 f' |
  d8 ^(c) f f |
  e2 |
  g |
  f4. g8 |
  e4 c8 c |
  a'4 g |
  f e |
  f2
}

% Nhạc phiên khúc
nhacPhienKhuc = \relative c' {
  \set Score.currentBarNumber = #13
  f4. e8 |
  d4 d8 d |
  g4. e8 |
  c4 a8 c |
  f4 e |
  f g8 (f16 g) |
  a2 |
  f4. e8 |
  d4 d8 d |
  g4. e8 |
  c4 a8 c |
  f4 g |
  bf8 (a) g (a16 g) |
  f2 \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  \set stanza = #"ĐK:"
  Chúa ơi từ đây trọn đời con ước nguyện dâng hiến Chúa.
  Thân xác linh hồn nguyện cầu Chúa dẫn đưa trên đời.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Ôi êm đềm này giờ Chúa nhân từ đã dủ thương phận hèn tôi tờ.
  Muôn ơn lành Người đổ xuống chan hòa vì tình yêu không bến không bờ.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Qua bao đời lòng này ước vang lời ngợi khen Cha toàn năng nhân ái.
  Uy danh Người hòa lừng khắp cung trời vì Người đã tạo tác muôn loài.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Muôn cung đàn nhịp nhàng tấu vang trời hòa lời con tụng ca danh Chúa.
  Xin dâng Người niềm trìu mến muôn đời nguồn ơn thiêng mưa tưới chan hòa.
}

% Dàn trang
\score {
  \new ChoirStaff <<
    \new Staff = chorus <<
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
        \global \stemNeutral \nhacPhienKhuc
      }
    >>
    \new Lyrics \lyricsto verse \loiPhienKhucMot
    \new Lyrics \with \inNghieng \lyricsto verse \loiPhienKhucHai
    \new Lyrics \lyricsto verse \loiPhienKhucBa
  >>
}
