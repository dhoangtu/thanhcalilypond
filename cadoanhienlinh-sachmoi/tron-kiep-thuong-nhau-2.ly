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
  \partial 4 g8 (a) |
  g (f) d f |
  g4 e8 e |
  d g e (d) |
  c2 |
  c8. d16 f8 f |
  d8. f16 g8 g |
  f8. g16 a8 a ( |
  a4) r |
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 3. Nhạc điệp khúc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
sopChorus = \relative c'' {
  \bar "" \set Score.currentBarNumber = #9
  c4 bf8 d |
  c8. bf16 g8 (bf) |
  c4 a8. g16 |
  c8 c a16 (g) f8 |
  f2 ( |
  f4) \bar "|."
}

musicChorusSoprano = \relative c'' {
  \bar "" \set Score.currentBarNumber = #9
  c4 bf8 d |
  c8. bf16 g8 (bf) |
  c4 a8. g16 |
  c8 c a16 (g) f8 |
  f2 ( |
  f4) \bar "|."
}

musicChorusAlto = \relative c' {
  f4 g8 g|
  a8. d,16 d4 |
  c8 r16 g' f8. f16 |
  e8 e e f |
  f4 d8 d |
  c4
}

musicChorusTenor = \relative c' {
  a4 bf |
  a8. g16 bf8 (g) |
  g4 c8. bf16 |
  bf4 bf |
  a bf8 bf |
  a4
}

musicChorusBasso = \relative c {
  f4. e8 |
  f8. f16 f4 |
  e f8. d16 |
  c4 c |
  d bf8 bf |
  f4
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
choruslyric = \lyricmode {
  \set stanza = #"ĐK."
  Xin Mẹ đoái thương luôn chở che cho đời sống lứa đôi vẹn lời thề.
}

choruslyricSoprano = \lyricmode {
  Xin Mẹ đoái thương luôn chở che,
  cho đời sống lứa đôi vẹn thề (luôn vẹn thề).
}

choruslyricAlto = \lyricmode {
  Xin Mẹ đoái thương luôn chở che,
  xin cho đời sống lứa đôi vẹn thề (luôn vẹn thề).
}

choruslyricTenor = \lyricmode {
  Xin đoái thương luôn chở che cho đời sống lứa đôi luôn vẹn thề.
}

choruslyricBasso = \lyricmode {
  Xin đoái thương luôn chở che cho đời sống lứa đôi luôn vẹn thề.
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
    >>
    \new Lyrics \lyricsto sopranos \choruslyric
  >>
}

\score {
  \new ChoirStaff <<
    \new Staff <<
      \new Voice = "Soprano" { \clef treble \global \musicChorusSoprano }
      \new Lyrics \lyricsto Soprano \choruslyricSoprano
    >>
    \new Staff <<
      \new Voice = "Alto" { \clef treble \global \musicChorusAlto }
      \new Lyrics \lyricsto Alto \choruslyricAlto
    >>
    \new Staff <<
      \new Voice = "Tenor" { \clef "violin_8" \global \musicChorusTenor }
      \new Lyrics \lyricsto Tenor \choruslyricTenor
    >>
    \new Staff <<
      \new Voice = "Bass" { \clef bass \global \musicChorusBasso }
      \new Lyrics \lyricsto Bass \choruslyricBasso
    >>
  >>
}
