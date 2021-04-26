% Cài đặt chung
\version "2.20.0"
\include "english.ly"

\header {
  title = "Xin Chỉ Dạy Con"
  composer = "TV. 15"
  arranger = " "
  tagline = ##f
}

global = {
  \key d \major
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
nhacDiepKhucSop= \relative c'' {
  \override Lyrics.LyricSpace.minimum-distance = #4.0
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \partial 4 a4 |
  d2 e8 d b a |
  g g4 e8 e4 a |
  a4. a8 g fs e16 _(d) b8 |
  b4. a8 a4 e'8 cs |
  d1 \bar "|."
}

nhacDiepKhucBass= \relative c' {
  \override Lyrics.LyricSpace.minimum-distance = #4.0
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \override NoteHead.font-size = #-2
  \partial 4 fs4 |
  a2 d,8 fs g fs |
  e e4 cs8 cs4 fs4 |
  a4. fs8 e d cs16 ^(b) g8 |
  g4. a8 a4 cs8 a |
  \skip 4
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c' {
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \partial 4 e8 fs |
  d2 r8 a'8 d fs, |
  a2. d,8 e |
  a,2 r8 e'8 e d16 (e) |
  fs2. r8 g |
  g e b'4 a8 a e' d |
  a2 g8 b e, fs |
  e4 e8 e a a cs, d |
  d1 \bar "||"
}

nhacPhienKhucHai = \relative c'' {
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \partial 4. a8 a fs |
  d'4. b8 d4 e |
  a,2 r4 g8 fs |
  e4. e8 e b'4 gs8 |
  a2 r8 a a fs |
  d'4. d8 b4 d |
  a2 r8 a8 gs a |
  b4. e,8 b' cs4 b8 |
  a1 \bar "||"
}

nhacPhienKhucBa = \relative c'' {
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \partial 4 a4 |
  d a8 fs g4. a8 |
  \acciaccatura d,8 fs2 r4 e8 e |
  a4. b8 b (cs) \tuplet 3/2 { b8 (a b) } |
  a2 r4 a8 b |
  a4. g8 fs4 fs |
  e2 r8 e gs b |
  e,4. d8 cs b'4 gs8 |
  a1 \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  \override Lyrics.LyricText.font-series = #'bold
  Lạy Chúa, Chúa sẽ dạy con đường về,
  đường về cõi sống.
  Chúa sẽ dạy con đường về,
  đường về cõi trường sinh.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Lạy Chúa Trời, xin giữ gìn con
  vi bên Ngài con đang ẩn náy.
  Con thưa cùng Chúa: Ngài là Chúa con thờ.
  Ngài chính là gia nghiệp và phần phúc đã giành cho con.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Con chúc tụng Chúa hằng thương chỉ dạy.
  Cả đêm trường lòng dạ nhắn nhủ con.
  Con luôn tưởng nhớ có Ngài trước mặt,
  được Ngài ở bên chẳng nao núng bao giờ.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Vì thế tâm hồn con hớn hở và lòng con hoan hỉ nhảy mừng.
  Thân xác con nghỉ ngơi an toàn vì Chúa chẳng đành,
  chẳng đành bỏ mặc con.
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
