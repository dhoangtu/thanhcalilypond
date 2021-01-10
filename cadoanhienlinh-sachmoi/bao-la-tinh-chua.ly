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
  title = "Bao La Tình Chúa"
  composer = "Nhạc & lời: Giang Ân"
  arranger = "Hòa âm: Viết Phương"
  tagline = ##f
}

global = {
  \key c \major
  \time 2/4
  \override Lyrics.LyricSpace.minimum-distance = #1.0
}

\paper {
  #(set-paper-size "a4")
  top-margin = 15\mm
  bottom-margin = 15\mm
  left-margin = 20\mm
  right-margin = 20\mm
  indent = #0
  print-page-number = #f
  #(define fonts
	 (make-pango-font-tree "Liberation Serif"
	 		       "Liberation Serif"
			       "Liberation Serif"
			       (/ 20 20)))
  page-count = 1
}

printItalic = {
  \override LyricText.font-shape = #'italic
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 2. Nhạc phiên khúc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
verseMusic = \relative c'' {
  r4 r8 a |
  a e c' b |
  a4. b8 |
  b b a16 (c) b (a) |
  e4. c8 |
  c d c d |
  e4. a16 (b) |
  e,8 a c a |
  b4 r8 a |
  a d d c16 (d) |
  e4. e8 |
  c d d16 (e) d (c) |
  g4 e8 e |
  b'4. b8 |
  b4 c,8 e |
  g4. a8 |
  a2 \bar "||"
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 3. Nhạc điệp khúc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
sopranoChorus = \relative c'' {
  \bar "" \set Score.currentBarNumber = #18
  r4 c8 d |
  \repeat volta 2
  {
    e e e e |
    e8. d16 e8 c |
    d d d d |
    d8. d16 e8 a, |
    c c c c |
  }
  \alternative {
    {
      c8. b16 c8 d |
      e2 ( |
      e8) r c d
    }
    {
      e8. d16 gs8 e |
      a2 ( |
      a4) r \bar "|."
    }
  }
}

altoChorus = \relative c' {
  r4 e8 f |
  \repeat volta 2
  {
    g g g g |
    g8. g16 g8 g |
    g g g fs |
    g8. g16 e8 e |
    f f f e |
  }
  \alternative {
    {
      g8. g16 g8 fs |
      gs4 gs8 g |
      gs8 r e f
    }
    {
      e8. d16 d8 d |
      c4 (d |
      c) r
    }
  }
}

tenorChorus = \relative c' {
  r4 a8 a |
  \repeat volta 2
  {
    c c c c |
    c8. d16 c8 c |
    b b b c |
    b8. b16 a8 c |
    a a a c |
  }
  \alternative {
    {
      e8. d16 c8 b |
      b4 b8 b |
      d r a a |
    }
    {
      a8. g16 gs8 gs |
      a4 (f |
      a) r
    }
  }
}

bassChorus = \relative c {
  r4 a8 d |
  \repeat volta 2
  {
    c c c g |
    c8. b16 c8 e |
    g g g d |
    g8. g16 c,8 a |
    a a a f |
  }
  \alternative {
    {
      c'8. g16 g8 b |
      e4 e8 e |
      e r a, d |
    }
    {
      a8. d16 b8 e |
      a2 ( |
      a4) r4
    }
  }
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 4. Lời phiên khúc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
verseOne = \lyricmode {
  \set stanza = #"1."
  Bao la tình Chúa yêu con,
  mênh mông như biển Thái Bình,
  dạt dào như ngàn con sóng,
  vỗ về năm tháng đời con.
  Tình Ngài như mưa đỉnh núi,
  Suốt đời tuôn đổ dạt dào.
  Một tình yêu vô biên,
  một tình yêu vô biên.
}

verseTwo = \lyricmode {
  \set stanza = #"2."
  Xa xôi ngày tháng êm trôi,
  yêu thương như nước xuôi dòng.
  Mặn nồng như làn hơi ấm,
  đổ đầy mưa nắng đời con.
  Còn gì như ân tình Chúa,
  dắt dìu con bước trong đời.
  Từng nhịp chân yêu thương,
  từng nhịp chân yêu thương.
}

verseThree = \lyricmode {
  \set stanza = #"3."
  Êm như làn gió đưa mây,
  đôi tya con hướng lên trời,
  nguyện cầu cho đời con mãi,
  giữ trọn lời hứa trung kiên.
  Một đời con xin tận hiến,
  Chúa là hơi ấm mẹ hiền.
  Trọn đời con nương thân,
  trọn đời con nương thân.
}

verseFour = \lyricmode {
  \set stanza = #"4."
  Con dâng cuộc sống tương lai,
  bao nhiêu thay đổi thăng trầm,
  lặng thầm đi về mưa nắng,
  Bước đường gian khó đầy vơi.
  Nguyện cầu ơn trên gìn giữ,
  tấm lòng con mãi chân tình.
  Một niềm tin trung kiên,
  một niềm tin trung kiên.
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 5. Lời điệp khúc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
choruslyricA = \lyricmode {
  \set stanza = #"ĐK:"
  Hồng ân Chúa như mưa như mưa,
  rơi xuống đời con miên man miên man
  nâng đỡ tình con trong tay trong tay
  vòng tay thương mến.
  Đời có
}

choruslyricB = \lyricmode {
  \skip 2
  _ Chúa êm trôi êm trôi,
  Chúa dắt dìu con luôn luôn không thôi,
  có Chúa cùng đi con không đơn
  \repeat unfold 7 { \skip 2 }
  côi. Ôi tình tuyệt vời!
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
      \new Staff \with {
        \consists "Merge_rests_engraver"
      }
      <<
        \clef "treble"
        \override Staff.TimeSignature.transparent = ##t
        \new Voice = "sopranos" { \voiceOne \global \stemUp \slurUp \sopranoChorus }
        \new Voice = "alto" { \voiceTwo \global \stemDown \slurDown \altoChorus }
      >>
      \new Lyrics \lyricsto sopranos \choruslyricA
      \new Lyrics \with \printItalic \lyricsto sopranos \choruslyricB
      \new Staff \with {
        \consists "Merge_rests_engraver"
      }
      <<
        \clef "bass"
        \override Staff.TimeSignature.transparent = ##t
        \new Voice = "tenor" { \voiceThree \global \stemUp \slurUp \tenorChorus }
        \new Voice = "bass" { \voiceThree \global \stemDown \slurDown \bassChorus }
      >>
    >>

}
