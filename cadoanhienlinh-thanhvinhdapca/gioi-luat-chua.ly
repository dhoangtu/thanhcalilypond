% Cài đặt chung
\version "2.20.0"
\include "english.ly"

\header {
  title = "Giới Luật Chúa"
  composer = "TV. 18"
  arranger = " "
  tagline = ##f
}

global = {
  \key f \major
  \time 3/8
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
nhacDiepKhuc = \relative c'' {
  \override Lyrics.LyricSpace.minimum-distance = #1.7
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  c4 a8 |
  \afterGrace c4 {(d8 c)} f, |
  f4 a8 |
  \acciaccatura f8 a4. |
  g4 d8 |
  g4 g8 |
  a16 (g) f8 d |
  c4. |
  d4 bf8 |
  f'4 bf,8 |
  bf4 d8 |
  \acciaccatura {c8 d} c4. |
  g'4 d8 |
  g4 c8 |
  bf g e |
  f4. ( |
  f4) r8 \bar "|."
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c' {
  \override Lyrics.LyricSpace.minimum-distance = #2.0
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \partial 4 f8 a |
  c4 \tuplet 3/2 { c8 e, d } |
  d4 e8 d |
  c4 \tuplet 3/2 { f8 g a } |
  g2 |
  r4 f16 bf d,8 |
  d4 \tuplet 3/2 { f8 f g } |
  a4 e8 f |
  g4 \tuplet 3/2 { a8 a f } |
  f2 \bar "||"
}

nhacPhienKhucHai = \relative c'' {
  \override Lyrics.LyricSpace.minimum-distance = #2.0
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \partial 4 c8 a |
  c4 \tuplet 3/2 { a8 a c } |
  c4 bf8 g |
  bf4 \tuplet 3/2 { c8 c bf } |
  a2 |
  r4 \tuplet 3/2 { bf8 bf d, } |
  d4 \tuplet 3/2 { e8 d e } |
  c4 e8 d |
  c4 \tuplet 3/2 { a'8 e f } |
  f2 \bar "||"
}

nhacPhienKhucBa = \relative c' {
  \override Lyrics.LyricSpace.minimum-distance = #2.0
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \partial 4 \tuplet 3/2 { f8 a c } |
  c2 |
  c8 bf g bf |
  c2 |
  bf8 c g a |
  f2 |
  f4 \tuplet 3/2 { d8 f g } |
  c,2 |
  d8 d d4 |
  f4 a |
  bf8 a bf4 |
  a8 bf c d |
  c2 |
  r4 g8 e |
  c2 |
  d8 f g a |
  f2 ( |
  f4) r \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  \override Lyrics.LyricText.font-series = #'bold
  Giới luật Chúa hoàn toàn ngay thẳng.
  Gieo hỉ hoan chan chứa cả cõi lòng.
  Giới luật Chúa hoàn toàn ngay thẳng,
  Gieo hỉ hoan chứa chan cõi lòng con.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Luật pháp Chúa, quả là hoàn thiện
  khiến tâm hồn vui sướng thảnh thơi.
  Lời răn của Người thật là chính đáng
  Làm cho kẻ chất phác nên khôn.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Huấn dụ Chúa mọi bề trong sáng.
  Vững bền luôn, mãi đến muôn đời.
  Phán quyết của Người luôn là chân thật.
  Hết thảy đều chính trực công minh.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Dầu tôi tớ Chúa, vẫn một lòng vâng giữ.
  Và hết dạ tuân phục.
  Nhưng nào ai biết được mọi điều mình sơ sót?
  Con nài xin, nài xin Chúa thứ tha
  lỗi con phạm mà không hay biết gì.
}


% Dàn trang
\score {
  \new ChoirStaff <<
    \new Staff = chorus <<
      \new Voice = "sopranos" {
        \global \stemNeutral \nhacDiepKhuc
      }
    >>
    \new Lyrics = basses
    \context Lyrics = basses 
      %\with \override LyricText.font-shape = #'bold
      \lyricsto sopranos \loiDiepKhuc
  >>
}

\score {
  \new ChoirStaff <<
    \new Staff = verses <<
      \override Staff.TimeSignature.transparent = ##t
      \new Voice = "verse" {
        \key f \major \time 2/4 \stemNeutral \nhacPhienKhucMot
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
        \key f \major \time 2/4 \stemNeutral \nhacPhienKhucHai
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
        \key f \major \time 2/4 \stemNeutral \nhacPhienKhucBa
      }
    >>
    \new Lyrics \lyricsto verse \loiPhienKhucBa
  >>
}
