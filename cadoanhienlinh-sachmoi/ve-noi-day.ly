%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Nội dung tài liệu
% 1. Cài đặt chung
% 2. Nhạc phiên khúc
% 3. Nhạc điệp khúc
% 4. Lời phiên khúc
% 5. Lời điệp khúc
% 6. Bố trí
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 1. Cài đặt chung
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\version "2.18.2"
\include "english.ly"

\header {
  title = "Về Nơi Đây"
  composer = "Sáng tác: Lm. Nguyễn Duy"
  arranger = "Hòa âm: Viết Phương"
  tagline = ##f
}

global = {
  \key c \major
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

printItalic = \with {
  \override LyricText.font-shape = #'italic
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 2. Nhạc điệp khúc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
nhacDiepKhucSoprano = \relative c'' {
  c8 g e f |
  g4 e |
  c a' |
  g2 \breathe |
  c8 g e f |
  g4 g8 g |
  c4 d |
  e2 |
  e8 e f e |
  d4 a |
  d8 d e d |
  c4 g \breathe |
  e8 e f g |
  a4 g8 g |
  b4 d |
  c2 \bar "||"
}

nhacDiepKhucAlto = \relative c' {
  e8 c c d |
  d4 c |
  a d |
  d2 |
  e8 c c d |
  d4 e8 c |
  e4 a |
  gs2 |
  a8 a a g |
  g4 f |
  g8 g g g |
  g4 e |
  c8 c c e |
  f4 e8 d |
  g4 f |
  e2
}

nhacDiepKhucTenor = \relative c' {
  g8 g g b |
  b4 a |
  e a |
  b2 \breathe |
  g8 g g b |
  b4 c8 c |
  a4 a |
  b2 |
  c8 c d b |
  b4 d |
  b8 b c b |
  c4 c |
  g8 g a c |
  c4 c8 b |
  d4 b |
  c2
}

nhacDiepKhucBasso = \relative c {
  c8 e c b |
  g4 a |
  a fs |
  g2 |
  c8 e c b |
  g4 c8 e |
  a,4 f' |
  e2 |
  a8 a d, e |
  g4 a |
  g8 g c, g' |
  e4 c |
  c8 c f c |
  f4 c8 g' |
  g4 g, |
  a2
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 3. Nhạc phiên khúc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
nhacPhienKhucSoprano = \relative c'' {
  r4 e8 e |
  e8. c16 c8 c |
  d4 d8 d |
  d8. b16 b8 b |
  c4 \breathe c8 b |
  a4 g |
  f g |
  e2 ( |
  e4) c8 c |
  e8. e16 d8 d |
  f4 \breathe e8 e |
  g8. g16 f8 f |
  a4 \breathe a8 b |
  c4 d |
  e c |
  d2 \mark "D.C." \bar "|."
}

nhacPhienKhucBasso = \relative c'' {
  r4 g8 g |
  g8. e16 e8 e |
  f4 f8 f |
  f8. d16 d8 d |
  e4 g8 g |
  f4 e |
  d e |
  c2 ( |
  c4 ) g8 g |
  c8. c16 b8 b |
  d4 c8 c |
  e8. e16 d8 d |
  f4 f8 g |
  e4 f |
  g a |
  b2
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 4. Lời điệp khúc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
loiDiepKhuc = \lyricmode {
  Chúng con về nơi đây dâng ngàn tiếng ca.
  Chúng con về nơi đây để tạ ơn Thiên Chúa.
  Qua bao tháng năm mong chờ say sưa thánh ân vô bờ.
  Được cùng nhau bên Chúa thỏa lòng con ước mơ.
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 5. Lời phiên khúc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Với tiếng hát rạo rực niềm tin,
  với anh mắt đọng lời nguyện xin,
  chúng con dâng muôn ngàn ý tinh.
  Từng lời kinh hay từng cuộc sống,
  cùng hòa chung trong tình hiệp nhất,
  nguyện dâng lên Thiên Chúa Tình Yêu.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Hãy đón lấy một trời hồng ân,
  hãy giữ lấy cả một mùa xuân,
  Chúa thương ban cho người thế trần.
  Một lần ta đến dự Tiệc Thánh,
  cuộc đời ta no thỏa hạnh phúc,
  nguồn bình an chan chứa đời ta.
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 6. Bố trí
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\score {
    \new ChoirStaff <<
      \new Staff <<
        \clef "treble"
        \new Voice = "sopranos" {
          \voiceOne \global \stemUp \slurUp \nhacDiepKhucSoprano
        }
        \new Voice = "alto" {
          \voiceTwo \global \stemDown \slurDown \nhacDiepKhucAlto
        }
      >>
      \new Lyrics \lyricsto sopranos \loiDiepKhuc
      
      \new Staff <<
        \clef "bass"
        \new Voice = "tenor" {
          \voiceThree \global \stemUp \slurUp \nhacDiepKhucTenor
        }
        \new Voice = "bass" {
          \voiceFour \global \stemDown \slurDown \nhacDiepKhucBasso
        }
      >>
    >>
}


\score {
  \new ChoirStaff <<
    \new Staff = chorus <<
      \override Staff.TimeSignature.transparent = ##t
      \new Voice = "sopranos" {
        \voiceOne \global \stemUp \nhacPhienKhucSoprano
      }
      \new Voice = "basses" {
        \voiceTwo \global \stemDown \nhacPhienKhucBasso
      }
      \new Lyrics \lyricsto sopranos \loiPhienKhucMot
      \new Lyrics \printItalic \lyricsto sopranos \loiPhienKhucHai
    >>
  >>
}
