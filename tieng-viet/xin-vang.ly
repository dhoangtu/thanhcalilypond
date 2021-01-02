%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Nội dung tài liệu
% 1. Cài đặt chung
% 2. Nhạc phiên khúc
% 3. Nhạc điệp khúc Soprano
% 4. Nhạc điệp khúc Basso
% 5. Lời phiên khúc
% 6. Lời điệp khúc
% 7. Bố trí
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 1. Cài đặt chung
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\version "2.18.2"
\include "english.ly"

\header {
  title = "Xin Vâng"
  composer = "LM Mi Trầm, PK3: LM Nguyễn Duy"
  tagline = ##f
}

global = {
  \key g \major
  \time 2/4
}

\paper {
  #(set-paper-size "a4")
  top-margin = 15\mm
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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 2. Nhạc phiên khúc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
nhacPhienKhuc = \relative c' {
  \partial 4 d4
  g4. b,8
  d8 g8 a8 g8
  e4. b8
  d8 g8 e8 d8
  b4 \tuplet 3/2 4 {b8 g8 b8}
  d8 d8 e8 d8
  d2(
  d4) d4
  a'4. g8
  a8 a8 g8 a8
  b4. g8
  c8 c8 b8 c8
  d4 \tuplet 3/2 4 {d8 d,8 d8}
  a'8 a8 b8 a8
  g2 (g4) \bar "||"
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 3. Nhạc điệp khúc Soprano
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
nhacDiepKhucSoprano = \relative c' {
  \set Score.currentBarNumber = #16
  \partial 4 d'4
  d4. b16 c16
  d8 d8 e8 d8
  c4 r8 c8
  c8 c8 c8 a16 a16
  b4 \breathe d4
  d4. b16 c16
  d8 d8 e8 d8
  c4 r8 c8
  c8 c8 c8 a16 b16
                  g4 \bar "|."
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 4. Nhạc điệp khúc Basso
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
nhacDiepKhucBasso = \relative c' {
	\override NoteHead.font-size = #-2
  \partial 4 b'4
  b4. g16 a16
  b8 b8 c8 b8
  a4 r8 a8
  a8 a8 a8 fs16 fs16
  g4 b4
  b4. g16 a16
  b8 b8 c8 b8
  a4 r8 a8
  a8 a8 a8 d,16 d16
                  b4 \bar "|."
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 5. Lời phiên khúc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Mẹ ơi, đời con dõi bước theo Mẹ, lòng con quyết noi gương Mẹ, xin Mẹ dạy con hai tiếng Xin Vâng.
  Mẹ ơi, đường đi trăm ngàn gian khó, hiểm nguy giăng tràn đây đó, xin Mẹ dạy con hai tiếng Xin Vâng.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Ngày xưa, Mẹ hằng tin tưởng Chúa Trời, Mẹ luôn sống vui giữa đời, chấp nhận hy sinh yêu Chúa không ngơi.
  Ngày nay, niềm tin của Mẹ rực sáng, dội vang theo cùng năm tháng, với Mẹ đoàn con thưa tiếng Xin Vâng.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Mẹ ơi, Mẹ tin nơi Chúa an bài, Mẹ xin phúc ân cho đời, nơi Mẹ đoàn con xin đến nương thân.
  Mẹ ơi, niềm vui bên Mẹ chan chứa, được luôn trung thành theo Chúa, xin Mẹ dạy con hai tiếng Xin Vâng.
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 6. Lời điệp khúc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
loiDiepKhuc = \lyricmode {
  \set stanza = #"ĐK:"
  Xin Vâng, Mẹ dạy con hai tiếng Xin Vâng, hôm qua hôm nay và ngày mai.
  Xin Vâng, Mẹ dạy con hai tiếng Xin Vâng, hôm nay tương lai và suốt đời.
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 7. Bố trí
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\score {
  \new ChoirStaff <<
    \new Staff = verses <<
      \new Voice = "verse" {
        \global \stemNeutral \nhacPhienKhuc
      }
    >>
    \new Lyrics \lyricsto verse \loiPhienKhucMot
    \new Lyrics \lyricsto verse \loiPhienKhucHai
    \new Lyrics \lyricsto verse \loiPhienKhucBa
  >>
  \layout {
    \context {
      \Lyrics
      \override VerticalAxisGroup.staff-affinity = ##f
      \override VerticalAxisGroup.staff-staff-spacing =
        #'((basic-distance . 0)
     (minimum-distance . 1)
     (padding . 1))
    }
    \context {
      \Staff
      \override VerticalAxisGroup.staff-staff-spacing =
        #'((basic-distance . 0)
     (minimum-distance . 1)
     (padding . 1))
    }
  }
}

\score {
  \new ChoirStaff <<
    \new Staff = chorus <<
      \new Voice = "sopranos" {
        \voiceOne \global \stemUp \nhacDiepKhucSoprano
      }
      \new Voice = "basses" {
        \voiceTwo \global \stemDown \nhacDiepKhucBasso
      }
    >>
    \new Lyrics = basses
    \context Lyrics = basses \lyricsto basses \loiDiepKhuc
  >>
  \layout {
    \context {
      \Lyrics
      \override VerticalAxisGroup.staff-affinity = ##f
      \override VerticalAxisGroup.staff-staff-spacing =
        #'((basic-distance . 0)
	   (minimum-distance . 1)
	   (padding . 1))
    }
    \context {
      \Staff
      \remove "Time_signature_engraver"
      \override VerticalAxisGroup.staff-staff-spacing =
        #'((basic-distance . 0)
	   (minimum-distance . 1)
	   (padding . 1))
    }
  }
}
