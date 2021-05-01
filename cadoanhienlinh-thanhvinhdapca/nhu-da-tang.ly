% Cài đặt chung
\version "2.20.0"
\include "english.ly"

\header {
  title = "Như Đá Tảng"
  composer = "TV. 30"
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
  \partial 4 c4 |
  a'4. a8 |
  g a a c |
  f,4. e8 |
  g d4 d8 |
  c4. e8 |
  g f4 g8 |
  f2 ( |
  f4) r \bar "|."
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c' {
  \override Lyrics.LyricSpace.minimum-distance = #2.0
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \partial 4 c4 |
  a' \breathe a8 g |
  a (bf) a (g) |
  f2 |
  r8 f d f |
  c d4 f8 |
  g2 |
  r8 c bf d |
  c4 \tuplet 3/2 { f,8 f g } |
  a4 bf8 a |
  g2 |
  c,8 g' g a |
  f2 ( |
  f4) r \bar "||"
}

nhacPhienKhucHai = \relative c'' {
  \override Lyrics.LyricSpace.minimum-distance = #2.0
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \partial 4. c8 bf c |
  c4 \tuplet 3/2 { bf8 d c } |
  c2 |
  bf8 f f g |
  a4. bf8 |
  a d,4 d8 |
  c2 |
  r8 d c d |
  c4 c8 f |
  f g a4 |
  d,8 f d4 ( |
  d8) e g a |
  f2 ( |
  f4) r \bar "||"
}

nhacPhienKhucBa = \relative c' {
  \override Lyrics.LyricSpace.minimum-distance = #2.0
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  f8 a g f |
  d2 |
  c8 c f a |
  g2 |
  bf8 c bf d |
  \acciaccatura bf8 c2 |
  r4 c8 c |
  bf4 g16 bf g8 |
  c2 |
  r4 bf8 bf |
  c4. g8 |
  bf4 g |
  f2 ( |
  f4) r \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  \override Lyrics.LyricText.font-series = #'bold
  Lạy Chúa, xin Ngài nên như đá tảng,
  để con được độ trì,
  để con được cứu độ.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Lạy Chúa, con ẩn náu bên Ngài,
  mong chẳng bao giờ phải hổ ngươi.
  Xin giải thoát con, vì Ngài công chính,
  lắng tai nghe và mau chưa lành.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Xin Ngài nên như tảng đá dung thân,
  như tòa nhà kiên cố để con được độ trì.
  Chúa là sức mạnh, là nơi con ẩn náu.
  Vì danh Ngài, xin dẫn dắt con.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Nguyện Thánh Nhan đã rạng, nhìn đầy tớ Chúa đây
  và thương tình cứu độ.
  Hết những ai cậy trông vào Chúa,
  mạnh bạo lên và hãy can trường.
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
