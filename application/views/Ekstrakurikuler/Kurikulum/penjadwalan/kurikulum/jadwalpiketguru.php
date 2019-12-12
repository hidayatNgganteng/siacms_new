<!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
  
        <h1 class="text-center" style="color:navy;">Jadwal Piket Guru<br></h1>
        <!-- <center><small>Tahun Ajaran 2016-2017</small></center> -->
 
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
              
              <li  class="active"><a href="#kelolajadwalpiket" data-toggle="tab" alt="test kursor">Kelola Jadwal Piket Guru</a></li>
              <li><a href="#jadwalpiket" data-toggle="tab">Lihat Jadwal Piket Guru</a></li>
            </ul>
            
            <div class="tab-content">
              <div class="formmapel" style="display: block;padding: 1.5em;margin-bottom: 1.5em;">
                      <blockquote style="font-size: 1em;padding-left: 1em;border-left: 5px solid #f44336;color: #f44336;margin:0;">
                        Isikan Jumlah Guru Piket per Hari
                     
                      </blockquote>
                  <div class="row">
                    <div class="col-xs-6" style="margin: 1em 0;">
                      <?php
                          function jml_gut($id) {
                            $ci =& get_instance();
                            return $ci->db->get_where('jadwal_piket_guru',['id_tahun_ajaran' => $id])->num_rows();
                          }
                      ?>
                      <span style="font-weight: bold;">Jumlah Guru : </span>
                      <select class="kodepiket form-control" id="pilih_id_tahun_ajaran" onchange="document.location='<?php echo site_url('kurikulum/jadwalpiketguru'); ?>/' + document.getElementById('pilih_id_tahun_ajaran').value;">
                      <?php
                        foreach ($tabel_tahunajaran as $row_tahunajaran) :
                      ?>
                        <option value="<?php echo $row_tahunajaran->id_tahun_ajaran; ?>" <?php if ($id_tahun_ajaran == $row_tahunajaran->id_tahun_ajaran) { echo " selected"; } ?>>
                          <?= jml_gut($row_tahunajaran->id_tahun_ajaran); ?>
                        </option>
                      <?php endforeach; ?>
                        
                      </select>
                    </div>
                    <div class="col-xs-6" style="margin: 1em 0;">
                      
                      <span style="font-weight: bold;">Tahun Ajaran : </span>
                      <select class="kodepiket form-control" id="pilih_id_tahun_ajaran" onchange="document.location='<?php echo site_url('kurikulum/jadwalpiketguru'); ?>/' + document.getElementById('pilih_id_tahun_ajaran').value;">
                      <?php
                        foreach ($tabel_tahunajaran as $row_tahunajaran) :
                      ?>
                        <option value="<?php echo $row_tahunajaran->id_tahun_ajaran; ?>" <?php if ($id_tahun_ajaran == $row_tahunajaran->id_tahun_ajaran) { echo " selected"; } ?>>
                          Semester <?php echo $row_tahunajaran->semester; ?> <?php echo $row_tahunajaran->tahun_ajaran; ?>
                        </option>
                      <?php endforeach; ?>
                    </select>
                    </div>
                  </div>

              </div>
              <div class="active tab-pane" id="kelolajadwalpiket">
                <div class="box formmapel" style="padding: 0.5em;">
                 
                  <!-- /.box-header -->
                  <div class="box-body">
                    <form method="post" action="<?php echo site_url('kurikulum/simpanjadwalpiketguru'); ?>">
                      <input type="hidden" name="id_tahun_ajaran" id="get_tahunajaran">
                    <table class="table table-bordered table-striped tabelmapel_ table-hover">
                      <thead>
                        <!-- <input type="text" name="id_tahun_ajaran" placeholder="periode"> -->
                      <tr>
                        <th class="tengah" rowspan="2">No.</th>
                        <th>Senin</th>
                        <th >Selasa</th>
                        <th>Rabu</th>
                        <th>Kamis</th>
                        <th>Jumat</th>
                        <th>Sabtu</th>
                        <th>Minggu</th>
                      </tr>
                      </thead>
                      <tbody>
                        <?php
                        for ($i=1;$i<=7;$i++) {
                        ?>
                      <tr>
                        <td class="fit"><?php echo $i; ?></td>
                        <th>
                          <select class="kodepiket form-control" name="NIP_senin<?php echo $i; ?>">
                            <option value="">...</option>
                              <?php
                            foreach ($tabel_pegawai as $row_pegawai) {
                            ?>
                            <option value="<?php echo $row_pegawai->NIP; ?>" <?php if ($row_pegawai->NIP == @$tabel_jadwalpiketguru_senin[$i-1]->NIP) { echo " selected"; } ?>><!-- <?php echo $row_pegawai->kode_guru; ?>.  --><?php echo $row_pegawai->nama_panggilan; ?></option>
                            <?php
                            }
                            ?>
                            </select>
                        </th>
                        <th>
                          <select class="kodepiket form-control" name="NIP_selasa<?php echo $i; ?>">
                              <option value="">...</option>
                              <?php
                            foreach ($tabel_pegawai as $row_pegawai) {
                            ?>
                            <option value="<?php echo $row_pegawai->NIP; ?>" <?php if ($row_pegawai->NIP == @$tabel_jadwalpiketguru_selasa[$i-1]->NIP) { echo " selected"; } ?>><!-- ?php echo $row_pegawai->kode_guru; ?>.  --><?php echo $row_pegawai->nama_panggilan; ?></option>
                            <?php
                            }
                            ?>
                            </select>
                        </th>
                         <th>
                          <select class="kodepiket form-control" name="NIP_rabu<?php echo $i; ?>">
                            <option value="">...</option>
                              <?php
                            foreach ($tabel_pegawai as $row_pegawai) {
                            ?>

                            <option value="<?php echo $row_pegawai->NIP; ?>"  <?php if ($row_pegawai->NIP == @$tabel_jadwalpiketguru_rabu[$i-1]->NIP) { echo " selected"; } ?>><!-- <?php echo $row_pegawai->kode_guru; ?>.  --><?php echo $row_pegawai->nama_panggilan; ?></option>
                            <?php
                            }
                            ?>
                            </select>
                        </th>
                         <th>
                         <select class="kodepiket form-control" name="NIP_kamis<?php echo $i; ?>">
                          <option value="">...</option>
                              <?php
                            foreach ($tabel_pegawai as $row_pegawai) {
                            ?>
                            <option value="<?php echo $row_pegawai->NIP; ?>"  <?php if ($row_pegawai->NIP == @$tabel_jadwalpiketguru_kamis[$i-1]->NIP) { echo " selected"; } ?>><!-- <?php echo $row_pegawai->kode_guru; ?>.  --><?php echo $row_pegawai->nama_panggilan; ?></option>
                            <?php
                            }
                            ?>
                            </select>
                        </th>
                        <th>
                          <select class="kodepiket form-control" name="NIP_jumat<?php echo $i; ?>">
                            <option value="">...</option>
                              <?php
                            foreach ($tabel_pegawai as $row_pegawai) {
                            ?>
                            <option value="<?php echo $row_pegawai->NIP; ?>"  <?php if ($row_pegawai->NIP == @$tabel_jadwalpiketguru_jumat[$i-1]->NIP) { echo " selected"; } ?>><!-- <?php echo $row_pegawai->kode_guru; ?>.  --><?php echo $row_pegawai->nama_panggilan; ?></option>
                            <?php
                            }
                            ?>
                            </select>
                        </th>
                         <th>
                          <select class="kodepiket form-control" name="NIP_sabtu<?php echo $i; ?>">
                            <option value="">...</option>
                              <?php
                            foreach ($tabel_pegawai as $row_pegawai) {
                            ?>
                            <option value="<?php echo $row_pegawai->NIP; ?>"  <?php if ($row_pegawai->NIP == @$tabel_jadwalpiketguru_sabtu[$i-1]->NIP) { echo " selected"; } ?>><!-- <?php echo $row_pegawai->kode_guru; ?>.  --><?php echo $row_pegawai->nama_panggilan; ?></option>
                            <?php
                            }
                            ?>
                            </select>
                        </th>
                         <th>
                          <select class="kodepiket form-control" name="NIP_minggu<?php echo $i; ?>">
                            <option value="">...</option>
                              <?php
                            foreach ($tabel_pegawai as $row_pegawai) {
                            ?>
                            <option value="<?php echo $row_pegawai->NIP; ?>"  <?php if ($row_pegawai->NIP == @$tabel_jadwalpiketguru_minggu[$i-1]->NIP) { echo " selected"; } ?>><!-- <?php echo $row_pegawai->kode_guru; ?>.  --><?php echo $row_pegawai->nama_panggilan; ?></option>
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
                    <button class="btn btn-danger" type="submit">Submit</button>
                    </form>
                  </div>
                  <!-- /.box-body -->
                </div> 
              </div>

              <div class="tab-pane" id="jadwalpiket">
                <div class="box formmapel" style="padding: 1em;">
                  
                  <!-- /.box-header -->
                  <div class="box-body">
                    <table id="example1" class="table table-bordered table-striped tabelmapel_">
                      <thead>
                        
                      <th> 
                      <!-- ini code asli -->
                      <!-- <?php
                            foreach ($tabel_tahunajaran as $row_tahunajaran) {
                             if ($id_tahun_ajaran == $row_tahunajaran->id_tahun_ajaran) { echo $row_tahunajaran->semester." ".$row_tahunajaran->tahun_ajaran; } 
                            }
                            ?> -->

                            <!-- ini code modifikasi supaa bisa milih tahun ajaran yg mau ditampilin -->
                            <!-- <select class="kodepiket" name="id_tahun_ajaran" id="pilih_id_tahun_ajaran" onchange="document.location='<?php echo site_url('kurikulum/jadwalpiketguru'); ?>/' + document.getElementById('pilih_id_tahun_ajaran').value;">
                              <?php
                            foreach ($tabel_tahunajaran as $row_tahunajaran) {
                            ?>
                            <option value="<?php echo $row_tahunajaran->id_tahun_ajaran; ?>" <?php if ($id_tahun_ajaran == $row_tahunajaran->id_tahun_ajaran) { echo " selected"; } ?>><?php echo $row_tahunajaran->semester; ?>. <?php echo $row_tahunajaran->tahun_ajaran; ?></option>
                            <?php
                            }
                            ?>
                            </select> -->
                        </th>
                      <tr class="barishari">
                        <th class="tengah">No.</th>
                        <th >Senin</th>
                        <th class="tengah">Selasa</th>
                        <th class="tengah">Rabu</th>
                        <th class="tengah">Kamis</th>
                        <th class="tengah">Jumat</th>
                        <th class="tengah">Sabtu</th>
                        <th class="tengah">Minggu</th>
                      </tr>
                      </thead>
                      <tbody>
                      <?php
                        for($i=1;$i<=7;$i++) {
                      ?>
                      <tr>
                        <td class="fit"><?php echo $i; ?></td>
                         <th><?php echo @$tabel_jadwalpiketguru_senin[$i-1]->nama_panggilan; ?> </th>
                         <th><?php echo @$tabel_jadwalpiketguru_selasa[$i-1]->nama_panggilan; ?> </th>
                         <th><?php echo @$tabel_jadwalpiketguru_rabu[$i-1]->nama_panggilan; ?> </th>
                         <th><?php echo @$tabel_jadwalpiketguru_kamis[$i-1]->nama_panggilan; ?> </th>
                         <th><?php echo @$tabel_jadwalpiketguru_jumat[$i-1]->nama_panggilan; ?> </th>
                         <th><?php echo @$tabel_jadwalpiketguru_sabtu[$i-1]->nama_panggilan; ?> </th>
                         <th><?php echo @$tabel_jadwalpiketguru_minggu[$i-1]->nama_panggilan; ?> </th>
                         
                      </tr>
                      <?php
                        }
                      ?>
                      </tbody>

                    </table>
                    <!-- <a class="btnjdwl btn btn-default" href="<?php echo site_url('kurikulum/printjadwalpiketguru/'.$id_tahun_ajaran); ?>" target="_blank"><i class="fa fa-print text-red "></i> Print</a> -->
                    <button class="btnjdwl btn btn-default" onclick="window.open('<?php echo site_url('kurikulum/printjadwalpiketguru/'.$id_tahun_ajaran); ?>', 'winpopup', 'menubar=no,toolbar=no,resizeable=yes,statusbar=no,top=50,left=50,width=800,height=600');"><i class="fa fa-print text-red "></i> Print</button>
                  </div>
                  <!-- /.box-body -->
                </div>             
              </div>
              <!-- /.tab-pane -->

              <!-- /.tab-pane -->

              <!-- /.tab-pane -->


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
  <script>
    $(document).ready(function(){
      var val_ = $("#pilih_id_tahun_ajaran").val();
      $("#get_tahunajaran").val(val_);

      // $("#pilih_id_tahun_ajaran").on("change",function(){
      //   var val_this = $(this).val();
      //   $("#get_tahunajaran").val(val_this);
      // });
      // console.log("test");
    });
  </script>