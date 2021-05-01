% Cài đặt chung
\version "2.20.0"
\include "english.ly"

\header {
  title = "Halleluia Mùa Giáng Sinh"
  composer = " "
  arranger = " "
  tagline = ##f
}

global = {
  \key a \major
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
nhacDiepKhucSop= \relative c' {
  \override Lyrics.LyricSpace.minimum-distance = #4.0
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \partial 4 e8. e16 |
  e4 \breathe e8. a16 |
  gs4 (fs) |
  e fs8. fs16 |
  fs4 \breathe fs8. b16 |
  b4 (gs) |
  a2 ( |
  a4) a8. (b16) |
  cs2 |
  cs8 d cs b |
  b2 |
  b8 cs b a |
  e2 ( |
  e4) gs8. a16 |
  b2 |
  b8 cs b a |
  e2 |
  b'8 b gs b |
  a2 ( |
  a4) e8. e16 |
  e4 \breathe e8. a16 |
  gs4 (fs) |
  e fs8. fs16 |
  fs4 \breathe fs8. b16 |
  b4 (gs) |
  a2 ( |
  a4) r \bar "|."
}

nhacDiepKhucBass= \relative c' {
  \override Lyrics.LyricSpace.minimum-distance = #4.0
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  cs8. cs16 |
  cs4 cs8. e16 |
  e2 |
  cs4 d8. d16 |
  d4 d8. d16 |
  d2 |
  cs2 ( |
  cs4) r |
  r e8. (fs16) |
  a8 b a gs |
  gs4 fs |
  gs8 a gs fs |
  e4 d |
  cs r |
  r e8. (fs16) |
  gs8 a gs fs |
  e4 (d) |
  e8 e d d |
  cs2 ( |
  cs4) cs8. cs16 |
  cs4 cs8. e16 |
  e2 |
  cs4 d8. d16 |
  d4 d8. d16 |
  d2 |
  cs2 ( |
  cs4) r
}

% Lời điệp khúc
loiDiepKhucSop = \lyricmode {
  \override Lyrics.LyricText.font-series = #'bold
  Hal -- le -- lu Ha -- le -- lu -- ia.
  Hal -- le -- lu Ha -- le -- lu -- ia.
  Này đây, ta báo cho anh em tin xiết bao vui mừng.
  Ngày hôm nay, Trinh Nữ đã sinh hạ Đấng Cứu Độ chúng ta.
  Hal -- le -- lu Ha -- le -- lu -- ia.
  Hal -- le -- lu Ha -- le -- lu -- ia.
}

loiDiepKhucBass = \lyricmode {
  \override Lyrics.LyricText.font-series = #'bold
  Hal -- le -- lu Ha -- le -- lu -- ia.
  Hal -- le -- lu Ha -- le -- lu -- ia.
  Này ta báo cho anh em một tin xiết bao vui mừng, vui mừng.
  Ngày Trinh Nữ đã sinh hạ Đấng Cứu Độ chúng ta.
  Hal -- le -- lu Ha -- le -- lu -- ia.
  Hal -- le -- lu Ha -- le -- lu -- ia.
}


% Dàn trang
\score {
  \new ChoirStaff <<
    \new Staff <<
      \new Voice = "Soprano" {
        \clef treble \global \nhacDiepKhucSop
      }
      \new Lyrics \lyricsto Soprano \loiDiepKhucSop
    >>
    \new Staff <<
      \new Voice = "Bass" {
        \clef treble \global \nhacDiepKhucBass
      }
      \new Lyrics \lyricsto Bass \loiDiepKhucBass
    >>
  >>
}
