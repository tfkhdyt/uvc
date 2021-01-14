#!/bin/bash
# developed by tfkhdyt
color(){
  R='\033[0;31m'
  NC='\033[0m' # No Color
  LG='\033[1;32m'
  Y='\033[1;33m'
  LB='\033[1;34m'
  G='\033[0;32m'
  B='\033[0;34m'
}
color
size(){
  sizeInput=$(ffprobe -i "$namaFileInput" -show_entries format=size -v quiet -of csv="p=0")
  sizeInputMB="scale=2; $sizeInput / 1048576"
  sizeInputFinal=$(echo $sizeInputMB | bc -l)
  sizeInputLast=$(echo "$sizeInputFinal MB")

  sizeOutput=$(ffprobe -i "$namaFileOutput" -show_entries format=size -v quiet -of csv="p=0")
  sizeOutputMB="scale=2; $sizeOutput / 1048576"
  sizeOutputFinal=$(echo $sizeOutputMB | bc -l)
  sizeOutputLast=$(echo "$sizeOutputFinal MB")

  echo "\n  ${NC}[Original]   = ${LB}$sizeInputLast"
  echo "  ${NC}[Compressed] = ${G}$sizeOutputLast"
}

logo(){
  toilet -f smslant -F border -w 48 "Ultra Video Converter" | lolcat -a -s 1600
}
proses(){
  clear
  case $pilihan in
    1)
      cd ../storage/shared
      while [ -z "$namaFileInput" ]; do
        browse(){
          toilet -f smslant -F border "Pilih video" | lolcat -a -s 1600
          pwd -P
          tree -L 1 -h -F
          echo "\n    [${LG}1${NC}] = Buka folder"
          echo "    [${LB}2${NC}] = Pilih file"
          echo "    [${R}3${NC}] = Kembali ke menu utama\n"
          printf "  Pilih: ${B}"
          read exp
          if [ $exp -eq 1 ]; then
            echo "\n  ${Y}* Tanpa tanda petik"
            echo "  ${Y}.. untuk keluar folder"
            printf "\n  ${NC}Nama folder: ${B}"
            read namaFolder
            cd "$namaFolder"
            clear
          elif [ $exp -eq 2 ]; then
            echo "\n  ${Y}* Tanpa tanda petik"
            printf "  ${NC}Nama file          : ${B}"
            read namaFileInput
            printf "  ${NC}Simpan dengan nama : ${B}"
            read namaFileOutput
            clear
            konfirmasi(){
              toilet -f smslant -F border "Konfirmasi" | lolcat -a -s 1600
              ptInput="$namaFileInput"
              ptOutput="$namaFileOutput"
              durasi=$(ffprobe -i "$namaFileInput" -show_entries format=duration -v quiet -of csv='p=0' -sexagesimal | sed -E 's/(:[0-9]+)\.[0-9]+/\1/g')
              echo "  ${NC}Input  : ${LB}$ptInput"
              echo "  ${NC}Output : ${LB}$ptOutput"
              echo "  ${NC}Durasi : ${LB}$durasi"
              sizeInput=$(ffprobe -i "$namaFileInput" -show_entries format=size -v quiet -of csv="p=0")
              sizeInputMB="scale=2; $sizeInput / 1048576"
              sizeInputFinal=$(echo $sizeInputMB | bc -l) 
              sizeInputLast=$(echo "$sizeInputFinal MB")
              echo "  ${NC}Ukuran : ${LB}${sizeInputLast}\n"
              echo "  ${NC}Apakah anda ingin memotong/trim videonya?"
              echo "    [${LG}1${NC}] = Iya, trim video terlebih dahulu"
              echo "    [${LB}2${NC}] = Tidak, langsung convert saja"
              echo "    [${R}3${NC}] = Batal"
              printf "\n  Pilih : ${B}"
              read exp2
              if [ $exp2 -eq 2 ]; then
                clear
                echo "${NC}Proses convert akan segera dimulai..."
                echo "${Y}Tekan q untuk membatalkan proses convert${NC}"
                sleep 3
                ffmpeg -i "$namaFileInput" -c:v libx265 -crf 25 -preset veryfast -c:a copy "$namaFileOutput"
                clear
                echo "${G}Proses convert telah selesai!"
                size
                cd ~
                unset pilihan exp exp2 exp3 waktuMulai waktuSelesai namaFileInput namaFileOutput namaFolder sizeInput sizeOutput sizeInputMB sizeOutputMB sizeInputLast sizeOutputLast sizeOutputFinal sizeInputFinal

                exit
              elif [ $exp2 -eq 3 ]; then
                clear
                unset exp exp2 namaFileInput namaFileOutput namaFolder
                browse
              elif [ $exp2 -eq 1 ]; then
                clear
                trim(){
                  toilet -f smslant -F border "Trim" | lolcat -a -s 1600
                  ptInput="$namaFileInput"
                  ptOutput="$namaFileOutput"
                  # durasi=$(ffprobe -i "$namaFileInput" -show_entries format=duration -v quiet -of csv='p=0' -sexagesimal | sed -E 's/(:[0-9]+)\.[0-9]+/\1/g')
                  echo "  ${NC}Input  : ${LB}$ptInput"
                  echo "  ${NC}Output : ${LB}$ptOutput"
                  echo "  ${NC}Durasi : ${LB}$durasi\n"
                  echo "  ${NC}Isi dengan format '${Y}jam:menit:detik${NC}'"
                  echo "  Contoh : ${Y}00:01:25\n"
                  printf "  ${NC}Waktu mulai video   : ${B}"
                  read waktuMulai
                  waktuMulaiSec=$(echo $waktuMulai | awk -F: '{ print ($1 * 3600) + ($2 * 60) + $3 }')
                  waktuMulaiSec2=$(echo $waktuMulai | awk -F: '{ print ($1 * 3600) + ($2 * 60) + $3 - 1 }')
                  printf "  ${NC}Waktu selesai video : ${B}"
                  read waktuSelesai
                  waktuSelesaiSec=$(echo $waktuSelesai | awk -F: '{ print ($1 * 3600) + ($2 * 60) + $3 }')
                  akhir=$(expr $waktuSelesaiSec - $waktuMulaiSec)
                  printf "\n  ${NC}Mulai convert? (${G}y${NC}/${R}n${NC}) : "
                  read exp3
                  if [ "$exp3" = "y" ]; then
                    clear
                    echo "${NC}Proses convert akan segera dimulai..."
                    echo "${Y}Tekan q untuk membatalkan proses convert${NC}"
                    sleep 3
                    # ffmpeg -i "$namaFileInput" -ss "$waktuMulai" -to "$waktuSelesai" -c:v libx265 -crf 22 -preset veryfast -c:a copy "$namaFileOutput"
                    ffmpeg -ss $waktuMulaiSec2 -i "$namaFileInput" -ss 1 -t $akhir -c:v libx265 -crf 25 -preset veryfast -c:a copy "$namaFileOutput"
                    # ffmpeg -i temp.mp4 -c:v libx265 -crf 22 -preset veryfast -c:a copy "$namaFileOutput"
                    # rm temp.mp4
                    clear
                    echo "${G}Proses convert telah selesai!"
                    size
                    cd ~
                    unset pilihan exp exp2 exp3 waktuMulai waktuSelesai namaFileInput namaFileOutput namaFolder sizeInput sizeOutput sizeInputMB sizeOutputMB sizeInputLast sizeOutputLast sizeOutputFinal sizeInputFinal
                    exit 
                  elif [ "$exp3" = "n" ]; then
                    clear
                    konfirmasi
                    echo "${R}Input tidak valid"
                    trim
                  fi
                }
              trim
            else
              clear
              echo "${R}Input tidak valid"
              konfirmasi
              fi
            }
          konfirmasi
        elif [ $exp -eq 3 ]; then
          cd ~/uvc
          clear
          unset pilihan exp exp2 exp3 waktuMulai waktuSelesai namaFileInput namaFileOutput namaFolder sizeInput sizeOutput sizeInputMB sizeOutputMB sizeInputLast sizeOutputLast sizeOutputFinal sizeInputFinal
          menu
        else
          clear
          echo "${R}Input tidak valid"
          fi
        }
      browse
    done
    ;;
  2)
    clear
    cd ~/uvc
    unset pilihan exp exp2 exp3 waktuMulai waktuSelesai namaFileInput namaFileOutput namaFolder sizeInput sizeOutput sizeInputMB sizeOutputMB sizeInputLast sizeOutputLast sizeOutputFinal sizeInputFinal
    echo "${G}Script berhasil diclose!"
    sleep 1
    clear
    exit
    ;;
  *)
    cd ~/uvc
    clear
    echo "${R}Input tidak valid!"
    menu
    ;;
esac
}
menu(){
  logo
  printf "  Menu: \n"
  printf "    [${LG}1${NC}] = Pilih video\n"
  printf "    [${R}2${NC}] = Keluar\n\n"
  printf "  Pilih: ${B}"
  read pilihan
  proses
}
clear
menu
# developed by tfkhdyt
