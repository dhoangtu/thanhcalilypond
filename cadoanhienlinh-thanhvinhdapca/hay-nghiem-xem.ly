% Cài đặt chung
\version "2.20.0"
\include "english.ly"

\header {
  title = "Hãy Nghiệm Xem"
  composer = "TV. 33"
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
}

% Nhạc điệp khúc
nhacDiepKhucSop= \relative c'' {
  \override Lyrics.LyricSpace.minimum-distance = #4.0
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  r4 d8 a |
  b4 a8 b |
  d,4 e |
  a2 ( |
  a8) r d, fs |
  e r g b |
  a g e d |
  d2 ( |
  d4) r \bar "|."
}

nhacDiepKhucBass= \relative c'' {
  \override Lyrics.LyricSpace.minimum-distance = #4.0
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \override NoteHead.font-size = #-2
  r4 d8 cs |
  d4 cs8 d |
  g,4 a |
  cs2 ( |
  cs8) r g b 
  a r b d |
  cs b a g |
  fs2 ( |
  fs4) r
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c'' {
  \set Score.barAlways = ##t
  \set Score.defaultBarType = ""
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  a8 a fs d' b d e4 \breathe
  d8 cs b a4 e8 g fs fs4 \breathe
  a8 a gs a b cs e,4 \breathe
  a8 a g g4 a8 b cs e, a a4 (a) \bar "||"
}

nhacPhienKhucHai = \relative c'' {
  \set Score.barAlways = ##t
  \set Score.defaultBarType = ""
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  a8 fs d' d cs d e4 \breathe
  d8 b d e cs d a4 \breathe
  g8 a fs d4 d8 d fs b,4 \breathe
  d8 fs e4 gs8 e cs' b a4 (a) \bar "||"
}

nhacPhienKhucBa = \relative c'' {
  \set Score.barAlways = ##t
  \set Score.defaultBarType = ""
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  a8 fs a d4 d8 cs d d e a,4 \breathe
  g8 a g e fs d fs e4 \breathe
  a8 fs fs g a4 b8 cs d b a4 \breathe
  b8 a b g g4 \breathe
  a8 e' d d4 (d) \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  \override Lyrics.LyricText.font-series = #'bold
  Hãy nghiệm xem Chúa tốt lành biết mấy.
  Hạnh phúc thay, hạnh phúc thay kẻ nương tựa Người.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Tôi chúc tụng Chúa Trời luôn mãi,
  Câu hát mừng Người chẳng ngớt trên môi.
  Chúa đã làm cho tôi hãnh diện.
  Xin các bạn nghèo nghe tôi nói mà vui lên.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Hãy cùng tôi tán dương Thiên Chúa.
  Ta đồng thanh chúc tụng danh Người.
  Tôi đã kêu cầu và Người đáp lại.
  Giải thoát tôi khỏi sợ hãi âu lo.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Ai nhìn lên Chúa sẽ được vui tươi hớn hở,
  và không bao giờ bẽ mặt hổ ngươi.
  Kẻ nghèo này kêu lên, và Chúa đã nhận lời,
  cứu khỏi bước ngặt nghèo, khỏi bước gian nguy.
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
        \key d \major \stemNeutral \nhacPhienKhucMot
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
        \key d \major \stemNeutral \nhacPhienKhucHai
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
        \key d \major \stemNeutral \nhacPhienKhucBa
      }
    >>
    \new Lyrics \lyricsto verse \loiPhienKhucBa
  >>
}
