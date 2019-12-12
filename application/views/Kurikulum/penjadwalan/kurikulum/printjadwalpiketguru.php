
  <style type="text/css">
    @media print {
      body {-webkit-print-color-adjust: exact;}
    }
  </style>
<body onload="window.print();">
  <?php
    foreach ($tabel_tahunajaran as $row_tahunajaran) {
      if ($id_tahun_ajaran == $row_tahunajaran->id_tahun_ajaran) { 
  ?>
  <h3 class="text-center" style="padding: 1em 0;">Jadwal Piket Guru Semester <?= $row_tahunajaran->semester; ?><br> Tahun Ajaran <?= $row_tahunajaran->tahun_ajaran;?> </h3>
  <?php
      } 
    }
  ?>

	<table id="example1" class="table table-bordered table-striped tabelmapel">
                      <thead>
                      <tr class="barishari">
                        <th class="tengah" rowspan="2">No.</th>
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
                        <td class="fit"><?php echo $i; ?>.</td>
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
</body>