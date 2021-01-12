#!/bin/bash
# developed by tfkhdyt
size(){
  sizeInput=$(ffprobe -i "$namaFileInput" -show_entries format=size -v quiet -of csv="p=0")
  sizeInputMB="scale=2; $sizeInput / 1048576"
  sizeInputFinal=$(echo $sizeInputMB | bc -l)
  sizeInputLast=$(echo "$sizeInputFinal MB")

  sizeOutput=$(ffprobe -i "$namaFileOutput" -show_entries format=size -v quiet -of csv="p=0")
  sizeOutputMB="scale=2; $sizeOutput / 1048576"
  sizeOutputFinal=$(echo $sizeOutputMB | bc -l)
  sizeOutputLast=$(echo "$sizeOutputFinal MB")

  echo "\n  [Original]   = $sizeInputLast"
  echo "  [Compressed] = $sizeOutputLast"
}

logo(){
  toilet -f smslant -F border -w 48 "Ultra Video Converter" | lolcat
}
proses(){
  clear
  case $pilihan in
    1)
      cd ../storage/shared
      while [ -z "$namaFileInput" ]; do
        browse(){
          toilet -f smslant -F border "Pilih video" | lolcat
          pwd -P
          tree -L 1
          echo "\n    [1] = Buka folder"
          echo "    [2] = Pilih file"
          echo "    [3] = Kembali ke menu utama\n"
          printf "  Pilih: "
          read exp
          if [ $exp -eq 1 ]; then
            echo "\n  * Tanpa tanda petik"
            echo "  .. untuk keluar folder"
            printf "\n  Nama folder: "
            read namaFolder
            cd "$namaFolder"
            clear
          elif [ $exp -eq 2 ]; then
            echo "\n  * Tanpa tanda petik"
            printf "  Nama file          : "
            read namaFileInput
            printf "  Simpan dengan nama : "
            read namaFileOutput
            clear
            konfirmasi(){
              toilet -f smslant -F border "Konfirmasi" | lolcat
              ptInput="$namaFileInput"
              ptOutput="$namaFileOutput"
              durasi=$(ffprobe -i "$namaFileInput" -show_entries format=duration -v quiet -of csv='p=0' -sexagesimal | sed -E 's/(:[0-9]+)\.[0-9]+/\1/g')
              echo "  Input  : $ptInput"
              echo "  Output : $ptOutput"
              echo "  Durasi : $durasi"
              sizeInput=$(ffprobe -i "$namaFileInput" -show_entries format=size -v quiet -of csv="p=0")
              sizeInputMB="scale=2; $sizeInput / 1048576"
              sizeInputFinal=$(echo $sizeInputMB | bc -l) 
              sizeInputLast=$(echo "$sizeInputFinal MB")
              echo "  Ukuran : ${sizeInputLast}\n"
              echo "  Apakah anda ingin memotong/trim videonya?"
              echo "    [1] Iya, trim video terlebih dahulu"
              echo "    [2] Tidak, langsung convert saja"
              echo "    [3] Batal"
              printf "\n  Pilih : "
              read exp2
              if [ $exp2 -eq 2 ]; then
                clear
                echo "Proses convert akan segera dimulai..."
                echo "Tekan q untuk membatalkan proses convert"
                sleep 3
                ffmpeg -i "$namaFileInput" -c:v libx265 -crf 27 -preset faster -c:a copy "$namaFileOutput"
                clear
                echo "Proses convert telah selesai!"
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
                  toilet -f smslant -F border "Trim" | lolcat
                  ptInput="$namaFileInput"
                  ptOutput="$namaFileOutput"
                  # durasi=$(ffprobe -i "$namaFileInput" -show_entries format=duration -v quiet -of csv='p=0' -sexagesimal | sed -E 's/(:[0-9]+)\.[0-9]+/\1/g')
                  echo "  Input  : $ptInput"
                  echo "  Output : $ptOutput"
                  echo "  Durasi : $durasi\n"
                  echo "  Isi dengan format 'jam:menit:detik'"
                  echo "  Contoh : 00:01:25\n"
                  printf "  Waktu mulai video   : "
                  read waktuMulai
                  waktuMulaiSec=$(echo $waktuMulai | awk -F: '{ print ($1 * 3600) + ($2 * 60) + $3 }')
                  waktuMulaiSec2=$(echo $waktuMulai | awk -F: '{ print ($1 * 3600) + ($2 * 60) + $3 - 1 }')
                  printf "  Waktu selesai video : "
                  read waktuSelesai
                  waktuSelesaiSec=$(echo $waktuSelesai | awk -F: '{ print ($1 * 3600) + ($2 * 60) + $3 }')
                  akhir=$(expr $waktuSelesaiSec - $waktuMulaiSec)
                  printf "\n  Mulai convert? (y/n) : "
                  read exp3
                  if [ "$exp3" = "y" ]; then
                    clear
                    echo "Proses convert akan segera dimulai..."
                    echo "Tekan q untuk membatalkan proses convert"
                    sleep 3
                    # ffmpeg -i "$namaFileInput" -ss "$waktuMulai" -to "$waktuSelesai" -c:v libx265 -crf 22 -preset faster -c:a copy "$namaFileOutput"
                    ffmpeg -ss $waktuMulaiSec2 -i "$namaFileInput" -ss 1 -t $akhir -c:v libx265 -crf 27 -preset faster -c:a copy "$namaFileOutput"
                    # ffmpeg -i temp.mp4 -c:v libx265 -crf 22 -preset faster -c:a copy "$namaFileOutput"
                    # rm temp.mp4
                    clear
                    echo "Proses convert telah selesai!"
                    size
                    cd ~
                    unset pilihan exp exp2 exp3 waktuMulai waktuSelesai namaFileInput namaFileOutput namaFolder sizeInput sizeOutput sizeInputMB sizeOutputMB sizeInputLast sizeOutputLast sizeOutputFinal sizeInputFinal
                    exit 
                  elif [ "$exp3" = "n" ]; then
                    clear
                    konfirmasi
                    echo "Input tidak valid"
                    trim
                  fi
                }
              trim
            else
              clear
              echo "Input tidak valid"
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
          echo "Input tidak valid"
          fi
        }
      browse
    done
    ;;
  2)
    clear
    cd ~/uvc
    unset pilihan exp exp2 exp3 waktuMulai waktuSelesai namaFileInput namaFileOutput namaFolder sizeInput sizeOutput sizeInputMB sizeOutputMB sizeInputLast sizeOutputLast sizeOutputFinal sizeInputFinal
    echo "Script berhasil diclose!"
    exit
    ;;
  *)
    cd ~/uvc
    clear
    echo "Input tidak valid!"
    menu
    ;;
esac
}
menu(){
  logo
  printf "  Menu: \n"
  printf "    [1] = Pilih video\n"
  printf "    [2] = Keluar\n\n"
  printf "  Pilih: "
  read pilihan
  proses
}
clear
menu
# developed by tfkhdyt
