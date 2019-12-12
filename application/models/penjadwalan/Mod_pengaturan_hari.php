 <?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Mod_pengaturan_hari extends CI_Model {

	public function get()
	{
		return $this->db->get('pengaturan_hari')->result(); 
	}

	public function insert($data) {
		$this->db->insert('pengaturan_hari', $data);
	}

	public function select($id)
	{
		$this->db->where('id_pengaturan', $id);
		return $this->db->get('pengaturan_hari')->row(); 
	}

	public function update($data, $id) {
		$this->db->where('id_pengaturan', $id);
		$this->db->update('pengaturan_hari', $data);
	}	

	public function delete($id) {
		$this->db->where('id_pengaturan', $id);
		$this->db->delete('pengaturan_hari');
	}	
}
