-- Nomor 1
DELIMITER //
CREATE PROCEDURE UpdateDataMaster (
    IN p_id INT,
    IN p_nama_baru VARCHAR(100),
    OUT p_status VARCHAR(50)
)
BEGIN
    DECLARE v_exists INT;
    SELECT COUNT(*) INTO v_exists
    FROM Pelanggan
    WHERE id_pelanggan = p_id;
    IF v_exists > 0 THEN
        UPDATE Pelanggan
        SET nama_pelanggan = p_nama_baru
        WHERE id_pelanggan = p_id;
        SET p_status = 'Berhasil diperbarui';
    ELSE
        SET p_status = 'Data tidak ditemukan';
    END IF;
END;
//
DELIMITER ;


SET @status_msg = '';
CALL UpdateDataMaster(1, 'Yahya Saputra', @status_msg);
SELECT @status_msg AS STATUS;

-- akhir 1

-- Nomor 2
DELIMITER //
CREATE OR REPLACE PROCEDURE CountTransaksi (
    OUT jumlah_transaksi INT
)
BEGIN
    SELECT COUNT(*) INTO jumlah_transaksi FROM Servis;
END;
//
DELIMITER ;

CALL CountTransaksi(@jumlah);
SELECT @jumlah AS Jumlah_Transaksi;
-- Akhir 2


-- Nomor 3
DELIMITER //
CREATE PROCEDURE GetDataMasterByID (
    IN p_id INT,
    OUT p_nama VARCHAR(100),
    OUT p_email VARCHAR(100)
)
BEGIN
    SELECT nama_pelanggan, email
    INTO p_nama, p_email
    FROM Pelanggan
    WHERE id_pelanggan = p_id;
END;
//
DELIMITER ;

CALL GetDataMasterByID(1, @nama, @email);
SELECT @nama AS Nama_Pelanggan, @email AS Email;
-- Akhir 3

-- Nomor 4
DELIMITER //
CREATE PROCEDURE UpdateFieldTransaksi (
    IN p_id INT,
    INOUT p_tanggal_keluar DATE,
    INOUT p_status ENUM('antrian', 'proses', 'selesai', 'dibatalkan')
)
BEGIN
    DECLARE v_tanggal DATE;
    DECLARE v_status ENUM('antrian', 'proses', 'selesai', 'dibatalkan');

    SELECT tanggal_keluar, STATUS
    INTO v_tanggal, v_status
    FROM Servis
    WHERE id_servis = p_id;

    IF p_tanggal_keluar IS NULL THEN
        SET p_tanggal_keluar = v_tanggal;
    END IF;

    IF p_status IS NULL THEN
        SET p_status = v_status;
    END IF;

    UPDATE Servis
    SET tanggal_keluar = p_tanggal_keluar,
        STATUS = p_status
    WHERE id_servis = p_id;
END;
//
DELIMITER ;

SET @tanggal = '2025-05-05'; 
SET @status = 'selesai';     
CALL UpdateFieldTransaksi(5, @tanggal, @status);

SELECT * FROM servis;

-- Akhir 4

-- Nomor 5
DELIMITER //
CREATE PROCEDURE DeleteEntriesByIDMaster (
    IN p_id INT
)
BEGIN
    DELETE FROM Penugasan_Montir
    WHERE id_servis IN (
        SELECT id_servis FROM Servis WHERE id_pelanggan = p_id
    );

    DELETE FROM Detail_Servis
    WHERE id_servis IN (
        SELECT id_servis FROM Servis WHERE id_pelanggan = p_id
    );

    DELETE FROM Servis WHERE id_pelanggan = p_id;

    DELETE FROM Kendaraan WHERE id_pelanggan = p_id;

    DELETE FROM Pelanggan WHERE id_pelanggan = p_id;
END;
//
DELIMITER ;

CALL DeleteEntriesByIDMaster(3);

SELECT * FROM servis;

-- Akhir 5