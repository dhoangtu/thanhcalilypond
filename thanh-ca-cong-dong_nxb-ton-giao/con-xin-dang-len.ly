% Cài đặt chung
\version "2.20.0"
\include "english.ly"

\header {
  title = "Con Xin Dâng Lên"
  composer = "Kim Long"
  tagline = ##f
}

global = {
  \key f \major
  \time 3/4
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
nhacDiepKhuc = \relative c' {
  \partial 8 d8 |
  d d d c f e |
  d2 r8 d8 |
  a' a a c d, f |
  g2
}

% Nhạc phiên khúc
nhacPhienKhucSop = \relative c'' {
  \set Score.currentBarNumber = #5
  \partial 4 a8 a |
  a4 g8 (a) d bf |
  a2 g8 g |
  g4 f8 (g) a e |
  d2 r8 \bar "|."
}

nhacPhienKhucBass = \relative c' {
  \partial 4 f8 f |
  f4 e8 (d) f g |
  f2 e8 e |
  e4 d8 (e) d cs |
  d2 r8
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  \set stanza = #"ĐK:"
  Con xin dâng lên tòa Chúa uy linh
  của lễ cám mến chúc tụng tôn vinh.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Xin dâng lên rượu bánh khiết trinh,
  xin dâng lên lòng mến chân thành.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Xin dâng lên hồn xác chúng con,
  xin Cha thương tràn xuống ơn lành.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Xin dâng lên đời sống chúng con,
  xin dâng lên ngàn nỗi u buồn.
}

loiPhienKhucBon = \lyricmode {
  \set stanza = #"4."
  Xin dâng lên lòng mến sắt son,
  xin Cha thương gìn giữ vẹn toàn.
}

% Dàn trang
\score {
  \new ChoirStaff <<
    \new Staff = chorus <<
      \new Voice = "chorus" {
        \global \stemNeutral \nhacDiepKhuc
      }
    >>
    \new Lyrics = basses
    \context Lyrics = basses \lyricsto chorus \loiDiepKhuc
  >>
}

\score {
  \new ChoirStaff <<
    \new Staff = verses \with {
        \consists "Merge_rests_engraver"
      }
      <<
      \override Staff.TimeSignature.transparent = ##t
      \new Voice = "sopranos" {
        \voiceOne \global \stemUp \nhacPhienKhucSop
      }
      \new Voice = "basses" {
        \voiceTwo \global \stemDown \nhacPhienKhucBass
      }
    >>
    \new Lyrics \lyricsto sopranos \loiPhienKhucMot
    \new Lyrics \with \inNghieng \lyricsto sopranos \loiPhienKhucHai
    \new Lyrics \lyricsto sopranos \loiPhienKhucBa
    \new Lyrics \with \inNghieng \lyricsto sopranos \loiPhienKhucBon
  >>
}