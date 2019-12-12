<script type="text/javascript">
  function fetch_select_mapel(val, cmb)
  {
   $('#'+cmb).html('<option value="">Please Wait ... </option>');
   $.ajax({
     type: 'post',
     url: '<?php echo site_url('kurikulum/getmapelkelastambahan'); ?>',
     //data: 'nama=' + jsnama + '&instansi=' + jsinstansi + '&hp=' + jshp  + '&email=' + jsemail,
     data: {
       id:val
     },
     success: function (response) {
       document.getElementById('#'+cmb).innerHTML=response; 
     }
   });
 } 
</script>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
  
  <!-- Content Header (Page header) -->
  <section class="content-header">
    <h1>
      <center style="color:navy;">Jadwal Tambahan<br></center>
      <!-- <center><small>Tahun Ajaran 2016-2017</small></center> -->
    </h1>
    <ol class="breadcrumb">
      <li><a href="dashboard.php">Dashboard</a></li>
    </ol>
  </section>

  <!-- Main content -->
  <section class="content">
    <!-- Small boxes (Stat box) -->

    <!-- /.row -->
    <!-- Main row -->
    <div class="row">

      <!-- /.col -->
      <div class="col-md-12">
        <div class="nav-tabs-custom">
          <ul class="nav nav-tabs">
            <?php if($this->session->userdata('jabatan') != 'Guru') : ?>
            <li class="<?php if($this->session->userdata('jabatan') != 'Guru') : ?>active<?php endif ?>"><a href="#pengaturanjadwaltambahan" data-toggle="tab">Pengaturan</a></li>
            <li><a href="#kelolajadwaltambahan" data-toggle="tab"><?php if (@$edit_jadwaltambahan) { echo "Edit"; } else { echo "Tambah"; } ?> Jadwal Tambahan</a></li>
            <?php endif ?>
            <li class="<?php if($this->session->userdata('jabatan') == 'Guru') : ?>active<?php endif ?>"><a href="#datajadwaltambahan" data-toggle="tab">Data Jadwal Tambahan</a></li>
              <!-- <li ><a href="#jadwaltambahan" data-toggle="tab">Jadwal Tambahan</a></li>
              -->
          </ul>
            <div class="tab-content">
              <?php if($this->session->userdata('jabatan') != 'Guru') : ?>
              <div class="<?php if($this->session->userdata('jabatan') != 'Guru') : ?>active<?php endif ?> tab-pane" id="pengaturanjadwaltambahan">
                <div class="box">
                   <div class="box-header">
                     <h3 class="text-center">Pengaturan Jadwal Tambahan</h3>
                     <p class="text-center">Berikan tanda centang pada atribut formulir yang ingin di isi.</p>
                   </div>
                   <div class="box-body" style="padding: 2em;padding-top: 0;">
                     <div class="row">
                       <div class="col-xs-6">
                         <div class="checkbox col-md-12">
                            <label class="pull-right" style="width: 20%;">
                              <input type="checkbox" value="">
                              Tanggal
                            </label>
                          </div>
                          <div class="checkbox col-xs-12">
                            <label class="pull-right" style="width: 20%;">
                              <input type="checkbox" value="">
                              Jenjang
                            </label>
                          </div>
                          <div class="checkbox col-xs-12">
                            <label class="pull-right" style="width: 20%;">
                              <input type="checkbox" value="">
                              Kelas
                            </label>
                          </div>
                       </div>
                       <div class="col-xs-6">
                          <div class="checkbox">
                            <label>
                              <input type="checkbox" value="">
                              Mata Pelajaran
                            </label>
                          </div>
                          <div class="checkbox">
                            <label>
                              <input type="checkbox" value="">
                              Guru
                            </label>
                          </div>
                          <div class="checkbox">
                            <label>
                              <input type="checkbox" value="">
                              Jam Mulai & Selesai
                            </label>
                          </div>
                       </div>
                     </div>
                   </div>
                </div>
                

              </div>
              

              <!-- /.tab-pane -->
              <div class="tab-pane" id="kelolajadwaltambahan">
                <div class="box">


                  <!-- /.box-header -->
                  <div class="box-body">
                    <form method="post" action="<?php echo site_url('kurikulum/simpanjadwaltambahan'); ?>">
                      <input type="hidden" name="id_jadwal_tambahan" value="<?php echo @$edit_jadwaltambahan->id_jadwal_tambahan; ?>">
                      <table id="example1" class="table tabelmapel" style="border: 0;">

                        <tbody style="border: 0;">

                          <tr>
                            <tr>
                              <th>Tanggal</th>
                              <th><input class="form-control" type="date" name="tgl_tambahan" placeholder="Tanggal pelaksaan les" value="<?php echo @$edit_jadwaltambahan->tgl_tambahan; ?>"></th>
                            </tr>

                            <tr>
                              <th>Jenjang</th>
                              <th>
                                <select name="pilihgrade" id="pilihgrade" class="form-control">
                                    <option value="">Pilih Jenjang</option>

                                    <?php
                                  $i=0;
                                  foreach ($tabel_kelasreguler as $row_kelasreguler) {
                                    $i++;
                                    ?>
                                      <option value="<?php echo $row_kelasreguler->jenjang; ?>" <?php if (@$edit_mapel->jenjang == $row_kelasreguler->jenjang) { echo " selected"; } ?>> KELAS <?php echo $row_kelasreguler->jenjang; ?></option>
                                    <?php
                                    }
                                  ?>
                                  </select>
                              </th>
                            </tr>

                            <tr>
                              <th>Kelas</th>
                              <th>

                              <?php 
                                if($this->uri->segment(3)):
                                  foreach(kelas_reguler() as $kl) :
                                    if($kl->id_kelas_reguler == $edit_jadwaltambahan->id_kelas_tambahan) :
                              ?>
                                    <input type="radio" name="id_kelas_tambahan" value="<?= $kl->id_kelas_reguler; ?>" checked="checked">
                                    <label><?= $kl->nama_kelas; ?></label>
                              <?php else : ?>
                                    <input type="radio" name="id_kelas_tambahan" value="<?= $kl->id_kelas_reguler; ?>">
                                    <label><?= $kl->nama_kelas; ?></label>
                              <?php 
                                
                                    endif;
                                endforeach;
                                else:
                                  
                                foreach(kelas_reguler() as $kl) :
                              ?>
                                <input type="radio" name="id_kelas_tambahan" value="<?= $kl->id_kelas_reguler; ?>" >
                                <label><?= $kl->nama_kelas; ?></label>
                              <?php 
                                endforeach; 
                                endif;
                              ?>
                                <!-- <select class="kodeguru" name="id_kelas_tambahan" id="kelas1" onchange="fetch_select_mapel(this.value, 'mapel1');">
                                  <option value="">Pilih Kelas</option>
                                  <?php
                                  // foreach ($tabel_kelastambahan as $row_kelastambahan) {
                                  //   ?>
                                  //   <option value="<?php# echo $row_kelastambahan->id_kelas_tambahan; ?>" <?php #if (@$edit_jadwaltambahan->id_kelas_tambahan == $row_kelastambahan->id_kelas_tambahan) { echo " selected"; } ?>><?php #echo $row_kelastambahan->nama_kelas_tambahan; ?></option>
                                  //   <?php
                                  // }
                                  ?>
                                </select> -->
                              </th>
                            </tr>


                          </tr>
                          <tr>
                            <th>Mata Pelajaran</th>
                          <?php
                            function kelas_tambahan() {
                              $ci =& get_instance();
                              return $ci->db->get('kelas_reguler')->result();
                            }
                            
                            
                          ?>
                            <th>

                              
                            <select class="kodemapel form-control" name="id_namamapel">
                              <option value="">Pilih Mapel</option>
                              <?php

                                
                              foreach ($tabel_namamapel as $row_namamapel) {
                                ?>
                               <option value="<?php echo $row_namamapel->id_namamapel; ?>" <?php if (@$edit_jadwaltambahan->id_namamapel == $row_namamapel->id_namamapel) { echo " selected"; } ?>><?php echo $row_namamapel->nama_mapel; ?></option> 
                              <?php
                               }
                              ?>
                             </select> 
                          </th>

                        </tr>
                        <tr>
                          <th>Guru</th>
                          <th>
                            <select class="kodeguru form-control" name="NIP">
                              <option value="">Pilih Guru</option>
                              <?php
                              foreach ($tabel_pegawai as $row_pegawai) {
                                ?>
                                <option value="<?php echo $row_pegawai->NIP; ?>"  <?php if (@$edit_jadwaltambahan->NIP == $row_pegawai->NIP) { echo " selected"; } ?>><?php echo $row_pegawai->kode_guru; ?>. <?php echo $row_pegawai->nama_panggilan; ?></option>
                                <?php
                              }
                              ?>
                            </select>
                          </th>

                        </tr>
                        <tr>
                          <th>Jam Mulai</th>
                          <th>Jam Selesai</th>
                        </tr>
                        <tr>
                          <th><input type="time" class="form-control" name="jam_mulai" placeholder="Waktu" value="<?php echo @$edit_jadwaltambahan->jam_mulai; ?>"></th>
                          
                          <th><input type="time" class="form-control" name="jam_selesai" placeholder="Waktu" value="<?php echo @$edit_jadwaltambahan->jam_selesai; ?>"></th>
                        </tr>
                      </tbody>

                    </table>
                    <button class="btn btn-danger" type="submit">Submit</button>
                  </form>
                </div>
              </div>
            </div>
              <?php endif ?>

            <!-- DATA MAPEL KELAS 7 -->
            <div> <?php echo $this->session->flashdata('warning') ?></div>
            <div class="tab-pane <?php if($this->session->userdata('jabatan') == 'Guru') : ?>active<?php endif ?>" id="datajadwaltambahan">
              <div class="box">
                <div class="box-header" style="background-color:     #5c8a8a">
                  <h3 class="box-title" style="color:white">Data Jadwal Tambahan </h3>
                </div>
                <!-- /.box-header -->

                <?php
                  function tgl_indo($tanggal) {
                    $tgl = substr($tanggal, 8, 2);
                    $bln = substr($tanggal, 5, 2);
                    $thn = substr($tanggal, 0, 4);
                    if ($bln == "1") { $bulan = "Januari"; } 
                    if ($bln == "2") { $bulan = "Februari"; } 
                    if ($bln == "3") { $bulan = "Maret"; } 
                    if ($bln == "4") { $bulan = "April"; } 
                    if ($bln == "5") { $bulan = "Mei"; } 
                    if ($bln == "6") { $bulan = "Juni"; } 
                    if ($bln == "7") { $bulan = "Juli"; } 
                    if ($bln == "8") { $bulan = "Agustus"; } 
                    if ($bln == "9") { $bulan = "September"; } 
                    if ($bln == "10") { $bulan = "Oktober"; } 
                    if ($bln == "11") { $bulan = "November"; } 
                    if ($bln == "12") { $bulan = "Desember"; } 
                    return $tgl." ".$bulan." ".$thn;
                  }
                ?>
                <?php
                  function kelas_reguler() {
                    $ci =& get_instance();
                    return $ci->db->get('kelas_reguler')->result();
                  }
                ?>
                <div class="box-body">
                  <table id="example1" class="table table-bordered table-striped">
                    <thead>
                      <tr>
                        <th class="fit">No</th>
                        <th>Tanggal</th>
                        <th>Kelas</th>
                        <th>Mata Pelajaran</th>
                        <th>Guru</th>
                        <th>Jam Mulai</th>
                        <th>Jam Selesai</th>
                        <?php if($this->session->userdata('jabatan') != 'Guru') : ?>
                        <th>Action</th>
                        <?php endif ?>
                      </tr>
                    </thead>
                    <tbody>
                      <?php
                      $i=0;
                      foreach ($tabel_jadwaltambahan as $row_jadwaltambahan) {
                        $i++; 
                        ?>
                        <tr>
                          <td class="fit"><?php echo $i; ?></td>
                          <th><?php echo tgl_indo($row_jadwaltambahan->tgl_tambahan); ?></th>
                          <th><?php 
                            foreach(kelas_reguler() as $kr){
                                if($row_jadwaltambahan->id_kelas_tambahan == $kr->id_kelas_reguler) {
                                  echo $kr->nama_kelas;
                                }
                            }
                             ?></th>
                          <th><?php echo $row_jadwaltambahan->nama_mapel; ?></th>
                          <th><?php echo $row_jadwaltambahan->Nama; ?></th>
                          <th><?php echo substr($row_jadwaltambahan->jam_mulai, 0, 5); ?></th>
                          <th><?php echo substr($row_jadwaltambahan->jam_selesai, 0, 5); ?></th>
                          <?php if($this->session->userdata('jabatan') != 'Guru') : ?>
                          <td> 
                            <a class="btn btn-block btn-primary button-action btnedit" href="<?php echo site_url('kurikulum/jadwaltambahan/'.$row_jadwaltambahan->id_jadwal_tambahan); ?>" > Edit </a>
                            <a onclick="return confirm('Apakah Anda yakin?')" class="btn btn-danger btn-primary button-action btnhapus" href="<?php echo site_url('kurikulum/hapusjadwaltambahan/'.$row_jadwaltambahan->id_jadwal_tambahan); ?>" > Hapus </a>
                          </td>
                          <?php endif ?>
                        </tr>
                        <?php
                      }
                      ?>
                    </tbody>
                  </table>
                </div>
                <!-- /.box-body -->
              </div> 
            </div>


            <!-- /.tab-pane -->

            <!-- /.tab-pane -->
            <div class="tab-pane" id="editjadwaltambahan">
              <div class="box">


                <!-- /.box-header -->
                <div class="box-body">
                  <table id="example1" class="table table-bordered table-striped tabelmapel">
                    <thead>
                      <!-- <tr class="barishari">
                        <th class="tengah" rowspan="2">Keterangan</th>
                        <th class="tengah" colspan="4"><select>
                             <option>Desember</option>
                             <option>Januari</option>
                             <option>Februari</option>
                             <option>Maret</option>
                             <option>April</option> 
                             <option>Mei</option>
                            </select></th>
                          </tr> -->
                          <tr class="barishari">
                            <th class="tengah"><input type="date" placeholder="Tanggal pelaksanaan les"></th>
                          </tr>
                        </thead>
                        <tbody>
                          <tr>
                            <th>Kelas</th>
                            <th><select class="kodeguru">
                             <option>9A</option>
                             <option>9B</option>
                             <option>9C</option>
                             <option>9D</option>
                             <option>9E</option> 
                             <option>9F</option>
                           </select>
                         </th>
                       </tr>
                       <tr>
                        <th>Mata Pelajaran</th>
                        <th>
                         <select class="kodeguru">
                           <option>Matematika</option>
                           <option>Bhs Indonesia</option>
                           <option>IPA</option>
                           <option>IPS</option>
                           <option>Bhs. Inggris</option> 
                         </select>
                       </th>
                     </tr>
                     <tr>
                      <th>Guru</th>
                      <th>
                        <select class="kodeguru">
                         <option>4</option>
                         <option>17</option>
                         <option>14</option>
                         <option>20</option>
                         <option>10</option> 
                         <option>2</option>
                       </select>
                     </th>
                   </tr>
                   <tr>
                    <th>Jam Mulai</th>
                    <th><input type="time" placeholder="Waktu"></th>
                  </tr>
                  <tr>
                    <th>Jam Selesai</th>
                    <th><input type="time" placeholder="Waktu"></th> 
                  </tr>
                </tbody>

              </table>

              <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                  <form class="posisikanan">
                    <td><button type="submit" class="btn btn-danger" href="#datajadwaltambahan" data-toggle="tab">Submit</button></td><td> <button class="btn btn-danger" href="#datajadwaltambahan" data-toggle="tab">Back</button></td>
                  </form>
                </div>
              </div>


            </div>
          </div>
        </div>

      </div>

    </div>
    <!-- /.tab-content -->
  </div>
  <!-- /.nav-tabs-custom -->
</div>
<!-- /.col -->
</div>
<!-- /.row (main row) -->
<!-- modal -->



</section>
<!-- /.content -->
</div>
  <!-- /.content-wrapper -->

<script>
  $(document).ready(function(){

  });
</script>