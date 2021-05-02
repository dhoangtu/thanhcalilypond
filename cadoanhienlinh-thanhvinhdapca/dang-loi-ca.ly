% Cài đặt chung
\version "2.20.0"
\include "english.ly"

\header {
  title = "Dâng Lời Ca Ngợi"
  composer = "Dn 3, 52-57"
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
nhacDiepKhuc = \relative c'' {
  \override Lyrics.LyricSpace.minimum-distance = #1.7
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  d8 d b c |
  a4. f8 |
  e (f) b c |
  a2 |
  b8 b g a |
  e4. e8 |
  d c' b a |
  g2 ( |
  g4) r \bar "|."
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c'' {
  \override Lyrics.LyricSpace.minimum-distance = #2.0
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \partial 4 d8 b |
  g4 f8 g |
  a b a b |
  a4 \breathe a8 f |
  d a' a c |
  e,4 f |
  g2 \bar "||"
}

nhacPhienKhucHai = \relative c'' {
  \override Lyrics.LyricSpace.minimum-distance = #2.0
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \partial 4 d8 b |
  g4 a8 a |
  c4 b |
  a \breathe a8 f |
  d4 c'8 c |
  e,4 f |
  g2 \bar "||"
}

nhacPhienKhucBa = \relative c'' {
  \override Lyrics.LyricSpace.minimum-distance = #2.0
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \partial 4 d8 b |
  g4 a8 a |
  c4 b |
  a \breathe a8 f |
  d4 c'8 b |
  a4 e8 (f) |
  g2 \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  \override Lyrics.LyricText.font-series = #'bold
  Xin dâng lời ca ngợi, ca ngợi Thiên Chúa ta.
  Xin dâng lời ca ngợi, ca ngợi chúc vinh muôn đời.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Chúc tụng Ngài là Thiên Chúa tổ tiên chúng con.
  Chúc tụng Ngài trong nơi Thánh Điện vinh quang.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Chúc tụng Ngài trên ngai báu cửu trùng.
  Chúc tụng Ngài Đấng thấu nhìn vực thẳm.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"2."
  Chúc tụng Ngài ngự trên các Thiên Thần,
  Chúc tụng Ngài chốn cao xanh vời vợi.
}


% Dàn trang
\score {
  \new ChoirStaff <<
    \new Staff = chorus <<
      \new Voice = "sopranos" {
        \global \stemNeutral \nhacDiepKhuc
      }
    >>
    \new Lyrics = basses
    \context Lyrics = basses 
      %\with \override LyricText.font-shape = #'bold
      \lyricsto sopranos \loiDiepKhuc
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
