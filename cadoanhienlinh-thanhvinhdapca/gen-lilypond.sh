#!/bin/bash

FOLDERS="../03.lilypond ../06.vol1-printed ../12.vol3-lilypond-all"

LYCOPY="./ly-copy"
rm -rf ${LYCOPY}
mkdir ${LYCOPY}

DELIMITER="@"

GEN=./pdf-generated
rm -rf ${GEN}
mkdir ${GEN}

RESIZED=./resized-90
rm -rf ${RESIZED}
mkdir ${RESIZED}

CONTENT=./content-table.csv
rm ${CONTENT}

# create a list of folders to scan for .ly files
IFS=' ' read -r -a folderlist <<< "${FOLDERS}"
# copy lilypond files
echo "=== Copying lilypond files"
for lyfolder in "${folderlist[@]}"
do
  # generate again from current folder to folder ./pdf
  for fullname in ${lyfolder}/*.ly
  do
      name=`basename -- "$fullname"`
      shortname="${name%.*}"
      
      # copy lilypond file
      cp ${fullname} ${LYCOPY}/${name}
      
      # replace top = 10mm by top = 3.5mm, top = 5mm by top = 1.5mm
      sed -i 's/top-margin = 10/top-margin = 3.2/' ${LYCOPY}/${name}
      sed -i 's/top-margin = 5/top-margin = 1.1/' ${LYCOPY}/${name}
      
      # remove stemup, to default stem-auto
      sed -i 's/\\stemUp//' ${LYCOPY}/${name}
      
      # remove slurUp, to default slur-auto
      sed -i 's/\\slurUp//' ${LYCOPY}/${name}
  done
done

# scan .ly files
pagecounter=1
for fullname in ${LYCOPY}/*.ly
do
    echo "=== Generating $fullname "
    name=`basename -- "$fullname"`
    shortname="${name%.*}"
    
    # get title
    title=`cat ${fullname} | grep " title" | grep "=" | sed 's/^[^"]*"//g' | sed -e 's/[[:space:]]*$//'`
    # remove last character
    title=${title%?}
    #echo "title: ${title}"
    
    # get composer
    composer=`cat ${fullname} | grep "composer" | grep "=" | sed 's/^[^"]*"//g' | sed -e 's/[[:space:]]*$//'`
    # remove last character
    composer=${composer%?}
    #echo "composer: ${composer}"
    
    # generate pdf files
    lilypond --output="${GEN}/${title}${DELIMITER}${composer}" -dno-point-and-click --pdf "$fullname"
    #lilypond --output="${FOLDER3}/${shortname}" -dno-point-and-click --pdf "${fullname}"
    
    #page counter
    echo "${title};${pagecounter}" >> ${CONTENT}
    # starting page of next song
    pageno=`pdfinfo "${GEN}/${title}${DELIMITER}${composer}.pdf" | grep "Pages" | grep -Eo '[0-9]+'`
    echo "${title}${DELIMITER}${composer}.pdf : ${pageno} pages"
    pagecounter=$(( $pageno + $pagecounter ))
    
    echo "" 
done

# resize all pdf
filelist=()
for fullname in ${GEN}/*.pdf
do
   echo "=== Resizing $fullname "
   name=`basename -- "$fullname"`
   shortname="${name%.*}"
   
 ~/Desktop/software/pdfScale.sh -v -r a5 -s 0.90 "${fullname}" "${RESIZED}/${name}"
 
  filelist+=( "${RESIZED}/${name}" )
done

# combine songs
~/Desktop/software/cpdf "${filelist[@]}" -o songs.pdf

# add page numbers
pdflatex song-odd-even.tex

# combine all pdf files in name order
PREFACEVN=./covers/preface-vn.pdf
PREFACEEN=./covers/preface-en.pdf
REFVN=./covers/ref-vn.pdf
REFEN=./covers/ref-en.pdf
TABLE=./covers/contents.pdf
BLANK=./blank-a5.pdf

~/Desktop/software/cpdf  ${PREFACEVN} ${PREFACEEN} song-odd-even.pdf ${TABLE} ${BLANK} -o song-book.pdf

# adjiust even-odd page
pdfjam --twoside --paper a5paper --offset '0.5cm 0cm' song-book.pdf --outfile book-adjusted.pdf

FRONT=./covers/cover-front.pdf
INNER=./covers/cover-inner.pdf
BACK=./covers/cover-back.pdf
~/Desktop/software/cpdf  ${FRONT} ${INNER} ${BLANK} book-adjusted.pdf ${BACK} -o chants-in-english-mass.pdf
