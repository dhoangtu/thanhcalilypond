% Cài đặt chung
\version "2.20.0"
\include "english.ly"

\header {
  title = "Ca Tụng Chúa"
  composer = "TV. 145"
  arranger = " "
  tagline = ##f
}

global = {
  \key c \major
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
nhacDiepKhucSop = \relative c'' {
  \override Lyrics.LyricSpace.minimum-distance = #1.7
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \partial 4. c8 b d |
  c4 \breathe c,8 d |
  e4. g8 |
  a4 g |
  c2 ( |
  c4) r \bar "|."
}

nhacDiepKhucBass = \relative c' {
  \override Lyrics.LyricSpace.minimum-distance = #1.7
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \override NoteHead.font-size = #-2
  \partial 4. f8 d f |
  g4 a,8 b |
  c4. e8 |
  f4 d |
  e2 ( |
  e4) r
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c'' {
  \override Lyrics.LyricSpace.minimum-distance = #2.0
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  c8 c e, f |
  g4 f8 d |
  c2 |
  c8 f f f |
  d4 b8 g' |
  g2 |
  r4 a8 a |
  f r b b |
  g b c d |
  c2 \bar "||"
}

nhacPhienKhucHai = \relative c'' {
  \override Lyrics.LyricSpace.minimum-distance = #2.0
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  c8 b c a |
  g4 f8 d |
  c2 |
  r8 g' g a |
  f4 e8 d |
  d4. d8 |
  b g f'4 |
  d8 fs a d, |
  g2 |
  a8 a b4 |
  g8 b d e |
  c2 \bar "||"
}

nhacPhienKhucBa = \relative c'' {
  \override Lyrics.LyricSpace.minimum-distance = #2.0
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \partial 4 g8 c, |
  c2 |
  a'8 g e f |
  g2 |
  r4 c,8 d |
  e2 |
  f8 f d e |
  c2 |
  r4 g'8 af |
  af af f c' |
  g2 |
  c8 d d d |
  a4 d8 d |
  b2 |
  c8 e d8. c16 |
  c2 \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  \override Lyrics.LyricText.font-series = #'bold
  Ca tụng Chúa đi, hồn tôi hỡi.
  Hãy ca tụng Chúa.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Chúa giữ lòng trung tín mãi muôn đời.
  Xử công minh cho người bị áp bức.
  Ban lương thực, ban lương thực cho kẻ đói ăn.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Chúa giải phóng những ai bị tù tội.
  Chúa mở mắt cho kẻ mù lòa.
  Kẻ bị dìm xuống, Người cho đứng thẳng lên.
  Ai công chính được Người yêu mến chuộng.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Chúa phù trì, kẻ lưu lạc tha phương.
  Người nâng đỡ cô nhi và quả phụ.
  Nhưng phá vỡ mưu đồ ác nhân.
  Chúa vẫn giữ vương quyền muôn thuở.
  Người hiển trị ngàn đời.
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
