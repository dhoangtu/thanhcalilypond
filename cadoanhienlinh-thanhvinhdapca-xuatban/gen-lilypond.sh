#!/bin/bash

set -x

FOLDERS="/home/dhtu/Desktop/CATH/thanhcalilypond/cadoanhienlinh-thanhvinhdapca"
lilypondcmd="/home/dhtu/bin/lilypond"

GEN=./pdf-generated
rm -rf ${GEN}
mkdir ${GEN}

CONTENT=./content-table.csv
rm ${CONTENT}

# create a list of folders to scan for .ly files
IFS=' '
# scan .ly files
pagecounter=1
filelist=()
for fullname in ${FOLDERS}/*.ly
do
    echo "=== Generating $fullname "
    name=`basename -- "$fullname"`
    shortname="${name%.*}"
    
    # get title
    title=`cat ${fullname} | grep " title" | grep "=" | sed 's/^[^"]*"//g' | sed -e 's/[[:space:]]*$//' | sed 's/\"[[:space:]]//g'`
    # remove last character
    title=${title%?}
    #echo "title: ${title}"

    # generate pdf files
    ${lilypondcmd} --output="${GEN}/${shortname}" -dno-point-and-click --pdf "$fullname"
    
    #page counter
    echo "${title};${pagecounter}" >> ${CONTENT}
    # starting page of next song
    pageno=`pdfinfo "${GEN}/${shortname}.pdf" | grep "Pages" | grep -Eo '[0-9]+'`
    echo "${title} : ${pageno} pages"
    pagecounter=$(( $pageno + $pagecounter ))
	
	filelist+=( "${GEN}/${shortname}.pdf" )
    
    echo "" 
done

# combine songs
pdftk "${filelist[@]}" cat output songs.pdf

# add page numbers
pdflatex song-odd-even.tex

# combine all pdf files in name order
pdftk loiphilo.pdf blank-a4.pdf song-odd-even.pdf blank-a4.pdf cat output song-book.pdf

# adjust even-odd page
pdfjam --twoside --paper a4paper --offset '0.3cm 0cm' song-book.pdf --outfile song-book-adjusted.pdf

pdftk  bia-truoc.pdf blank-a4.pdf song-book-adjusted.pdf bia-sau-trong.pdf blank-a4.pdf bia-sau.pdf cat output thanhvinhdapca.pdf

rm -rf ${GEN} song-odd-even.pdf songs.pdf song-book.pdf song-book-adjusted.pdf *.aux *.log
