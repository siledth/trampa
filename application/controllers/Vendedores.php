<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Vendedores extends CI_Controller {

	public function create_vend(){
		if(!$this->session->userdata('session'))redirect('login');
		$data['read'] = $this->Cliente_model->read_vend();
		
        $data['list'] = $this->Vendedores_model->listar_info_vend();

		$this->load->view('templates/header.php');
        $this->load->view('templates/navigator.php');
		$this->load->view('vendedores/vend.php', $data);
        $this->load->view('templates/footer.php');
	}
    
	
	public function save_vend() {  
        if (!$this->session->userdata('session'))
            redirect('login');
            
            $data1 = array( // 
                'rif_vendedor' => $this->input->post("rif"),
                'nombre_vendedor' => $this->input->post("nombre_vend"),
                'direccion' => $this->input->post("direccion_fiscal"),
                'telefono' => $this->input->post("telefono"),
                'status' => 1,
				'id_usuario' => $this->session->userdata('id_user'),
                'fecha_creacion' => date("Y-m-d"),                
            );
      //  print_r($data1);die;

        $data = $this->Vendedores_model->save_vend($data1);
        echo json_encode($data);
    } 

    public function read_list(){
        if(!$this->session->userdata('session'))redirect('login');
        $data = $this->input->post();
        $data =	$this->Vendedores_model->read_list($data);
        echo json_encode($data);
    }
    public function llenar_status(){
        if(!$this->session->userdata('session'))redirect('login');
        $data = $this->input->post();
        $data =	$this->Vendedores_model->llenar_status($data);
        echo json_encode($data);
    }
    public function save_modif_org1(){
        if(!$this->session->userdata('session'))redirect('login');
        $data = $this->input->post();
        $data =	$this->Vendedores_model->save_modif_org1($data);
        echo json_encode($data);
    }
}