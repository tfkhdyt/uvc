# x265-converter-termux
Skrip untuk mengonversi video ke codec x265 dengan mudah dengan Termux.
Dengan codec x265, dapat membuat size videomu berkurang sampai ±90% tanpa mengurangi kualitas video.
Script ini memudahkan kalian untuk menjalankan command ffmpeg tanpa harus menulis command yang panjang.

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
<a href="https://postimg.cc/pmxLxh6r" target="_blank"><img src="https://i.postimg.cc/pmxLxh6r/Screenshot-2021-01-07-16-57-50-01-84d3000e3f4017145260f7618db1d683.jpg" alt="Screenshot-2021-01-07-16-57-50-01-84d3000e3f4017145260f7618db1d683"/></a> <a href="https://postimg.cc/kVYJxjXR" target="_blank"><img src="https://i.postimg.cc/kVYJxjXR/Screenshot-2021-01-07-16-58-17-11-84d3000e3f4017145260f7618db1d683.jpg" alt="Screenshot-2021-01-07-16-58-17-11-84d3000e3f4017145260f7618db1d683"/></a> <a href="https://postimg.cc/WFD2SMhW" target="_blank"><img src="https://i.postimg.cc/WFD2SMhW/Screenshot-2021-01-07-16-58-54-60-84d3000e3f4017145260f7618db1d683.jpg" alt="Screenshot-2021-01-07-16-58-54-60-84d3000e3f4017145260f7618db1d683"/></a> <a href="https://postimg.cc/sMcD2jkc" target="_blank"><img src="https://i.postimg.cc/sMcD2jkc/Screenshot-2021-01-07-16-59-00-00-84d3000e3f4017145260f7618db1d683.jpg" alt="Screenshot-2021-01-07-16-59-00-00-84d3000e3f4017145260f7618db1d683"/></a> 

## Informasi lebih lanjut
Apabila ada yang mau ditanyakan soal skrip ini, bisa langsung pm ke saya lewat:
<a href="https://linktr.ee/tfkhdyt" target="_blank">Contact me!</a>
