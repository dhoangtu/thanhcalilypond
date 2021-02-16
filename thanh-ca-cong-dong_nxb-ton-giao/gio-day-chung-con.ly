% Cài đặt chung
\version "2.20.0"
\include "english.ly"

\header {
  title = "Giờ Đây Chúng Con"
  composer = "Kim Long"
  tagline = ##f
}

global = {
  \key bf \major
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
  \partial 4 d4 |
  g bf8 (a) |
  g4. g8 |
  g g fs g |
  a4 \breathe g |
  <d' bf>4. <d bf>8 |
  <d bf>4 <ef c>8 <ef c> |
  <d bf> <bf g> <c f,> <c f,> |
  <d bf>4 bf8 c |
  d4 bf |
  g4 g8 a |
  bf4 g |
  d d8 d |
  d4 d8 d |
  <g ef>8 <g ef> <bf d,> <a c,> |
  <g bf,>2 ( |
  \bar "|."
  <g bf,>8)
}

% Nhạc phiên khúc
nhacPhienKhuc = \relative c'' {
  \set Score.currentBarNumber = #17
  \partial 4. g8 g f |
  g4. d8 |
  g8 bf g bf |
  c2 ( |
  c8) c c bf |
  c4. c8 |
  d d bf a |
  g2 ( |
  g4) \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  \set stanza = #"ĐK:"
  Giờ đây chúng con dâng lên thiên tòa cao sang
  của lễ rất thánh bánh trắng tinh rượu nho thanh khiết.
  Nguyện xin Chúa nhân lành nhận của lễ chân thành
  tựa ngàn trầm ngào ngạt bay lên cõi cao xanh.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Muôn dân về đây hợp dâng lễ vật hy sinh.
  Như trên đồi xưa Con Chúa hiến dâng thân mình.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Muôn muôn lời cả, hòa vang trong tình thân yêu.
  Dâng lên tòa cao xin Chúa đoái thương nhậm lời.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Xin chu đoàn con hiệp hoan trong nguồn ơn thiêng.
  Muôn dân hiệp đây tôn kính Chúa luôn trọn niềm.
}

loiPhienKhucBon = \lyricmode {
  \set stanza = #"4."
  Xin Cha toàn năng, nhận đây tấm lòng tin yêu.
  Dâng lên thành tâm xin Chúa xuống ơn chan hòa.
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
