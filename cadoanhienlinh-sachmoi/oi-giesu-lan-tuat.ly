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
  title = "Ôi Giêsu Lân Tuất"
  composer = "Nguyên Kha"
  arranger = "TV 41"
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

printItalic = \with {
  \override LyricText.font-shape = #'italic
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 2. Nhạc điệp khúc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
sopChorus = \relative c' {
  d8 d d d |
  f4 f8 e |
  f g f e |
  d2 |
  a'8 a a a |
  c (d) d d |
  <f d> <f d> <e cs> <e cs> |
  d2 |
  d8 c bf g |
  a4 a |
  g8 f e d |
  a'2 |
  a8 g a bf |
  a4. a8 |
  <f' a,> (<e bf>) <d a> <c g> |
  <d f,>2 \bar "|."
}

bassChorus = \relative c' {
  %\override NoteHead.font-size = #-2
  d8 d d d |
  f4 f8 e |
  f g f e |
  d2 |
  f8 f f f |
  a4 a8 g |
  a a g g |
  f2 |
  a8 g f e |
  f4 f |
  e8 d c d |
  cs2 |
  d8 e f g |
  f4. f8 |
  f4 f8 e |
  d2
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 3. Nhạc phiên khúc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
verseMusic = \relative c'' {
  \bar "" \set Score.currentBarNumber = #17
  d8 c d c |
  a4 a |
  a8 g bf bf |
  a2 |
  a8 g a bf |
  a4. a8 |
  g4 a8 g |
  f2 |
  d'8 c d c |
  a4 a |
  a8 g bf bf |
  a2 |
  d,8 e f g |
  g4. a8 |
  f (e) f e |
  d2 \bar "|."
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% . Lời điệp khúc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
choruslyric = \lyricmode {
  \set stanza = #"ĐK."
  Ôi Giê -- su lân tuất bao giờ con thấy Vua muôn đời.
  Ôi Giê -- su lân tuất con mong ước Thanh Nhan Chúa Trời!
  Chúa ơi con hằng trông mong như nai kia tìm suối!
  Tâm hồn con khát mong gặp Chúa, Vua Tình Yêu.
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 5. Lời phiên khúc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
verseOne = \lyricmode {
  \set stanza = #"1."
  Nhớ xưa giữa muôn người con ca ngợi Chúa Chí Tôn
  tiến về nới Thánh cung với muôn tiếng reo mừng.
  Nhớ xưa giữ muôn người con ca ngợi Chúa Chí Tôn
  lòng hoan hỉ reo vui chúc tụng Thánh Danh Ngài.
}

verseTwo= \lyricmode {
  \set stanza = #"2."
  Hãy thương chiếu ánh quang minh soi vào chốn tối tăm,
  Xin dủ thương dẫn con tới Thiên Quốc huy hoàng.
  Hãy thương chiếu ánh quang minh soi vào chốn tối tăm,
  làm vui thỏa tâm can héo hon đã bao lần.
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
    \new Lyrics \lyricsto sopranos \choruslyric
  >>
  \layout {
    \context {
      \Lyrics
      \override VerticalAxisGroup.staff-affinity = ##f
    }
    \context {
      \Staff
      \remove "Time_signature_engraver"
    }
  }
}

\score {
  \new ChoirStaff <<
    \new Staff = verses <<
      \override Staff.TimeSignature.transparent = ##t
      \new Voice = "verse" {
        \global \stemNeutral \verseMusic
      }
    >>
    \new Lyrics \lyricsto verse \verseOne
    \new Lyrics \printItalic \lyricsto verse \verseTwo
  >>
}

