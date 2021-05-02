% Cài đặt chung
\version "2.20.0"
\include "english.ly"

\header {
  title = "Hãy Dâng Lên Chúa"
  composer = "TV. 9"
  arranger = " "
  tagline = ##f
}

global = {
  \key c \major
  \time 4/4
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
  \override Lyrics.LyricSpace.minimum-distance = #4.0
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \partial 4. a8 g g |
  c2 e,8 g a e |
  g2 r8 f e d |
  g2 d8 f e d |
  c1 \bar "|."
}

nhacDiepKhucBass = \relative c' {
  \override Lyrics.LyricSpace.minimum-distance = #4.0
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \override NoteHead.font-size = #-2
  \partial 4. f8 e e |
  g2 c,8 e f c |
  d2 r8 d c b |
  d2 b8 d c b
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c' {
  \set Score.barAlways = ##t
  \set Score.defaultBarType = ""
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  e8 d c g'4 \breathe
  f8 f a c4 \breathe
  d8 d b g g4
  f8 d e d c4 \breathe
  e8 g g g a g a b4 \breathe
  b8 g d' b a a4 g8 g4 \bar "||"
}

nhacPhienKhucHai = \relative c' {
  \set Score.barAlways = ##t
  \set Score.defaultBarType = ""
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  e8 d g4 a8 a g e4
  a8 g b4 a8 b d e, g4 \breathe
  f8 e d a' a b a g4 \breathe
  a8 g b b4 b8 g g g g \acciaccatura d'8 c4 \bar "||"
}

nhacPhienKhucBa = \relative c' {
  \set Score.barAlways = ##t
  \set Score.defaultBarType = ""
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  f8 d a'4 a8 d, d g e4 \breathe
  a8 g g a a g b d c4 \breathe
  c8 c c a g4 \breathe
  a8 d, g a e4
  a8 g b b b g b d e c4 \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  \override Lyrics.LyricText.font-series = #'bold
  Hãy dâng lên Chúa, mọi vinh hiển quyền năng.
  Hãy dâng lên Chúa, lời chúc vinh Danh Ngài.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Hát lên mừng Chúa một bài ca mới.
  Hãy hát lên mừng Ngài hỡi toàn thể địa cầ.
  Kể cho muôn dân biết Người vinh hiển,
  cho mọi nước nghe việc là Người làm.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Hãy dâng Chúa, hỡi các dân tộc.
  Hãy dâng Chúa, mọi vinh hiển quyền năng.
  Hãy dâng lời ca khen xứng danh Người,
  lễ vật mang lên, bước vào tiền đình nhà Chúa.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Bái thờ Chúa, Đấng rạng ngời thánh thiện.
  Khắp hoàn cầu, hãy run sợ trước Thánh Nhan.
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
        \key c \major \stemNeutral \nhacPhienKhucMot
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
