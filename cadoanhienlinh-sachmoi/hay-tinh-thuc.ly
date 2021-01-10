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
  title = "Hãy Tỉnh "
  composer = "Vũ Mộng Thơ"
  arranger = "Cảm hứng: Lc. 12, 40. TV. 102"
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

printItalic = {
  \override LyricText.font-shape = #'italic
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 2. Nhạc phiên khúc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
verseMusic = \relative c' {
  d8 e g4 |
  g8 g4 a8 |
  d, e b'4 |
  b8 b4 d8 |
  e, g4 b8 |
  a2 |
  g8 a d4 |
  d8 d4 e8 |
  c c c4 |
  b8 a4 a8 |
  d, e fs a |
  g2 \bar "||"
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 3. Nhạc điệp khúc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
sopChorus = \relative c'' {
  \bar "" \set Score.currentBarNumber = #13
  d8 c b4 |
  c4. d8 |
  b4 c8 a |
  g4 b8 d |
  c c4 e8 |
  d2 |
  e4. b8 |
  a4. c8 |
  e e4 c8 |
  a4 g8 c |
  b4 a |
  g2 \bar "|."
}

bassChorus = \relative c'' {
  \override NoteHead.font-size = #-2
  b8 a g (fs) |
  e4. fs8 |
  g4 a8 fs |
  g4 g8 f! |
  e g4 b8 |
  a2 |
  b4. g8 |
  e4. a8 |
  c c4 g8 |
  e4 e8 e |
  d4 c |
  b2
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 4. Lời phiên khúc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
verseOne = \lyricmode {
  \set stanza = #"1."
  Đời - ta bao năm có ngày nào đó Chúa đến tiếng gọi tựa giấc mơ.
  Phận - ta ra sao xét theo bao năm trong đời, đã làm nên công ích chi.
}

verseTwo = \lyricmode {
  \set stanza = #"2."
  Đời - ta như hoa sáng nở chiều đã héo úa có bền lâu mãi đâu.
  Nhiều dịp may qua đi Chúa ban cho ta sinh lời, để làm hành trang kiếp sau.
}

verseThree = \lyricmode {
  \set stanza = #"3."
  Thời giờ trên dương gian sánh bằng với giá máu Chúa cứu chuộc tội thế nhân.
  Người ơi sao vui chơi tháng năm trôi qua đi rồi, mãi còn công lênh trắng tay.
}

verseFour = \lyricmode {
  \set stanza = #"4."
  Còn dịp may trong tay hãy tìm công phúc thi ân lỡ dịp may hết đi.
  Thờ - kính Giê -- su Chúa ta trung kiên, yêu người, đó là kho thiêng kiếp sau.
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 5. Lời điệp khúc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
choruslyric = \lyricmode {
  \set stanza = #"ĐK."
  Chớ cho rằng ta sống lâu, biết đâu ngờ trong phút giây đời tiễn ta.
  Hãy quan phòng, không biết đến bao giờ, tỉnh thức luôn đêm ngày.
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
    \new Lyrics \lyricsto sopranos \choruslyric
  >>
}
