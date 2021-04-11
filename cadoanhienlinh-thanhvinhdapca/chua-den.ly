% Cài đặt chung
\version "2.20.0"
\include "english.ly"

\header {
  title = "Chúa Đến"
  composer = "TV. 23"
  arranger = " "
  tagline = ##f
}

global = {
  \key f \major
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
nhacDiepKhucSop= \relative c'' {
  \override Lyrics.LyricSpace.minimum-distance = #4.0
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \partial 4 a4 |
  a4 f8 f |
  g4 d8 d |
  e d e d |
  c4 \breathe bf' |
  bf g8 g |
  a4 f8 f |
  g d c g' |
  f2 ( |
  f4) r \bar "|."
}

nhacDiepKhucBass= \relative c' {
  \override Lyrics.LyricSpace.minimum-distance = #4.0
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \override NoteHead.font-size = #-2
  \partial 4 f4 |
  f d8 d |
  e4 bf8 bf |
  c bf c bf |
  a4 g' |
  g c,8 c |
  f4 bf,8 bf |
  c bf a c |
  f2 ( |
  f4) r
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c'' {
  \set Score.barAlways = ##t
  \set Score.defaultBarType = ""
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  c8 a bf c c (c16) bf8 c a bf f4 \breathe
  d8 f d c (c16) d8 c a' g g4 (g8) \breathe
  g8 bf c bf bf c bf \acciaccatura bf16 c4 \breathe
  f,8 d f g c,4 a'8 g g f4 (f) \bar "||"
}

nhacPhienKhucHai = \relative c'' {
  \set Score.barAlways = ##t
  \set Score.defaultBarType = ""
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  bf8 g bf c c4 \breathe
  bf8 c a bf c d c4 \breathe
  bf8 g a a d, f c4 \breathe
  bf8 d f g c,4 \breathe
  d8 c g' a f4 (f) \bar "||"
}

nhacPhienKhucBa = \relative c'' {
  \set Score.barAlways = ##t
  \set Score.defaultBarType = ""
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  bf8 c g \breathe
  bf c d c4 \breathe
  a8 a g g e g c,4 \breathe
  d8 c g' g e g e bf'4 \breathe
  c8 bf c bf d c g f4 (f) \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  \override Lyrics.LyricText.font-series = #'bold
  Chúa đến, Người là Vua,
  Người là Vua vinh hiển muôn đời.
  Chúa đến, Người là Vua,
  Người là Vua muôn đời hiển vinh.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Chúa làm chủ trái đất, cùng muôn loài muôn vật,
  làm chủ địa cầu, với toàn thể dân cư.
  Nền trái đất, Người đặt trên biển cả.
  Thiết lập cho vững bền mãi trên sông dài.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Ai được lên núi Chúa,
  Ai đáng vào đứng giữa Thánh cung?
  Ấy là kẻ có lòng thanh sạch chẳng mê theo ngẫu tượng,
  không thề gian nói ngoa.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Người như vậy Chúa chúc phúc cho,
  Chúa chí công dủ tình cứu độ.
  Đây dòng dõi những người đi tìm Chúa.
  Những người mong bệ kiến Thánh nhan Ngài.
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
