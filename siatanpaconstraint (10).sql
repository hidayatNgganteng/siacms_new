-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 05, 2018 at 10:21 AM
-- Server version: 10.1.16-MariaDB
-- PHP Version: 7.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `siatanpaconstraint`
--

-- --------------------------------------------------------

--
-- Table structure for table `absensi_harian`
--

CREATE TABLE `absensi_harian` (
  `id_absen_harian` int(10) NOT NULL,
  `nisn` varchar(10) NOT NULL,
  `tgl_mulai` date NOT NULL,
  `tgl_selesai` date NOT NULL,
  `keterangan` char(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `akun`
--

CREATE TABLE `akun` (
  `id_akun` int(5) NOT NULL,
  `password` varchar(50) NOT NULL,
  `NIP` varchar(20) DEFAULT NULL,
  `id_jabatan` int(5) NOT NULL,
  `nisn` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `akun`
--

INSERT INTO `akun` (`id_akun`, `password`, `NIP`, `id_jabatan`, `nisn`) VALUES
(1, '12345', '13523111', 1, NULL),
(2, 'admin', '13523135', 2, NULL),
(3, 'pegawai', '13523069', 3, NULL),
(4, 'guru', '13523138', 4, NULL),
(5, 'konseling', '13523143', 5, NULL),
(11, 'kesiswaan', '13523096', 6, NULL),
(12, 'kurikulum', '13523062', 7, NULL),
(13, 'siswa', NULL, 8, '12345'),
(14, 'pembimbing', '13523134', 9, NULL),
(15, 'karyawan', '13523555', 10, NULL),
(22, 'kepsek', '11122', 1, NULL),
(23, 'karyawan', '12222', 10, NULL),
(24, '1234', '123', 11, NULL),
(25, 'kepsek123', '1111', 10, NULL),
(26, '11', NULL, 8, '999'),
(27, 'ucup', '13313131', 2, NULL),
(28, 'aaaa', '88888', 1, NULL),
(29, '11111', '11111', 7, NULL),
(30, 'p0p0p0', '111', 5, NULL),
(31, '123456', '12345', 4, NULL),
(32, 'kurikulum', '11', 7, NULL),
(33, 'gurupiket', '566656', 11, NULL),
(34, '1234', '111222333', 1, NULL),
(35, 'pegawai', '110222337', 3, NULL),
(36, '1221129', '1221129', 4, NULL),
(37, '1231233412', '1231233412', 4, NULL),
(38, '12312334121', '12312334121', 4, NULL),
(39, '123456', '123456', 4, NULL),
(40, '13523120', '13523120', 4, NULL),
(41, '1352313599', '1352313599', 4, NULL),
(42, '13523136', '13523136', 4, NULL),
(43, '13523139', '13523139', 4, NULL),
(44, '135231399', '135231399', 4, NULL),
(45, '198503302003121002', '198503302003121002', 4, NULL),
(46, '333444555', '333444555', 4, NULL),
(47, '676888999', '676888999', 4, NULL),
(48, '777888666', '777888666', 4, NULL),
(49, '87283282', '87283282', 4, NULL),
(50, '888777', '888777', 4, NULL),
(51, '989234', '989234', 4, NULL),
(52, '9999922', '9999922', 4, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `bayar`
--

CREATE TABLE `bayar` (
  `tgl_bayar` date NOT NULL,
  `jmlh_bayar` int(10) NOT NULL,
  `tgl_habis_bayar` date NOT NULL,
  `status_bayar` enum('sudah bayar','belum bayar') NOT NULL,
  `id_siswa` int(5) NOT NULL,
  `id_kelas_tambahan` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `daftar_ulang`
--

CREATE TABLE `daftar_ulang` (
  `id_daftar_ulang` int(3) NOT NULL,
  `id_tahun_ajaran` int(10) NOT NULL,
  `nisn` varchar(10) NOT NULL,
  `nomor_pendaftar_ujian` int(10) NOT NULL,
  `no_pendaftar` int(10) NOT NULL,
  `surat_pernyataan` tinyint(1) NOT NULL,
  `rapor` tinyint(1) NOT NULL,
  `formulir_pendataan` tinyint(1) NOT NULL,
  `tanda_pembayaran` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `danamandiri`
--

CREATE TABLE `danamandiri` (
  `id_danamandiri` int(3) NOT NULL,
  `tgl_pembayaran` date NOT NULL,
  `keterangan` varchar(25) NOT NULL,
  `nominal` int(20) NOT NULL,
  `jenis_tagihan` varchar(50) NOT NULL,
  `batas_akhir_pembayaran` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `deskripsi_nilai`
--

CREATE TABLE `deskripsi_nilai` (
  `id_deskripsi` int(3) NOT NULL,
  `range_nilai` varchar(40) NOT NULL,
  `predikat` varchar(40) NOT NULL,
  `deskripsi` text NOT NULL,
  `mapel_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `form_ppdb`
--

CREATE TABLE `form_ppdb` (
  `id_form_ppdb` int(2) NOT NULL,
  `nama_kolom` varchar(30) NOT NULL,
  `atribut` varchar(100) DEFAULT NULL,
  `nilai` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `form_ppdb`
--

INSERT INTO `form_ppdb` (`id_form_ppdb`, `nama_kolom`, `atribut`, `nilai`) VALUES
(1, 'nomor_pendaftaran', 'Nomor Pendaftaran', 1),
(2, 'no_usbn', 'Nomor USBN', 1),
(3, 'nisn_pendaftar', 'NISN', 1),
(4, 'nama', 'Nama Lengkap', 1),
(5, 'jenis_kelamin', 'Jenis Kelamin', 1),
(6, 'tempat_lahir', 'Tempat Lahir', 1),
(7, 'tanggal_lahir', 'Tanggal Lahir', 1),
(8, 'alamat', 'Alamat', 1),
(9, 'asal_sekolah', 'Asal Sekolah', 1),
(10, 'tahun_lulus', 'Tahun Lulus', 1),
(11, 'nilai_un_ind', 'Nilai UN B. Indonesia', 0),
(12, 'nilai_un_mat', 'Nilai UN Matematika', 0),
(13, 'nilai_un_ipa', 'Nilai UN IPA', 0),
(14, 'nilai_prestasi', 'Nilai Prestasi', 0),
(15, 'nilai_un_nun', 'Total Nilai', 0),
(16, 'domisili', 'Domisili', 0),
(17, 'bukti_pengajuan_daftar', 'Berkas yang dilampirkan: Bukti Pengajuan Daftar', 0),
(18, 'surat_ket_penambah_nilai', 'Berkas yang dilampirkan: Surat Keterangan Penambah Nilai', 0),
(19, 'surat_ket_nisn', 'Berkas yang dilampirkan: Surat Keterangan NISN', 0),
(20, 'fc_ijazah', 'Berkas yang dilampirkan: Fotocopy Ijazah', 0),
(21, 'fc_rapor', 'Berkas yang dilampirkan: Fotocopy Rapor', 0),
(22, 'skhun', 'Berkas yang dilampirkan: SKHUN', 0),
(23, 'fc_skhun', 'Berkas yang dilampirkan: Fotocopy SKHUN', 0),
(24, 'skck_kepsek', 'Berkas yang dilampirkan: Surat Keterangan Berkelakuan Baik Kepala Sekolah', 0),
(25, 'fc_kk', 'Berkas yang dilampirkan: Fotocopy Kartu Keluarga', 0),
(26, 'fc_akta_lahir', 'Berkas yang dilampirkan: Fotocopy Akta Lahir', 0),
(27, 'surat_ket_rt', 'Berkas yang dilampirkan: Surat Keterangan RT', 0),
(28, 'surat_keterangan_napza', 'Berkas yang dilampirkan: Surat Keterangan Napza', 0),
(29, 'berkas_1', '', 0),
(30, 'berkas_2', '', 0),
(31, 'berkas_3', '', 0),
(32, 'berkas_4', '', 0),
(33, 'berkas_5', '', 0),
(34, 'pilihan_sekolah_1', 'Pilihan Sekolah 1', 0),
(35, 'pilihan_sekolah_2', 'Pilihan Sekolah 2', 0),
(36, 'pilihan_sekolah_3', 'Pilihan Sekolah 3', 0);

-- --------------------------------------------------------

--
-- Table structure for table `form_ujian`
--

CREATE TABLE `form_ujian` (
  `id_form_ujian` int(2) NOT NULL,
  `nama_kolom` varchar(50) NOT NULL,
  `atribut` varchar(100) DEFAULT NULL,
  `nilai` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `form_ujian`
--

INSERT INTO `form_ujian` (`id_form_ujian`, `nama_kolom`, `atribut`, `nilai`) VALUES
(1, 'ujian_1', 'Tes Administrasi', 1),
(2, 'ujian_2', 'Tes Kesehatan', 1),
(3, 'ujian_3', 'Tes Ujian Tertulis', 1),
(4, 'ujian_4', 'Tes Psikotes', 1),
(5, 'ujian_5', 'Tes Hafalan Al Quran', 1),
(6, 'ujian_6', 'Tes Wawancara', 1),
(7, 'ujian_7', '', 0),
(8, 'ujian_8', '', 0),
(9, 'ujian_9', '', 0),
(10, 'ujian_10', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `hari_rentang`
--

CREATE TABLE `hari_rentang` (
  `id_rentang_jam` int(10) NOT NULL,
  `jam_ke` varchar(2) NOT NULL,
  `jam_mulai` time NOT NULL,
  `jam_selesai` time NOT NULL,
  `hari` enum('Senin','Selasa','Rabu','Kamis','Jumat','Sabtu','Minggu') NOT NULL,
  `id_tahun_ajaran` int(10) NOT NULL,
  `durasi` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hari_rentang`
--

INSERT INTO `hari_rentang` (`id_rentang_jam`, `jam_ke`, `jam_mulai`, `jam_selesai`, `hari`, `id_tahun_ajaran`, `durasi`) VALUES
(83, '3', '09:30:00', '12:00:00', 'Senin', 0, '00:00:00'),
(85, '2', '08:30:00', '10:00:00', 'Selasa', 0, '00:00:00'),
(87, '2', '09:00:00', '11:00:00', 'Rabu', 0, '00:00:00'),
(88, '3', '11:00:00', '11:30:00', 'Rabu', 0, '00:00:00'),
(92, '1', '07:00:00', '08:00:00', 'Kamis', 0, '00:00:00'),
(93, '2', '08:00:00', '09:00:00', 'Kamis', 0, '00:00:00'),
(94, '1', '07:00:00', '09:00:00', 'Jumat', 0, '00:00:00'),
(95, '1', '09:00:00', '10:00:00', 'Sabtu', 0, '00:00:00'),
(96, '1', '09:00:00', '11:00:00', 'Minggu', 0, '00:00:00'),
(97, '4', '13:00:00', '14:00:00', 'Senin', 0, '00:00:00'),
(98, '0', '07:00:00', '07:30:00', 'Senin', 0, '00:00:00'),
(99, '1', '07:30:00', '09:00:00', 'Senin', 0, '00:00:00'),
(100, '1', '07:00:00', '08:30:00', 'Selasa', 0, '00:00:00'),
(101, '5', '13:00:00', '14:00:00', 'Senin', 0, '00:00:00'),
(102, '6', '13:00:00', '14:00:00', 'Senin', 0, '00:00:00'),
(103, '3', '08:30:00', '09:30:00', 'Selasa', 0, '00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `jabatan`
--

CREATE TABLE `jabatan` (
  `id_jabatan` int(5) NOT NULL,
  `nama_jabatan` varchar(15) NOT NULL,
  `url` varchar(255) NOT NULL,
  `menuakses` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jabatan`
--

INSERT INTO `jabatan` (`id_jabatan`, `nama_jabatan`, `url`, `menuakses`) VALUES
(1, 'Kepala Sekolah', 'kepsek', '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,21,22,23,24,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49'),
(2, 'Superadmin', 'superadmin', '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49'),
(3, 'Pegawai', 'pegawai', '1,12,13,14,16,26,29,35,36,37'),
(4, 'Guru', 'Guru', '1,8,9,10,12,13,14,15,16,17,21,22,23,24,26,30,34,35,37'),
(5, 'Konseling', 'konseling', '38,45,46,47,48,49'),
(6, 'Kesiswaan', 'kesiswaan', '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15'),
(7, 'Kurikulum', 'kurikulum', '16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34'),
(8, 'Siswa', 'siswa', ''),
(9, 'Pembimbing', 'pembimbing', '38,39,40,41,42,43,44'),
(10, 'Karyawan', 'karyawan', '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,21,22,23,24,26,27,28,29,30,31,32,33,34,35,36,37,38,40,41,42,43,44,45,46,47,48,49'),
(11, 'Guru Piket', 'gurupiket', '16,26,29,35,37');

-- --------------------------------------------------------

--
-- Table structure for table `jabatan_has_tugas`
--

CREATE TABLE `jabatan_has_tugas` (
  `jabatan_id_jabatan` int(5) NOT NULL,
  `tugas_id_tugas` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `jadwal_ekskul`
--

CREATE TABLE `jadwal_ekskul` (
  `id_jadwal_ekskul` int(5) NOT NULL,
  `hari` enum('Senin','Selasa','Rabu','Kamis','Jumat','Sabtu','Minggu') NOT NULL,
  `jam_mulai` time NOT NULL,
  `jam_selesai` time NOT NULL,
  `tempat` varchar(20) NOT NULL,
  `id_pembimbing` int(5) NOT NULL,
  `id_jenis_kls_tambahan` int(5) NOT NULL,
  `id_tahun_ajaran` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jadwal_ekskul`
--

INSERT INTO `jadwal_ekskul` (`id_jadwal_ekskul`, `hari`, `jam_mulai`, `jam_selesai`, `tempat`, `id_pembimbing`, `id_jenis_kls_tambahan`, `id_tahun_ajaran`) VALUES
(1, 'Kamis', '16:00:00', '17:00:00', 'Lapangan tennis', 2, 2, 1),
(3, 'Rabu', '01:58:00', '13:59:00', 'asdsd', 0, 0, 1),
(5, 'Senin', '14:01:00', '13:01:00', 'sdasda', 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `jadwal_mapel`
--

CREATE TABLE `jadwal_mapel` (
  `NIP` varchar(20) NOT NULL,
  `id_kelas_berjalan` int(10) NOT NULL,
  `id_mapel` int(10) NOT NULL,
  `id_tahun_ajaran` int(10) NOT NULL,
  `id_jadwal_mapel` int(10) NOT NULL,
  `jadwal_mapel` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `jadwal_piket_guru`
--

CREATE TABLE `jadwal_piket_guru` (
  `id_jdwl_piket_guru` int(10) NOT NULL,
  `NIP` varchar(20) NOT NULL,
  `id_tahun_ajaran` int(10) NOT NULL,
  `hari` enum('Senin','Selasa','Rabu','Kamis','Jumat','Sabtu','Minggu') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jadwal_piket_guru`
--

INSERT INTO `jadwal_piket_guru` (`id_jdwl_piket_guru`, `NIP`, `id_tahun_ajaran`, `hari`) VALUES
(32, '13523096', 1, 'Senin'),
(33, '13523111', 1, 'Selasa'),
(34, '13523111', 1, 'Selasa'),
(35, '13523138', 1, 'Senin'),
(36, '13523143', 1, 'Selasa'),
(39, '13523136', 2, 'Senin'),
(40, '13523135', 2, 'Selasa'),
(41, '13523096', 2, 'Senin');

-- --------------------------------------------------------

--
-- Table structure for table `jadwal_tambahan`
--

CREATE TABLE `jadwal_tambahan` (
  `NIP` varchar(20) NOT NULL,
  `id_kelas_tambahan` int(10) NOT NULL,
  `jam_mulai` time NOT NULL,
  `jam_selesai` time NOT NULL,
  `tgl_tambahan` date NOT NULL,
  `id_jadwal_tambahan` int(10) NOT NULL,
  `id_tahun_ajaran` int(10) NOT NULL,
  `id_namamapel` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jadwal_tambahan`
--

INSERT INTO `jadwal_tambahan` (`NIP`, `id_kelas_tambahan`, `jam_mulai`, `jam_selesai`, `tgl_tambahan`, `id_jadwal_tambahan`, `id_tahun_ajaran`, `id_namamapel`) VALUES
('13523096', 2, '09:30:00', '10:00:00', '2018-01-29', 13, 1, 21),
('13523120', 0, '01:00:00', '01:59:00', '2018-02-02', 14, 1, 25),
('13523120', 0, '01:00:00', '01:59:00', '2018-02-02', 15, 1, 25);

-- --------------------------------------------------------

--
-- Table structure for table `jam_mengajar`
--

CREATE TABLE `jam_mengajar` (
  `id_jam_mgjr` int(10) NOT NULL,
  `NIP` varchar(20) NOT NULL,
  `id_tahun_ajaran` int(10) NOT NULL,
  `id_namamapel` int(10) NOT NULL,
  `jml_jam_mgjr` int(10) NOT NULL,
  `jatah_minim_mgjr` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jam_mengajar`
--

INSERT INTO `jam_mengajar` (`id_jam_mgjr`, `NIP`, `id_tahun_ajaran`, `id_namamapel`, `jml_jam_mgjr`, `jatah_minim_mgjr`) VALUES
(19, '13523066', 1, 2, 0, 24),
(20, '13523066', 1, 3, 0, 24),
(21, '123', 1, 3, 0, 0),
(22, '989234', 1, 5, 0, 0),
(23, '13313131', 1, 3, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `jenis_kls_tambahan`
--

CREATE TABLE `jenis_kls_tambahan` (
  `id_jenis_kls_tambahan` int(5) NOT NULL,
  `jenis_kls_tambahan` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `jenis_nilai_akhir`
--

CREATE TABLE `jenis_nilai_akhir` (
  `id_jenis_na` int(11) NOT NULL,
  `Jenis_na` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `jenis_pelanggaran`
--

CREATE TABLE `jenis_pelanggaran` (
  `id_jenis_pelanggaran` int(20) NOT NULL,
  `tgl_kejadian` date NOT NULL,
  `bentuk_pelanggaran` varchar(50) NOT NULL,
  `sanksi` varchar(50) NOT NULL,
  `no_pasal` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kategori_nilai`
--

CREATE TABLE `kategori_nilai` (
  `id_kategorinilai` int(2) NOT NULL,
  `kategori_nilai` varchar(20) NOT NULL,
  `bobot` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kelas_berjalan`
--

CREATE TABLE `kelas_berjalan` (
  `id_kelas_kerjalan` int(10) NOT NULL,
  `id_tahun_ajaran` int(10) NOT NULL,
  `wali_kelas` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kelas_reguler`
--

CREATE TABLE `kelas_reguler` (
  `id_kelas_reguler` int(10) NOT NULL,
  `jenjang` enum('7','8','9') NOT NULL,
  `nama_kelas` varchar(50) NOT NULL,
  `kuota_kelas_reguler` int(5) NOT NULL,
  `jumlah_kelas_reguler` int(5) NOT NULL,
  `id_tahun_ajaran` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kelas_reguler`
--

INSERT INTO `kelas_reguler` (`id_kelas_reguler`, `jenjang`, `nama_kelas`, `kuota_kelas_reguler`, `jumlah_kelas_reguler`, `id_tahun_ajaran`) VALUES
(1, '9', '9A', 40, 38, 1),
(2, '9', '9B', 40, 37, 1),
(3, '9', '9C', 40, 38, 1),
(4, '8', '8A', 40, 39, 1),
(5, '7', '7A', 40, 40, 1);

-- --------------------------------------------------------

--
-- Table structure for table `kelas_reguler_berjalan`
--

CREATE TABLE `kelas_reguler_berjalan` (
  `id_kelas_reguler_berjalan` int(10) NOT NULL,
  `wali_kelas` varchar(20) NOT NULL,
  `nisn` varchar(10) NOT NULL,
  `id_kelas_reguler` int(10) NOT NULL,
  `id_tahun_ajaran` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kelas_tambahan`
--

CREATE TABLE `kelas_tambahan` (
  `id_kelas_tambahan` int(10) NOT NULL,
  `kelas_tambahan` varchar(10) NOT NULL,
  `kuota_kelas` int(10) NOT NULL,
  `id_jenis_kls_tambahan` int(5) NOT NULL,
  `id_tahun_ajaran` int(10) NOT NULL,
  `hasil_tpm` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kelas_tambahan_berjalan`
--

CREATE TABLE `kelas_tambahan_berjalan` (
  `id_kelas_tambahan_berjalan` int(10) NOT NULL,
  `nisn` varchar(10) NOT NULL,
  `id_kelas_tambahan` int(10) NOT NULL,
  `id_tahun_ajaran` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ketentuan_ppdb`
--

CREATE TABLE `ketentuan_ppdb` (
  `id_ketentuan` int(3) NOT NULL,
  `isi` text NOT NULL,
  `tgl_berlaku` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `keterlambatan`
--

CREATE TABLE `keterlambatan` (
  `id_keterlambatan` int(15) NOT NULL,
  `nisn` varchar(10) NOT NULL,
  `tgl_terlambat` date NOT NULL,
  `jmlh_terlambat` int(20) NOT NULL,
  `keterangan` char(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `klinik_un`
--

CREATE TABLE `klinik_un` (
  `id_klinik_un` int(10) NOT NULL,
  `nama_siswa` varchar(20) NOT NULL,
  `kelas` varchar(10) NOT NULL,
  `req_materi` text NOT NULL,
  `jumlah_peserta` int(5) NOT NULL,
  `status_req` enum('Belum Direspon','Sudah Direspon') NOT NULL,
  `respon` text NOT NULL,
  `nisn` varchar(10) NOT NULL,
  `NIP` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kurikulum`
--

CREATE TABLE `kurikulum` (
  `id_kurikulum` int(3) NOT NULL,
  `nama_kurikulum` varchar(20) NOT NULL,
  `nama_filekur` varchar(50) NOT NULL,
  `tahunajaran_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `login_backend`
--

CREATE TABLE `login_backend` (
  `id_user` int(11) NOT NULL,
  `username` int(15) NOT NULL,
  `password` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login_backend`
--

INSERT INTO `login_backend` (`id_user`, `username`, `password`) VALUES
(1, 123456, 'qwerty123'),
(2, 123, '111'),
(3, 1234567, 'qwerty1234');

-- --------------------------------------------------------

--
-- Table structure for table `mapel`
--

CREATE TABLE `mapel` (
  `id_mapel` int(11) NOT NULL,
  `id_namamapel` int(10) NOT NULL,
  `nama_mapel2` varchar(50) NOT NULL,
  `kkm` int(3) NOT NULL,
  `jam_belajar` int(2) NOT NULL,
  `id_kelas_reguler` int(10) NOT NULL,
  `id_tahun_ajaran` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mapel`
--

INSERT INTO `mapel` (`id_mapel`, `id_namamapel`, `nama_mapel2`, `kkm`, `jam_belajar`, `id_kelas_reguler`, `id_tahun_ajaran`) VALUES
(37, 3, 'Matematika', 80, 5, 5, 0),
(38, 3, 'Matematika', 80, 5, 4, 0),
(39, 3, 'Matematika', 80, 5, 1, 0),
(40, 3, 'Matematika', 80, 5, 2, 0),
(41, 3, 'Matematika', 80, 5, 3, 0),
(45, 2, 'Bahasa Inggris', 80, 4, 5, 0),
(56, 2, '', 80, 4, 4, 0),
(57, 5, '', 90, 6, 5, 0),
(58, 6, '', 75, 2, 5, 0);

-- --------------------------------------------------------

--
-- Table structure for table `mutasi`
--

CREATE TABLE `mutasi` (
  `id_mutasi` int(10) NOT NULL,
  `tgl_mutasi` date NOT NULL,
  `keterangan` varchar(100) NOT NULL,
  `sekolah_asal_tujuan` varchar(100) NOT NULL,
  `id_tahun_ajaran` int(10) NOT NULL,
  `id_siswa_mutasi_keluar` int(10) NOT NULL,
  `id_pendaftar_mutasi` int(10) NOT NULL,
  `nisn` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `namamapel`
--

CREATE TABLE `namamapel` (
  `id_namamapel` int(10) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `warna` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `namamapel`
--

INSERT INTO `namamapel` (`id_namamapel`, `nama`, `warna`) VALUES
(21, 'Matematika', '#d38fe8'),
(22, 'Bahasa Inggris', '#cccccc'),
(23, 'IPS', '#ff0000'),
(24, 'IPA', '#00ff00'),
(25, 'Bahasa Indonesia', '#bfed87'),
(26, 'PPKn', '#0000ff'),
(27, 'Penjasorkes', '#efad13'),
(29, 'nur muhammad', ''),
(30, 'nur huda', '');

-- --------------------------------------------------------

--
-- Table structure for table `nilaiekskul`
--

CREATE TABLE `nilaiekskul` (
  `id_niaiekskul` int(5) NOT NULL,
  `id_siswakls` int(5) NOT NULL,
  `jenis_ekskul` varchar(15) NOT NULL,
  `nilai_ekskul` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `nilai_siswa`
--

CREATE TABLE `nilai_siswa` (
  `id_nilai_siswa` int(11) NOT NULL,
  `siswa_kelas_id` int(11) NOT NULL,
  `kategori_nilai_id` int(11) NOT NULL,
  `jenis_na_id` int(11) NOT NULL,
  `mapel_id` int(11) NOT NULL,
  `Nilai_siswa` float NOT NULL,
  `id_kelas_berjalan` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `orangtua_wali`
--

CREATE TABLE `orangtua_wali` (
  `id_orangtua` int(4) NOT NULL,
  `nama_ayah` varchar(30) NOT NULL,
  `gelar_depan_ayah` varchar(10) NOT NULL,
  `gelar_belakang_ayah` varchar(10) NOT NULL,
  `tempat_lahir_ayah` varchar(15) NOT NULL,
  `tanggal_lahir_ayah` date NOT NULL,
  `kewarganegaraan_ayah` varchar(30) NOT NULL,
  `agama_ayah` enum('Islam','Kristen','Hindu','Budha','Konghucu','Katholik') NOT NULL,
  `pendidikan_ayah` enum('Tidak Sekolah','Sekolah Dasar','Sekolah Menengah Pertama','Sekolah Menengah Atas','D1','D2','D3','D4','S1','S2','S3') NOT NULL,
  `pekerjaan_ayah` enum('Tidak Bekerja','Nelayan','Petani','Peternak','PNS/ TNI/ POLRI','Karyawan Swasta','Pedagang Kecil','Pedagang Besar','Wiraswasta','Wirausaha','Buruh','Pensiunan') NOT NULL,
  `penghasilan_ayah` enum('Kurang dari Rp. 499.999','Rp. 500.000 sd Rp. 999.999','Rp. 1.000.000 sd Rp. 1.999.999','Rp. 2.000.000 sd Rp. 3.999.999','Rp. 4.000.000 sd Rp. 9.999.999','Lebih dari Rp. 10.000.000') NOT NULL,
  `ayah_berkebutuhan_khusus` enum('Tidak','Netra','Rungu','Grahita Ringan','Grahita Sedang','Daksa Ringan','Daksa Sedang','Laras','Wicara','Tuna Ganda','Hiperaktif','Cerdas Istimewa','Kesulitan Belajar','Narkoba','Indigo','Down Syndrome','Autis','Terbelakang','Bencana Alam/ Sosial','Tidak Mampu Ekonomi','Lainnya') NOT NULL,
  `no_telepon_hp_ayah` int(15) NOT NULL,
  `nama_ibu` varchar(30) NOT NULL,
  `gelar_depan_ibu` varchar(10) NOT NULL,
  `gelar_belakang_ibu` varchar(10) NOT NULL,
  `tempat_lahir_ibu` varchar(15) NOT NULL,
  `tanggal_lahir_ibu` date NOT NULL,
  `kewarganegaraan_ibu` varchar(30) NOT NULL,
  `agama_ibu` enum('Islam','Kristen','Hindu','Budha','Konghucu','Katholik') NOT NULL,
  `pendidikan_ibu` enum('Tidak Sekolah','Sekolah Dasar','Sekolah Menengah Pertama','Sekolah Menengah Atas','D1','D2','D3','D4','SI','S2','S3') NOT NULL,
  `pekerjaan_ibu` enum('Tidak Bekerja','Nelayan','Petani','Peternak','PNS/ TNI/ POLRI','Karyawan Swasta','Pedagang Kecil','Pedagang Besar','Wiraswasta','Wirausaha','Buruh','Pensiunan') NOT NULL,
  `penghasilan_ibu` enum('Kurang dari Rp. 499.999','Rp. 500.000 sd Rp. 999.999','Rp. 1.000.000 sd Rp. 1.999.999','Rp. 2.000.000 sd Rp. 3.999.999','Rp. 4.000.000 sd Rp. 9.999.999','Lebih dari Rp. 10.000.000') NOT NULL,
  `ibu_berkebutuhan_khusus` enum('Tidak','Netra','Rungu','Grahita Ringan','Grahita Sedang','Daksa Ringan','Daksa Sedang','Laras','Wicara','Tuna Ganda','Hiperaktif','Cerdas Istimewa','Bakat Istimewa','Kesulitan Belajar','Narkoba','Indigo','Down Syndrome','Autis','Terbelakang','Bencana Alam/ Sosial','Tidak Mampu Ekonomi','Lainnya') NOT NULL,
  `nomor_telepeon_ibu` int(15) NOT NULL,
  `nama_wali` varchar(30) NOT NULL,
  `tempat_lahir_wali` varchar(15) NOT NULL,
  `tanggal_lahir_wali` date NOT NULL,
  `pendidikan_wali` enum('Tidak Sekola','Sekolah Dasar','Sekolah Menengah Pertama','Sekolah Menengah Atas','D1','D2','D3','D4','S1','S2','S3') NOT NULL,
  `kewarganegaraan_wali` varchar(30) NOT NULL,
  `agama_wali` enum('Islam','Kristen','Hindu','Budha','Konghucu','Katholik') NOT NULL,
  `pekerjaan_wali` enum('Tidak Bekerja','Nelayan','Petani','Peternak','PNS/ TNI/ POLRI','Karyawan Swasta','Pedagang Kecil','Pedagang Besar','Wiraswasta','Wirausaha','Buruh','Pensiunan') NOT NULL,
  `penghasilan_wali` enum('Kurang dari Rp. 499.999','Rp. 500.000 sd Rp. 999.999','Rp. 1.000.000 sd Rp. 1.999.999','Rp. 2.000.000 sd 3.999.999','Rp. 4.000.000 sd Rp. 9.999.999','Lebih dari Rp 10.000.000') NOT NULL,
  `alamat_wali` varchar(150) NOT NULL,
  `no_telepon_hp_wali` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orangtua_wali`
--

INSERT INTO `orangtua_wali` (`id_orangtua`, `nama_ayah`, `gelar_depan_ayah`, `gelar_belakang_ayah`, `tempat_lahir_ayah`, `tanggal_lahir_ayah`, `kewarganegaraan_ayah`, `agama_ayah`, `pendidikan_ayah`, `pekerjaan_ayah`, `penghasilan_ayah`, `ayah_berkebutuhan_khusus`, `no_telepon_hp_ayah`, `nama_ibu`, `gelar_depan_ibu`, `gelar_belakang_ibu`, `tempat_lahir_ibu`, `tanggal_lahir_ibu`, `kewarganegaraan_ibu`, `agama_ibu`, `pendidikan_ibu`, `pekerjaan_ibu`, `penghasilan_ibu`, `ibu_berkebutuhan_khusus`, `nomor_telepeon_ibu`, `nama_wali`, `tempat_lahir_wali`, `tanggal_lahir_wali`, `pendidikan_wali`, `kewarganegaraan_wali`, `agama_wali`, `pekerjaan_wali`, `penghasilan_wali`, `alamat_wali`, `no_telepon_hp_wali`) VALUES
(1, 'sutoyo', 'lemah', 'gaga', 'kalimantan', '1945-08-01', 'indonesia', 'Islam', 'S3', 'Buruh', 'Lebih dari Rp. 10.000.000', 'Tidak', 88898989, 'sutini', 'sjdasj', 'asdasd', 'asdasd', '2017-08-30', 'asdasd', 'Kristen', 'Sekolah Menengah Pertama', 'Petani', 'Rp. 500.000 sd Rp. 999.999', 'Terbelakang', 278123172, 'qqwe', 'uy2iuq1', '2017-08-21', 'D3', 'aadsad', 'Kristen', 'Peternak', 'Rp. 1.000.000 sd Rp. 1.999.999', 'asdkjahslkda', 832371237);

-- --------------------------------------------------------

--
-- Table structure for table `passing_grade`
--

CREATE TABLE `passing_grade` (
  `id_grade` int(3) NOT NULL,
  `id_tahun_ajaran` int(10) NOT NULL,
  `kategori` enum('Dalam Kota','Luar Kota') NOT NULL,
  `nilai` float NOT NULL,
  `tgl_berlaku` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pegawai`
--

CREATE TABLE `pegawai` (
  `NIP` varchar(20) NOT NULL,
  `nuptk` varchar(50) NOT NULL,
  `Nama` varchar(50) NOT NULL,
  `No_SK` varchar(20) NOT NULL,
  `Jenis_kelamin` enum('Laki-Laki','Perempuan') NOT NULL,
  `Golongan` varchar(10) NOT NULL,
  `alamat` text NOT NULL,
  `kontak` varchar(20) NOT NULL,
  `Agama` enum('Islam','Kristen','Katholik','Budha','Hindu','Lainnya') NOT NULL,
  `tempatlahir` varchar(255) NOT NULL,
  `TTL` date NOT NULL,
  `kode_guru` int(3) DEFAULT NULL,
  `foto` text,
  `TMT_capeg` date NOT NULL,
  `Pendidikan` enum('SMA','D3','S1','S2','S3','','','','') NOT NULL,
  `Status` enum('Guru','Karyawan') NOT NULL,
  `Status_pensiun` varchar(255) DEFAULT NULL,
  `nama_panggilan` varchar(255) NOT NULL,
  `pangkat` varchar(50) DEFAULT NULL,
  `matapelajaran` varchar(255) NOT NULL,
  `namaayah` varchar(50) DEFAULT NULL,
  `tempatlahirayah` varchar(255) DEFAULT NULL,
  `tanggallahirayah` date DEFAULT NULL,
  `agamaayah` enum('Islam','Kristen','Katholik','Budha','Hindu','Lainnya') DEFAULT NULL,
  `nomorayah` varchar(20) DEFAULT NULL,
  `pekerjaanayah` varchar(255) DEFAULT NULL,
  `alamatayah` text,
  `namaibu` varchar(50) DEFAULT NULL,
  `tempatlahiribu` varchar(255) DEFAULT NULL,
  `tanggallahiribu` date DEFAULT NULL,
  `agamaibu` enum('Islam','Kristen','Katholik','Budha','Hindu','Lainnya') DEFAULT NULL,
  `nomoribu` varchar(20) DEFAULT NULL,
  `pekerjaanibu` varchar(255) DEFAULT NULL,
  `alamatibu` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pegawai`
--

INSERT INTO `pegawai` (`NIP`, `nuptk`, `Nama`, `No_SK`, `Jenis_kelamin`, `Golongan`, `alamat`, `kontak`, `Agama`, `tempatlahir`, `TTL`, `kode_guru`, `foto`, `TMT_capeg`, `Pendidikan`, `Status`, `Status_pensiun`, `nama_panggilan`, `pangkat`, `matapelajaran`, `namaayah`, `tempatlahirayah`, `tanggallahirayah`, `agamaayah`, `nomorayah`, `pekerjaanayah`, `alamatayah`, `namaibu`, `tempatlahiribu`, `tanggallahiribu`, `agamaibu`, `nomoribu`, `pekerjaanibu`, `alamatibu`) VALUES
('110222337', '', 'Rohmatullah Alamin', '89239129399', 'Perempuan', 'III/A', 'Jalan gajah mada', '08524511555', 'Islam', '', '1956-01-30', 9998, NULL, '2019-01-30', 'D3', 'Guru', 'pensiun', 'Roh', 'Guru Muda', 'Bahasa Indonesia', '', '', '0000-00-00', 'Islam', '', '', '', '', '', '0000-00-00', 'Islam', '', '', ''),
('1111', '923842934823498', 'Sumbawa Mukaido', '218371238', 'Laki-Laki', 'II/A', 'jakdas', '08080002020', 'Islam', 'Padang', '1969-11-09', 1, '', '2017-11-10', 'D3', 'Karyawan', '', 'Sum', 'Guru Madya', 'Bahasa Inggris', 'Rahmat ', 'kalimantan', '2018-02-07', 'Islam', '08656536373647', 'Petani', 'Jalan Kaliurang', 'harmini', 'sleman', '2018-02-07', 'Budha', '92938123812', 'Ibu Rumah Tangga', 'Jalan Lintas Melawai'),
('11111', '', 'Ini Kurikulum', '123123123', 'Laki-Laki', 'IV/A', 'Jl. Kaliurang 14,5', '085244424242', 'Islam', '', '1967-12-21', 9, 'potrait99.jpg', '2017-12-08', 'S1', 'Guru', '', 'Kurikulum', 'Guru Madya', 'Penjaskes', '', '', '0000-00-00', 'Islam', '', '', '', '', '', '0000-00-00', 'Islam', '', '', ''),
('111222333', '', 'Rohmatullah', '89239129399', 'Perempuan', 'III/A', 'Jalan gajah mada', '08524511555', 'Islam', '', '1950-01-30', 999, NULL, '2019-01-30', 'D3', 'Guru', 'pensiun', 'Roh', 'Guru Muda', 'Bahasa Inggris', '', '', '0000-00-00', 'Islam', '', '', '', '', '', '0000-00-00', 'Islam', '', '', ''),
('1221129', '', 'Rusida ', '9888988899', 'Laki-Laki', 'IV/A', 'asdasd', '12312312', 'Islam', '', '1959-01-30', 6559, NULL, '2018-01-30', 'S3', 'Guru', NULL, 'Rus', 'Guru Muda', 'IPA', '', '', '0000-00-00', 'Islam', '', '', '', '', '', '0000-00-00', 'Islam', '', '', ''),
('12222', '21312222', 'Munawaroh', '1231231', 'Perempuan', 'III/B', 'Jalan Oevang Oeray', '1213123123', 'Islam', 'Kalimantan', '1959-12-18', 2, '11.jpg', '1993-09-10', 'S1', 'Karyawan', '', 'Muna', 'Guru Madya', 'Bahasa Indonesia', 'Aayah', 'kalimantan', '1951-02-14', 'Kristen', '085726262626', 'Petani aja', 'Jalan Lintas Melawi', 'ibu goro', 'sleman', '2018-02-03', 'Islam', '085724242424', 'Aapa aja', 'Jalan Kaliurang'),
('123', '', 'ACAH RIANTO, S,Pd', '123123', 'Laki-Laki', 'III/B', '32131', '21323', 'Katholik', 'Sintang', '1987-11-11', 1231231, '2.jpg', '2017-12-02', 'D3', 'Guru', '', '123123', 'Guru  Muda', 'Matematika', 'asdasd', 'asdasd', '2018-01-09', 'Islam', '21312', '123aseqw', 'asdasd', '13213', 'asdsda', '2018-01-17', 'Kristen', '085724242424', 'buruh', 'asdasdasd'),
('1231233412', '123123736473', 'Ridho Akbar Dermawan', '18237238137837', 'Laki-Laki', 'IV/A', 'Jalan Lintas Utara', '092837823', 'Islam', 'Sintang', '1989-11-09', 887788, NULL, '2017-11-09', 'S2', 'Guru', NULL, 'Ridho', 'Guru Madya', 'SKI', 'Ridho', 'Sintang', '2017-11-09', 'Islam', '082323728378', 'BUMN', 'Jalan Kaliurang', 'Ida', 'Kalimantan', '2017-11-09', 'Islam', '129831238', 'Ibu Rumah Tangga', 'Jalan Kaliurang'),
('12312334121', '12312373647378', 'Ridho Akbar Mulawaraman', '18237238137837', 'Laki-Laki', 'IV/A', 'Jalan Lintas Utara', '092837823', 'Islam', 'Sintang', '1958-11-01', 88778899, NULL, '2017-11-09', 'S2', 'Guru', NULL, 'Ridho', 'Guru Madya', 'SKI', 'Ridho', 'Sintang', '2017-11-09', 'Islam', '082323728378', 'BUMN', 'Jalan Kaliurang', 'Ida', 'Kalimantan', '2017-11-09', 'Islam', '129831238', 'Ibu Rumah Tangga', 'Jalan Kaliurang'),
('12345', '', 'akmal joshua', '12312 1763172 18923 ', 'Laki-Laki', 'III/A', 'jl kaliurang km 7,8 sinduharjo', '085726241111', 'Islam', 'sleman', '1958-01-02', 2, '', '2012-06-01', 'S1', 'Guru', 'pensiun', 'akmal', 'pranata madya', 'IPA', 'paijo', 'sleman', '1958-01-01', 'Islam', '085726262626', 'Petani', 'sleman', 'harmini', 'sleman', '1965-01-05', 'Islam', '085724242424', 'buruh', 'sleman'),
('123456', '', 'paijo', 'A5576767', 'Laki-Laki', 'IIIB', 'jl kaliurang', '085723232323', 'Islam', '', '1994-12-05', 3, '', '2004-12-01', 'S1', 'Guru', '', 'paijo', 'Guru Muda', 'IPA', '', '', '0000-00-00', 'Islam', '', '', '', '', '', '0000-00-00', 'Islam', '', '', ''),
('13313131', '', 'Muhammad Baharudin', '21982198288121', 'Laki-Laki', 'II/A', 'Jalan Kaliurang 14,5', '08080002020', 'Islam', '', '1995-04-04', 15, 'potrait.jpg', '2017-04-04', 'D3', 'Guru', '', 'Udin', 'Pranata Muda', 'Kesenian', '', '', '0000-00-00', 'Islam', '', '', '', '', '', '0000-00-00', 'Islam', '', '', ''),
('13523062', '', 'Nadya Indi Rahesti, S.Ag.', '12312', 'Perempuan', 'III/B', 'Jalan Sudiro Hoesodo', '0987889888', 'Katholik', 'Padang', '1978-02-07', 55, '1.jpg', '2018-01-12', 'D3', 'Guru', '', 'Aya', 'Guru Madya', 'IPA', 'Rahmat ', 'kalimantan', '2018-02-01', 'Kristen', '08656536373647', 'Petani', 'Jalan Kalimantan', 'Goro ro', 'Jawa', '2018-01-31', 'Kristen', '085724242424', 'buruh', 'Jalan Kalimantan'),
('13523069', '', 'Drs. Dodi Ahmad Shahrudin', '12831231', 'Laki-Laki', 'III/A', 'asdasd asd asdasd', '12323', 'Kristen', '', '1967-12-22', 11, '3.jpg', '2017-11-22', 'SMA', 'Guru', '', 'Dodi', 'Guru  Muda', '', '', '', '0000-00-00', '', '', '', '', '', '', '0000-00-00', '', '', '', ''),
('13523096', '', 'Mia Puspa Elizabeth 99', '923812371748343', 'Perempuan', 'III/B', 'Jl. Wates, Argomulyo, Sedayu, Bantul, Daerah Istimewa Yogyakarta 55753, Indonesia', 'III/B', 'Hindu', '', '1987-10-11', 4, '22.jpg', '2017-10-16', 'SMA', 'Guru', NULL, 'asdasd', '', '', '', '', '0000-00-00', 'Islam', '', '', '', '', '', '0000-00-00', 'Islam', '', '', ''),
('13523111', '', 'Anggraeni Dias Saputri', '6276312371', 'Perempuan', 'IV/B', 'Jl. Bibis Raya, Tamantirto, Kasihan, Bantul, Daerah Istimewa Yogyakarta 55183, Indonesia', '0897464736', 'Kristen', '', '1958-09-07', 5, 'potrait2.jpg', '2018-02-08', 'D3', 'Guru', '', 'anggrek', 'Guru  Muda', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('13523120', '', 'Ridwan Mulawarman', '988736746847', 'Laki-Laki', 'II/A', 'JLn. MT.Haryono', '12313123123', 'Kristen', 'Padang', '1975-12-13', 23, '4.jpg', '2000-10-14', 'SMA', 'Karyawan', '', 'Ridwan', 'Guru Muda', 'IPA', 'Rahmat ', 'Yogyakarta', '1951-12-18', 'Kristen', '08656536373647', 'Petani', 'Jalan Kaliurang km 14.5', 'Sutinah', 'Solo', '1955-12-15', 'Islam', '0862532632635', 'Ibu Rumah Tangga', 'Jalan Kaliurang km 14.5'),
('13523134', '', 'Luthfi Anggy Kurniawan', '887878', 'Laki-Laki', 'III/A', 'jksdhaksjdas das das das', '123123', 'Hindu', '', '1987-09-01', 55, '3.jpg', '2017-09-16', 'D3', 'Guru', NULL, 'Luthfi', '', '', '', '', '0000-00-00', 'Islam', '', '', '', '', '', '0000-00-00', 'Islam', '', '', ''),
('13523135', '123123123', 'Dr. Aulia Ahmad Urfan, S.Pd., M.Pd.', '12345678', 'Laki-Laki', 'IV/A', 'Jl. Stadion, Maguwoharjo, Kec. Depok, Kabupaten Sleman, Daerah Istimewa Yogyakarta 55281, Indonesia', '087646374847', 'Islam', 'Kalimantan', '1976-10-05', 1, '41.jpg', '1998-10-05', 'S3', 'Guru', '', 'Urfan', 'Penata Muda', 'Matematika', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('1352313599', '', 'MoMon', '123123', 'Laki-Laki', 'II/A', 'kljijoij', '123123', 'Hindu', '', '1995-09-08', 98, '3.jpg', '2017-09-09', 'S1', 'Guru', NULL, '12312', '', '', '', '', '0000-00-00', 'Islam', '', '', '', '', '', '0000-00-00', 'Islam', '', '', ''),
('13523136', '', 'Drs. Fikri Abdillah Fakhrudin', '726373664', 'Laki-Laki', 'II/A', 'Jalan Jalan', '09383938', 'Islam', '', '1995-11-15', 33, '4.jpg', '2017-11-02', 'S1', 'Guru', '', 'Fikri', '', '', '', '', '0000-00-00', 'Islam', '', '', '', '', '', '0000-00-00', 'Islam', '', '', ''),
('13523138', '', 'Alfandya', '1238273', 'Laki-Laki', 'III/A', 'ajsdj asdasd ', '8996', 'Islam', '', '1967-07-14', 223, '1.jpg', '2017-10-09', 'D3', 'Guru', '', 'alfan', 'Guru Madya', '', '', '', '0000-00-00', '', '', '', '', '', '', '0000-00-00', '', '', '', ''),
('13523139', '', 'Aulia Ahmad Urfan, S.Ag', '12839123', 'Perempuan', 'III/A', 'Jalan Khatulistiwa no.4', '12323', 'Katholik', '', '1987-10-26', 123123, '22.jpg', '2018-02-04', 'SMA', 'Karyawan', '', 'Brai', 'Penata Muda', 'IPS', '', '', '0000-00-00', 'Islam', '', '', '', '', '', '0000-00-00', 'Islam', '', '', ''),
('135231399', '', 'Cak Lontong', '123123123', 'Laki-Laki', 'IV/A', 'Jalan Kaliurang', '123132323', 'Kristen', '', '1986-02-27', 87, '', '2018-01-27', 'S2', 'Guru', '', 'Lontong', '', '', '', '', '0000-00-00', 'Islam', '', '', '', '', '', '0000-00-00', 'Islam', '', '', ''),
('13523143', '', 'Novendra Yoga Saputra 555', '193281293', 'Laki-Laki', 'III/A', 'jasdkajda sdasd', '9829389', 'Katholik', '', '1977-09-07', 34, 'potrait99.jpg', '2017-09-18', 'S1', 'Guru', NULL, 'Noven', '', '', '', '', '0000-00-00', 'Islam', '', '', '', '', '', '0000-00-00', 'Islam', '', '', ''),
('13523555', '', 'Iga Umari Hanami', '1738238123', 'Laki-Laki', 'II/A', 'jhjhjh', '123', 'Katholik', '', '2017-09-14', 8, '1.jpg', '2017-09-14', 'D3', 'Guru', '', 'Igaga', 'Guru  Muda', '', '', '', '0000-00-00', 'Islam', '', '', '', '', '', '0000-00-00', 'Islam', '', '', ''),
('198503302003121002', '9283123983', 'Alfandya', '9999878', 'Laki-Laki', 'IV/A', 'Jalan lintas Melawi', '0938383748478', 'Katholik', 'Padang', '2018-02-13', 9667, '', '2018-04-20', 'S1', 'Karyawan', NULL, 'alfan', 'pranata madya', 'Bahasa Inggris', 'Rahmat ', 'asdasd', '2018-02-16', 'Kristen', '085726262626', 'Petani', 'Jalan Melawi', 'Goro ro', 'sleman', '2018-01-15', 'Kristen', '085724242424', 'buruh', 'asdas'),
('333444555', '', 'Mahmud Mudmud', '88773566475', 'Laki-Laki', 'IV/A', 'Jalan Kaliurang', '08656563636', 'Budha', '', '2017-01-30', 33, NULL, '2017-10-30', 'S2', 'Karyawan', NULL, 'Mudmud', 'Guru Madya', 'IPA', '', '', '0000-00-00', 'Islam', '', '', '', '', '', '0000-00-00', 'Islam', '', '', ''),
('566656', '', 'Awas Ada Sule', '898989', 'Laki-Laki', 'II/A', 'sajdiasjdiasjdiasjdiajsdij', '098393489', 'Islam', 'Sintang', '2018-01-04', 7665, NULL, '2018-01-04', 'S2', 'Guru', NULL, 'sule', 'Guru Muda', 'Penjaskes', '', '', '0000-00-00', 'Islam', '', '', '', '', '', '0000-00-00', 'Islam', '', '', ''),
('676888999', '', 'Rodeo Kopet Kopet Kopet', '9888988899', 'Laki-Laki', 'IV/A', 'dfsldfskdjfldkfjlsdf', '12312312', 'Islam', '', '2018-01-30', 6559, NULL, '2018-01-30', 'S3', 'Guru', NULL, 'Rodeo', 'Guru Muda', 'IPA', '', '', '0000-00-00', 'Islam', '', '', '', '', '', '0000-00-00', 'Islam', '', '', ''),
('777888666', '', 'RIDHO HUHU', '28282828', 'Laki-Laki', 'III/C', 'djaisdjaisdjias', '99988899', 'Islam', '', '2018-10-10', 987, NULL, '2018-10-10', 'S3', 'Karyawan', NULL, 'HHHH', 'Guru Muda', 'B.indonesia', '', '', '0000-00-00', 'Islam', '', '', '', '', '', '0000-00-00', 'Islam', '', '', ''),
('87283282', '', 'Asep Show', '12732312321', 'Perempuan', 'II/A', 'Jalan Kaliurang Km 10', '0862262626', 'Budha', 'Yogya', '2017-12-06', 777, NULL, '2017-12-06', 'S2', 'Karyawan', NULL, 'TPI', 'Guru Muda', 'Bahasa Indonesia', 'Sahroni', 'Klaten', '2017-12-06', 'Budha', '087267262', 'Guru', 'Jalan Kaliurang km 11', 'Rosida', 'Kalimantan', '2017-12-06', 'Kristen', '089898889', 'Petani', 'Jalan MT Haryono'),
('888777', '', 'Ridho AAAAAA', '888877', 'Perempuan', 'III/A', 'sdaskjdasdkasdjaksdkj', '0293012930', 'Islam', '', '2018-01-10', 99999, NULL, '2018-01-10', 'S3', 'Karyawan', NULL, 'Ridho', 'Guru Madya', 'IPS', '', '', '0000-00-00', 'Islam', '', '', '', '', '', '0000-00-00', 'Islam', '', '', ''),
('989234', '', 'Amanullah Amany', '823773837', 'Laki-Laki', 'II/A', 'Jalan Lintas melawi', '83747474847', 'Budha', '', '2017-09-20', 23, '2.jpg', '2017-10-21', 'D3', 'Guru', NULL, 'Aman', '', '', '', '', '0000-00-00', 'Islam', '', '', '', '', '', '0000-00-00', 'Islam', '', '', ''),
('9999922', '', 'Muttaqin Gilll', '9999878', 'Laki-Laki', 'III/A', 'ljuhkgiugk.', '898989', 'Kristen', 'Sintang', '2017-12-01', 9667, 'potrait1.jpg', '2017-12-01', 'D3', 'Guru', '', 'taqin', 'Guru Muda', 'Matematika', 'Goro', 'kalimantan', '2017-12-28', 'Budha', '92831923891', 'Petani aja', 'asdas  asdas da s', 'ibu goro', 'Jawa', '2017-12-15', 'Hindu', '081237123', 'Aapa aja', 'asdasdasdasdasdasd');

-- --------------------------------------------------------

--
-- Table structure for table `pembimbing`
--

CREATE TABLE `pembimbing` (
  `id_pembimbing` int(5) NOT NULL,
  `nama_pembimbing` varchar(45) NOT NULL,
  `jabatan` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pendaftar_jalur_ujian`
--

CREATE TABLE `pendaftar_jalur_ujian` (
  `nomor_pendaftar_ujian` int(10) NOT NULL,
  `id_tahun_ajaran` int(10) NOT NULL,
  `nisn` varchar(10) NOT NULL,
  `id_akun_siswa` int(3) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `jenis_kelamin` enum('Perempuan','Laki-Laki') NOT NULL,
  `tempat_lahir` varchar(15) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `alamat` varchar(150) NOT NULL,
  `asal_sekolah` varchar(50) NOT NULL,
  `tahun_lulus` int(4) NOT NULL,
  `nilai_ujian_1` int(4) NOT NULL,
  `nilai_ujian_2` int(4) NOT NULL,
  `nilai_ujian_3` int(4) NOT NULL,
  `nilai_ujian_4` int(4) NOT NULL,
  `nilai_ujian_5` int(4) NOT NULL,
  `nilai_ujian_6` int(4) NOT NULL,
  `status_siswa` enum('Diterima','Tidak Diterima','Dicabut') NOT NULL,
  `fc_rapor` tinyint(1) NOT NULL,
  `fc_skhun` tinyint(1) NOT NULL,
  `surat_ket_nisn` tinyint(1) NOT NULL,
  `skck_kepsek` tinyint(1) NOT NULL,
  `fc_akta_lahir` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pendaftar_jalur_un`
--

CREATE TABLE `pendaftar_jalur_un` (
  `no_pendaftar` int(10) NOT NULL,
  `id_tahun_ajaran` int(10) NOT NULL,
  `nisn` varchar(10) NOT NULL,
  `id_akun_siswa` int(3) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `jenis_kelamin` enum('Perempuan','Laki-Laki') NOT NULL,
  `tempat_lahir` varchar(15) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `alamat` varchar(1000) NOT NULL,
  `asal_sekolah` varchar(30) NOT NULL,
  `th_lulus` int(4) NOT NULL,
  `domisili` enum('Dalam Kota','Luar Kota') NOT NULL,
  `nilai_ind` float NOT NULL,
  `nilai_mat` float NOT NULL,
  `nilai_ipa` float NOT NULL,
  `nun` float NOT NULL,
  `pilih_sekolah_1` varchar(20) NOT NULL,
  `pilih_sekolah_2` varchar(20) NOT NULL,
  `pilih_sekolah_3` varchar(20) NOT NULL,
  `bukti_pengajuan_daftar` tinyint(1) NOT NULL,
  `fc_ijazah` tinyint(1) NOT NULL,
  `skhun` tinyint(1) NOT NULL,
  `fc_skhun` tinyint(1) NOT NULL,
  `surat_keterangan_penambahan_nilai` tinyint(1) NOT NULL,
  `fc_kk` tinyint(1) NOT NULL,
  `surat_ket_rt` tinyint(1) NOT NULL,
  `surat_keterangan_napza` tinyint(1) NOT NULL,
  `berkas_1` tinyint(1) NOT NULL,
  `berkas_2` tinyint(1) NOT NULL,
  `berkas_3` tinyint(1) NOT NULL,
  `berkas_4` tinyint(1) NOT NULL,
  `berkas_5` tinyint(1) NOT NULL,
  `status_siswa` enum('Diterima','Ditolak','Dicabut') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pendaftar_ppdb`
--

CREATE TABLE `pendaftar_ppdb` (
  `nomor_pendaftaran` int(10) DEFAULT NULL,
  `no_usbn` varchar(20) DEFAULT NULL,
  `id_tahun_ajaran` int(10) NOT NULL,
  `nisn_pendaftar` varchar(10) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `jenis_kelamin` enum('Perempuan','Laki-Laki') DEFAULT NULL,
  `tempat_lahir` varchar(50) DEFAULT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `alamat` varchar(150) DEFAULT NULL,
  `asal_sekolah` varchar(50) DEFAULT NULL,
  `domisili` enum('Dalam Daerah','Luar Daerah') DEFAULT NULL,
  `tahun_lulus` int(4) DEFAULT NULL,
  `nilai_un_ind` float DEFAULT NULL,
  `nilai_un_mat` float DEFAULT NULL,
  `nilai_un_ipa` float DEFAULT NULL,
  `nilai_prestasi` float DEFAULT NULL,
  `nilai_un_nun` float DEFAULT NULL,
  `pilihan_sekolah_1` varchar(50) DEFAULT NULL,
  `pilihan_sekolah_2` varchar(50) DEFAULT NULL,
  `pilihan_sekolah_3` varchar(50) DEFAULT NULL,
  `ujian_1` float DEFAULT NULL,
  `ujian_2` float DEFAULT NULL,
  `ujian_3` float DEFAULT NULL,
  `ujian_4` float DEFAULT NULL,
  `ujian_5` float DEFAULT NULL,
  `ujian_6` float DEFAULT NULL,
  `ujian_7` float DEFAULT NULL,
  `ujian_8` float DEFAULT NULL,
  `ujian_9` float DEFAULT NULL,
  `ujian_10` float DEFAULT NULL,
  `total_nilai` float DEFAULT NULL,
  `status_siswa` enum('Diterima','Tidak Diterima','Dicabut','') DEFAULT NULL,
  `fc_rapor` tinyint(1) DEFAULT NULL,
  `fc_ijazah` tinyint(1) DEFAULT NULL,
  `skhun` tinyint(1) DEFAULT NULL,
  `fc_skhun` tinyint(1) DEFAULT NULL,
  `bukti_pengajuan_daftar` tinyint(1) DEFAULT NULL,
  `surat_keterangan_penambah_nilai` tinyint(1) DEFAULT NULL,
  `surat_ket_nisn` tinyint(1) DEFAULT NULL,
  `skck_kepsek` tinyint(1) DEFAULT NULL,
  `fc_akta_lahir` tinyint(1) DEFAULT NULL,
  `fc_kk` tinyint(1) DEFAULT NULL,
  `surat_ket_rt` tinyint(1) DEFAULT NULL,
  `surat_keterangan_napza` tinyint(1) DEFAULT NULL,
  `berkas_1` tinyint(1) DEFAULT NULL,
  `berkas_2` tinyint(1) DEFAULT NULL,
  `berkas_3` tinyint(1) DEFAULT NULL,
  `berkas_4` tinyint(1) DEFAULT NULL,
  `berkas_5` tinyint(1) DEFAULT NULL,
  `terverifikasi` enum('Terverifikasi','Belum','','') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `pendaftar_ppdb`
--

INSERT INTO `pendaftar_ppdb` (`nomor_pendaftaran`, `no_usbn`, `id_tahun_ajaran`, `nisn_pendaftar`, `nama`, `jenis_kelamin`, `tempat_lahir`, `tanggal_lahir`, `alamat`, `asal_sekolah`, `domisili`, `tahun_lulus`, `nilai_un_ind`, `nilai_un_mat`, `nilai_un_ipa`, `nilai_prestasi`, `nilai_un_nun`, `pilihan_sekolah_1`, `pilihan_sekolah_2`, `pilihan_sekolah_3`, `ujian_1`, `ujian_2`, `ujian_3`, `ujian_4`, `ujian_5`, `ujian_6`, `ujian_7`, `ujian_8`, `ujian_9`, `ujian_10`, `total_nilai`, `status_siswa`, `fc_rapor`, `fc_ijazah`, `skhun`, `fc_skhun`, `bukti_pengajuan_daftar`, `surat_keterangan_penambah_nilai`, `surat_ket_nisn`, `skck_kepsek`, `fc_akta_lahir`, `fc_kk`, `surat_ket_rt`, `surat_keterangan_napza`, `berkas_1`, `berkas_2`, `berkas_3`, `berkas_4`, `berkas_5`, `terverifikasi`) VALUES
(20, '853697546', 2, '0023314997', 'Mia Puspa Pertiwi Swasta', 'Perempuan', 'Kulon Progo', '1999-09-04', 'Jalan Ngaglik', 'SD Negeri 1 Yogyakarta', NULL, 2010, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 80, 80, 80, 80, 80, 80, NULL, NULL, NULL, NULL, 480, 'Diterima', 1, 1, 1, 1, 1, 1, 1, 1, 1, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 'Terverifikasi'),
(5, '927892098', 3, '017826567', 'Adimas Pura Susanto Swasta', 'Laki-Laki', 'Sleman', '2010-11-06', 'Jalan Cik Ditiro Nomor 45 ', 'SD Sukacita', NULL, 2017, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 80, 80, 80, 80, 10, 80, NULL, NULL, NULL, NULL, 410, 'Tidak Diterima', 1, 1, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Belum'),
(18, '323233232', 2, '029384627', 'Nur Muhammad', 'Laki-Laki', 'Sleman', '1995-08-22', 'Jalan Jalan', 'SD Ungaran 3', NULL, 2016, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Dicabut', 1, 1, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Terverifikasi'),
(9, '8302738490193784590', 2, '034182579', 'Laili Hening Puspitasari Swasta', 'Perempuan', 'Pekalongan', '2000-09-14', 'Perumahan Griya Asri Permata Jalan Mawar Blok G nomor 59', 'SD Negeri 8 Yogyakarta', 'Luar Daerah', 2016, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Dicabut', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Belum'),
(11, NULL, 2, '0426389062', 'Kartika Eka Putri Swasta', 'Perempuan', 'Pekalongan', '2000-09-14', 'Perumahan Griya Asri Permata Jalan Mawar Blok G nomor 59', 'SD Negeri 8 Yogyakarta', 'Luar Daerah', 2016, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 'Tidak Diterima', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Belum'),
(7, '627930492736279108', 2, '0527392736', 'Ridho Ahmad Darmawan Swasta', 'Laki-Laki', 'Wonosari', '1999-10-01', 'Jalan Ki Mangunsarkoro', 'SD IT Wonosari', 'Dalam Daerah', 2016, 0, 0, 0, 0, 0, NULL, NULL, NULL, 20, 20, 20, 20, 0, 0, NULL, NULL, NULL, NULL, 80, '', 1, 1, 1, 1, 1, 1, 1, 1, 1, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, 'Terverifikasi'),
(14, '135235231', 2, '0538261545', 'Nadya Indi Coba Negeri', 'Perempuan', 'Ngaglik', '1998-09-03', 'Perumahan Green Village ', 'SD Negeri 6 Ngaglik', 'Luar Daerah', 2015, 80, 90, 80, 0, 250, 'SMP Negeri 5 Yogyakarta', 'SMP Negeri 7 Yogyakarta', 'SMP Negeri 1 Yogyakarta', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Diterima', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Terverifikasi'),
(4, '12345', 2, '054739285', 'Anggraeni Putri Nyaa Negeri', 'Perempuan', 'Sleman', '1999-09-03', 'Jalan Diponegoro Nomor 90 Blok G', 'SD Negeri Proyonanggan 2', 'Luar Daerah', 2015, 90, 90, 90, 1, 271, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Belum'),
(5, '9372840581938267503', 2, '062738190', 'Muhamad Hafiz Swasta', 'Laki-Laki', 'Kulon Progo', '2017-09-03', 'Perumahan Gedong Kosong Ria Gang Cendrawasih Nomor 89 Kulon Progo, Yogyakarta', 'SD Negeri 1 Kulon progo', 'Luar Daerah', 2016, 80, 90, 80, 0, 250, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Dicabut', 1, 1, 1, 1, 1, 1, 1, 1, 1, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 'Terverifikasi'),
(15, '0928368194009568757', 2, '082056233', 'Tutwuri Handayani Negeri', 'Perempuan', 'Ngemplak', '2000-09-25', 'Jalan Kaliurang KM 14,5 Gang Puntodewo Nomor 59 Sleman, Yogyakarta', 'SD Negeri 1 Yogyakarta', NULL, 2016, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Belum'),
(6, '928364729273647', 2, '082548272', 'Sarah Franseska Negeri', 'Perempuan', 'Kepek', '1999-09-01', 'Jalan Ki Hajar Dewantoro Gang Anggrek Nomor 56 Kepek, Gunung Kidul, Yogyakarta', 'SD Negeri 1 Kepek', 'Luar Daerah', 2016, 80, 80, 80, 2, 242, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Tidak Diterima', 1, 1, 1, 1, 1, NULL, 1, 1, 1, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 'Belum'),
(17, '0928368194539568757', 2, '082916233', 'Nawangwulan Putri Hermanto Negeri', 'Perempuan', 'Ngemplak', '2000-09-25', 'Jalan Kaliurang KM 14,5 Gang Puntodewo Nomor 59 Sleman, Yogyakarta', 'SD Negeri 1 Yogyakarta', 'Dalam Daerah', 2016, 90, 90, 0, 0, 270, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Tidak Diterima', 1, 1, 1, 1, 1, 1, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, 'Terverifikasi'),
(13, '0928368192039568757', 2, '082916245', 'Adam Putra Restyawan Negeri', 'Laki-Laki', 'Ngemplak', '2000-09-25', 'Jalan Kaliurang KM 14,5 Gang Puntodewo Nomor 59 Sleman, Yogyakarta', 'SD Negeri 1 Yogyakarta', 'Dalam Daerah', 2016, 90, 90, 0, 10, 280, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Dicabut', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Belum'),
(21, '019287438920192876', 2, '082971341', 'Bulan Permata Negeri', 'Perempuan', 'Umbulpermai', '2000-09-11', 'Jalan Pattimura Nomor 59', 'SD Sukamakmur', 'Luar Daerah', 2016, 80, 80, 80, 0, 240, 'SMP 8 ', 'SMP 7', 'SMP 6', 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 'Tidak Diterima', 1, 1, 1, 1, 1, 1, 1, 1, 1, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, 'Belum'),
(2, '6281098098', 2, '0871637719', 'Anggita Puteri Negeri ', 'Perempuan', 'Sleman', '1999-09-05', 'Jombor ya jj', 'SD Negeri 9 Sleman', 'Dalam Daerah', 2016, 90, 90, 90, 1, 271, 'SMP Negeri 8 Yogyakarta', 'SMP Negeri 9 Yogyakarta', 'SMP Negeri 1 Yogyakarta', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Diterima', 1, 1, 1, 1, 1, 1, 1, 1, 1, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 'Terverifikasi'),
(10, '13523523039', 2, '0914262787', 'Nadya Indi Coba Swasta', 'Perempuan', 'Ngemplak', '1998-01-17', 'Jalan Kaliurang KM 14,5 Gang Puntodewo Nomor 45 Ngemplak, Sleman, Yogyakarta', 'SD Negeri 9 Ngemplak', 'Dalam Daerah', 2015, 0, 0, 0, 0, 0, NULL, NULL, NULL, 80, 70, 60, 40, 0, 0, NULL, NULL, NULL, NULL, 250, '', NULL, 1, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Belum'),
(4, '819203928', 3, '091827654', 'Susanti Melati Negeri', 'Perempuan', 'Ngemplak', '2010-11-01', 'Jalan Dr. Cipto Nomor 41', 'SD Sukamaju', 'Luar Daerah', 2016, 65, 70, 78, 5, 218, 'SMP Negeri 8 Yogyakarta', 'SMP Negeri 9 Yogyakarta', 'SMP Negeri 1 Yogyakarta', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, 'Belum'),
(1, '8302738490193784509', 2, '0923739201', 'Railo Emerald Putra Swasta', 'Perempuan', 'Pekalongan', '2000-09-14', 'Jalan Mawar Nomr 157 Kecepak', 'SD Sukamaju', 'Luar Daerah', 2016, 0, 0, 0, 0, 0, NULL, NULL, NULL, 80, 80, 80, 80, 80, 80, 80, 80, 80, 80, 800, 'Diterima', 1, 1, 1, 1, 1, 1, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, 'Terverifikasi'),
(2, '892017283', 3, '092837182', 'Jeno Anugrah Setya Negri', 'Laki-Laki', 'Ngaglik', '2010-01-04', 'Jalan Parangtritis Noor 56', 'SD Parangtitis 9', 'Luar Daerah', 2016, 80, 90, 90, 0, 260, 'SMP Negeri 8 Yogyakarta', 'SMP Negeri 1 Yogyakarta', 'SMP Negeri 2 Yogyakarta', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Diterima', 1, 1, 1, 1, 1, 1, 1, 1, 1, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 'Terverifikasi'),
(1, '938294856', 3, '092837401', 'Anggraeni Dias Saputri Negeri', 'Perempuan', 'Batang', '2010-11-09', 'Jalan Bima Nomor 26 Ngaglik', 'SD Negeri Ngaglik ', 'Dalam Daerah', 2017, 90, 90, 90, 0, 270, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Tidak Diterima', 1, 1, 1, 1, 1, 1, 1, 1, 1, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 'Belum'),
(16, '83920120397', 2, '092837462', 'Rahmad Subekti Swasta', 'Laki-Laki', 'Bandung', '2000-09-15', 'Perumahan Sigi Lalala ', 'SD Negeri 5 Sleman', NULL, 2000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, 'Belum'),
(3, '0284638273940598276', 2, '092837483', 'Ayyana Putri Negeri', 'Perempuan', 'Batang', '2017-07-06', 'Jalan Dr. Cipto No 3', 'SD Swasta 3 Yogyakarta', NULL, 2016, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Belum'),
(3, '892019283', 3, '093283493', 'Casmi Putri Fitriani Swasta', 'Perempuan', 'Batang', '2010-09-15', 'Perumahan Griya Mukti Indah', 'SD Negeri Proyonanggan 5', NULL, 2016, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 100, 100, 80, 80, 100, 90, NULL, NULL, NULL, NULL, 550, 'Diterima', 1, 1, 1, 1, 1, 1, 1, 1, 1, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 'Terverifikasi'),
(12, '6379201826374829182', 2, '093745289', 'Fahni Nesa Khulqi Negeri', 'Perempuan', 'Umbulharjo', '2000-08-17', 'Perumahan Griya Indah Permai Gang Nangka Nomor 57 Ngemplak, Sleman, Yogyakarta', 'SD Negeri 1 Sleman', '', 2016, 80, 80, NULL, 1, 241, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(22, '1234567890', 2, '123918736', 'Cantika Pitrika Veronika Negeri', 'Perempuan', 'Bandar Lampung', '2005-09-20', 'Perumahan Rahasia Negara', 'SD Negeri 5 Sleman', NULL, 2017, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Belum');

-- --------------------------------------------------------

--
-- Table structure for table `pengumuman_mutasi`
--

CREATE TABLE `pengumuman_mutasi` (
  `id_pengumuman_mutasi` int(10) NOT NULL,
  `tgl_pengumuman` date NOT NULL,
  `judul_pengumuman` text NOT NULL,
  `isi_pengumuman` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pengumuman_ppdb`
--

CREATE TABLE `pengumuman_ppdb` (
  `id_pengumuman_ppdb` int(5) NOT NULL,
  `judul` varchar(50) NOT NULL,
  `isi` text NOT NULL,
  `tanggal_berlaku` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `poin_pelanggaran`
--

CREATE TABLE `poin_pelanggaran` (
  `nisn` varchar(10) NOT NULL,
  `id_jenis_pelanggaran` int(20) NOT NULL,
  `id_poin_pelanggaran` int(20) NOT NULL,
  `kategori` varchar(100) NOT NULL,
  `poin` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `presensisiswa`
--

CREATE TABLE `presensisiswa` (
  `id_presensisiswa` int(10) NOT NULL,
  `Tanggal_presensisiswa` date NOT NULL,
  `Waktu_presensisiswa` time NOT NULL,
  `Keterangan_presensiswa` text,
  `Rangkuman_presensisiswa` varchar(25) NOT NULL,
  `nisn` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `presensisiswa`
--

INSERT INTO `presensisiswa` (`id_presensisiswa`, `Tanggal_presensisiswa`, `Waktu_presensisiswa`, `Keterangan_presensiswa`, `Rangkuman_presensisiswa`, `nisn`) VALUES
(1, '2018-02-01', '00:00:00', NULL, 'H', '12345'),
(2, '2018-02-02', '00:00:00', NULL, 'H', '12345'),
(3, '2018-02-03', '00:00:00', NULL, 'S', '12345'),
(4, '2018-02-05', '00:00:00', NULL, 'H', '12345');

-- --------------------------------------------------------

--
-- Table structure for table `presensi_pegawai`
--

CREATE TABLE `presensi_pegawai` (
  `Id_presensi` int(10) NOT NULL,
  `Tanggal_presensi` date NOT NULL,
  `Waktu_presensi` time DEFAULT NULL,
  `Rangkuman_presensi` varchar(25) NOT NULL,
  `keterangan_presensi` text,
  `NIP` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `presensi_pegawai`
--

INSERT INTO `presensi_pegawai` (`Id_presensi`, `Tanggal_presensi`, `Waktu_presensi`, `Rangkuman_presensi`, `keterangan_presensi`, `NIP`) VALUES
(95, '2017-10-02', '07:10:00', 'S', 'Sakit GIGI', '12222'),
(96, '2017-10-03', '07:00:00', 'H', NULL, '12222'),
(97, '2017-10-04', '07:00:00', 'H', NULL, '12222'),
(98, '2017-10-05', '07:00:00', 'H', NULL, '12222'),
(99, '2017-10-06', '07:00:00', 'H', NULL, '12222'),
(100, '2017-10-07', '00:00:00', 'H', NULL, '12222'),
(101, '2017-10-25', '00:00:00', 'I', NULL, '12222'),
(102, '2017-10-26', '07:10:00', 'H', NULL, '12222'),
(103, '2017-10-27', '07:10:00', 'H', NULL, '12222'),
(104, '2017-10-30', '07:10:00', 'H', NULL, '12222'),
(105, '2017-10-02', '07:10:00', 'H', '', '13523069'),
(106, '2017-10-03', '07:10:00', 'H', NULL, '13523069'),
(107, '2017-10-04', '07:10:00', 'H', NULL, '13523069'),
(108, '2017-10-25', '00:00:00', 'S', NULL, '13523069'),
(109, '2017-10-26', '00:00:00', 'S', NULL, '13523069'),
(110, '2017-10-27', '00:00:00', 'H', NULL, '13523069'),
(111, '2017-10-30', '07:10:00', 'H', NULL, '13523069'),
(112, '2017-10-05', '07:00:00', 'H', NULL, '13523069'),
(113, '2017-10-02', '07:00:00', 'H', '', '13523096'),
(114, '2017-10-03', '07:00:00', 'H', NULL, '13523096'),
(115, '2017-10-04', '07:00:00', 'H', NULL, '13523096'),
(116, '2017-10-05', '07:00:00', 'H', NULL, '13523096'),
(117, '2017-10-02', '00:00:00', 'H', '', '13523111'),
(118, '2017-10-03', '00:00:00', 'H', NULL, '13523111'),
(119, '2017-10-04', '00:00:00', 'S', NULL, '13523111'),
(120, '2017-10-05', '00:00:00', 'S', NULL, '13523111'),
(121, '2017-10-02', '00:00:00', 'S', NULL, '999000'),
(122, '2017-10-03', '07:00:00', 'H', NULL, '999000'),
(123, '2017-10-04', '07:00:00', 'H', NULL, '999000'),
(124, '2017-10-09', '07:00:00', 'H', NULL, '12222'),
(125, '2017-10-10', '07:00:00', 'H', NULL, '12222'),
(126, '2017-10-11', '00:00:00', 'A', NULL, '12222'),
(127, '2017-10-12', '07:00:00', 'H', NULL, '12222'),
(128, '2017-10-13', '00:00:00', 'I', NULL, '12222'),
(129, '2017-10-14', '00:00:00', 'I', NULL, '12222'),
(130, '2017-10-16', '00:00:00', 'A', NULL, '12222'),
(131, '2017-10-17', '07:00:00', 'H', NULL, '12222'),
(132, '2017-10-18', '00:00:00', 'S', NULL, '12222'),
(133, '2017-10-19', '07:00:00', 'H', NULL, '12222'),
(134, '2017-10-20', '07:00:00', 'H', NULL, '12222'),
(135, '2017-10-21', '00:00:00', 'I', NULL, '12222'),
(136, '2017-10-23', '07:00:00', 'H', NULL, '12222'),
(137, '2017-10-24', '00:00:00', 'A', NULL, '12222'),
(138, '2017-10-23', '07:00:00', 'H', NULL, '13523069'),
(139, '2017-10-24', '00:00:00', 'A', NULL, '13523069'),
(140, '2017-01-02', '07:00:00', 'H', NULL, '12222'),
(141, '2017-01-03', '07:00:00', 'H', NULL, '12222'),
(142, '2017-01-04', '07:00:00', 'H', NULL, '12222'),
(143, '2017-01-05', '07:00:00', 'H', NULL, '12222'),
(144, '2017-01-02', '07:00:00', 'H', NULL, '13523069'),
(145, '2017-01-03', '07:00:00', 'H', NULL, '13523069'),
(146, '2017-01-04', '07:00:00', 'H', NULL, '13523069'),
(147, '2017-01-05', '06:40:00', 'H', NULL, '13523069'),
(148, '2017-01-02', '07:00:00', 'H', NULL, '13523096'),
(149, '2017-01-03', '07:00:00', 'H', NULL, '13523096'),
(150, '2017-01-04', '07:00:00', 'H', NULL, '13523096'),
(151, '2017-01-05', '07:00:00', 'H', NULL, '13523096'),
(152, '2017-01-02', '07:00:00', 'H', NULL, '13523111'),
(153, '2017-01-03', '07:00:00', 'H', NULL, '13523111'),
(154, '2017-01-04', '07:00:00', 'H', NULL, '13523111'),
(155, '2017-01-05', '06:40:00', 'H', NULL, '13523111'),
(156, '2017-01-02', '00:00:00', 'S', NULL, '13523134'),
(157, '2017-01-03', '00:00:00', 'S', NULL, '13523134'),
(158, '2017-01-04', '00:00:00', 'S', NULL, '13523134'),
(159, '2017-01-05', '07:00:00', 'H', NULL, '13523134'),
(160, '2017-01-02', '06:40:00', 'H', NULL, '13523135'),
(161, '2017-01-03', '06:40:00', 'H', NULL, '13523135'),
(162, '2017-01-04', '07:00:00', 'H', NULL, '13523135'),
(163, '2017-01-05', '06:30:00', 'H', NULL, '13523135'),
(164, '2017-01-02', '07:00:00', 'S', NULL, '1352313599'),
(165, '2017-01-03', '07:00:00', 'H', NULL, '1352313599'),
(166, '2017-01-04', '07:00:00', 'H', NULL, '1352313599'),
(167, '2017-01-05', '07:00:00', 'H', NULL, '1352313599'),
(168, '2017-01-02', '00:00:00', 'I', NULL, '13523138'),
(169, '2017-01-03', '00:00:00', 'I', NULL, '13523138'),
(170, '2017-01-04', '00:00:00', 'I', NULL, '13523138'),
(171, '2017-01-05', '07:00:00', 'H', NULL, '13523138'),
(172, '2017-01-02', '07:00:00', 'H', NULL, '13523143'),
(173, '2017-01-03', '07:00:00', 'H', NULL, '13523143'),
(174, '2017-01-04', '00:00:00', 'A', NULL, '13523143'),
(175, '2017-01-05', '00:00:00', 'A', NULL, '13523143'),
(176, '2017-01-02', '07:00:00', 'H', NULL, '13523555'),
(177, '2017-01-03', '00:00:00', 'S', NULL, '13523555'),
(178, '2017-01-04', '00:00:00', 'S', NULL, '13523555'),
(179, '2017-01-05', '07:00:00', 'H', NULL, '13523555'),
(180, '2017-01-02', '07:00:00', 'H', NULL, '976'),
(181, '2017-01-03', '06:40:00', 'H', NULL, '976'),
(182, '2017-01-04', '07:00:00', 'H', NULL, '976'),
(183, '2017-01-05', '00:00:00', 'A', NULL, '976'),
(184, '2017-01-02', '06:40:00', 'H', NULL, '9892'),
(185, '2017-01-03', '07:00:00', 'H', NULL, '9892'),
(186, '2017-01-04', '06:40:00', 'H', NULL, '9892'),
(187, '2017-01-05', '07:00:00', 'H', NULL, '9892'),
(188, '2017-01-02', '07:00:00', 'H', NULL, '989234'),
(189, '2017-01-03', '07:00:00', 'H', NULL, '989234'),
(190, '2017-01-04', '06:30:00', 'H', NULL, '989234'),
(191, '2017-01-05', '06:40:00', 'H', NULL, '989234'),
(192, '2017-01-02', '06:30:00', 'H', NULL, '999'),
(193, '2017-01-03', '06:40:00', 'H', NULL, '999'),
(194, '2017-01-04', '06:30:00', 'H', NULL, '999'),
(195, '2017-01-05', '07:00:00', 'H', NULL, '999'),
(196, '2017-01-02', '00:00:00', 'I', NULL, '999000'),
(197, '2017-01-03', '00:00:00', 'I', NULL, '999000'),
(198, '2017-01-04', '00:00:00', 'I', NULL, '999000'),
(199, '2017-01-05', '07:00:00', 'H', NULL, '999000'),
(200, '2016-01-01', '07:00:00', 'H', NULL, '12222'),
(201, '2016-01-02', '07:00:00', 'H', NULL, '12222'),
(202, '2016-01-04', '07:00:00', 'H', NULL, '12222'),
(203, '2016-01-05', '07:00:00', 'H', NULL, '12222'),
(204, '2016-01-06', '07:00:00', 'H', NULL, '12222'),
(205, '2016-01-07', '07:00:00', 'H', NULL, '12222'),
(206, '2016-01-08', '07:00:00', 'H', NULL, '12222'),
(207, '2016-01-09', '07:00:00', 'H', NULL, '12222'),
(208, '2016-01-11', '00:00:00', 'I', NULL, '12222'),
(209, '2016-01-01', '07:00:00', 'H', NULL, '13523069'),
(210, '2016-01-02', '07:00:00', 'H', NULL, '13523069'),
(211, '2016-01-04', '07:00:00', 'H', NULL, '13523069'),
(212, '2016-01-05', '07:00:00', 'H', NULL, '13523069'),
(213, '2016-01-06', '07:00:00', 'H', NULL, '13523069'),
(214, '2016-01-07', '07:00:00', 'H', NULL, '13523069'),
(215, '2016-01-08', '07:00:00', 'H', NULL, '13523069'),
(216, '2016-01-09', '07:00:00', 'H', NULL, '13523069'),
(217, '2016-01-11', '00:00:00', 'I', NULL, '13523069'),
(218, '2016-01-01', '07:00:00', 'H', NULL, '13523096'),
(219, '2016-01-02', '07:00:00', 'H', NULL, '13523096'),
(220, '2016-01-04', '07:00:00', 'H', NULL, '13523096'),
(221, '2016-01-05', '07:00:00', 'H', NULL, '13523096'),
(222, '2016-01-06', '07:00:00', 'H', NULL, '13523096'),
(223, '2016-01-07', '07:00:00', 'H', NULL, '13523096'),
(224, '2016-01-08', '07:00:00', 'H', NULL, '13523096'),
(225, '2016-01-09', '07:00:00', 'H', NULL, '13523096'),
(226, '2016-01-11', '00:00:00', 'I', NULL, '13523096'),
(227, '2017-01-06', '00:00:00', 'S', NULL, '12222'),
(228, '2017-01-06', '07:00:00', 'H', NULL, '13523069'),
(229, '2017-01-06', '00:00:00', 'S', NULL, '13523096'),
(230, '2017-01-06', '00:00:00', 'I', NULL, '13523111'),
(231, '2017-01-06', '00:00:00', 'I', NULL, '13523134'),
(232, '2017-01-06', '07:00:00', 'H', NULL, '13523135'),
(233, '2017-01-06', '07:00:00', 'H', NULL, '1352313599'),
(234, '2017-01-06', '00:00:00', 'I', NULL, '13523138'),
(235, '2017-01-06', '07:00:00', 'H', NULL, '13523143'),
(236, '2017-01-06', '00:00:00', 'I', NULL, '13523555'),
(237, '2017-01-06', '07:00:00', 'H', NULL, '976'),
(238, '2017-01-06', '07:00:00', 'H', NULL, '9892'),
(239, '2017-01-06', '07:00:00', 'H', NULL, '989234'),
(240, '2017-01-06', '07:00:00', 'H', NULL, '999'),
(241, '2017-01-06', '07:00:00', 'H', NULL, '999000'),
(242, '2017-11-01', '07:00:00', 'H', NULL, '12222'),
(243, '2017-11-02', '07:00:00', 'H', NULL, '12222'),
(244, '2017-11-03', '07:00:00', 'H', NULL, '12222'),
(245, '2017-11-01', '07:00:00', 'H', NULL, '13523069'),
(246, '2017-11-02', '07:00:00', 'H', NULL, '13523069'),
(247, '2017-11-03', '07:00:00', 'H', NULL, '13523069'),
(248, '2017-11-01', '07:00:00', 'H', NULL, '13523096'),
(249, '2017-11-02', '07:00:00', 'H', NULL, '13523096'),
(250, '2017-11-03', '07:00:00', 'H', NULL, '13523096'),
(251, '2017-11-01', '07:00:00', 'H', NULL, '13523111'),
(252, '2017-11-02', '07:00:00', 'H', NULL, '13523111'),
(253, '2017-11-03', '00:00:00', 'H', NULL, '13523111'),
(254, '2017-11-01', '00:00:00', 'H', NULL, '13523134'),
(255, '2017-11-02', '00:00:00', 'S', NULL, '13523134'),
(256, '2017-11-03', '00:00:00', 'S', NULL, '13523134'),
(257, '2017-11-01', '00:00:00', 'H', NULL, '13523135'),
(258, '2017-11-02', '00:00:00', 'H', NULL, '13523135'),
(259, '2017-11-03', '00:00:00', 'H', NULL, '13523135'),
(260, '2017-11-04', '00:00:00', 'H', NULL, '13523135'),
(261, '2017-11-01', '00:00:00', 'S', NULL, '1352313599'),
(262, '2017-11-02', '00:00:00', 'S', NULL, '1352313599'),
(263, '2017-11-03', '00:00:00', 'H', NULL, '1352313599'),
(264, '2017-11-04', '00:00:00', 'H', NULL, '1352313599'),
(265, '2017-11-01', '00:00:00', 'H', NULL, '13523138'),
(266, '2017-11-02', '00:00:00', 'H', NULL, '13523138'),
(267, '2017-11-03', '00:00:00', 'S', NULL, '13523138'),
(268, '2017-11-04', '00:00:00', 'S', NULL, '13523138'),
(269, '2017-11-01', '00:00:00', 'S', NULL, '13523143'),
(270, '2017-11-02', '00:00:00', 'H', NULL, '13523143'),
(271, '2017-11-03', '00:00:00', 'H', NULL, '13523143'),
(272, '2017-11-04', '00:00:00', 'S', NULL, '13523143'),
(273, '2017-11-01', '00:00:00', 'A', NULL, '13523555'),
(274, '2017-11-02', '00:00:00', 'I', NULL, '13523555'),
(275, '2017-11-03', '00:00:00', 'I', NULL, '13523555'),
(276, '2017-11-04', '00:00:00', 'I', NULL, '13523555'),
(277, '2017-11-01', '00:00:00', 'S', NULL, '976'),
(278, '2017-11-02', '00:00:00', 'S', NULL, '976'),
(279, '2017-11-03', '07:00:00', 'H', NULL, '976'),
(280, '2017-11-04', '07:00:00', 'H', NULL, '976'),
(281, '2017-11-01', '07:00:00', 'H', NULL, '9892'),
(282, '2017-11-02', '07:00:00', 'H', NULL, '9892'),
(283, '2017-11-03', '07:00:00', 'H', NULL, '9892'),
(284, '2017-11-04', '07:00:00', 'H', NULL, '9892'),
(285, '2017-11-01', '00:00:00', 'H', NULL, '989234'),
(286, '2017-11-02', '00:00:00', 'H', NULL, '989234'),
(287, '2017-11-03', '00:00:00', 'H', NULL, '989234'),
(288, '2017-11-04', '00:00:00', 'H', NULL, '989234'),
(289, '2017-11-01', '00:00:00', 'I', NULL, '999'),
(290, '2017-11-02', '07:00:00', 'H', NULL, '999'),
(291, '2017-11-03', '07:00:00', 'H', NULL, '999'),
(292, '2017-11-04', '07:00:00', 'H', NULL, '999'),
(293, '2017-11-01', '07:00:00', 'H', NULL, '999000'),
(294, '2017-11-02', '07:00:00', 'H', NULL, '999000'),
(295, '2017-11-03', '00:00:00', 'S', NULL, '999000'),
(296, '2017-11-04', '07:00:00', 'H', NULL, '999000'),
(297, '2017-01-07', '00:00:00', 'S', NULL, '12222'),
(298, '2017-01-07', '00:00:00', 'I', NULL, '13523069'),
(299, '2017-01-07', '07:00:00', 'H', NULL, '13523096'),
(300, '2017-01-07', '06:40:00', 'H', NULL, '13523111'),
(301, '2017-01-07', '06:30:00', 'H', NULL, '13523134'),
(302, '2017-01-07', '06:30:00', 'H', NULL, '13523135'),
(303, '2017-01-07', '06:30:00', 'H', NULL, '1352313599'),
(304, '2017-01-07', '00:00:00', 'S', NULL, '13523138'),
(305, '2017-01-07', '00:00:00', 'S', NULL, '13523143'),
(306, '2017-01-07', '07:00:00', 'H', NULL, '13523555'),
(307, '2017-01-07', '07:00:00', 'H', NULL, '976'),
(308, '2017-01-07', '00:00:00', 'A', NULL, '9892'),
(309, '2017-01-07', '07:00:00', 'H', NULL, '989234'),
(310, '2017-01-07', '07:00:00', 'H', NULL, '999'),
(311, '2017-01-07', '07:00:00', 'H', NULL, '999000'),
(312, '2017-01-09', '07:00:00', 'H', NULL, '12222'),
(313, '2017-01-10', '07:00:00', 'H', NULL, '12222'),
(314, '2017-01-11', '07:00:00', 'H', NULL, '12222'),
(315, '2017-01-09', '07:00:00', 'H', NULL, '13523069'),
(316, '2017-01-10', '07:00:00', 'H', NULL, '13523069'),
(317, '2017-01-11', '07:00:00', 'H', NULL, '13523069'),
(318, '2017-01-09', '07:00:00', 'H', NULL, '13523096'),
(319, '2017-01-10', '07:00:00', 'H', NULL, '13523096'),
(320, '2017-01-11', '07:00:00', 'H', NULL, '13523096'),
(321, '2017-01-09', '07:00:00', 'H', NULL, '13523111'),
(322, '2017-01-10', '00:00:00', 'S', NULL, '13523111'),
(323, '2017-01-11', '07:00:00', 'H', NULL, '13523111'),
(324, '2017-01-09', '07:00:00', 'H', NULL, '13523134'),
(325, '2017-01-10', '00:00:00', 'S', NULL, '13523134'),
(326, '2017-01-11', '00:00:00', 'S', NULL, '13523134'),
(327, '2017-01-09', '07:00:00', 'H', NULL, '13523135'),
(328, '2017-01-10', '07:00:00', 'H', NULL, '13523135'),
(329, '2017-01-11', '00:00:00', 'S', NULL, '13523135'),
(330, '2017-01-09', '07:00:00', 'H', NULL, '1352313599'),
(331, '2017-01-10', '07:00:00', 'H', NULL, '1352313599'),
(332, '2017-01-11', '07:00:00', 'H', NULL, '1352313599'),
(333, '2017-01-09', '07:00:00', 'H', NULL, '13523138'),
(334, '2017-01-10', '00:00:00', 'S', NULL, '13523138'),
(335, '2017-01-11', '00:00:00', 'S', NULL, '13523138'),
(336, '2017-01-09', '07:00:00', 'H', NULL, '13523143'),
(337, '2017-01-10', '00:00:00', 'S', NULL, '13523143'),
(338, '2017-01-11', '00:00:00', 'S', NULL, '13523143'),
(339, '2017-01-09', '07:00:00', 'H', NULL, '13523555'),
(340, '2017-01-10', '07:00:00', 'H', NULL, '13523555'),
(341, '2017-01-11', '00:00:00', 'I', NULL, '13523555'),
(342, '2017-01-09', '07:00:00', 'H', NULL, '976'),
(343, '2017-01-10', '07:00:00', 'H', NULL, '976'),
(344, '2017-01-11', '00:00:00', 'I', NULL, '976'),
(345, '2017-01-09', '00:00:00', 'I', NULL, '9892'),
(346, '2017-01-10', '00:00:00', 'I', NULL, '9892'),
(347, '2017-01-11', '07:00:00', 'H', NULL, '9892'),
(348, '2017-01-09', '00:00:00', 'A', NULL, '989234'),
(349, '2017-01-10', '07:00:00', 'H', NULL, '989234'),
(350, '2017-01-11', '07:00:00', 'H', NULL, '989234'),
(351, '2017-01-09', '07:00:00', 'H', NULL, '999'),
(352, '2017-01-10', '07:00:00', 'H', NULL, '999'),
(353, '2017-01-11', '00:00:00', 'S', NULL, '999'),
(354, '2017-01-09', '07:00:00', 'H', NULL, '999000'),
(355, '2017-01-10', '07:00:00', 'H', NULL, '999000'),
(356, '2017-01-11', '07:00:00', 'H', NULL, '999000'),
(357, '2017-11-04', '07:00:00', 'A', NULL, '12222'),
(358, '2017-11-04', '00:00:00', 'A', NULL, '13523069'),
(359, '2017-11-04', '07:00:00', 'H', NULL, '13523096'),
(360, '2017-11-04', '00:00:00', 'H', NULL, '13523111'),
(361, '2017-11-04', '00:00:00', 'H', NULL, '13523134'),
(362, '2017-02-01', '07:00:00', 'H', NULL, '12222'),
(363, '2017-02-02', '00:00:00', 'S', NULL, '12222'),
(364, '2017-11-06', '00:00:00', 'H', NULL, '12222'),
(365, '2017-11-06', '00:00:00', 'H', NULL, '13523069'),
(366, '2017-11-06', '00:00:00', 'H', NULL, '13523096'),
(367, '2017-11-06', '00:00:00', 'H', NULL, '13523111'),
(368, '2017-11-06', '00:00:00', 'H', NULL, '13523134'),
(369, '2017-11-06', '00:00:00', 'H', NULL, '13523135'),
(370, '2017-11-06', '00:00:00', 'H', NULL, '1352313599'),
(371, '2017-11-06', '00:00:00', 'H', NULL, '13523138'),
(372, '2017-11-06', '00:00:00', 'H', NULL, '13523143'),
(373, '2017-11-06', '00:00:00', 'H', NULL, '13523555'),
(374, '2017-11-06', '07:00:00', 'H', NULL, '976'),
(375, '2017-11-06', '07:00:00', 'H', NULL, '9892'),
(376, '2017-11-06', '00:00:00', 'H', NULL, '989234'),
(377, '2017-11-06', '07:00:00', 'H', NULL, '999'),
(378, '2017-11-06', '07:00:00', 'H', NULL, '999000'),
(379, '2017-11-02', '07:00:00', 'H', NULL, '13523062'),
(380, '2017-11-03', '07:00:00', 'H', NULL, '13523062'),
(381, '2017-11-04', '07:00:00', 'A', NULL, '13523062'),
(382, '2017-11-06', '00:00:00', 'H', NULL, '13523062'),
(383, '2017-01-12', '00:00:00', 'I', NULL, '12222'),
(384, '2017-01-13', '00:00:00', 'I', NULL, '12222'),
(385, '2017-01-14', '00:00:00', 'H', NULL, '12222'),
(386, '2017-01-02', '07:11:00', 'H', NULL, '13523062'),
(387, '2017-01-03', '00:00:00', 'H', NULL, '13523062'),
(388, '2017-01-04', '00:00:00', 'H', NULL, '13523062'),
(389, '2017-01-05', '00:00:00', 'H', NULL, '13523062'),
(390, '2017-01-06', '00:00:00', 'H', NULL, '13523062'),
(391, '2017-01-07', '00:00:00', 'H', NULL, '13523062'),
(392, '2017-01-09', '00:00:00', 'H', NULL, '13523062'),
(393, '2017-01-10', '00:00:00', 'H', NULL, '13523062'),
(394, '2017-01-11', '00:00:00', 'H', NULL, '13523062'),
(395, '2017-01-12', '00:00:00', 'A', NULL, '13523062'),
(396, '2017-01-13', '00:00:00', 'A', NULL, '13523062'),
(397, '2017-01-12', '00:00:00', 'A', NULL, '13523069'),
(398, '2017-01-13', '00:00:00', 'I', NULL, '13523069'),
(399, '2017-01-12', '00:00:00', 'S', NULL, '13523096'),
(400, '2017-01-13', '00:00:00', 'I', NULL, '13523096'),
(401, '2017-01-14', '00:00:00', 'I', NULL, '13523096'),
(402, '2017-01-12', '00:00:00', 'H', NULL, '13523111'),
(403, '2017-01-13', '00:00:00', 'H', NULL, '13523111'),
(404, '2017-01-14', '00:00:00', 'H', NULL, '13523111'),
(405, '2017-01-12', '00:00:00', 'H', NULL, '13523134'),
(406, '2017-01-13', '00:00:00', 'H', NULL, '13523134'),
(407, '2017-01-14', '00:00:00', 'H', NULL, '13523134'),
(408, '2017-01-12', '00:00:00', 'H', NULL, '13523135'),
(409, '2017-01-13', '00:00:00', 'H', NULL, '13523135'),
(410, '2017-01-14', '00:00:00', 'H', NULL, '13523135'),
(411, '2017-01-12', '00:00:00', 'A', NULL, '1352313599'),
(412, '2017-01-13', '00:00:00', 'A', NULL, '1352313599'),
(413, '2017-01-14', '00:00:00', 'A', NULL, '1352313599'),
(414, '2017-01-12', '00:00:00', 'A', NULL, '13523138'),
(415, '2017-01-13', '00:00:00', 'A', NULL, '13523138'),
(416, '2017-01-14', '00:00:00', 'A', NULL, '13523138'),
(417, '2017-01-12', '00:00:00', 'A', NULL, '13523143'),
(418, '2017-01-13', '00:00:00', 'A', NULL, '13523143'),
(419, '2017-01-14', '00:00:00', 'A', NULL, '13523143'),
(420, '2017-01-12', '00:00:00', 'I', NULL, '13523555'),
(421, '2017-01-13', '00:00:00', 'I', NULL, '13523555'),
(422, '2017-01-14', '00:00:00', 'I', NULL, '13523555'),
(423, '2017-01-12', '00:00:00', 'I', NULL, '976'),
(424, '2017-01-13', '00:00:00', 'I', NULL, '976'),
(425, '2017-01-14', '00:00:00', 'I', NULL, '976'),
(426, '2017-01-12', '00:00:00', 'S', NULL, '9892'),
(427, '2017-01-13', '00:00:00', 'S', NULL, '9892'),
(428, '2017-01-14', '00:00:00', 'S', NULL, '9892'),
(429, '2017-01-12', '00:00:00', 'S', NULL, '989234'),
(430, '2017-01-13', '00:00:00', 'S', NULL, '989234'),
(431, '2017-01-14', '00:00:00', 'S', NULL, '989234'),
(432, '2017-01-12', '00:00:00', 'A', NULL, '999'),
(433, '2017-01-13', '00:00:00', 'H', NULL, '999'),
(434, '2017-01-14', '00:00:00', 'H', NULL, '999'),
(435, '2017-01-12', '00:00:00', 'H', NULL, '999000'),
(436, '2017-01-13', '00:00:00', 'H', NULL, '999000'),
(437, '2017-01-14', '00:00:00', 'H', NULL, '999000'),
(438, '2017-11-01', '07:00:00', 'H', NULL, '13523062'),
(439, '2017-11-01', '00:00:00', 'H', NULL, '13523120'),
(440, '2017-11-02', '00:00:00', 'H', NULL, '13523120'),
(441, '2017-11-03', '00:00:00', 'H', NULL, '13523120'),
(442, '2017-11-04', '00:00:00', 'H', NULL, '13523120'),
(443, '2017-11-07', '00:00:00', 'S', NULL, '12222'),
(444, '2017-11-08', '00:00:00', 'H', NULL, '12222'),
(445, '2017-11-09', '00:00:00', 'H', NULL, '12222'),
(446, '2017-11-10', '00:00:00', 'H', NULL, '12222'),
(447, '2017-11-01', '00:00:00', 'H', NULL, '1111'),
(448, '2017-12-01', '00:00:00', 'S', NULL, '111'),
(449, '2017-12-02', '00:00:00', 'H', NULL, '111'),
(450, '2017-12-04', '00:00:00', 'H', NULL, '111'),
(451, '2017-12-05', '00:00:00', 'H', NULL, '111'),
(452, '2017-12-01', '00:00:00', 'H', NULL, '11231231'),
(453, '2017-12-02', '00:00:00', 'H', NULL, '11231231'),
(454, '2017-12-04', '00:00:00', 'H', NULL, '11231231'),
(455, '2017-12-05', '00:00:00', 'H', NULL, '11231231'),
(456, '2017-12-23', NULL, 'I', 'Keluar', '111'),
(457, '2017-12-23', NULL, 'S', 'HATi', '11111'),
(458, '2017-12-23', NULL, 'S', 'Leher', '11231231'),
(459, '2017-12-23', NULL, 'H', '', '12222'),
(460, '2017-12-23', NULL, 'H', '', '13523069'),
(461, '2017-12-23', NULL, 'H', '', '13523096'),
(462, '2017-12-23', NULL, 'H', '', '13523111'),
(463, '2017-12-23', NULL, 'S', '', '13523555'),
(464, '2017-10-02', NULL, 'I', 'Kelaur kOta', '111'),
(465, '2017-10-02', NULL, 'S', 'Kepala', '11111'),
(466, '2017-10-02', NULL, 'A', 'BOLOS', '11231231'),
(467, '2017-12-23', NULL, 'S', 'Gigi', '123456'),
(468, '2017-12-23', NULL, 'H', '', '13313131'),
(469, '2017-12-23', NULL, 'H', '', '13523062'),
(470, '2017-12-23', NULL, 'H', '', '13523120'),
(471, '2017-12-23', NULL, 'H', '', '13523134'),
(472, '2017-12-23', NULL, 'H', '', '13523135'),
(473, '2017-12-23', NULL, 'H', '', '1352313599'),
(474, '2017-12-23', NULL, 'H', '', '13523136'),
(475, '2017-12-23', NULL, 'H', '', '13523138'),
(476, '2017-12-23', NULL, 'H', '', '13523139'),
(477, '2017-12-23', NULL, 'H', '', '135231399'),
(478, '2017-12-23', NULL, 'S', '', '13523143'),
(479, '2017-12-23', NULL, 'H', '', '88888'),
(480, '2017-12-23', NULL, 'H', '', '898989'),
(481, '2017-12-23', NULL, 'H', '', '989234'),
(482, '2017-12-24', NULL, 'H', '', '111'),
(483, '2017-12-24', NULL, 'H', '', '11111'),
(484, '2017-12-24', NULL, 'H', '', '11231231'),
(485, '2017-12-24', NULL, 'H', '', '12222'),
(486, '2017-12-24', NULL, 'H', '', '123456'),
(487, '2017-12-24', NULL, 'H', '', '13313131'),
(488, '2017-12-24', NULL, 'H', '', '13523062'),
(489, '2017-12-24', NULL, 'H', '', '13523069'),
(490, '2017-12-24', NULL, 'H', '', '13523096'),
(491, '2017-12-24', NULL, 'H', '', '13523111'),
(492, '2017-12-24', NULL, 'H', '', '13523120'),
(493, '2017-12-24', NULL, 'H', '', '13523134'),
(494, '2017-12-24', NULL, 'H', '', '13523135'),
(495, '2017-12-24', NULL, 'H', '', '1352313599'),
(496, '2017-12-24', NULL, 'H', '', '13523136'),
(497, '2017-12-24', NULL, 'H', '', '13523138'),
(498, '2017-12-24', NULL, 'H', '', '13523139'),
(499, '2017-12-24', NULL, 'H', '', '135231399'),
(500, '2017-12-24', NULL, 'H', '', '13523143'),
(501, '2017-12-24', NULL, 'H', '', '13523555'),
(502, '2017-12-24', NULL, 'H', '', '88888'),
(503, '2017-12-24', NULL, 'H', '', '898989'),
(504, '2017-12-24', NULL, 'H', '', '989234'),
(505, '2017-02-04', NULL, 'H', '', '111'),
(506, '2017-02-04', NULL, 'H', '', '11111'),
(507, '2017-02-04', NULL, 'H', '', '11231231'),
(508, '2017-02-04', NULL, 'H', '', '12222'),
(509, '2017-02-04', NULL, 'H', '', '123456'),
(510, '2017-02-04', NULL, 'H', '', '13313131'),
(511, '2017-02-04', NULL, 'H', '', '13523062'),
(512, '2017-02-04', NULL, 'H', '', '13523069'),
(513, '2017-02-04', NULL, 'H', '', '13523096'),
(514, '2017-02-04', NULL, 'H', '', '13523111'),
(515, '2017-02-04', NULL, 'H', '', '13523120'),
(516, '2017-02-04', NULL, 'H', '', '13523134'),
(517, '2017-02-04', NULL, 'H', '', '13523135'),
(518, '2017-02-04', NULL, 'H', '', '1352313599'),
(519, '2017-02-04', NULL, 'H', '', '13523136'),
(520, '2017-02-04', NULL, 'H', '', '13523138'),
(521, '2017-02-04', NULL, 'H', '', '13523139'),
(522, '2017-02-04', NULL, 'H', '', '135231399'),
(523, '2017-02-04', NULL, 'H', '', '13523143'),
(524, '2017-02-04', NULL, 'H', '', '13523555'),
(525, '2017-02-04', NULL, 'H', '', '88888'),
(526, '2017-02-04', NULL, 'H', '', '898989'),
(527, '2017-02-04', NULL, 'H', '', '989234'),
(528, '2017-07-09', NULL, 'H', '', '111'),
(529, '2017-07-09', NULL, 'H', '', '11111'),
(530, '2017-07-09', NULL, 'H', '', '11231231'),
(531, '2017-07-09', NULL, 'H', '', '12222'),
(532, '2017-07-09', NULL, 'H', '', '123456'),
(533, '2017-07-09', NULL, 'H', '', '13313131'),
(534, '2017-07-09', NULL, 'H', '', '13523062'),
(535, '2017-07-09', NULL, 'H', '', '13523069'),
(536, '2017-07-09', NULL, 'H', '', '13523096'),
(537, '2017-07-09', NULL, 'H', '', '13523111'),
(538, '2017-07-09', NULL, 'H', '', '13523120'),
(539, '2017-07-09', NULL, 'H', '', '13523134'),
(540, '2017-07-09', NULL, 'H', '', '13523135'),
(541, '2017-07-09', NULL, 'H', '', '1352313599'),
(542, '2017-07-09', NULL, 'H', '', '13523136'),
(543, '2017-07-09', NULL, 'H', '', '13523138'),
(544, '2017-07-09', NULL, 'H', '', '13523139'),
(545, '2017-07-09', NULL, 'H', '', '135231399'),
(546, '2017-07-09', NULL, 'H', '', '13523143'),
(547, '2017-07-09', NULL, 'H', '', '13523555'),
(548, '2017-07-09', NULL, 'H', '', '333444555'),
(549, '2017-07-09', NULL, 'H', '', '88888'),
(550, '2017-07-09', NULL, 'H', '', '898989'),
(551, '2017-07-09', NULL, 'H', '', '989234'),
(552, '2017-12-25', NULL, 'S', '', '111'),
(553, '2017-12-25', NULL, 'H', '', '11111'),
(554, '2017-12-25', NULL, 'H', '', '11231231'),
(555, '2017-12-25', NULL, 'H', '', '12222'),
(556, '2017-12-25', NULL, 'H', '', '123456'),
(557, '2017-12-25', NULL, 'H', '', '13313131'),
(558, '2017-12-25', NULL, 'H', '', '13523062'),
(559, '2017-12-25', NULL, 'H', '', '13523069'),
(560, '2017-12-25', NULL, 'H', '', '13523096'),
(561, '2017-12-25', NULL, 'H', '', '13523111'),
(562, '2017-12-25', NULL, 'H', '', '13523120'),
(563, '2017-12-25', NULL, 'H', '', '13523134'),
(564, '2017-12-25', NULL, 'H', '', '13523135'),
(565, '2017-12-25', NULL, 'H', '', '1352313599'),
(566, '2017-12-25', NULL, 'I', '', '13523136'),
(567, '2017-12-25', NULL, 'I', '', '13523138'),
(568, '2017-12-25', NULL, 'H', '', '13523139'),
(569, '2017-12-25', NULL, 'A', '', '135231399'),
(570, '2017-12-25', NULL, 'I', '', '13523143'),
(571, '2017-12-25', NULL, 'H', '', '13523555'),
(572, '2017-12-25', NULL, 'S', '', '333444555'),
(573, '2017-12-25', NULL, 'H', '', '88888'),
(574, '2017-12-25', NULL, 'I', '', '898989'),
(575, '2017-12-25', NULL, 'I', '', '989234'),
(576, '2017-12-17', NULL, 'H', '', '111'),
(577, '2017-12-17', NULL, 'H', '', '11111'),
(578, '2017-12-17', NULL, 'H', '', '11231231'),
(579, '2017-12-17', NULL, 'H', '', '12222'),
(580, '2017-12-17', NULL, 'H', '', '123456'),
(581, '2017-12-17', NULL, 'A', '', '13313131'),
(582, '2017-12-17', NULL, 'A', '', '13523062'),
(583, '2017-12-17', NULL, 'H', '', '13523069'),
(584, '2017-12-17', NULL, 'H', '', '13523096'),
(585, '2017-12-17', NULL, 'H', '', '13523111'),
(586, '2017-12-17', NULL, 'A', '', '13523120'),
(587, '2017-12-17', NULL, 'I', '', '13523134'),
(588, '2017-12-17', NULL, 'H', '', '13523135'),
(589, '2017-12-17', NULL, 'S', '', '1352313599'),
(590, '2017-12-17', NULL, 'A', '', '13523136'),
(591, '2017-12-17', NULL, 'A', '', '13523138'),
(592, '2017-12-17', NULL, 'H', '', '13523139'),
(593, '2017-12-17', NULL, 'H', '', '135231399'),
(594, '2017-12-17', NULL, 'H', '', '13523143'),
(595, '2017-12-17', NULL, 'H', '', '13523555'),
(596, '2017-12-17', NULL, 'H', '', '333444555'),
(597, '2017-12-17', NULL, 'H', '', '88888'),
(598, '2017-12-17', NULL, 'H', '', '898989'),
(599, '2017-12-17', NULL, 'H', '', '989234'),
(600, '2017-12-31', NULL, 'H', '', '11'),
(601, '2017-12-31', NULL, 'H', '', '110222337'),
(602, '2017-12-31', NULL, 'H', '', '111'),
(603, '2017-12-31', NULL, 'H', '', '11111'),
(604, '2017-12-31', NULL, 'H', '', '11231231'),
(605, '2017-12-31', NULL, 'H', '', '1221129'),
(606, '2017-12-31', NULL, 'H', '', '122112999'),
(607, '2017-12-31', NULL, 'H', '', '12222'),
(608, '2017-12-31', NULL, 'H', '', '122888'),
(609, '2017-12-31', NULL, 'H', '', '123456'),
(610, '2017-12-31', NULL, 'H', '', '13313131'),
(611, '2017-12-31', NULL, 'H', '', '13523062'),
(612, '2017-12-31', NULL, 'H', '', '13523069'),
(613, '2017-12-31', NULL, 'H', '', '13523096'),
(614, '2017-12-31', NULL, 'H', '', '13523111'),
(615, '2017-12-31', NULL, 'H', '', '13523120'),
(616, '2017-12-31', NULL, 'H', '', '13523134'),
(617, '2017-12-31', NULL, 'H', '', '13523135'),
(618, '2017-12-31', NULL, 'H', '', '1352313599'),
(619, '2017-12-31', NULL, 'H', '', '13523136'),
(620, '2017-12-31', NULL, 'H', '', '13523138'),
(621, '2017-12-31', NULL, 'H', '', '13523139'),
(622, '2017-12-31', NULL, 'H', '', '135231399'),
(623, '2017-12-31', NULL, 'H', '', '13523143'),
(624, '2017-12-31', NULL, 'H', '', '13523555'),
(625, '2017-12-31', NULL, 'H', '', '333444555'),
(626, '2017-12-31', NULL, 'H', '', '566656'),
(627, '2017-12-31', NULL, 'H', '', '59966656'),
(628, '2017-12-31', NULL, 'H', '', '676888'),
(629, '2017-12-31', NULL, 'H', '', '676888999'),
(630, '2017-12-31', NULL, 'H', '', '777888666'),
(631, '2017-12-31', NULL, 'H', '', '87778'),
(632, '2017-12-31', NULL, 'H', '', '888777'),
(633, '2017-12-31', NULL, 'H', '', '88888'),
(634, '2017-12-31', NULL, 'H', '', '898989'),
(635, '2017-12-31', NULL, 'H', '', '989234'),
(636, '2017-12-31', NULL, 'H', '', '9999922'),
(637, '2018-01-07', NULL, 'S', 'Sakit Kepala', '11'),
(638, '2018-01-07', NULL, 'H', '', '110222337'),
(639, '2018-01-07', NULL, 'H', '', '111'),
(640, '2018-01-07', NULL, 'I', 'Melahirkan', '11111'),
(641, '2018-01-07', NULL, 'H', '', '11231231'),
(642, '2018-01-07', NULL, 'S', 'Operasi Jantung', '1221129'),
(643, '2018-01-07', NULL, 'H', '', '122112999'),
(644, '2018-01-07', NULL, 'H', '', '12222'),
(645, '2018-01-07', NULL, 'H', '', '122888'),
(646, '2018-01-07', NULL, 'H', '', '123456'),
(647, '2018-01-07', NULL, 'H', '', '13313131'),
(648, '2018-01-07', NULL, 'H', '', '13523062'),
(649, '2018-01-07', NULL, 'H', '', '13523069'),
(650, '2018-01-07', NULL, 'H', '', '13523096'),
(651, '2018-01-07', NULL, 'H', '', '13523111'),
(652, '2018-01-07', NULL, 'H', '', '13523120'),
(653, '2018-01-07', NULL, 'H', '', '13523134'),
(654, '2018-01-07', NULL, 'H', '', '13523135'),
(655, '2018-01-07', NULL, 'H', '', '1352313599'),
(656, '2018-01-07', NULL, 'H', '', '13523136'),
(657, '2018-01-07', NULL, 'H', '', '13523138'),
(658, '2018-01-07', NULL, 'H', '', '13523139'),
(659, '2018-01-07', NULL, 'H', '', '135231399'),
(660, '2018-01-07', NULL, 'H', '', '13523143'),
(661, '2018-01-07', NULL, 'H', '', '13523555'),
(662, '2018-01-07', NULL, 'H', '', '333444555'),
(663, '2018-01-07', NULL, 'H', '', '566656'),
(664, '2018-01-07', NULL, 'H', '', '59966656'),
(665, '2018-01-07', NULL, 'H', '', '676888'),
(666, '2018-01-07', NULL, 'H', '', '676888999'),
(667, '2018-01-07', NULL, 'H', '', '777888666'),
(668, '2018-01-07', NULL, 'H', '', '87283282'),
(669, '2018-01-07', NULL, 'H', '', '87778'),
(670, '2018-01-07', NULL, 'H', '', '888777'),
(671, '2018-01-07', NULL, 'H', '', '88888'),
(672, '2018-01-07', NULL, 'H', '', '898989'),
(673, '2018-01-07', NULL, 'A', 'Tanpa Keterangan', '989234'),
(674, '2018-01-07', NULL, 'H', '', '9999922'),
(675, '2018-01-09', NULL, 'H', '', '11'),
(676, '2018-01-09', NULL, 'H', '', '110222337'),
(677, '2018-01-09', NULL, 'H', '', '111'),
(678, '2018-01-09', NULL, 'H', '', '11111'),
(679, '2018-01-09', NULL, 'H', '', '11231231'),
(680, '2018-01-09', NULL, 'H', '', '1221129'),
(681, '2018-01-09', NULL, 'S', 'istirahat 2 hari', '122112999'),
(682, '2018-01-09', NULL, 'H', '', '12222'),
(683, '2018-01-09', NULL, 'H', '', '122888'),
(684, '2018-01-09', NULL, 'H', '', '12345'),
(685, '2018-01-09', NULL, 'H', '', '123456'),
(686, '2018-01-09', NULL, 'H', '', '13313131'),
(687, '2018-01-09', NULL, 'H', '', '13523062'),
(688, '2018-01-09', NULL, 'H', '', '13523069'),
(689, '2018-01-09', NULL, 'H', '', '13523096'),
(690, '2018-01-09', NULL, 'H', '', '13523111'),
(691, '2018-01-09', NULL, 'H', '', '13523120'),
(692, '2018-01-09', NULL, 'H', '', '13523134'),
(693, '2018-01-09', NULL, 'H', '', '13523135'),
(694, '2018-01-09', NULL, 'H', '', '1352313599'),
(695, '2018-01-09', NULL, 'H', '', '13523136'),
(696, '2018-01-09', NULL, 'H', '', '13523138'),
(697, '2018-01-09', NULL, 'H', '', '13523139'),
(698, '2018-01-09', NULL, 'H', '', '135231399'),
(699, '2018-01-09', NULL, 'H', '', '13523143'),
(700, '2018-01-09', NULL, 'H', '', '13523555'),
(701, '2018-01-09', NULL, 'H', '', '333444555'),
(702, '2018-01-09', NULL, 'H', '', '566656'),
(703, '2018-01-09', NULL, 'H', '', '59966656'),
(704, '2018-01-09', NULL, 'H', '', '676888'),
(705, '2018-01-09', NULL, 'H', '', '676888999'),
(706, '2018-01-09', NULL, 'H', '', '777888666'),
(707, '2018-01-09', NULL, 'H', '', '87283282'),
(708, '2018-01-09', NULL, 'H', '', '87778'),
(709, '2018-01-09', NULL, 'H', '', '888777'),
(710, '2018-01-09', NULL, 'H', '', '88888'),
(711, '2018-01-09', NULL, 'H', '', '898989'),
(712, '2018-01-09', NULL, 'H', '', '989234'),
(713, '2018-01-09', NULL, 'H', '', '9999922'),
(714, '2018-01-11', NULL, 'H', '', '11'),
(715, '2018-01-11', NULL, 'H', '', '110222337'),
(716, '2018-01-11', NULL, 'H', '', '111'),
(717, '2018-01-11', NULL, 'H', '', '11111'),
(718, '2018-01-11', NULL, 'H', '', '11231231'),
(719, '2018-01-11', NULL, 'H', '', '1221129'),
(720, '2018-01-11', NULL, 'H', '', '122112999'),
(721, '2018-01-11', NULL, 'H', '', '12222'),
(722, '2018-01-11', NULL, 'H', '', '122888'),
(723, '2018-01-11', NULL, 'H', '', '12345'),
(724, '2018-01-11', NULL, 'H', '', '123456'),
(725, '2018-01-11', NULL, 'H', '', '13313131'),
(726, '2018-01-11', NULL, 'H', '', '13523062'),
(727, '2018-01-11', NULL, 'H', '', '13523069'),
(728, '2018-01-11', NULL, 'H', '', '13523096'),
(729, '2018-01-11', NULL, 'H', '', '13523111'),
(730, '2018-01-11', NULL, 'H', '', '13523120'),
(731, '2018-01-11', NULL, 'H', '', '13523134'),
(732, '2018-01-11', NULL, 'H', '', '13523135'),
(733, '2018-01-11', NULL, 'H', '', '1352313599'),
(734, '2018-01-11', NULL, 'H', '', '13523136'),
(735, '2018-01-11', NULL, 'H', '', '13523138'),
(736, '2018-01-11', NULL, 'H', '', '13523139'),
(737, '2018-01-11', NULL, 'H', '', '135231399'),
(738, '2018-01-11', NULL, 'H', '', '13523143'),
(739, '2018-01-11', NULL, 'H', '', '13523555'),
(740, '2018-01-11', NULL, 'H', '', '333444555'),
(741, '2018-01-11', NULL, 'H', '', '566656'),
(742, '2018-01-11', NULL, 'H', '', '59966656'),
(743, '2018-01-11', NULL, 'H', '', '676888'),
(744, '2018-01-11', NULL, 'H', '', '676888999'),
(745, '2018-01-11', NULL, 'H', '', '777888666'),
(746, '2018-01-11', NULL, 'H', '', '87283282'),
(747, '2018-01-11', NULL, 'H', '', '87778'),
(748, '2018-01-11', NULL, 'H', '', '888777'),
(749, '2018-01-11', NULL, 'H', '', '88888'),
(750, '2018-01-11', NULL, 'H', '', '898989'),
(751, '2018-01-11', NULL, 'H', '', '989234'),
(752, '2018-01-11', NULL, 'H', '', '9999922'),
(753, '2018-01-15', NULL, 'I', 'cuti', '11'),
(754, '2018-01-15', NULL, 'H', '', '110222337'),
(755, '2018-01-15', NULL, 'H', '', '111'),
(756, '2018-01-15', NULL, 'H', '', '11111'),
(757, '2018-01-15', NULL, 'H', '', '11231231'),
(758, '2018-01-15', NULL, 'H', '', '1221129'),
(759, '2018-01-15', NULL, 'H', '', '122112999'),
(760, '2018-01-15', NULL, 'H', '', '12222'),
(761, '2018-01-15', NULL, 'H', '', '122888'),
(762, '2018-01-15', NULL, 'H', '', '123'),
(763, '2018-01-15', NULL, 'H', '', '12345'),
(764, '2018-01-15', NULL, 'H', '', '123456'),
(765, '2018-01-15', NULL, 'H', '', '13313131'),
(766, '2018-01-15', NULL, 'H', '', '13523062'),
(767, '2018-01-15', NULL, 'H', '', '13523069'),
(768, '2018-01-15', NULL, 'H', '', '13523096'),
(769, '2018-01-15', NULL, 'H', '', '13523111'),
(770, '2018-01-15', NULL, 'H', '', '13523120'),
(771, '2018-01-15', NULL, 'H', '', '13523134'),
(772, '2018-01-15', NULL, 'H', '', '13523135'),
(773, '2018-01-15', NULL, 'H', '', '1352313599'),
(774, '2018-01-15', NULL, 'H', '', '13523136'),
(775, '2018-01-15', NULL, 'H', '', '13523138'),
(776, '2018-01-15', NULL, 'H', '', '13523139'),
(777, '2018-01-15', NULL, 'H', '', '135231399'),
(778, '2018-01-15', NULL, 'H', '', '13523143'),
(779, '2018-01-15', NULL, 'H', '', '13523555'),
(780, '2018-01-15', NULL, 'H', '', '213133344'),
(781, '2018-01-15', NULL, 'H', '', '333444555'),
(782, '2018-01-15', NULL, 'H', '', '566656'),
(783, '2018-01-15', NULL, 'H', '', '59966656'),
(784, '2018-01-15', NULL, 'H', '', '676888'),
(785, '2018-01-15', NULL, 'H', '', '676888999'),
(786, '2018-01-15', NULL, 'H', '', '777888666'),
(787, '2018-01-15', NULL, 'H', '', '87283282'),
(788, '2018-01-15', NULL, 'H', '', '87778'),
(789, '2018-01-15', NULL, 'H', '', '888777'),
(790, '2018-01-15', NULL, 'H', '', '88888'),
(791, '2018-01-15', NULL, 'H', '', '898989'),
(792, '2018-01-15', NULL, 'H', '', '989234'),
(793, '2018-01-15', NULL, 'H', '', '9999922'),
(794, '2018-02-01', '01:00:00', 'S', NULL, '12345'),
(795, '2018-02-02', '01:00:00', 'H', NULL, '12345'),
(796, '2018-02-01', '01:00:00', 'S', NULL, '12345'),
(797, '2018-02-02', '01:00:00', 'H', NULL, '12345'),
(798, '2018-02-01', '00:00:00', 'S', NULL, '12345'),
(799, '2018-02-02', '00:00:00', 'H', NULL, '12345'),
(800, '2018-02-18', NULL, 'H', '', '110222337'),
(801, '2018-02-18', NULL, 'H', '', '1111'),
(802, '2018-02-18', NULL, 'H', '', '11111'),
(803, '2018-02-18', NULL, 'H', '', '1221129'),
(804, '2018-02-18', NULL, 'H', '', '122112999'),
(805, '2018-02-18', NULL, 'H', '', '12222'),
(806, '2018-02-18', NULL, 'H', '', '123'),
(807, '2018-02-18', NULL, 'H', '', '1231233412'),
(808, '2018-02-18', NULL, 'H', '', '12312334121'),
(809, '2018-02-18', NULL, 'H', '', '12345'),
(810, '2018-02-18', NULL, 'H', '', '123456'),
(811, '2018-02-18', NULL, 'H', '', '13313131'),
(812, '2018-02-18', NULL, 'H', '', '13523062'),
(813, '2018-02-18', NULL, 'H', '', '13523069'),
(814, '2018-02-18', NULL, 'H', '', '13523096'),
(815, '2018-02-18', NULL, 'H', '', '13523111'),
(816, '2018-02-18', NULL, 'H', '', '13523120'),
(817, '2018-02-18', NULL, 'H', '', '13523134'),
(818, '2018-02-18', NULL, 'H', '', '13523135'),
(819, '2018-02-18', NULL, 'H', '', '1352313599'),
(820, '2018-02-18', NULL, 'H', '', '13523136'),
(821, '2018-02-18', NULL, 'H', '', '13523138'),
(822, '2018-02-18', NULL, 'H', '', '13523139'),
(823, '2018-02-18', NULL, 'H', '', '135231399'),
(824, '2018-02-18', NULL, 'H', '', '13523143'),
(825, '2018-02-18', NULL, 'H', '', '13523555'),
(826, '2018-02-18', NULL, 'H', '', '333444555'),
(827, '2018-02-18', NULL, 'H', '', '566656'),
(828, '2018-02-18', NULL, 'H', '', '676888999'),
(829, '2018-02-18', NULL, 'H', '', '777888666'),
(830, '2018-02-18', NULL, 'H', '', '87283282'),
(831, '2018-02-18', NULL, 'H', '', '888777'),
(832, '2018-02-18', NULL, 'H', '', '989234'),
(833, '2018-02-18', NULL, 'H', '', '9999922'),
(834, '2018-02-20', NULL, 'H', '', '110222337'),
(835, '2018-02-20', NULL, 'H', '', '1111'),
(836, '2018-02-20', NULL, 'H', '', '11111'),
(837, '2018-02-20', NULL, 'H', '', '1221129'),
(838, '2018-02-20', NULL, 'H', '', '12222'),
(839, '2018-02-20', NULL, 'H', '', '123'),
(840, '2018-02-20', NULL, 'H', '', '1231233412'),
(841, '2018-02-20', NULL, 'H', '', '12312334121'),
(842, '2018-02-20', NULL, 'H', '', '12345'),
(843, '2018-02-20', NULL, 'H', '', '123456'),
(844, '2018-02-20', NULL, 'H', '', '13313131'),
(845, '2018-02-20', NULL, 'H', '', '13523062'),
(846, '2018-02-20', NULL, 'H', '', '13523069'),
(847, '2018-02-20', NULL, 'H', '', '13523096'),
(848, '2018-02-20', NULL, 'H', '', '13523111'),
(849, '2018-02-20', NULL, 'H', '', '13523120'),
(850, '2018-02-20', NULL, 'H', '', '13523134'),
(851, '2018-02-20', NULL, 'H', '', '13523135'),
(852, '2018-02-20', NULL, 'H', '', '1352313599'),
(853, '2018-02-20', NULL, 'H', '', '13523136'),
(854, '2018-02-20', NULL, 'H', '', '13523138'),
(855, '2018-02-20', NULL, 'H', '', '13523139'),
(856, '2018-02-20', NULL, 'H', '', '135231399'),
(857, '2018-02-20', NULL, 'H', '', '13523143'),
(858, '2018-02-20', NULL, 'H', '', '13523555'),
(859, '2018-02-20', NULL, 'H', '', '198503302003121002'),
(860, '2018-02-20', NULL, 'H', '', '333444555'),
(861, '2018-02-20', NULL, 'H', '', '566656'),
(862, '2018-02-20', NULL, 'H', '', '676888999'),
(863, '2018-02-20', NULL, 'H', '', '777888666'),
(864, '2018-02-20', NULL, 'H', '', '87283282'),
(865, '2018-02-20', NULL, 'H', '', '888777'),
(866, '2018-02-20', NULL, 'H', '', '989234'),
(867, '2018-02-20', NULL, 'H', '', '9999922'),
(868, '2018-02-12', NULL, 'I', 'Sakit', '110222337'),
(869, '2018-02-12', NULL, 'A', 'Tanpa Keterangan', '1111'),
(870, '2018-02-12', NULL, 'A', 'Tanpa Keterangan', '11111'),
(871, '2018-02-12', NULL, 'S', '', '1221129'),
(872, '2018-02-12', NULL, 'A', '', '12222'),
(873, '2018-02-12', NULL, 'H', '', '123'),
(874, '2018-02-12', NULL, 'H', '', '1231233412'),
(875, '2018-02-12', NULL, 'H', '', '12312334121'),
(876, '2018-02-12', NULL, 'H', '', '12345'),
(877, '2018-02-12', NULL, 'S', '', '123456'),
(878, '2018-02-12', NULL, 'H', '', '13313131'),
(879, '2018-02-12', NULL, 'H', '', '13523062'),
(880, '2018-02-12', NULL, 'H', '', '13523069'),
(881, '2018-02-12', NULL, 'H', '', '13523096'),
(882, '2018-02-12', NULL, 'H', '', '13523111'),
(883, '2018-02-12', NULL, 'H', '', '13523120'),
(884, '2018-02-12', NULL, 'H', '', '13523134'),
(885, '2018-02-12', NULL, 'H', '', '13523135'),
(886, '2018-02-12', NULL, 'H', '', '1352313599'),
(887, '2018-02-12', NULL, 'H', '', '13523136'),
(888, '2018-02-12', NULL, 'H', '', '13523138'),
(889, '2018-02-12', NULL, 'H', '', '13523139'),
(890, '2018-02-12', NULL, 'H', '', '135231399'),
(891, '2018-02-12', NULL, 'H', '', '13523143'),
(892, '2018-02-12', NULL, 'H', '', '13523555'),
(893, '2018-02-12', NULL, 'H', '', '198503302003121002'),
(894, '2018-02-12', NULL, 'H', '', '333444555'),
(895, '2018-02-12', NULL, 'H', '', '566656'),
(896, '2018-02-12', NULL, 'H', '', '676888999'),
(897, '2018-02-12', NULL, 'H', '', '777888666'),
(898, '2018-02-12', NULL, 'H', '', '87283282'),
(899, '2018-02-12', NULL, 'H', '', '888777'),
(900, '2018-02-12', NULL, 'H', '', '989234'),
(901, '2018-02-12', NULL, 'H', '', '9999922'),
(902, '2018-02-21', NULL, 'H', '', '110222337'),
(903, '2018-02-21', NULL, 'S', 'Sakit Asma', '1111'),
(904, '2018-02-21', NULL, 'H', '', '11111'),
(905, '2018-02-21', NULL, 'H', '', '1221129'),
(906, '2018-02-21', NULL, 'H', '', '12222'),
(907, '2018-02-21', NULL, 'H', '', '123'),
(908, '2018-02-21', NULL, 'H', '', '1231233412'),
(909, '2018-02-21', NULL, 'H', '', '12312334121'),
(910, '2018-02-21', NULL, 'H', '', '12345'),
(911, '2018-02-21', NULL, 'H', '', '123456'),
(912, '2018-02-21', NULL, 'H', '', '13313131'),
(913, '2018-02-21', NULL, 'H', '', '13523062'),
(914, '2018-02-21', NULL, 'H', '', '13523069'),
(915, '2018-02-21', NULL, 'H', '', '13523096'),
(916, '2018-02-21', NULL, 'H', '', '13523111'),
(917, '2018-02-21', NULL, 'H', '', '13523120'),
(918, '2018-02-21', NULL, 'H', '', '13523134'),
(919, '2018-02-21', NULL, 'H', '', '13523135'),
(920, '2018-02-21', NULL, 'H', '', '1352313599'),
(921, '2018-02-21', NULL, 'H', '', '13523136'),
(922, '2018-02-21', NULL, 'H', '', '13523138'),
(923, '2018-02-21', NULL, 'H', '', '13523139'),
(924, '2018-02-21', NULL, 'H', '', '135231399'),
(925, '2018-02-21', NULL, 'H', '', '13523143'),
(926, '2018-02-21', NULL, 'H', '', '13523555'),
(927, '2018-02-21', NULL, 'H', '', '198503302003121002'),
(928, '2018-02-21', NULL, 'H', '', '333444555'),
(929, '2018-02-21', NULL, 'H', '', '566656'),
(930, '2018-02-21', NULL, 'H', '', '676888999'),
(931, '2018-02-21', NULL, 'H', '', '777888666'),
(932, '2018-02-21', NULL, 'H', '', '87283282'),
(933, '2018-02-21', NULL, 'H', '', '888777'),
(934, '2018-02-21', NULL, 'H', '', '989234'),
(935, '2018-02-21', NULL, 'H', '', '9999922'),
(936, '2018-03-05', NULL, 'H', '', '110222337'),
(937, '2018-03-05', NULL, 'H', '', '1111'),
(938, '2018-03-05', NULL, 'H', '', '11111'),
(939, '2018-03-05', NULL, 'H', '', '1221129'),
(940, '2018-03-05', NULL, 'H', '', '12222'),
(941, '2018-03-05', NULL, 'H', '', '123'),
(942, '2018-03-05', NULL, 'H', '', '1231233412'),
(943, '2018-03-05', NULL, 'H', '', '12312334121'),
(944, '2018-03-05', NULL, 'H', '', '12345'),
(945, '2018-03-05', NULL, 'H', '', '123456'),
(946, '2018-03-05', NULL, 'H', '', '13313131'),
(947, '2018-03-05', NULL, 'H', '', '13523062'),
(948, '2018-03-05', NULL, 'H', '', '13523069'),
(949, '2018-03-05', NULL, 'H', '', '13523096'),
(950, '2018-03-05', NULL, 'H', '', '13523111'),
(951, '2018-03-05', NULL, 'H', '', '13523120'),
(952, '2018-03-05', NULL, 'H', '', '13523134'),
(953, '2018-03-05', NULL, 'H', '', '13523135'),
(954, '2018-03-05', NULL, 'H', '', '1352313599'),
(955, '2018-03-05', NULL, 'H', '', '13523136'),
(956, '2018-03-05', NULL, 'H', '', '13523138'),
(957, '2018-03-05', NULL, 'H', '', '13523139'),
(958, '2018-03-05', NULL, 'H', '', '135231399'),
(959, '2018-03-05', NULL, 'H', '', '13523143'),
(960, '2018-03-05', NULL, 'H', '', '13523555'),
(961, '2018-03-05', NULL, 'H', '', '198503302003121002'),
(962, '2018-03-05', NULL, 'H', '', '333444555'),
(963, '2018-03-05', NULL, 'H', '', '566656'),
(964, '2018-03-05', NULL, 'H', '', '676888999'),
(965, '2018-03-05', NULL, 'H', '', '777888666'),
(966, '2018-03-05', NULL, 'H', '', '87283282'),
(967, '2018-03-05', NULL, 'H', '', '888777'),
(968, '2018-03-05', NULL, 'H', '', '989234'),
(969, '2018-03-05', NULL, 'H', '', '9999922'),
(970, '2018-03-03', NULL, 'H', '', '110222337'),
(971, '2018-03-03', NULL, 'H', '', '1111'),
(972, '2018-03-03', NULL, 'H', '', '11111'),
(973, '2018-03-03', NULL, 'H', '', '1221129'),
(974, '2018-03-03', NULL, 'H', '', '12222'),
(975, '2018-03-03', NULL, 'H', '', '123'),
(976, '2018-03-03', NULL, 'H', '', '1231233412'),
(977, '2018-03-03', NULL, 'H', '', '12312334121'),
(978, '2018-03-03', NULL, 'H', '', '12345'),
(979, '2018-03-03', NULL, 'H', '', '123456'),
(980, '2018-03-03', NULL, 'H', '', '13313131'),
(981, '2018-03-03', NULL, 'H', '', '13523062'),
(982, '2018-03-03', NULL, 'H', '', '13523069'),
(983, '2018-03-03', NULL, 'H', '', '13523096'),
(984, '2018-03-03', NULL, 'H', '', '13523111'),
(985, '2018-03-03', NULL, 'H', '', '13523120'),
(986, '2018-03-03', NULL, 'H', '', '13523134'),
(987, '2018-03-03', NULL, 'S', 'asma', '13523135'),
(988, '2018-03-03', NULL, 'H', '', '1352313599'),
(989, '2018-03-03', NULL, 'H', '', '13523136'),
(990, '2018-03-03', NULL, 'H', '', '13523138'),
(991, '2018-03-03', NULL, 'H', '', '13523139'),
(992, '2018-03-03', NULL, 'H', '', '135231399'),
(993, '2018-03-03', NULL, 'H', '', '13523143'),
(994, '2018-03-03', NULL, 'H', '', '13523555'),
(995, '2018-03-03', NULL, 'H', '', '198503302003121002'),
(996, '2018-03-03', NULL, 'H', '', '333444555'),
(997, '2018-03-03', NULL, 'H', '', '566656'),
(998, '2018-03-03', NULL, 'H', '', '676888999'),
(999, '2018-03-03', NULL, 'H', '', '777888666'),
(1000, '2018-03-03', NULL, 'H', '', '87283282'),
(1001, '2018-03-03', NULL, 'H', '', '888777'),
(1002, '2018-03-03', NULL, 'H', '', '989234'),
(1003, '2018-03-03', NULL, 'H', '', '9999922');

-- --------------------------------------------------------

--
-- Table structure for table `presensi_siswa`
--

CREATE TABLE `presensi_siswa` (
  `id_presensi` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `status_kehadiran` enum('H','I','S','A') NOT NULL,
  `siswa_kelas_id` varchar(10) NOT NULL,
  `kelas_berjalan_id` int(11) NOT NULL,
  `kelas_tambahan_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `prestasi`
--

CREATE TABLE `prestasi` (
  `id_prestasi` int(20) NOT NULL,
  `nisn` varchar(10) NOT NULL,
  `jenis_prestasi` varchar(20) NOT NULL,
  `tingkat_pend` varchar(20) NOT NULL,
  `tahun` int(5) NOT NULL,
  `peringkat` int(5) NOT NULL,
  `keterangan` int(100) NOT NULL,
  `foto` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `prioritas_khusus`
--

CREATE TABLE `prioritas_khusus` (
  `id_rentang_jam` int(10) DEFAULT NULL,
  `NIP` varchar(20) DEFAULT NULL,
  `id_prkh` int(10) NOT NULL,
  `jenis_prkh` enum('prioritas','khusus') NOT NULL,
  `id_mapel` int(10) DEFAULT NULL,
  `id_tahun_ajaran` int(10) NOT NULL,
  `jam_ke` varchar(2) NOT NULL,
  `hari` enum('Senin','Selasa','Rabu','Kamis','Jumat','Sabtu','Minggu') NOT NULL,
  `id_namamapel` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `prioritas_khusus`
--

INSERT INTO `prioritas_khusus` (`id_rentang_jam`, `NIP`, `id_prkh`, `jenis_prkh`, `id_mapel`, `id_tahun_ajaran`, `jam_ke`, `hari`, `id_namamapel`) VALUES
(NULL, NULL, 51, 'prioritas', NULL, 1, '0', 'Senin', 3),
(NULL, NULL, 52, 'prioritas', NULL, 1, '6', 'Selasa', 3);

-- --------------------------------------------------------

--
-- Table structure for table `setting`
--

CREATE TABLE `setting` (
  `id_setting` int(20) NOT NULL,
  `nama_sekolah` varchar(255) NOT NULL,
  `id_tahun_ajaran` int(10) NOT NULL,
  `hari_libur` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `setting`
--

INSERT INTO `setting` (`id_setting`, `nama_sekolah`, `id_tahun_ajaran`, `hari_libur`) VALUES
(1, 'SMP Negeri 8 Yogyakarta', 2, 'Minggu');

-- --------------------------------------------------------

--
-- Table structure for table `siswa`
--

CREATE TABLE `siswa` (
  `nisn` varchar(10) NOT NULL,
  `no_induk_siswa` int(10) NOT NULL,
  `foto` text,
  `nama` varchar(50) NOT NULL,
  `jenis_kelamin` enum('Laki-Laki','Perempuan') NOT NULL,
  `tempat_lahir` varchar(15) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `agama` enum('Islam','Kristen','Hindu','Budha','Konghucu','Katholik') NOT NULL,
  `berkebutuhan_khusus` enum('Tidak','Netra','Rungu','Grahita Ringan','Grahita Sedang','Daksa Ringan','Daksa Sedang','Laras','Wicara','Tuna Ganda','Hiperaktif','Cerdas Istimewa','Bakat Istimewa','Kesulitan Belajar','Narkoba','Indigo','Down Syndrome','Autis','Terbelakang','Bencana Alam/ Sosial','Tidak Mampu Ekonomi','Lainnya') NOT NULL,
  `alamat` varchar(150) NOT NULL,
  `rt` int(3) NOT NULL,
  `rw` int(3) NOT NULL,
  `nama_dusun` varchar(20) NOT NULL,
  `desa_kelurahan` varchar(20) NOT NULL,
  `kecamatan` varchar(20) NOT NULL,
  `kode_pos` int(6) NOT NULL,
  `tempat_tinggal` enum('Dengan Orang Tua','Dengan Saudara','Tinggal di Asrama','Tinggal di Kos') NOT NULL,
  `kategori_penduduk` enum('Dalam Daerah','Luar Daerah') NOT NULL,
  `transportasi` enum('Jalan Kaki','Angkutan Umum','Mobil/ Bus Antar Jemput','Sepeda','Sepeda Motor','Mobil Pribadi','Lainnya') NOT NULL,
  `no_telepon` int(15) NOT NULL,
  `email` varchar(20) NOT NULL,
  `nama_sd_mi` varchar(30) NOT NULL,
  `lama_belajar_disd_mi` int(2) NOT NULL,
  `pernah_paud` enum('Ya','Tidak') NOT NULL,
  `pernah_tk` enum('Ya','Tidak') NOT NULL,
  `no_skhun_mi` int(9) NOT NULL,
  `no_seri_skhun_s` int(16) NOT NULL,
  `no_seri_ijazah_sd_mi` int(10) NOT NULL,
  `penerima_kps_kks_pkh_kip` enum('Ya','Tidak') NOT NULL,
  `no_penerima` int(17) NOT NULL,
  `anak_ke` int(2) NOT NULL,
  `jumlah_saudara_kadung` int(2) NOT NULL,
  `jumlah_saudara_tiri` int(2) NOT NULL,
  `jumlah_saudara_angkat` int(2) NOT NULL,
  `status_dalam_keluaraga` enum('Kandung','Angkat') NOT NULL,
  `pernah_menderita_sakit` varchar(50) NOT NULL,
  `pernah_mengaji` enum('Ya','Tidak') NOT NULL,
  `keterangan_mengaji` varchar(50) NOT NULL,
  `anak_yatim_piatu` enum('Tidak','Yatim','Piatu','Yatim Piatu') NOT NULL,
  `bahasa_sehari_hari_dirumah` varchar(50) NOT NULL,
  `prestasi_disekolah` varchar(100) NOT NULL,
  `status_siswa` enum('Aktif','Lulus','Keluar') NOT NULL,
  `terdaftar_sebagai` varchar(50) NOT NULL,
  `tinggi_badan` int(10) NOT NULL,
  `berat_badan` int(5) NOT NULL,
  `hobi` varchar(1000) NOT NULL,
  `id_siswa_mutasi_keluar` int(2) DEFAULT NULL,
  `id_orangtua` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `siswa`
--

INSERT INTO `siswa` (`nisn`, `no_induk_siswa`, `foto`, `nama`, `jenis_kelamin`, `tempat_lahir`, `tanggal_lahir`, `agama`, `berkebutuhan_khusus`, `alamat`, `rt`, `rw`, `nama_dusun`, `desa_kelurahan`, `kecamatan`, `kode_pos`, `tempat_tinggal`, `kategori_penduduk`, `transportasi`, `no_telepon`, `email`, `nama_sd_mi`, `lama_belajar_disd_mi`, `pernah_paud`, `pernah_tk`, `no_skhun_mi`, `no_seri_skhun_s`, `no_seri_ijazah_sd_mi`, `penerima_kps_kks_pkh_kip`, `no_penerima`, `anak_ke`, `jumlah_saudara_kadung`, `jumlah_saudara_tiri`, `jumlah_saudara_angkat`, `status_dalam_keluaraga`, `pernah_menderita_sakit`, `pernah_mengaji`, `keterangan_mengaji`, `anak_yatim_piatu`, `bahasa_sehari_hari_dirumah`, `prestasi_disekolah`, `status_siswa`, `terdaftar_sebagai`, `tinggi_badan`, `berat_badan`, `hobi`, `id_siswa_mutasi_keluar`, `id_orangtua`) VALUES
('12345', 123, 'siswa.jpg', 'Bagio', 'Laki-Laki', 'Batam', '2000-08-08', 'Kristen', 'Autis', 'asjdhasjdha', 1, 3, 'Koplok', 'kosong', 'sasa', 123123, 'Dengan Orang Tua', 'Dalam Daerah', 'Mobil/ Bus Antar Jemput', 783748347, 'akahsdaskdja', 'min', 20, 'Ya', 'Ya', 123121, 23123, 12312, 'Ya', 123123, 99, 99, 10, 10, 'Kandung', 'koma', 'Ya', 'asdasda', 'Yatim', 'dasdasd', 'sdasdasd', 'Lulus', 'sdasd', 198, 100, 'bola', NULL, 1),
('999', 999, 'siswa1.png', 'Hairunnisa', 'Perempuan', '', '0000-00-00', '', '', '', 0, 0, '', '', '', 0, '', '', '', 0, '', '', 0, '', '', 0, 0, 0, '', 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', 0, 0, '', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `siswa_kelas_has_kelas_tambahan`
--

CREATE TABLE `siswa_kelas_has_kelas_tambahan` (
  `siswa_kelas_NISN` int(11) NOT NULL,
  `Kelas_tambahan_id_kelas_tambahan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `siswa_mutasi_keluar`
--

CREATE TABLE `siswa_mutasi_keluar` (
  `id_siswa_mutasi_keluar` int(10) NOT NULL,
  `surat_ket_pindah` text NOT NULL,
  `surat_bebas_administrasi` text NOT NULL,
  `berkas_1` tinyint(1) NOT NULL,
  `berkas_2` tinyint(1) NOT NULL,
  `berkas_3` tinyint(1) NOT NULL,
  `berkas_4` tinyint(1) NOT NULL,
  `berkas_5` tinyint(1) NOT NULL,
  `id_tahun_ajaran` int(10) NOT NULL,
  `nisn` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `siswa_mutasi_masuk`
--

CREATE TABLE `siswa_mutasi_masuk` (
  `id_pendaftar_mutasi` int(10) NOT NULL,
  `nama_pendaftar_mutasi` varchar(20) NOT NULL,
  `nilai_un` float NOT NULL,
  `nilai_ujian_masuk` float NOT NULL,
  `status_siswa` enum('Diterima','Ditolak') NOT NULL,
  `surat_ket_nisn` text NOT NULL,
  `fc_buku_rapor` text NOT NULL,
  `fc_skhun` text NOT NULL,
  `surat_ket_bangku` text NOT NULL,
  `surat_ket_pindah` text NOT NULL,
  `skck_kepsek` text NOT NULL,
  `id_tahun_ajaran` int(10) NOT NULL,
  `nisn` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tahunajaran`
--

CREATE TABLE `tahunajaran` (
  `id_tahun_ajaran` int(10) NOT NULL,
  `tahun_ajaran` varchar(15) NOT NULL,
  `semester` enum('ganjil','genap') NOT NULL,
  `tanggal_mulai` date NOT NULL,
  `tanggal_selesai` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tahunajaran`
--

INSERT INTO `tahunajaran` (`id_tahun_ajaran`, `tahun_ajaran`, `semester`, `tanggal_mulai`, `tanggal_selesai`) VALUES
(1, '2016/2017', 'ganjil', '2016-09-01', '2017-01-31'),
(2, '2016/2017', 'genap', '2017-02-01', '2017-06-30'),
(3, '2017/2018', 'ganjil', '2017-09-01', '2018-01-31'),
(4, '2017/2018', 'genap', '2018-02-01', '2018-06-30'),
(5, '2018/2019', 'ganjil', '2018-09-01', '2017-10-05'),
(6, '2018/2019', 'genap', '2018-12-30', '2019-01-30'),
(7, '2019/2020', 'ganjil', '2018-07-13', '2018-12-13');

-- --------------------------------------------------------

--
-- Table structure for table `tanggal_libur`
--

CREATE TABLE `tanggal_libur` (
  `id_tanggal_libur` int(11) NOT NULL,
  `tanggal_awal` date NOT NULL,
  `nama_libur` varchar(255) NOT NULL,
  `tanggal_akhir` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tanggal_libur`
--

INSERT INTO `tanggal_libur` (`id_tanggal_libur`, `tanggal_awal`, `nama_libur`, `tanggal_akhir`) VALUES
(1, '2017-10-31', 'Hari Libur Nasional', '2017-10-31'),
(3, '2017-10-28', 'Sumpah Pemuda', '2017-10-28'),
(4, '2017-11-11', 'Hari Libur', '2017-11-15'),
(5, '2018-02-21', 'Puasa', '2018-02-24');

-- --------------------------------------------------------

--
-- Table structure for table `tanggal_libur_nasional`
--

CREATE TABLE `tanggal_libur_nasional` (
  `id_tanggal_libur_nasional` int(25) NOT NULL,
  `tanggal_libur_nasional` int(25) NOT NULL,
  `bulan_libur_nasional` int(25) NOT NULL,
  `nama_libur_nasional` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tanggal_libur_nasional`
--

INSERT INTO `tanggal_libur_nasional` (`id_tanggal_libur_nasional`, `tanggal_libur_nasional`, `bulan_libur_nasional`, `nama_libur_nasional`) VALUES
(4, 1, 1, 'Tahun Baru'),
(6, 17, 8, 'Hari Kemerdekaan RI'),
(7, 6, 7, 'Tahun Baru Imlek'),
(8, 4, 8, 'Tahun Baru'),
(9, 3, 7, 'Tahun Baru'),
(10, 6, 6, 'Hari Kemerdekaan RI');

-- --------------------------------------------------------

--
-- Table structure for table `tugas`
--

CREATE TABLE `tugas` (
  `id_tugas` int(5) NOT NULL,
  `nama_tugas` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `absensi_harian`
--
ALTER TABLE `absensi_harian`
  ADD PRIMARY KEY (`id_absen_harian`),
  ADD KEY `nisn` (`nisn`);

--
-- Indexes for table `akun`
--
ALTER TABLE `akun`
  ADD PRIMARY KEY (`id_akun`),
  ADD KEY `NIP` (`NIP`),
  ADD KEY `id_jabatan` (`id_jabatan`),
  ADD KEY `nisn` (`nisn`),
  ADD KEY `nisn_2` (`nisn`);

--
-- Indexes for table `bayar`
--
ALTER TABLE `bayar`
  ADD PRIMARY KEY (`id_siswa`),
  ADD UNIQUE KEY `id_kelas_tambahan` (`id_kelas_tambahan`);

--
-- Indexes for table `daftar_ulang`
--
ALTER TABLE `daftar_ulang`
  ADD PRIMARY KEY (`id_daftar_ulang`),
  ADD KEY `id_tahun_ajaran` (`id_tahun_ajaran`),
  ADD KEY `nisn` (`nisn`),
  ADD KEY `nomor_pendaftar_ujian` (`nomor_pendaftar_ujian`),
  ADD KEY `no_pendaftar` (`no_pendaftar`);

--
-- Indexes for table `deskripsi_nilai`
--
ALTER TABLE `deskripsi_nilai`
  ADD PRIMARY KEY (`id_deskripsi`),
  ADD KEY `mapel_id` (`mapel_id`);

--
-- Indexes for table `form_ppdb`
--
ALTER TABLE `form_ppdb`
  ADD PRIMARY KEY (`id_form_ppdb`);

--
-- Indexes for table `form_ujian`
--
ALTER TABLE `form_ujian`
  ADD PRIMARY KEY (`id_form_ujian`);

--
-- Indexes for table `hari_rentang`
--
ALTER TABLE `hari_rentang`
  ADD PRIMARY KEY (`id_rentang_jam`),
  ADD KEY `id_tahun_ajaran` (`id_tahun_ajaran`);

--
-- Indexes for table `jabatan`
--
ALTER TABLE `jabatan`
  ADD PRIMARY KEY (`id_jabatan`);

--
-- Indexes for table `jabatan_has_tugas`
--
ALTER TABLE `jabatan_has_tugas`
  ADD KEY `jabatan_id_jabatan` (`jabatan_id_jabatan`),
  ADD KEY `tugas_id_tugas` (`tugas_id_tugas`);

--
-- Indexes for table `jadwal_ekskul`
--
ALTER TABLE `jadwal_ekskul`
  ADD PRIMARY KEY (`id_jadwal_ekskul`),
  ADD KEY `id_pembimbing` (`id_pembimbing`),
  ADD KEY `jenis_kls_tambahan` (`id_jenis_kls_tambahan`),
  ADD KEY `id_tahun_ajaran` (`id_tahun_ajaran`);

--
-- Indexes for table `jadwal_mapel`
--
ALTER TABLE `jadwal_mapel`
  ADD PRIMARY KEY (`id_jadwal_mapel`),
  ADD KEY `id_kelas_berjalan` (`id_kelas_berjalan`),
  ADD KEY `id_mapel` (`id_mapel`),
  ADD KEY `id_tahun_ajaran` (`id_tahun_ajaran`),
  ADD KEY `NIP` (`NIP`);

--
-- Indexes for table `jadwal_piket_guru`
--
ALTER TABLE `jadwal_piket_guru`
  ADD PRIMARY KEY (`id_jdwl_piket_guru`),
  ADD KEY `NIP` (`NIP`),
  ADD KEY `id_tahun_ajaran` (`id_tahun_ajaran`);

--
-- Indexes for table `jadwal_tambahan`
--
ALTER TABLE `jadwal_tambahan`
  ADD PRIMARY KEY (`id_jadwal_tambahan`),
  ADD KEY `NIP` (`NIP`),
  ADD KEY `id_kelas_tambahan` (`id_kelas_tambahan`),
  ADD KEY `id_tahun_ajaran` (`id_tahun_ajaran`),
  ADD KEY `id_namamapel` (`id_namamapel`);

--
-- Indexes for table `jam_mengajar`
--
ALTER TABLE `jam_mengajar`
  ADD PRIMARY KEY (`id_jam_mgjr`),
  ADD KEY `NIP` (`NIP`),
  ADD KEY `id_tahun_ajaran` (`id_tahun_ajaran`),
  ADD KEY `id_namamapel` (`id_namamapel`);

--
-- Indexes for table `jenis_kls_tambahan`
--
ALTER TABLE `jenis_kls_tambahan`
  ADD PRIMARY KEY (`id_jenis_kls_tambahan`);

--
-- Indexes for table `jenis_nilai_akhir`
--
ALTER TABLE `jenis_nilai_akhir`
  ADD PRIMARY KEY (`id_jenis_na`);

--
-- Indexes for table `jenis_pelanggaran`
--
ALTER TABLE `jenis_pelanggaran`
  ADD PRIMARY KEY (`id_jenis_pelanggaran`),
  ADD KEY `tgl_kejadian` (`tgl_kejadian`);

--
-- Indexes for table `kategori_nilai`
--
ALTER TABLE `kategori_nilai`
  ADD PRIMARY KEY (`id_kategorinilai`);

--
-- Indexes for table `kelas_berjalan`
--
ALTER TABLE `kelas_berjalan`
  ADD PRIMARY KEY (`id_kelas_kerjalan`),
  ADD KEY `id_tahun_ajaran` (`id_tahun_ajaran`);

--
-- Indexes for table `kelas_reguler`
--
ALTER TABLE `kelas_reguler`
  ADD PRIMARY KEY (`id_kelas_reguler`),
  ADD KEY `id_tahun_ajaran` (`id_tahun_ajaran`);

--
-- Indexes for table `kelas_reguler_berjalan`
--
ALTER TABLE `kelas_reguler_berjalan`
  ADD PRIMARY KEY (`id_kelas_reguler_berjalan`),
  ADD KEY `nisn` (`nisn`),
  ADD KEY `id_kelas_reguler` (`id_kelas_reguler`),
  ADD KEY `id_tahun_ajaran` (`id_tahun_ajaran`);

--
-- Indexes for table `kelas_tambahan`
--
ALTER TABLE `kelas_tambahan`
  ADD PRIMARY KEY (`id_kelas_tambahan`),
  ADD KEY `id_jenis_kls_tambahan` (`id_jenis_kls_tambahan`),
  ADD KEY `id_tahun_ajaran` (`id_tahun_ajaran`);

--
-- Indexes for table `kelas_tambahan_berjalan`
--
ALTER TABLE `kelas_tambahan_berjalan`
  ADD PRIMARY KEY (`id_kelas_tambahan_berjalan`),
  ADD KEY `nisn` (`nisn`),
  ADD KEY `id_kelas_tambahan` (`id_kelas_tambahan`),
  ADD KEY `id_tahun_ajaran` (`id_tahun_ajaran`);

--
-- Indexes for table `ketentuan_ppdb`
--
ALTER TABLE `ketentuan_ppdb`
  ADD PRIMARY KEY (`id_ketentuan`);

--
-- Indexes for table `keterlambatan`
--
ALTER TABLE `keterlambatan`
  ADD PRIMARY KEY (`id_keterlambatan`),
  ADD KEY `NISN` (`nisn`);

--
-- Indexes for table `klinik_un`
--
ALTER TABLE `klinik_un`
  ADD PRIMARY KEY (`id_klinik_un`),
  ADD KEY `nisn` (`nisn`),
  ADD KEY `NIP` (`NIP`);

--
-- Indexes for table `kurikulum`
--
ALTER TABLE `kurikulum`
  ADD PRIMARY KEY (`id_kurikulum`),
  ADD KEY `tahunajaran_id` (`tahunajaran_id`);

--
-- Indexes for table `login_backend`
--
ALTER TABLE `login_backend`
  ADD PRIMARY KEY (`id_user`);

--
-- Indexes for table `mapel`
--
ALTER TABLE `mapel`
  ADD PRIMARY KEY (`id_mapel`),
  ADD KEY `id_tahun_ajaran` (`id_tahun_ajaran`),
  ADD KEY `id_kelas_reguler` (`id_kelas_reguler`),
  ADD KEY `id_namamapel` (`id_namamapel`);

--
-- Indexes for table `mutasi`
--
ALTER TABLE `mutasi`
  ADD PRIMARY KEY (`id_mutasi`),
  ADD KEY `id_tahun_ajaran` (`id_tahun_ajaran`),
  ADD KEY `id_siswa_mutasi_keluar` (`id_siswa_mutasi_keluar`),
  ADD KEY `id_pendaftar_mutasi` (`id_pendaftar_mutasi`),
  ADD KEY `nisn` (`nisn`);

--
-- Indexes for table `namamapel`
--
ALTER TABLE `namamapel`
  ADD PRIMARY KEY (`id_namamapel`);

--
-- Indexes for table `nilaiekskul`
--
ALTER TABLE `nilaiekskul`
  ADD PRIMARY KEY (`id_niaiekskul`),
  ADD KEY `id_siswakls` (`id_siswakls`);

--
-- Indexes for table `nilai_siswa`
--
ALTER TABLE `nilai_siswa`
  ADD PRIMARY KEY (`id_nilai_siswa`),
  ADD UNIQUE KEY `id_kelas_berjalan` (`id_kelas_berjalan`),
  ADD KEY `kategori_nilai` (`kategori_nilai_id`),
  ADD KEY `nilai_akhir` (`jenis_na_id`),
  ADD KEY `mapel_id` (`mapel_id`);

--
-- Indexes for table `orangtua_wali`
--
ALTER TABLE `orangtua_wali`
  ADD PRIMARY KEY (`id_orangtua`);

--
-- Indexes for table `passing_grade`
--
ALTER TABLE `passing_grade`
  ADD PRIMARY KEY (`id_grade`),
  ADD KEY `id_tahun_ajaran` (`id_tahun_ajaran`);

--
-- Indexes for table `pegawai`
--
ALTER TABLE `pegawai`
  ADD PRIMARY KEY (`NIP`);

--
-- Indexes for table `pembimbing`
--
ALTER TABLE `pembimbing`
  ADD PRIMARY KEY (`id_pembimbing`);

--
-- Indexes for table `pendaftar_jalur_ujian`
--
ALTER TABLE `pendaftar_jalur_ujian`
  ADD PRIMARY KEY (`nomor_pendaftar_ujian`),
  ADD KEY `id_tahun_ajaran` (`id_tahun_ajaran`),
  ADD KEY `id_akun_siswa` (`id_akun_siswa`),
  ADD KEY `nisn` (`nisn`);

--
-- Indexes for table `pendaftar_jalur_un`
--
ALTER TABLE `pendaftar_jalur_un`
  ADD PRIMARY KEY (`no_pendaftar`),
  ADD KEY `id_tahun_ajaran` (`id_tahun_ajaran`),
  ADD KEY `id_akun_siswa` (`id_akun_siswa`),
  ADD KEY `nisn` (`nisn`);

--
-- Indexes for table `pendaftar_ppdb`
--
ALTER TABLE `pendaftar_ppdb`
  ADD PRIMARY KEY (`nisn_pendaftar`),
  ADD KEY `id_tahun_ajaran` (`id_tahun_ajaran`);

--
-- Indexes for table `pengumuman_mutasi`
--
ALTER TABLE `pengumuman_mutasi`
  ADD PRIMARY KEY (`id_pengumuman_mutasi`);

--
-- Indexes for table `pengumuman_ppdb`
--
ALTER TABLE `pengumuman_ppdb`
  ADD PRIMARY KEY (`id_pengumuman_ppdb`);

--
-- Indexes for table `poin_pelanggaran`
--
ALTER TABLE `poin_pelanggaran`
  ADD KEY `NISN` (`nisn`),
  ADD KEY `id_jenis_pelanggaran` (`id_jenis_pelanggaran`);

--
-- Indexes for table `presensisiswa`
--
ALTER TABLE `presensisiswa`
  ADD PRIMARY KEY (`id_presensisiswa`),
  ADD KEY `nisn` (`nisn`);

--
-- Indexes for table `presensi_pegawai`
--
ALTER TABLE `presensi_pegawai`
  ADD PRIMARY KEY (`Id_presensi`),
  ADD KEY `NIP` (`NIP`);

--
-- Indexes for table `presensi_siswa`
--
ALTER TABLE `presensi_siswa`
  ADD PRIMARY KEY (`id_presensi`),
  ADD KEY `siswa_kelas_id` (`siswa_kelas_id`),
  ADD KEY `kelas_berjalan_id` (`kelas_berjalan_id`),
  ADD KEY `kelas_tambahan_id` (`kelas_tambahan_id`);

--
-- Indexes for table `prestasi`
--
ALTER TABLE `prestasi`
  ADD PRIMARY KEY (`id_prestasi`),
  ADD KEY `NISN` (`nisn`);

--
-- Indexes for table `prioritas_khusus`
--
ALTER TABLE `prioritas_khusus`
  ADD PRIMARY KEY (`id_prkh`),
  ADD KEY `id_rentang_jam` (`id_rentang_jam`),
  ADD KEY `NIP` (`NIP`),
  ADD KEY `id_tahun_ajaran` (`id_tahun_ajaran`),
  ADD KEY `id_mapel` (`id_mapel`),
  ADD KEY `id_namamapel` (`id_namamapel`);

--
-- Indexes for table `setting`
--
ALTER TABLE `setting`
  ADD PRIMARY KEY (`id_setting`),
  ADD KEY `id_tahun_ajaran` (`id_tahun_ajaran`);

--
-- Indexes for table `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`nisn`),
  ADD KEY `id_siswa_mutasi_keluar` (`id_siswa_mutasi_keluar`),
  ADD KEY `id_orangtua` (`id_orangtua`);

--
-- Indexes for table `siswa_mutasi_keluar`
--
ALTER TABLE `siswa_mutasi_keluar`
  ADD PRIMARY KEY (`id_siswa_mutasi_keluar`),
  ADD KEY `id_tahun_ajaran` (`id_tahun_ajaran`),
  ADD KEY `nisn` (`nisn`);

--
-- Indexes for table `siswa_mutasi_masuk`
--
ALTER TABLE `siswa_mutasi_masuk`
  ADD PRIMARY KEY (`nisn`),
  ADD UNIQUE KEY `id_pendaftar_mutasi` (`id_pendaftar_mutasi`),
  ADD KEY `id_tahun_ajaran` (`id_tahun_ajaran`);

--
-- Indexes for table `tahunajaran`
--
ALTER TABLE `tahunajaran`
  ADD PRIMARY KEY (`id_tahun_ajaran`);

--
-- Indexes for table `tanggal_libur`
--
ALTER TABLE `tanggal_libur`
  ADD PRIMARY KEY (`id_tanggal_libur`);

--
-- Indexes for table `tanggal_libur_nasional`
--
ALTER TABLE `tanggal_libur_nasional`
  ADD PRIMARY KEY (`id_tanggal_libur_nasional`);

--
-- Indexes for table `tugas`
--
ALTER TABLE `tugas`
  ADD PRIMARY KEY (`id_tugas`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `akun`
--
ALTER TABLE `akun`
  MODIFY `id_akun` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;
--
-- AUTO_INCREMENT for table `deskripsi_nilai`
--
ALTER TABLE `deskripsi_nilai`
  MODIFY `id_deskripsi` int(3) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `form_ppdb`
--
ALTER TABLE `form_ppdb`
  MODIFY `id_form_ppdb` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;
--
-- AUTO_INCREMENT for table `form_ujian`
--
ALTER TABLE `form_ujian`
  MODIFY `id_form_ujian` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `hari_rentang`
--
ALTER TABLE `hari_rentang`
  MODIFY `id_rentang_jam` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;
--
-- AUTO_INCREMENT for table `jabatan`
--
ALTER TABLE `jabatan`
  MODIFY `id_jabatan` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `jadwal_ekskul`
--
ALTER TABLE `jadwal_ekskul`
  MODIFY `id_jadwal_ekskul` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `jadwal_piket_guru`
--
ALTER TABLE `jadwal_piket_guru`
  MODIFY `id_jdwl_piket_guru` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;
--
-- AUTO_INCREMENT for table `jadwal_tambahan`
--
ALTER TABLE `jadwal_tambahan`
  MODIFY `id_jadwal_tambahan` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `jam_mengajar`
--
ALTER TABLE `jam_mengajar`
  MODIFY `id_jam_mgjr` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT for table `jenis_nilai_akhir`
--
ALTER TABLE `jenis_nilai_akhir`
  MODIFY `id_jenis_na` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `kategori_nilai`
--
ALTER TABLE `kategori_nilai`
  MODIFY `id_kategorinilai` int(2) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `kurikulum`
--
ALTER TABLE `kurikulum`
  MODIFY `id_kurikulum` int(3) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `login_backend`
--
ALTER TABLE `login_backend`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `mapel`
--
ALTER TABLE `mapel`
  MODIFY `id_mapel` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;
--
-- AUTO_INCREMENT for table `namamapel`
--
ALTER TABLE `namamapel`
  MODIFY `id_namamapel` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT for table `nilai_siswa`
--
ALTER TABLE `nilai_siswa`
  MODIFY `id_nilai_siswa` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `presensisiswa`
--
ALTER TABLE `presensisiswa`
  MODIFY `id_presensisiswa` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `presensi_pegawai`
--
ALTER TABLE `presensi_pegawai`
  MODIFY `Id_presensi` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1004;
--
-- AUTO_INCREMENT for table `presensi_siswa`
--
ALTER TABLE `presensi_siswa`
  MODIFY `id_presensi` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `prioritas_khusus`
--
ALTER TABLE `prioritas_khusus`
  MODIFY `id_prkh` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;
--
-- AUTO_INCREMENT for table `setting`
--
ALTER TABLE `setting`
  MODIFY `id_setting` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tahunajaran`
--
ALTER TABLE `tahunajaran`
  MODIFY `id_tahun_ajaran` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `tanggal_libur`
--
ALTER TABLE `tanggal_libur`
  MODIFY `id_tanggal_libur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `tanggal_libur_nasional`
--
ALTER TABLE `tanggal_libur_nasional`
  MODIFY `id_tanggal_libur_nasional` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `kelas_reguler`
--
ALTER TABLE `kelas_reguler`
  ADD CONSTRAINT `kelas_reguler_ibfk_1` FOREIGN KEY (`id_tahun_ajaran`) REFERENCES `tahunajaran` (`id_tahun_ajaran`);

--
-- Constraints for table `pendaftar_ppdb`
--
ALTER TABLE `pendaftar_ppdb`
  ADD CONSTRAINT `pendaftar_ppdb_ibfk_1` FOREIGN KEY (`id_tahun_ajaran`) REFERENCES `tahunajaran` (`id_tahun_ajaran`);

--
-- Constraints for table `prioritas_khusus`
--
ALTER TABLE `prioritas_khusus`
  ADD CONSTRAINT `prioritas_khusus_ibfk_2` FOREIGN KEY (`NIP`) REFERENCES `pegawai` (`NIP`),
  ADD CONSTRAINT `prioritas_khusus_ibfk_3` FOREIGN KEY (`id_rentang_jam`) REFERENCES `hari_rentang` (`id_rentang_jam`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
