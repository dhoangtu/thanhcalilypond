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
  title = "Kìa Trông Huy Hoàng"
  composer = "Lời: Hoài Đức"
  arranger = "Nhạc: Vĩnh Phước"
  tagline = ##f
}

global = {
  \key a \major
  \time 6/8
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
  page-count = #1
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 2. Nhạc phiên khúc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
verseMusic = \relative c' {
  \partial 4. r4 e8 |
  a4 e8 cs4 e8 |
  a4. r4 cs8 |
  b4 gs8 a4 b8 |
  e,4. r4 e8 |
  a4 e8 cs4 e8 |
  a4. r4 cs8 |
  b4 gs8 b4 e,8 |
  a4. r4 e8 |
  cs'4 cs8 d4 cs8 |
  cs4. a4 \breathe a8 |
  gs4 gs8 cs4 b8 |
  e,4. r4 e8 |
  cs'4 cs8 d4 cs8 |
  cs4. a4 \breathe cs8 |
  e4 d8 b4 cs8 |
  a4. r4 r8 \bar "||"
  e4 e8 cs4 e8 |
  a8 e cs e r4 |
  b'4 b8 a4 b8 |
  cs b a b4 \breathe e,8 |
  cs'4 cs8 d4 cs8 |
  cs4. a4 \breathe a8 |
  b4 b8 cs4 b8 |
  e,4. r4 e8 |
  cs'4 cs8 d4 cs8 |
  cs4. a4 \breathe cs8 |
  e4 d8 b4 cs8 |
  a4. (a4) r8 \bar "||"
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 3. Nhạc điệp khúc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
sopChorus = \relative c'' {
  a4 e8 cs4 cs8 |
  e4. r4 r8 |
  cs'4 b8 a4 b8 |
  cs4. a4 r8 |
  a4 e8 cs4 cs8 |
  e4. r4 r8 |
  cs'4 b8 a4 b8 |
  cs4. a4 r8 |
  e'4 d8 cs4 d8 |
  cs8 (d cs) b4 r8 |
  b cs d e4 cs8 |
  a4. r4 r8 |
  e'4 d8 cs4 d8 |
  cs8 (d cs) b4 r8 |
  b cs d b4 cs8 |
  a4. r4 \bar "|."
}

bassChorus = \relative c'' {
  \override NoteHead.font-size = #-2
  \set Score.currentBarNumber = #29
  a4 e8 cs4 cs8 |
  e4. r4 r8 |
  e4 d8 cs4 d8 |
  e4. cs4 r8 |
  a'4 e8 cs4 cs8 |
  e4. r4 r8 |
  e4 d8 cs4 d8 |
  e4. cs4 r8 |
  cs'4 b8 a4 b8 |
  a (b a) e4 r8 |
  d8 e fs gs4 gs8 |
  a4. r4 r8 |
  cs4 b8 a4 b8 |
  a (b a) e4 r8 |
  d e fs e4 e8 |
  cs4. r4
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 4. Lời phiên khúc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
verseOne = \lyricmode {
  \set stanza = #"1."
  Kìa trông huy hoàng vi sao, chiếu soi gần xa khắp miền.
  Nào hỡi mục đồng dậy mau, chớ lo chi hãy bằng yên.
  Này nghe ta báo tin vui mừng: vừa đây trong chốn hang lừa,
  đã sinh ra chính Vua muôn trùng, mau đến Bê lem kính thờ.
  Bê lem kìa sương tuyết ta ngại chi, mau lên nào mau bước ta cùng đi,
  cùng đi xem rõ Vua nhân trần, Người sinh trong cảnh cơ hàn.
  Nào anh em hãy nghe Thiên Thần, đi viếng Chúa ta xuống trần.
}

verseTwo = \lyricmode {
  \set stanza = #"2."
  Nào hỡi muôn loài hòa vang, tiếng ca nhịp theo tiếng đàn.
  Mừng Chúa muôn loài cao sang giáng sinh chuộc lấy phàm nhân.
  Phàm nhân tội lỗi hãy suy cùng, tình thương bao xiết khoan hồng.
  Vào đây ca hát lên vang lừng, mong cám ơn cho hết lòng.
  Dân mục đồng con kính tin cậy trông, thay nhân loài con cất vang lời ca.
  Nửa đêm thanh vắng cung ca đàn làm cho bao xiết ngậm ngùi.
  Ngày nay Chúa đoái thương nhân trần, xin hãy thứ tha nhân loài.
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 5. Lời điệp khúc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
choruslyric = \lyricmode {
  \set stanza = #"ĐK:"
  Giữa muôn vàn hào quang với muôn ngàn hương ngát lừng,
  bao Thiên Thần hòa vang, cất bao lời cung chúc mừng:
  Sáng danh Thiên Chúa trên trời, bằng yên cho khắp nhân loài.
  Sáng danh Thiên Chúa trên trời, bằng yên xuống cho nhân loài.
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
    \context Lyrics = basses \lyricsto sopranos \choruslyric
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
