% Cài đặt chung
\version "2.20.0"
\include "english.ly"

\header {
  title = "Ơn Phù Trợ"
  composer = "TV. 120"
  arranger = " "
  tagline = ##f
}

global = {
  \key f \major
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
nhacDiepKhuc = \relative c' {
  \override Lyrics.LyricSpace.minimum-distance = #1.7
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \partial 4 f8 c |
  d f g a |
  c2 |
  r8 bf d bf |
  c4. g8 |
  bf4 g8 a |
  f2 \bar "|."
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c'' {
  \override Lyrics.LyricSpace.minimum-distance = #2.0
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \partial 4 c8 df |
  d bf c f, |
  \acciaccatura g8 a2 ( |
  a8) r g d |
  d f a g |
  g2 ( |
  g8) r8 f c |
  c f f g |
  a2 ( |
  a8) r g c |
  g bf \fermata g a |
  f2 \bar "||"
}

nhacPhienKhucHai = \relative c'' {
  \override Lyrics.LyricSpace.minimum-distance = #2.0
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \partial 4. c8 c a |
  bf4 g8 a |
  f2 |
  r8 f f d |
  f4 a8 f |
  g2 |
  r8 c, g' g |
  a f4 e8 |
  d2 |
  d8 bf' bf g |
  c c4 d8 |
  a2 |
  bf8 bf bf g |
  e4 d'8 b! |
  c2 \bar "||"
}

nhacPhienKhucBa = \relative c' {
  \override Lyrics.LyricSpace.minimum-distance = #2.0
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  f4 df f |
  c2 df4 |
  d bf f' |
  c2. |
  e2 f4 |
  g2 bf4 |
  a2 g4 |
  f2. |
  f4 d f |
  bf2 a4 |
  g2. |
  a4 g a |
  c2 bf4 |
  g2 bf4 |
  c2. |
  bf4 c d |
  bf2 g4 |
  f2. ( |
  f4) r2 \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  \override Lyrics.LyricText.font-series = #'bold
  Ơn phù trợ tôi do bởi Chúa
  là Đấng dựng nên, dựng nên cả đất trời.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Tôi ngước mắt nhìn lên rặng núi.
  Ơn phù hộ tôi bởi nơi nao.
  Ơn phù hộ tôi do bởi Chúa
  là Đấng dựng nên cả đất trời.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Chính Chúa là Đấng canh giữ bạn.
  Chính Chúa là Đấng vẫn chở che.
  Người luôn luôn ở gần kề bạn.
  Ngày sáu khắc vầng ô không tác hại.
  Đêm năm canh vành nguyệt chẳng hại chi.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Chúa gìn giữ bạn khỏi mọi điều bất hạnh.
  Bảo vệ cho sinh mệnh an toàn.
  Nẻo đường bạn Chúa lo toan.
  Lúc đi lúc tới Người hằng canh coi.
  Từ nay đến tận muôn đời.
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
      \new Voice = "verse" {
        \key f \major \time 3/4 \stemNeutral \nhacPhienKhucBa
      }
    >>
    \new Lyrics \lyricsto verse \loiPhienKhucBa
  >>
}
