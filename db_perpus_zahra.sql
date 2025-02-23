create database db_perpus;
use db_perpus;
create table buku(
id_buku int primary key auto_increment,
judul_buku varchar(50),
penulis varchar(50),  
kategori varchar(50),
stock int);

create table  siswa(
id_siswa int  primary key auto_increment,
nama varchar(50),
kelas varchar(50));

use db_perpus;


CREATE TABLE peminjaman (
  id_peminjaman int primary key auto_increment,
  id_buku int ,
  id_siswa int(11) ,
  tanggal_pinjam date ,
  tanggal_kembali date,
  status varchar(50));

use db_perpus;
 
INSERT INTO buku (judul_buku, penulis, kategori, stock) VALUES  
('Algoritma dan Pemrograman', 'Andi Wijaya', 'Teknologi', 5);

INSERT INTO buku (judul_buku, penulis, kategori, stock) VALUES
('Dasar-dasar Database', 'Budi Santoso', 'Teknologi', 7),
('Matematika Diskrit', 'Rina Sari', 'Matematika', 4),
('Sejarah Dunia', 'John Smith', 'Sejarah', 3),
('Pemograman', 'Eko Prasetyo', 'Teknologi', 8);

use db_perpus;

INSERT INTO siswa(nama, kelas) VALUES
('Andi Saputra', 'X-RPL'),
('Budi Wijaya', 'X-TKJ'),
('Citra Lestari', 'XI-RPL'),
('Dewi Kurniawan', 'XI-TKJ'),
('Eko Prasetyo', 'XII-RPL');
use db_perpus;
INSERT INTO peminjaman (id_siswa, id_buku, tanggal_pinjam, tanggal_kembali, status) VALUES
(11, 2, '2025-02-01', '2025-02-08', 'Dipinjam'),
(2, 5, '2025-01-28', '2025-02-04', 'Dikembalikan'),
(3, 8, '2025-02-02', '2025-02-09', 'Dipinjam'),
(4, 10, '2025-01-30', '2025-02-06', 'Dikembalikan'),
(5, 3, '2025-01-25', '2025-02-01', 'Dikembalikan');


DELIMITER //
create procedure insert_buku(
pJudulBuku varchar(50),
pPenulis varchar(50),
pKategori varchar(50),
pStok int)
BEGIN
INSERT INTO buku (judul_buku,penulis,kategori,stock) values (pJudulBuku,pPenulis,pKategori,pStok);
END //

use db_perpus;
	CALL insert_buku('Sistem Operasi', 'Dian Kurniawan', 'Teknologi', 6);
	CALL insert_buku('Jaringan Komputer', 'Ahmad Fauzi', 'Teknologi', 5);
	CALL insert_buku('Cerita Rakyat Nusantara', 'Lestari Dewi', 'Sastra', 9);
	CALL insert_buku('Bahasa Inggris untuk Pemula', 'Jane Doe', 'Bahasa', 10);
	CALL insert_buku('Biologi Dasar', 'Budi Rahman', 'Sains', 7);
	CALL insert_buku('Kimia Organik', 'Siti Aminah', 'Sains', 5);
	CALL insert_buku('Teknik Elektro', 'Ridwan Hakim', 'Teknik', 6);
	CALL insert_buku('Fisika Modern', 'Albert Einstein', 'Sains', 4);
	CALL insert_buku('Manajemen Waktu', 'Steven Covey', 'Pengembangan', 8);
	CALL insert_buku('Strategi Belajar Efektif', 'Tony Buzan', 'Pendidikan', 6);
use db_perpus;
TRUNCATE TABLE siswa;
SET SQL_SAFE_UPDATES = 0;
SHOW INDEX FROM siswa;
ALTER TABLE siswa ADD INDEX id_kelas(kelas);
DROP TABLE IF EXISTS siswa;

TRUNCATE TABLE siswa;
select*from siswa;
SET SQL_SAFE_UPDATES = 1;

DELETE FROM siswa WHERE kelas = 'X-RPL';

DELIMITER $$
CREATE PROCEDURE insert_peminjaman(
    pIdSiswa INT,
    pIdBuku INT,
    pTanggalPinjam DATE,
    pTanggalKembali DATE,
    pStatus VARCHAR(20)
)
BEGIN
    INSERT INTO peminjaman (id_siswa, id_buku, tanggal_pinjam, tanggal_kembali, status) 
    VALUES (pIdSiswa, pIdBuku, pTanggalPinjam, pTanggalKembali, pStatus);
END $$
DELIMITER ;

CALL insert_peminjaman(6, 15, '2025-02-01', '2025-02-08', 'Dipinjam');
CALL insert_peminjaman(7, 1, '2025-01-29', '2025-02-05', 'Dikembalikan');
CALL insert_peminjaman(8, 9, '2025-02-03', '2025-02-10', 'Dipinjam');
CALL insert_peminjaman(9, 13, '2025-01-27', '2025-02-03', 'Dikembalikan');
CALL insert_peminjaman(10, 11, '2025-02-01', '2025-02-08', 'Dipinjam');
CALL insert_peminjaman(3, 7, '2025-02-04', '2025-02-11', 'Dipinjam');
CALL insert_peminjaman(5, 2, '2025-01-26', '2025-02-02', 'Dikembalikan');
CALL insert_peminjaman(1, 4, '2025-02-05', '2025-02-12', 'Dipinjam');
CALL insert_peminjaman(2, 8, '2025-02-06', '2025-02-13', 'Dipinjam');
CALL insert_peminjaman(4, 10, '2025-02-07', '2025-02-14', 'Dipinjam');

DELIMITER $$
CREATE PROCEDURE insert_siswa(
    pNama VARCHAR(100),
    pKelas VARCHAR(10)
)
BEGIN
    INSERT INTO siswa (nama, kelas) 
    VALUES (pNama, pKelas);
END $$
DELIMITER ;

CALL insert_siswa('Farhan Maulana', 'XII-TKJ');
CALL insert_siswa('Gita Permata', 'X-RPL');
CALL insert_siswa('Hadi Sucipto', 'X-TKJ');
CALL insert_siswa('Intan Permadi', 'XI-RPL');
CALL insert_siswa('Joko Santoso', 'XI-TKJ');
CALL insert_siswa('Kartika Sari', 'XII-RPL');
CALL insert_siswa('Lintang Putri', 'XII-TKJ');
CALL insert_siswa('Muhammad Rizky', 'X-RPL');
CALL insert_siswa('Novi Andriana', 'X-TKJ');
CALL insert_siswa('Olivia Hernanda', 'XI-RPL');
select*from siswa;
DELIMITER $$
CREATE PROCEDURE update_buku(
    pIdBuku INT,
    pJudulBuku VARCHAR(100),
    pPenulis VARCHAR(100),
    pKategori VARCHAR(50),
    pStok INT
)
BEGIN
    UPDATE buku 
    SET judul_buku = pJudulBuku, 
        penulis = pPenulis, 
        kategori = pKategori, 
        stock = pStok
    WHERE id_buku = pIdBuku;
END $$
DELIMITER ;
 CALL update_buku(2, 'Dasar-dasar Database Revisi', 'Budi Santoso', 'Teknologi', 10);


DELIMITER $$
CREATE PROCEDURE update_siswa(
    pIdSiswa INT,
    pNama VARCHAR(50),
    pKelas VARCHAR(10)
)
BEGIN
    UPDATE siswa 
    SET nama = pNama, 
        kelas = pKelas
    WHERE id_siswa = pIdSiswa;
END $$
DELIMITER ;

SET SQL_SAFE_UPDATES = 0;


CALL update_siswa(3, 'Hadi Saputra', 'XI-TKJ');

DELIMITER $$
CREATE PROCEDURE update_peminjaman(
    pIdPeminjaman INT,
    pIdSiswa INT,
    pIdBuku INT,
    pTanggalPinjam DATE,
    pTanggalKembali DATE,
    pStatus VARCHAR(20)
)
BEGIN
    UPDATE peminjaman 
    SET id_siswa = pIdSiswa, 
        id_buku = pIdBuku, 
        tanggal_pinjam = pTanggalPinjam, 
        tanggal_kembali = pTanggalKembali, 
        status = pStatus
    WHERE id_peminjaman = pIdPeminjaman;
END $$
DELIMITER ;

CALL update_peminjaman(4, 10, 4, '2025-01-30', '2025-02-07', 'Dikembalikan');


DELIMITER $$
CREATE PROCEDURE delete_buku(pIdBuku INT)
BEGIN
    DELETE FROM buku WHERE id_buku = pIdBuku;
END $$
DELIMITER ;
 CALL delete_buku(15);
 select*from buku;
DELIMITER $$

CREATE PROCEDURE delete_Siswa(IN new_Id INT)
BEGIN
    DELETE FROM siswa WHERE id_siswa = new_Id;
END $$

DELIMITER ;
 
CALL delete_Siswa(15);
 select*from siswa;
DELIMITER $$
CREATE PROCEDURE delete_peminjaman(pIdPeminjaman INT)
BEGIN
    DELETE FROM peminjaman WHERE id_peminjaman = pIdPeminjaman;
END $$
DELIMITER ;
 select*from peminjaman;
CALL delete_peminjaman(11);
DELETE FROM peminjaman WHERE id_peminjaman BETWEEN 12 AND 19;



DELIMITER $$
CREATE PROCEDURE tampil_buku()
BEGIN
    SELECT * FROM buku;
END $$
DELIMITER ;

CALL tampil_buku();


DELIMITER $$
CREATE PROCEDURE tampil_siswa()
BEGIN
    SELECT * FROM siswa;
END $$
DELIMITER ;

CALL tampil_siswa();

DELIMITER $$
CREATE PROCEDURE tampil_peminjaman()
BEGIN
    SELECT * FROM peminjaman;
END $$
DELIMITER ;

CALL tampil_peminjaman();

DELIMITER //

CREATE TRIGGER kurangi_stok_buku
AFTER INSERT ON peminjaman
FOR EACH ROW
BEGIN
    UPDATE buku 
    SET stokc = stock - 1 
    WHERE id_buku = NEW.id_buku;
END //


 DROP TRIGGER IF EXISTS kurangi_stok_buku;

DELIMITER ;
DELIMITER $$

CREATE TRIGGER kurangi_stok_buku
AFTER INSERT ON peminjaman
FOR EACH ROW
BEGIN
    UPDATE buku 
    SET stock = stock - 1  
    WHERE id_buku = NEW.id_buku;
END $$

DELIMITER ;

INSERT INTO peminjaman (id_siswa, id_buku, tanggal_pinjam, tanggal_kembali, status)
VALUES (3, 5, '2025-02-22', '2025-03-01', 'Dipinjam');

SELECT * FROM buku WHERE id_buku = 5;

 DELIMITER $$

CREATE TRIGGER tambah_stok_buku
AFTER UPDATE ON peminjaman
FOR EACH ROW
BEGIN
    IF NEW.status = 'Dikembalikan' AND OLD.status != 'Dikembalikan' THEN
        UPDATE buku 
        SET stock = stock + 1 
        WHERE id_buku = NEW.id_buku;
    END IF;
END $$

DELIMITER ;

UPDATE peminjaman 
SET status = 'Dikembalikan' 
WHERE id_peminjaman = 4;


SELECT * FROM buku WHERE id_buku = (SELECT id_buku FROM peminjaman WHERE id_peminjaman = 4);

DELIMITER $$

CREATE PROCEDURE kembalikan_buku(IN p_id_peminjaman INT)
BEGIN
  
    UPDATE peminjaman 
    SET status = 'Dikembalikan', tanggal_kembali = CURRENT_DATE
    WHERE id_peminjaman = p_id_peminjaman;
    UPDATE buku 
    SET stock = stock + 1
    WHERE id_buku = (SELECT id_buku FROM peminjaman WHERE id_peminjaman = p_id_peminjaman);
END $$

CALL kembalikan_buku(5);

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE daftar_siswa_peminjam()
BEGIN
    SELECT DISTINCT s.id_siswa, s.nama_siswa 
    FROM siswa s
    JOIN peminjaman p ON s.id_siswa = p.id_siswa;
END $$

DELIMITER ;
DROP PROCEDURE IF EXISTS daftar_siswa_peminjam;


DELIMITER $$

CREATE PROCEDURE daftar_siswa_peminjam()
BEGIN
    SELECT DISTINCT s.id_siswa, s.nama
    FROM siswa s
    JOIN peminjaman p ON s.id_siswa = p.id_siswa;
END $$

DELIMITER ;

CALL daftar_siswa_peminjam();

DELIMITER $$

CREATE PROCEDURE semua_siswa()
BEGIN
    SELECT s.id_siswa, s.nama, s.kelas, 
           IFNULL(COUNT(p.id_peminjaman), 0) AS jumlah_peminjaman
    FROM siswa s
    LEFT JOIN peminjaman p ON s.id_siswa = p.id_siswa
    GROUP BY s.id_siswa, s.nama, s.kelas;
END $$

DELIMITER ;


CALL semua_siswa();

DELIMITER $$

CREATE PROCEDURE semua_buku()
BEGIN
    SELECT b.id_buku, b.judul_buku, b.penulis, b.kategori, b.stock, 
           IFNULL(COUNT(p.id_peminjaman), 0) AS jumlah_dipinjam
    FROM buku b
    LEFT JOIN peminjaman p ON b.id_buku = p.id_buku
    GROUP BY b.id_buku, b.judul_buku, b.penulis, b.kategori, b.stock;
END $$

DELIMITER ;
select*from siswa;

CALL semua_buku();

select*from siswa;