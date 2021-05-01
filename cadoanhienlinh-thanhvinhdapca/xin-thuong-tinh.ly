% Cài đặt chung
\version "2.20.0"
\include "english.ly"

\header {
  title = "Xin Thương Tình"
  composer = "TV. 40"
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
  \partial 4 f8 d |
  c4 f8 _(g) |
  a2 |
  c8 c bf d |
  c2 \breathe |
  c8 f, g bf |
  a4 g |
  f2 ( |
  f4) r \bar "|."
}

nhacDiepKhucBass = \relative c' {
  \override Lyrics.LyricSpace.minimum-distance = #1.7
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \override NoteHead.font-size = #-2
  \partial 4 d8 bf |
  a4 c |
  f2 |
  a8 a g bf |
  a2 |
  f8 d e g |
  f4 c |
  f2 ( |
  f4) r
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c'' {
  \override Lyrics.LyricSpace.minimum-distance = #2.0
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  c8 bf4 g8 |
  bf f d c |
  a'2 ( |
  a8) d, f d |
  c4. d8 |
  c4 f8 bf |
  a4 \breathe bf8 g |
  g g4 bf8 |
  g4 bf |
  c2 |
  r4 d,8 f |
  f d f d |
  c2 |
  r8 g' g e |
  f d c e |
  f2 ( 
  f4) r \bar "||"
}

nhacPhienKhucHai = \relative c'' {
  \override Lyrics.LyricSpace.minimum-distance = #2.0
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \partial 4 g8 bf |
  c c16 bf g8 bf |
  c2 |
  r4 bf8 g |
  g \breathe d f d |
  c4 c8 c |
  c f g bf |
  g2 |
  c8 c bf d |
  c4 f,8 (g) 
  a2 |
  bf8 g bf c |
  a4 g |
  f2 ( |
  f4) r \bar "||"
}

nhacPhienKhucBa = \relative c' {
  \override Lyrics.LyricSpace.minimum-distance = #2.0
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \partial 8 f8 |
  bf2 |
  r8 bf8 bf d, |
  f4 ef8 c |
  bf4. bf8 |
  ef4. c8 |
  c c g' f |
  f4. g8 |
  a2 |
  r8 a g a |
  f8 \breathe bf d c |
  c4 bf8 c |
  g4. a8 |
  bf4 g8 g |
  f2 ( |
  f4) r \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  \override Lyrics.LyricText.font-series = #'bold
  Xin thương tình, lạy Chúa,
  Xin thương tình chữa con.
  Quả thật con đắc tội với Ngài.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Phúc thay kẻ biết thương người nghèo khổ.
  Gặp cảnh khốn cùng sẽ được Chúa cứu nguy.
  Chúa bảo vệ và giữ gìn mạng sống.
  Lại ban cho hạnh phúc trên đời.
  Không trao họ cho địch thù hung hãn.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Người chăm nom khi liệt giường liệt chiếu.
  Lúc bệnh hoạn Người chữa cho lành.
  Vì vậy mà con mới dám thưa:
  ''Xin thương tình chữa con, lạy Chúa.
  Quả thật con đắc tội với Ngài.''
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Giờ đây, Chúa giữ gìn con được vẹn toàn,
  nhận con vào hầu cận trước Tôn Nhan mãi mãi.
  Chúc tụng Chúa Trời,
  Chúa Is -- ra -- el.
  Từ muôn thuở cho đến muôn muôn đời.
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
