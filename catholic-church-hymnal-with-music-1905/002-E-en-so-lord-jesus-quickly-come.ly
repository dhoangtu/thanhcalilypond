%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% CONTENTS OF THIS DOCUMENT
% 1. Common settings
% 2. Soprano music
% 3. Alto music
% 4. Tenor  music
% 5. Basso music
% 6. Lyrics
% 7. Layout
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 1. Common settings
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\version "2.18.2"

\header {
  title = "002. E'en So, Lord Jesus, Quickly Come"
  subtitle = "(Advent or General)"
  subsubtitle = "For SATB a cappella"
  piece = "Revelation 22, Adapted P.O.M."
  arranger = "PAUL O. MANZ"
  tagline = ##f
  copyright = "Copyright 1954, by Concordia Publishing House, St. Louis, Mo."
}

globalSettings= {
  \key des \major
  \override Staff.TimeSignature #'style = #'()
  %\override Score.BarNumber.break-visibility = ##(#t #t #t)
  %\override Score.BarNumber.break-visibility = ##(#f #f #f)
  \tempo "Adagio" 4 = 116
}

verseSettings = {
  \phrasingSlurDashed
}

\paper {
  #(set-paper-size "a4")
  top-margin = 5\mm
  bottom-margin = 15\mm
  left-margin = 20\mm
  right-margin = 20\mm
  %indent = #0
  #(define fonts
	 (make-pango-font-tree "Liberation Serif"
	 		       "Liberation Serif"
			       "Liberation Serif"
			       (/ 20 20)))

  print-page-number = #f
}

printItalic = \with {
  \override LyricText.font-shape = #'italic
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 2. Soprano music
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
musicSoprano = \relative c' {
  \time 4/4
  \partial 4 f4 ^\mp |
  bes c des2 ( |
  des4) c bes aes |
  f2. \breathe aes4 |
  \time 6/4
  bes aes f2 ees2 |
  \time 4/4
  f2. \breathe f4 |
  bes c des2 ( |
  des4) f ees c |
  aes2. c4 |
  \time 6/4
  bes aes f2 ees |
  \time 4/4
  f2. r4 |
  r f ^\f  ^\cresc bes c |
  des ees des c |
  aes2. \! \breathe aes4 |
  \time 6/4
  bes aes des2 c |
  \time 4/4
  bes2. \breathe f4 |
  bes c des2 ( |
  des4) f ees c |
  aes2. \breathe c4 |
  \time 6/4
  bes aes f2 ees |
  f2. \breathe f'4^\f ^\markup { \italic "(accel. slightly)" } f f |
  f (ees8 des) c4 c c c |
  c des8 (ees) des4 \breathe des des des |
  des (c8 bes a4) a bes c |
  c (des8 ees f4 ^\ff) \breathe bes aes! ges |
  f -> ees2 -> bes'4 aes f |
  ees2. \breathe ges4 f ees |
  \override TextSpanner.bound-details.left.text = "rit."
                  des2 ^\startTextSpan (c) bes |
  \time 4/4
  a!2. \stopTextSpan f4 ^\p |
  bes c des2 ( |
  des4) c bes aes |
  f2. \breathe aes4 |
  \time 6/4
  bes aes f2 ees |
  \time 4/4
  f2. \breathe f4 |
  bes c des2 ( |
  des4) f ees c |
  aes2. \breathe c4 |
  \time 6/4
  bes ^"rit." aes f2 ees |
  \time 4/4
  f2. ^\pp \fermata r4 \bar "|."
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 3. Alto music
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
musicAlto = \relative c' {
  \time 4/4
  \partial 4 f4 |
  bes c des2 ( |
  des4) c bes aes |
  f (ees des) \breathe c |
  \time 6/4
  des c des2 ees |
  \time 4/4
  f2. \breathe f4 |
  e! f f (aes! |
  ges) bes aes ges |
  f2. aes4 |
  \time 6/4
  f ees des (c) bes (c) |
  \time 4/4
  des2. r4 |
  r f ^\cresc bes f |
  bes aes ges f |
  ees (des c) \! \breathe f |
  \time 6/4
  ges f ges (f) ees (aes) |
  \time 4/4
  f2. \breathe f4 |
  e! f f (aes! |
  ges) bes aes ges |
  f2. \breathe aes4 |
  \time 6/4
  f ees des (c) bes (c) |
  d!2. \breathe bes'4 ^\f ^\markup { \italic "(accel. slightly)" } bes bes |
  bes2 bes4 bes aes ges |
  aes aes bes \breathe bes bes bes |
  bes (ges f) f f f |
  f2 (bes4 ^\ff) \breathe des c bes |
  aes -> ges -> (aes) des c bes |
  aes (ges aes) \breathe bes aes ges |
  \override TextSpanner.bound-details.left.text = "rit."
                  f ^\startTextSpan (ges2 f) e!4 |
  \time 4/4
  f2. \stopTextSpan f4 ^\p |
  bes c des2 ( |
  des4) c bes aes |
  f (ees des) \breathe c |
  \time 6/4
  des c des2 ees |
  \time 4/4
  f2. \breathe f4 |
  e! f f (aes! |
  ges) bes aes ges |
  f2. \breathe aes4 |
  \time 6/4
  f ^"rit." ees des (c) bes (c) |
  \time 4/4
  aes2. ^\pp \fermata r4
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 4. Tenor  music
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
musicTenor = \relative c {
  \time 4/4
  \partial 4 r4 |
  r f bes c |
  des ees f ees |
  des (c bes) \breathe aes |
  \time 6/4
  ges aes bes2 c |
  \time 4/4
  des4 (c bes) \breathe c |
  bes a! bes (c |
  bes) des c ees |
  ees (des c) ees |
  \time 6/4
  des c aes2 ges4 (aes) |
  \time 4/4
  aes2. \breathe f4 ^\f |
  bes ^\cresc c des2 ( |
  des4) c bes aes |
  f2. \! \breathe c'4 |
  \time 6/4
  des c bes2 aes4 (ees') |
  \time 4/4
  ees (des c) \breathe des |
  bes a! bes (c |
  bes) des c ees |
  ees (des c) \breathe ees |
  \time 6/4
  des c aes2 ges4 (aes) |
  bes2. \breathe d!4 ^\f ^\markup { \italic "(accel. slightly)" } ees f |
  ges2 ges4 ges f ees |
  f f f \breathe f ges aes |
  ges (ees8 des c4) c des ees |
  ees (c des ^\ff) \breathe ges ees des |
  c -> des -> (c) ges' ees des |
  c (des c) \breathe des c bes |
  \override TextSpanner.bound-details.left.text = "rit."
                  des2 \startTextSpan (c) bes |
  \time 4/4
  c2. \stopTextSpan r4 |
  r f, ^\p bes c |
  des ees f ees |
  des (c bes) \breathe aes |
  \time 6/4
  ges aes bes2 c |
  \time 4/4
  des4 (c bes) \breathe c |
  bes a! bes (c |
  bes) des c ees |
  ees (des c) \breathe ees |
  \time 6/4
  des ^"rit." c aes2 (aes4) ges |
  \time 4/4
  f2. ^\pp \fermata r4
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 5. Basso music
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
musicBasso = \relative c {
  \time 4/4
  \partial 4 r4 |
  r2. f4 |
  bes c des c |
  bes (aes ges) \breathe f |
  \time 6/4
  ees f ges2 aes |
  \time 4/4
  bes4 (f des) \breathe f |
  ges f bes,2 ( |
  ees4) ees aes aes |
  des,2 (f4) f |
  \time 6/4
  bes, c des2 ees4 (aes,)
  \time 4/4
  des2. \breathe f4 |
  bes ^\cresc c des2 ( |
  des4) c bes aes |
  f2. \! \breathe f4 |
  \time 6/4
  ees f ges2 aes2 |
  \time 4/4
  bes2. \breathe bes4 |
  ges f bes,2 ( |
  ees4) ees aes aes |
  des,2 (f4) \breathe f |
  \time 6/4
  bes, c des2 ees |
  f2. \breathe bes4 ^\f ^\markup { \italic "(accel. slightly)" } c d! |
  ees (ees,) aes aes aes aes |
  des c bes \breathe bes8 (aes) ges4 f |
  ees2 (f4) f ges a! |
  bes2 (bes4) ^\ff \breathe ees, f ges |
  aes -> bes -> (aes) ees f ges |
  aes (bes aes) \breathe ees f ges |
  \override TextSpanner.bound-details.left.text = "rit."
                  bes2 ^\startTextSpan (aes) ges |
  \time 4/4
  f2. \stopTextSpan r4 |
  r2. f4 ^\p |
  bes c des c |
  bes (aes bes) \breathe f |
  \time 6/4
  ees f ges2 aes |
  \time 4/4
  bes4 (f des) \breathe f |
  ges f bes,2 ( |
  ees4) ees aes aes |
  des,2 (f4) \breathe f |
  \time 6/4
  bes, ^"rit." c des2 ees4 (aes,) |
  \time 4/4
  des,2. ^\pp \fermata r4
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 6. Lyrics
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
lyricsSoprano = \lyricmode {
  Peace be to you and grace from Him
  Who freed us from our sin,
  Who loved us all and shed His blood
  That we might sav -- ed be.
  Sing Ho -- ly, Ho -- ly to our Lord,
  The Lord, Al -- might -- y God,
  Who was and is and is to come;
  Sing Ho -- ly, Ho -- ly, Lord!
  Re -- joice in heav -- en, all ye that dwell there -- in,
  Re -- joice on earth, ye saints be -- low,
  For Christ is com -- ing, is com -- ing soon,
  For Christ is com -- ing soon!
  E'en so, Lord Je -- sus, quick -- ly come,
  And night shall be no more;
  They need no light nor lamp nor son,
  For Christ will be their All!
}

lyricsAlto = \lyricmode {
  Peace be to you and grace from Him
  Who freed us from our sin,
  Who loved us all and shed His blood
  That we might sav -- ed be.
  Sing Ho -- ly, Ho -- ly to our Lord,
  The Lord, Al -- might -- y God,
  Who was and is and is to come;
  Sing Ho -- ly, Ho -- ly, Lord!
  Re -- joice in heav -- en, all ye that dwell there -- in,
  Re -- joice on earth, ye saints be -- low,
  For Christ is com -- ing, is com -- ing soon,
  For Christ is com -- ing soon!
  E'en so, Lord Je -- sus, quick -- ly come,
  And night shall be no more;
  They need no light nor lamp nor sun,
  For Christ will be their All!
}

lyricsTenor = \lyricmode {
  Peace be to you and grace from Him
  Who freed us from our sin,
  Who loved us all and shed His blood
  That we might sav -- ed be.
  Sing Ho -- ly, Ho -- ly to our Lord,
  The Lord, Al -- might -- y God,
  Who was and is and is to come;
  Sing Ho -- ly, Ho -- ly, Lord!
  Re -- joice in heav -- en, all ye that dwell there -- in,
  Re -- joice on earth, ye saints be -- low,
  For Christ is com -- ing, is com -- ing soon,
  For Christ is com -- ing soon!
  E'en so, Lord Je -- sus, quick -- ly come,
  And night shall be no more;
  They need no light nor lamp nor son,
  For Christ will be their All!
}

lyricsBasso = \lyricmode {
  Oh, peace and grace from Him
  Who freed us from our sin,
  Who loved us all and shed His blood
  That we might sav -- ed be.
  Sing Ho -- ly, Ho -- ly to our Lord,
  The Lord, Al -- might -- y God,
  Who was and is and is to come;
  Sing Ho -- ly, Ho -- ly, Lord!
  Re -- joice in heav -- en, all ye that dwell there -- in,
  Re -- joice on earth, ye saints be -- low,
  For Christ is com -- ing, is com -- ing soon,
  For Christ is com -- ing soon!
  Lord Je -- sus, quick -- ly come,
  And night shall be no more;
  They need no light nor lamp nor son,
  For Christ will be their All!
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 7. Layout
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\score {
  \new ChoirStaff <<
    \new Staff \with { instrumentName = #"Soprano" } <<
      \new Voice = "Soprano" { \clef treble \globalSettings \musicSoprano }
      \new Lyrics \lyricsto Soprano \lyricsSoprano
    >>
    \new Staff \with { instrumentName = #"Alto" } <<
      \new Voice = "Alto" { \clef treble \globalSettings \musicAlto }
      \new Lyrics \lyricsto Alto \lyricsAlto
    >>
    \new Staff \with { instrumentName = #"Tenor" } <<
      \new Voice = "Tenor" { \clef "violin_8" \globalSettings \musicTenor }
      \new Lyrics \lyricsto Tenor \lyricsTenor
    >>
    \new Staff \with { instrumentName = #"Bass" } <<
      \new Voice = "Bass" { \clef bass \globalSettings \musicBasso }
      \new Lyrics \lyricsto Bass \lyricsBasso
    >>
  >>
}