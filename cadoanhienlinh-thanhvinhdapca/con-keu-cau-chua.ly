% Cài đặt chung
\version "2.20.0"
\include "english.ly"

\header {
  title = "Con Kêu Cầu Chúa"
  composer = "TV. 137"
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
  print-page-number = #f
}

% Nhạc điệp khúc
nhacDiepKhucSop = \relative c'' {
  \override Lyrics.LyricSpace.minimum-distance = #1.7
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \partial 4 g4 |
  e'8 \breathe e e e |
  c4 d |
  e c8 e |
  d c a g |
  c2 ( |
  c4) r \bar "|."
}

nhacDiepKhucBass = \relative c'' {
  \override Lyrics.LyricSpace.minimum-distance = #1.7
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \override NoteHead.font-size = #-2
  \partial 4 e,4 |
  c'8 c c c |
  a4 b |
  c a8 c |
  g f e d |
  e2 ( |
  e4) r
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c'' {
  \override Lyrics.LyricSpace.minimum-distance = #2.0
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \partial 4 a4 |
  b c8 d |
  a b a b |
  g4 f8. a16 |
  e8 d e c |
  d2 |
  b'8 g d e |
  c4 f8. e16 |
  f8 a a4 |
  b8 g g d' |
  b8. a16 g8 d' |
  c2 ( |
  c4) r \bar "||"
}

nhacPhienKhucHai = \relative c'' {
  \override Lyrics.LyricSpace.minimum-distance = #2.0
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  g8 a d, g |
  c4 \breathe a8 a |
  c f, b a |
  g2 |
  b8 d g, a |
  g2 |
  d4 f16 f d8 |
  d4 e8 d |
  c2 ( |
  c4) r \bar "||"
}

nhacPhienKhucBa = \relative c'' {
  \override Lyrics.LyricSpace.minimum-distance = #2.0
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  c8 g e g |
  \acciaccatura g8 c2 |
  a8 f c' a |
  g2 |
  f8 d d a' |
  a2 |
  g8 a g b |
  c2 ( |
  c4) r \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  \override Lyrics.LyricText.font-series = #'bold
  Lạy Chúa, khi con kêu cầu lên Chúa,
  thì Chúa thương đã nhận lời con.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Lạy Chúa, con hết lòng dâng lời tán tụng.
  Ngài đã nghe lời con nguyện xin.
  Giữa chư vị Thiên Thần,
  xin đàn ca kính Chúa.
  Hướng về Đền Thánh con phủ phục tôn thờ.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Xin tán tụng danh Chúa,
  vì Ngài vẫn thành tín yêu thương.
  Chúa đáp lời con cầu và gia tăng nghị lực cho tâm hồn.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Chúa cao vời khôn tả.
  Đoái nhìn kẻ thấp hèn.
  Đứa ngạo mạn ngông nghênh
  Từ xa Ngài đã biết.
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