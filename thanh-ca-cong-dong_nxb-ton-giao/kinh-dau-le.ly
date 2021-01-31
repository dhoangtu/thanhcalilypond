% Cài đặt chung
\version "2.20.0"
\include "english.ly"

\header {
  title = "Kinh Đầu Lễ"
  composer = "Huyền Linh"
  tagline = ##f
}

global = {
  \key a \minor
  \time 4/4
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

% Nhạc phiên khúc
verseMusic = \relative c'' {
  \partial 4 g |
  a4. g8 e4 a8. a16 |
  a2. a4 |
  c4. a8 c4 e |
  e2. c8 c |
  e4 e8 d c4 d |
  a2. g8. g16 |
  a4 a c a |
  e2. e4 |
  a4. g8 e8. e16 a8. a16 |
  a2. a4 |
  c4. a8 c4 e |
  e2. c8 c |
  e4 e8 d e4 f |
  e2. c8 e |
  e4 d c d |
  a2. \break
}

% Nhạc điệp khúc
sopChorus = \relative c'' {
  \set Score.currentBarNumber = #17
  \partial 4 e8. e16 |
  e4 f e d |
  c4. d8 e4 a,8. a16 |
  a4 b c a |
  e2. e'8. d16 |
  e4 f e d |
  c4. d8 e4 a,8. a16 |
  a4 b c b |
  a2. \bar "|."
}

bassChorus = \relative c'' {
  \partial 4 c8. c16 |
  c4 d c b |
  a4. b8 c4 e,8. e16 |
  e4 d e d |
  c2. c'8. b16 |
  c4 d c b |
  a4. b8 c4 e,8. e16 |
  e4 d e d |
  c2.
}

% Lời phiên khúc
verseOne = \lyricmode {
  \set stanza = #"1."
  Ngày xưa trên đồi Gol -- go -- tha, Mẹ đứng gần bên Thánh giá.
  Mẹ nhìn Chúa trút hơi thở cuối đời.
  Mẹ đồng công dâng lễ đền bồi.
  Giờ đây trên bàn thờ bao vui say,
  Đoàn con hợp dâng thánh lễ.
  Nhờ Mẹ giúp xác hồn con trắng trong,
  Để xứng đáng tham dự lễ này.
}

verseTwo = \lyricmode {
  \set stanza = #"2."
  Nhìn lên bàn thờ: Ôi thương đau,
  Thập giá còn lênh láng máu.
  Mà vì Chúa vốn chưa thỏa mối tình.
  Còn đòi nơi rượu bánh ẩn mình.
  Đoàn con suy về tình yêu bao la.
  Đồng dâng lòng tin sắt đá.
  Nguyện Mẹ giúp con được luôn thiết tha,
  Lòng mến Chúa không sợ phai nhòa.
}

% Lời điệp khúc
choruslyric = \lyricmode {
  \set stanza = #"ĐK:"
  Con dâng lên Nữ Vương tấm lòng nhỏ bé được thật tình mến Chúa yêu người.
  Cho đời con trở nên trót đời của lễ chờ ngày về hưởng phúc quê trời.
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
    \new Lyrics = basses
    \context Lyrics = basses \lyricsto sopranos \choruslyric
  >>
}

