-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jan 11, 2018 at 07:06 AM
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
(1, 'kepsek', '13523111', 1, NULL),
(2, '12345', '13523135', 2, NULL),
(3, 'pegawai', '13523069', 3, NULL),
(4, 'guru', '13523138', 4, NULL),
(5, 'konseling', '13523143', 5, NULL),
(11, 'kesiswaan', '13523096', 6, NULL),
(12, 'kurikulum', '13523062', 7, NULL),
(13, 'siswaaa', NULL, 8, '12345'),
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
(34, '1234', '111222333', 1, NULL);

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
(1, 'Kepala Sekolah', 'kepsek', '1,2,3'),
(2, 'Admin', 'superadmin', '1,2,3,4'),
(3, 'Pegawai', 'pegawai', '1,2,4'),
(4, 'Guru', 'Guru', ''),
(5, 'Konseling', 'konseling', ''),
(6, 'Kesiswaan', 'kesiswaan', ''),
(7, 'Kurikulum', 'kurikulum', ''),
(8, 'Siswa', 'siswa', ''),
(9, 'Pembimbing', 'pembimbing', ''),
(10, 'Karyawan', 'karyawan', ''),
(11, 'Guru Piket', 'gurupiket', '');

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
  `jdwl_piket_guru` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  `jadwal_tambahan` varchar(20) NOT NULL,
  `id_jadwal_tambahan` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  `nama` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  `Nama` varchar(50) NOT NULL,
  `No_SK` varchar(20) NOT NULL,
  `Jenis_kelamin` enum('Laki-Laki','Perempuan') NOT NULL,
  `Golongan` varchar(10) NOT NULL,
  `alamat` text NOT NULL,
  `kontak` varchar(20) NOT NULL,
  `kompetensi` enum('Pedagogik','Kepribadian','Sosial','Profesional') NOT NULL,
  `Agama` enum('Islam','Kristen','Katholik','Budha','Hindu','Lainnya') NOT NULL,
  `tempatlahir` varchar(255) NOT NULL,
  `TTL` date NOT NULL,
  `kode_guru` int(3) DEFAULT NULL,
  `foto` text,
  `TMT_capeg` date NOT NULL,
  `Pendidikan` enum('D1','D2','D3','S1','S2','S3','','','','') NOT NULL,
  `Status` enum('Guru','Karyawan') NOT NULL,
  `Status_pensiun` varchar(255) DEFAULT NULL,
  `nama_panggilan` varchar(255) NOT NULL,
  `pangkat` varchar(50) DEFAULT NULL,
  `matapelajaran` varchar(255) NOT NULL,
  `namaayah` varchar(50) NOT NULL,
  `tempatlahirayah` varchar(255) NOT NULL,
  `tanggallahirayah` date NOT NULL,
  `agamaayah` enum('Islam','Kristen','Katholik','Budha','Hindu','Lainnya') NOT NULL,
  `nomorayah` varchar(20) NOT NULL,
  `pekerjaanayah` varchar(255) NOT NULL,
  `alamatayah` text NOT NULL,
  `namaibu` varchar(50) NOT NULL,
  `tempatlahiribu` varchar(255) NOT NULL,
  `tanggallahiribu` date NOT NULL,
  `agamaibu` enum('Islam','Kristen','Katholik','Budha','Hindu','Lainnya') NOT NULL,
  `nomoribu` varchar(20) NOT NULL,
  `pekerjaanibu` varchar(255) NOT NULL,
  `alamatibu` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pegawai`
--

INSERT INTO `pegawai` (`NIP`, `Nama`, `No_SK`, `Jenis_kelamin`, `Golongan`, `alamat`, `kontak`, `kompetensi`, `Agama`, `tempatlahir`, `TTL`, `kode_guru`, `foto`, `TMT_capeg`, `Pendidikan`, `Status`, `Status_pensiun`, `nama_panggilan`, `pangkat`, `matapelajaran`, `namaayah`, `tempatlahirayah`, `tanggallahirayah`, `agamaayah`, `nomorayah`, `pekerjaanayah`, `alamatayah`, `namaibu`, `tempatlahiribu`, `tanggallahiribu`, `agamaibu`, `nomoribu`, `pekerjaanibu`, `alamatibu`) VALUES
('11', 'kolom kolom', '128312398123', 'Laki-Laki', 'III/A', 'asdasdasdasd  sdas das das da s', '82727', 'Kepribadian', 'Katholik', 'Sintang', '2017-12-19', 7665, 'potrait3.jpg', '2017-12-06', 'D3', 'Karyawan', '', 'kolom', 'Guru Madya', 'Matematika', 'asidjasdj ijisd a', 'asjisiadjasjid', '2017-12-11', 'Katholik', '09098989', 'Petani', 'saisjdaisjd ji aisd jia', 'Goro ro', 'Jawa', '2017-12-20', 'Kristen', '92938123812', 'Aapa aja', 'sadn askjadjskd jskajd kasj dkasj '),
('110222337', 'Rohmatullah Alamin', '89239129399', 'Perempuan', 'III/A', 'Jalan gajah mada', '08524511555', 'Pedagogik', 'Islam', '', '2018-01-30', 9998, NULL, '2019-01-30', 'D3', 'Guru', NULL, 'Roh', 'Guru Muda', 'Bahasa Indonesia', '', '', '0000-00-00', 'Islam', '', '', '', '', '', '0000-00-00', 'Islam', '', '', ''),
('111', 'haha', '928913892381', 'Laki-Laki', 'IV/A', '1231231', '2131231', 'Kepribadian', 'Katholik', '', '2018-01-30', 91, 'potrait100.jpg', '2018-04-28', 'D3', 'Karyawan', '', 'huhu', 'Guru Muda', 'Matematika', '', '', '0000-00-00', 'Islam', '', '', '', '', '', '0000-00-00', 'Islam', '', '', ''),
('1111', 'qeweqweqw', '1231231', 'Laki-Laki', 'II/A', 'jakdas', '08080002020', 'Pedagogik', 'Islam', '', '2017-11-09', 1, '', '2017-11-10', 'D2', 'Karyawan', 'pensiun', 'qweqwe', '', '', '', '', '0000-00-00', 'Islam', '', '', '', '', '', '0000-00-00', 'Islam', '', '', ''),
('11111', 'Ini Kurikulum', '123123123', 'Laki-Laki', 'IV/A', 'Jl. Kaliurang 14,5', '085244424242', 'Kepribadian', 'Islam', '', '2017-12-21', 9, 'potrait99.jpg', '2017-12-08', 'S1', 'Guru', '', 'Kurikulum', 'Guru Madya', 'Penjaskes', '', '', '0000-00-00', 'Islam', '', '', '', '', '', '0000-00-00', 'Islam', '', '', ''),
('111222333', 'Rohmatullah', '89239129399', 'Perempuan', 'III/A', 'Jalan gajah mada', '08524511555', 'Pedagogik', 'Islam', '', '2018-01-30', 999, NULL, '2019-01-30', 'D3', 'Guru', 'pensiun', 'Roh', 'Guru Muda', 'Bahasa Inggris', '', '', '0000-00-00', 'Islam', '', '', '', '', '', '0000-00-00', 'Islam', '', '', ''),
('11231231', '23123123', '231231', 'Laki-Laki', '123231231', '123123', '1231231231', 'Kepribadian', 'Kristen', '', '2017-11-30', 2147483647, '', '2017-11-21', 'D3', 'Guru', '', '1231231', 'Pranata Muda', 'Bahasa Inggris', '', '', '0000-00-00', 'Islam', '', '', '', '', '', '0000-00-00', 'Islam', '', '', ''),
('1221129', 'Rusida ', '9888988899', 'Laki-Laki', 'IV/A', 'asdasd', '12312312', 'Pedagogik', 'Islam', '', '2018-01-30', 6559, NULL, '2018-01-30', 'S3', 'Guru', NULL, 'Rus', 'Guru Muda', 'IPA', '', '', '0000-00-00', 'Islam', '', '', '', '', '', '0000-00-00', 'Islam', '', '', ''),
('122112999', 'Rusida ', '9888988899', 'Laki-Laki', 'IV/A', 'asdasd', '12312312', 'Pedagogik', 'Islam', '', '2018-01-30', 6559, NULL, '2018-01-30', 'S3', 'Karyawan', NULL, 'Rus', 'Guru Muda', 'IPA', '', '', '0000-00-00', 'Islam', '', '', '', '', '', '0000-00-00', 'Islam', '', '', ''),
('12222', 'Munawaroh', '1231231', 'Perempuan', 'III/B', 'Jalan Oevang Oeray', '1213123123', 'Kepribadian', 'Islam', '', '2017-10-17', 2, '11.jpg', '2017-09-05', 'D2', 'Karyawan', '', 'Muna', 'Guru Madya', 'Bahasa Indonesia', '', '', '0000-00-00', 'Islam', '', '', '', '', '', '0000-00-00', 'Islam', '', '', ''),
('122888', 'Akokoko', '9888988899', 'Laki-Laki', 'IV/A', 'asdasd', '12312312', 'Pedagogik', 'Islam', '', '2018-01-30', 6559, NULL, '2018-01-30', 'S3', 'Karyawan', NULL, 'Rus', 'Guru Muda', 'IPA', '', '', '0000-00-00', 'Islam', '', '', '', '', '', '0000-00-00', 'Islam', '', '', ''),
('123', 'ACAH RIANTO, S,Pd', '123123', 'Laki-Laki', 'III/B', '32131', '21323', 'Pedagogik', 'Katholik', 'Sintang', '2017-11-11', 1231231, '2.jpg', '2017-12-02', 'D3', 'Guru', '', '123123', 'Guru  Muda', 'Matematika', 'asdasd', 'asdasd', '2018-01-09', 'Islam', '21312', '123aseqw', 'asdasd', '13213', 'asdsda', '2018-01-17', 'Kristen', '085724242424', 'buruh', 'asdasdasd'),
('12345', 'akmal joshua', '12312 1763172 18923 ', 'Laki-Laki', 'III/A', 'jl kaliurang km 7,8 sinduharjo', '085726241111', 'Pedagogik', 'Islam', 'sleman', '1974-01-02', 2, '', '2012-06-01', 'S1', 'Guru', NULL, 'akmal', 'pranata madya', 'IPA', 'paijo', 'sleman', '1958-01-01', 'Islam', '085726262626', 'Petani', 'sleman', 'harmini', 'sleman', '1965-01-05', 'Islam', '085724242424', 'buruh', 'sleman'),
('123456', 'paijo', 'A5576767', 'Laki-Laki', 'IIIB', 'jl kaliurang', '085723232323', 'Pedagogik', 'Islam', '', '1994-12-05', 3, '', '2004-12-01', 'S1', 'Guru', '', 'paijo', 'Guru Muda', 'IPA', '', '', '0000-00-00', 'Islam', '', '', '', '', '', '0000-00-00', 'Islam', '', '', ''),
('13313131', 'Muhammad Baharudin', '21982198288121', 'Laki-Laki', 'II/A', 'Jalan Kaliurang 14,5', '08080002020', 'Pedagogik', 'Islam', '', '1995-04-04', 15, 'potrait.jpg', '2017-04-04', 'D3', 'Guru', '', 'Udin', 'Pranata Muda', 'Kesenian', '', '', '0000-00-00', 'Islam', '', '', '', '', '', '0000-00-00', 'Islam', '', '', ''),
('13523062', 'Nadya Indi Rahesti, S.Ag.', '12312', 'Perempuan', 'III/B', 'Jalan Sudiro Hoesodo', '0987889888', 'Kepribadian', 'Katholik', '', '2018-02-07', 55, '1.jpg', '2018-01-12', 'D3', 'Guru', '', 'Aya', 'Guru Madya', 'IPA', '', '', '0000-00-00', 'Islam', '', '', '', '', '', '0000-00-00', 'Islam', '', '', ''),
('13523069', 'Drs. Dodi Ahmad Shahrudin', '12831231', 'Laki-Laki', 'III/A', 'asdasd asd asdasd', '12323', 'Kepribadian', 'Kristen', '', '2017-12-22', 11, '3.jpg', '2017-11-22', 'D2', 'Guru', '', 'Dodi', 'Guru  Muda', '', '', '', '0000-00-00', '', '', '', '', '', '', '0000-00-00', '', '', '', ''),
('13523096', 'Mia Puspa Elizabeth 99', '923812371748343', 'Perempuan', 'III/B', 'Jl. Wates, Argomulyo, Sedayu, Bantul, Daerah Istimewa Yogyakarta 55753, Indonesia', 'III/B', 'Pedagogik', 'Hindu', '', '2017-10-13', 4, '22.jpg', '2017-10-16', 'D2', 'Guru', NULL, 'asdasd', '', '', '', '', '0000-00-00', 'Islam', '', '', '', '', '', '0000-00-00', 'Islam', '', '', ''),
('13523111', 'Anggraeni Dias Saputri', '6276312371', 'Perempuan', 'IV/B', 'Jl. Bibis Raya, Tamantirto, Kasihan, Bantul, Daerah Istimewa Yogyakarta 55183, Indonesia', '0897464736', 'Kepribadian', 'Kristen', '', '1978-09-07', 5, '33.jpg', '2018-02-08', 'D3', 'Guru', '', 'anggrek', 'Guru  Muda', '', '', '', '0000-00-00', '', '', '', '', '', '', '0000-00-00', '', '', '', ''),
('13523120', 'Ridwan Mulawarman', '988736746847', 'Laki-Laki', 'II/A', 'JLn. MT.Haryono', '12313123123', 'Kepribadian', 'Kristen', 'Padang', '1975-12-13', 23, '4.jpg', '2000-10-14', 'D1', 'Karyawan', '', 'Ridwan', 'Guru Muda', 'IPA', 'Rahmat ', 'Yogyakarta', '1951-12-18', 'Kristen', '08656536373647', 'Petani', 'Jalan Kaliurang km 14.5', 'Sutinah', 'Solo', '1955-12-15', 'Islam', '0862532632635', 'Ibu Rumah Tangga', 'Jalan Kaliurang km 14.5'),
('13523134', 'Luthfi Anggy Kurniawan', '887878', 'Laki-Laki', 'III/A', 'jksdhaksjdas das das das', '123123', 'Kepribadian', 'Hindu', '', '2017-09-01', 55, '3.jpg', '2017-09-16', 'D3', 'Guru', NULL, 'Luthfi', '', '', '', '', '0000-00-00', 'Islam', '', '', '', '', '', '0000-00-00', 'Islam', '', '', ''),
('13523135', 'Dr. Aulia Ahmad Urfan, S.Pd., M.Pd.', '12345678', 'Laki-Laki', 'IV/A', 'Jl. Stadion, Maguwoharjo, Kec. Depok, Kabupaten Sleman, Daerah Istimewa Yogyakarta 55281, Indonesia', '087646374847', 'Sosial', 'Islam', '', '1976-10-05', 1, '2.jpg', '1998-10-05', 'S3', 'Guru', '', 'Urfan', 'Penata Muda', 'IPS', 'Maddog', 'Bikini Bottom', '1945-12-30', 'Islam', '090909878', 'Pelawak', 'djasdjasoijasodia', '', '', '0000-00-00', 'Islam', '', '', ''),
('1352313599', 'MoMon', '123123', 'Laki-Laki', 'II/A', 'kljijoij', '123123', 'Pedagogik', 'Hindu', '', '2017-09-08', 98, '3.jpg', '2017-09-09', 'S1', 'Guru', NULL, '12312', '', '', '', '', '0000-00-00', 'Islam', '', '', '', '', '', '0000-00-00', 'Islam', '', '', ''),
('13523136', 'Drs. Fikri Abdillah Fakhrudin', '726373664', 'Laki-Laki', 'II/A', 'Jalan Jalan', '09383938', 'Kepribadian', 'Islam', '', '2017-11-15', 33, '4.jpg', '2017-11-02', 'S1', 'Guru', '', 'Fikri', '', '', '', '', '0000-00-00', 'Islam', '', '', '', '', '', '0000-00-00', 'Islam', '', '', ''),
('13523138', 'Alfandya', '1238273', 'Laki-Laki', 'III/A', 'ajsdj asdasd ', '8996', 'Profesional', 'Islam', '', '2018-07-14', 223, '1.jpg', '2017-10-09', 'D3', 'Guru', '', 'alfan', 'Guru Madya', '', '', '', '0000-00-00', '', '', '', '', '', '', '0000-00-00', '', '', '', ''),
('13523139', 'Aulia Ahmad Urfan, S.Ag', '12839123', 'Perempuan', 'III/A', 'Jalan Khatulistiwa no.4', '12323', 'Sosial', 'Katholik', '', '2017-10-26', 123123, '22.jpg', '2018-02-04', 'D2', 'Karyawan', '', 'Brai', 'Penata Muda', 'IPS', '', '', '0000-00-00', 'Islam', '', '', '', '', '', '0000-00-00', 'Islam', '', '', ''),
('135231399', 'Cak Lontong', '123123123', 'Laki-Laki', 'IV/A', 'Jalan Kaliurang', '123132323', 'Kepribadian', 'Kristen', '', '2018-02-27', 87, '', '2018-01-27', 'S2', 'Guru', '', 'Lontong', '', '', '', '', '0000-00-00', 'Islam', '', '', '', '', '', '0000-00-00', 'Islam', '', '', ''),
('13523143', 'Novendra Yoga Saputra 555', '193281293', 'Laki-Laki', 'III/A', 'jasdkajda sdasd', '9829389', 'Kepribadian', 'Katholik', '', '2017-09-07', 34, 'potrait99.jpg', '2017-09-18', 'D2', 'Guru', NULL, 'Noven', '', '', '', '', '0000-00-00', 'Islam', '', '', '', '', '', '0000-00-00', 'Islam', '', '', ''),
('13523555', 'Iga Umari Hanami', '1738238123', 'Laki-Laki', 'II/A', 'jhjhjh', '123', 'Pedagogik', 'Katholik', '', '2017-09-14', 8, '1.jpg', '2017-09-14', 'D3', 'Guru', '', 'Igaga', 'Guru  Muda', '', '', '', '0000-00-00', 'Islam', '', '', '', '', '', '0000-00-00', 'Islam', '', '', ''),
('333444555', 'Mahmud Mudmud', '88773566475', 'Laki-Laki', 'IV/A', 'Jalan Kaliurang', '08656563636', 'Kepribadian', 'Budha', '', '2017-01-30', 33, NULL, '2017-10-30', 'S2', 'Karyawan', NULL, 'Mudmud', 'Guru Madya', 'IPA', '', '', '0000-00-00', 'Islam', '', '', '', '', '', '0000-00-00', 'Islam', '', '', ''),
('566656', 'Awas Ada Sule', '898989', 'Laki-Laki', 'II/A', 'sajdiasjdiasjdiasjdiajsdij', '098393489', 'Pedagogik', 'Islam', 'Sintang', '2018-01-04', 7665, NULL, '2018-01-04', 'S2', 'Guru', NULL, 'sule', 'Guru Muda', 'Penjaskes', '', '', '0000-00-00', 'Islam', '', '', '', '', '', '0000-00-00', 'Islam', '', '', ''),
('59966656', 'Awas Ada Sule 4', '898989', 'Laki-Laki', 'II/A', 'sajdiasjdiasjdiasjdiajsdij', '098393489', 'Pedagogik', 'Islam', 'Sintang', '2018-01-04', 7665, NULL, '2018-01-04', 'S2', 'Karyawan', NULL, 'sule', 'Guru Muda', 'Penjaskes', '', '', '0000-00-00', 'Islam', '', '', '', '', '', '0000-00-00', 'Islam', '', '', ''),
('676888', 'Rodeo Kopet', '9888988899', 'Laki-Laki', 'IV/A', 'dfsldfskdjfldkfjlsdf', '12312312', 'Pedagogik', 'Islam', '', '2018-01-30', 655, NULL, '2018-01-30', 'S3', 'Guru', NULL, 'Rodeo', 'Guru Muda', 'Matematika', '', '', '0000-00-00', 'Islam', '', '', '', '', '', '0000-00-00', 'Islam', '', '', ''),
('676888999', 'Rodeo Kopet Kopet Kopet', '9888988899', 'Laki-Laki', 'IV/A', 'dfsldfskdjfldkfjlsdf', '12312312', 'Pedagogik', 'Islam', '', '2018-01-30', 6559, NULL, '2018-01-30', 'S3', 'Guru', NULL, 'Rodeo', 'Guru Muda', 'IPA', '', '', '0000-00-00', 'Islam', '', '', '', '', '', '0000-00-00', 'Islam', '', '', ''),
('777888666', 'RIDHO HUHU', '28282828', 'Laki-Laki', 'III/C', 'djaisdjaisdjias', '99988899', 'Profesional', 'Islam', '', '2018-10-10', 987, NULL, '2018-10-10', 'S3', 'Karyawan', NULL, 'HHHH', 'Guru Muda', 'B.indonesia', '', '', '0000-00-00', 'Islam', '', '', '', '', '', '0000-00-00', 'Islam', '', '', ''),
('87283282', 'Asep Show', '12732312321', 'Perempuan', 'II/A', 'Jalan Kaliurang Km 10', '0862262626', 'Pedagogik', 'Budha', 'Yogya', '2017-12-06', 777, NULL, '2017-12-06', 'S2', 'Karyawan', NULL, 'TPI', 'Guru Muda', 'Bahasa Indonesia', 'Sahroni', 'Klaten', '2017-12-06', 'Budha', '087267262', 'Guru', 'Jalan Kaliurang km 11', 'Rosida', 'Kalimantan', '2017-12-06', 'Kristen', '089898889', 'Petani', 'Jalan MT Haryono'),
('87778', 'iasdjiasdji', '219381923', 'Perempuan', 'II/A', 'isdajisdjiasdjiasdjiasdjiasijd', '998989899', 'Profesional', 'Budha', '', '2018-10-10', 888, NULL, '2018-11-11', 'S2', 'Karyawan', NULL, 'sdjaisjd', 'Guru Muda', 'asjdjisjdiajs', '', '', '0000-00-00', 'Islam', '', '', '', '', '', '0000-00-00', 'Islam', '', '', ''),
('888777', 'Ridho AAAAAA', '888877', 'Perempuan', 'III/A', 'sdaskjdasdkasdjaksdkj', '0293012930', 'Pedagogik', 'Islam', '', '2018-01-10', 99999, NULL, '2018-01-10', 'S3', 'Karyawan', NULL, 'Ridho', 'Guru Madya', 'IPS', '', '', '0000-00-00', 'Islam', '', '', '', '', '', '0000-00-00', 'Islam', '', '', ''),
('88888', 'asdasda', '298189312', 'Laki-Laki', 'IV/A', '3112312', '1231231231', 'Kepribadian', 'Kristen', '', '2018-04-28', 11, '', '2018-01-30', 'D2', 'Karyawan', '', 'huhu', 'Guru Madya Muda', 'TIK', '', '', '0000-00-00', 'Islam', '', '', '', '', '', '0000-00-00', 'Islam', '', '', ''),
('898989', 'haha', '928913892381', 'Laki-Laki', 'II/A', 'asdsda', '1231231231', 'Kepribadian', 'Kristen', '', '2018-01-30', 9, '', '2018-01-30', 'D3', 'Guru', '', 'huhu', '', '', '', '', '0000-00-00', 'Islam', '', '', '', '', '', '0000-00-00', 'Islam', '', '', ''),
('989234', 'Amanullah Amany', '823773837', 'Laki-Laki', 'II/A', 'Jalan Lintas melawi', '83747474847', 'Sosial', 'Budha', '', '2017-09-20', 23, '2.jpg', '2017-10-21', 'D3', 'Guru', NULL, 'Aman', '', '', '', '', '0000-00-00', 'Islam', '', '', '', '', '', '0000-00-00', 'Islam', '', '', ''),
('9999922', 'Muttaqin Gilll', '9999878', 'Laki-Laki', 'III/A', 'ljuhkgiugk.', '898989', 'Pedagogik', 'Kristen', 'Sintang', '2017-12-01', 9667, 'potrait1.jpg', '2017-12-01', 'D3', 'Guru', '', 'taqin', 'Guru Muda', 'Matematika', 'Goro', 'kalimantan', '2017-12-28', 'Budha', '92831923891', 'Petani aja', 'asdas  asdas da s', 'ibu goro', 'Jawa', '2017-12-15', 'Hindu', '081237123', 'Aapa aja', 'asdasdasdasdasdasd');

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
(752, '2018-01-11', NULL, 'H', '', '9999922');

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
(1, 'SMP Negeri 8 Yogyakarta', 6, 'Minggu');

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
  `nama_file_kaldik` varchar(25) NOT NULL,
  `tanggal_mulai` date NOT NULL,
  `tanggal_selesai` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tahunajaran`
--

INSERT INTO `tahunajaran` (`id_tahun_ajaran`, `tahun_ajaran`, `semester`, `nama_file_kaldik`, `tanggal_mulai`, `tanggal_selesai`) VALUES
(1, '2016/2017', 'ganjil', 'Semester Ganjil 2016/2017', '2016-09-01', '2017-01-31'),
(2, '2016/2017', 'genap', 'Semester Genap 2016/2017', '2017-02-01', '2017-06-30'),
(3, '2017/2018', 'ganjil', 'Semester Ganjil 2017/2018', '2017-09-01', '2018-01-31'),
(4, '2017/2018', 'genap', 'Semester Genap 2017/2018', '2018-02-01', '2018-06-30'),
(5, '2018/2019', 'ganjil', 'Semester Ganjil 2018/2019', '2018-09-01', '2017-10-05'),
(6, '2018/2019', 'genap', 'Semester Ganjil 2018/2019', '2018-12-30', '2019-01-30');

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
(4, '2017-11-11', 'Hari Libur', '2017-11-15');

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
(6, 17, 8, 'Hari Kemerdekaan RI');

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
  ADD KEY `NIP` (`NIP`);

--
-- Indexes for table `jadwal_tambahan`
--
ALTER TABLE `jadwal_tambahan`
  ADD PRIMARY KEY (`id_jadwal_tambahan`),
  ADD KEY `NIP` (`NIP`),
  ADD KEY `id_kelas_tambahan` (`id_kelas_tambahan`);

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
  MODIFY `id_akun` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;
--
-- AUTO_INCREMENT for table `deskripsi_nilai`
--
ALTER TABLE `deskripsi_nilai`
  MODIFY `id_deskripsi` int(3) NOT NULL AUTO_INCREMENT;
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
  MODIFY `id_namamapel` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `nilai_siswa`
--
ALTER TABLE `nilai_siswa`
  MODIFY `id_nilai_siswa` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `presensi_pegawai`
--
ALTER TABLE `presensi_pegawai`
  MODIFY `Id_presensi` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=753;
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
  MODIFY `id_tahun_ajaran` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `tanggal_libur`
--
ALTER TABLE `tanggal_libur`
  MODIFY `id_tanggal_libur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `tanggal_libur_nasional`
--
ALTER TABLE `tanggal_libur_nasional`
  MODIFY `id_tanggal_libur_nasional` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `kelas_reguler`
--
ALTER TABLE `kelas_reguler`
  ADD CONSTRAINT `kelas_reguler_ibfk_1` FOREIGN KEY (`id_tahun_ajaran`) REFERENCES `tahunajaran` (`id_tahun_ajaran`);

--
-- Constraints for table `prioritas_khusus`
--
ALTER TABLE `prioritas_khusus`
  ADD CONSTRAINT `prioritas_khusus_ibfk_2` FOREIGN KEY (`NIP`) REFERENCES `pegawai` (`NIP`),
  ADD CONSTRAINT `prioritas_khusus_ibfk_3` FOREIGN KEY (`id_rentang_jam`) REFERENCES `hari_rentang` (`id_rentang_jam`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
