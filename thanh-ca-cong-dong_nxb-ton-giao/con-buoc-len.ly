% Cài đặt chung
\version "2.20.0"
\include "english.ly"

\header {
  title = "Con Bước Lên"
  composer = "Kim Long"
  tagline = ##f
}

global = {
  \key a \minor
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
  \partial 4 a8 c |
  a _(g) e g |
  a4 c8 d |
  e4 d8 c |
  d e c a |
  b2 ( |
  b4) b8 b |
  c (b) a4 |
  b8 c b16 _(a) b8 |
  e,4 c'8 d |
  e e c b |
  a2 ( |
  a4) \bar "|."
}

nhacDiepKhucBass = \relative c'' {
  \skip 4
  \skip 2
  \skip 4 a8 b |
  c4 b8 a |
  b gs a f |
  e2 ( |
  e4) e8 e |
  a (g) f4 |
  e8 e d d |
  c4 a'8 b |
  gs a e e |
  c2 ( |
  c4)
}

% Nhạc phiên khúc
nhacPhienKhuc = \relative c'' {
  \set Score.currentBarNumber = #13
  \partial 4 g8 a |
  e4 g |
  a b8 c |
  a4 c |
  d d8 c |
  d4 e |
  e2 ( |
  e4) e8 f |
  e d c a |a4 b8 c |
  b a a f |
  e4 e8 b |
  e e g4 |
  a2 ( |
  a4) \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  \set stanza = #"ĐK:"
  Con bước lên bàn thờ Chúa gần bên Chúa,
  tâm hồn con sướng vui thảnh thơi.
  Nơi danh Chúa toàn năng tác sinh đất trời
  tràn ân phúc cứu độ muôn đời.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Đây lễ vật hy sinh Con Chúa Trời uy linh,
  dâng mình trên Thánh giá.
  Nay tiến dâng trên muôn bàn thờ
  đây bánh thơm đây ly rượu nồng
  lễ vật vẹn sạch trinh trong.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Xin Chúa Trời khoan nhân dung thứ tội đoàn con,
  tinh luyện trong đức ái.
  Như nước tan trong ly rượu nồng
  như ánh hương bay quanh lửa hồng
  đoan nguyện một niềm cậy trông.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Đây tấm lòng muôn dân
  liên kết bằng tình thân,
  dâng về nhan thánh Chúa.
  Bao cánh tay vươn lên nguyện cầu
  trong sướng vui hay trong khổ sầu
  tâm hoòn dạt dào tin yêu.
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
