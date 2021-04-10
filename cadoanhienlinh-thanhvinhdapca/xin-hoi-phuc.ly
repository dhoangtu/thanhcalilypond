% Cài đặt chung
\version "2.20.0"
\include "english.ly"

\header {
  title = "Xin Hồi Phục"
  composer = "TV. 79"
  arranger = " "
  tagline = ##f
}

global = {
  \key d \major
  \time 2/4
}

smallNote = #(define-music-function
  (parser location note)
  (ly:music?)
  #{
    \tweak font-size #-3
    #note
  #}
)

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
  r4 d4 |
  a'2 |
  g8 e e fs |
  d4 d8 fs 
  e d b4 |
  b8 d a e' |
  d2 ( |
  d4) r \bar "|."
}

nhacDiepKhucBass= \relative c' {
  \override Lyrics.LyricSpace.minimum-distance = #4.0
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \override NoteHead.font-size = #-2
  r4 a'4 |
  d2 |
  b8 g g a |
  fs4 fs8 a |
  g fs e4 |
  e8 g e g |
  fs2 ( |
  fs4) r
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c' {
  \set Score.barAlways = ##t
  \set Score.defaultBarType = ""
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  e8 g a g b a a \breathe
  a g b a4 (a8) \breathe
  a g a a d, e fs4 (fs) \breathe
  a8 g e g b g a4 a16 fs d8 e4 \breathe
  e8 cs b cs a4 \breathe
  b8 a fs' e4 e8 g a d,4 (d) \bar "||"
}

nhacPhienKhucHai = \relative c' {
  \set Score.barAlways = ##t
  \set Score.defaultBarType = ""
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  e8 g a g a4 \breathe
  g8 a d,4 (d8) \breathe
  b d a4 a8 d fs d e4 (e8) \breathe
  a g g a a d, e fs4 \breathe
  a8 g a (a16) a8 b b16 b e,4 \breathe
  e8 e a4 \breathe
  cs,8 a e' fs d4 (d) \bar "||"
}

nhacPhienKhucBa = \relative c' {
  \set Score.barAlways = ##t
  \set Score.defaultBarType = ""
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  g'8 a g a a b e, g a4 \breathe
  g8 a g4 a8 a d, e e fs4 a8 g e g a cs b a4 (a8) \breathe
  cs b a (a16) cs8 cs a e'4 \breathe
  d16 fs e4 e8 d8 \fermata e \fermata d4 (d) \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  \override Lyrics.LyricText.font-series = #'bold
  Lạy Chúa, xin hồi phục dân Ngài,
  nguyện Thánh Nhan chiếu rọi, để cứu độ chúng con.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Hỡi mục tử nhà Is -- ra -- el, xin hãy lắng nghe
  Đấng ngự trên các thần hộ giá.
  Dám xin Ngài giải sáng hiển linh.
  Dũng lực quyền uy, xin khơi dậy đi nào.
  Đến cùng chúng con và thương cứu độ.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Lạy Chúa tể càn khôn, xin đoái lại.
  Từ cõi trời, Ngài ngó xuống mà xem.
  Xin trở về thăm nom vườn nho cũ.
  Bảo vệ cây tay hữu Chúa đã trồng.
  Cây non ấy, Ngài từng cho sức mạnh.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Xin Chúa đặt tay trên Đấng ngồi bên hữu,
  là con người Chúa đã từng cho mạnh sức.
  Chúng con nguyện chẳng xa Chúa nữa đâu.
  Cúi xin Ngài ban cho được sống,
  để chúng con xưng tụng danh Ngài.
}


% Dàn trang
\score {
  \new ChoirStaff <<
    \new Staff = chorus \with {
        \consists "Merge_rests_engraver"
      }
      <<
      \override Staff.TimeSignature.transparent = ##t
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
