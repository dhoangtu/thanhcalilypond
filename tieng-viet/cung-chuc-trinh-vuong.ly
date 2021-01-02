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

\header {
  title = "Cung chúc Trinh Vương"
  composer = "LM Hoài Đức"
  tagline = ##f
}

global = {
  \key d \minor
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
verseMusic = \relative c' {
  a'4 c8 a8 |
  a4. g8 |
  f8(e8) g8 f8 |
  d4. d8 |
  a'8 g8 a8 c8 |
  d4 c8 f8 |
  d4 c8(d16 c16) |
  a2 \breathe |
  d,4 f8 d8 |
  d4. c8 |
  d8(f8) c'8 a8 |
  a4 a8(c8) |
  d8 c8 a8 f8 |
  a4 g8 a8 |
  f4 e4 |
  d2 \bar "|" % 16
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 3. Nhạc điệp khúc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
sopChorus = \relative c' {
  d4 f8 g8 |
  a4 g8 f8 |
  g8 f8 a8 c8 |
  d2 |
  d4 a8 g8 |
  f4 g8 a8 |
  g4 c8(d8) |
  a2 |
  d,4 f8 g8 |
  a4 g8 f8 |
  g8 f8 a8 c8 |
  d2 |
  d4 a8 g8 |
  f4 g8 a8 |
  f4 e 8 f8 |
  d2 \bar "|." |
}

bassChorus = \relative c' {
	\override NoteHead.font-size = #-2
  \bar "" \set Score.currentBarNumber = #17
  d4 f8 e8 |
  f4 e8 d8 |
  e8 d8 f8 e8 |
  f2 |
  f4 f8 e8 |
  d4 e8 f8 |
  e4 a8(bes8) |
  f2 |
  d4 f8 e8 |
  f4 e8 d8 |
  e8 d8 f8 e8 |
  f2 |
  f4 f8 e8 |
  d4 e8 f8 |
  d4 cis8 cis8 |
  d2 \bar "|." |
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 4. Lời phiên khúc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
verseOne = \lyricmode {
  \set stanza = #"1."
  Cung chúc Trinh Vương không hề nhiễm tội truyền. Thật Mẹ là Mẹ Thiên Chúa, Mẹ khiết trinh trọn đời.
  Cung chúc Trinh Vương là kho tích ơn thiêng. Mẹ đã hy sinh hiệp thông để cứu chuộc nhân loại.
}

verseTwo = \lyricmode {
  \set stanza = #"2."
  Cung chúc Trinh Vương Mẹ quyền phép khôn lường. Vì Mẹ đầy ơn Thiên Chúa Mẹ Nữ Vương muôn loài.
  Cung chúc Trinh Vương Mẹ nhân ái yêu đương. Mẹ cứu giúp ai lạc bước, ai khốn khổ trên đời.
}

verseThree = \lyricmode {
  \set stanza = #"3."
  Nhưng đang thương thay nhân loại đã trờ lòng. Làm nên mạo gai nhọn sắc rách nát tim Mẹ lành.
  Mong ước Trinh Vương lượng tha thứ bao dung. Cho thế nhân bao tội lỗi xin Đức Mẹ thương tình.
}

verseFour = \lyricmode {
  \set stanza = #"4."
  Con muốn vang cung với thần thánh trên trời. Và bao người lành dưới thế ngợi chúc Mẹ Thiên Đình.
  Cung chúc Trinh Vương chiều hoom với ban mai. Con muốn mến yêu Mẹ mãi, con mế yêu tận tình.
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 5. Lời điệp khúc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
choruslyric = \lyricmode {
  \set stanza = #"ĐK:"
  Mẹ Ma -- ri -- a ai là không được Mẹ thương đến. Khốn thay nhân loại mê đắm nên lãng quên.
  Mẹ Fa -- ti -- ma! Con nguyện xin đền tạ yêu mến. Muốn hy sinh nhiều yên ủi Mẹ khỏi ưu phiền.
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
    \new Lyrics \lyricsto verse \verseTwo
    \new Lyrics \lyricsto verse \verseThree
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
        \voiceOne \global \stemUp \sopChorus
      }
      \new Voice = "basses" {
        \voiceTwo \global \stemDown \bassChorus
      }
    >>
    \new Lyrics = basses
    \context Lyrics = basses \lyricsto basses \choruslyric
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
