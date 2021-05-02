% Cài đặt chung
\version "2.20.0"
\include "english.ly"

\header {
  title = "Vườn Nho Của Chúa"
  composer = "TV. 79"
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
}

% Nhạc điệp khúc
nhacDiepKhucSop = \relative c' {
  \override Lyrics.LyricSpace.minimum-distance = #4.0
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  c8 g' e _(g) |
  a4. e8 |
  d _(e) a g |
  g2 |
  g8 c b _(c) |
  d4. f,8 |
  e _(g) d' c |
  c2 \bar "|."
}

nhacDiepKhucBass = \relative c' {
  \override Lyrics.LyricSpace.minimum-distance = #4.0
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \override NoteHead.font-size = #-2
  c8 d c4 |
  f4. e8 |
  d ^(c) f d |
  d2 |
  e8 a g ^(a) 
  b4. f8 |
  e ^(d) f e |
  e2
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c' {
  \set Score.barAlways = ##t
  \set Score.defaultBarType = ""
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  d8 bf (c) d4 \breathe
  g8 a bf a g d ef f ef d d c4 (c8)
  ef c d ef bf bf d c4
  c8 g' a g fs g a b!4 b8 d c c4 c8 e! d bf4
  g8 g g (a) d4 \breathe
  d,8 d g f g a g g4 \bar "||"
}

nhacPhienKhucHai = \relative c' {
  \set Score.barAlways = ##t
  \set Score.defaultBarType = ""
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  d8 bf (c) d c c4
  g'8. a16 bf8 (a) g4
  d8 d ef ef f ef d4 c8 d ef c d4 bf (bf)
  g'8 g fs (g) g a g a b! b!4 c8 a (b)
  \acciaccatura c8 e!4 \breathe
  g,8 g g a a d d d,4 f8 (g) a4 g \bar "||"
}

nhacPhienKhucBa = \relative c' {
  \set Score.barAlways = ##t
  \set Score.defaultBarType = ""
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  d8 d d d bf bf bf c c d d4 \breathe
  g8 fs fs g a g g a b!4 (b8)
  d c d c a a bf c \acciaccatura c e!4
  d8 c b! a g (a) d4
  d,8 g f f f g a4 g \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  \override Lyrics.LyricText.font-series = #'bold
  Vườn nho của Chúa là nhà Is -- ra -- el.
  Vườn nho của Chúa là nhà Is -- ra -- el.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Ôi lạy Chúa là Thiên Chúa chúng tôi,
  xin cho chúng tôi được phục hồi.
  Xin tỏ Thiên nhan hiền từ Chúa ra,
  hầu cho chúng tôi được ơn cứu sống.
  Lạy Chúa Thiên binh cho tới bao giờ
  Ngài còn giận dữ, bỏ mặc những lời dân Chúa van xin.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Ôi lạy Chúa thiên binh, xin thương trở lại,
  từ trời cao xin đoái thương xem và thăm viếng vườn nho này.
  Xin che chở vườn nho mà tay hữu Chúa đã từng cấy,
  bảo vệ ngành nho mà Chúa đã chọn làm sức mạnh.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Xin ra tay ban trợ ngưởi ở bên tay hữu Chúa,
  con người mà Chúa đã chọn làm dũng khí.
  Chúng tôi sẽ không còn rời xa Chúa nữa.
  Chúa cho chúng tôi được sống
  và chúng tôi ca khen Danh Thánh Ngài.
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
        \key bf \major \stemNeutral \nhacPhienKhucMot
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
        \key bf \major \stemNeutral \nhacPhienKhucHai
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
        \key bf \major \stemNeutral \nhacPhienKhucBa
      }
    >>
    \new Lyrics \lyricsto verse \loiPhienKhucBa
  >>
}

