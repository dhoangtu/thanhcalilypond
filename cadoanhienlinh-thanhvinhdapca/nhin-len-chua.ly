% Cài đặt chung
\version "2.20.0"
\include "english.ly"

\header {
  title = "Nhìn Lên Chúa"
  composer = "TV. 122"
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
  \partial 4 c8 a |
  g8 e c d |
  e4 \breathe f8 e |
  d g e16 _(g) a8 |
  g4 \breathe c8 a |
  g c b16 _(c) d8 |
  c2 \bar "|."
}

nhacDiepKhucBass = \relative c' {
  \override Lyrics.LyricSpace.minimum-distance = #1.7
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \override NoteHead.font-size = #-2
  \skip 4
  \skip 2
  \skip 2
  \skip 2
  \skip 4 f8 e |
  d f d16 ^(e) f8 |
  e2
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c'' {
  \override Lyrics.LyricSpace.minimum-distance = #2.0
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \partial 4 c8 d |
  d a a b |
  c4 \breathe c8 b |
  a g a e |
  g2 |
  r4 f8 g |
  g c, c e |
  a,2 |
  c8 e e d |
  d2 |
  e8 c d e |
  \acciaccatura e8 g2 ( |
  g4) r \bar "||"
}

nhacPhienKhucHai = \relative c'' {
  \override Lyrics.LyricSpace.minimum-distance = #2.0
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  g8 g a a |
  e4. e8 |
  c4 d8 c |
  e2 |
  a8 a g a |
  e a c4 ( |
  c) c8 c |
  d4. d8 |
  c4 c8 c |
  e2 ( |
  e4) r \bar "||"
}

nhacPhienKhucBa = \relative c'' {
  \override Lyrics.LyricSpace.minimum-distance = #2.0
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \partial 4 c8 e, |
  g4 c,8 (d) |
  e2 |
  e8 f d a' |
  g2 |
  r4 e8 a |
  g4 e8 a |
  g4 f8 (e) d2 |
  r4 c8 d |
  e4. d8 |
  c4 d |
  a \breathe c8 d |
  e4. a8 |
  g4 a |
  b8 r b a |
  g4. d'8 |
  a4 b |
  c2 ( |
  c4) r \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  \override Lyrics.LyricText.font-series = #'bold
  Mắt chúng tôi luôn nhìn lên Chúa,
  tới khi Người mở lượng xót thương,
  tới khi Người mở lượng xót thương.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Tôi ngước mắt nhìn về phía Chúa,
  Đấng đang ngự trên chốn trời cao.
  Tôi ngước mắt nhìn về phía Người
  như mắt của gia nhân hướng nhìn tay ông chủ.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Như đôi mắt nữ tù hướng nhìn tay bà chủ,
  Ấy mắt ta cũng nhìn lên Chúa là Thượng Đế của ta,
  là Thượng Đế.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Dủ lòng thương, lạy Chúa, xin dủ lòng xót thương.
  Bởi chúng con bị khinh miệt ê chề.
  Hồn cảm thấy chán chường,
  hứng chịu lời nhạo báng của phường tự mãn,
  tiếng chê cười của bọn kiêu căng.
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
