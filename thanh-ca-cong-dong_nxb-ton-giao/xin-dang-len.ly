% Cài đặt chung
\version "2.20.0"
\include "english.ly"

\header {
  title = "Xin Dâng Lên"
  composer = "Hoàng Vũ"
  tagline = ##f
}

global = {
  \key g \major
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
  b2 b4 |
  b2 a4 |
  g4. fs8 e4 |
  d2 r4 |
  d'2 d4 |
  d2 e4 |
  d4 d c |
  b2 r4 |
  b2 c4 |
  d2 d4 |
  b2 g4 |
  a2 r4 |
  a2 a4 |
  a2 fs4 |
  a4 c b |
  g2. ( |
  g4) r4 \bar "||"
}

% Nhạc điệp khúc
nhacDiepKhucSop = \relative c'' {
  \set Score.currentBarNumber = #18
  \partial 4 d4 |
  d4. b8 d4 |
  d2 c4 |
  c4. a8 c4 |
  c2 b4 |
  b4. g8 b4 |
  b4. a8 g4 |
  d'2. ( |
  d2) e4 |
  e4. c8 e4 |
  e2 c4 |
  a4. c8 e4 |
  d2 b4 |
  b4. c8 a4 |
  d4. b8 a4 |
  g2. ( |
  g4) r2 \bar "|."
}

nhacDiepKhucBass = \relative c'' {
  \partial 4 b4 |
  b4. g8 b4 |
  b2 a4 |
  a4. fs8 a4 |
  a2 g4 |
  g4. b,8 d4 |
  g4. fs8 d4 |
  b'2. ( |
  b2) c4 |
  c4. a8 c4 |
  c2 a4 |
  fs4. a8 c4 |
  b2 g4 |
  g4. a8 fs4 |
  g4. d8 c4 |
  b2. ( |
  b4) r2
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Với tiếng hát du dương ngân nhịp nhàng.
  Xin dâng lên trước ngai Vua cao sang.
  Rượu thơm ngat bánh nuôi ngàn dân.
  Như khi xưa Thịt Chiên Thánh giáng trần.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Với ánh nến lung linh trên bàn thờ.
  Xin dâng lên xác con với tâm tư.
  Hợp thánh lễ tiến trên đồi cao.
  Gôn -- gô -- tha tràn tuôn hết máu đào.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"."
  Với cố gắng hy sinh trên đường trần.
  Xin dâng lên trước ngai Vua chí nhân.
  Để kính nhớ chiến công Phục Sinh.
  Xin Cha ban trần gian phúc an bình.
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  \set stanza = #"ĐK:"
  Vinh quang ngàn vinh quang
  cang sang là cao sang,
  khoan nhân đầy khoan nhân Vua trời đất.
  Hãy đoái nhìn thánh lễ chân thành con kính dâng
  xin tha muôn ngàn lỗi cho nhân trần.
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
    \new Lyrics \lyricsto verse \loiPhienKhucBa
  >>
}

\score {
  \new ChoirStaff <<
    \new Staff = chorus  \with {
        \consists "Merge_rests_engraver"
      }
      <<
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

