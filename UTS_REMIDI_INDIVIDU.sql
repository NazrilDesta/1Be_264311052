-- Penambahan Tabel --

CREATE TABLE riwayat_pemblokiran (
    id_blokir VARCHAR(10) PRIMARY KEY,
    id_pengguna VARCHAR(10) NOT NULL,
    waktu_blokir DATETIME NOT NULL,
    alasan_blokir VARCHAR(255) NOT NULL,
    waktu_pemulihan DATETIME NULL,

    FOREIGN KEY (id_pengguna)
        REFERENCES pengguna(id_pengguna)
);

-- Constraint Validasi --

ALTER TABLE riwayat_pemblokiran
ADD CONSTRAINT chk_waktu_pemulihan
CHECK (
    waktu_pemulihan IS NULL
    OR waktu_pemulihan >= waktu_blokir
);

-- Data Tabel --

INSERT INTO riwayat_pemblokiran
    (id_blokir, id_pengguna, waktu_blokir, alasan_blokir, waktu_pemulihan)
VALUES
    ('B001', 'U003', '2026-10-13 08:06:00',
     'Percobaan akses gagal berulang', '2026-10-13 08:30:00'),

    ('B002', 'U003', '2026-10-13 09:05:00',
     'Percobaan akses gagal berulang', NULL),
     
    ('B003', 'U004', '2026-10-16 08:30:00',
     'Terdeteksi percobaan pembukaan paksa', NULL);
