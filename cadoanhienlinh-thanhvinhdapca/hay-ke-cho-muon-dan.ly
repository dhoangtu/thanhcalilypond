% Cài đặt chung
\version "2.20.0"
\include "english.ly"

\header {
  title = "Hãy Kể Cho Muôn Dân"
  composer = "TV. 95"
  arranger = " "
  tagline = ##f
}

global = {
  \key g \major
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
  \partial 8 d8 |
  g,4 a8 b |
  c4. c8 |
  e,4 fs8 g |
  a4 d |
  d8 a a b |
  g2 ( |
  g4) r \bar "|."
}

nhacDiepKhucBass= \relative c'' {
  \override Lyrics.LyricSpace.minimum-distance = #4.0
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \override NoteHead.font-size = #-2
  \partial 8 d8 |
  b4 c8 d |
  e4. e8 |
  a,4 b8 c |
  d4 d |
  d8 c c d |
  b2 ( |
  b4) r
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c' {
  \set Score.barAlways = ##t
  \set Score.defaultBarType = ""
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \set Staff.keyAlterations = #`(((1 . 3) . ,NATURAL))
  e8 d c g'4 f8 f a c4 \breathe
  d8 d b g g4 f8 d e d c4 \breathe
  e8 g g g a g a b4 \breathe
  b8 g d' b a a4 g8 g4 \bar "||"
}

nhacPhienKhucHai = \relative c' {
  \set Score.barAlways = ##t
  \set Score.defaultBarType = ""
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \set Staff.keyAlterations = #`(((1 . 3) . ,NATURAL))
  e8 d g4 a8 a g e4 a8 g b4 a8 b d e, g4 \breathe
  f8 e d a' a b a g4
  a8 g b b4 b8 g g g g \acciaccatura d' c4 \bar "||"
}

nhacPhienKhucBa = \relative c' {
  \set Score.barAlways = ##t
  \set Score.defaultBarType = ""
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \set Staff.keyAlterations = #`(((1 . 3) . ,NATURAL))
  e8 d a'4 a8 d, d g e4 \breathe
  a8 g g a a g b d c4 \breathe
  c8 c c a g4 \breathe
  a8 f g a e4 a8 g b b b g b d e c4 (c) \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  \override Lyrics.LyricText.font-series = #'bold
  Hãy kể cho muôn dân,
  hãy kể cho muôn dân biết những việc lạ Chúa làm.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Hát lên mừng Chúa, một bài ca mới.
  Hãy hát lên mừng Người hỡi toàn thể địa cầu.
  Kể cho muôn dân biết, Người vinh hiển,
  cho mọi nước nghe việc lạ Người làm.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Hãy dâng Chúa, hỡi các dân tộc,
  hãy dâng Chúa mọi vinh hiển quyền năng.
  Hãy dâng lời ca khen xứng danh Người.
  Lễ vật mang lên, bước vào tiền đình Nhà Chúa.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Bàn thờ Chúa, Đấng rạng ngời Thánh thiện.
  Khắp hoàn cầu hãy run sợ trước Thánh nhan.
  Hãy nói giữa chư dân:
  Chúa là Vua hiển trị,
  cai trị muôn dân theo đường công minh chính trực.
}


% Dàn trang
\score {
  \new ChoirStaff <<
    \new Staff = chorus \with {
        \consists "Merge_rests_engraver"
      }
      <<
      \new Voice = "sopranos" {
        \voiceOne \global \stemDown \nhacDiepKhucSop
      }
      \new Voice = "basses" {
        \voiceTwo \global \stemUp \nhacDiepKhucBass
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
        %\key c \major
        \stemNeutral \nhacPhienKhucMot
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
        \key c \major \stemNeutral \nhacPhienKhucHai
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
        \key c \major \stemNeutral \nhacPhienKhucBa
      }
    >>
    \new Lyrics \lyricsto verse \loiPhienKhucBa
  >>
}
