<!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        <center style="color:navy;">Manajemen waktu untuk Jadwal Mata Pelajaran<br></center>
        <!-- <center><small>Tahun Ajaran 2016-2017 Semester 1 Kurikulum 2013</small></center> -->
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
          <form method="post" action="<?php echo site_url('kurikulum/simpanharirentang'); ?>">
          <input type="hidden" name="tab_loc" value="1" id="tab_loc">

          <div class="nav-tabs-custom">
            <ul class="nav nav-tabs">
              <li data_tab="1" id="get_data_" class="tab_loc <?php echo $this->session->flashdata('tab_loc') == null || $this->session->flashdata('tab_loc') == 1 ? 'active' : '' ?>"><a href="#tabsenin" data-toggle="tab">Senin</a></li>
              <li data_tab="2" id="get_data_" class="tab_loc <?php echo $this->session->flashdata('tab_loc') == 2 ? 'active' : '' ?>"><a href="#tabselasa" data-toggle="tab" >Selasa</a></li>
              <li data_tab="3" id="get_data_" class="tab_loc <?php echo $this->session->flashdata('tab_loc') == 3 ? 'active' : '' ?>"><a href="#tabrabu" data-toggle="tab">Rabu</a></li>
              <li data_tab="4" id="get_data_" class="tab_loc <?php echo $this->session->flashdata('tab_loc') == 4 ? 'active' : '' ?>"><a href="#tabkamis" data-toggle="tab">Kamis</a></li>
              <li data_tab="5" id="get_data_" class="tab_loc <?php echo $this->session->flashdata('tab_loc') == 5 ? 'active' : '' ?>"><a href="#tabjumat" data-toggle="tab">Jumat</a></li>
              <li data_tab="6" id="get_data_" class="tab_loc <?php echo $this->session->flashdata('tab_loc') == 6 ? 'active' : '' ?>"><a href="#tabsabtu" data-toggle="tab">Sabtu</a></li>
              <li data_tab="7" id="get_data_" class="tab_loc <?php echo $this->session->flashdata('tab_loc') == 7 ? 'active' : '' ?>"><a href="#tabminggu" data-toggle="tab">Minggu</a></li>
              <li data_tab="8" id="get_data" class="tab_loc <?php echo $this->session->flashdata('tab_loc') == 8 ? 'active' : '' ?>"><a href="#lihat_data" data-toggle="tab">Lihat Data</a></li>
            </ul>
          
                   
            <div class="tab-content" style="padding: 1.5em;">


            
                  <div class="tab-pane <?php echo $this->session->flashdata('tab_loc') == null || $this->session->flashdata('tab_loc') == 1 ? 'active' : '' ?>" href="#tabsenin" id="tabsenin">
              <table class="table table-striped projects">
                      <thead>
                        <tr>
                          <th style="width: 7%">No</th>
                          <th style="width: 7.5%">Jam Ke-</th>
                          <th>Jam Mulai</th>
                          <th>Jam Selesai</th>
                          <!-- <th style="width: 7%">TES SENIN</th> -->
                          <th style="width: 20%">Action</th>
                        </tr>
                      </thead>

                      <tbody>
                        <?php
                        for ($i=1;$i<=12;$i++) {
                        ?>
                        <tr>
                          <td><input type="text" class="form-control" value="<?php echo $i; ?>" style="text-align: center"></td>
                          <td><input type="text" class="form-control" name="jam_ke_senin_<?php echo $i; ?>" value="<?php echo @$hari_rentang['senin'][$i]->jam_ke; ?>" style="text-align: center"></td>
                          <td><input type="time" class="form-control" name="jam_mulai_senin_<?php echo $i; ?>" value="<?php echo @$hari_rentang['senin'][$i]->jam_mulai; ?>"></td>
                          <td><input type="time" class="form-control" name="jam_selesai_senin_<?php echo $i; ?>" value="<?php echo @$hari_rentang['senin'][$i]->jam_selesai; ?>"></td>
                          <td>
                            <a href="<?php echo site_url('kurikulum/delharirentang/'.@$hari_rentang['senin'][$i]->id_rentang_jam.'/1'); ?>" class="btn btn-danger" size="2">Hapus</a>
                          </td>
                          <!-- <td>
                            <button type="button" class="btn btn-block btn-primary button-action btnedit" href="#editdatamapel" data-toggle="tab"> Edit </button>
                          </td> -->
                        </tr>
                        <?php

                        }
                        ?>                        

                      </tbody>
                    </table>
                    <!-- <button type="submit" class="btn btn-block btn-primary button-action btnedit" > Simpan </button> -->
                    </div>

          


                  <div class="tab-pane <?php echo $this->session->flashdata('tab_loc') == 2 ? 'active' : '' ?>" href="#tabselasa" id="tabselasa">
              <table class="table table-striped projects">
                      <thead>
                        <tr>
                          <th style="width: 7%">No</th>
                          <th style="width: 7.5%">Jam Ke-</th>
                          <th>Jam Mulai</th>
                          <th>Jam Selesai</th>
                          <!-- <th style="width: 7%">TES SELASA</th> -->
                          <th style="width: 20%">Action</th>
                        </tr>
                      </thead>

                      <tbody>
                        <?php
                        for ($i=1;$i<=12;$i++) {
                        ?>
                        <tr>
                          <td><input type="text" class="form-control" value="<?php echo $i; ?>" style="text-align: center"></td>
                          <td><input type="text" class="form-control" name="jam_ke_selasa_<?php echo $i; ?>" value="<?php echo @$hari_rentang['selasa'][$i]->jam_ke; ?>" style="text-align: center"></td>
                          <td><input type="time" class="form-control" name="jam_mulai_selasa_<?php echo $i; ?>" value="<?php echo @$hari_rentang['selasa'][$i]->jam_mulai; ?>"></td>
                          <td><input type="time" class="form-control" name="jam_selesai_selasa_<?php echo $i; ?>" value="<?php echo @$hari_rentang['selasa'][$i]->jam_selesai; ?>"></td>
                          <td>
                            <a href="<?php echo site_url('kurikulum/delharirentang/'.@$hari_rentang['selasa'][$i]->id_rentang_jam.'/2'); ?>" class="btn btn-danger" size="2">Hapus</a>
                          </td>
                          <!-- <td>
                            <button type="button" class="btn btn-block btn-primary button-action btnedit" href="#editdatamapel" data-toggle="tab"> Edit </button>
                          </td> -->
                        </tr>
                        <?php
                        }
                        ?>                        

                      </tbody>


                    </table>
                    <!-- <button type="submit" class="btn btn-block btn-primary button-action btnedit" > Simpan </button> -->
                    </div>

                    <div class="tab-pane <?php echo $this->session->flashdata('tab_loc') == 3 ? 'active' : '' ?>" href="#tabrabu" id="tabrabu">
              <table class="table table-striped projects">
                      <thead>
                        <tr>
                          <th style="width: 7%">No</th>
                          <th style="width: 7.5%">Jam Ke-</th>
                          <th>Jam Mulai</th>
                          <th>Jam Selesai</th>
                          <!-- <th style="width: 7%">TES RABUUUU</th> -->
                          <th style="width: 20%">Action</th>
                        </tr>
                      </thead>

                      <tbody>
                        <?php
                        for ($i=1;$i<=12;$i++) {
                        ?>
                        <tr>
                          <td><input type="text" class="form-control" value="<?php echo $i; ?>" style="text-align: center"></td>
                          <td><input type="text" class="form-control" name="jam_ke_rabu_<?php echo $i; ?>" value="<?php echo @$hari_rentang['rabu'][$i]->jam_ke; ?>" style="text-align: center"></td>
                          <td><input type="time" class="form-control" name="jam_mulai_rabu_<?php echo $i; ?>" value="<?php echo @$hari_rentang['rabu'][$i]->jam_mulai; ?>"></td>
                          <td><input type="time" class="form-control" name="jam_selesai_rabu_<?php echo $i; ?>" value="<?php echo @$hari_rentang['rabu'][$i]->jam_selesai; ?>"></td>
                          <td>
                            <a href="<?php echo site_url('kurikulum/delharirentang/'.@$hari_rentang['rabu'][$i]->id_rentang_jam.'/3'); ?>" class="btn btn-danger" size="2">Hapus</a>
                          </td>
                          <!-- <td>
                            <button type="button" class="btn btn-block btn-primary button-action btnedit" href="#editdatamapel" data-toggle="tab"> Edit </button>
                          </td> --> 
                        </tr>
                        <?php
                        }
                        ?>                        

                      </tbody>


                    </table>
                   <!-- <button type="submit" class="btn btn-block btn-primary button-action btnedit" > Simpan </button> -->
                    </div>

                    <div class="tab-pane <?php echo $this->session->flashdata('tab_loc') == 4 ? 'active' : '' ?>" href="#tabkamis" id="tabkamis">
              <table class="table table-striped projects">
                      <thead>
                        <tr>
                          <th style="width: 7%">No</th>
                          <th style="width: 7.5%">Jam Ke-</th>
                          <th>Jam Mulai</th>
                          <th>Jam Selesai</th>
                          <!-- <th style="width: 7%">TES kamis</th> -->
                          <th style="width: 20%">Action</th>
                        </tr>
                      </thead>

                      <tbody>
                        <?php
                        for ($i=1;$i<=12;$i++) {
                        ?>
                        <tr>
                          <td><input type="text" class="form-control" value="<?php echo $i; ?>" style="text-align: center"></td>
                          <td><input type="text" class="form-control" name="jam_ke_kamis_<?php echo $i; ?>" value="<?php echo @$hari_rentang['kamis'][$i]->jam_ke; ?>" style="text-align: center"></td>
                          <td><input type="time" class="form-control" name="jam_mulai_kamis_<?php echo $i; ?>" value="<?php echo @$hari_rentang['kamis'][$i]->jam_mulai; ?>"></td>
                          <td><input type="time" class="form-control" name="jam_selesai_kamis_<?php echo $i; ?>" value="<?php echo @$hari_rentang['kamis'][$i]->jam_selesai; ?>"></td>
                          <td>
                            <a href="<?php echo site_url('kurikulum/delharirentang/'.@$hari_rentang['kamis'][$i]->id_rentang_jam.'/4'); ?>" class="btn btn-danger" size="2">Hapus</a>
                          </td>
                          <!-- <td>
                            <button type="button" class="btn btn-block btn-primary button-action btnedit" href="#editdatamapel" data-toggle="tab"> Edit </button>
                          </td> -->
                        </tr>
                        <?php
                        }
                        ?>                        

                      </tbody>


                    </table>
                    <!-- <button type="submit" class="btn btn-block btn-primary button-action btnedit" > Simpan </button> -->
                    </div>

                    <div class="tab-pane <?php echo $this->session->flashdata('tab_loc') == 5 ? 'active' : '' ?>" href="#tabjumat" id="tabjumat">
              <table class="table table-striped projects">
                      <thead>
                        <tr>
                          <th style="width: 7%">No</th>
                          <th style="width: 7.5%">Jam Ke-</th>
                          <th >Jam Mulai</th>
                          <th >Jam Selesai</th>
                          <!-- <th style="width: 7%">TES Jumat</th> -->
                          <th style="width: 20%">Action</th>
                        </tr>
                      </thead>

                      <tbody>
                        <?php
                        for ($i=1;$i<=12;$i++) {
                        ?>
                        <tr>
                          <td><input type="text" class="form-control" value="<?php echo $i; ?>" style="text-align: center"></td>
                          <td><input type="text" class="form-control" name="jam_ke_jumat_<?php echo $i; ?>" value="<?php echo @$hari_rentang['jumat'][$i]->jam_ke; ?>" style="text-align: center"></td>
                          <td><input type="time" class="form-control" name="jam_mulai_jumat_<?php echo $i; ?>" value="<?php echo @$hari_rentang['jumat'][$i]->jam_mulai; ?>"></td>
                          <td><input type="time" class="form-control" name="jam_selesai_jumat_<?php echo $i; ?>" value="<?php echo @$hari_rentang['jumat'][$i]->jam_selesai; ?>"></td>
                          <td>
                            <a href="<?php echo site_url('kurikulum/delharirentang/'.@$hari_rentang['jumat'][$i]->id_rentang_jam.'/5'); ?>" class="btn btn-danger" size="2">Hapus</a>
                          </td>
                          <!-- <td>
                            <button type="button" class="btn btn-block btn-primary button-action btnedit" href="#editdatamapel" data-toggle="tab"> Edit </button>
                          </td> -->
                        </tr>
                        <?php
                        }
                        ?>                        

                      </tbody>


                    </table>
                    <!-- <button type="submit" class="btn btn-block btn-primary button-action btnedit" > Simpan </button> -->
                    </div>

                    <div class="tab-pane <?php echo $this->session->flashdata('tab_loc') == 6 ? 'active' : '' ?>" href="#tabsabtu" id="tabsabtu">
              <table class="table table-striped projects">
                      <thead>
                        <tr>
                          <th style="width: 7%">No</th>
                          <th style="width: 7.5%">Jam Ke-</th>
                          <th>Jam Mulai</th>
                          <th>Jam Selesai</th>
                          <!-- <th style="width: 7%">TES SABTU</th> -->
                          <th style="width: 20%">Action</th>
                        </tr>
                      </thead>

                      <tbody>
                        <?php
                        for ($i=1;$i<=12;$i++) {
                        ?>
                        <tr>
                          <td><input type="text" class="form-control" value="<?php echo $i; ?>" style="text-align: center"></td>
                          <td><input type="text" class="form-control" name="jam_ke_sabtu_<?php echo $i; ?>" value="<?php echo @$hari_rentang['sabtu'][$i]->jam_ke; ?>" style="text-align: center"></td>
                          <td><input type="time" class="form-control" name="jam_mulai_sabtu_<?php echo $i; ?>" value="<?php echo @$hari_rentang['sabtu'][$i]->jam_mulai; ?>"></td>
                          <td><input type="time" class="form-control" name="jam_selesai_sabtu_<?php echo $i; ?>" value="<?php echo @$hari_rentang['sabtu'][$i]->jam_selesai; ?>"></td>
                          <td>
                            <a href="<?php echo site_url('kurikulum/delharirentang/'.@$hari_rentang['sabtu'][$i]->id_rentang_jam.'/6'); ?>" class="btn btn-danger" size="2">Hapus</a>
                          </td>
                          <!-- <td>
                            <button type="button" class="btn btn-block btn-primary button-action btnedit" href="#editdatamapel" data-toggle="tab"> Edit </button>
                          </td> -->
                        </tr>
                        <?php
                        }
                        ?>                        

                      </tbody>


                    </table>
                    <!-- <button type="submit" class="btn btn-block btn-primary button-action btnedit" > Simpan </button> -->
                    </div>

                    <div class="tab-pane <?php echo $this->session->flashdata('tab_loc') == 7 ? 'active' : '' ?>" href="#tabminggu" id="tabminggu">
              <table class="table table-striped projects">
                      <thead>
                        <tr>
                          <th style="width: 7%">No</th>
                          <th style="width: 7.5%">Jam Ke-</th>
                          <th >Jam Mulai</th>
                          <th >Jam Selesai</th>
                          <!-- <th style="width: 7%">MINGGU</th> -->
                          <th style="width: 20%">Action</th>
                        </tr>
                      </thead>

                      <tbody>
                        <?php
                        for ($i=1;$i<=12;$i++) {
                        ?>
                        <tr>
                          <td><input type="text" class="form-control" value="<?php echo $i; ?>" style="text-align: center"></td>
                          <td><input type="text" class="form-control" name="jam_ke_minggu_<?php echo $i; ?>" value="<?php echo @$hari_rentang['minggu'][$i]->jam_ke; ?>" style="text-align: center"></td>
                          <td><input type="time" class="form-control" name="jam_mulai_minggu_<?php echo $i; ?>" value="<?php echo @$hari_rentang['minggu'][$i]->jam_mulai; ?>"></td>
                          <td><input type="time" class="form-control" name="jam_selesai_minggu_<?php echo $i; ?>" value="<?php echo @$hari_rentang['minggu'][$i]->jam_selesai; ?>"></td>
                          <td>
                            <a href="<?php echo site_url('kurikulum/delharirentang/'.@$hari_rentang['minggu'][$i]->id_rentang_jam.'/7'); ?>" class="btn btn-danger" size="2">Hapus</a>
                          </td>
                          <!-- <td>
                            <button type="button" class="btn btn-block btn-primary button-action btnedit" href="#editdatamapel" data-toggle="tab"> Edit </button>
                          </td> -->
                        </tr>
                        <?php
                        }
                        ?>                        

                      </tbody>
                    </table>
                    <!-- <button type="submit" class="btn btn-block btn-primary button-action btnedit" > Simpan </button> -->
                    </div>

                    <div class="tab-pane <?php echo $this->session->flashdata('tab_loc') == 8 ? 'active' : '' ?>" href="#tabminggu" id="lihat_data">
                      <div class="box formmapel">
                        <div class="box-header" style="background-color:#5c8a8a">
                          <h3 class="box-title" style="color:white">Jadwal Senin</h3>
                        </div>
                        <div class="box-body">
                          <table class="table table-striped projects">
                            <thead>
                              <tr>
                                <th style="width: 5%">No</th>
                                <th style="width: 7.5%">Jam Ke-</th>
                                <th >Jam Mulai</th>
                                <th >Jam Selesai</th>
                                <!-- <th style="width: 5%">MINGGU</th> -->
                                <th style="width: 20%">Action</th>
                              </tr>
                            </thead>

                            <tbody>
                              <?php
                              for ($i=1;$i<=12;$i++) {
                              ?>
                              <tr>
                                <td>
                                  <?php echo $i; ?>.
                                </td>
                                <td>
                                  <?php echo @$hari_rentang['senin'][$i]->jam_ke; ?>
                                </td>
                                <td>
                                  <?php echo @$hari_rentang['senin'][$i]->jam_mulai; ?>
                                </td>
                                <td>
                                  <?php echo @$hari_rentang['senin'][$i]->jam_selesai; ?>
                                </td>
                                <td>
                                  <a href="#tabsenin" data-toggle="tab" class="btn btn-success" size="2">Edit</a>
                                  <a href="<?php echo site_url('kurikulum/delharirentang/'.@$hari_rentang['senin'][$i]->id_rentang_jam.'/7'); ?>" class="btn btn-danger" size="2">Hapus</a>
                                </td>
                              </tr>
                              <?php
                              }
                              ?>
                            </tbody>
                          </table>
                        </div>
                      </div>
                      <div class="box formmapel">
                        <div class="box-header" style="background-color:#5c8a8a">
                          <h3 class="box-title" style="color:white">Jadwal Selasa</h3>
                        </div>
                        <div class="box-body">
                          <table class="table table-striped projects">
                            <thead>
                              <tr>
                                <th style="width: 5%">No</th>
                                <th style="width: 7.5%">Jam Ke-</th>
                                <th >Jam Mulai</th>
                                <th >Jam Selesai</th>
                                <!-- <th style="width: 5%">MINGGU</th> -->
                                <th style="width: 20%">Action</th>
                              </tr>
                            </thead>

                            <tbody>
                              <?php
                              for ($i=1;$i<=12;$i++) {
                              ?>
                              <tr>
                                <td>
                                  <?php echo $i; ?>.
                                </td>
                                <td>
                                  <?php echo @$hari_rentang['selasa'][$i]->jam_ke; ?>
                                </td>
                                <td>
                                  <?php echo @$hari_rentang['selasa'][$i]->jam_mulai; ?>
                                </td>
                                <td>
                                  <?php echo @$hari_rentang['selasa'][$i]->jam_selesai; ?>
                                </td>
                                <td>
                                  <a href="#tabselasa" data-toggle="tab" class="btn btn-success" size="2">Edit</a>
                                  <a href="<?php echo site_url('kurikulum/delharirentang/'.@$hari_rentang['selasa'][$i]->id_rentang_jam.'/7'); ?>" class="btn btn-danger" size="2">Hapus</a>
                                </td>
                              </tr>
                              <?php
                              }
                              ?>
                            </tbody>
                          </table>
                        </div>
                      </div>
                      <div class="box formmapel">
                        <div class="box-header" style="background-color:#5c8a8a">
                          <h3 class="box-title" style="color:white">Jadwal Rabu</h3>
                        </div>
                        <div class="box-body">
                          <table class="table table-striped projects">
                            <thead>
                              <tr>
                                <th style="width: 5%">No</th>
                                <th style="width: 7.5%">Jam Ke-</th>
                                <th >Jam Mulai</th>
                                <th >Jam Selesai</th>
                                <!-- <th style="width: 5%">MINGGU</th> -->
                                <th style="width: 20%">Action</th>
                              </tr>
                            </thead>

                            <tbody>
                              <?php
                              for ($i=1;$i<=12;$i++) {
                              ?>
                              <tr>
                                <td>
                                  <?php echo $i; ?>.
                                </td>
                                <td>
                                  <?php echo @$hari_rentang['rabu'][$i]->jam_ke; ?>
                                </td>
                                <td>
                                  <?php echo @$hari_rentang['rabu'][$i]->jam_mulai; ?>
                                </td>
                                <td>
                                  <?php echo @$hari_rentang['rabu'][$i]->jam_selesai; ?>
                                </td>
                                <td>
                                  <a href="#tabrabu" data-toggle="tab" class="btn btn-success" size="2">Edit</a>
                                  <a href="<?php echo site_url('kurikulum/delharirentang/'.@$hari_rentang['rabu'][$i]->id_rentang_jam.'/7'); ?>" class="btn btn-danger" size="2">Hapus</a>
                                </td>
                              </tr>
                              <?php
                              }
                              ?>
                            </tbody>
                          </table>
                        </div>
                      </div>
                      <div class="box formmapel">
                        <div class="box-header" style="background-color:#5c8a8a">
                          <h3 class="box-title" style="color:white">Jadwal Kamis</h3>
                        </div>
                        <div class="box-body">
                          <table class="table table-striped projects">
                            <thead>
                              <tr>
                                <th style="width: 5%">No</th>
                                <th style="width: 7.5%">Jam Ke-</th>
                                <th >Jam Mulai</th>
                                <th >Jam Selesai</th>
                                <!-- <th style="width: 5%">MINGGU</th> -->
                                <th style="width: 20%">Action</th>
                              </tr>
                            </thead>

                            <tbody>
                              <?php
                              for ($i=1;$i<=12;$i++) {
                              ?>
                              <tr>
                                <td>
                                  <?php echo $i; ?>.
                                </td>
                                <td>
                                  <?php echo @$hari_rentang['kamis'][$i]->jam_ke; ?>
                                </td>
                                <td>
                                  <?php echo @$hari_rentang['kamis'][$i]->jam_mulai; ?>
                                </td>
                                <td>
                                  <?php echo @$hari_rentang['kamis'][$i]->jam_selesai; ?>
                                </td>
                                <td>
                                  <a href="#tabkamis" data-toggle="tab" class="btn btn-success" size="2">Edit</a>
                                  <a href="<?php echo site_url('kurikulum/delharirentang/'.@$hari_rentang['kamis'][$i]->id_rentang_jam.'/7'); ?>" class="btn btn-danger" size="2">Hapus</a>
                                </td>
                              </tr>
                              <?php
                              }
                              ?>
                            </tbody>
                          </table>
                        </div>
                      </div>
                      <div class="box formmapel">
                        <div class="box-header" style="background-color:#5c8a8a">
                          <h3 class="box-title" style="color:white">Jadwal Jumat</h3>
                        </div>
                        <div class="box-body">
                          <table class="table table-striped projects">
                            <thead>
                              <tr>
                                <th style="width: 5%">No</th>
                                <th style="width: 7.5%">Jam Ke-</th>
                                <th >Jam Mulai</th>
                                <th >Jam Selesai</th>
                                <!-- <th style="width: 5%">MINGGU</th> -->
                                <th style="width: 20%">Action</th>
                              </tr>
                            </thead>

                            <tbody>
                              <?php
                              for ($i=1;$i<=12;$i++) {
                              ?>
                              <tr>
                                <td>
                                  <?php echo $i; ?>.
                                </td>
                                <td>
                                  <?php echo @$hari_rentang['jumat'][$i]->jam_ke; ?>
                                </td>
                                <td>
                                  <?php echo @$hari_rentang['jumat'][$i]->jam_mulai; ?>
                                </td>
                                <td>
                                  <?php echo @$hari_rentang['jumat'][$i]->jam_selesai; ?>
                                </td>
                                <td>
                                  <a href="#tabjumat" data-toggle="tab" class="btn btn-success" size="2">Edit</a>
                                  <a href="<?php echo site_url('kurikulum/delharirentang/'.@$hari_rentang['jumat'][$i]->id_rentang_jam.'/7'); ?>" class="btn btn-danger" size="2">Hapus</a>
                                </td>
                              </tr>
                              <?php
                              }
                              ?>
                            </tbody>
                          </table>
                        </div>
                      </div>
                      <div class="box formmapel">
                        <div class="box-header" style="background-color:#5c8a8a">
                          <h3 class="box-title" style="color:white">Jadwal Sabtu</h3>
                        </div>
                        <div class="box-body">
                          <table class="table table-striped projects">
                            <thead>
                              <tr>
                                <th style="width: 5%">No</th>
                                <th style="width: 7.5%">Jam Ke-</th>
                                <th >Jam Mulai</th>
                                <th >Jam Selesai</th>
                                <!-- <th style="width: 5%">MINGGU</th> -->
                                <th style="width: 20%">Action</th>
                              </tr>
                            </thead>

                            <tbody>
                              <?php
                              for ($i=1;$i<=12;$i++) {
                              ?>
                              <tr>
                                <td>
                                  <?php echo $i; ?>.
                                </td>
                                <td>
                                  <?php echo @$hari_rentang['sabtu'][$i]->jam_ke; ?>
                                </td>
                                <td>
                                  <?php echo @$hari_rentang['sabtu'][$i]->jam_mulai; ?>
                                </td>
                                <td>
                                  <?php echo @$hari_rentang['sabtu'][$i]->jam_selesai; ?>
                                </td>
                                <td>
                                  <a href="#tabsabtu" data-toggle="tab" class="btn btn-success" size="2">Edit</a>
                                  <a href="<?php echo site_url('kurikulum/delharirentang/'.@$hari_rentang['sabtu'][$i]->id_rentang_jam.'/7'); ?>" class="btn btn-danger" size="2">Hapus</a>
                                </td>
                              </tr>
                              <?php
                              }
                              ?>
                            </tbody>
                          </table>
                        </div>
                      </div>
                      <div class="box formmapel">
                        <div class="box-header" style="background-color:#5c8a8a">
                          <h3 class="box-title" style="color:white">Jadwal Minggu</h3>
                        </div>
                        <div class="box-body">
                          <table class="table table-striped projects">
                            <thead>
                              <tr>
                                <th style="width: 5%">No</th>
                                <th style="width: 7.5%">Jam Ke-</th>
                                <th >Jam Mulai</th>
                                <th >Jam Selesai</th>
                                <!-- <th style="width: 5%">MINGGU</th> -->
                                <th style="width: 20%">Action</th>
                              </tr>
                            </thead>

                            <tbody>
                              <?php
                              for ($i=1;$i<=12;$i++) {
                              ?>
                              <tr>
                                <td>
                                  <?php echo $i; ?>.
                                </td>
                                <td>
                                  <?php echo @$hari_rentang['minggu'][$i]->jam_ke; ?>
                                </td>
                                <td>
                                  <?php echo @$hari_rentang['minggu'][$i]->jam_mulai; ?>
                                </td>
                                <td>
                                  <?php echo @$hari_rentang['minggu'][$i]->jam_selesai; ?>
                                </td>
                                <td>
                                  <a href="#tabminggu" data-toggle="tab" class="btn btn-success" size="2">Edit</a>
                                  <a href="<?php echo site_url('kurikulum/delharirentang/'.@$hari_rentang['minggu'][$i]->id_rentang_jam.'/7'); ?>" class="btn btn-danger" size="2">Hapus</a>
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

                    <div class="btn_test">
                      <button type="submit" class="btn btn-primary" > Simpan </button>
                    </div>
                  

                    </div>
                </div>
              </div>
              <!-- /.tab-pane -->
            </div>
            <!-- /.tab-content -->
          
          </div>
          <!-- /.nav-tabs-custom -->
          </form>

        </div>
        <!-- /.col -->
      </div>
      <!-- /.row (main row) -->

    </section>
    <!-- /.content -->
  </div>
  <script>
    $(document).ready(function() {
      $(".tab_loc").click(function() {
        var data_tab = $(this).attr('data_tab');

        $("#tab_loc").val(data_tab);
      });
      $("#get_data").on("click",function(){
          $(".btn_test").css({"display" : "none"});
      });
      $("#get_data_").on("click",function(){
          $(".btn_test").css({"display" : "block"});
      });

      if ($("#lihat_data").hasClass("active")) {
        $(".btn_test").css({"display" : "none"});
      } else {
        $(".btn_test").css({"display" : "block"});
      }
    })
  </script>
  <!-- /.content-wrapper