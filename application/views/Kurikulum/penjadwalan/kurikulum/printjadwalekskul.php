
  <style type="text/css">
    @media print {
      body {-webkit-print-color-adjust: exact;}
    }
  </style>
<body onload="window.print();">

  <h3 class="text-center" style="padding: 1em 0;">Jadwal Ekstrakurikuler</h3>

	<table id="example1" class="table table-bordered table-striped tabelmapel">
                      <thead>
                      <tr class="barishari">
                        <th class="tengah" rowspan="2">No.</th>
                        <th >Hari</th>
                        <th class="tengah">Jam Mulai</th>
                        <th class="tengah">Jam Selesai</th>
                        <th class="tengah">Jenis Ekstrakurikuler</th>
                        <th class="tengah">Tempat</th>
                        <th class="tengah">Pembimbing</th>
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
	                    </tr>
	                <?php } ?>
                      </tbody>

                    </table>
</body>