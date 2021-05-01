% Cài đặt chung
\version "2.20.0"
\include "english.ly"

\header {
  title = "Vẫn Trọn Tình Thương"
  composer = "TV. 106"
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
nhacDiepKhucSop = \relative c' {
  \override Lyrics.LyricSpace.minimum-distance = #4.0
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  a8 e' d f |
  e4. e8 |
  a4 a8 g |
  d4 e8 b |
  b4 f'8 f |
  d4 d |
  e4. a8 |
  g4 e |
  a2 ( |
  a4) r \bar "|."
}

nhacDiepKhucBass = \relative c' {
  \override Lyrics.LyricSpace.minimum-distance = #4.0
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  a8 c b d |
  c4. c8 |
  f4 f8 e |
  b4 e8 b |
  b4 d8 d |
  b4 b 
  c4. f8 |
  e4 d |
  e2 ( |
  e4) r
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c' {
  \set Score.barAlways = ##t
  \set Score.defaultBarType = ""
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  e8 e a,4 a8 f' d e4 e8 a gs4 \breathe
  a8 e a e c' b a4 (a8) \breathe
  d8 d g,4 g8 d' b c4 \breathe
  b8 b b4 \tempo "Rall" d8 g, b a4 (a) \bar "||"
}

nhacPhienKhucHai = \relative c' {
  \set Score.barAlways = ##t
  \set Score.defaultBarType = ""
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  d8 e a, a4 a8 e' e d g4 \breathe
  e8 a a4 a8 \acciaccatura e8 c'4 c8 a c d d4
  d8 b b g a f e d4 \breathe
  g8 e c4 a'8 g e a4 (a) \bar "||"
}

nhacPhienKhucBa = \relative c' {
  \set Score.barAlways = ##t
  \set Score.defaultBarType = ""
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  e8 a a4 e8 e g a c,4 \breathe
  b8 f' f e4 b8 b d b a4 (a8) \breathe
  a8 e' d e4 \breathe
  e8 g a4 e8 e c' c a b4 d8 b d c c4 f8 e d e4 \fermata
  \tempo "Rall" e8 c a a4 (a) \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  \override Lyrics.LyricText.font-series = #'bold
  Nào cảm tạ Chúa đi, vì Chúa rất nhân từ.
  Muôn ngàn đời Chúa vẫn trọn tình thương,
  vẫn trọn tình thương.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Có những người vượt biển ngược xuôi nghề thương mại.
  Giữa trùng dương lèo lái con thuyền.
  Mắt đã tường việc Chúa làm nên.
  Thật kỳ diệu giữa lòng biển khơi.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Gặp bước ngặt nghèo, họ kêu lên cùng Chúa,
  Người ra tay cứu khổ thoát ngàn nỗi gian truân,
  đổi phong ba thành gió thoảng nhẹ nhàng.
  Sóng đang gầm bỗng thành bình yên.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Họ vui sướng vì trời yên bể lặng.
  Và Chúa dẫn đưa về bờ bến mong chờ.
  Họ sẽ tạ ơn, tạ ơn Chúa vì lòng Chúa rất từ nhân,
  đã làm cho người trần biết bao kỳ công,
  biết bao tuyệt diệu.
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
