<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
  <!-- Content Header (Page header) -->
  <section class="content-header">
    <h1>
      <center style="color:navy;">Jadwal Ekstrakurikuler<br></center>
      <!--  <center><small>Tahun Ajaran 2016-2017 Kurikulum 2013</small></center> -->
    </h1>
    <ol class="breadcrumb">
      <li><a href="dashboard.php">Dashboard</a></li>
    </ol>
  </section>

  <!-- Main content -->
  <section class="content">

    <div class="row" >
      <div class="col-md-12">
        <div class="nav-tabs-custom">
          <ul class="nav nav-tabs">
            <li class="<?php echo $this->session->flashdata('position_tab') == null ? 'active' : '' ?>"><a href="#pengaturan" data-toggle="tab">Pengaturan</a></li>
            <li class="<?php echo $this->session->flashdata('position_tab') == 2 ? 'active' : '' ?>"><a href="#dataekskul" data-toggle="tab"><?php if (@$edit_jadwalekskul) { echo "Edit"; } else { echo "Tambah"; } ?> Jadwal Ekskul</a></li>
            <li class="<?php echo $this->session->flashdata('position_tab') == 3 ? 'active' : '' ?>"><a href="#dataekstrakurikuler" data-toggle="tab">Data Ekskul </a></li>
         </ul>


         <div class="tab-content">
          <div class="tab-pane <?php echo $this->session->flashdata('position_tab') == null ? 'active' : '' ?>" id="pengaturan">
            <div class="box-body">
              <div class="box-add-eskul">
                <button class="btn btn-success" id="tambah_eskul_trigger">Tambah Ekstrakurikuler</button>
              </div>
              <div class="formmapel">
                <div class="box-header mg-bottom-15" style="background-color: #5c8a8a;">
                  <h3 class="box-title" style="color:white">Daftar Ekstrakurikuler </h3>
                </div>
                <div style="padding: 1em">
                  <table id="example2" class="table table-bordered table-striped">
                    <thead>
                      <tr>
                        <th class="fit">No.</th>
                        <th>Nama</th>
                        <th style="width: 25%" class="text-center">Action</th>
                      </tr>
                    </thead>
                    <tbody>
                      <?php
                      $i=0;
                      foreach ($tabel_jenisklstambahan as $row_jenisklstambahan) {
                        $i++;
                        ?>
                        <tr>
                          <td class="fit"><?php echo $i; ?></td>
                          <td><?php echo $row_jenisklstambahan->jenis_kls_tambahan; ?></td>
                          <td> 
                            <button class="btn btn-block btn-primary button-action btnedit edit_eskul_trigger" id_eskul="<?php echo $row_jenisklstambahan->id_jenis_kls_tambahan; ?>" name_eskul="<?php echo $row_jenisklstambahan->jenis_kls_tambahan; ?>"> Edit </button>
                            <a onclick="return confirm('Apakah Anda yakin?')" class="btn btn-block btn-danger button-action btnedit" href="<?php echo site_url('kurikulum/hapus_jenis_kls_tambahan/'); ?><?php echo $row_jenisklstambahan->id_jenis_kls_tambahan; ?>"> Hapus </button>
                          </td>               
                        </tr>
                        <?php
                      }
                      ?>
                    </tbody>
                  </table>
                  
                </div>
              </div>
            </div>
            <!-- /.box-body -->
          </div>

          <div class="tab-pane <?php echo $this->session->flashdata('position_tab') == 2 ? 'active' : '' ?>" id="dataekskul">

            <div class="formmapel" style="padding: 1em;padding-top: 0;">
              
              <div class="row" >
                <div class="col-xs-12" style="background: #64b5f6;border-radius: 1em 1em 0 0;margin-bottom: 1em;">
                  <h3 class="text-center" style="color: white;">Formulir Data Ekstrakurikuler</h3>
                </div>
              </div>
              <form style="display:block;" class="form-horizontal" method="post" action="<?php echo site_url('kurikulum/simpanjadwalekskul'); ?>">
                <input type="hidden" name="id_jadwal_ekskul" value="<?php echo @$edit_jadwalekskul->id_jadwal_ekskul; ?>">
                
                <div class="form-group formgrup jarakform">
                  <label class="col-sm-2 control-label">Hari</label>
                  <div class="col-sm-4">
                    <select required="required" class="form-control" name="hari" value="<?php echo $row_jadwalekskul->hari; ?>" style="width: 120px;">
                      <option value="">Pilih Hari</option>
                      <option value="Senin" <?php if (isset($row_jadwalekskul->hari) && $row_jadwalekskul->hari=="Senin") echo "selected";?>> Senin </option>
                      <option value="Selasa" <?php if (isset($row_jadwalekskul->hari) && $row_jadwalekskul->hari=="Selasa") echo "selected";?>> Selasa </option>
                      <option value="Rabu" <?php if (isset($row_jadwalekskul->hari) && $row_jadwalekskul->hari=="Rabu") echo "selected";?>> Rabu </option>
                      <option value="Kamis" <?php if (isset($row_jadwalekskul->hari) && $row_jadwalekskul->hari=="Kamis") echo "selected";?>> Kamis </option>
                      <option value="Jumat" <?php if (isset($row_jadwalekskul->hari) && $row_jadwalekskul->hari=="Jumat") echo "selected";?>> Jumat</option>
                      <option value="Sabtu" <?php if (isset($row_jadwalekskul->hari) && $row_jadwalekskul->hari=="Sabtu") echo "selected";?>> Sabtu </option>
                      <option value="Minggu" <?php if (isset($row_jadwalekskul->hari) && $row_jadwalekskul->hari=="Minggu") echo "selected";?>> Minggu </option>    
                    </select>
                  </div>
                </div>

                <div class="bigbox-mapel"> 
                  <div class="box-mapel">
                    <div class="form-group formgrup jarakform">
                      <label for="jam_mulai" class="col-sm-2 control-label">Jam Mulai</label>
                      <div class="col-sm-4">
                        <input type="time" class="form-control" id="jam_mulai" name="jam_mulai" placeholder="Waktu" value="<?php echo @$edit_jadwalekskul->jam_mulai; ?>">
                      </div>
                    </div>
                    <div class="form-group formgrup jarakform">
                      <label for="jam_selesai" class="col-sm-2 control-label">Jam Selesai</label>
                      <div class="col-sm-4">
                        <input type="time" class="form-control" id="jam_selesai" name="jam_selesai" placeholder="Waktu" value="<?php echo @$edit_jadwalekskul->jam_selesai; ?>">
                      </div>
                    </div>
                  </div>
                </div>

                <div class="form-group formgrup jarakform">
                  <label class="col-sm-2 control-label">Jenis Ekstrakurikuler</label>
                  <div class="col-sm-4">
                    <select class="form-control" name="id_jenis_kls_tambahan" id="kelas1" onchange="fetch_select_ekskul(this.value, 'ekskul1');" style="width: 120px;">
                      <option value="">Pilih Ekskul</option>
                      <?php
                      foreach ($tabel_jenisklstambahan as $row_jenisklstambahan) { ?>
                        <option value="<?php echo $row_jenisklstambahan->id_jenis_kls_tambahan; ?>" <?php if (@$edit_jadwalekskul->id_jenis_kls_tambahan == $row_jenisklstambahan->id_jenis_kls_tambahan) { echo " selected"; } ?>><?php echo $row_jenisklstambahan->jenis_kls_tambahan; ?></option><?php
                      } ?>
                    </select>
                  </div>
                </div>

                <div class="bigbox-mapel"> 
                  <div class="box-mapel">
                    <div class="form-group formgrup jarakform">
                      <label for="tempat" class="col-sm-2 control-label">Tempat</label>
                      <div class="col-sm-4">
                        <input type="text" class="form-control" id="tempat" name="tempat" placeholder="tempat" value="<?php echo @$edit_jadwalekskul->tempat; ?>">
                      </div>
                    </div>
                  </div>
                </div>

                <div class="form-group formgrup jarakform">
                  <label class="col-sm-2 control-label">Pembimbing</label>
                  <div class="col-sm-4">
                    <select class="form-control" name="id_pembimbing" style="width: 120px;">
                      <option value="">Pilih Pembimbing</option>
                      <?php
                      foreach ($tabel_pembimbing as $row_pembimbing) { ?>
                        <option value="<?php echo $row_pembimbing->id_pembimbing; ?>"  <?php if (@$edit_jadwalekskul->id_pembimbing == $row_pembimbing->id_pembimbing) { echo " selected"; } ?>><?php echo $row_pembimbing->nama_pembimbing; ?></option> <?php
                      }?>
                    </select>
                  </div>
                </div>


                <div class="form-group">
                  <div class="col-sm-offset-2 col-sm-10">
                    <button type="submit" class="btn btn-danger">Submit</button>
                  </div>
                </div>
              </form>
            </div>

          </div>
          <!-- /.tab-pane -->

          <!-- /.tab-pane -->
          <div> <?php echo $this->session->flashdata('warning') ?></div>
          <div class="tab-pane <?php echo $this->session->flashdata('position_tab') == 3 ? 'active' : '' ?>" id="dataekstrakurikuler">
            <div class="box-body formmapel" style="padding: 0;">
              <div class="box-header" style="background-color:     #5c8a8a">
                <h3 class="box-title" style="color:white">Data Jadwal Ekstrakurikuler </h3>
              </div>
              <div style="padding: 1.5em;">
                <table id="example1" class="table table-bordered table-striped">
                  <thead>
                    <tr>
                      <th class="fit">No.</th>
                      <th>Hari</th>
                      <th>Jam Mulai</th>
                      <th>Jam Selesai</th>
                      <th>Jenis Ekstrakurikuler</th>
                      <th>Tempat</th>
                      <th>Pembimbing</th>
                      <th>Action</th>
                    </tr>
                  </thead>
                  <tbody>
                    <?php
                    $i=0;
                    foreach ($tabel_jadwalekskul as $row_jadwalekskul) {
                      $i++;
                      ?>
                      <tr>
                        <td class="fit"><?php echo $i; ?></td>
                        <td><?php echo $row_jadwalekskul->hari; ?></td>
                        <td><?php echo substr($row_jadwalekskul->jam_mulai, 0, 5); ?></td>
                        <td><?php echo substr($row_jadwalekskul->jam_selesai, 0, 5); ?></td>
                        <td><?php echo $row_jadwalekskul->jenis_kls_tambahan; ?></td>
                        <td><?php echo $row_jadwalekskul->tempat; ?></td>
                        <td><?php echo $row_jadwalekskul->nama_pembimbing; ?></td>
                        <td> 
                          <button
                            class="btn btn-block btn-primary button-action btnedit edit_jadwal_eskul_trigger"
                            id_jadwal_eskul="<?php echo $row_jadwalekskul->id_jadwal_ekskul ?>"
                            hari="<?php echo $row_jadwalekskul->hari ?>"
                            jam_mulai="<?php echo $row_jadwalekskul->jam_mulai ?>"
                            jam_selesai="<?php echo $row_jadwalekskul->jam_selesai ?>"
                            jenis_eskul="<?php echo preg_replace('/\s+/', '', $row_jadwalekskul->jenis_kls_tambahan); ?>"
                            tempat="<?php echo $row_jadwalekskul->tempat ?>"
                            pembimbing="<?php echo preg_replace('/\s+/', '', $row_jadwalekskul->nama_pembimbing); ?>"
                          >Edit</button>
                          <a onclick="return confirm('Apakah Anda yakin?')" class="btn btn-danger btn-primary button-action btnhapus" href="<?php echo site_url('kurikulum/hapusjadwalekskul/'.$row_jadwalekskul->id_jadwal_ekskul); ?>" > Hapus </a>
                        </td>               
                      </tr>
                      <?php
                    }
                    ?>
                  </tbody>
                </table>
                <!-- <button class="btnjdwl btn btn-default" ><i class="fa fa-print text-red "></i> Print</button>        -->
              </div>
            </div>
            <!-- /.box-body -->
          </div>

          <!-- DATA MAPEL KELAS 8 -->


          <!-- DATA MAPEL KELAS 9 -->

        </div>
        <!-- /.tab-pane -->

        <!-- /.tab-pane -->

        <!-- /.tab-pane -->

      </div>
    </div>
    <!-- /.tab-content -->
  </div>
  <!-- /.nav-tabs-custom -->
</div>
</div>
</section>
<!-- /.content -->
</div>

<div id="modal_tambah_eskul" class="modal fade" role="dialog">
  <div class="modal-dialog">
    <div class="modal-content">
      <form method="post" action="<?php echo site_url('kurikulum/tambah_jenis_kls_tambahan'); ?>">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Tambah Ekstrakulikuler</h4>
        </div>
        <div class="modal-body">
          <div class="form-group">
            <input type="text" name="jenis_kls_tambahan" class="form-control" placeholder="Nama ekstrakulikuler">
          </div>
        </div>
        <div class="modal-footer">
          <button type="submit" class="btn btn-success">Simpan</button>
        </div>
      </form>
    </div>
  </div>
</div>

<div id="modal_edit_eskul" class="modal fade" role="dialog">
  <div class="modal-dialog">
    <div class="modal-content">
      <form method="post" action="<?php echo site_url('kurikulum/edit_jenis_kls_tambahan'); ?>">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Edit Ekstrakulikuler</h4>
        </div>
        <div class="modal-body">
          <div class="form-group">
            <input type="hidden" name="id_kls_tambahan" id="id_kls_tambahan" class="form-control">
            <input type="text" name="jenis_kls_tambahan" id="jenis_kls_tambahan" class="form-control" placeholder="Nama ekstrakulikuler">
          </div>
        </div>
        <div class="modal-footer">
          <button type="submit" class="btn btn-success">Simpan</button>
        </div>
      </form>
    </div>
  </div>
</div>

<div id="modal_edit_jadwal_eskul" class="modal fade" role="dialog">
  <div class="modal-dialog">
    <div class="modal-content">
      <form method="post" class="form-horizontal" action="<?php echo site_url('kurikulum/simpanjadwalekskul'); ?>">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Edit Jadwal Ekstrakulikuler</h4>
        </div>
        <div class="modal-body">
          
          <input type="hidden" name="id_jadwal_ekskul" value="" id="modal_id_jadwal_eskul">
          <div class="form-group formgrup jarakform">
            <label class="col-sm-2 control-label">Hari</label>
            <div class="col-sm-8">
              <select required="required" class="form-control" name="hari" value="<?php echo $row_jadwalekskul->hari; ?>">
                <option value="">Pilih Hari</option>
                <option value="Senin" id="Senin"> Senin </option>
                <option value="Selasa" id="Selasa"> Selasa </option>
                <option value="Rabu" id="Rabu"> Rabu </option>
                <option value="Kamis" id="Kamis"> Kamis </option>
                <option value="Jumat" id="Jumat"> Jumat</option>
                <option value="Sabtu" id="Sabtu"> Sabtu </option>
                <option value="Minggu" id="Minggu"> Minggu </option>    
              </select>
            </div>
          </div>

          <div class="bigbox-mapel"> 
            <div class="box-mapel">
              <div class="form-group formgrup jarakform">
                <label for="modal_jam_mulai" class="col-sm-2 control-label">Jam Mulai</label>
                <div class="col-sm-8">
                  <input type="time" class="form-control" id="modal_jam_mulai" name="jam_mulai" placeholder="Waktu" value="<?php echo @$edit_jadwalekskul->jam_mulai; ?>">
                </div>
              </div>
              <div class="form-group formgrup jarakform">
                <label for="modal_jam_selesai" class="col-sm-2 control-label">Jam Selesai</label>
                <div class="col-sm-8">
                  <input type="time" class="form-control" id="modal_jam_selesai" name="jam_selesai" placeholder="Waktu" value="<?php echo @$edit_jadwalekskul->jam_selesai; ?>">
                </div>
              </div>
            </div>
          </div>

          <div class="form-group formgrup jarakform">
            <label class="col-sm-2 control-label">Jenis Ekstrakurikuler</label>
            <div class="col-sm-8">
              <select class="form-control" name="id_jenis_kls_tambahan" id="kelas1" onchange="fetch_select_ekskul(this.value, 'ekskul1');">
                <option value="">Pilih Ekskul</option>
                <?php
                foreach ($tabel_jenisklstambahan as $row_jenisklstambahan) { ?>
                  <option value="<?php echo $row_jenisklstambahan->id_jenis_kls_tambahan; ?>" id="modal_<?php echo preg_replace('/\s+/', '', $row_jenisklstambahan->jenis_kls_tambahan); ?>"><?php echo $row_jenisklstambahan->jenis_kls_tambahan; ?></option><?php
                } ?>
              </select>
            </div>
          </div>

          <div class="bigbox-mapel"> 
            <div class="box-mapel">
              <div class="form-group formgrup jarakform">
                <label for="modal_tempat" class="col-sm-2 control-label">Tempat</label>
                <div class="col-sm-8">
                  <input type="text" class="form-control" id="modal_tempat" name="tempat" placeholder="tempat" value="<?php echo @$edit_jadwalekskul->tempat; ?>">
                </div>
              </div>
            </div>
          </div>

          <div class="form-group formgrup jarakform">
            <label class="col-sm-2 control-label">Pembimbing</label>
            <div class="col-sm-8">
              <select class="form-control" name="id_pembimbing">
                <option value="">Pilih Pembimbing</option>
                <?php
                foreach ($tabel_pembimbing as $row_pembimbing) { ?>
                  <option value="<?php echo $row_pembimbing->id_pembimbing; ?>" id="modal_<?php echo preg_replace('/\s+/', '', $row_pembimbing->nama_pembimbing); ?>"><?php echo $row_pembimbing->nama_pembimbing; ?></option> <?php
                }?>
              </select>
            </div>
          </div>


        </div>
        <div class="modal-footer">
          <button type="submit" class="btn btn-success">Simpan</button>
        </div>
      </form>
    </div>
  </div>
</div>

<script>
  $(document).ready(function() {
    $("#tambah_eskul_trigger").click(function() {
      $("#modal_tambah_eskul").modal('show')
    })

    $(".edit_eskul_trigger").click(function() {
      var id = $(this).attr('id_eskul')
      var name = $(this).attr('name_eskul')

      $("#id_kls_tambahan").val(id)
      $("#jenis_kls_tambahan").val(name)
      $("#modal_edit_eskul").modal('show')
    })

    $(".edit_jadwal_eskul_trigger").click(function() {
      var id_jadwal_eskul = $(this).attr('id_jadwal_eskul')
      var hari = $(this).attr('hari')
      var jam_mulai = $(this).attr('jam_mulai')
      var jam_selesai = $(this).attr('jam_selesai')
      var jenis_eskul = $(this).attr('jenis_eskul')
      var tempat = $(this).attr('tempat')
      var pembimbing = $(this).attr('pembimbing')

      $("#modal_id_jadwal_eskul").val(id_jadwal_eskul)
      $(`#${hari}`).attr('selected', true)
      $("#modal_jam_mulai").val(jam_mulai)
      $("#modal_jam_selesai").val(jam_selesai)
      $("#modal_tempat").val(tempat)
      $(`#modal_${jenis_eskul}`).attr('selected', true)
      $(`#modal_${pembimbing}`).attr('selected', true)  
      $("#modal_edit_jadwal_eskul").modal('show')
    })
  })
</script>