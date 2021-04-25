% Cài đặt chung
\version "2.20.0"
\include "english.ly"

\header {
  title = "Sao Nỡ Bỏ Con"
  composer = "TV. 21"
  arranger = " "
  tagline = ##f
}

global = {
  \key f \major
  \time 3/4
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
nhacDiepKhucSop= \relative c'' {
  \override Lyrics.LyricSpace.minimum-distance = #4.0
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \partial 4 a4 |
  d2 c4 |
  a2 a4 |
  g bf g |
  a2 g4 |
  d c g' |
  f2. \bar "|."
}

nhacDiepKhucBass= \relative c' {
  \override Lyrics.LyricSpace.minimum-distance = #4.0
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \override NoteHead.font-size = #-2
  \partial 4 f4 |
  bf2 a4 |
  f2 f4 |
  e g e |
  f2 e4 |
  bf a bf |
  c2.
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c' {
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \partial 4 f8 e |
  d4 \tuplet 3/2 { bf'8 bf g } |
  a4 \breathe g8 f |
  e4 \tuplet 3/2 { d'8 d c } |
  c2 |
  r4 f,8 e |
  d4 \tuplet 3/2 { bf'8 bf g } |
  a4 r8 bf16 g |
  cs2 |
  a8 a e' e |
  d2 \bar "||"
}

nhacPhienKhucHai = \relative c' {
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \partial 4 f8 e |
  d4 \tuplet 3/2 { bf'8 bf g } |
  a4 \breathe g8 f |
  e4 \tuplet 3/2 { c'8 d c } |
  c2 |
  r4 f,8 e |
  d4 \tuplet 3/2 { a'8 bf g } |
  a4 r8 g16 f |
  e2 |
  bf'8 g d' \afterGrace c {d16 [c]} |
  f,2 ( |
  f4) r \bar "||"
}

nhacPhienKhucBa = \relative c' {
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \partial 4 f8 e |
  d4 \tuplet 3/2 { a'8 bf g } |
  a4 \breathe g8 f |
  e4 \tuplet 3/2 { c'8 d c } |
  c2 |
  r4 f,8 e |
  d4 \tuplet 3/2 { bf'8 bf g } |
  a4 r8 g16 f |
  e2 |
  bf'8 g d' c |
  f,2 ( |
  f4) r \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  \override Lyrics.LyricText.font-series = #'bold
  Lạy Chúa con thờ, sao Ngài nỡ bỏ con.
  Sao Ngài ruồng rẫy con.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Thân sâu bọ, chứ phải người đâu.
  Con bị đời mắng mỏ khinh khi.
  Thấy con là chúng đã cười chê:
  ''Nó cậy Chúa, mặc Người cứu nó đi!''
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Vây trong ngoài, lũ ác cuồng si,
  chân tay này đâm thủng thâu qua.
  Đưa mắt nhìn soi mói mỉa mai.
  Xương cốt này đếm từng đốt ngắn dài.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Thánh Danh Ngài, con sẽ truyền loan,
  cho mọi người nhận biết công khai.
  Ca tụng Ngài, hỡi các bạn ơi.
  Hãy một niềm tôn thờ chúc vinh Ngài.
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
        \key f \major \time 2/4 \stemNeutral \nhacPhienKhucMot
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
        \key f \major \time 2/4 \stemNeutral \nhacPhienKhucHai
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
        \key f \major \time 2/4 \stemNeutral \nhacPhienKhucBa
      }
    >>
    \new Lyrics \lyricsto verse \loiPhienKhucBa
  >>
}
