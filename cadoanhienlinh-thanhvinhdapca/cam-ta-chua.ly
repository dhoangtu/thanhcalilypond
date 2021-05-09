% Cài đặt chung
\version "2.20.0"
\include "english.ly"

\header {
  title = \markup { \fontsize #3 "Cảm Tạ Chúa" }
  poet = "TV. 117"
  composer = "Lm. Trần Thanh Cao"
  arranger = " "
  tagline = ##f
}

global = {
  \key c \major
  \time 2/4
}

\paper {
  #(set-paper-size "a4")
  top-margin = 15\mm
  bottom-margin = 15\mm
  left-margin = 20\mm
  right-margin = 20\mm
  indent = #0
  #(define fonts
    (make-pango-font-tree
      "Liberation Serif"
      "Liberation Serif"
      "Liberation Serif"
      (/ 20 20)))
  page-count = #1
}

% Nhạc điệp khúc
nhacDiepKhucSop = \relative c' {
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  c4 e8 d |
  g4. f8 |
  f4 g8 f |
  d4 e8 c |
  c g'4 a8 |
  f4 d |
  g2 |
  g8 c b d16 (e) |
  d4. a8 |
  a4 c |
  g a8 g |
  g b4 d8 |
  g,4 e |
  c'2 \bar "|."
}

nhacDiepKhucBass = \relative c'' {
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  r2 |
  r4 b |
  a4. a8 |
  g2 |
  r4 c |
  d4. c8 |
  b a4 d8 |
  g,2 |
  a8 f d'4 |
  c2 |
  e |
  d4 d |
  b g |
  c2 \bar "|."
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c'' {
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  g4 d'8 (e) |
  d d a c |
  c4 b8 a |
  g4 a |
  a e8 c |
  g'2 ( |
  g8) \breathe c, e e |
  e4 d8 g |
  g4 a8 g |
  g4 b |
  d8 g,4 e8 |
  c'2 \bar "||"
}

nhacPhienKhucHai = \relative c'' {
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  g8 c e, f |
  g4. e8 |
  c4. (e8) |
  r4 d8 d |
  g4 a |
  b a |
  g2 |
  c |
  f,4. a8 |
  c4 e, |
  g e |
  d2 ( |
  d8) f f f |
  e2 |
  c4 d |
  c2 \bar "||"
}

nhacPhienKhucBa = \relative c'' {
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  g4 c |
  b8 b a b |
  e,4 \breathe e |
  a2 |
  g8 g a d, |
  e2 ( |
  e4) c8 d |
  f4. e8 |
  d r e g |
  c b a g |
  f e d c |
  d2 |
  d4 d |
  c2 ( |
  c4) r \bar "||"
}

nhacPhienKhucBon = \relative c' {
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  d8 e c4 |
  a' g8 e |
  c'4 b8 a |
  g2 |
  f4 f |
  d8 d g4 ( |
  g) b,8 b |
  d4. c8 |
  c2 \bar "||"
}

% Lời điệp khúc
loiDiepKhucSop = \lyricmode {
  \override Lyrics.LyricText.font-series = #'bold
  Nào cảm tạ Chúa, vì Ngài rất nhân từ.
  Muôn ngàn đời Chúa vẫn trọn tình thương.
  Nào cảm tạ Chúa đi vì Ngài nhân hậu.
  Muôn ngàn đời Chúa vẫn trọn tình thương.
}

loiDiepKhucBass = \lyricmode {
  \override Lyrics.LyricText.font-series = #'bold
  Chúa ta nhân từ
  Ta hãy mau cảm tạ Chúa nào!
  Cảm tạ biết bao
  Chúa luôn cho trọn tình thương.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Nhà Is -- ra -- el, nào hãy nói:
  Muôn ngàn đời Chúa vẫn trọn tình thương.
  Nhà A -- ha -- ron nào hãy nói:
  Muôn ngàn đời Chúa vẫn trọn tình thương.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Viên đá người thợ xây loại bỏ
  lại trở nên đá tảng góc tường.
  Ấy là Chúa đã làm nên như vậy
  trước mắt chúng ta thật lạ lùng.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Lạy Chúa, xin ban ơn cứu độ.
  Lạy Chúa, xin thương giúp thành công.
  Nguyện xin Chúa chúc lành,
  Nguyện xin Chúa chúc lành cho những ai tiến vào đây,
  nhân danh Ngài.
}

loiPhienKhucBon = \lyricmode {
  \set stanza = #"4."
  Từ thánh điện chúng tôi cầu phúc cho anh em.
  Đức Chúa là Thượng Đế,
  Ngài giải sáng trên ta.
}

% Dàn trang
\score {
  \new ChoirStaff <<
    \new Staff <<
      \new Voice = "Soprano" {
        \clef treble \global \nhacDiepKhucSop
      }
      \new Lyrics \lyricsto Soprano \loiDiepKhucSop
    >>
     \new Staff <<
      \new Voice = "Bass" {
        \clef treble \global \nhacDiepKhucBass
      }
      \new Lyrics \lyricsto Bass \loiDiepKhucBass
    >>
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

\score {
  \new ChoirStaff <<
    \new Staff = verses <<
      \override Staff.TimeSignature.transparent = ##t
      \new Voice = "verse" {
        \global \stemNeutral \nhacPhienKhucBon
      }
    >>
    \new Lyrics \lyricsto verse \loiPhienKhucBon
  >>
}
