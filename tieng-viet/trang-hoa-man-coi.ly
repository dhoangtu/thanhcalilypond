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
  title = "Tràng Hoa Mân Côi"
  composer = "Phạm Xuân Chiến"
  tagline = ##f
}

global = {
  \key f \major
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
% 2. Nhạc điệp khúc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
sopChorus = \relative c' {
                    \partial 4 c'8 c8
  c4 a8(bes8) |
  c4 a8 g8 |
  f8. f16 bes8 bes8 %3
  bes4 bes8 a8 |
  g8. g16 c8 c8 |
  c4 \breathe c8 bes8 |
  a8. g16 \acciaccatura c8 d8 c8 |
  a2( |
  a4) c8 c8 |
  c4 a8(bes8) |
  c4 a8 g8 |
  f8. f16 bes8 bes8 |
  bes4 bes8 bes16 a16 |
  g8. g16 c8 c16 c16 |
  c4 c8 bes8 |
  a8. g16 bes8 a16(g16) |
  f2( |
                    f4) \bar "|."
}

bassChorus = \relative c' {
	\override NoteHead.font-size = #-2
                    \partial 4 a'8 a8
  a4 f8(g8) |
  a4 f8 e8 |
  d8. d16 g8 g8 |
  g4 g8 f8 |
  e8. e16 a8 a8 |
  a4 a8 g8 |
  f8. e16 \acciaccatura a8 bes8 a8 |
  f2( |
  f4) a8 a8 |
  a4 f8(g8) |
  a4 f8 e8 |
  d8. d16 g8 g8 |
  g4 g8 g16 f16 |
  e8. e16 a8 a16 a16 |
  a4 a8 g8 |
  f8. e16 g8 f16(e16) |
  f2( |
                    f4) \bar "|."
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 3. Nhạc phiên khúc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
verseMusic = \relative c' {
  \set Score.currentBarNumber = #18
                    \partial 4 c8 c8
  a'8. a16 a8 a8 |
  a4 a8 c8 |
  a8. g16 g8 f8 |
  a4 c,8 c8 |
  g'8. g16 g8 g8 |
  g4 g8 bes8 |
  a8. g16 g8 f8 |
  f2( |
                    f4) \bar "||"
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 4. Lời điệp khúc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
choruslyric = \lyricmode {
  \set stanza = #"ĐK:"
  Ma -- ri -- a Mẹ ơi! Con dâng Mẹ tràng hoa Mân Côi, con dâng Mẹ lời kinh ca vui, kinh Kính Mừng Mẹ Ma -- ri -- a.
  Ma -- ri -- a Mẹ ơi! Theo chân Mẹ đời không đơn côi, xin vâng như Mẹ lòng con luôn tin yêu.
  Mong Mẹ hiền trợ giúp con hèn.
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 5. Lời phiên khúc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
verseOne = \lyricmode {
  \set stanza = #"1."
  Đường trần gian bao nhiêu đau thương, bao đắng cay đang giăng chờ đón.
  Nguyện Mẹ thương giơ tay ban ơn phù giúp con tin yêu trọn đời.
}

verseTwo = \lyricmode {
  \set stanza = #"2."
  Này người ơi ta nhanh chân lên, mau đến bên ngai thiêng Mẹ thánh.
  Nguyện Mẹ thương ban muôn ơn thiêng để chúng con xin vâng trọn đời.
}

verseThree = \lyricmode {
  \set stanza = #"3."
  Này tràng hoa mân côi dâng lên chan chứa bao tâm tình trìu mến.
  Nguyện Mẹ thương ban muôn ơn thiêng và giúp con theo gương Mẹ hiền.
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 6. Bố trí
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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
      \override VerticalAxisGroup.staff-staff-spacing =
        #'((basic-distance . 0)
	   (minimum-distance . 1)
	   (padding . 1))
    }
  }
}

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
      \remove "Time_signature_engraver"
      \override VerticalAxisGroup.staff-staff-spacing =
        #'((basic-distance . 0)
     (minimum-distance . 1)
     (padding . 1))
    }
  }
}
