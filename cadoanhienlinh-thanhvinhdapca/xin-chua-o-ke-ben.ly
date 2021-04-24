% Cài đặt chung
\version "2.20.0"
\include "english.ly"

\header {
  title = "Xin Chúa Ở Kề Bên"
  composer = "TV. 90"
  arranger = " "
  tagline = ##f
}

global = {
  \key g \major
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
nhacDiepKhuc= \relative c'' {
  \override Lyrics.LyricSpace.minimum-distance = #4.0
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \partial 4 g8 fs |
  e4. a8 |
  c c a b |
  b4. a8 |
  b b d, e |
  e2 \bar "|."
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c' {
  \set Score.barAlways = ##t
  \set Score.defaultBarType = ""
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  e8 a a g c c b4 \breathe
  b8 ef ef e! a, b a g4 \breathe
  g8 a b b fs4 \breathe
  a8 b e, g g a b \breathe
  a c a b4 \breathe
  a8 a d, fs e4 (e) \bar "||"
}

nhacPhienKhucHai = \relative c' {
  \set Score.barAlways = ##t
  \set Score.defaultBarType = ""
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  e8 b' b a a c \acciaccatura a8 b4 \breathe
  b8 ef \fermata ef ef e! b a g4 \breathe
  g8 a g g a a b4 \breathe
  b8 fs g a b g fs e4 (e) \bar "||"
}

nhacPhienKhucBa = \relative c' {
  \set Score.barAlways = ##t
  \set Score.defaultBarType = ""
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  e8 a a c b \breathe
  b g b e,4 \breathe
  g8 fs e b' a c a b4 \breathe
  b8 a c b ef b a g4 \breathe
  a8 b a b \acciaccatura e, g \acciaccatura g fs d4 \breathe
  b8 d fs a d, e e4 (e) \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  \override Lyrics.LyricText.font-series = #'bold
  Lúc ngặt ngheo, xin Chúa ở kề bên con,
  xin hãy ở cùng con luôn.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Hỡi ai nương tựa Đấng Chí Tôn
  và núp bóng Đấng toàn năng cao cả
  Hãy thưa với Chúa rằng: Lạy Chúa Trời nơi con ẩn náu
  đồn lũy chở che, con tin cậy nơi Ngài.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Bạn sẽ chẳng gặp điều ác hại
  và tai ương không bén mảng tới nhà.
  Bởi chưng Người truyền cho Thiên Sứ giữ gìn bạn
  trên khắp mọi nẻo đường.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Và khi kêu đến Ta, Ta liền đáp lại.
  Lúc ngặt nghèo, có Ta ở kề bên.
  Ta giải cứu và ban nhiều danh vọng,
  cho sống lâu tuổi thọ an nhàn
  và hưởng ơn cứu độ Ta ban.
}


% Dàn trang
\score {
  \new ChoirStaff <<
    \new Staff = chorus \with {
        \consists "Merge_rests_engraver"
      }
      <<
      \new Voice = "sopranos" {
        \global \stemUp \nhacDiepKhuc
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
        \key g \major \stemNeutral \nhacPhienKhucMot
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
        \key g \major \stemNeutral \nhacPhienKhucHai
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
        \key g \major \stemNeutral \nhacPhienKhucBa
      }
    >>
    \new Lyrics \lyricsto verse \loiPhienKhucBa
  >>
}
