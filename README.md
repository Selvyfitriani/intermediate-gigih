# intermediate-gigih
This repo created for ruby project to accomodate tasks in Generasi Gigih intermediate class 

Name: Selvy Fitriani
User Id: GBE01137

# Catatan 14 Juli

## Kenapa Database?
Karena kita tidak ingin data kita hilang ketika aplikasi di-restart. Database is a collection of information
that is organized so data can be stored, managed, retrieve.

### SQL: Structured Query Language
SQL adalah bahasa yang dibuat oleh IBM.

### MySQL
Salah satu database yang menggunakan SQL & open-source.

## Entity
Entitas adalah sesuatu yang bisa diidentifikasi dan memiliki properti-properti (atribut).
Didalam basis data, entitas adalah tabel, atribut adalah kolom. Sementara instance dari entitas adalah baris.

### How to indetify Entity?
Entitas diidentifikasi dengan key. Key dapat berasalh dari properti yang unik atau gabungan dari beberapa properti yang unik.

### Primary Key
Unique, never null, never changing. Perlu hati-hati juga dalam memilih primary key. Misalnya NIK, nilainya
memang memenuhi primary key, tapi NIK merupakan data yang bersifat privasi dan apabila NIK tersebut
harus masuk ke url maka tentu berbahaya (masalah keamanan). 
