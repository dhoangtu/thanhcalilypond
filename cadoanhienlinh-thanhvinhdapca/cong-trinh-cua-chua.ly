% Cài đặt chung
\version "2.20.0"
\include "english.ly"

\header {
  title = "Công Trình Của Chúa"
  composer = "TV. 103"
  arranger = " "
  tagline = ##f
}

global = {
  \key g \major
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
nhacDiepKhuc = \relative c' {
  \override Lyrics.LyricSpace.minimum-distance = #1.7
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \partial 4 d8 d |
  d'2 b4 |
  g2 \breathe g8 fs |
  e2 e4 |
  \acciaccatura c8 d2 \breathe a'8 d, |
  d2 b4 |
  d2 fs4 |
  g2. \bar "|."
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c' {
  \override Lyrics.LyricSpace.minimum-distance = #2.0
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \partial 4 d4 |
  b' fs g |
  a2 a4 |
  b g a |
  b2 g4 |
  d' c b |
  e,2 \breathe fs4 |
  d a' b |
  g2. \bar "||"
}

nhacPhienKhucHai = \relative c' {
  \override Lyrics.LyricSpace.minimum-distance = #2.0
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \partial 4 d8 g |
  b2 d,8 b' |
  a2 a4 |
  b2 b8 g |
  a2 a8 b |
  e,2 d4 |
  d2. |
  r2 fs8 d |
  e2 a8 a |
  g2 b4 |
  a2 d,8 g |
  b2 g8 a |
  fs2 a4 |
  g2. \bar "||"
}

nhacPhienKhucBa = \relative c'' {
  \override Lyrics.LyricSpace.minimum-distance = #2.0
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \partial 4 g8 fs |
  e2 e8 (g) |
  b2 g8 e |
  c2 d4 |
  d2 g8 e |
  d2 c'4 |
  c2 a8 b |
  b2. |
  r2 g8 g |
  a2 fs4 |
  fs2 d4 |
  g2. \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  \override Lyrics.LyricText.font-series = #'bold
  Lạy Thượng Đế con thờ,
  Chúa muôn trùng cao cả.
  Công trình Ngài vạn đại thiên thu.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Ngài khiến mọc cỏ xanh, nuôi sống đàn gia súc,
  làm tốt tươi thảo mộc, cho người thế hưởng dùng.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Từ ruộng đất, họ kiếm ra cơm bánh.
  Chế rượu ngon cho phấn khởi lòng người.
  Xức dầu thơm cho gương mặt sáng tươi.
  Nhờ cơm bánh mà no lòng chắc dạ.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Công trình Ngài, lạy Chúa,
  quả thiên hình vạn trạng.
  Chúa hoàn thành tất cả thật khôn ngoan.
  Sự nghiệp Chúa tràn đầy mặt đất.
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
