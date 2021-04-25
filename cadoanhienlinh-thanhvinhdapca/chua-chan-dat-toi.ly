% Cài đặt chung
\version "2.20.0"
\include "english.ly"

\header {
  title = "Chúa Chăn Dắt Tôi"
  composer = "TV. 22"
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
  print-page-number = #f
}

% Nhạc điệp khúc
nhacDiepKhucBass = \relative c'' {
  \override Lyrics.LyricSpace.minimum-distance = #4.0
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  r2 |
  d4 a8 b |
  a4 a8 a 
  b4 fs |
  g8 g a d, |
  e4 fs8 a |
  g4 fs8 e |
  fs2 ( |
  fs4) r \bar "|."
}

nhacDiepKhucSop = \relative c'' {
  \override Lyrics.LyricSpace.minimum-distance = #4.0
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  d4 a8 b |
  a4. a8 |
  fs (g) fs e |
  d4. d8 |
  b (d) e b |
  a4 d8 fs |
  e (d) b a |
  d2 ( |
  d4) r \bar "|."
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c' {
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  fs8 d fs a |
  a4 b8 a |
  g4 b |
  d2 |
  d8 b e d |
  d4 b8 cs |
  d4 fs,8 (g) |
  a2 |
  g8 d a' fs |
  fs4 e8 e |
  a4 cs, (\grace d8) |
  d2 ( |
  d4) r \bar "||"
}

nhacPhienKhucHai = \relative c'' {
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \partial 4 a4 |
  d2 |
  b8 d e d |
  d2 ( |
  d4) r8 e |
  d d4 d8 |
  d4 e fs r |
  b,8 cs d b |
  a2 |
  g8 e e a |
  a e4 a8 |
  cs,4 d8 (e) |
  d2 ( |
  d4) r \bar "||"
}

nhacPhienKhucBa = \relative c'' {
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  a8 fs b a |
  a4. cs8 |
  cs4 e,8 g |
  g4 b |
  fs4. a8 |
  e2 |
  r4 cs8 (d) |
  e2 |
  a8 a cs, d |
  e4 cs'8 a |
  cs8 cs4 a8 |
  a4 e' |
  d2 ( |
  d4) r \bar "||"
}

nhacPhienKhucBon = \relative c'' {
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \partial 4 g8 b |
  d2 |
  b4 d8 e |
  d2 |
  r4 d8 d |
  e4. d8 |
  e8 \acciaccatura e fs4 d8 |
  a2 |
  g4 b |
  d e |
  a,4. _(b8) |
  a2 ( |
  a4) cs8 a |
  cs4 cs8 a |
  fs4 cs' |
  d2 ( |
  d4) r \bar "||"
}

% Lời điệp khúc
loiDiepKhucSop = \lyricmode {
  \override Lyrics.LyricText.font-series = #'bold
  Chúa chăn dắt tôi,
  tôi chẳng thiếu thốn gì
  trong đồng cỏ xanh rì
  Người để tôi được nghỉ ngơi.
}

loiDiepKhucBass = \lyricmode {
  \override Lyrics.LyricText.font-series = #'bold
  Chúa chăn dắt tôi
  chắng thiếu chi
  Đồng xanh trên đồng cỏ xanh,
  Người để tôi được nghỉ ngơi.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Bên dòng nước trong mát dẫn tôi về bổ sức.
  Chúa dìu dắt tôi đi trên nẻo chính đường ngay.
  Chúa dìu dắt tôi đi trên nẻo chính đường ngay.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Lạy Chúa, dầu qua lũng âm u,
  con sợ gì sợ gì nguy khó,
  vì có Chúa ở cùng,
  côn trượng Ngài sẵn đó con vững dạ an tâm.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Chúa dọn sẵn cho con mâm cỗ bày ra ngay trước mặt quân thù.
  Đầu con Chúa xức đượm dầu thơm,
  ly rượu con đã đầy tràn chứa chan.
}

loiPhienKhucBon = \lyricmode {
  \set stanza = #"4."
  Tình thương Chúa và muôn phúc lộc,
  hằng dõi theo dõi theo suốt cuộc đời
  và tôi sống ở nhà Người những ngày tháng,
  những năm dài triền miên.
}


% Dàn trang
\score {
  \new ChoirStaff <<
     \new Staff <<
      \new Voice = "Bass" {
        \clef treble \global \nhacDiepKhucBass
      }
      \new Lyrics \lyricsto Bass \loiDiepKhucBass
    >>
    \new Staff <<
      \new Voice = "Soprano" {
        \clef treble \global \nhacDiepKhucSop
      }
      \new Lyrics \lyricsto Soprano \loiDiepKhucSop
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
