% Cài đặt chung
\version "2.20.0"
\include "english.ly"

\header {
  title = "Lên Đền Thánh"
  composer = "Thành Tâm"
  tagline = ##f
}

global = {
  \key a \major
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
  \stemNeutral
  \partial 4 cs8 d |
  e4 e8 ds |
  e4 fs |
  e4. d8 |
  b4 b8 cs |
  d4 d8 cs |
  b4 e |
  cs2 _( |
  cs4) cs8 d |
  e4 e8 ds |
  e4 a8. _(b16) |
  b4. a8 |
  fs r fs gs |
  e4 gs |
  b a8 gs |
  a2 | \break
  
  \stemDown
  r4 cs8 cs |
  cs4. b8 |
  a a b a |
  fs2 _( |
  fs8) r b b |
  b4. a8 |
  gs gs a fs |
  e2 |
  r4 cs'8 cs |
  cs4. b8 |
  a a b cs |
  d2 |
  fs,8 r fs gs |
  e4 e8 fs |
  gs4 b |
  a2 _( |
  a4) r \bar "|."
}

nhacDiepKhucBass = \relative c'' {
  \override NoteHead.font-size = #-2
  \skip 1.
  \skip 1.
  \skip 1.
  \skip 1.
  \skip 1.
  \skip 4
  r4 e8 e |
  e4. d8 |
  cs cs d cs |
  a2 ^( |
  a8) r d d |
  d4. cs8 |
  b b e d |
  cs2 |
  r4 e8 e |
  e4. d8 |
  cs cs d e |
  fs2 |
  b,8 r b cs |
  gs4 gs8 a |
  b4 d |
  cs2 ^( |
  cs4) r
}

% Nhạc phiên khúc
nhacPhienKhuc = \relative c' {
  \set Score.currentBarNumber = #33
  fs4 cs |
  fs8 cs fs a |
  gs2 ( |
  gs4) r |
  es4 cs |
  es8 cs es gs |
  fs2 ( |
  fs4) r |
  a fs |
  a8 fs a cs |
  b2 ( |
  b4) b8 a |
  gs r gs fs |
  es4 gs |
  fs f! |
  e8 r \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  \set stanza = #"ĐK:"
  Từ muôn phương ta về đây sánh vai lên đường,
  đường đưa ta đi lên đền Chúa ta.
  Lòng hân hoan ta hòa chung tiếng hát nhịp nhàng,
  vui hát mừng danh Chúa cứu độ ta.
  Tiến tiến bước lên đền đền thánh của Người.
  Cất tiếng hát vui lên dân thánh của Người.
  Tiến tiến bước loan truyền hồng ân Thiên Chúa Trời,
  ta hát mừng tình thiên thu Chúa ta.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Vui mừng khi người ta bảo tôi:
  Ta về thăm nhà Cha chúng ta.
  Một ngày trong nhà Cha dấu yêu,
  sướng vui thay hơn trăm ngày ở xa quê nhà.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Như ngày nào đoàn dân Chúa xưa,
  băng rừng sâu vượt qua biển khơi.
  Lên đường đi hồi hương thánh đô.
  Chúng ta đi đi lên đền Chúa ta thân yêu.
}

% Dàn trang
\score {
  \new ChoirStaff <<
    \new Staff = chorus  \with {
        \consists "Merge_rests_engraver"
      }
      <<
      \new Voice = "sopranos" {
        \voiceOne \global \nhacDiepKhucSop
      }
      \new Voice = "basses" {
        \voiceTwo \global \stemUp \nhacDiepKhucBass
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
  >>
}
