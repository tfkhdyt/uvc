# Ultra Video Converter
Skrip untuk mengonversi video ke codec x265 dengan mudah menggunakan Termux.
Dengan codec x265, dapat membuat size videomu berkurang sampai ±50% tanpa mengurangi kualitas video.
Skrip ini memudahkan kalian untuk menjalankan command ffmpeg tanpa harus menulis command yang panjang.
<p align=center>
<img src="https://img.shields.io/badge/Created%20by-tfkhdyt-blue?style=for-the-badge&logo=github"/><br>
<a href="Https://facebook.com/tfkhdyt142"><img height="30" src="https://www.pinclipart.com/picdir/big/2-21918_download-transparent-background-facebook-logo-clipart-facebook-logo.png"></a>&nbsp;
<a href="https://twitter.com/tfkhdyt"><img height="30" src="https://www.pinclipart.com/picdir/big/64-649167_the-pairings-twitter-icon-rounded-square-clipart.png"></a>&nbsp;
<a href="https://instagram.com/_tfkhdyt_"><img height="30" src="https://camo.githubusercontent.com/5cf2a148d1763dca531d1d43bdf234b4e57ee2e00f613589e6d307ccd1077a9f/68747470733a2f2f7777772e70696e636c69706172742e636f6d2f7069636469722f6269672f3130392d313039393330315f696e7374616772616d2d696e7374616772616d2d6c6f676f2d6e6f2d626f726465722d636c69706172742e706e67"></a>&nbsp;
<a href="https://youtube.com/tfkhdyt"><img height="30" src="https://www.pinclipart.com/picdir/big/530-5305952_youtube-computer-icons-portable-network-graphics-logo-logo.png"></a>&nbsp;
<a href="https://t.me/tfkhdyt"><img height="30" src="https://cdn4.iconfinder.com/data/icons/social-media-2146/512/37_social-512.png"></a>&nbsp;
<a href="https://open.spotify.com/playlist/4JR5wqcnuOQw6ppF38Vpu9?si=zHMKBfCiRrGVamKsL8LXqQ"><img height="30" src="https://cdn2.iconfinder.com/data/icons/social-icons-33/128/Spotify-512.png"></a>
</p>

## Disclaimer
Saya tidak menjamin video yang kalian convert ukurannya akan menjadi lebih kecil, karena hasil akhir akan sangat berpengaruh dari video asli. Jadi jangan heran jika suatu saat size hasil convert malah lebih besar dari size video asli 

## Requirements
- `Termux`
- `git (pkg install git)`
- `Koneksi internet (Hanya untuk instalasi dependencies, proses convert tetap dilakukan secara offline)`

## Instalasi
```Shell
# mengizinkan termux mengakses storage
termux-setup-storage
# kemudian pilih y

# cloning source code
git clone https://github.com/tfkhdyt/uvc.git

# buka folder uvc
cd uvc

# jalankan installer
./install.sh

# mulai script dengan mengetik command berikut
uvc

# cara force stop proses convert yaitu dengan tekan tombol ctrl + c
```

## Uninstall
##### Cara baru
`
uninstall-uvc
`
##### Cara lama
```Shell
cd ~
sed -i '/uvc/d' .zshrc
sed -i '/uvc/d' ../usr/etc/bash.bashrc
rm -rf uvc/
$SHELL
```

## Update
##### Cara baru
`update-uvc`

##### Cara lama
```Shell
cd ~/uvc
git pull
```

## Screenshot
<img src=https://i.postimg.cc/4dmyt75S/Screenshot-2021-01-08-21-41-31-55-84d3000e3f4017145260f7618db1d683.jpg height=100/> <img src=https://i.postimg.cc/XqRyPcNt/Screenshot-2021-01-08-10-06-54-45-84d3000e3f4017145260f7618db1d683.jpg height=100/> <img src=https://i.postimg.cc/yYRRZ5vK/Screenshot-2021-01-08-10-07-15-03-84d3000e3f4017145260f7618db1d683.jpg height=100/> <img src=https://i.postimg.cc/wxZJ3H5F/Screenshot-2021-01-08-10-07-31-91-84d3000e3f4017145260f7618db1d683.jpg height=100/> 
##### Hasil
<a href='https://postimages.org/' target='_blank'><img src='https://i.postimg.cc/HnCF789w/Screenshot-2021-01-04-20-01-29-24-db51e592e420a9871f4a37915a68789b.jpg' border='0' alt='Screenshot-2021-01-04-20-01-29-24-db51e592e420a9871f4a37915a68789b'/></a>

## Informasi lebih lanjut
Apabila ada yang mau ditanyakan soal skrip ini, bisa langsung pm saya:
<p align=center>
<a href="https://linktr.ee/tfkhdyt" target="_blank"><img src="https://img.shields.io/badge/Contact-me-green?style=for-the-badge"/></a>
</p>
