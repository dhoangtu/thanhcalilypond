% Cài đặt chung
\version "2.20.0"
\include "english.ly"

\header {
  title = "Chúa Mở Tay Ban"
  composer = "TV. 144"
  arranger = " "
  tagline = ##f
}

global = {
  \key f \major
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
  print-page-number = #f
}

% Nhạc điệp khúc
nhacDiepKhucSop = \relative c'' {
  \override Lyrics.LyricSpace.minimum-distance = #1.7
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \partial 4 c8 _(d) |
  c2 f,8 _(a) |
  c2 bf4 |
  bf2. |
  f4 g a |
  d,2 c4 |
  g2 bf4 |
  c2. ( |
  c4) r a'8 _(c) |
  a2 f8 _(g) |
  a2 f4 |
  d2. |
  c4 e g |
  bf2 a8 _(g) |
  c,2 g'8 _(a) |
  f2. ( |
  f4) r2 \bar "|."
}

nhacDiepKhucBass = \relative c'' {
  \override Lyrics.LyricSpace.minimum-distance = #1.7
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \override NoteHead.font-size = #-2
  \partial 4 a8 ^(bf) |
  a2 d,8 ^(f) |
  a2 f4 |
  f2. |
  d4 e f |
  bf,2 a4 |
  g2 g4 |
  a2. ( |
  a4) r f'8 ^(a) |
  f2 d4 |
  f2 d4 |
  bf2. |
  a4 c e |
  g2 e4 |
  a,2 c4 |
  a2. ( |
  a4) r2
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c'' {
  \override Lyrics.LyricSpace.minimum-distance = #2.0
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  c2 a4 |
  d,2 bf'4 |
  a2 g4 |
  c2. |
  d2 bf4 |
  f2 g4 |
  c4 c4. g8 |
  a2. |
  bf2 d,4 |
  e2 g4 |
  c,4. g'8 a f |
  g2. |
  c,2 f4 |
  a2 g8 e |
  c4 g' e |
  f2. ( |
  f2) r4 \bar "||"
}

nhacPhienKhucHai = \relative c' {
  \override Lyrics.LyricSpace.minimum-distance = #2.0
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \partial 4 c4 |
  c'2 a4 |
  d,2 bf'8 bf |
  a2 g4 |
  c2 \breathe bf8 c |
  g2 e'4 |
  e2 d4 |
  c2. ( |
  c4) r bf |
  d,2 d4 |
  bf'2 a4 |
  a2. |
  d,4 e e |
  d2 e4 |
  c2 g'8 (a) |
  f2. ( |
  f4) r2 \bar "||"
}

nhacPhienKhucBa = \relative c'' {
  \override Lyrics.LyricSpace.minimum-distance = #2.0
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  c2 a4 |
  a a e8 (d) |
  d2 f8 (g) |
  a2. |
  d,2 f8 (g) |
  g2 g8 (a) |
  g (f) f4. c8 |
  c2. |
  bf'2 g4 |
  bf2 a4 |
  g g4. f8 |
  a2. |
  f4 g a |
  e2 g8 (a) |
  d,2 c4 |
  f2. ( |
  f4) r2 \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  \override Lyrics.LyricText.font-series = #'bold
  Chúa thương rộng mở tay ban,
  đoàn con hết thảy muôn vàn thỏa thuê.
  Chúa thương rộng mở tay Ngài,
  đoàn con hết thảy muôn vàn thỏa thuê.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Chúa một niềm xót thương từ ái,
  đã khoan hồng lại lắm nghĩa giàu ân.
  Chúa từ bi quảng đại với hết mọi người,
  và âu yếm mọi vật Ngài đã dựng nên.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Lạy Chúa, muôn loài ngước mắt trông lên Chúa,
  và chính Ngài đúng bữa cho ăn.
  Khi Ngài rộng mở tay ban,
  là bao sinh vật muôn vàn thỏa thuê.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Chúa yêu thương trong mọi đường lối Chúa.
  Đầy yêu thương trong mọi việc Người làm.
  Chúa gìn giữ những ai kêu cầu Chúa.
  Cầu xin với cả tấm lòng thành tín.
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