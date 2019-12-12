<!-- Content Wrapper. Contains page content -->
<link rel="stylesheet" href="<?php echo base_url(); ?>assets/penjadwalam/chosen/chosen.css">
<div class="content-wrapper">
  <!-- Content Header (Page header) -->
  <section class="content-header">
    <h1>
      <center style="color:##993d00;">Pembagian Jam Mengajar<br></center>
      <!--  <center style="color:##993d00;"><h4>Tahun Ajaran 2016-2017 Kurikulum 2013</h4></center> -->

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
              <li class="<?php echo $this->session->flashdata('tab_loc') == null ? 'active' : '' ?>"><a href="#jammengajar" data-toggle="tab">Kelola Jam Mengajar Guru</a></li>
              <li class="<?php echo $this->session->flashdata('tab_loc') == 2 ? 'active' : '' ?>"><a href="#kelolajammengajar" data-toggle="tab" alt="test kursor">Data Jam Mengajar</a></li>
            </ul>

            <div class="tab-content">
              <div class="tab-pane <?php echo $this->session->flashdata('tab_loc') == null ? 'active' : '' ?>" id="jammengajar">
                <div class="box formmapel">
                  <form class="form-horizontal form_head" action="/action_page.php">
                    <div class="form-group">
                      <label class="control-label col-sm-2" for="guru">Pilih jumlah guru:</label>
                      <div class="col-sm-10">
                        <select class="form-control" id="guru">
                          <option value="1" selected>1</option>
                          <option value="2">2</option>
                          <option value="3">3</option>
                          <option value="4">4</option>
                          <option value="5">5</option>
                          <option value="6">6</option>
                          <option value="7">7</option>
                          <option value="8">8</option>
                          <option value="9">9</option>
                          <option value="10">10</option>
                        </select>
                      </div>
                    </div>
                  </form>
                </div>
                <div class="box formmapel" style="padding: 1.5em;">
                  <!-- /.box-header -->
                  <blockquote style="font-size: 1em;padding-left: 0em;color: #f44336;">
                    <ul>
                      <li>Pilih <b>Nama</b> guru, kemudian pilih <b>Mata Pelajaran</b> yang diampu dan isi <b>Jam Minim Mengajar</b></li>
                      <li>Kemudian <b>Submit</b></li>
                    </ul>
                  </blockquote>
                  <div class="box-body">
                    <form method="post" action="<?php echo site_url('kurikulum/simpanjammengajar'); ?>">
                      <div>
                        <!-- <div class="box-header jarakbox" style="padding-top: : 0px"> -->
                          
                            <table class="table table-bordered">
                              <thead>
                                <tr>
                                  <th rowspan="3"><center>No.</center></th>
                                  <th rowspan="3"><center>Nama</center></th>
                                  <th rowspan="3"><center>NIP</center></th>
                                <!--  <th rowspan="3">Kode Guru</th> -->
                                  <th rowspan="3"><center>Golongan</center></th>
                                  <th rowspan="3"><center>Jabatan Guru</center></th>
                                  <th rowspan="3"><center>Ijazah</center></th>
                                  <th rowspan="3"><center>Mata pelajaran</center></th>
                                  <th rowspan="3"><center>Jam Minim Mengajar</center></th>
                                  <!-- <th rowspan="3"><center>Jumlah jam</center></th> -->
                                </tr>
                              </thead>
                              <tbody  style="text-align: center; padding-bottom: 5px" id="guru_tampil">

                                <?php
                                for ($i=1;$i<=10;$i++) {
                                  ?>
                                  <tr id="baris<?php echo $i ?>" class="hidden_tampilan">
                                    <td class="fit"><?php echo $i; ?></td>
                                    <td>
                                      <select name="NIP<?php echo $i; ?>" id="NIP<?php echo $i; ?>" onchange="getinfoguru(<?php echo $i; ?>);" class="form-control">
                                      <option value="">...</option>
                                      <?php
                                      foreach ($tabel_pegawai as $row_pegawai) {
                                        ?>
                                        <option value="<?php echo $row_pegawai->NIP; ?>"><?php echo $row_pegawai->Nama; ?></option>
                                        <?php
                                      }
                                      ?>
                                    </select></td>

                                    <td><span id="NIP_text<?php echo $i; ?>">-</span></td>
                                    <td><span id="Golongan_text<?php echo $i; ?>">-</span></td>
                                    <td><span id="pangkat_text<?php echo $i; ?>">-</span></td>
                                    <td><span id="Pendidikan_text<?php echo $i; ?>">-</span></td>
                                    <td>
                                      <select class="kodemapel form-control" name="id_namamapel<?php echo $i; ?>">
                                        <option value="">...</option>
                                        <?php
                                        foreach ($tabel_namamapel as $row_namamapel) {
                                          ?>
                                          <option value="<?php echo $row_namamapel->id_namamapel; ?>"><?php echo $row_namamapel->nama_mapel; ?></option>
                                          <?php
                                        }
                                        ?>
                                      </select>
                                    </td>
                                    <td><input type="text" name="jatah_minim_mgjr<?php echo $i; ?>" class="form-control"></td>
                                  </tr>
                                  <?php
                                }
                                ?>



                              </tbody>
                            </table>
                          </div>

                        </div>
                        
                        <div class="text-right pd-right-50 pd-bottom-15">
                          <button class="btn btn-danger btn-dark-blue pd-right-50 pd-left-50" type="submit">Simpan</button>
                        </div>
                        <!-- /.box-body -->
                      </div>
                    </form>

                  </div>
                  <!-- /.tab-pane -->
                  

                  <!-- /.tab-pane -->

                  <!-- /.tab-pane -->
                  <div> <?php echo $this->session->flashdata('warning') ?></div>
                  <div class="tab-pane <?php echo $this->session->flashdata('tab_loc') == 2 ? 'active' : '' ?>" id="kelolajammengajar">
                    <div class="box formmapel" style="padding: 1.5em;">

                      <!-- /.box-header -->
                      <div class="box-body">
                        <div>
                        <!-- <div class="box-header jarakbox" style="overflow: auto"> -->

                          <table id="example1" class="table table-bordered table-striped">
                            <thead>
                              <tr>
                                <th >No.</th>
                                <th >Nama</th>
                                <th >NIP</th>
                                <!-- <th >Kode Guru</th> -->
                                <th >Golongan</th>
                                <th >Jabatan</th>
                                <th >Ijazah</th>
                                <th >Mata pelajaran</th>
                                <th >Jam Mengajar per Minggu</th>
                                <!-- <th ><center>Jumlah jam</center></th> -->
                                <th >Action</th>

                              </tr>
                            </thead>
                            <tbody>
                              <?php
                              $i=0;
                              foreach ($tabel_jammengajar as $row_jammengajar) {
                                $i++;
                                ?>
                                <tr>
                                  <td><?php echo $i; ?></td>
                                  <td><?php echo $row_jammengajar->Nama; ?></td>
                                  <td><?php echo $row_jammengajar->NIP; ?></td>
                                  <!-- <td><?php echo $row_jammengajar->kode_guru; ?></td> -->
                                  <td><?php echo $row_jammengajar->Golongan; ?></td>
                                  <td><?php echo $row_jammengajar->pangkat; ?></td>
                                  <td><?php echo $row_jammengajar->Pendidikan; ?></td>
                                  <td><?php echo $row_jammengajar->nama_mapel; ?></td>
                                  <td><?php echo $row_jammengajar->jatah_minim_mgjr; ?></td>
                                  <!-- <td><?php echo substr($total_durasi[$row_jammengajar->id_jam_mgjr], 0, 5); ?></td> -->
                                  <td>
                                    <button
                                      class="btn btn-danger btn-dark-blue edit_jam_mengajar_trigger"
                                      data_id="<?php echo $row_jammengajar->id_jam_mgjr; ?>"
                                      data_nip="<?php echo $row_jammengajar->NIP; ?>"
                                      data_nama_mapel="<?php echo preg_replace('/\s+/', '', $row_jammengajar->id_namamapel); ?>"
                                      data_minim_mengajar="<?php echo $row_jammengajar->jatah_minim_mgjr	; ?>">
                                      Edit
                                    </button>
                                    <a onclick="return confirm('Apakah Anda yakin?')" href="<?php echo site_url('kurikulum/hapusjammengajar/'.$row_jammengajar->id_jam_mgjr); ?>" class="btn btn-danger">Hapus</a>
                                  </td>

                                </tr>
                                <?php
                              }
                              ?>
                            </tbody>
                          </table>
                        </div>

                      </div>                   
                      <!-- <button class=" btn btnjdwl">Print</button> -->
                                         <!-- /.box-body -->

                    </div>

                  </div>
                  <!-- /.tab-pane -->


                  <!-- /.tab-pane -->

                  <!-- /.tab-pane -->
                </div>

<div id="modal_edit_jam_mengajar" class="modal fade" role="dialog">
  <div class="modal-dialog">
    <div class="modal-content">
      <form method="post" class="form-horizontal" action="<?php echo site_url('kurikulum/editjammengajar'); ?>">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Edit Data Jam Mengajar</h4>
        </div>
        <div class="modal-body">
          <input type="hidden" name="id_jam_mengajar" value="" id="modal_id_jam_mengajar">
          
          <!-- <div class="row"> -->
            <div class="form-group formgrup jarakform">
              <label class="col-sm-4 control-label">Nama</label>
              <div class="col-sm-8">
                <select class="form-control" name="modal_jam_mengajar_nama">
                  <option value="">...</option>
                  <?php
                    foreach ($tabel_pegawai as $row_pegawai) { ?>
                      <option value="<?php echo $row_pegawai->NIP; ?>" id="<?php echo $row_pegawai->NIP; ?>"> <?php echo $row_pegawai->Nama; ?> </option> <?php
                    }
                  ?>
                </select>
              </div>
            </div>
          <!-- </div> -->
          
          <!-- <div class="row"> -->
            <div class="form-group formgrup jarakform">
              <label class="col-sm-4 control-label">Mata Pelajaran</label>
              <div class="col-sm-8">
                <select class="form-control" name="modal_jam_mengajar_mata_pelajaran">
                  <option value="">...</option>
                  <?php
                    foreach ($tabel_namamapel as $row_namamapel) { ?>
                      <option value="<?php echo $row_namamapel->id_namamapel; ?>" id="<?php echo preg_replace('/\s+/', '', $row_namamapel->id_namamapel); ?>"> <?php echo $row_namamapel->nama_mapel; ?> </option> <?php
                    }
                  ?>
                </select>
              </div>
            </div>
          <!-- </div> -->

          <!-- <div class="row"> -->
            <div class="bigbox-mapel"> 
              <div class="box-mapel">
                <div class="form-group formgrup jarakform">
                  <label for="modal_jam_minim_mengajar" class="col-sm-4 control-label">Jam Minim Mengajar</label>
                  <div class="col-sm-8">
                    <input type="text" class="form-control" id="modal_jam_minim_mengajar" name="modal_jam_minim_mengajar" placeholder="Jam Minim Mengajar" value="">
                  </div>
                </div>
              </div>
            </div>
          <!-- </div> -->
        </div>
        <div class="modal-footer">
          <button type="submit" class="btn btn-success">Simpan</button>
        </div>
      </form>
    </div>
  </div>
</div>

<script>
  $(".chosen").chosen()  
  $(document).ready(function() {
    $(".edit_jam_mengajar_trigger").click(function() {
      var id = $(this).attr('data_id')
      var nip = $(this).attr('data_nip')
      var nama_mapel = $(this).attr('data_nama_mapel')
      var minim_mengajar = $(this).attr('data_minim_mengajar')

      $("#modal_id_jam_mengajar").val(id)
      $(`#${nip}`).attr('selected', true)
      $(`#${nama_mapel}`).attr('selected', true)
      $("#modal_jam_minim_mengajar").val(minim_mengajar)
      $("#modal_edit_jam_mengajar").modal('show')
    })

    $("#baris1").addClass('show_tampilan')
  
    $('#guru').on('change', function() {
      const value = this.value
      
      for(var i = 1; i <= 10; i++) {
        if (i <= value) {
          $(`#baris${i}`).addClass('show_tampilan')
        } else {
          $(`#baris${i}`).removeClass('show_tampilan')
        }
      }
    });
  })
</script>
                <script type="text/javascript">
                  function getinfoguru(nomor) {
                    $.ajax({
                      url: '<?php echo site_url('kurikulum/getinfoguru'); ?>/'+document.getElementById('NIP'+nomor).value,
                      dataType: 'json',
                      cache: false,
                      success: function(msg){
                //alert('ok');
                for(i=0;i<msg.data.length;i++){
                              // alert(msg.data[i].NIP + ' ' + msg.data[i].Nama);
                              document.getElementById('NIP_text'+nomor).innerHTML = msg.data[i].NIP;
                              // document.getElementById('kode_text'+nomor).innerHTML = msg.data[i].kode_guru;
                              document.getElementById('Golongan_text'+nomor).innerHTML = msg.data[i].Golongan;
                              document.getElementById('pangkat_text'+nomor).innerHTML = msg.data[i].pangkat;
                              document.getElementById('Pendidikan_text'+nomor).innerHTML = msg.data[i].Pendidikan;

                      // var latLng = new google.maps.LatLng(msg.listrik[i].latitude, msg.listrik[i].longitude);
                      // var marker = new google.maps.Marker({
                      //   position: latLng,
                      //   title: msg.listrik[i].nomor_pelanggan,
                      //   map: map,
                      //   draggable: true
                      // });
                      
                      // var html =
                      //   '<b>' + msg.listrik[i].nomor_pelanggan + '</b> <br/><br>'+ 
                      // '<table style="font-size:11px; border-collapse:collapse;" border="0">'+
                      //         '<tr><td valign="top">Nomor Pelanggan :</td><td>' +msg.listrik[i].nomor_pelanggan+  '</td></tr>'+
                      // '<tr><td valign="top">Nama :</td><td>' +msg.listrik[i].nama_pelapor+  '</td></tr>'+
                      // '<tr><td valign="top">Lokasi Kejadian :</td><td>' +msg.listrik[i].lokasi_kejadian+  '</td></tr>'+
                      // '<tr><td valign="top">Jenis Gangguan :</td><td>' +msg.listrik[i].jenis_gangguan+  '</td></tr>'+
                      // '<tr><td valign="top">Posisi&nbsp;(lintang/bujur):</td><td>'+msg.listrik[i].latitude+'/'+msg.listrik[i].longitude+'</td></tr>'+
                      // '</table>'  ;
                      
                      // setWindow(marker, html);
                      // //tidak bisa disini karena marker yang akan tampil hanya marker terakhir
                      // //google.maps.event.addListener(marker, 'click', function() {
                      // //  infoWindow.setContent(html);
                      // //  infoWindow.open(map, marker);
                      // //});
                    }
                  }
                });
                  }

              //getinfoguru('13523004');
            </script>