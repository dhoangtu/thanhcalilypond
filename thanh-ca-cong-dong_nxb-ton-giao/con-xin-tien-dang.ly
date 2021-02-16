% Cài đặt chung
\version "2.20.0"
\include "english.ly"

\header {
  title = "Con Xin Tiến Dâng"
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
  d8 d f e |
  d4. d8 |
  d bf' f g |
  a4
  <<
    {
      a8 a |
      a (bf) a g |
      a4 g8 g |
      g (a) f e |
    }
    {
      f8 f |
      f _(g) f e |
      f4 d8 d |
      e8 (f) d cs |
    }
  >>
  d2 \bar "|."
}

% Nhạc phiên khúc
nhacPhienKhuc = \relative c'' {
  \set Score.currentBarNumber = #9
  a8 a d, f16 (g) |
  a4. g8 |
  a c a16 (g) f8 |
  g2 |
  a8 a d, f |
  g4. g8 |
  f g a f16 (e) |
  d2 \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  \set stanza = #"ĐK:"
  Con xin tiến dâng lên này rượu nho cùng bánh miến:
  Hương kinh ngát bay triền miên tung hô Chúa bao dịu hiền.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Bánh miến này tinh trắng và đây tấm linh hồn con.
  Thắm thiết niềm tin yêu dâng về Thiên Chúa uy quyền.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Chén cứu độ nhân thế này con tiến dâng thành tâm.
  Tiếng khấn nguyện bay cao như trầm hương trước thiên tòa.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Kính tiến về Nhan Chúa ngàn cay đắng nơi trần gian.
  Tiếp nối cuộc hy sinh trên đồi xưa Chúa dâng mình.
}

loiPhienKhucBon = \lyricmode {
  \set stanza = #"4."
  Khắp thế trần vui sống cùng liên kết trong tình yêu.
  Mến Chúa cùng trông mong chung phần vinh phúc quê trời.
}

% Dàn trang
\score {
  \new ChoirStaff <<
    \new Staff = chorus <<
      \new Voice = "sopranos" {
        \voiceOne \global \slurDown \stemNeutral \nhacDiepKhucSop
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
  >>
}
