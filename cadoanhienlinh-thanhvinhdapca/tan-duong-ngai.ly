% Cài đặt chung
\version "2.20.0"
\include "english.ly"

\header {
  title = "Tán Dương Ngài"
  composer = "TV. 29"
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
nhacDiepKhucSop= \relative c' {
  \override Lyrics.LyricSpace.minimum-distance = #4.0
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \partial 4 d4 |
  a'2 |
  a4 a |
  c a8 _(g) |
  f2 |
  g4 g |
  a g8 _(f) |
  d2 |
  d4 f |
  c d |
  g8 _(f) d4 |
  a'2 ( |
  a4) r \bar "|."
}

nhacDiepKhucBass= \relative c' {
  \override Lyrics.LyricSpace.minimum-distance = #4.0
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \override NoteHead.font-size = #-2
  \partial 4 d4 |
  f2 |
  f4 f |
  a f8 ^(e) |
  d2 |
  e4 e |
  f e8 ^(d) |
  bf2 |
  bf4 d |
  a bf |
  c bf |
  a2 ( |
  a4) r
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c' {
  \set Score.barAlways = ##t
  \set Score.defaultBarType = ""
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  f8 c'4 \breathe
  bf8 bf c a f4 d8 f d4 f8 f g c,4 \breathe
  c'8 bf c f, bf bf a4 (a) \breathe
  f8 c' bf c f,4 d8 f g f f4 d8 f g c,4
  d8 f4 e8 f g a a f4 (f) \bar "||"
}

nhacPhienKhucHai = \relative c' {
  \set Score.barAlways = ##t
  \set Score.defaultBarType = ""
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  f8 c' bf4 f8 bf bf c4 \breathe
  a8 a a4 a8 g16 _(c) a (g) f4 \breathe
  d8 g f4 f8 d f f g c,4 \breathe
  e8 f g4 d8 e c4 a'8 g a c, f4 (f) \bar "||"
}

nhacPhienKhucBa = \relative c'' {
  \set Score.barAlways = ##t
  \set Score.defaultBarType = ""
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  c8 bf a a c a16 _(bf) c4 f,8 (g) a4 a8 g g c bf g f4
  a8 g g4 g8 g d e c4 \breathe
  e8 f g4 g8 c bf g4 g8 e d c4
  g'8
  \tempo "Rall." g c, f4 (f) \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  \override Lyrics.LyricText.font-series = #'bold
  Lạy Chúa, con xin tán dương Ngài,
  con xin tán dương Ngài,
  vì chính Ngài đã cứu mạng con.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Lạy Chúa, con xin tán dương Ngài
  vì chính Ngài đã thương cứu mạng
  không để quân thù chế giễu con.
  Lạy Chúa, từ âm phủ, Ngài đã kéo con lên.
  Tưởng đã xuống mồ,
  Ngày thương mà Ngài thương cứu sống con.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Người có giận, giận trong giây lát.
  Nhưng yêu thương, thương suốt cả đời.
  Lệ có rơi khi màn đêm buông xuống rồi,
  thì hừng đông, hừng đông về, đã vọng tiếng hò reo.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Xin nhận lời và dủ lòng thương.
  Lạy Chúa, xin Ngài trợ giúp con đêm ngày,
  khúc ai ca, Chúa đổi thành vũ điệu.
  Lạy Thiên Chúa, lạy Chúa con thờ,
  xin tạ ơn Ngài mãi mãi ngàn thu.
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
        \key f \major \stemNeutral \nhacPhienKhucMot
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
        \key f \major \stemNeutral \nhacPhienKhucHai
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
        \key f \major \stemNeutral \nhacPhienKhucBa
      }
    >>
    \new Lyrics \lyricsto verse \loiPhienKhucBa
  >>
}
