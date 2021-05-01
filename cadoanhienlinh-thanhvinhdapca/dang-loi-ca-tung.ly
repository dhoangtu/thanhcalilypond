% Cài đặt chung
\version "2.20.0"
\include "english.ly"

\header {
  title = "Dâng Lời Ca Tụng"
  composer = "TV. 21"
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
nhacDiepKhuc = \relative c' {
  \override Lyrics.LyricSpace.minimum-distance = #1.7
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \partial 4 e4 |
  a g8 f |
  e2 |
  g8 f e f |
  d2 |
  f8 e d e |
  c4. f8 |
  e d e g |
  a2 ( |
  a4) r \bar "|."
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c' {
  \override Lyrics.LyricSpace.minimum-distance = #2.0
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \partial 4 d8 e |
  a,4 \tuplet 3/2 { d8 d e } |
  e4 e8 b |
  e4 \tuplet 3/2 { g8 g e } |
  a4 a8 e |
  a4 \tuplet 3/2 { e8 a a } |
  \acciaccatura e8 c'4 \fermata b8 b |
  d2 |
  b8 d e d |
  e4 \fermata a,8 c |
  b4. d8 |
  c8 (b) a4 |
  a2 ( |
  a4) r \bar "||"
}

nhacPhienKhucHai = \relative c' {
  \override Lyrics.LyricSpace.minimum-distance = #2.0
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \partial 4 a8 a |
  e'4 \tuplet 3/2 { e8 d e } |
  b4 \tuplet 3/2 { g'8 d d } |
  e4 \tuplet 3/2 { g8 g g } |
  a2 |
  r4 a8 c |
  c4 \tuplet 3/2 { d8 d e } |
  c4 b8 g |
  g4 \tuplet 3/2 { b8 \fermata g \fermata b \fermata } |
  a2 ( |
  a4) r \bar "||"
}

nhacPhienKhucBa = \relative c' {
  \override Lyrics.LyricSpace.minimum-distance = #2.0
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \partial 4 a8 a |
  e'2 |
  e8 e b d |
  e4 \tuplet 3/2 { f8 a g } |
  g4 f8 d |
  d4 \breathe a'8 e |
  g a e a |
  c2 |
  c8 c a c |
  d4 \tuplet 3/2 { d8 b b } |
  e4 \fermata \tuplet 3/2 { e8 d e } |
  \acciaccatura d8 e4 b8 b |
  d4. c8 |
  c4 b |
  a2 ( |
  a4) r \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  \override Lyrics.LyricText.font-series = #'bold
  Lạy Chúa, chịu ơn Ngài, con dâng lời ca tụng.
  Con dâng lời ca tụng trong ngày đại hội toàn dân.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Điều khấn nguyện, con xin giữ mãi.
  Trước mặt ai biết kính sợ Chúa.
  Kẻ nghèo khó, được ăn no thỏa.
  Người tìm Chúa, đồng vang tiếng ngợi khen.
  Cầu chúc họ sống vui ngàn đời.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Hạng quyền thế trên đời hết thảy,
  sẽ đều thờ lạy một mình Người thôi.
  Phàm những kẻ mang thân cát bụi,
  trước bệ rồng phủ phục kính tôn.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Còn phần con lấy Chúa làm lẽ sống.
  Con cháu mai sau phụng thờ Người.
  Thiên hạ sẽ kể về Đức Chúa,
  cho thế hệ tương lai.
  Lưu truyền hậu thế ơn Người cứu độ.
  Sự nghiệp đây chính Chúa tạo thành.
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