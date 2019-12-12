-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Sep 12, 2017 at 06:48 AM
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
(2, 'admin', '13523135', 2, NULL),
(3, 'pegawai', '13523069', 3, NULL),
(4, 'tatausaha', '13523138', 4, NULL),
(5, 'konseling', '13523143', 5, NULL),
(11, 'kesiswaan', '13523096', 6, NULL),
(12, 'kurikulum', '13523062', 7, NULL),
(13, 'siswa', NULL, 8, '12345');

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
  `jam_ke` int(2) NOT NULL,
  `jam_mulai` datetime NOT NULL,
  `jam_selesai` datetime NOT NULL,
  `hari` enum('Senin','Selasa','Rabu','Kamis','Jumat','Sabtu','Minggu') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `jabatan`
--

CREATE TABLE `jabatan` (
  `id_jabatan` int(5) NOT NULL,
  `nama_jabatan` varchar(15) NOT NULL,
  `url` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jabatan`
--

INSERT INTO `jabatan` (`id_jabatan`, `nama_jabatan`, `url`) VALUES
(1, 'Kepala Sekolah', 'kepsek'),
(2, 'Admin', 'superadmin'),
(3, 'Pegawai', 'pegawai'),
(4, 'Tata Usaha', 'tatausaha'),
(5, 'Konseling', 'konseling'),
(6, 'Kesiswaan', 'kesiswaaan'),
(7, 'Kurikulum', 'kurikulum'),
(8, 'Siswa', 'siswa');

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
  `jml_jam_mgjr` int(10) NOT NULL,
  `jam_satuan` int(10) NOT NULL,
  `jatah_minim_mgjr` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  `nama_kelas` enum('Kelas 7','Kelas 8','Kelas 9') NOT NULL,
  `kuota_kelas_reguler` int(5) NOT NULL,
  `jumlah_kelas_reguler` int(5) NOT NULL,
  `id_tahun_ajaran` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  `id_mapel` int(10) NOT NULL,
  `nama_mapel` varchar(50) NOT NULL,
  `kkm` int(3) NOT NULL,
  `jam_belajar` int(2) NOT NULL,
  `grade` enum('kelas 7','kelas 8','kelas 9') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mapel`
--

INSERT INTO `mapel` (`id_mapel`, `nama_mapel`, `kkm`, `jam_belajar`, `grade`) VALUES
(1, '5', 10, 4, ''),
(2, '2312', 1, 33, ''),
(3, '2', 3, 4, ''),
(4, '1', 3, 2, '');

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
  `TTL` date NOT NULL,
  `kode_guru` int(3) DEFAULT NULL,
  `foto` text,
  `TMT_capeg` date NOT NULL,
  `Pendidikan` enum('D1','D2','D3','S1','S2','S3','','','','') NOT NULL,
  `Status` enum('Guru','Pegawai') NOT NULL,
  `Status_pensiun` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pegawai`
--

INSERT INTO `pegawai` (`NIP`, `Nama`, `No_SK`, `Jenis_kelamin`, `Golongan`, `alamat`, `kontak`, `kompetensi`, `Agama`, `TTL`, `kode_guru`, `foto`, `TMT_capeg`, `Pendidikan`, `Status`, `Status_pensiun`) VALUES
('123', 'wrewrw', '1231', 'Laki-Laki', 'tt', 'sadsdasd', '123123', 'Pedagogik', 'Katholik', '2017-09-07', NULL, '', '2017-09-15', 'D3', 'Pegawai', NULL),
('1234546', 'Kurban', '123123', 'Laki-Laki', 'II', '', '', 'Pedagogik', '', '2017-09-02', NULL, NULL, '0000-00-00', '', '', NULL),
('12345678', 'Udah lah', '21312', 'Laki-Laki', 'III/A', 'asjdas', '0932', 'Sosial', 'Islam', '2017-09-01', NULL, NULL, '2017-09-30', 'D2', 'Guru', NULL),
('13523062', 'Nadya Indi Rahesti', '12312123', 'Perempuan', 'II/A', 'adsda ', 'II/A', 'Profesional', 'Katholik', '2017-09-16', 3, '1.jpg', '2017-09-15', 'D2', 'Guru', 'Pensiun'),
('13523069', 'Bayu Wisnu Saputra', '12839123817', 'Laki-Laki', 'II/B', 'asdjasd', '21931293', 'Sosial', 'Katholik', '2017-09-07', 7, '3.jpg', '2017-09-08', 'D3', 'Guru', NULL),
('13523096', 'Mia Puspa Elizabeth 99', '923812371748343', 'Perempuan', 'III/B', 'Jl. Wates, Argomulyo, Sedayu, Bantul, Daerah Istimewa Yogyakarta 55753, Indonesia', 'III/B', 'Pedagogik', 'Hindu', '2017-09-13', 4, '2.jpg', '2017-09-16', 'D2', 'Guru', NULL),
('13523111', 'Anggraeni Dias Saputri', '6276312371', 'Perempuan', 'IV/B', 'Jl. Bibis Raya, Tamantirto, Kasihan, Bantul, Daerah Istimewa Yogyakarta 55183, Indonesia', '0897464736', 'Kepribadian', 'Kristen', '1978-09-07', 5, '1.jpg', '2017-09-08', '', 'Guru', NULL),
('13523135', 'Ridho Akbar Dermawan', '12345678', 'Laki-Laki', 'IV/A', 'Jl. Stadion, Maguwoharjo, Kec. Depok, Kabupaten Sleman, Daerah Istimewa Yogyakarta 55281, Indonesia', '087646374847', 'Sosial', 'Islam', '1976-10-05', 1, '2.jpg', '1998-10-05', 'S3', 'Guru', NULL),
('13523138', 'Alfandya', '1238273', 'Laki-Laki', 'III/A', 'ajsdj asdasd ', '899', 'Profesional', 'Kristen', '2017-09-14', NULL, NULL, '2017-09-09', 'D3', 'Guru', NULL),
('13523143', 'Novendra Yoga Saputra 555', '43546364343', 'Laki-Laki', 'III/C', 'Jl. Rotowijayan Blok No. 1, Panembahan, Kraton, Kota Yogyakarta, Daerah Istimewa Yogyakarta, Indonesia', '087646374899', 'Kepribadian', 'Katholik', '1970-01-01', 2, '3.jpg', '1970-01-01', 'D1', 'Pegawai', NULL),
('231', 'werwe', '213', 'Laki-Laki', 'III/A', 'asdasd', '123', 'Pedagogik', 'Budha', '0000-00-00', NULL, '', '0000-00-00', 'D1', 'Guru', NULL),
('61273612', 'daskjdasd asdsad', '1273123', 'Laki-Laki', 'III/A', 'djaskdasjda sdasdas', '988484', 'Profesional', 'Islam', '2017-09-20', NULL, NULL, '2017-09-16', 'S1', 'Pegawai', NULL),
('9797', 'namanya siapa', '231', 'Perempuan', '123', 'asldjADJASD', '12323', 'Kepribadian', 'Budha', '2017-09-01', NULL, NULL, '2017-09-15', '', 'Pegawai', NULL);

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
  `Waktu_presensi` time NOT NULL,
  `Rangkuman_presensi` varchar(25) NOT NULL,
  `NIP` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  `id_rentang_jam` int(10) NOT NULL,
  `NIP` varchar(20) NOT NULL,
  `id_prkh` int(10) NOT NULL,
  `jenis_prkh` enum('prioritas','khusus') NOT NULL,
  `jam_mulai` time NOT NULL,
  `jam_selesai` time NOT NULL,
  `kode_mapel` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
(1, 'SMA Negeri 2 Yogyakarta', 3, 'Minggu');

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
('12345', 123, NULL, 'Bagio', 'Laki-Laki', 'Batam', '2000-08-08', 'Kristen', 'Autis', 'asjdhasjdha', 1, 3, 'Koplok', 'kosong', 'sasa', 123123, 'Dengan Orang Tua', 'Dalam Daerah', 'Mobil/ Bus Antar Jemput', 783748347, 'akahsdaskdja', 'min', 20, 'Ya', 'Ya', 123121, 23123, 12312, 'Ya', 123123, 99, 99, 10, 10, 'Kandung', 'koma', 'Ya', 'asdasda', 'Yatim', 'dasdasd', 'sdasdasd', 'Lulus', 'sdasd', 198, 100, 'bola', NULL, 1);

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
(1, '2016/2017', 'ganjil', 'Semester I 2016/2017', '2016-09-01', '2017-01-31'),
(2, '2016/2017', 'genap', 'Semester II 2016/2017', '2017-02-01', '2017-06-30'),
(3, '2017/2018', 'ganjil', 'Semester I 2017/2018', '2017-09-01', '2018-01-31'),
(4, '2017/2018', 'genap', 'Semester II 2017/2018', '2018-02-01', '2018-06-30');

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
  ADD PRIMARY KEY (`id_rentang_jam`);

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
  ADD KEY `NIP` (`NIP`);

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
  ADD PRIMARY KEY (`id_mapel`);

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
  ADD KEY `NIP` (`NIP`);

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
  MODIFY `id_akun` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `deskripsi_nilai`
--
ALTER TABLE `deskripsi_nilai`
  MODIFY `id_deskripsi` int(3) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `jabatan`
--
ALTER TABLE `jabatan`
  MODIFY `id_jabatan` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
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
  MODIFY `id_mapel` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `nilai_siswa`
--
ALTER TABLE `nilai_siswa`
  MODIFY `id_nilai_siswa` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `presensi_siswa`
--
ALTER TABLE `presensi_siswa`
  MODIFY `id_presensi` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `setting`
--
ALTER TABLE `setting`
  MODIFY `id_setting` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tahunajaran`
--
ALTER TABLE `tahunajaran`
  MODIFY `id_tahun_ajaran` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
