<!-- Content Wrapper. Contains page content -->
<link rel="stylesheet" href="<?php echo base_url(); ?>assets/penjadwalam/chosen/chosen.css">
<div class="content-wrapper">
  <!-- Content Header (Page header) -->
  <section class="content-header">
    <h1>
      <center style="color:navy;">Jadwal Mata Pelajaran<br></center>
    </h1>
    <ol class="breadcrumb">
      <li><a href="dashboard.php">Dashboard</a></li>
    </ol>
  </section>

  <section class="content">
    <div class="row">
      <div class="col-md-12">
        <div class="nav-tabs-custom">
          <ul class="nav nav-tabs">
            <?php if($this->session->userdata('jabatan') != 'Guru') : ?>
            <li  class="<?php if($this->session->userdata('jabatan') != 'Guru') : ?>active<?php endif ?>"><a href="#pengaturan" data-toggle="tab">Pengaturan</a></li>
            <li><a href="#kelolajadwalmapel" data-toggle="tab">Kelola Jadwal Mata Pelajaran</a></li>
            <?php endif ?>
            <li class="<?php if($this->session->userdata('jabatan') == 'Guru') : ?>active<?php endif ?>"><a href="#jadwalmapel" data-toggle="tab">Jadwal Mata Pelajaran</a></li>
          </ul>
          <div class="tab-content">
            <?php if($this->session->userdata('jabatan') != 'Guru') : ?>
            <div class="<?php if($this->session->userdata('jabatan') != 'Guru') : ?>active<?php endif ?> tab-pane" id="pengaturan">
              <div class="box" style="border-top: 0;">
                <div class="box-body">
                  <div style="margin-top: 1em;">
                    <blockquote>
                      <ul style="padding: 0em 1em;font-size: 0.8em;color: #f44336;">
                        <li>Klik Pada Tombol Kelola Jadwal Priortias Jika Perlu.</li>
                        <li>Jadwal Prioritas adalah Mata Pelajaran yang ingin didahulukan atau diprioritaskan.</li>
                        <li>Pilih Mata Pelajaran, bisa lebih dari satu.</li>
                      </ul>
                    </blockquote>

                    <div class="text-center mg-top-30">
                      <button class="btn btn-info button-form big-button" data-toggle="modal" data-target="#review4" id="trigger_jadwal_prioritas">Kelola Jadwal Prioritas</button>
                    </div>
                  </div>

                  <div style="margin-top: 1em;margin-bottom: 2.5em;">
                    <blockquote>
                      <ul style="padding: 0em 1em;font-size: 0.8em;color: #f44336;">
                        <li>Klik Pada Tombol Kelola Jadwal Priortias Jika Perlu.</li>
                        <li>Jadwal Khusus yaitu guru yang tidak bisa mengajar atau mempunyai aktifitas rutin lain sehingga tidak bisa mengajar.</li>
                        <li>Pilih Mata Pelajaran, bisa lebih dari satu.</li>
                      </ul>
                    </blockquote>

                    <div class="text-center mg-top-30">
                      <button class="btn btn-info button-form big-button" data-toggle="modal" data-target="#review4" id="trigger_jadwal_khusus">Kelola Jadwal Khusus</button>
                    </div>
                  </div>
                </div>
              </div> 
            </div>
            <?php endif ?>

            <div class="tab-pane <?php if($this->session->userdata('jabatan') == 'Guru') : ?>active<?php endif ?>" id="jadwalmapel">
              <div class="box">
                <div class="box-header">
                  <div class="row">
                    <div class="col-md-6">
                      <div class="form-group">
                        <label for="jenjangmapel">Jenjang</label>
                        <select class="form-control" id="jenjangjadwalmapel2" onchange="document.location = '<?php echo site_url('kurikulum/jadwalmapel'); ?>/' + document.getElementById('jenjangjadwalmapel2').value;" name="jenjangmapel">
                          <option value="7" <?php if ($jenjang == '7') { echo " selected"; } ?>> KELAS 7</option>
                          <option value="8" <?php if ($jenjang == '8') { echo " selected"; } ?>> KELAS 8</option>
                          <option value="9" <?php if ($jenjang == '9') { echo " selected"; } ?>> KELAS 9</option>
                        </select>
                      </div>   
                    </div> 
                  </div>
                  <div class="row">
                    <div class="col-md-6">
                      <div class="form-group">
                        <label for="harimapel">Hari</label>
                        <select class="form-control" id="harimapel" name="harimapel">
                          <option value="">Semua Hari</option>
                          <option value="senin" selected>Senin</option>
                          <option value="selasa">Selasa</option>
                          <option value="rabu">Rabu</option>
                          <option value="kamis">Kamis</option>
                          <option value="jumat">Jum'at</option>
                          <option value="sabtu">Sabtu</option>
                          <option value="minggu">Minggu</option>
                        </select>
                      </div>   
                    </div> 
                  </div>
                </div>
                <div class="box-body">
                  <table class="table table-bordered table-striped tabelmapel tampilkan tampilkan-table" id="tampil-senin">
                    <thead>
                      <tr class="barishari">
                        <th class="tengah" rowspan="2">Jam ke</th>
                        <th class="tengah" rowspan="2">Waktu</th>
                        <th colspan="<?php echo count($tabel_kelasreguler); ?>">Senin</th>
                      </tr>
                      <tr class="bariskelas">
                        <?php
                        foreach ($tabel_kelasreguler as $key => $row_kelasreguler) {
                          ?>
                          <th><?php echo $row_kelasreguler->nama_kelas; ?></th>
                          <?php
                        }
                        ?>
                      </tr>
                    </thead>
                    <tbody>
                      <?php 
                      for($i=1;$i<=12;$i++)  {
                        ?>
                        <tr>
                          <td class="fit"><?php echo $i; ?></td>
                          <th><?php echo @substr($hari_rentang['Senin'][$i]->jam_mulai,0,5)."-".@substr($hari_rentang['Senin'][$i]->jam_selesai,0,5); ?></th>
                          <?php
                          foreach ($tabel_kelasreguler as $key => $row_kelasreguler) {
                            ?>
                            <?php
                            $sudah = false;
                            foreach (@$tabel_jadwalprioritas_senin[$i] as $rowjadwalprioritas) {
                              $ada = false;
                              foreach (@$tabel_jadwalkhusus_senin[$i] as $rowjadwalkhusus) {
                                if ($rowjadwalprioritas->NIP == $rowjadwalkhusus->NIP) {
                                  $ada = true;
                                }
                              }
                              if ($ada == false) {
                                if ((@$tabel_jadwalmapel_senin[$row_kelasreguler->id_kelas_reguler][$i][0]->NIP == $rowjadwalprioritas->NIP) && (@$tabel_jadwalmapel_senin[$row_kelasreguler->id_kelas_reguler][$i][0]->id_namamapel == $rowjadwalprioritas->id_namamapel)) { echo '<th bgcolor="'.@$rowjadwalprioritas->warna.'">'.$rowjadwalprioritas->Nama."(".$rowjadwalprioritas->nama_panggilan.")".'</th>'; $sudah = true;
                              }
                            }
                          }
                          ?>
                          <?php 
                          foreach (@$tabel_jammengajar as $rowjammengajar) {
                            $ada = false;
                            foreach (@$tabel_jadwalprioritas_senin[$i] as $rowjadwalprioritas) {
                              if (($rowjammengajar->NIP == $rowjadwalprioritas->NIP) && ($rowjammengajar->id_namamapel == $rowjadwalprioritas->id_namamapel)) {
                                $ada = true;
                              }
                            }
                            foreach (@$tabel_jadwalkhusus_senin[$i] as $rowjadwalkhusus) {
                              if ($rowjammengajar->NIP == $rowjadwalkhusus->NIP) {
                                $ada = true;
                              }
                            }
                            if ($ada == false) {
                              if ((@$tabel_jadwalmapel_senin[$row_kelasreguler->id_kelas_reguler][$i][0]->NIP == $rowjammengajar->NIP) && (@$tabel_jadwalmapel_senin[$row_kelasreguler->id_kelas_reguler][$i][0]->id_namamapel == $rowjammengajar->id_namamapel)) { echo '<th bgcolor="'.@$rowjammengajar->warna.'">'.$rowjammengajar->nama_mapel."(".$rowjammengajar->nama_panggilan.")".'</th>';  $sudah = true;
                            }
                          }
                        }

                        if ($sudah == false) {
                         echo '<th bgcolor="#ffffff">&nbsp;</th>';
                       }
                       ?>

                       <?php
                     }
                     ?>
                   </tr>
                   <?php
                 }
                 ?>                      
               </tbody>

             </table>

             <table class="table table-bordered table-striped tabelmapel tampilkan" id="tampil-selasa">
              <thead>
                <tr class="barishari">
                  <th class="tengah" rowspan="2">Jam ke</th>
                  <th class="tengah" rowspan="2">Waktu</th>
                  <th colspan="<?php echo count($tabel_kelasreguler); ?>">Selasa</th>
                </tr>
                <tr class="bariskelas">
                  <?php
                  foreach ($tabel_kelasreguler as $key => $row_kelasreguler) {
                    ?>
                    <th><?php echo $row_kelasreguler->nama_kelas; ?></th>
                    <?php
                  }
                  ?>
                </tr>
              </thead>
              <tbody>
                <?php 
                for($i=0;$i<=12;$i++)  {
                  ?>
                  <tr>
                    <td class="fit"><?php echo $i; ?></td>
                    <th><?php echo @substr($hari_rentang['Selasa'][$i]->jam_mulai,0,5)."-".@substr($hari_rentang['Selasa'][$i]->jam_selesai,0,5); ?></th>
                    <?php
                    foreach ($tabel_kelasreguler as $key => $row_kelasreguler) {
                      ?>
                      <!-- <th class="ungu" bgcolor="#00FF00"> --><?php //echo @$tabel_jadwalmapel_selasa[$row_kelasreguler->id_kelas_reguler][$i][0]->NIP." ".@$tabel_jadwalmapel_selasa[$row_kelasreguler->id_kelas_reguler][$i][0]->id_namamapel; ?>

                        <?php
                        $sudah = false;
                        foreach (@$tabel_jadwalprioritas_selasa[$i] as $rowjadwalprioritas) {
                          $ada = false;
                          foreach (@$tabel_jadwalkhusus_selasa[$i] as $rowjadwalkhusus) {
                            if ($rowjadwalprioritas->NIP == $rowjadwalkhusus->NIP) {
                              $ada = true;
                            }
                          }
                          if ($ada == false) {
                            if ((@$tabel_jadwalmapel_selasa[$row_kelasreguler->id_kelas_reguler][$i][0]->NIP == $rowjadwalprioritas->NIP) && (@$tabel_jadwalmapel_selasa[$row_kelasreguler->id_kelas_reguler][$i][0]->id_namamapel == $rowjadwalprioritas->id_namamapel)) { echo '<th bgcolor="'.@$rowjadwalprioritas->warna.'">'.$rowjadwalprioritas->Nama."(".$rowjadwalprioritas->nama_panggilan.")".'</th>'; $sudah = true;
                          }

                        }
                      }
                      ?>
                      <?php 
                      foreach (@$tabel_jammengajar as $rowjammengajar) {
                        $ada = false;
                        foreach (@$tabel_jadwalprioritas_selasa[$i] as $rowjadwalprioritas) {
                          if (($rowjammengajar->NIP == $rowjadwalprioritas->NIP) && ($rowjammengajar->id_namamapel == $rowjadwalprioritas->id_namamapel)) {
                            $ada = true;
                          }
                        }
                        foreach (@$tabel_jadwalkhusus_selasa[$i] as $rowjadwalkhusus) {
                          if ($rowjammengajar->NIP == $rowjadwalkhusus->NIP) {
                            $ada = true;
                          }
                        }
                        if ($ada == false) {
                         if ((@$tabel_jadwalmapel_selasa[$row_kelasreguler->id_kelas_reguler][$i][0]->NIP == $rowjammengajar->NIP) && (@$tabel_jadwalmapel_selasa[$row_kelasreguler->id_kelas_reguler][$i][0]->id_namamapel == $rowjammengajar->id_namamapel)) { echo '<th bgcolor="'.@$rowjammengajar->warna.'">'.$rowjammengajar->nama_mapel."(".$rowjammengajar->nama_panggilan.")".'</th>'; $sudah = true;
                       }
                     }
                   }

                   if ($sudah == false) {
                    echo '<th bgcolor="#ffffff">&nbsp;</th>';
                  }
                  ?>
                  <!--  </th> -->
                  <?php
                }
                ?>
              </tr>
              <?php
            }
            ?>                      
          </tbody>

        </table>

        <table class="table table-bordered table-striped tabelmapel tampilkan" id="tampil-rabu">
          <thead>
            <tr class="barishari">
              <th class="tengah" rowspan="2">Jam ke</th>
              <th class="tengah" rowspan="2">Waktu</th>
              <th colspan="<?php echo count($tabel_kelasreguler); ?>">Rabu</th>
            </tr>
            <tr class="bariskelas">
              <?php
              foreach ($tabel_kelasreguler as $key => $row_kelasreguler) {
                ?>
                <th><?php echo $row_kelasreguler->nama_kelas; ?></th>
                <?php
              }
              ?>
            </tr>
          </thead>
          <tbody>
            <?php 
            for($i=0;$i<=12;$i++)  {
              ?>
              <tr>
                <td class="fit"><?php echo $i; ?></td>
                <th><?php echo @substr($hari_rentang['Rabu'][$i]->jam_mulai,0,5)."-".@substr($hari_rentang['Rabu'][$i]->jam_selesai,0,5); ?></th>
                <?php
                foreach ($tabel_kelasreguler as $key => $row_kelasreguler) {
                  ?>
                  <!-- <th class="ungu" bgcolor="#00FF00"> --><?php //echo @$tabel_jadwalmapel_rabu[$row_kelasreguler->id_kelas_reguler][$i][0]->NIP." ".@$tabel_jadwalmapel_rabu[$row_kelasreguler->id_kelas_reguler][$i][0]->id_namamapel; ?><!-- </th> -->

                  <?php
                  $sudah = false;
                  foreach (@$tabel_jadwalprioritas_rabu[$i] as $rowjadwalprioritas) {
                    $ada = false;
                    foreach (@$tabel_jadwalkhusus_rabu[$i] as $rowjadwalkhusus) {
                      if ($rowjadwalprioritas->NIP == $rowjadwalkhusus->NIP) {
                        $ada = true;
                      }
                    }
                    if ($ada == false) {
                      if ((@$tabel_jadwalmapel_rabu[$row_kelasreguler->id_kelas_reguler][$i][0]->NIP == $rowjadwalprioritas->NIP) && (@$tabel_jadwalmapel_rabu[$row_kelasreguler->id_kelas_reguler][$i][0]->id_namamapel == $rowjadwalprioritas->id_namamapel)) { echo '<th bgcolor="'.@$rowjadwalprioritas->warna.'">'.$rowjadwalprioritas->Nama."(".$rowjadwalprioritas->nama_panggilan.")".'</th>'; $sudah = true;
                    }
                  }
                }
                ?>
                <?php 
                foreach (@$tabel_jammengajar as $rowjammengajar) {
                  $ada = false;
                  foreach (@$tabel_jadwalprioritas_rabu[$i] as $rowjadwalprioritas) {
                    if (($rowjammengajar->NIP == $rowjadwalprioritas->NIP) && ($rowjammengajar->id_namamapel == $rowjadwalprioritas->id_namamapel)) {
                      $ada = true;
                    }
                  }
                  foreach (@$tabel_jadwalkhusus_rabu[$i] as $rowjadwalkhusus) {
                    if ($rowjammengajar->NIP == $rowjadwalkhusus->NIP) {
                      $ada = true;
                    }
                  }
                  if ($ada == false) {
                    if ((@$tabel_jadwalmapel_rabu[$row_kelasreguler->id_kelas_reguler][$i][0]->NIP == $rowjammengajar->NIP) && (@$tabel_jadwalmapel_rabu[$row_kelasreguler->id_kelas_reguler][$i][0]->id_namamapel == $rowjammengajar->id_namamapel)) { echo '<th bgcolor="'.@$rowjammengajar->warna.'">'.$rowjammengajar->nama_mapel."(".$rowjammengajar->nama_panggilan.")".'</th>'; $sudah = true;
                  }
                }
              }

              if ($sudah == false) {
                echo '<th bgcolor="#ffffff">&nbsp;</th>';
              }
              ?>
              <?php
            }
            ?>
          </tr>
          <?php
        }
        ?>                      
      </tbody>

    </table>

    <table class="table table-bordered table-striped tabelmapel tampilkan" id="tampil-kamis">
      <thead>
        <tr class="barishari">
          <th class="tengah" rowspan="2">Jam ke</th>
          <th class="tengah" rowspan="2">Waktu</th>
          <th colspan="<?php echo count($tabel_kelasreguler); ?>">Kamis</th>
        </tr>
        <tr class="bariskelas">
          <?php
          foreach ($tabel_kelasreguler as $key => $row_kelasreguler) {
            ?>
            <th><?php echo $row_kelasreguler->nama_kelas; ?></th>
            <?php
          }
          ?>
        </tr>
      </thead>
      <tbody>
        <?php 
        for($i=0;$i<=12;$i++)  {
          ?>
          <tr>
            <td class="fit"><?php echo $i; ?></td>
            <th><?php echo @substr($hari_rentang['Kamis'][$i]->jam_mulai,0,5)."-".@substr($hari_rentang['Kamis'][$i]->jam_selesai,0,5); ?></th>
            <?php
            foreach ($tabel_kelasreguler as $key => $row_kelasreguler) {
              ?>
              <!-- <th class="ungu" bgcolor="#00FF00"> --><?php //echo @$tabel_jadwalmapel_kamis[$row_kelasreguler->id_kelas_reguler][$i][0]->NIP." ".@$tabel_jadwalmapel_kamis[$row_kelasreguler->id_kelas_reguler][$i][0]->id_namamapel; ?><!-- </th> -->

              <?php
              $sudah = false;
              foreach (@$tabel_jadwalprioritas_kamis[$i] as $rowjadwalprioritas) {
                $ada = false;
                foreach (@$tabel_jadwalkhusus_kamis[$i] as $rowjadwalkhusus) {
                  if ($rowjadwalprioritas->NIP == $rowjadwalkhusus->NIP) {
                    $ada = true;
                  }
                }
                if ($ada == false) {
                  if ((@$tabel_jadwalmapel_kamis[$row_kelasreguler->id_kelas_reguler][$i][0]->NIP == $rowjadwalprioritas->NIP) && (@$tabel_jadwalmapel_kamis[$row_kelasreguler->id_kelas_reguler][$i][0]->id_namamapel == $rowjadwalprioritas->id_namamapel)) { echo '<th bgcolor="'.@$rowjadwalprioritas->warna.'">'.$rowjadwalprioritas->Nama."(".$rowjadwalprioritas->nama_panggilan.")".'</th>';  $sudah = true;
                }
              }
            }
            ?>
            <?php 
            foreach (@$tabel_jammengajar as $rowjammengajar) {
              $ada = false;
              foreach (@$tabel_jadwalprioritas_kamis[$i] as $rowjadwalprioritas) {
                if (($rowjammengajar->NIP == $rowjadwalprioritas->NIP) && ($rowjammengajar->id_namamapel == $rowjadwalprioritas->id_namamapel)) {
                  $ada = true;
                }
              }
              foreach (@$tabel_jadwalkhusus_kamis[$i] as $rowjadwalkhusus) {
                if ($rowjammengajar->NIP == $rowjadwalkhusus->NIP) {
                  $ada = true;
                }
              }
              if ($ada == false) {
                if ((@$tabel_jadwalmapel_kamis[$row_kelasreguler->id_kelas_reguler][$i][0]->NIP == $rowjammengajar->NIP) && (@$tabel_jadwalmapel_kamis[$row_kelasreguler->id_kelas_reguler][$i][0]->id_namamapel == $rowjammengajar->id_namamapel)) { echo '<th bgcolor="'.@$rowjammengajar->warna.'">'.$rowjammengajar->nama_mapel."(".$rowjammengajar->nama_panggilan.")".'</th>';  $sudah = true;
              }
            }
          }

          if ($sudah == false) {
            echo '<th bgcolor="#ffffff">&nbsp;</th>';
          }
          ?>
          <?php
        }
        ?>
      </tr>
      <?php
    }
    ?>                      
  </tbody>

</table>

<table class="table table-bordered table-striped tabelmapel tampilkan" id="tampil-jumat">
  <thead>
    <tr class="barishari">
      <th class="tengah" rowspan="2">Jam ke</th>
      <th class="tengah" rowspan="2">Waktu</th>
      <th colspan="<?php echo count($tabel_kelasreguler); ?>">Jumat</th>
    </tr>
    <tr class="bariskelas">
      <?php
      foreach ($tabel_kelasreguler as $key => $row_kelasreguler) {
        ?>
        <th><?php echo $row_kelasreguler->nama_kelas; ?></th>
        <?php
      }
      ?>
    </tr>
  </thead>
  <tbody>
    <?php 
    for($i=0;$i<=12;$i++)  {
      ?>
      <tr>
        <td class="fit"><?php echo $i; ?></td>
        <th><?php echo @substr($hari_rentang['Jumat'][$i]->jam_mulai,0,5)."-".@substr($hari_rentang['Jumat'][$i]->jam_selesai,0,5); ?></th>
        <?php
        foreach ($tabel_kelasreguler as $key => $row_kelasreguler) {
          ?>
          <!--  <th class="ungu" bgcolor="#00FF00"> --><?php //echo @$tabel_jadwalmapel_jumat[$row_kelasreguler->id_kelas_reguler][$i][0]->NIP." ".@$tabel_jadwalmapel_jumat[$row_kelasreguler->id_kelas_reguler][$i][0]->id_namamapel; ?><!-- </th> -->

          <?php
          $sudah = false;
          foreach (@$tabel_jadwalprioritas_jumat[$i] as $rowjadwalprioritas) {
            $ada = false;
            foreach (@$tabel_jadwalkhusus_jumat[$i] as $rowjadwalkhusus) {
              if ($rowjadwalprioritas->NIP == $rowjadwalkhusus->NIP) {
                $ada = true;
              }
            }
            if ($ada == false) {
              if ((@$tabel_jadwalmapel_jumat[$row_kelasreguler->id_kelas_reguler][$i][0]->NIP == $rowjadwalprioritas->NIP) && (@$tabel_jadwalmapel_jumat[$row_kelasreguler->id_kelas_reguler][$i][0]->id_namamapel == $rowjadwalprioritas->id_namamapel)) { echo '<th bgcolor="'.@$rowjadwalprioritas->warna.'">'.$rowjadwalprioritas->Nama."(".$rowjadwalprioritas->nama_panggilan.")".'</th>';  $sudah = true;
            }
          }
        }
        ?>
        <?php 
        foreach (@$tabel_jammengajar as $rowjammengajar) {
          $ada = false;
          foreach (@$tabel_jadwalprioritas_jumat[$i] as $rowjadwalprioritas) {
            if (($rowjammengajar->NIP == $rowjadwalprioritas->NIP) && ($rowjammengajar->id_namamapel == $rowjadwalprioritas->id_namamapel)) {
              $ada = true;
            }
          }
          foreach (@$tabel_jadwalkhusus_jumat[$i] as $rowjadwalkhusus) {
            if ($rowjammengajar->NIP == $rowjadwalkhusus->NIP) {
              $ada = true;
            }
          }
          if ($ada == false) {
            if ((@$tabel_jadwalmapel_jumat[$row_kelasreguler->id_kelas_reguler][$i][0]->NIP == $rowjammengajar->NIP) && (@$tabel_jadwalmapel_jumat[$row_kelasreguler->id_kelas_reguler][$i][0]->id_namamapel == $rowjammengajar->id_namamapel)) { echo '<th bgcolor="'.@$rowjammengajar->warna.'">'.$rowjammengajar->nama_mapel."(".$rowjammengajar->nama_panggilan.")".'</th>';  $sudah = true;
          }
        }
      }

      if ($sudah == false) {
        echo '<th bgcolor="#ffffff">&nbsp;</th>';
      }
      ?>
      <?php
    }
    ?>
  </tr>
  <?php
}
?>                      
</tbody>

</table>
<table class="table table-bordered table-striped tabelmapel tampilkan" id="tampil-sabtu">
  <thead>
    <tr class="barishari">
      <th class="tengah" rowspan="2">Jam ke</th>
      <th class="tengah" rowspan="2">Waktu</th>
      <th colspan="<?php echo count($tabel_kelasreguler); ?>">Sabtu</th>
    </tr>
    <tr class="bariskelas">
      <?php
      foreach ($tabel_kelasreguler as $key => $row_kelasreguler) {
        ?>
        <th><?php echo $row_kelasreguler->nama_kelas; ?></th>
        <?php
      }
      ?>
    </tr>
  </thead>
  <tbody>
    <?php 
    for($i=0;$i<=12;$i++)  {
      ?>
      <tr>
        <td class="fit"><?php echo $i; ?></td>
        <th><?php echo @substr($hari_rentang['Sabtu'][$i]->jam_mulai,0,5)."-".@substr($hari_rentang['Sabtu'][$i]->jam_selesai,0,5); ?></th>
        <?php
        foreach ($tabel_kelasreguler as $key => $row_kelasreguler) {
          ?>
          <!-- <th class="ungu" bgcolor="#00FF00"> --><?php //echo @$tabel_jadwalmapel_sabtu[$row_kelasreguler->id_kelas_reguler][$i][0]->NIP." ".@$tabel_jadwalmapel_sabtu[$row_kelasreguler->id_kelas_reguler][$i][0]->id_namamapel; ?><!-- </th> -->

          <?php
          $sudah = false;
          foreach (@$tabel_jadwalprioritas_sabtu[$i] as $rowjadwalprioritas) {
            $ada = false;
            foreach (@$tabel_jadwalkhusus_sabtu[$i] as $rowjadwalkhusus) {
              if ($rowjadwalprioritas->NIP == $rowjadwalkhusus->NIP) {
                $ada = true;
              }
            }
            if ($ada == false) {
              if ((@$tabel_jadwalmapel_sabtu[$row_kelasreguler->id_kelas_reguler][$i][0]->NIP == $rowjadwalprioritas->NIP) && (@$tabel_jadwalmapel_sabtu[$row_kelasreguler->id_kelas_reguler][$i][0]->id_namamapel == $rowjadwalprioritas->id_namamapel)) { echo '<th bgcolor="'.@$rowjadwalprioritas->warna.'">'.$rowjadwalprioritas->Nama."(".$rowjadwalprioritas->nama_panggilan.")".'</th>'; $sudah = true;
            }
          }
        }
        ?>
        <?php 
        foreach (@$tabel_jammengajar as $rowjammengajar) {
          $ada = false;
          foreach (@$tabel_jadwalprioritas_sabtu[$i] as $rowjadwalprioritas) {
            if (($rowjammengajar->NIP == $rowjadwalprioritas->NIP) && ($rowjammengajar->id_namamapel == $rowjadwalprioritas->id_namamapel)) {
              $ada = true;
            }
          }
          foreach (@$tabel_jadwalkhusus_sabtu[$i] as $rowjadwalkhusus) {
            if ($rowjammengajar->NIP == $rowjadwalkhusus->NIP) {
              $ada = true;
            }
          }
          if ($ada == false) {
            if ((@$tabel_jadwalmapel_sabtu[$row_kelasreguler->id_kelas_reguler][$i][0]->NIP == $rowjammengajar->NIP) && (@$tabel_jadwalmapel_sabtu[$row_kelasreguler->id_kelas_reguler][$i][0]->id_namamapel == $rowjammengajar->id_namamapel)) { echo '<th bgcolor="'.@$rowjammengajar->warna.'">'.$rowjammengajar->nama_mapel."(".$rowjammengajar->nama_panggilan.")".'</th>'; $sudah = true;
          }
        }
      }

      if ($sudah == false) {
        echo '<th bgcolor="#ffffff">&nbsp;</th>';
      }
      ?>
      <?php
    }
    ?>
  </tr>
  <?php
}
?>                      
</tbody>

</table>

<table class="table table-bordered table-striped tabelmapel tampilkan" id="tampil-minggu">
  <thead>
    <tr class="barishari">
      <th class="tengah" rowspan="2">Jam ke</th>
      <th class="tengah" rowspan="2">Waktu</th>
      <th colspan="<?php echo count($tabel_kelasreguler); ?>">Minggu</th>
    </tr>
    <tr class="bariskelas">
      <?php
      foreach ($tabel_kelasreguler as $key => $row_kelasreguler) {
        ?>
        <th><?php echo $row_kelasreguler->nama_kelas; ?></th>
        <?php
      }
      ?>
    </tr>
  </thead>
  <tbody>
    <?php 
    for($i=0;$i<=12;$i++)  {
      ?>
      <tr>
        <td class="fit"><?php echo $i; ?></td>
        <th><?php echo @substr($hari_rentang['Minggu'][$i]->jam_mulai,0,5)."-".@substr($hari_rentang['Minggu'][$i]->jam_selesai,0,5); ?></th>
        <?php
        foreach ($tabel_kelasreguler as $key => $row_kelasreguler) {
          ?>
          <!-- <th class="ungu" bgcolor="#00FF00"> --><?php //echo @$tabel_jadwalmapel_minggu[$row_kelasreguler->id_kelas_reguler][$i][0]->NIP." ".@$tabel_jadwalmapel_minggu[$row_kelasreguler->id_kelas_reguler][$i][0]->id_namamapel; ?><!-- </th> -->

          <?php
            $sudah = false;
            foreach (@$tabel_jadwalprioritas_minggu[$i] as $rowjadwalprioritas) {
              $ada = false;
              foreach (@$tabel_jadwalkhusus_minggu[$i] as $rowjadwalkhusus) {
                if ($rowjadwalprioritas->NIP == $rowjadwalkhusus->NIP) {
                  $ada = true;
                }
              }
              if ($ada == false) {
                if ((@$tabel_jadwalmapel_minggu[$row_kelasreguler->id_kelas_reguler][$i][0]->NIP == $rowjadwalprioritas->NIP) && (@$tabel_jadwalmapel_minggu[$row_kelasreguler->id_kelas_reguler][$i][0]->id_namamapel == $rowjadwalprioritas->id_namamapel)) { 
                  echo '<th bgcolor="'.@$rowjadwalprioritas->warna.'">'.$rowjadwalprioritas->Nama."(".$rowjadwalprioritas->nama_panggilan.")".'</th>'; $sudah = true;
                }
              }
            }
          ?>

        <?php 
        foreach (@$tabel_jammengajar as $rowjammengajar) {
          $ada = false;
          foreach (@$tabel_jadwalprioritas_minggu[$i] as $rowjadwalprioritas) {
            if (($rowjammengajar->NIP == $rowjadwalprioritas->NIP) && ($rowjammengajar->id_namamapel == $rowjadwalprioritas->id_namamapel)) {
              $ada = true;
            }
          }
          foreach (@$tabel_jadwalkhusus_minggu[$i] as $rowjadwalkhusus) {
            if ($rowjammengajar->NIP == $rowjadwalkhusus->NIP) {
              $ada = true;
            }
          }
          if ($ada == false) {
            if ((@$tabel_jadwalmapel_minggu[$row_kelasreguler->id_kelas_reguler][$i][0]->NIP == $rowjammengajar->NIP) && (@$tabel_jadwalmapel_minggu[$row_kelasreguler->id_kelas_reguler][$i][0]->id_namamapel == $rowjammengajar->id_namamapel)) { echo '<th bgcolor="'.@$rowjammengajar->warna.'">'.$rowjammengajar->nama_mapel."(".$rowjammengajar->nama_panggilan.")".'</th>'; $sudah = true;
          }
        }
      }
      if ($sudah == false) {
        echo '<th bgcolor="#ffffff">&nbsp;</th>';
      }
      ?>
      <?php
    }
    ?>
  </tr>
  <?php
}
?>                      
</tbody>

</table>
<br>

<a href="<?php echo site_url('kurikulum/exportjadwalmapel/'.$jenjang); ?>" ><button class="btnjdwl"><i class="fa fa-upload text-red "></i> Export</button></a>
</div>
<!-- /.box-body -->
</div>


</div>
<!-- /.tab-pane -->

<!-- /.tab-pane -->

  <!-- /.tab-pane -->
  <?php if($this->session->userdata('jabatan') != 'Guru') : ?>
  <div class="tab-pane" id="kelolajadwalmapel">
    <div class="box">

      <!-- /.box-header -->
      <div class="box-body">
        <div style="overflow-x: scroll; width: 1090px">
          <form method="post" action="<?php echo site_url('kurikulum/simpanjadwalgurukurikulum'); ?>">
            <div class="row">
              <div class="col-md-6">
                <div class="form-group">
                  <label for="tahunajaran">Tahun Ajaran</label>
                  <select class="form-control" id="tahunajaran" name="tahunajaran">
                    <option value="">Pilih Tahun Ajaran</option>
                    <?php
                      foreach ($tabel_tahunajaran as $row_tahunajaran) { ?>
                        <option value="<?php echo $row_tahunajaran->id_tahun_ajaran ?>">
                          <?php echo $row_tahunajaran->tahun_ajaran ?>(<?php echo $row_tahunajaran->semester ?>)
                        </option> <?php
                      }
                    ?>
                  </select>
                </div>   
              </div> 
            </div>

            <div class="row">
              <div class="col-md-6">
                <div class="form-group">
                  <label for="jenjang">Jenjang</label>
                  <select class="form-control" id="jenjang" name="jenjang">
                    <option value="">Pilih Jenjang</option>
                    <?php
                      foreach ($data_jenjang as $row_data_jenjang) { ?>
                        <option value="<?php echo $row_data_jenjang->jenjang ?>">
                          <?php echo $row_data_jenjang->jenjang ?>
                        </option> <?php
                      }
                    ?>
                  </select>
                </div>
              </div>
            </div>

            <div class="row">
              <div class="col-md-6">
                <div class="form-group">
                  <label for="kelas">Kelas</label>
                  <select class="form-control" id="kelas" name="kelas" disabled>

                  </select>
                </div>
              </div>
            </div>

            <div class="row">
              <div class="col-md-6">
                <div class="form-group">
                  <label for="mapel">Mapel & Guru</label>
                  <select data-placeholder="Pilih" class="kodeguru form-control" name="mapel" id="mapel">
                    <option value="">Pilih Guru</option>
                    <?php 
                    foreach (@$tabel_jadwalprioritas_senin[$i] as $rowjadwalprioritas) {
                      $ada = false;
                      foreach (@$tabel_jadwalkhusus_senin[$i] as $rowjadwalkhusus) {
                        if ($rowjadwalprioritas->NIP == $rowjadwalkhusus->NIP) {
                          $ada = true;
                        }
                      }
                      if ($ada == false) {
                        ?>
                        <option class="kuning" value="<?php echo $rowjadwalprioritas->NIP; ?>_<?php echo $rowjadwalprioritas->id_namamapel; ?>" <?php if ((@$tabel_jadwalmapel_senin[$row_kelasreguler->id_kelas_reguler][$i][0]->NIP == $rowjadwalprioritas->NIP) && (@$tabel_jadwalmapel_senin[$row_kelasreguler->id_kelas_reguler][$i][0]->id_namamapel == $rowjadwalprioritas->id_namamapel)) { echo " selected"; } ?>><?php echo $rowjadwalprioritas->Nama; ?>(<?php echo $rowjadwalprioritas->nama_panggilan; ?>)</option>
                        <?php
                      }
                    }
                    ?>
                    <?php 
                    foreach (@$tabel_jammengajar as $rowjammengajar) {
                      $ada = false;
                      foreach (@$tabel_jadwalprioritas_senin[$i] as $rowjadwalprioritas) {
                        if (($rowjammengajar->NIP == $rowjadwalprioritas->NIP) && ($rowjammengajar->id_namamapel == $rowjadwalprioritas->id_namamapel)) {
                          $ada = true;
                        }
                      }
                      foreach (@$tabel_jadwalkhusus_senin[$i] as $rowjadwalkhusus) {
                        if ($rowjammengajar->NIP == $rowjadwalkhusus->NIP) {
                          $ada = true;
                        }
                      }
                      if ($ada == false) {
                        ?>
                        <option class="putih" value="<?php echo $rowjammengajar->NIP; ?>_<?php echo $rowjammengajar->id_namamapel; ?>" <?php if ((@$tabel_jadwalmapel_senin[$row_kelasreguler->id_kelas_reguler][$i][0]->NIP == $rowjammengajar->NIP) && (@$tabel_jadwalmapel_senin[$row_kelasreguler->id_kelas_reguler][$i][0]->id_namamapel == $rowjammengajar->id_namamapel)) { echo " selected"; } ?>><?php echo $rowjammengajar->nama_mapel; ?>(<?php echo $rowjammengajar->nama_panggilan; ?>)</option>
                        <?php
                      }
                    }
                    ?>
                  </select>
                </div>
              </div>
            </div>

            <div class="row">
              <div class="col-md-6">
                <div class="form-group">
                  <label for="hari">Hari</label>
                  <select class="form-control" id="hari" name="hari">
                    <option value="senin" selected>Senin</option>
                    <option value="selasa">Selasa</option>
                    <option value="rabu">Rabu</option>
                    <option value="kamis">Kamis</option>
                    <option value="jumat">Jumat</option>
                    <option value="sabtu">Sabtu</option>
                    <option value="minggu">Minggu</option>
                  </select>
                </div>
              </div>
            </div>

            <div class="row">
              <div class="col-md-6">
                <div class="form-group">
                  <label for="jamke">Jam Ke</label>
                  <select class="form-control" id="jamke" name="jamke" disabled>
                  </select>
                </div>
              </div>
            </div>

            <div class="text-right">
              <button type="submit" class="btn btn-info">Simpan</button>
            </div>
          </form>
        </div>


    </div>
    <!-- /.box-body -->
  </div> 
</div>
  <?php endif ?>


</div>
</div>
</div>
</div>
    </section>
  </div>

  

<div class="modal fade" id="modal_jadwal_prioritas" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-full" role="document">
    <div class="modal-content">
      <div class="modal-body" style="padding-top: 0;padding: 0;">

        
        <div class="box" style="border: 0;padding: 0;">

          <div class="box-body" style="padding-top: 0;">
            <div class="row" style="padding: 0;position: relative;">
              <div class="col-xs-3" style="background: #1565c0;min-height: 5em"></div>
              <div class="col-xs-9" style="background: #42a5f5;min-height: 5em;"></div>
              <div class="col-xs-12" style="position: absolute;height: 5em;">
                <h3 class="text-center" style="color: white;">Jadwal Prioritas</h3>
              </div>
            </div>
            <form method="post" action="<?php echo site_url('kurikulum/simpanprioritas'); ?>">
              <table class="table table-bordered table-striped tabelmapel">
                <thead>`
                  <tr class="barishari" style="background: #90caf9;color: white">
                    <th class="tengah" style="border: 0;">Jam ke</th>
                    <!-- <th class="tengah" >Waktu</th> -->
                    <th class="tengah" style="border: 0;">Senin</th>
                    <th class="tengah" style="border: 0;">Selasa</th>
                    <th class="tengah" style="border: 0;">Rabu</th>
                    <th class="tengah" style="border: 0;">Kamis</th>
                    <th class="tengah" style="border: 0;">Jumat</th>
                    <th class="tengah" style="border: 0;">Sabtu</th>
                    <th class="tengah" style="border: 0;">Minggu</th>
                  </tr>
                </thead>
                <tbody>
                  <?php 
                  for($i=0;$i<=5;$i++)  {
                  ?>
                  <tr class="btnpilih">
                    <td class="fit">
                      <?php echo $i+1; ?>
                    </td>
                    <th>
                      <select data-placeholder="Pilih mapel" multiple class="chosen-select" name="id_namamapel_senin_<?php echo $i; ?>[]" id="id_namamapel_senin_<?php echo $i; ?>" class="form-control">
                        <?php
                        foreach ($tabel_namamapel as $row_namamapel) {
                        ?>
                              <option value="<?php echo $row_namamapel->id_namamapel; ?>">
                                <?php echo $row_namamapel->nama_mapel; ?>
                              </option>
                              <?php
                        }
                        ?>
                      </select>
                    </th>
                    <th>
                      <select data-placeholder="Pilih mapel" multiple class="chosen-select" name="id_namamapel_selasa_<?php echo $i; ?>[]" id="id_namamapel_selasa_<?php echo $i; ?>" class="form-control">
                        <?php
                        foreach ($tabel_namamapel as $row_namamapel) {
                        ?>
                              <option value="<?php echo $row_namamapel->id_namamapel; ?>">
                                <?php echo $row_namamapel->nama_mapel; ?>
                              </option>
                              <?php
                        }
                        ?>
                      </select>
                    </th>
                    <th>
                      <select data-placeholder="Pilih mapel" multiple class="chosen-select" name="id_namamapel_rabu_<?php echo $i; ?>[]" id="id_namamapel_rabu_<?php echo $i; ?>">
                        <?php
                        foreach ($tabel_namamapel as $row_namamapel) {
                        ?>
                              <option value="<?php echo $row_namamapel->id_namamapel; ?>">
                                <?php echo $row_namamapel->nama_mapel; ?>
                              </option>
                              <?php
                        }
                        ?>
                      </select>
                    </th>
                    <th>
                      <select data-placeholder="Pilih mapel" multiple class="chosen-select" name="id_namamapel_kamis_<?php echo $i; ?>[]" id="id_namamapel_kamis_<?php echo $i; ?>" class="form-control">
                        <?php
                        foreach ($tabel_namamapel as $row_namamapel) {
                        ?>
                              <option value="<?php echo $row_namamapel->id_namamapel; ?>">
                                <?php echo $row_namamapel->nama_mapel; ?>
                              </option>
                              <?php
                        }
                        ?>
                      </select>
                    </th>
                    <th>
                      <select data-placeholder="Pilih mapel" multiple class="chosen-select" name="id_namamapel_jumat_<?php echo $i; ?>[]" id="id_namamapel_jumat_<?php echo $i; ?>" class="form-control">
                        <?php
                        foreach ($tabel_namamapel as $row_namamapel) {
                        ?>
                              <option value="<?php echo $row_namamapel->id_namamapel; ?>">
                                <?php echo $row_namamapel->nama_mapel; ?>
                              </option>
                              <?php
                        }
                        ?>
                      </select>
                    </th>
                    <th>
                      <select data-placeholder="Pilih mapel" multiple class="chosen-select" name="id_namamapel_sabtu_<?php echo $i; ?>[]" id="id_namamapel_sabtu_<?php echo $i; ?>" class="form-control">
                        <?php
                        foreach ($tabel_namamapel as $row_namamapel) {
                        ?>
                              <option value="<?php echo $row_namamapel->id_namamapel; ?>">
                                <?php echo $row_namamapel->nama_mapel; ?>
                              </option>
                              <?php
                        }
                        ?>
                      </select>
                    </th>
                    <th>
                      <select data-placeholder="Pilih mapel" multiple class="chosen-select" name="id_namamapel_minggu_<?php echo $i; ?>[]" id="id_namamapel_minggu_<?php echo $i; ?>" class="form-control">
                        <?php
                        foreach ($tabel_namamapel as $row_namamapel) {
                        ?>
                              <option value="<?php echo $row_namamapel->id_namamapel; ?>">
                                <?php echo $row_namamapel->nama_mapel; ?>
                              </option>
                              <?php
                        }
                        ?>
                      </select>
                    </th>
                  </tr>
                  <?php
                  }
                  ?>
                </tbody>
              </table>
              
              <div class="text-right">
                <button class="btn btn-info" type="submit">Simpan</button>
              </div>
            </form>
          </div>
                      
          <div class="box-body">

            <table class="table table-bordered table-striped tabelmapel">
              <thead>
                <tr class="barishari" style="background: #90caf9;color: white">
                  <th class="tengah" style="border: 0;">Jam ke</th>
                  <th class="tengah" style="border: 0;">Senin</th>
                  <th class="tengah" style="border: 0;">Selasa</th>
                  <th class="tengah" style="border: 0;">Rabu</th>
                  <th class="tengah" style="border: 0;">Kamis</th>
                  <th class="tengah" style="border: 0;">Jumat</th>
                  <th class="tengah" style="border: 0;">Sabtu</th>
                  <th class="tengah" style="border: 0;">Minggu</th>
                </tr>
              </thead>

              <tbody>
                <?php for($i=0;$i<=5;$i++) { ?>
                <tr>
                    <td class="fit">
                        <?php echo $i+1; ?>
                    </td>
                    <th>
                        <?php $z=0; foreach (@$tabel_prioritaskhusus_senin[$i] as $rowprioritaskhusus) { $z++; if ($z>1) { echo ", "; } echo $rowprioritaskhusus->Nama.'&nbsp;<a href="'.site_url('kurikulum/hapusprioritas/'.$rowprioritaskhusus->id_prkh).'">'. $rowprioritaskhusus->nama_mapel .'</a>&nbsp;'; } ?>
                    </th>
                    <th>
                        <?php $z=0; foreach (@$tabel_prioritaskhusus_selasa[$i] as $rowprioritaskhusus) { $z++; if ($z>1) { echo ", "; } echo $rowprioritaskhusus->Nama.'&nbsp;<a href="'.site_url('kurikulum/hapusprioritas/'.$rowprioritaskhusus->id_prkh).'">'. $rowprioritaskhusus->nama_mapel .'</a>&nbsp;'; } ?>
                    </th>
                    <th>
                        <?php $z=0; foreach (@$tabel_prioritaskhusus_rabu[$i] as $rowprioritaskhusus) { $z++; if ($z>1) { echo ", "; } echo $rowprioritaskhusus->Nama.'&nbsp;<a href="'.site_url('kurikulum/hapusprioritas/'.$rowprioritaskhusus->id_prkh).'">'. $rowprioritaskhusus->nama_mapel .'</a>&nbsp;'; } ?>
                    </th>
                    <th>
                        <?php $z=0; foreach (@$tabel_prioritaskhusus_kamis[$i] as $rowprioritaskhusus) { $z++; if ($z>1) { echo ", "; } echo $rowprioritaskhusus->Nama.'&nbsp;<a href="'.site_url('kurikulum/hapusprioritas/'.$rowprioritaskhusus->id_prkh).'">'. $rowprioritaskhusus->nama_mapel .'</a>&nbsp;'; } ?>
                    </th>
                    <th>
                        <?php $z=0; foreach (@$tabel_prioritaskhusus_jumat[$i] as $rowprioritaskhusus) { $z++; if ($z>1) { echo ", "; } echo $rowprioritaskhusus->Nama.'&nbsp;<a href="'.site_url('kurikulum/hapusprioritas/'.$rowprioritaskhusus->id_prkh).'">'. $rowprioritaskhusus->nama_mapel .'</a>&nbsp;'; } ?>
                    </th>
                    <th>
                        <?php $z=0; foreach (@$tabel_prioritaskhusus_sabtu[$i] as $rowprioritaskhusus) { $z++; if ($z>1) { echo ", "; } echo $rowprioritaskhusus->Nama.'&nbsp;<a href="'.site_url('kurikulum/hapusprioritas/'.$rowprioritaskhusus->id_prkh).'">'. $rowprioritaskhusus->nama_mapel .'</a>&nbsp;'; } ?>
                    </th>
                    <th>
                        <?php $z=0; foreach (@$tabel_prioritaskhusus_minggu[$i] as $rowprioritaskhusus) { $z++; if ($z>1) { echo ", "; } echo $rowprioritaskhusus->Nama.'&nbsp;<a href="'.site_url('kurikulum/hapusprioritas/'.$rowprioritaskhusus->id_prkh).'">'. $rowprioritaskhusus->nama_mapel .'</a>&nbsp;'; } ?>
                    </th>
                </tr>
                <?php } ?>
              </tbody>
            </table>
          </div>

          <div class="text-right">
            <button class="btn btn-info mg-bottom-15 mg-right-15 mg-top-15" type="button" data-dismiss="modal">Kembali</button>
          </div>
        </div> 
        

      </div>
    </div>
  </div>
</div>



<div class="modal fade" id="modal_jadwal_khusus" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-full" role="document">
    <div class="modal-content">
      <div class="modal-body" style="padding-top: 0;padding: 0;">

        
        <div class="box" style="border: 0;padding: 0;">

          <div class="box-body" style="padding-top: 0;">
            <div class="row" style="padding: 0;position: relative;margin-bottom: 1em;">
              <div class="col-xs-3" style="background: #1565c0;min-height: 5em"></div>
              <div class="col-xs-9" style="background: #42a5f5;min-height: 5em;"></div>
              <div class="col-xs-12" style="position: absolute;height: 5em;">
                <h3 class="text-center" style="color: white;">Jadwal Khusus</h3>
              </div>
            </div>
            <form method="post" action="<?php echo site_url('kurikulum/simpankhusus'); ?>">
              <table class="table table-bordered table-striped tabelmapel">
                <thead>
                  <tr class="barishari" style="background: #90caf9;color: white">
                  <th class="tengah" style="border: 0;">Jam ke</th>
                  <th class="tengah" style="border: 0;">Senin</th>
                  <th class="tengah" style="border: 0;">Selasa</th>
                  <th class="tengah" style="border: 0;">Rabu</th>
                  <th class="tengah" style="border: 0;">Kamis</th>
                  <th class="tengah" style="border: 0;">Jumat</th>
                  <th class="tengah" style="border: 0;">Sabtu</th>
                  <th class="tengah" style="border: 0;">Minggu</th>
                </tr>
                </thead>
                <tbody>
                  <?php for($i=0;$i<=12;$i++) { ?>
                  <tr class="btnpilih">
                      <td class="fit">
                          <?php echo $i+1; ?>
                      </td>
                      <!-- <th>&nbsp;</th> -->
                      <th>
                          <select data-placeholder="Pilih guru" multiple class="chosen-select" name="NIP_senin_<?php echo $i; ?>[]" id="NIP_senin_<?php echo $i; ?>">
                              <?php foreach ($tabel_pegawai as $row_pegawai) { ?>
                              <option value="<?php echo $row_pegawai->NIP; ?>">
                                  <?php echo $row_pegawai->kode_guru; ?>.
                                  <?php echo $row_pegawai->nama_panggilan; ?></option>
                              <?php } ?>
                          </select>
                          <!-- <button class="btn btn-success button-form" data-toggle="modal" data-target="#review4" style="background-color:#00994d; border-color:#00994d;">Pilih guru</button> -->
                      </th>
                      <th>
                          <select data-placeholder="Pilih guru" multiple class="chosen-select" name="NIP_selasa_<?php echo $i; ?>[]" id="NIP_selasa_<?php echo $i; ?>">
                              <?php foreach ($tabel_pegawai as $row_pegawai) { ?>
                              <option value="<?php echo $row_pegawai->NIP; ?>">
                                  <?php echo $row_pegawai->kode_guru; ?>.
                                  <?php echo $row_pegawai->nama_panggilan; ?></option>
                              <?php } ?>
                          </select>

                          <th>
                              <select data-placeholder="Pilih guru" multiple class="chosen-select" name="NIP_rabu_<?php echo $i; ?>[]" id="NIP_rabu_<?php echo $i; ?>">
                                  <?php foreach ($tabel_pegawai as $row_pegawai) { ?>
                                  <option value="<?php echo $row_pegawai->NIP; ?>">
                                      <?php echo $row_pegawai->kode_guru; ?>.
                                      <?php echo $row_pegawai->nama_panggilan; ?></option>
                                  <?php } ?>
                              </select>
                              <!-- <button class="btn btn-success button-form" data-toggle="modal" data-target="#review4" style="background-color:#00994d; border-color:#00994d;">Pilih guru</button> -->
                          </th>
                          <th>
                              <select data-placeholder="Pilih guru" multiple class="chosen-select" name="NIP_kamis_<?php echo $i; ?>[]" id="NIP_kamis_<?php echo $i; ?>">
                                  <?php foreach ($tabel_pegawai as $row_pegawai) { ?>
                                  <option value="<?php echo $row_pegawai->NIP; ?>">
                                      <?php echo $row_pegawai->kode_guru; ?>.
                                      <?php echo $row_pegawai->nama_panggilan; ?></option>
                                  <?php } ?>
                              </select>
                              <!-- <button class="btn btn-success button-form" data-toggle="modal" data-target="#review4" style="background-color:#00994d; border-color:#00994d;">Pilih guru</button> -->
                          </th>
                          <th>
                              <select data-placeholder="Pilih guru" multiple class="chosen-select" name="NIP_jumat_<?php echo $i; ?>[]" id="NIP_jumat_<?php echo $i; ?>">
                                  <?php foreach ($tabel_pegawai as $row_pegawai) { ?>
                                  <option value="<?php echo $row_pegawai->NIP; ?>">
                                      <?php echo $row_pegawai->kode_guru; ?>.
                                      <?php echo $row_pegawai->nama_panggilan; ?></option>
                                  <?php } ?>
                              </select>
                              <!-- <button class="btn btn-success button-form" data-toggle="modal" data-target="#review4" style="background-color:#00994d; border-color:#00994d;">Pilih guru</button> -->
                          </th>
                          <th>
                              <select data-placeholder="Pilih guru" multiple class="chosen-select" name="NIP_sabtu_<?php echo $i; ?>[]" id="NIP_sabtu_<?php echo $i; ?>">
                                  <?php foreach ($tabel_pegawai as $row_pegawai) { ?>
                                  <option value="<?php echo $row_pegawai->NIP; ?>">
                                      <?php echo $row_pegawai->kode_guru; ?>.
                                      <?php echo $row_pegawai->nama_panggilan; ?></option>
                                  <?php } ?>
                              </select>
                              <!-- <button class="btn btn-success button-form" data-toggle="modal" data-target="#review4" style="background-color:#00994d; border-color:#00994d;">Pilih guru</button> -->
                          </th>
                          <th>
                              <select data-placeholder="Pilih guru" multiple class="chosen-select" name="NIP_minggu_<?php echo $i; ?>[]" id="NIP_minggu_<?php echo $i; ?>">
                                  <?php foreach ($tabel_pegawai as $row_pegawai) { ?>
                                  <option value="<?php echo $row_pegawai->NIP; ?>">
                                      <?php echo $row_pegawai->kode_guru; ?>.
                                      <?php echo $row_pegawai->nama_panggilan; ?></option>
                                  <?php } ?>
                              </select>
                              <!-- <button class="btn btn-success button-form" data-toggle="modal" data-target="#review4" style="background-color:#00994d; border-color:#00994d;">Pilih guru</button> -->
                          </th>
                  </tr>
                  <?php } ?>
                </tbody>
              </table>

              <div class="text-right">
                <button class="btn btn-info" type="submit">Simpan</button>
              </div>
            </form>
          </div>
            
          <div class="box-body">
            <table class="table table-bordered table-striped tabelmapel">
              <thead>
                <tr class="barishari" style="background: #90caf9;color: white">
                  <th class="tengah" style="border: 0;">Jam ke</th>
                  <th class="tengah" style="border: 0;">Senin</th>
                  <th class="tengah" style="border: 0;">Selasa</th>
                  <th class="tengah" style="border: 0;">Rabu</th>
                  <th class="tengah" style="border: 0;">Kamis</th>
                  <th class="tengah" style="border: 0;">Jumat</th>
                  <th class="tengah" style="border: 0;">Sabtu</th>
                  <th class="tengah" style="border: 0;">Minggu</th>
                </tr>
              </thead>

              <tbody>
                <?php
                for($i=0;$i<=12;$i++) {
                ?>
                <tr>
                  <td class="fit">
                    <?php echo $i; ?>
                  </td>
                  <!-- <th>&nbsp;</th> -->
                  <th>
                    <?php 
                $z=0;
                foreach (@$tabel_khusus_senin[$i] as $rowprioritaskhusus) {
                $z++;
                if ($z>1) { echo ", "; }
                echo $rowprioritaskhusus->nama_panggilan.'&nbsp;<a href="'.site_url('kurikulum/hapusprioritas/'.$rowprioritaskhusus->id_prkh).'"></a>&nbsp;';
                }
                ?> 
                  </th>
                  <th>
                    <?php 
                $z=0;
                foreach (@$tabel_khusus_selasa[$i] as $rowprioritaskhusus) {
                $z++;
                if ($z>1) { echo ", "; }
                echo $rowprioritaskhusus->nama_panggilan.'&nbsp;<a href="'.site_url('kurikulum/hapusprioritas/'.$rowprioritaskhusus->id_prkh).'"></a>&nbsp;';
                }
                ?> 
                  </th>
                  <th>
                    <?php 
                $z=0;
                foreach (@$tabel_khusus_rabu[$i] as $rowprioritaskhusus) {
                $z++;
                if ($z>1) { echo ", "; }
                echo $rowprioritaskhusus->nama_panggilan.'&nbsp;<a href="'.site_url('kurikulum/hapusprioritas/'.$rowprioritaskhusus->id_prkh).'"></a>&nbsp;';
                }
                ?> 
                  </th>
                  <th>
                    <?php 
                $z=0;
                foreach (@$tabel_khusus_kamis[$i] as $rowprioritaskhusus) {
                $z++;
                if ($z>1) { echo ", "; }
                echo $rowprioritaskhusus->nama_panggilan.'&nbsp;<a href="'.site_url('kurikulum/hapusprioritas/'.$rowprioritaskhusus->id_prkh).'"></a>&nbsp;';
                }
                ?> 
                  </th>
                  <th>
                    <?php 
                $z=0;
                foreach (@$tabel_khusus_jumat[$i] as $rowprioritaskhusus) {
                $z++;
                if ($z>1) { echo ", "; }
                echo $rowprioritaskhusus->nama_panggilan.'&nbsp;<a href="'.site_url('kurikulum/hapusprioritas/'.$rowprioritaskhusus->id_prkh).'"></a>&nbsp;';
                }
                ?>
                  </th>
                  <th>
                    <?php 
                $z=0;
                foreach (@$tabel_khusus_sabtu[$i] as $rowprioritaskhusus) {
                $z++;
                if ($z>1) { echo ", "; }
                echo $rowprioritaskhusus->nama_panggilan.'&nbsp;<a href="'.site_url('kurikulum/hapusprioritas/'.$rowprioritaskhusus->id_prkh).'"></a>&nbsp;';
                }
                ?> 
                  </th>
                  <th>
                    <?php 
                $z=0;
                foreach (@$tabel_khusus_minggu[$i] as $rowprioritaskhusus) {
                $z++;
                if ($z>1) { echo ", "; }
                echo $rowprioritaskhusus->nama_panggilan.'&nbsp;<a href="'.site_url('kurikulum/hapusprioritas/'.$rowprioritaskhusus->id_prkh).'"></a>&nbsp;';
                }
                ?> 
                  </th>
                </tr>
                <?php
                }
                ?>
              </tbody>
            </table>
          </div>

          <div class="text-right">
            <button class="btn btn-info mg-bottom-15 mg-right-15 mg-top-15" type="button" data-dismiss="modal">Kembali</button>
          </div>
        </div> 

      </div>
    </div>
  </div>
</div>

<div class="modal fade" id="modal_tambah_jadwal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-full" role="document">
    <div class="modal-content">
      <div class="modal-body" style="padding-top: 0;padding: 0;">

        
        <div class="box" style="border: 0;padding: 0;">

          <div class="box-body" style="padding-top: 0;">
            <div class="row" style="padding: 0;position: relative;margin-bottom: 1em;">
              <div class="col-xs-3" style="background: #1565c0;min-height: 5em"></div>
              <div class="col-xs-9" style="background: #42a5f5;min-height: 5em;"></div>
              <div class="col-xs-12" style="position: absolute;height: 5em;">
                <h3 class="text-center" style="color: white;">Jadwal Khusus</h3>
              </div>
            </div>
            
            <div style="overflow-x: scroll; width: 1090px">
          <form method="post" action="<?php echo site_url('kurikulum/simpanjadwalgurukurikulum'); ?>">
            <div class="row">
              <div class="col-md-6">
                <div class="form-group">
                  <label for="tahunajaran">Tahun Ajaran</label>
                  <select class="form-control" id="tahunajaran" name="tahunajaran">
                    <option value="">Pilih Tahun Ajaran</option>
                    <?php
                      foreach ($tabel_tahunajaran as $row_tahunajaran) { ?>
                        <option value="<?php echo $row_tahunajaran->id_tahun_ajaran ?>">
                          <?php echo $row_tahunajaran->tahun_ajaran ?>(<?php echo $row_tahunajaran->semester ?>)
                        </option> <?php
                      }
                    ?>
                  </select>
                </div>   
              </div> 
            </div>

            <div class="row">
              <div class="col-md-6">
                <div class="form-group">
                  <label for="jenjang">Jenjang</label>
                  <select class="form-control" id="jenjang" name="jenjang">
                    <option value="">Pilih Jenjang</option>
                    <?php
                      foreach ($data_jenjang as $row_data_jenjang) { ?>
                        <option value="<?php echo $row_data_jenjang->jenjang ?>">
                          <?php echo $row_data_jenjang->jenjang ?>
                        </option> <?php
                      }
                    ?>
                  </select>
                </div>
              </div>
            </div>

            <div class="row">
              <div class="col-md-6">
                <div class="form-group">
                  <label for="kelas">Kelas</label>
                  <select class="form-control" id="kelas" name="kelas" disabled>

                  </select>
                </div>
              </div>
            </div>

            <div class="row">
              <div class="col-md-6">
                <div class="form-group">
                  <label for="mapel">Mapel & Guru</label>
                  <select data-placeholder="Pilih" class="kodeguru form-control" name="mapel" id="mapel">
                    <option value="">Pilih Guru</option>
                    <?php 
                    foreach (@$tabel_jadwalprioritas_senin[$i] as $rowjadwalprioritas) {
                      $ada = false;
                      foreach (@$tabel_jadwalkhusus_senin[$i] as $rowjadwalkhusus) {
                        if ($rowjadwalprioritas->NIP == $rowjadwalkhusus->NIP) {
                          $ada = true;
                        }
                      }
                      if ($ada == false) {
                        ?>
                        <option class="kuning" value="<?php echo $rowjadwalprioritas->NIP; ?>_<?php echo $rowjadwalprioritas->id_namamapel; ?>" <?php if ((@$tabel_jadwalmapel_senin[$row_kelasreguler->id_kelas_reguler][$i][0]->NIP == $rowjadwalprioritas->NIP) && (@$tabel_jadwalmapel_senin[$row_kelasreguler->id_kelas_reguler][$i][0]->id_namamapel == $rowjadwalprioritas->id_namamapel)) { echo " selected"; } ?>><?php echo $rowjadwalprioritas->Nama; ?>(<?php echo $rowjadwalprioritas->nama_panggilan; ?>)</option>
                        <?php
                      }
                    }
                    ?>
                    <?php 
                    foreach (@$tabel_jammengajar as $rowjammengajar) {
                      $ada = false;
                      foreach (@$tabel_jadwalprioritas_senin[$i] as $rowjadwalprioritas) {
                        if (($rowjammengajar->NIP == $rowjadwalprioritas->NIP) && ($rowjammengajar->id_namamapel == $rowjadwalprioritas->id_namamapel)) {
                          $ada = true;
                        }
                      }
                      foreach (@$tabel_jadwalkhusus_senin[$i] as $rowjadwalkhusus) {
                        if ($rowjammengajar->NIP == $rowjadwalkhusus->NIP) {
                          $ada = true;
                        }
                      }
                      if ($ada == false) {
                        ?>
                        <option class="putih" value="<?php echo $rowjammengajar->NIP; ?>_<?php echo $rowjammengajar->id_namamapel; ?>" <?php if ((@$tabel_jadwalmapel_senin[$row_kelasreguler->id_kelas_reguler][$i][0]->NIP == $rowjammengajar->NIP) && (@$tabel_jadwalmapel_senin[$row_kelasreguler->id_kelas_reguler][$i][0]->id_namamapel == $rowjammengajar->id_namamapel)) { echo " selected"; } ?>><?php echo $rowjammengajar->nama_mapel; ?>(<?php echo $rowjammengajar->nama_panggilan; ?>)</option>
                        <?php
                      }
                    }
                    ?>
                  </select>
                </div>
              </div>
            </div>

            <div class="row">
              <div class="col-md-6">
                <div class="form-group">
                  <label for="hari">Hari</label>
                  <select class="form-control" id="hari" name="hari">
                    <option value="senin" selected>Senin</option>
                    <option value="selasa">Selasa</option>
                    <option value="rabu">Rabu</option>
                    <option value="kamis">Kamis</option>
                    <option value="jumat">Jumat</option>
                    <option value="sabtu">Sabtu</option>
                    <option value="minggu">Minggu</option>
                  </select>
                </div>
              </div>
            </div>

            <div class="row">
              <div class="col-md-6">
                <div class="form-group">
                  <label for="jamke">Jam Ke</label>
                  <select class="form-control" id="jamke" name="jamke" disabled>
                  </select>
                </div>
              </div>
            </div>

            <div class="text-right">
              <button type="submit" class="btn btn-info">Simpan</button>
            </div>
          </form>
        </div>
          </div>
          
        </div> 

      </div>
    </div>
  </div>
</div>


  <!--  /.content-wrapper -->
  <script type="text/javascript">
    $(".chosen-select").chosen({width: "95%"}); 

    $("#trigger_jadwal_prioritas").click(() => {
      $("#modal_jadwal_prioritas").modal('show')
    })

    $("#trigger_jadwal_khusus").click(() => {
      $("#modal_jadwal_khusus").modal('show')
    })

    $("#trigger_tambah_jadwal").click(() => {
      $("#modal_tambah_jadwal").modal('show')
    })

    $('#jenjang').on('change', function() {
      if (this.value == '') {
        $("#kelas").attr('disabled', true)
        $("#kelas").html('')
      } else {
        $("#kelas").attr('disabled', false)
        $.ajax({
          url: '<?php echo site_url('kurikulum/getKelasByJenjang'); ?>/'+this.value,
          dataType: 'json',
          cache: false,
          success: function(msg){
            let el = ""

            for (const row of msg.data) {
              el += `<option value="${row.id_kelas_reguler}">${row.nama_kelas}</option>`
            }
            
            $("#kelas").html(el)
          }
        });
      }
    });

    // $('#jenjangmapel').on('change', function() {
    //   if (this.value == '') {
    //     $("#kelasmapel").attr('disabled', true)
    //     $("#kelasmapel").html('')
    //   } else {
    //     $("#kelasmapel").attr('disabled', false)
    //     $.ajax({
    //       url: '<?php echo site_url('kurikulum/getKelasByJenjang'); ?>/'+this.value,
    //       dataType: 'json',
    //       cache: false,
    //       success: function(msg){
    //         let el = ""

    //         for (const row of msg.data) {
    //           el += `<option value="${row.id_kelas_reguler}">${row.nama_kelas}</option>`
    //         }
            
    //         $("#kelasmapel").html(el)
    //       }
    //     });
    //   }
    // });

    $('#tahunajaran, #hari').on('change', function() {
      var id_tahunpelajaran = $("#tahunajaran").val()

      if (id_tahunpelajaran == '') {
        $("#jamke").attr('disabled', true)
        $("#jamke").html('')
      } else {
        $("#jamke").attr('disabled', false)
        var hari = $("#hari").val()

        $.ajax({
          url: '<?php echo site_url('kurikulum/getJamKeByTahunDanHari'); ?>/'+id_tahunpelajaran+'/'+hari,
          dataType: 'json',
          cache: false,
          success: function(msg){
            let el = ""
            console.log(msg)
            for (const row of msg.data) {
              el += `<option value="${row.jam_ke}">${row.jam_ke} (${row.jam_mulai}-${row.jam_selesai})</option>`
            }
            
            $("#jamke").html(el)
          }
        });
      }
    });

    $('#harimapel').on('change', function() {
      if (this.value == '') {
        $('.tampilkan').addClass('tampilkan-table')
      } else {
        $('.tampilkan').removeClass('tampilkan-table')
        $(`#tampil-${this.value}`).addClass('tampilkan-table')
      }
    });

    $('#harimapel_').on('change', function() {
      if (this.value == '') {
        $('.tampilkan_').addClass('tampilkan-table');
      } else {
        // console.log("#tampil-"+this.value);
        $('.tampilkan_').removeClass('tampilkan-table');
        $("#" + this.value).addClass('tampilkan-table');
      }
    });

    

  </script>