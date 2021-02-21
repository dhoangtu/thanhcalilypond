% Cài đặt chung
\version "2.20.0"
\include "english.ly"

\header {
  title = "Lời Chân Thành"
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
nhacDiepKhucSop = \relative c' {
  d8 g f g |
  a4 a8 a |
  g a bf g |
  a2 |
  a8 d c bf |
  a4 g8 bf |
  a g f e |
  d2 \bar "|."
}

nhacDiepKhucBass = \relative c' {
  \skip 2.
  f8 f |
  e f g e |
  f2 |
  f8 a g g |
  f4 e8 g |
  f e d cs |
  d2
}

% Nhạc phiên khúc
nhacPhienKhuc = \relative c' {
  \set Score.currentBarNumber = #9
  d8 (f) a g |
  a4. c8 |
  f, (g) a f |
  d2 |
  d8 d d f |
  g4. f8 |
  g (a16 g) f8 g |
  a2 \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  \set stanza = #"ĐK:"
  Lời chân thành dâng tiến
  như hương trầm bay tới trời cao.
  Nguyện Chúa cha nhân từ
  nhận lễ hy sinh trên bàn thờ.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Tưởng nhớ con Chúa đã chịu chết khổ hình.
  Và cuộc Người phục sinh cùng lên trời vinh sáng.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Nguyện Chúa trông đến lễ vật rất tinh tuyền.
  Lòng thành hiệp dâng lên rượu bánh nguồn sinh phúc.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Nguyện Chúa nhân thứ phái thần sứ trên trời,
  nhận về tòa cực linh này Máu Thịt Con Chúa.
}

loiPhienKhucBon = \lyricmode {
  \set stanza = #"4."
  Nguyện Chúa thương đoái những người đã ly trần,
  dìu về trời quang vinh tụng ca tình yêu Chúa.
}

loiPhienKhucNam = \lyricmode {
  \set stanza = #"5."
  Nguyện Chúa thương đến tầm lòng rất chân thành,
  đoàn người hiệp nhau đây cùng chung niềm tin kính.
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
    \new Lyrics \with \inNghieng \lyricsto verse \loiPhienKhucBon
    \new Lyrics \lyricsto verse \loiPhienKhucNam
  >>
}
