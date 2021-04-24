% Cài đặt chung
\version "2.20.0"
\include "english.ly"

\header {
  title = "Hãy Nghe Lời Chúa"
  composer = "TV. 94"
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
}

% Nhạc điệp khúc
nhacDiepKhucSop= \relative c'' {
  \override Lyrics.LyricSpace.minimum-distance = #4.0
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \partial 8 a8 |
  fs fs fs e |
  cs4. e8 |
  cs b4 e8 |
  a,4. b8 |
  b e4 fs16 (e) |
  cs4 e8 fs |
  a b4 (cs8) |
  a2 \bar "|."
}

nhacDiepKhucBass= \relative c'' {
  \override Lyrics.LyricSpace.minimum-distance = #4.0
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \override NoteHead.font-size = #-2
  \partial 8 cs8 |
  a a a gs |
  e4. a8 |
  e d4 a'8 |
  e4. d8 |
  d a'4 a8 |
  e4 gs8 a |
  cs8 d4 (e8) |
  cs2
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c' {
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \partial 4 e8 a |
  a b cs b16 a |
  b4 \breathe b8 b16 (a) |
  fs2 |
  r8 a b16 (a) cs,8 |
  e2 |
  b8 cs16 (e) fs8 e |
  fs4 \tuplet 3/2 { e8 fs (a) } |
  cs,4 e8 b' |
  b4 cs8 b |
  e4 cs8 (b) |
  a2 \bar "||"
}

nhacPhienKhucHai = \relative c'' {
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \partial 4 a8 b16 (a) |
  fs4. a8 |
  cs,8 (e) e fs |
  e2 |
  r4 b8 b |
  e4. fs16 (e) |
  cs8 (e) e fs |
  \acciaccatura b,8 cs2 |
  r4 a'8 b16 (a) |
  fs8 e b' cs |
  b4 \breathe a8 cs |
  b a16 b a8 b |
  fs r fs b |
  gs e16 e b'8 b |
  fs e4 b'8 |
  a2 \bar "||"
}

nhacPhienKhucBa = \relative c'' {
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  a4 cs8 cs |
  cs4 d8 cs |
  b4 e |
  e \breathe e8 \acciaccatura fs e |
  cs cs b16 (e) cs8 |
  cs r d d |
  b b fs gs |
  gs gs fs gs |
  e2 |
  r4 \tuplet 3/2 { cs'8 b cs } |
  b r \tuplet 3/2 { e cs a } |
  b4 e,8 e |
  cs'4 b |
  a2 \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  \override Lyrics.LyricText.font-series = #'bold
  Ước chi hôm nay các bạn, các bạn nghe tiếng Người
  thì đừng có cứng lòng,
  thì đừng có cứng lòng.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Nào anh em ta hãy reo mừng lên,
  tung hô Người Đấng Cứu Độ ta.
  Vào trước Thánh Nhan, dâng lời cảm tạ.
  Cùng tung hô theo điệu hát cung đàn.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Hãy tiến vào phủ phục trước Thánh Nhan.
  Quỳ lạy Chúa tác thành ta hết thảy
  bới chính Người là Chúa chúng ta,
  còn chúng ta là dân Người lãnh đạo,
  còn chúng ta là đoàn chiên tay Người hằng dẫn đưa.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Vậy hôm nay đây hãy nghe lời Chúa phán:
  Chớ cứng lòng như tổ tiên xưa,
  chớ cứng lòng như tổ tiên xưa trong vùng sa mạc
  đã thử "thách(khiêu khích)" ta, dẫu công trình ta
  từng nghiệm thấy bao lần.
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
