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
  title = "Cầu Cho Cha Mẹ"
  composer = "Phanxicô"
  tagline = ##f
}

global = {
  \key a \minor
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
% 2. Nhạc phiên khúc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
verseMusic = \relative c'' {
  \partial 8 a8 |
  a8. c16 b8 a |
  e4. a8 |
  e8. a16 d,8 e |
  a4. c8 |
  c8. a16 c8 e |
  d4 d8 c8 |
  a8. a16 f8 g16 (a) |
  e2 |
  e8. e16 a8 e |
  d4. d8 |
  d8. d16 g8 d |
  c2 |
  e4 b'8 b16 (a) |
  g4. a8 |
  e8. a16 d,8 e |
  a2 \bar "||"
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 3. Nhạc điệp khúc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
sopChorus = \relative c'' {
  e8. e16 e8 c |
  d8. d16 d8 b |
  c4 g8 a |
  e2 |
  e8. e16 a8 e |
  d8. d16 g8 d |
  c e a (g) |
  a4. \fermata \bar "|."
}

bassChorus = \relative c'' {
  \override NoteHead.font-size = #-2
  \bar "" \set Score.currentBarNumber = #17
  c8. c16 c8 a |
  b8. b16 b8 g|
  a4 e8 ds |
  e2 |
  c8. c16 c8 c |
  b8. b16 c8 b |
  a c e4 |
  <a, e'>4.
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 4. Lời phiên khúc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
verseOne = \lyricmode {
  \set stanza = #"1."
  Xin Chúa đoái thương chúc lành cho đời cha mẹ của con.
  Công ơn là như núi non, dưỡng nuôi con bao ngày vuông tròn.
  Con sinh đến trong đời, an vui nhờ có ơn trời.
  Và ơn cha mẹ, suốt đời coi nhẹ khổ đau.
}

verseTwo = \lyricmode {
  \set stanza = #"2."
  An vui cũng như đau buồn luôn đẹp tấm lòng mẹ cha.
  Ai qua là bao chốn xa, thấy đâu vui cho bằng mái nhà.
  Mai con lớn lên rồi, ra đi tung cánh trong đời.
  Dù xa vô bờ, vẫn nhờ đến tình mẹ cha.
}

verseThree = \lyricmode {
  \set stanza = #"3."
  Kim ô bóng đã khuất đồi, để lại ánh chiều mờ sương.
  Than ôi mẹ cha mến thương nay đã đi vĩnh biệt cõi đời.
  Thân con đã nên người, an vui hay phải u sầu,
  Còn đâu tiếng cười, hay lời cha mẹ ủi an.
}

verseFour = \lyricmode {
  \set stanza = #"4."
  Canh khuya tiếng khóc âm thầm chan hòa với lời cầu kinh
  Van xin cùng Đức Nữ Trinh thương song thân đang ở luyện hình.
  Dâng lên Chúa Thiên Tòa đau thương như chuỗi hãm mình
  Cầu cho cha mẹ hưởng tình của người con ngoan.
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 5. Lời điệp khúc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
choruslyricA = \lyricmode {
  \set stanza = #"ĐK A."
  Xin cho cha mẹ con thắm mãi tình son của Chúa Trời.
  Cho con giữa gia đình luôn sống theo tình người con ngoan.
}

choruslyricB = \lyricmode {
  \set stanza = #"ĐK B."
  Xin cho cha mẹ con thoát khỏi sầu thương lửa luyện hình,
  Đưa mau đến Thiên Đàng an hưởng thanh bình ngày vinh quang.
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 6. Bố trí
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\score {
  \new ChoirStaff <<
    \new Staff = verses <<
      \new Voice = "verse" {
        \global \stemNeutral \verseMusic
      }
    >>
    \new Lyrics \lyricsto verse \verseOne
    \new Lyrics \printItalic \lyricsto verse \verseTwo
    \new Lyrics \lyricsto verse \verseThree
    \new Lyrics \printItalic \lyricsto verse \verseFour
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
      \override Staff.TimeSignature.transparent = ##t
      \new Voice = "sopranos" {
        \voiceOne \global \stemUp \sopChorus
      }
      \new Voice = "basses" {
        \voiceTwo \global \stemDown \bassChorus
      }
    >>
    \new Lyrics \lyricsto basses \choruslyricA
     \new Lyrics \printItalic \lyricsto basses \choruslyricB
  >>
}
