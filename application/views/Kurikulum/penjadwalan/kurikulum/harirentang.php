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
             
              <!-- <li data_tab="1" id="get_data_" class="tab_loc <?php echo $this->session->flashdata('tab_loc') == null || $this->session->flashdata('tab_loc') == 1 ? 'active' : '' ?>"><a href="#tabsenin" data-toggle="tab">Senin</a></li>
              <li data_tab="2" id="get_data_" class="tab_loc <?php echo $this->session->flashdata('tab_loc') == 2 ? 'active' : '' ?>"><a href="#tabselasa" data-toggle="tab" >Selasa</a></li>
              <li data_tab="3" id="get_data_" class="tab_loc <?php echo $this->session->flashdata('tab_loc') == 3 ? 'active' : '' ?>"><a href="#tabrabu" data-toggle="tab">Rabu</a></li>
              <li data_tab="4" id="get_data_" class="tab_loc <?php echo $this->session->flashdata('tab_loc') == 4 ? 'active' : '' ?>"><a href="#tabkamis" data-toggle="tab">Kamis</a></li>
              <li data_tab="5" id="get_data_" class="tab_loc <?php echo $this->session->flashdata('tab_loc') == 5 ? 'active' : '' ?>"><a href="#tabjumat" data-toggle="tab">Jumat</a></li>
              <li data_tab="6" id="get_data_" class="tab_loc <?php echo $this->session->flashdata('tab_loc') == 6 ? 'active' : '' ?>"><a href="#tabsabtu" data-toggle="tab">Sabtu</a></li>
              <li data_tab="7" id="get_data_" class="tab_loc <?php echo $this->session->flashdata('tab_loc') == 7 ? 'active' : '' ?>"><a href="#tabminggu" data-toggle="tab">Minggu</a></li> -->
              <li data_tab="9" id="get_data" class="tab_loc <?php echo $this->session->flashdata('tab_loc') == 9 ? 'active' : '' ?>"><a href="#tabpengaturan" data-toggle="tab">Pengaturan Hari</a></li>
              <li data_tab="10" id="get_data" class="tab_loc <?php echo $this->session->flashdata('tab_loc') == 10 ? 'active' : '' ?>"><a href="#tabkelola" data-toggle="tab">Kelola Jam Belajar</a></li>
              
              <li data_tab="8" id="get_data" class="tab_loc <?php echo $this->session->flashdata('tab_loc') == 8 ? 'active' : '' ?>"><a href="#lihat_data" data-toggle="tab">Lihat Data</a></li>
              
            </ul>
          
                   
            <div class="tab-content" style="padding: 1.5em;">

                  <div class="tab-pane <?php echo $this->session->flashdata('tab_loc') == null || $this->session->flashdata('tab_loc') == 1 ? 'active' : '' ?>" href="#tabsenin" id="tabsenin">

                    <form class="form-horizontal form_head">
                      <div class="form-group">
                        <label class="control-label col-sm-2" for="jamsenin">Pilih jumlah jam:</label>
                        <div class="col-sm-10">
                          <select class="form-control" id="jamsenin">
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
                        <tr id="barissenin<?php echo $i; ?>" class="hidden_tampilan">
                          <td><input type="text" class="form-control" value="<?php echo $i; ?>" style="text-align: center"></td>
                          <td><input type="text" class="form-control" name="jam_ke_senin_<?php echo $i; ?>" value="<?php echo @$hari_rentang['senin'][$i]->jam_ke; ?>" style="text-align: center"></td>
                          <td><input type="time" class="form-control" name="jam_mulai_senin_<?php echo $i; ?>" value="<?php echo @$hari_rentang['senin'][$i]->jam_mulai; ?>"></td>
                          <td><input type="time" class="form-control" name="jam_selesai_senin_<?php echo $i; ?>" value="<?php echo @$hari_rentang['senin'][$i]->jam_selesai; ?>"></td>
                          <td>
                            <a href="<?php echo site_url('kurikulum/delharirentang/'.@$hari_rentang['senin'][$i]->id_rentang_jam.'/1'); ?>" class="btn btn-danger" size="2">Hapus</a>
                          </td>
                        </tr>
                        <?php

                        }
                        ?>                        

                      </tbody>
                    </table>
                    <!-- <button type="submit" class="btn btn-block btn-primary button-action btnedit" > Simpan </button> -->
                    </div>

          


                  <div class="tab-pane <?php echo $this->session->flashdata('tab_loc') == 2 ? 'active' : '' ?>" href="#tabselasa" id="tabselasa">
                    <form class="form-horizontal form_head">
                      <div class="form-group">
                        <label class="control-label col-sm-2" for="jamselasa">Pilih jumlah jam:</label>
                        <div class="col-sm-10">
                          <select class="form-control" id="jamselasa">
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
                        <tr id="barisselasa<?php echo $i; ?>" class="hidden_tampilan">
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
                      <form class="form-horizontal form_head">
                        <div class="form-group">
                          <label class="control-label col-sm-2" for="jamrabu">Pilih jumlah jam:</label>
                          <div class="col-sm-10">
                            <select class="form-control" id="jamrabu">
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
                        <tr id="barisrabu<?php echo $i; ?>" class="hidden_tampilan">
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
                      <form class="form-horizontal form_head">
                        <div class="form-group">
                          <label class="control-label col-sm-2" for="jamkamis">Pilih jumlah jam:</label>
                          <div class="col-sm-10">
                            <select class="form-control" id="jamkamis">
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
                        <tr id="bariskamis<?php echo $i; ?>" class="hidden_tampilan">
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
                      <form class="form-horizontal form_head">
                        <div class="form-group">
                          <label class="control-label col-sm-2" for="jamjumat">Pilih jumlah jam:</label>
                          <div class="col-sm-10">
                            <select class="form-control" id="jamjumat">
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
                        <tr id="barisjumat<?php echo $i; ?>" class="hidden_tampilan">
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
                      <form class="form-horizontal form_head">
                        <div class="form-group">
                          <label class="control-label col-sm-2" for="jamsabtu">Pilih jumlah jam:</label>
                          <div class="col-sm-10">
                            <select class="form-control" id="jamsabtu">
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
                        <tr id="barissabtu<?php echo $i; ?>" class="hidden_tampilan">
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
                      <form class="form-horizontal form_head">
                        <div class="form-group">
                          <label class="control-label col-sm-2" for="jamminggu">Pilih jumlah jam:</label>
                          <div class="col-sm-10">
                            <select class="form-control" id="jamminggu">
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
                        <tr id="barisminggu<?php echo $i; ?>" class="hidden_tampilan">
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
                                  <?php
                                    if (isset($hari_rentang['senin'][$i])) { ?>
                                      <a href="#" data-toggle="tab" class="btn btn-success editharirentangtrigger" data-hari="senin" data-idjamrentang="<?php echo $hari_rentang['senin'][$i]->id_rentang_jam ?>" data-idthajaran="<?php echo $hari_rentang['senin'][$i]->id_tahun_ajaran ?>" data-jammulai="<?php echo $hari_rentang['senin'][$i]->jam_mulai ?>" data-jamselesai="<?php echo $hari_rentang['senin'][$i]->jam_selesai ?>"  size="2">Edit</a>
                                      <a href="<?php echo site_url('kurikulum/delharirentang/'.@$hari_rentang['senin'][$i]->id_rentang_jam.'/7'); ?>" class="btn btn-danger" size="2">Hapus</a> <?php
                                    }
                                  ?>
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

                    <!-- <div class="btn_test">
                      <button type="submit" class="btn btn-primary" > Simpan </button>
                    </div> -->
        
                  
                    <div class="tab-pane <?php echo $this->session->flashdata('tab_loc') == null || $this->session->flashdata('tab_loc') == 1 ? 'active' : '' ?>" href="#tabpengaturan" id="tabpengaturan">
                    <h4><center><b>Pengaturan Hari</b></center></h4>
                    <h5><center><b>Pilihlah Hari Untuk Kelola Jam Belajar</b></center></h5><br>
                    <form id="demo-form2" data-parsley-validate class="form-horizontal form-label-left" method="post" action="<?php echo site_url('kurikulum/savepengaturan'); ?>">  
                    <?php
                      $i=1;
                      foreach ($tabel_pengaturan_hari as $tabel) 
                      { 
                        if ($i < 8) 
                        {
                         ?><input type="checkbox" class="flat" name="nilai<?php echo $tabel->id_pengaturan; ?>" value="1" <?php 
                          if ($tabel->nilai == "1") 
                            { echo " checked"; } ?>>
                            <label><?php echo $tabel->atribut; ?></label><br> 
                          <?php 
                        }
                      }
                      ?>
                       <br>
                      <div class="modal-footer" align="center">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Reset</button>
                        <button type="Save" class="btn btn-success" onclick="return cek();">Aktifkan Hari</button>
                      </div>    
                  </div>

                                                    <!--END TAB PENGATURAN -->
                                                    <!-- START TAB KELOLA -->

                  <div class="tab-pane <?php echo $this->session->flashdata('tab_loc') == null || $this->session->flashdata('tab_loc') == 1 ? 'active' : '' ?>" href="#tabkelola" id="tabkelola">
                  <h4><center><b>Kelola Jam Belajar</b></center></h4><br>
                  <?php
                  if ($settinghari['senin'] == '1') {
                  ?>
                  <form class="form-horizontal form_head">
                  <div class="tab-pane <?php echo $this->session->flashdata('tab_loc') == 8 ? 'active' : '' ?>" href="#tabminggu" id="lihat_data">
                      <div class="box formmapel">
                        <div class="box-header" style="background-color:#5c8a8a">
                          <h3 class="box-title" style="color:white">Jadwal Senin</h3>
                        </div>
                     <!-- <div class="form-group"> -->
                      <!-- <label><b>Senin</b></label><br> -->

                      <div class="box-body">
                          <table class="table table-striped projects">
                            <thead>

                        <label class="control-label col-sm-2" for="jamsenin">Pilih jumlah jam:</label>
                        <div class="col-sm-10">
                          <select class="form-control" id="jamsenin">
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
          
                      </thead>
                    </form> 
                    <div class="box-body">                 
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
                        <tr id="barissenin<?php echo $i; ?>">
                          <td><input type="text" class="form-control" value="<?php echo $i; ?>" style="text-align: center"></td>
                          <td><input type="text" class="form-control" name="jam_ke_senin_<?php echo $i; ?>" value="<?php echo @$hari_rentang['senin'][$i]->jam_ke; ?>" style="text-align: center"></td>
                          <td><input type="time" class="form-control" name="jam_mulai_senin_<?php echo $i; ?>" value="<?php echo @$hari_rentang['senin'][$i]->jam_mulai; ?>"></td>
                          <td><input type="time" class="form-control" name="jam_selesai_senin_<?php echo $i; ?>" value="<?php echo @$hari_rentang['senin'][$i]->jam_selesai; ?>"></td>
                          <td>
                            <a href="<?php echo site_url('kurikulum/delharirentang/'.@$hari_rentang['senin'][$i]->id_rentang_jam.'/1'); ?>" class="btn btn-danger" size="2">Hapus</a>
                          </td>
                        </tr>
                        <?php
                        }
                        ?>                        
</div>
                      </tbody>
                    </table>
                    </div>
                      </div>
                  <?php
                  }
                  ?>
                  <?php
                  if ($settinghari['selasa'] == '1') {
                  ?>
                  <!-- <form class="form-horizontal form_head"> -->
                  <div class="box formmapel">
                        <div class="box-header" style="background-color:#5c8a8a">
                          <h3 class="box-title" style="color:white">Jadwal Selasa</h3>
                        </div>
                        
                        <div class="box-body">
                          <table class="table table-striped projects">
                            <thead>

                      <!-- <div class="form-group">
                      <label><b>Selasa</b></label><br> -->
                        <label class="control-label col-sm-2" for="jamselasa">Pilih jumlah jam:</label>
                        <div class="col-sm-10">
                          <select class="form-control" id="jamselasa">
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
                      </thead>
                    </form>
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
                        <tr id="barisselasa<?php echo $i; ?>">
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
                    </div>
                      </div>
                  <?php
                  }
                  ?>
                  <?php
                  if ($settinghari['rabu'] == '1') {
                  ?>
                  <!-- <form class="form-horizontal form_head"> -->
                  <div class="box formmapel">
                        <div class="box-header" style="background-color:#5c8a8a">
                          <h3 class="box-title" style="color:white">Jadwal Rabu</h3>
                        </div>
                        
                        <div class="box-body">
                          <table class="table table-striped projects">
                            <thead>
                        <!-- <div class="form-group">
                        <label><b>Rabu</b></label><br> -->
                          <label class="control-label col-sm-2" for="jamrabu">Pilih jumlah jam:</label>
                          <div class="col-sm-10">
                            <select class="form-control" id="jamrabu">
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
                        </thead>
                      </form>
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
                        <tr id="barisrabu<?php echo $i; ?>">
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
                    </div>
                      </div>
                  <?php
                  }
                  ?>
                  <?php
                  if ($settinghari['kamis'] == '1') {
                  ?>
                  <!-- <form class="form-horizontal form_head"> -->
                  <div class="box formmapel">
                        <div class="box-header" style="background-color:#5c8a8a">
                          <h3 class="box-title" style="color:white">Jadwal Kamis</h3>
                        </div>
                        
                        <div class="box-body">
                          <table class="table table-striped projects">
                            <thead>
                        <!-- <div class="form-group">
                        <label><b>Kamis</b></label><br> -->
                          <label class="control-label col-sm-2" for="jamkamis">Pilih jumlah jam:</label>
                          <div class="col-sm-10">
                            <select class="form-control" id="jamkamis">
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
                        </thead>
                      </form>
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
                        <tr id="bariskamis<?php echo $i; ?>">
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
                    </div>
                      </div>
                  <?php
                  }
                  ?>
                  <?php
                  if ($settinghari['jumat'] == '1') {
                  ?>
                  <!-- <form class="form-horizontal form_head"> -->
                  <div class="box formmapel">
                        <div class="box-header" style="background-color:#5c8a8a">
                          <h3 class="box-title" style="color:white">Jadwal Jumat</h3>
                        </div>
                        
                        <div class="box-body">
                          <table class="table table-striped projects">
                            <thead>
                        <!-- <div class="form-group">
                        <label><b>Jumat</b></label><br> -->
                          <label class="control-label col-sm-2" for="jamjumat">Pilih jumlah jam:</label>
                          <div class="col-sm-10">
                            <select class="form-control" id="jamjumat">
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
                        </thead>
                      </form>
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
                        <tr id="barisjumat<?php echo $i; ?>">
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
                    </div>
                      </div>
                  <?php
                  }
                  ?>
                  <?php
                  if ($settinghari['sabtu'] == '1') {
                  ?>
                  <!-- <form class="form-horizontal form_head"> -->
                  <div class="box formmapel">
                        <div class="box-header" style="background-color:#5c8a8a">
                          <h3 class="box-title" style="color:white">Jadwal Sabtu</h3>
                        </div>
                        
                        <div class="box-body">
                          <table class="table table-striped projects">
                            <thead>
                        <!-- <div class="form-group">
                        <label><b>Sabtu</b></label><br> -->
                          <label class="control-label col-sm-2" for="jamsabtu">Pilih jumlah jam:</label>
                          <div class="col-sm-10">
                            <select class="form-control" id="jamsabtu">
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
                        </thead>
                      </form>
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
                        <tr id="barissabtu<?php echo $i; ?>">
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
                    </div>
                      </div>
                  <?php
                  }
                  ?>
                  <?php
                  if ($settinghari['minggu'] == '1') {
                  ?>
                  <!-- <form class="form-horizontal form_head"> -->
                  <div class="box formmapel">
                        <div class="box-header" style="background-color:#5c8a8a">
                          <h3 class="box-title" style="color:white">Jadwal Minggu</h3>
                        </div>
                        
                        <div class="box-body">
                          <table class="table table-striped projects">
                            <thead>
                        <!-- <div class="form-group">
                        <label><b>Minggu</b></label><br> -->
                          <label class="control-label col-sm-2" for="jamminggu">Pilih jumlah jam:</label>
                          <div class="col-sm-10">
                            <select class="form-control" id="jamminggu">
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
                        </thead>
                      </form>
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
                        <tr id="barisminggu<?php echo $i; ?>">
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
                    </div>
                      </div>
                  <?php
                  }
                  ?>
                    <!-- <div class="btn_test">
                      <button type="submit" class="btn btn-primary" > Simpan </button>
                    </div>
                  </div> -->
                  <div class="modal-footer" align="center">
                        <button type="submit" class="btn btn-primary">Simpan</button>
                  </div>   

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

  <div class="modal fade modal-harirentang" id="editharirentangmodal" tabindex="-1" role="dialog" aria-labelledby="editharirentangmodal" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-harirentang" role="document">
      <form method="post" action="#" id="formeditjadwal">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLongTitle">Edit Jadwal</h5>
          </div>
          <div class="modal-body">
            <div class="form-group">
              <label for="jammulaieditjadwal">Jam mulai:</label>
              <input type="time" class="form-control" name="jammulaieditjadwal" id="jammulaieditjadwal">
            </div>
            <div class="form-group">
              <label for="jamselesaieditjadwal">Jam selesai:</label>
              <input type="time" class="form-control" name="jamselesaieditjadwal" id="jamselesaieditjadwal">
            </div>
          </div>
          <div class="modal-footer">
            <button type="submit" class="btn btn-primary">Simpan</button>
          </div>
        </div>
      </form>
    </div>
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

      $("#barissenin1").addClass('show_tampilan');
      $("#barisselasa1").addClass('show_tampilan');
      $("#barisrabu1").addClass('show_tampilan');
      $("#bariskamis1").addClass('show_tampilan');
      $("#barisjumat1").addClass('show_tampilan');
      $("#barissabtu1").addClass('show_tampilan');
      $("#barisminggu1").addClass('show_tampilan');
  
      $('#jamsenin').on('change', function() {
        const value = this.value
        
        for(var i = 1; i <= 10; i++) {
          if (i <= value) {
            $(`#barissenin${i}`).addClass('show_tampilan');
          } else {
            $(`#barissenin${i}`).removeClass('show_tampilan');
          }
        }
      });

      $('#jamselasa').on('change', function() {
        const value = this.value
        
        for(var i = 1; i <= 10; i++) {
          if (i <= value) {
            $(`#barisselasa${i}`).addClass('show_tampilan');
          } else {
            $(`#barisselasa${i}`).removeClass('show_tampilan');
          }
        }
      });

      $('#jamrabu').on('change', function() {
        const value = this.value
        
        for(var i = 1; i <= 10; i++) {
          if (i <= value) {
            $(`#barisrabu${i}`).addClass('show_tampilan');
          } else {
            $(`#barisrabu${i}`).removeClass('show_tampilan');
          }
        }
      });

      $('#jamkamis').on('change', function() {
        const value = this.value
        
        for(var i = 1; i <= 10; i++) {
          if (i <= value) {
            $(`#bariskamis${i}`).addClass('show_tampilan');
          } else {
            $(`#bariskamis${i}`).removeClass('show_tampilan');
          }
        }
      });

      $('#jamjumat').on('change', function() {
        const value = this.value
        
        for(var i = 1; i <= 10; i++) {
          if (i <= value) {
            $(`#barisjumat${i}`).addClass('show_tampilan');
          } else {
            $(`#barisjumat${i}`).removeClass('show_tampilan');
          }
        }
      });

      $('#jamsabtu').on('change', function() {
        const value = this.value
        
        for(var i = 1; i <= 10; i++) {
          if (i <= value) {
            $(`#barissabtu${i}`).addClass('show_tampilan');
          } else {
            $(`#barissabtu${i}`).removeClass('show_tampilan');
          }
        }
      });

      $('#jamminggu').on('change', function() {
        const value = this.value
        
        for(var i = 1; i <= 10; i++) {
          if (i <= value) {
            $(`#barisminggu${i}`).addClass('show_tampilan');
          } else {
            $(`#barisminggu${i}`).removeClass('show_tampilan');
          }
        }
      });

      $(".editharirentangtrigger").click(function(e) {
        e.preventDefault()
        var hari = $(this).data('hari')
        var idjamrentang = $(this).data('idjamrentang')
        var idthajaran = $(this).data('idthajaran')
        var jammulai = $(this).data('jammulai')
        var jamselesai = $(this).data('jamselesai')
        var base_url = `<?php echo site_url('kurikulum/editharirentangjadwal'); ?>/${hari}/${idjamrentang}/${idthajaran}`

        $("#jammulaieditjadwal").val(jammulai)
        $("#jamselesaieditjadwal").val(jamselesai)
        $("#formeditjadwal").attr('action', base_url)
        $("#editharirentangmodal").modal('show')
      })

    })
  </script>
  <!-- /.content-wrapper