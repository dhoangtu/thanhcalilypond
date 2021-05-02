% Cài đặt chung
\version "2.20.0"
\include "english.ly"

\header {
  title = "Chúa Đối Xử Đại Lượng"
  composer = "TV. 125"
  tagline = ##f
}

global = {
  \key g \major
  \time 2/4
}

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
nhacDiepKhucBass = \relative c' {
  \override Lyrics.LyricSpace.minimum-distance = #4.0
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \partial 8 d8 |
  e fs a b |
  c4 g8 a |
  g4 e'8 e |
  d4 d8 d |
  c4 c8 c |
  b4 a |
  c4. b8 |
  b2 \bar "|."
}

nhacDiepKhucSop = \relative c'' {
  \override Lyrics.LyricSpace.minimum-distance = #4.0
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \partial 8 d8 |
  d d fs, e |
  e4 c'8 c |
  b2 |
  a8 b a e |
  a4. g8 |
  g2 |
  g2 |
  g2 \bar "|."
}

% Nhạc phiên khúc
nhacPhienKhuc = \relative c'' {
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \partial 4. b8 d d |
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
loiDiepKhucSop = \lyricmode {
  \override Lyrics.LyricText.font-series = #'bold
  Chúa đã đối xử đại lượng với chúng con,
  nên chúng con mừng rỡ hân hoan hân hoan.
}

loiDiepKhucBass = \lyricmode {
  \override Lyrics.LyricText.font-series = #'bold
  Chúa đã đối xử đại lượng với chúng con,
  với chúng con, với chúng con,
  với chúng con mừng rỡ hân hoan.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Khi Chúa dắt tù Si -- on trở về,
  ta tưởng mình trong giấc mơ.
  Ngoài miệng vang vang câu cười nói,
  trên môi rộn rã khúc nhạc mừng.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Hôm ấy khắp bàn dân nghe luận đàm,
  ôi việc tay Chúa lớn lao.
  Việc Ngài thi công cao trọng quá,
  con nghe hồn chất ngất niềm vui.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Xin Chúa dẫn đường con dân trở về,
  như chuyển dòng suối phía Nam.
  Nghẹn ngào ra đi reo hạt giống,
  mai sau gặt hái sẽ mừng vui.
}

% Dàn trang
\score {
  \new ChoirStaff <<
    \new Staff <<
      \new Voice = "Bass" {
        \clef treble \global \nhacDiepKhucBass
      }
      \new Lyrics \lyricsto Bass \loiDiepKhucBass
    >>
    \new Staff <<
      \new Voice = "Soprano" {
        \clef treble \global \nhacDiepKhucSop
      }
      \new Lyrics \lyricsto Soprano \loiDiepKhucSop
    >>
  >>
}

\score {
  \new ChoirStaff <<
    \new Staff = chorus \with {
        \consists "Merge_rests_engraver"
      }
      <<
        \override Staff.TimeSignature.transparent = ##t
        \new Voice = "sopranos" {
          \global \nhacPhienKhuc
        }
    >>
    \new Lyrics \lyricsto sopranos \loiPhienKhucMot
    \new Lyrics \with \inNghieng \lyricsto sopranos \loiPhienKhucHai
    \new Lyrics \lyricsto sopranos \loiPhienKhucBa
  >>
}
