% Cài đặt chung
\version "2.20.0"
\include "english.ly"

\header {
  title = "Hạnh Phúc Thay"
  composer = "TV. 118"
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
nhacDiepKhucSop = \relative c'' {
  \override Lyrics.LyricSpace.minimum-distance = #1.7
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \partial 4 g8 d' |
  c4 a8 d |
  d c e4 |
  c a |
  a8 c c a |
  c4 a |
  g b16 b d8 |
  c2 ( |
  c4) r \bar "|."
}

nhacDiepKhucBass = \relative c' {
  \override Lyrics.LyricSpace.minimum-distance = #1.7
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \override NoteHead.font-size = #-2
  \partial 4 e8 g |
  f4 f8 a |
  a g c4 |
  g f |
  f8 a a f |
  g4 f |
  e g16 g f8 |
  e2 ( |
  e4) r
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c' {
  \override Lyrics.LyricSpace.minimum-distance = #2.0
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \partial 4 e8 a |
  g4 g8 g |
  e4. d8 |
  d2 |
  r4 f8 e |
  e d g e16 (d) |
  c2 |
  r4 f8 c' |
  a4 a8 a |
  g4 c8 d |
  e4. e8 |
  a, b g4 |
  a8 g d' (e) |
  c2 ( |
  c4) r \bar "||"
}

nhacPhienKhucHai = \relative c'' {
  \override Lyrics.LyricSpace.minimum-distance = #2.0
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \partial 4 g8 e |
  c'4 a8 c |
  e,4.  d8 |
  d2 | r4 e8 a |
  g2 |
  e8 d e d |
  c2 |
  a'8 g g4 |
  g8 e c' d |
  e2 |
  r4 d8 e |
  a,4 g |
  c2 ( |
  c4) r \bar "||"
}

nhacPhienKhucBa = \relative c'' {
  \override Lyrics.LyricSpace.minimum-distance = #2.0
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \partial 4 g8 e |
  g4. g8 |
  d4 e |
  e2 |
  r8 a g e |
  g2 |
  d8 e e d |
  c2 |
  g'8 g g4 |
  e8 g c d |
  e2 |
  r8 d e a, |
  b4. d8 |
  e4 c |
  c2 ( |
  c4) r \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  \override Lyrics.LyricText.font-series = #'bold
  Hạnh phúc thay, người noi theo luật pháp Chúa Trời.
  Người noi theo luật pháp Chúa Trời, thì thật phúc thay.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Hạnh phúc thay, ai sống đời hoàn thiện,
  biết noi theo luật pháp Chúa Trời.
  Hạnh phúc thay kẻ tuân hành theo ý Chúa.
  Hết lòng hết dạ đi tìm kiếm Người.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Vâng lệnh Chúa, Ngài đã ban lề luật.
  Truyền chúng con phải vâng giữ vẹn toàn.
  Ước mong sao con hằng luôn vững bước
  theo huấn lệnh Ngài ban.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Xin dạy con biết đường lối Chúa.
  Chỉ thị Ngài ban, con sẽ giữ đến cùng.
  Ban cho con được thông minh duệ trí.
  Con sẽ tận tâm tuân giữ luật Ngài.
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
