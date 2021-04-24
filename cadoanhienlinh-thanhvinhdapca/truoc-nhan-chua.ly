% Cài đặt chung
\version "2.20.0"
\include "english.ly"

\header {
  title = "Trước Nhan Chúa"
  composer = "TV. 115"
  arranger = " "
  tagline = ##f
}

global = {
  \key c \major
  \time 4/4
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
nhacDiepKhucSop= \relative c'' {
  \override Lyrics.LyricSpace.minimum-distance = #4.0
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \partial 2 g4. e8 |
  a g4 f8 d4 e |
  c2 \breathe b4. c8 |
  d4 a c e |
  g2 a4. f8 |
  c' b4 a8 g4 a |
  b2 b4. a8 |
  d4 a8 b d4 a8 _(g) |
  c2 (c4) r \bar "|."
}

nhacDiepKhucBass= \relative c' {
  \override Lyrics.LyricSpace.minimum-distance = #4.0
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \override NoteHead.font-size = #-2
  \partial 2 e4. c8 |
  f e4 d8 b4 c |
  g2 g4. a8 |
  b4 a a c |
  d2 f4. d8 |
  a' g4 f8 e4 f |
  g2 g4. f8 |
  b4 f8 g b4 f8 ^(d) |
  e2 (e4) r
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c'' {
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \partial 8 c16 d |
  c2 c8 a e f |
  g2 f4. d8 |
  e4 d c r8 e16 b |
  b2. \tuplet 3/2 { d8 d a } |
  a2 c8 c a c |
  e2 f8 f d4 |
  \tuplet 3/2 { b8 b d } g4 b8 b4 a16 a |
  d4. e8 c (e) d (c) |
  c2 r \bar "||"
}

nhacPhienKhucHai = \relative c' {
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \partial 4 e8 d |
  e2 e8 d d e |
  g2 g8 a e4 |
  d8 e e b b2 |
  r8 d e d d d f e |
  a4 a8 b a b b a |
  c2 c8 d a b |
  g2 r \bar "||"
}

nhacPhienKhucBa = \relative c' {
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \partial 2. d8 e b4 d8 (e) |
  e2 g4 g8 a |
  d,2 a'8 e g a |
  d,2 e8 g a e |
  c'2 r4 c8 a |
  d2 c8 b a b |
  c2 r \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  \override Lyrics.LyricText.font-series = #'bold
  Tôi sẽ bước đi trước nhan Chúa Trời
  trong cõi đất dành cho kẻ sống.
  Tôi sẽ bước đi trước nhan thánh Chúa
  trong cõi đất dành cho kẻ lòng ngay.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Tôi vững tin cả khi mình đã nói:
  ''Ôi nhục nhã ê chề''.
  Đã buột miệng trong cơn muộn phiền:
  mọi người đều gian dối.
  Trước Thánh Nhan thật là quý giá
  cái chết của những ai hiếu nghĩa với Ngài.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Vâng lạy Chúa, thân này là tôi tớ.
  Tôi tớ Ngài
  con của nữ tỳ Ngài.
  Con đã được Ngài bẻ tan xiềng xích.
  Con sẽ dâng hiến lễ tạ ơn mà xưng tụng Danh Ngài.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Lời khấn nguyện với Chúa, tôi xin giữ trọn,
  trước toàn thể dân Ngài, tại khuôn viên đền Chúa,
  giữa lòng ngươi Giê -- ru -- sa -- lem hỡi.
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
