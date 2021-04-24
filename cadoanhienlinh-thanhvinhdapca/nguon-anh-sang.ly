% Cài đặt chung
\version "2.20.0"
\include "english.ly"

\header {
  title = "Nguồn Ánh Sáng"
  composer = "TV. 26"
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
nhacDiepKhucSop= \relative c'' {
  \override Lyrics.LyricSpace.minimum-distance = #4.0
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  a8 d, d a' |
  a4 f8 bf |
  bf4 g8 c |
  c4 a8 c |
  bf8 g a4 |
  a8 g g g |
  a4a8 d, |
  d4 c |
  f2 ( |
  f4) r \bar "|."
}

nhacDiepKhucBass= \relative c' {
  \override Lyrics.LyricSpace.minimum-distance = #4.0
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \override NoteHead.font-size = #-2
  f8 bf, bf f' |
  f4 d8 g |
  g4 e8 a |
  a4 f8 a |
  g e f4 |
  f8 e e e |
  f4 f8 bf, |
  bf4 g |
  a2 ( |
  a4) r
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c'' {
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \partial 4 a8 d, |
  d a' a4 |
  f8 bf bf g |
  c2 |
  c8 bf g bf |
  c2 |
  r8 bf d bf |
  c4 bf8 f |
  f g a4 |
  a8 d, e e |
  d (g) f (d) |
  c2 \bar "||"
}

nhacPhienKhucHai = \relative c'' {
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \partial 4. bf8 c g |
  bf4. bf16 g |
  g8 g4 g8 |
  \acciaccatura g8 c2 |
  r4 c8 bf |
  g g d' b! |
  c2 |
  r4 f,8 g |
  a c f, a |
  d,2 |
  r8 e g e |
  c4. g'8 |
  a4 c, |
  f2 \bar "||"
}

nhacPhienKhucBa = \relative c'' {
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \partial 4 bf8 bf |
  c bf g bf |
  \acciaccatura g8 bf4 bf16 g d'8 |
  c4. c8 |
  a4 g |
  c,2 |
  d8 c a' g |
  g2 |
  r4 bf8 a |
  bf4. a8 |
  bf4 a |
  c2 |
  r4 bf8 bf |
  c d4 r8 |
  bf4 g |
  f2 ( |
  f4) r \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  \override Lyrics.LyricText.font-series = #'bold
  Chúa là nguồn ánh sáng, nguồn ánh sáng, nguồn ánh sáng.
  Là Đấng cứu độ tôi.
  Tôi còn sợ gì ai,
  tôi còn sợ gì ai.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Chúa là nguồn ánh sáng, là Đấng cứu độ tôi.
  Tôi sợ gì ai nữa.
  Người bảo vệ tôi như thành trì kiên cố.
  Ai làm tôi run rẩy hãi hùng.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Tôi tớ Ngài đây, xin đừng giận mà ruồng bỏ.
  Chính Ngài từng phù giúp chở che.
  Lạy Thiên Chúa Đấng hằng cứu độ,
  xin chớ xa lìa,
  xin chớ bỏ rơi.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Nhưng tôi cứ một niềm tin tưởng,
  sẽ được Chúa ban phúc lộc dồi dào ngay tại cõi dương gian.
  Can đảm lên! Cậy trông vào Chúa.
  Một lòng cương quyết đợi chờ Người.
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
