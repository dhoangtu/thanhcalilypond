% Cài đặt chung
\version "2.20.0"
\include "english.ly"

\header {
  title = "Ca Tụng Chúa Đi"
  composer = "TV. 146"
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
  \partial 4. g8 e a |
  g4 d |
  c4. e8 |
  d d16 d  c8 e |
  g2 |
  r8 c b d |
  c4 a |
  a4. e'8 |
  d d16 d b8 d |
  a2 ( |
  a4) r \bar "|."
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c'' {
  \override Lyrics.LyricSpace.minimum-distance = #2.0
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  g8 e a g |
  d2 |
  e8 a e a |
  g2 |
  c8 b d b |
  a2 |
  a8 g c d |
  e2 |
  d4. a8 |
  d8 c b a |
  g8 g4 g8 |
  g2 |
  e8 d a' g |
  g4 d16 (e) d8 |
  c2 ( |
  c4) r \bar "||"
}

nhacPhienKhucHai = \relative c'' {
  \override Lyrics.LyricSpace.minimum-distance = #2.0
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \partial 4 g8 c |
  a a16 a e8 a |
  c4. a16 e' |
  d8 b d b |
  g2 |
  r4 e8 e |
  a a16 a e8 g |
  b2 |
  g8 g d' d |
  a4 d8 d |
  c2 ( |
  c4) r \bar "||"
}

nhacPhienKhucBa = \relative c'' {
  \override Lyrics.LyricSpace.minimum-distance = #2.0
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \partial 4 c8 b |
  a f d f |
  \acciaccatura d8 g2 |
  r4 \tuplet 3/2 { e8 c e } |
  e4 \tuplet 3/2 { g8 f e } |
  d2 |
  r4 a'8 g |
  a a g a |
  b2 |
  r4 b8 b |
  g2 |
  g8 g d' d |
  c2 ( |
  c4) r \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  \override Lyrics.LyricText.font-series = #'bold
  Ca tụng Chúa đi nào, Người chữa trị bao tâm hồn tan vỡ.
  Ca tụng Chúa đi nào, Người chữa trị bao cõi lòng nát tan.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Ca tụng Cúa đi nào, đàn hát mừng Chúa ta.
  Ca tụng Chúa đi nào, thỏa tình ta biết mấy.
  Chúa là Đấng xây dựng lại Giê -- ru -- sa -- lem
  quy tụ Is -- ra -- el tản lạc về.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Người chữa trị bao cõi lòng tan vỡ.
  Những vết thương băng bó cho lành.
  Người định số cho muôn triệu vì sao.
  Và đặt tên cho từng ngôi sao một.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Chúa chúng ta thật là cao cả.
  Uy lực vô biên, trí tuệ khôn lường.
  Chúa nâng đỡ những ai khiêm tốn.
  Bọn gian tà Người hạ xuống đất đen.
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
