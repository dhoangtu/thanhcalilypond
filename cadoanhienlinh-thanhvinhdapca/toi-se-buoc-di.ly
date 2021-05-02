% Cài đặt chung
\version "2.20.0"
\include "english.ly"

\header {
  title = "Tôi Sẽ Bước Đi"
  composer = "TV. 114"
  arranger = " "
  tagline = ##f
}

global = {
  \key d \major
  \time 2/2
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
  \partial 2 a4. fs8 |
  b a4 g8 e4 fs |
  d2 cs4. d8 |
  e4 b d fs |
  a2 b4. g8 |
  d' cs4 b8 a4 b |
  cs2 cs4. b8 |
  e4 b8 cs e4 b8 _(a) |
  d1 \bar "|."
}

nhacDiepKhucBass = \relative c' {
  \override Lyrics.LyricSpace.minimum-distance = #1.7
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \override NoteHead.font-size = #-2
  \partial 2 fs4. d8 |
  g8 fs4 e8 cs4 d |
  a2 a4. b8 |
  cs4 g b d |
  e2 g4. e8 |
  b' a4 g8 fs4 g |
  a2 a4. g8 |
  cs4 g8 a cs4 g8 ^(e) |
  fs1
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c' {
  \override Lyrics.LyricSpace.minimum-distance = #2.0
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \partial 4 \tuplet 3/2 { d8 f g } |
  a4 bf8 g |
  a2 |
  r4 \tuplet 3/2 { a8 d e } |
  cs4 \tuplet 3/2 { d8 bf a } |
  g2 |
  r4 \tuplet 3/2 { g8 g bf } |
  a4 \tuplet 3/2 { f8 g e } |
  d2 ( 
  d4) r \bar "||"
}

nhacPhienKhucHai = \relative c'' {
  \override Lyrics.LyricSpace.minimum-distance = #2.0
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  bf4 g8 d' |
  d bf g d' |
  a2 |
  r4 a8 a |
  g e e g |
  f2 
  r4 g8 g |
  d' d c d |
  bf4 a8 a |
  e4 \tuplet 3/2 { g8 c, g' } |
  d2 ( |
  d4) r \bar "||"
}

nhacPhienKhucBa = \relative c'' {
  \override Lyrics.LyricSpace.minimum-distance = #2.0
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \partial 4 bf8 bf |
  bf g bf g |
  d'2 |
  r4 bf8 bf |
  g bf g a |
  f2 |
  r4 f8 d |
  g bf bf g |
  a2 |
  r4 a8 g16 (a) |
  bf8 a a f |
  f2 |
  r4 f8 e |
  f d f g |
  a2 ( |
  a4) r \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  \override Lyrics.LyricText.font-series = #'bold
  Tôi sẽ bước đi trước nhan Chúa Trời,
  trong cõi đất dành cho kẻ sống.
  Tôi sẽ bước đi trước nhan Thánh Chúa,
  trong miền đất dành cho kẻ lòng ngay.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Lòng tôi yêu mến Chúa Trời tôi.
  Vì Chúa đã nghe tiếng tôi khẩn nài.
  Người lại lắng tai, ngày tôi kêu cầu.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Chúa là Đấng rất nhân từ, chính trực.
  Chúa chúng ta một dạ xót thương.
  Hằng gìn giữ những ai bé mọn.
  Tôi yếu hèn, Chúa đã cứu tôi.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Chúa cứu gỡ mạng tôi khỏi chết.
  Giữ mắt này chẳng con đẫm lệ.
  Ngăn ngừa tôi khỏi phải bụi chân.
  Tôi sẽ bước đi trước mặt Người,
  trong cõi đất dành cho kẻ sống.
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
      \override Staff.TimeSignature.transparent = ##t
      \new Voice = "verse" {
        \key f \major \time 2/4 \stemNeutral \nhacPhienKhucBa
      }
    >>
    \new Lyrics \lyricsto verse \loiPhienKhucBa
  >>
}
