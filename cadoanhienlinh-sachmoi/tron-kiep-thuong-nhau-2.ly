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
\version "2.20.0"
\include "english.ly"

\header {
  title = "Trọn Kiếp Thương Nhau 2"
  composer = "Lm. Kim Long"
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

printItalic = {
  \override LyricText.font-shape = #'italic
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 2. Nhạc phiên khúc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
verseMusic = \relative c'' {
  
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 3. Nhạc điệp khúc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
sopChorus = \relative c'' {
  
}

bassChorus = \relative c'' {
  \override NoteHead.font-size = #-2
  \bar "" \set Score.currentBarNumber = #17
  
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 4. Lời phiên khúc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
verseOne = \lyricmode {
  \set stanza = #"1."
  Trước ngai Mẹ khoan nhân hai tâm hồn khấn nguyện rằng:
  Đời từ hôm nay nguyện trao cho nhau Mẹ thương chứng kiến.
}

verseTwo = \lyricmode {
  \set stanza = #"2."
  Trước ngai Mẹ khoan nhân hai tâm hồn khấn nguyện rằng:
  Dù thời gian qua dù đời phôi pha tình luôn thắm thiết.
}

verseThree = \lyricmode {
  \set stanza = #"3."
  Trước ngai Mẹ khoan nhân hai tâm hồn khấn nguyện rằng:
  Trọn đời bên nhau dù gặp thương đau nguyện theo ý Chúa.
}

verseFour = \lyricmode {
  \set stanza = #"4."
  Trước ngai Mẹ khoan nhân hai tâm hồn khấn nguyện rằng:
  Chàng được quang vinh nàng được tươi xinh đoàn con hiếu nghĩa.
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 5. Lời điệp khúc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
choruslyricA = \lyricmode {
  \set stanza = #"ĐK A."
  Xin Mẹ đoái thương luôn chở che cho đời sống lứa đôi vẹn lời thề.
}

choruslyricB = \lyricmode {
  \set stanza = #"ĐK B."
  
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
    \new Lyrics \with \printItalic \lyricsto verse \verseTwo
    \new Lyrics \lyricsto verse \verseThree
    \new Lyrics \with \printItalic \lyricsto verse \verseFour
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
     \new Lyrics \with \printItalic \lyricsto basses \choruslyricB
  >>
}
