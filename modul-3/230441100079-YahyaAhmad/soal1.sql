-- Nomor satuuuu coy
DELIMITER //
CREATE PROCEDURE AddUMKM (
    IN p_nama_usaha VARCHAR(200),
    IN p_jumlah_karyawan INT
)
BEGIN
    INSERT INTO umkm (nama_usaha, jumlah_karyawan, tanggal_registrasi)
    VALUES (p_nama_usaha, p_jumlah_karyawan, CURDATE());
END //
DELIMITER ;

CALL AddUMKM('Usaha Baru Jaya', 5);

SELECT * FROM umkm;
-- akhir nomor 1 ges

-- Nomor 2 ngab
DELIMITER //
CREATE PROCEDURE UpdateKategoriUMKM (
    IN p_id_kategori INT,
    IN p_nama_baru VARCHAR(100)
)
BEGIN
    UPDATE kategori_umkm
    SET nama_kategori = p_nama_baru
    WHERE id_kategori = p_id_kategori;
END //
DELIMITER ;

CALL UpdateKategoriUMKM(1, 'Kuliner Tradisional');

SELECT * FROM kategori_umkm;
-- akhir nomor 2 ngab

-- nomor 3
DELIMITER //
CREATE OR REPLACE PROCEDURE DeletePemilikUMKM (
    IN p_id_pemilik INT
)
BEGIN
    DELETE FROM pemilik_umkm
    WHERE id_pemilik = p_id_pemilik;
END //
DELIMITER ;

CALL DeletePemilikUMKM(15)
-- Akhir nomor 3

-- Nomor 4
DELIMITER //
CREATE PROCEDURE AddProduk (
    IN p_id_umkm INT,
    IN p_nama_produk VARCHAR(200),
    IN p_harga DECIMAL(15,2)
)
BEGIN
    INSERT INTO produk_umkm (id_umkm, nama_produk, harga)
    VALUES (p_id_umkm, p_nama_produk, p_harga);
END //
DELIMITER ;

CALL AddProduk(1, 'Sambal Terasi Botolan', 15000.00);

SELECT * FROM produk_umkm;
-- Akhir 4

-- Nomor 5 ngabbbb
DELIMITER //
CREATE PROCEDURE GetUMKMByID (
    IN p_id_umkm INT,
    OUT p_nama_usaha VARCHAR(200)
)
BEGIN
    SELECT nama_usaha
    INTO p_nama_usaha
    FROM umkm
    WHERE id_umkm = p_id_umkm;
END //
DELIMITER ;

SET @nama := '';
CALL GetUMKMByID(1, @nama);
SELECT @nama;
-- Akhir 5