CREATE DATABASE bengkel;
USE bengkel;

CREATE TABLE Pelanggan (
    id_pelanggan INT AUTO_INCREMENT PRIMARY KEY,
    nama_pelanggan VARCHAR(100),
    no_telepon VARCHAR(15),
    alamat TEXT,
    email VARCHAR(100)
);

CREATE TABLE Kendaraan (
    id_kendaraan INT AUTO_INCREMENT PRIMARY KEY,
    id_pelanggan INT,
    no_polisi VARCHAR(20),
    merk VARCHAR(50),
    tipe VARCHAR(50),
    tahun INT,
    warna VARCHAR(30),
    FOREIGN KEY (id_pelanggan) REFERENCES Pelanggan(id_pelanggan)
);

CREATE TABLE Layanan (
    id_layanan INT AUTO_INCREMENT PRIMARY KEY,
    nama_layanan VARCHAR(100),
    deskripsi TEXT,
    harga DECIMAL(10,2)
);

CREATE TABLE Montir (
    id_montir INT AUTO_INCREMENT PRIMARY KEY,
    nama_montir VARCHAR(100),
    spesialisasi VARCHAR(100),
    no_hp VARCHAR(15)
);

CREATE TABLE Servis (
    id_servis INT AUTO_INCREMENT PRIMARY KEY,
    id_pelanggan INT,
    id_kendaraan INT,
    tanggal_masuk DATE,
    tanggal_keluar DATE,
    STATUS ENUM('antrian', 'proses', 'selesai', 'dibatalkan'),
    total_biaya DECIMAL(12,2),
    FOREIGN KEY (id_pelanggan) REFERENCES Pelanggan(id_pelanggan),
    FOREIGN KEY (id_kendaraan) REFERENCES Kendaraan(id_kendaraan)
);

CREATE TABLE Detail_Servis (
    id_detail_servis INT AUTO_INCREMENT PRIMARY KEY,
    id_servis INT,
    id_layanan INT,
    jumlah INT,
    subtotal DECIMAL(10,2),
    FOREIGN KEY (id_servis) REFERENCES Servis(id_servis),
    FOREIGN KEY (id_layanan) REFERENCES Layanan(id_layanan)
);

CREATE TABLE Penugasan_Montir (
    id_penugasan INT AUTO_INCREMENT PRIMARY KEY,
    id_servis INT,
    id_montir INT,
    catatan_pekerjaan TEXT,
    FOREIGN KEY (id_servis) REFERENCES Servis(id_servis),
    FOREIGN KEY (id_montir) REFERENCES Montir(id_montir)
);

SELECT * FROM Pelanggan
SELECT * FROM Kendaraan
SELECT * FROM Layanan
SELECT * FROM Servis
SELECT * FROM Detail_Servis
SELECT * FROM Penugasan_Montir
SELECT * FROM Montir
