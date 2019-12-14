<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Mod_pengaturan_jam_mengajar extends CI_Model {

	public function get()
	{
		return $this->db->get('pengaturan_jam_mengajar')->result(); 
	}

	public function insert($data) {
		$this->db->insert('pengaturan_jam_mengajar', $data);
	}

	public function select($id)
	{
		$this->db->where('id_pengaturan_jam_mengajar', $id);
		return $this->db->get('pengaturan_jam_mengajar')->row(); 
	}

	public function update($data, $id) {
		$this->db->where('id_pengaturan_jam_mengajar', $id);
		$this->db->update('pengaturan_jam_mengajar', $data);
	}	

	public function delete($id) {
		$this->db->where('id_pengaturan_jam_mengajar', $id);
		$this->db->delete('pengaturan_jam_mengajar');
	}	
}
