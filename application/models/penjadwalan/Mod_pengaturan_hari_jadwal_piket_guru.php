<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Mod_pengaturan_hari_jadwal_piket_guru extends CI_Model {

	public function get()
	{
		return $this->db->get('pengaturan_hari_jadwal_piket_guru')->result(); 
	}

	public function insert($data) {
		$this->db->insert('pengaturan_hari_jadwal_piket_guru', $data);
	}

	public function select($id)
	{
		$this->db->where('id_pengaturan', $id);
		return $this->db->get('pengaturan_hari_jadwal_piket_guru')->row(); 
	}

	public function update($data, $id) {
		$this->db->where('id_pengaturan', $id);
		$this->db->update('pengaturan_hari_jadwal_piket_guru', $data);
	}	

	public function delete($id) {
		$this->db->where('id_pengaturan', $id);
		$this->db->delete('pengaturan_hari_jadwal_piket_guru');
	}	
}
