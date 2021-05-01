% Cài đặt chung
\version "2.20.0"
\include "english.ly"

\header {
  title = "Chúa Là Nơi Con Ẩn Náu"
  composer = "TV. 31"
  arranger = " "
  tagline = ##f
}

global = {
  \key d \major
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
nhacDiepKhucSop = \relative c'' {
  \override Lyrics.LyricSpace.minimum-distance = #1.7
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \partial 4 a8 d, |
  fs fs e _(fs) |
  a4 a8 b |
  a b a4 |
  cs8 e d e |
  d2 |
  g,8 g b d |
  d4 d,8 d |
  fs a a4 |
  e8 _(g) fs e |
  d2 ( |
  d4) r \bar "|."
}

nhacDiepKhucBass = \relative c' {
  \override Lyrics.LyricSpace.minimum-distance = #1.7
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \override NoteHead.font-size = #-2
  \partial 4 fs8 a, |
  d d cs ^(d) |
  fs4 fs8 g |
  fs g fs4 |
  a8 a b cs |
  a2 |
  d,8 d g b |
  b4 b,8 b |
  d fs fs4 |
  a, d8 cs |
  a2 ( |
  a4) r
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c' {
  \override Lyrics.LyricSpace.minimum-distance = #2.0
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \partial 4 d8 fs |
  e4 d8. a'16 |
  g8 e e g |
  a4 cs8 a |
  a a e g |
  fs2 ( |
  fs8) r d fs |
  e4 d8. a'16 |
  g8 e e g |
  a4 \breathe d,8 d |
  d e fs e |
  d2 ( |
  d4) \bar "||"
}

nhacPhienKhucHai = \relative c' {
  \override Lyrics.LyricSpace.minimum-distance = #2.0
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \partial 4 e8 d |
  fs4 a8. a16 |
  g8 a \afterGrace e4 (a8) |
  r8 a cs e |
  a, e g g |
  fs2 ( |
  fs8) r e d |
  \acciaccatura e8 fs4 a8. a16 |
  g8 e a4 |
  r8 d, d fs |
  e4 e8 fs |
  d2 ( |
  d4) \bar "||"
}

nhacPhienKhucBa = \relative c'' {
  \override Lyrics.LyricSpace.minimum-distance = #2.0
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \partial 4 a8 fs |
  d'4 d8 d |
  cs4 d |
  e b8 b |
  a2 |
  r4 g8 e |
  a4 fs8 g |
  e g \acciaccatura e8 g4 \fermata |
  \tempo "Rall" e8 g \acciaccatura e8 a fs |
  d2 ( |
  d4) r \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  \override Lyrics.LyricText.font-series = #'bold
  Chúa là nơi con ẩn náu, con cất lên tiếng ca,
  con cất lên tiếng ca.
  Vì Ngài thương cứu giúp,
  vì Ngài thương cứu giúp chở che đêm ngày.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Hạnh phúc thay! Kẻ lỗi lầm mà được tha thứ.
  Bao tội tình đã được bỏ qua.
  Hạnh phúc thay! Người Chúa không hạch tội tra xét.
  Và lòng dạ chẳng chút gian tà.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Bao tội lỗi con đã đầu thú cả.
  Tỏ hết với ngài chẳng dấu diếm chi.
  Con tự nhủ: Ta thú tội cùng Chúa,
  Ngài liền thứ tha mọi lỗi lầm.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Nhảy mừng lên! Hỡi những ai công chính,
  hãy vui mừng.
  Nhảy mừng lên, mọi tâm hồn ngay thẳng.
  Nào vui sướng reo hò.
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
