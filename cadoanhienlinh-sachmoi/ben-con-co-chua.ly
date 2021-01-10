%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Nội dung tài liệu
% 1. Cài đặt chung
% 2. Nhạc
% 3. Lời
% 4. Bố trí
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 1. Cài đặt chung
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\version "2.18.2"
\include "english.ly"

\header {
  title = "Bên Con Có Chúa"
  subtitle = "(Nguyên tác: As The Deer)"
  composer = "Martin Nystrom"
  arranger = "Lời, Hòa âm: Đức Huân"
  tagline = ##f
}

global= {
  \key d \major
  \time 4/4
}

\paper {
  #(set-paper-size "a4")
  top-margin = 15\mm
  bottom-margin = 15\mm
  left-margin = 20\mm
  right-margin = 20\mm
  print-page-number = #f
  indent = #0
  #(define fonts
	 (make-pango-font-tree "Liberation Serif"
	 		       "Liberation Serif"
			       "Liberation Serif"
			       (/ 20 20)))
  page-count = 1
}

printItalic = \with {
  \override LyricText.font-shape = #'italic
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 2. Nhạc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
musicSoprano = \relative c' {
  fs4 a a fs8 e |
  d4. e8 g fs e d |
  b'4 b8 b a4. g8 |
  a1 \break |
  fs4 a a fs8 e |
  d4. e8 g fs e d |
  d4. fs8 e4. d8 |
  d1 \break |
  <<
    {
      \voiceOne
        d'4 d d d8 cs |
        b4 b a4. d8 |
        b4 b b b8 a |
        \time 2/4 g4 g |
        \time 4/4 fs1 \break |
        fs4 a a fs8 e |
        d4. e8 g fs e d |
        d4. fs8 e4. d8 |
        d1 \bar "|."
    }
    \new Voice {
      \voiceTwo
      fs4 fs fs fs8 fs |
      fs4 e e d |
      g g g g8 fs |
      e4 e |
      cs1 |
      d4 fs e d8 cs |
      d4. d8 cs cs cs b |
      b4. b8 cs4. cs8 |
      a1
    }
  >>
}

musicBasso = \relative c {
  fs4 a a fs8 e |
  d4. e8 g fs e d |
  d'4 d8 d cs4. b8 |
  a1 |
  a4 d d a8 g |
  fs4. g8 b a g fs |
  g4. g8 a4. g8 |
  fs1 |
  <<
    {
      \voiceOne
        d'4 d d d8 d |
        d4 cs cs b |
        b b b b8 b |
        \time 2/4 b4 b |
        \time 4/4 b2 (gs) |
        a4 d a a8 g |
        fs4. g8 b a g fs |
        g4. g8 g4. g8 |
        fs1
    }
    \new Voice {
      \voiceTwo
      b4 b a a8 a |
      g4 g fs b, |
      e e d d8 d |
      cs4 cs |
      fs1 |
      d4 d cs cs8 cs |
      b4. b8 a a a a |
      g4. g8 a4. a8 |
      d1
    }
  >>
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 3. Lời
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tiengVietMot = \lyricmode {
  \set stanza = #"1."
  Con dõi bước trên dương trần toan tính đa đoan lạc lối
    chẳng biết đâu dừng chân
  Quên có Chúa dẫn soi đường con mãi chơi vơi bập bềnh
    ước mơ mộng thường.
  Chúa ánh sáng cánh sao mai rạng ngời
  Vạt nắng ấm áp xóa đêm lạnh mịt mờ
  Xin Chúa dắt con đi
    cùng xin dắt con đi về nguồn phúc sinh trọn lành.
}

tiengVietHai = \lyricmode {
  \set stanza = #"2."
  Dâng tiến Chúa nỗi u sầu
    giây phút cô đơn lặng lẽ chẳng biết đi về đâu
  Thao thức biết bao đêm dài ray rứt suy tư
    tình đời trái ngan lạc loài
  Có những lúc đớn đau trong nghi ngờ
  Lạy Chúa hãy đến chúng con đang mong chờ.
  Xin Chúa đến con tin thờ
  Có Chúa với con cuộc đời sẽ vơi muộn phiền.
}

tiengVietBa = \lyricmode {
  \set stanza = #"3."
  Con có Chúa luôn song hành
    đâu lắng lo chi ngày tháng rất bấp bênh mỏng manh
  Con phó thác trọn cuộc đời
    xin Chúa dẫn đưa từng ngày dẫu con tội hèn
  Chúa sức sống suối ân thiêng dạt dào
  Hạnh phúc ấm áp Chúa yêu con biết bao
  Con có Chúa tâm an bình luôn vững tin
    cho dù đời lẻ loi một mình.
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 4. Bố trí
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\score {
  \new ChoirStaff <<
    \new Staff <<
      \global
      \clef "treble"
      \new Voice = "sopranos" {
        \voiceOne \global \stemUp \slurUp \musicSoprano
      }
    >>

    \new Lyrics \lyricsto sopranos \tiengVietMot
    \new Lyrics \printItalic \lyricsto sopranos \tiengVietHai
    \new Lyrics \lyricsto sopranos \tiengVietBa

    \new Staff <<
      \clef "bass"
      \global
      \new Voice = "tenor" {
        \voiceThree \global \stemNeutral \slurUp \musicBasso
      }
    >>
  >>
}
