CREATE DATABASE akademik;
USE akademik;

CREATE TABLE mahasiswa (
nim CHAR (12) NOT NULL PRIMARY KEY,
nama VARCHAR (225) NOT NULL,
alamat TEXT,`dosen``dosen`
programStudi VARCHAR(100)
);

CREATE TABLE dosen(
nip CHAR (12) NOT NULL PRIMARY KEY,
nama VARCHAR(100),
keahlian VARCHAR(100),
email VARCHAR(100)
)

CREATE TABLE matakuliah(
kodeMK  CHAR (10) PRIMARY KEY,
namaMK VARCHAR (100),
sks INT (3),
nip CHAR (12),
FOREIGN KEY (nip) REFERENCES dosen(nip)
);

CREATE TABLE krs(
idKRS INT AUTO_INCREMENT PRIMARY KEY,
nim CHAR (12),
kodeMK CHAR (10),
semester INT,
FOREIGN KEY (nim) REFERENCES mahasiswa(nim),
FOREIGN KEY (kodeMK) REFERENCES matakuliah(kodeMK)
);

CREATE TABLE nilai (
    idNilai INT AUTO_INCREMENT PRIMARY KEY,
    idKRS INT,
    nilai CHAR(2),
    grade VARCHAR(10),
    FOREIGN KEY (idKRS) REFERENCES kartuStudi(idKRS)
);

INSERT INTO mahasiswa VALUES
('2201010001', 'Budi Santoso', 'Jakarta', 'Teknik Informatika'),
('2201010002', 'Ani Suryani', 'Bandung', 'Sistem Informasi'),
('2201010003', 'Joko Widodo', 'Surabaya', 'Teknik Komputer'),
('2201010004', 'Siti Aisyah', 'Malang', 'Manajemen Informatika'),
('2201010005', 'Ahmad Fadilah', 'Medan', 'Teknik Informatika'),
('2201010006', 'Rina Kartika','Palembang', 'Sistem Informasi'),
('2201010007', 'Doni Pratama','Yogyakarta', 'Teknik Komputer'),
('2201010008', 'Lia Rahmawati','Semarang', 'Manajemen Informatika'),
('2201010009', 'Indra Saputra','Denpasar', 'Teknik Informatika'),
('2201010010', 'Citra Lestari','Makassar', 'Sistem Informasi');

INSERT INTO dosen VALUES
('198001012021', 'Dr. Sugeng Wijaya', 'Basis Data', 'sugeng@univ.ac.id'),
('197512062022', 'Dr. Rina Sari', 'Jaringan Komputer', 'rina@univ.ac.id'),
('198203251983', 'Prof. Budi Dharma', 'Kecerdasan Buatan', 'budi@univ.ac.id'),
('198707112014', 'Dr. Anita Puspita', 'Pemrograman Web', 'anita@univ.ac.id'),
('197909302005', 'Dr. Didi Wahyudi', 'Keamanan Informasi', 'didi@univ.ac.id'),
('166909608006', 'Dr. Teddy Indra', 'Data Mining', 'teddy@univ.ac.id'),
('157908802007', 'Dr. Wahyudi Setiawan', 'Algoritma Pemrograman', 'wahyudi@univ.ac.id'),
('148900809008', 'Prof. Aery Rachmad', 'PTIK', 'aeri@univ.ac.id'),
('127090708909', 'Prof. Yahya Ahmad', 'Pemrograman Berbasis Web', 'yahya@univ.ac.id'),
('139800799010', 'Dr. A Mujaddid Bilhaq', 'Pemrograman Berbasis Objek', 'jadid@univ.ac.id');

INSERT INTO MataKuliah VALUES
('MK001', 'Basis Data', 3, '198001012021'),
('MK002', 'Jaringan Komputer', 3, '197512062022'),
('MK003', 'Kecerdasan Buatan', 4, '198203251983'),
('MK004', 'Pemrograman Web', 3, '198707112014'),
('MK005', 'Keamanan Informasi', 3, '197909302005'),
('MK006', 'Algoritma dan Pemrograman', 4, '157908802007'),
('MK007', 'Struktur Data', 3, '198001012021'),
('MK008', 'Sistem Operasi', 3, '197512062022'),
('MK009', 'Manajemen Basis Data', 3, '198001012021'),
('MK010', 'Pemrograman Mobile', 3, '198707112014');

INSERT INTO KRS (nim, kodeMK, semester) VALUES
('2201010001', 'MK001', 1),
('2201010002', 'MK002', 1),
('2201010003', 'MK003', 1),
('2201010004', 'MK004', 2),
('2201010005', 'MK005', 2);

SELECT nama FROM dosen WHERE nip="127090708909"

SELECT * FROM dosen
SELECT * FROM matakuliah
SELECT * FROM mahasiswa
SELECT * FROM krs

ALTER TABLE krs RENAME TO kartuStudi;

SELECT * FROM kartuStudi

INSERT INTO nilai (idKRS, nilai, grade) VALUES
(21, 'A', 'Lulus'),
(22, 'B', 'Lulus'),
(23, 'A', 'Lulus'),
(24, 'C', 'Lulus'),
(25, 'D', 'Tidak Lulus');

SELECT * FROM nilai

DROP DATABASE akademik;

DELETE FROM dosen WHERE nip="127090708909" 

UPDATE dosen SET nama="Ahmad Yahya", keahlian="Pember" WHERE nip="127090708909";

DROP DATABASE akademik;

SELECT d.nama AS Nama_Dosen, mk.namaMK AS Mata_Kuliah
FROM dosen d
JOIN matakuliah mk ON d.nip = mk.nip
ORDER BY d.nama;

