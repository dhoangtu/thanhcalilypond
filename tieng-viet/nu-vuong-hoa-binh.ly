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
  title = "Nữ Vương hòa bình"
  composer = "Hải Linh"
  tagline = ##f
}

global = {
  \key f \major
  \time 2/4
  \stemNeutral
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
  a'2^\mf |
  f4 c'8(d8) |
  c2 \breathe |
  c8^\f(f8 c8 d8) |
  c4 a4 |
  a2 \breathe |
  g8(a8 c8 a8) |
  g4 f4 |
  f2( |
  f4) r4 |
  g4^\p g8 g8 |
  f4 g4^\< |
  a2 |
  c4^\mp\! c8 d16(c16) |
  a4 c4 |
  d2 \breathe |
  d8^\f(f4) d8 |
  c4 a4 |
  c2( |
  c4) a4^\p |
  g4.^\<(a8) |
  bf8\!(a8) g8.^\> f16 |
  f2( |
  f4\!) c'4^\f |
  c2( |
  c4) \breathe c4 |
  c2( |
  c4) \breathe <a f>8.-> <f d>16-> |
  <d' bf>4^\ff <d bf>8. <d bf>16 |
  <d bf>4 <c a>4 |
  <c a>2( |
  <c a>4) \breathe c4^\f |
  c2( |
  c4) \breathe c4 |
  c2( |
  c4) \breathe <a f>8.-> <f d>16-> |
  <d' bf>4.^\f <c a>8 |
  <c a>2 |
  <c g>2 |
  f,2\fermata \bar "|." \break
}

basseChorus = \relative c' {
  a2^\mf |
  f4 c'8(d8) |
  c2 \breathe |
  a4.^\f(bf8) |
  a4 f4 |
  f2 \breathe |
  c4.(f8) |
  e4 <c a f>4 |
  <c a f>2( |
  <c a f>4) r4 |
  c4^\p c8 c8 |
  a4 c4 |
  f2 |
  a4^\mp a8 bf16(a16) |
  f4 a4 |
  bf4 f4-> |
  bf4.^\f bf8 |
  a4 f4 |
  a4 <bf g>8^\> <a f>8 |
  <g e>4 f4^\p\! |
  c2^\< |
  d8\!(f8) <e c>8.^\> <c a f>16 |
  <c a f>2( |
  <c a f>4)\! r4 |
  r4 <a' f>8^\mf <bf g>16 <a f>16 |
  <g c>4 r4 |
  r4 <g c,>8 <f a,>16 <g c,>16 |
  <a f>4 r4 |
  <f bf,>2 |
  <f bf,>4 <f bf,>8. <f bf,>16 |
  <f c f,>2( |
  <f c f,>4) r4 |
  r4 <a f>8 <bf g>16 <a f>16 |
  <g c,>4 r4 |
  r4 <g c,>8 <f a,>16 <g c,>16 |
  <a f>4 r4 |
  r4 <f bf,>8^\f <f c>8 |
  <f c>2 |
  <f c>2 |
  <a f c f,>2\fermata \bar "|." \break
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 3. Nhạc phiên khúc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
verseMusic = \relative c' {
  \bar "" \set Score.currentBarNumber = #41
	d8^\p(f4) c8 |
  a'4 g4 |
  f2( |
  f4) r4 |
  a4.^\mp f8 |
  d'4 c4 |
  c2( |
  c4) r4 |
  c8^\f f8 c8 d8 |
  c4 a4 |
  g4.(a8) |
  f4^\p f8 f8 |
  d4 f8(g8) |
  c2( |
  c4) r4 \bar "||"
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 4. Lời điệp khúc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
chorusLyricSoprano = \lyricmode {
  \set stanza = #"ĐK:"
  Kính mừng Nữ Vương, Nữ Vương hòa bình, Nữ Vương hòa bình.
  Đây bao tâm hồn thao thức, dân con đất Việt nao nức cất tiếng ca mừng vui kính chào Nữ Vương hòa bình.
  Tung hô... tung hô... Mẹ là sáng khắp đất nước bao la.
  Tung hô... tung hô... đem nguồn sống yên vui chan hòa.
}

chorusLyricBasse = \lyricmode {
  \set stanza = #"ĐK:"
  Kính mừng Nữ Vương, Nữ Vương hòa bình, Nữ Vương hòa bình.
  Đây bao tâm hồn thao thức, dân con đất Việt nao nức cùng cất tiếng ca mừng vui cất tiếng ca kính chào Nữ Vương hòa bình.
  Mẹ Ma -- ri -- a Mẹ đầy ơn phúc Tung hô Ma -- ri -- a.
  Mẹ Ma -- ri -- a Mẹ đầy ơn phúc trong an vui chan hòa.
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 5. Lời phiên khúc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
verseOne = \lyricmode {
  \set stanza = #"1."
  Mẹ chẳng vướng tội truyền. Bông huệ ngát hương thiên.
  Mẹ ví như ánh trăng diệu huyền. Êm như cung đàn thần tiên.
}

verseTwo = \lyricmode {
  \set stanza = #"2."
  Mẹ về với giang sơn. Xin Mẹ xuống ơn thiêng.
  Cho nước Nam thoát cơn nguy nan. Cho dân thấy ngày bình an.
}

verseThree = \lyricmode {
  \set stanza = #"3."
  Mẹ là sức siêu nhiên. Dắt dìu chúng con liên.
  Cho giáo dân khắp nơi trung kiên. Cho muôn tông đồ thành tín.
}

verseFour = \lyricmode {
  \set stanza = #"4."
  Mẹ là sáng Phúc Âm. Soi đường lối muôn dân.
  Vun tưới cây Đức Tin rườm rà, xinh tươi muôn màu muôn hoa.
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 6. Bố trí
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\score {
  \new ChoirStaff <<
    \new Staff = chorusSoprano <<
      \clef "treble"
      \new Voice = "sopranos" {
        \global \sopChorus
      }
      \new Lyrics = sopranos
      \context Lyrics = sopranos \lyricsto sopranos \chorusLyricSoprano
    >>

    \new Staff = chorusBasse <<
      \clef "bass"
      \new Voice = "basse" {
        \global \basseChorus
      }
      \new Lyrics = basse
      \context Lyrics = basse \lyricsto basse \chorusLyricBasse
    >>
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
    \new Lyrics \lyricsto verse \verseFour
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
