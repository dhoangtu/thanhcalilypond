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
/home/dhtu/Downloads/cpdf-binaries-master/Linux-Intel-64bit/cpdf "${filelist[@]}" -o songs.pdf

#/home/dhtu/Downloads/cpdf-binaries-master/Linux-Intel-64bit/cpdf ./pdf-generated/001-ta-vui-mung.pdf ./pdf-generated/002-xin-hoi-phuc.pdf ./pdf-generated/003-con-huong-long-len.pdf ./pdf-generated/004-cong-chinh-va-hoa-binh.pdf ./pdf-generated/005-on-ngai-cuu-do.pdf ./pdf-generated/006-halleluia-mua-vong.pdf ./pdf-generated/006-mot-niem-vui.pdf ./pdf-generated/007-xin-ngai-ngu-den.pdf ./pdf-generated/008-ngoi-khen-chua.pdf ./pdf-generated/009-hay-reo-mung.pdf ./pdf-generated/010-chua-den.pdf ./pdf-generated/011-an-nghia-chua.pdf ./pdf-generated/012-hay-ke-cho-muon-dan.pdf ./pdf-generated/013-anh-sang-bung-len.pdf ./pdf-generated/014-truoc-mat-chu-dan.pdf ./pdf-generated/015-kinh-so-chua.pdf ./pdf-generated/016-gierusalem-hay-tan-tung-chua.pdf ./pdf-generated/018-chua-ban-phuc-lanh.pdf ./pdf-generated/019-xin-du-long-xot-thuong.pdf ./pdf-generated/020-huong-ve-chua.pdf ./pdf-generated/021-xin-chua-o-ke-ben.pdf ./pdf-generated/022-hy-vong-noi-ngai.pdf ./pdf-generated/023-truoc-nhan-chua.pdf ./pdf-generated/024-nguon-anh-sang.pdf ./pdf-generated/025-hay-nghe-loi-chua.pdf ./pdf-generated/026-loi-ban-hanh-phuc.pdf ./pdf-generated/027-chua-nhan-hau-tu-bi.pdf ./pdf-generated/028-chua-chan-dat-toi.pdf ./pdf-generated/029-bo-song-babylon.pdf ./pdf-generated/030-hay-nghiem-xem.pdf ./pdf-generated/031-chua-tu-ai.pdf ./pdf-generated/032-xin-tai-tao-long-con.pdf ./pdf-generated/033-sao-no-bo-con.pdf ./pdf-generated/034-cam-ta-chua.pdf ./pdf-generated/035-xin-chi-day-con.pdf ./pdf-generated/036-nhan-thanh-chua.pdf ./pdf-generated/037-tan-duong-ngai.pdf ./pdf-generated/038-ta-la-dan-toc.pdf ./pdf-generated/039-dang-loi-ca-tung.pdf ./pdf-generated/040-chuc-tung-chua.pdf ./pdf-generated/041-hay-reo-mung-thien-chua.pdf ./pdf-generated/042-ca-tung-chua.pdf ./pdf-generated/043-chua-len-troi.pdf ./pdf-generated/044-xin-ngu-den.pdf ./pdf-generated/045-ca-tiep-lien_chua-thanh-than.pdf ./pdf-generated/046-tung-ho-tin-mung_chua-thanh-than.pdf ./pdf-generated/047-nay-con-xin-den.pdf ./pdf-generated/048-xin-day-bao-con.pdf ./pdf-generated/049-ca-tung-chua.pdf ./pdf-generated/050-con-se-loan-truyen.pdf ./pdf-generated/051-nguoi-cong-chinh.pdf ./pdf-generated/052-ca-tung-chua-di.pdf ./pdf-generated/053-chua-van-yeu-thuong.pdf ./pdf-generated/054-hanh-phuc-thay.pdf ./pdf-generated/055-chua-la-noi-con-an-nau.pdf ./pdf-generated/056-niem-tin-vao-chua.pdf ./pdf-generated/057-xin-thuong-tinh.pdf ./pdf-generated/058-trong-thien-chua.pdf ./pdf-generated/059-ta-on-chua.pdf ./pdf-generated/060-nhu-da-tang.pdf ./pdf-generated/061-reo-vui-len.pdf ./pdf-generated/062-halleluia-mua-giang-sinh.pdf ./pdf-generated/062-rao-giang-tin-mung.pdf ./pdf-generated/063-song-doi-hoan-hao.pdf ./pdf-generated/064-tim-chua.pdf ./pdf-generated/065-van-tron-tinh-thuong.pdf ./pdf-generated/066-hon-con-khao-khat-chua.pdf ./pdf-generated/067-dong-doi-truong-ton.pdf ./pdf-generated/068-chua-la-gia-nghiep.pdf ./pdf-generated/069-nhin-len-chua.pdf ./pdf-generated/070-gieo-vao-trai-dat.pdf ./pdf-generated/071-chua-rat-nhan-hau.pdf ./pdf-generated/072-ai-duoc-cu-ngu.pdf ./pdf-generated/073-luat-phap-chua.pdf ./pdf-generated/074-chua-mo-tay-ban.pdf ./pdf-generated/075-con-keu-cau-chua.pdf ./pdf-generated/076-banh-boi-troi.pdf ./pdf-generated/077-vi-yeu-thuong.pdf ./pdf-generated/078-tinh-chua.pdf ./pdf-generated/079-toi-se-buoc-di.pdf ./pdf-generated/080-toi-se-choi-day.pdf ./pdf-generated/081-chua-song-ben-con.pdf ./pdf-generated/082-van-mang-con.pdf ./pdf-generated/083-ca-ngoi-chua.pdf ./pdf-generated/084-xin-hay-nho.pdf ./pdf-generated/085-gioi-luat-chua.pdf ./pdf-generated/086-ca-tung-chua.pdf ./pdf-generated/087-vuon-nho-cua-chua.pdf ./pdf-generated/088-hay-dang-len-chua.pdf ./pdf-generated/089-on-phu-tro.pdf ./pdf-generated/090-nguoi-la-nui-da.pdf ./pdf-generated/091-chua-doi-xu-dai-luong.pdf ./pdf-generated/092-xin-chua-giu-gin.pdf ./pdf-generated/093-thuc-giac-roi.pdf ./pdf-generated/094-duc-thanh-quan.pdf ./pdf-generated/095-thien-chua-chung-con.pdf ./pdf-generated/096-cong-trinh-cua-chua.pdf ./pdf-generated/098-dang-loi-ca.pdf ./pdf-generated/099-chen-hong-an.pdf ./pdf-generated/100-con-la-thuong-te.pdf ./pdf-generated/101-an-tinh-chua.pdf ./pdf-generated/102-nguon-cuu-do.pdf ./pdf-generated/103-vua-vinh-hien.pdf ./pdf-generated/104-chua-da-dung-nen-con.pdf ./pdf-generated/105-nu-hoang-ben-huu-thanh-vuong.pdf ./pdf-generated/106-dan-chua-hoi.pdf ./pdf-generated/107-theo-anh-sao.pdf ./pdf-generated/108-halleluia-mua-thuong-nien.pdf ./pdf-generated/109-dan-chua-hoi.pdf ./pdf-generated/110-ngan-loi-ca.pdf ./pdf-generated/111-cung-dang.pdf ./pdf-generated/112-chua-goi-con.pdf ./pdf-generated/114-me-van-yeu-thuong.pdf ./pdf-generated/115-kinh-lay-cha.pdf ./pdf-generated/115-phan-ket-kinh-nguyen-thanh-the.pdf ./pdf-generated/115-tuyen-tin.pdf ./pdf-generated/116-cau-dap-tung-ho.pdf -o songs.pdf


# add page numbers
pdflatex song-odd-even.tex

# combine all pdf files in name order
FRONTCOVER=./bia-truoc.pdf
REARCOVER=./bia-sau.pdf
BLANK=./blank-a4.pdf

/home/dhtu/Desktop/CATH/Software/cpdf-binaries-master/Linux-Intel-64bit/cpdf  ${FRONTCOVER} ${BLANK} song-odd-even.pdf ${BLANK} ${REARCOVER} -o song-book.pdf

exit 0

# adjiust even-odd page
pdfjam --twoside --paper a5paper --offset '0.5cm 0cm' song-book.pdf --outfile book-adjusted.pdf

FRONT=./covers/cover-front.pdf
INNER=./covers/cover-inner.pdf
BACK=./covers/cover-back.pdf
~/Desktop/software/cpdf  ${FRONT} ${INNER} ${BLANK} book-adjusted.pdf ${BACK} -o chants-in-english-mass.pdf
