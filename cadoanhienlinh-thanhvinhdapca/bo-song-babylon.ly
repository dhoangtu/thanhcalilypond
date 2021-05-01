% Cài đặt chung
\version "2.20.0"
\include "english.ly"

\header {
  title = "Bờ Sông Babylon"
  composer = "TV. 136"
  arranger = " "
  tagline = ##f
}

global = {
  \key d \major
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
nhacDiepKhucSop= \relative c' {
  \override Lyrics.LyricSpace.minimum-distance = #4.0
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  fs8 g a a |
  a4. a16 a |
  fs8 a d,4 |
  b8 d b' a |
  a2 |
  e8 fs g g |
  g4. g16 g |
  e8 g cs,4 |
  a8 e' fs e |
  d2 ( |
  d4) r \bar "|."
}

nhacDiepKhucBass= \relative c' {
  \override Lyrics.LyricSpace.minimum-distance = #4.0
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \override NoteHead.font-size = #-2
  d8 e fs fs |
  fs4. fs16 fs |
  d8 fs b,4 |
  g8 b g' fs |
  fs2 |
  cs8 d d d |
  d4. d16 d |
  b8 d a4 |
  fs8 b cs b |
  a2 ( |
  a4) r
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c' {
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \partial 4 d8 b' |
  a fs a b |
  cs4 cs8 cs |
  e,4 \tuplet 3/2 { cs8 e a } |
  a4. a8 |
  fs8 a d,16 (e) fs8 |
  fs2 |
  e16 e e8 \acciaccatura e8 a4 |
  r8. a,16 e'8. d16 |
  d2 \bar "||"
}

nhacPhienKhucHai = \relative c' {
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \partial 4 d8 fs |
  a a e4 |
  e8 g a b |
  fs2 |
  b8 cs d \fermata b |
  a2 |
  g8 g g g |
  b2 |
  a8 a e' d |
  d4 \tuplet 3/2 { b8 cs d } |
  a4 g8 a |
  e4 fs8 fs |
  e4. e8 |
  a4 a |
  d,2 \bar "||"
}

nhacPhienKhucBa = \relative c'' {
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  d8 cs b g |
  g4 \breathe g8 e |
  cs'4 b8 a16 a |
  a2 |
  a8 a cs a |
  e'4 \fermata \tuplet 3/2 { e8 d cs } |
  d2 \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  \override Lyrics.LyricText.font-series = #'bold
  Bờ sông Ba -- by -- lon,
  ta ra ngồi nức nở mà tưởng nhớ Si -- on.
  Bờ sông Ba -- by -- lon,
  ta ra ngồi nức nở mà tưởng nhớ Si -- on.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Bọn lính canh đòi ta hát xướng.
  Lũ cướp này mời gượng vui lên.
  Hát đi hát thử đi xem Si -- on quê cũ
  điệu quen một bài.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Bài ca kính Chúa Trời làm sao ta hát nổi,
  nới đất khách quê người.
  Giê -- ru -- sa -- lem hỡi,
  lòng này nếu quên ngươi
  thì tay gảy đàn thành tê bại,
  lưỡi xướng ca sẽ dính với hàm.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Nếu ta không hoài niệm,
  không cần lấy Giê -- ru -- sa -- lem,
  làm niềm vui tuyệt đỉnh của tâm hồn ta.
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
        \global \stemNeutral \nhacPhienKhucMot
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
        \global \stemNeutral \nhacPhienKhucHai
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
        \global \stemNeutral \nhacPhienKhucBa
      }
    >>
    \new Lyrics \lyricsto verse \loiPhienKhucBa
  >>
}