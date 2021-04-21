% Cài đặt chung
\version "2.20.0"
\include "english.ly"

\header {
  title = "Chúa Ban Phúc Lành"
  composer = "TV. 28"
  arranger = " "
  tagline = ##f
}

global = {
  \key a \major
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
}

% Nhạc điệp khúc
nhacDiepKhuc= \relative c' {
  \override Lyrics.LyricSpace.minimum-distance = #4.0
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  cs2 e4 |
  a2 a4 |
  gs4 b8 (cs) b (a) |
  e2. |
  b4 cs b |
  e2 gs,4 |
  a2. \bar "|."
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c' {
  \set Score.barAlways = ##t
  \set Score.defaultBarType = ""
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  cs8 e fs a4 \breathe
  b8 a fs a b4 \breathe
  fs8 a b cs4 \breathe
  d8 cs b b a4 \breathe
  fs8 a a a fs e cs'4 \breathe
  d8 cs d b \fermata
  e e gs, a4 (a) \bar "||"
}

nhacPhienKhucHai = \relative c'' {
  \set Score.barAlways = ##t
  \set Score.defaultBarType = ""
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  a8 a fs a4 \breathe
  fs8 a fs a b4 \breathe
  a8 gs fs fs4 cs8 gs' fs e4 \breathe
  a8 a fs a b4 \breathe
  d8 d b cs cs4 (cs) \bar "||"
}

nhacPhienKhucBa = \relative c'' {
  \set Score.barAlways = ##t
  \set Score.defaultBarType = ""
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  a8 a fs fs4 \breathe
  e8 cs'^^ cs^^ a^^ a4^^
  fs8 a b gs4 a8 a cs, d e4 \breathe
  fs8 b, e gs4 a8 fs e gs4 (gs8) \breathe
  a b fs a4 cs8 b b a4 (a) \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  \override Lyrics.LyricText.font-series = #'bold
  Thần dân Chúa, Chúa tuôn đổ phúc lành
  và cho hưởng phúc bình an.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Nào tung hô Chúa, hỡi chư Thần chư Thánh
  Nào tung hô Chúa, Đấng vinh diệu uy quyền.
  Nào tung hô danh Ngài rạng rỡ,
  phủ phục bái thờ Đức Thánh Hiển Linh.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Tiếng Chúa rền vang làm biển gào sóng vỗ.
  Chúa hiển trị trên làn nước bao la.
  Tiếng Chúa hùng mạnh quá.
  Tiếng Chúa thật oai phong.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Tiếng Chúa uy linh nổi sấm sét ầm ầm.
  Còn trong Thánh điện hết thảy cùng tung hô
  Chúa ngự trị giữa những cơn hồng thủy.
  Chúa sẽ làm Vua thống trị muôn đời.
}


% Dàn trang
\score {
  \new ChoirStaff <<
    \new Staff = chorus \with {
        \consists "Merge_rests_engraver"
      }
      <<
      \new Voice = "sopranos" {
        \global \stemUp \nhacDiepKhuc
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
        \key a \major \stemNeutral \nhacPhienKhucMot
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
        \key a \major \stemNeutral \nhacPhienKhucHai
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
        \key a \major \stemNeutral \nhacPhienKhucBa
      }
    >>
    \new Lyrics \lyricsto verse \loiPhienKhucBa
  >>
}
