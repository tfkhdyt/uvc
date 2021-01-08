#!/bin/bash
# developed by tfkhdyt
logo(){
  toilet -f small -F border "FFMPEG  x265" | lolcat
}
proses(){
clear
case $pilihan in
  1)
  cd ../storage/shared
  while [ -z "$namaFileInput" ]; do
   toilet -f small -F border "Pilih video" | lolcat
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
      printf "  Nama file: "
      read namaFileInput
      printf "  Simpan dengan nama: "
      read namaFileOutput
      clear
      toilet -f small -F border "Konfirmasi" | lolcat
      ptInput="$namaFileInput"
      ptOutput="$namaFileOutput"
      echo "  Input : $ptInput"
      echo "  Output: $ptOutput\n"
      printf "  Mulai convert?(y/n): "
      read exp2
      if [ "$exp2" = "y" ]; then
        clear
        ffmpeg -i "$namaFileInput" -c:v libx265 -crf 25 -c:a copy "$namaFileOutput"
      elif [ "$exp2" = "n" ]; then
        cd ~/x265
        clear
        unset pilihan
        unset exp
        unset exp2
        unset namaFileInput
        unset namaFileOutput
        unset namaFolder
        menu
      else
       cd ~/x265
       clear
       unset pilihan
        unset exp
        unset exp2
        unset namaFileInput
        unset namaFileOutput
        unset namaFolder
       menu
      fi
     elif [ $exp -eq 3 ]; then
       cd ~/x265
       clear
       unset pilihan
        unset exp
        unset exp2
        unset namaFileInput
        unset namaFileOutput
        unset namaFolder
       menu
      else
        clear
        echo "Input tidak valid"
    fi
  done
    ;;
  2)
    clear
    cd ~/x265
    unset pilihan
    unset exp
    unset exp2
    unset namaFileInput
    unset namaFileOutput
    unset namaFolder
    echo "Script berhasil diclose"
    exit
    ;;
  *)
    cd ~/x265
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
