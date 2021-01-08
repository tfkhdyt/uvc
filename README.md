# x265-converter-termux
Skrip untuk mengonversi video ke codec x265 dengan mudah menggunakan Termux.
Dengan codec x265, dapat membuat size videomu berkurang sampai ±90% tanpa mengurangi kualitas video.
Script ini memudahkan kalian untuk menjalankan command ffmpeg tanpa harus menulis command yang panjang.
<center>
<img src="https://img.shields.io/badge/Created%20by-tfkhdyt-blue?style=for-the-badge&logo=github"/>
</center>

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
git clone https://github.com/tfkhdyt/x265.git

# buka folder x265
cd x265

# jalankan installer
./install.sh

# mulai script dengan mengetik command berikut
x265

# cara force stop proses convert yaitu dengan tekan tombol ctrl + c
```

## Uninstall
##### Cara baru (x265 2.0)
`
uninstall-x265
`
##### Cara lama (x265 1.0)
```Shell
cd ~
sed -i '/x265/d' .zshrc
sed -i '/x265/d' ../usr/etc/bash.bashrc
rm -rf x265/
$SHELL
```

## Update
1. Uninstall
2. Install Ulang
:"v

## Screenshot
<img src=https://i.postimg.cc/xCFmvVwf/Screenshot-2021-01-08-10-06-32-17-84d3000e3f4017145260f7618db1d683.jpg height=100/> <img src=https://i.postimg.cc/XqRyPcNt/Screenshot-2021-01-08-10-06-54-45-84d3000e3f4017145260f7618db1d683.jpg height=100/> <img src=https://i.postimg.cc/yYRRZ5vK/Screenshot-2021-01-08-10-07-15-03-84d3000e3f4017145260f7618db1d683.jpg height=100/> <img src=https://i.postimg.cc/wxZJ3H5F/Screenshot-2021-01-08-10-07-31-91-84d3000e3f4017145260f7618db1d683.jpg height=100/> 
##### Hasil
<a href='https://postimages.org/' target='_blank'><img src='https://i.postimg.cc/HnCF789w/Screenshot-2021-01-04-20-01-29-24-db51e592e420a9871f4a37915a68789b.jpg' border='0' alt='Screenshot-2021-01-04-20-01-29-24-db51e592e420a9871f4a37915a68789b'/></a>

## Informasi lebih lanjut
Apabila ada yang mau ditanyakan soal skrip ini, bisa langsung pm ke saya lewat:
<a href="https://linktr.ee/tfkhdyt" target="_blank"><img src=https://img.shields.io/badge/Contact-me-green?style=flat-square/></a>
