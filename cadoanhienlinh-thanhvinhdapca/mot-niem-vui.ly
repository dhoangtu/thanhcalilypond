% Cài đặt chung
\version "2.20.0"
\include "english.ly"

\header {
  title = "Một Niềm Vui"
  composer = "TV. 125"
  tagline = ##f
}

global = {
  \key g \major
  \time 2/4
}

smallNote = #(define-music-function
  (parser location note)
  (ly:music?)
  #{
    \tweak font-size #-3
    #note
  #}
)

inNghieng = { \override LyricText.font-shape = #'italic }

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
nhacDiepKhucSop = \relative c' {
  \override Lyrics.LyricSpace.minimum-distance = #4.0
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  e8 g d g |
  a c4 d8 |
  b2 |
  a8 b e, a |
  b4 fs8 d |
  g2 ( |
  g4) r \bar "|."
}

nhacDiepKhucBass = \relative c' {
  \override Lyrics.LyricSpace.minimum-distance = #4.0
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \override NoteHead.font-size = #-2
  \skip 2
  fs8 a4 b8 |
  g2 |
  e8 g c, e |
  g4 d8 c |
  b2 ( |
  b4) r
}

% Nhạc phiên khúc
nhacPhienKhuc = \relative c' {
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  r8 b' d d |
  e, fs fs e |
  d4. d8 |
  g, b d e |
  d4. c8 |
  c4 e8 e |
  e4 d8 fs ( |
  fs) a a e |
  c' d4 fs,8 |
  g2 \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  \override Lyrics.LyricText.font-series = #'bold
  Việc Chúa làm cho ta, ôi vĩ đại.
  Ta thấy mình chan chứa một niềm vui.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Khi Chúa dẫn tù Si -- on trở về,
  Ta tưởng mình trong giấc mơ.
  Ngoài miệng vang vang câu cười nói,
  trên môi rộn rã khúc nhạc mừng.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Hôm ấy khắp toàn dân nghe luận đàm,
  Ôi việc tay Chúa lớn lao.
  Việc Ngài thi công cao trọng quá,
  con nghe hồn chất ngất niềm vui.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Xin Chúa dẫn đường con dân trở về,
  như chuyển dòng suối phía Nam.
  Nghẹn ngào ra đi gieo hạt giống,
  mai sau gặt hái sẽ mừng vui.
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
        \global \stemNeutral \nhacPhienKhuc
      }
    >>
    \new Lyrics \lyricsto verse \loiPhienKhucMot
    \new Lyrics \with \inNghieng \lyricsto verse \loiPhienKhucHai
    \new Lyrics \lyricsto verse \loiPhienKhucBa
  >>
}
