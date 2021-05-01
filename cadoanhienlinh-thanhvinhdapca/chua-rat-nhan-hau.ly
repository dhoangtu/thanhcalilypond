% Cài đặt chung
\version "2.20.0"
\include "english.ly"

\header {
  title = "Chúa Rất Nhân Hậu"
  composer = "TV. 85"
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
nhacDiepKhucSop = \relative c' {
  \override Lyrics.LyricSpace.minimum-distance = #1.7
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \partial 4 d4 |
  a' g8 g |
  c4 c8 bf |
  a4 a8 a |
  d4 e8 d |
  cs2 |
  r4 a |
  d a8 a |
  bf4 g16 g bf8 |
  a4 d,8 d |
  f4 e8 c |
  d2 \bar "|."
}

nhacDiepKhucBass = \relative c' {
  \override Lyrics.LyricSpace.minimum-distance = #1.7
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \override NoteHead.font-size = #-2
  \partial 4 d4 |
  f e8 e |
  g4 g8 f |
  e4 e8 e |
  bf'4 c8 bf |
  a2 |
  r4 f |
  bf f8 f |
  g4 e16 e g8 |
  f4 bf,8 bf |
  d4 c8 a |
  d2
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c'' {
  \override Lyrics.LyricSpace.minimum-distance = #2.0
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  c4. a8 |
  d c a f |
  d2 ( |
  d8) f d f |
  c4 f8 g |
  bf4. a8 |
  g4 \breathe f |
  c' c8 d |
  c a bf a |
  g2 ( |
  g8) a f d |
  c4 e8 f |
  g4. f8 |
  f2 \bar "||"
}

nhacPhienKhucHai = \relative c'' {
  \override Lyrics.LyricSpace.minimum-distance = #2.0
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \partial 4 c,4 |
  c' c8 c |
  d c a f |
  d2 ( |
  d8) f d f |
  c4. a8 |
  c8 d4 f8 |
  \acciaccatura g8 a2 |
  r4 bf8 bf |
  a8. a16 c8 d |
  c4 g8 g |
  c,4 d16 g a8 |
  g4 g |
  f2 \bar "||"
}

nhacPhienKhucBa = \relative c'' {
  \override Lyrics.LyricSpace.minimum-distance = #2.0
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \partial 4 c,4 |
  c' a8 c |
  bf4 g |
  a2 ( |
  a4) g8 a |
  d,4. c8 |
  c f f e |
  g2 |
  r4 \tuplet 3/2 { a8 bf bf } |
  g4 \tuplet 3/2 { c8 d d } |
  c4 a8 bf |
  g4. a8 |
  g4 g |
  f2 \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  \override Lyrics.LyricText.font-series = #'bold
  Lạy Chúa, Ngài là Đấng rất nhân hậu,
  và là Đấng rất khoan dung.
  Lạy Chúa, Ngài là Đấng giàu lòng xót thương,
  và là Đấng rất từ bi.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Chúa là Đấng khoan dung nhân hậu.
  Mở lượng hải hà thương đến kẻ kêu xin.
  Lạy Chúa, xin lắng nghe lời con khẩn cầu.
  Tiếng con van nài, xin để ý lưu tâm.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Lạy Chúa muôn dân chính tay Ngài tạo dựng.
  Chúc tụng danh Ngài, vì Ngài thật cao cả.
  Chỉ có Ngài là Thiên Chúa ta.
  Chỉ có Ngài làm nên những việc lạ lùng.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Lạy Chúa, Ngài nhân hậu từ bi,
  không nóng giận lại càng yêu thương thành tín.
  Xin ghé mắt nhìn, hãy ghé mắt xem,
  và đoái thương, đoái thương con cùng.
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
