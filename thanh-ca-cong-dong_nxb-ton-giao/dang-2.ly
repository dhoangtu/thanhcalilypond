% Cài đặt chung
\version "2.20.0"
\include "english.ly"

\header {
  title = "Dâng 2"
  composer = "Nguyễn Duy"
  tagline = ##f
}

global = {
  \key bf \major
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

% Nhạc phiên khúc
nhacPhienKhuc = \relative c'' {
  d4 d ef |
  d2 g,4 |
  bf a g |
  d2. |
  a'4 a bf |
  a2 a4 |
  d ef c |
  d2. |
  c4 c d |
  g,2 bf4 |
  a2 g4 |
  fs2. |
  d4 ef d |
  a'2 a4 |
  c (bf) a |
  g2. \bar "||"
}

% Nhạc điệp khúc
nhacDiepKhucSop = \relative c'' {
  \set Score.currentBarNumber = #17
  d4 d d |
  bf2 g4 |
  a bf g |
  d2. |
  d4 ef d |
  a'2 a4 |
  a c a |
  bf2. |
  d4 d d |
  bf2 g4 |
  g c d |
  ef2. |
  a,2 f4 |
  d2 d4 |
  d f a |
  g2. \bar "|."
}

nhacDiepKhucBass = \relative c'' {
  bf4 bf bf |
  g2 d4 |
  c d c |
  bf2. |
  bf4 c bf |
  d2 cs4 |
  d ef f |
  g2. |
  bf4 bf a |
  g2 ef4 |
  ef ef d |
  c2. |
  c2 d4 |
  bf2 bf4 |
  a d c |
  bf2.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Con xin tiến dâng rượu bánh nơi nương đồng.
  Do bông lúa thơm và nho chín sạch trong.
  Đôi tay tháng ngày nắng mưa vun trồng.
  Của lễ tỏa hương quyện áng mây hồng.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Con xin tiến dâng trọn xác thân linh hồn.
  Con xin tiến dâng hợp với bánh rượu ngon.
  Xin thương chúc lành lễ dâng chân thành.
  Rượu bánh trở nên nguồn sống nhân trần.
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  \set stanza = #"ĐK:"
  Con xin dâng Ngài này hiến lễ tinh tuyền.
  Cùng tiếng ngợi ca bài tình khúc dịu êm.
  Xin Cha thương nhận trọn niềm con yêu mến.
  Đến muôn đời nguyện thề không dám quên.
}

% Dàn trang
\score {
  \new ChoirStaff <<
    \new Staff = verses <<
      \new Voice = "verse" {
        \global \stemNeutral \nhacPhienKhuc
      }
    >>
    \new Lyrics \lyricsto verse \loiPhienKhucMot
    \new Lyrics \with \inNghieng \lyricsto verse \loiPhienKhucHai
  >>
}

\score {
  \new ChoirStaff <<
    \new Staff = chorus <<
      \override Staff.TimeSignature.transparent = ##t
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

