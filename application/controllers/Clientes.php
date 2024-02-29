<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Clientes extends CI_Controller {

	public function create_cl(){
		if(!$this->session->userdata('session'))redirect('login');
		$data['read'] = $this->Cliente_model->read_vend();
		$data['ruta'] = $this->Cliente_model->read_ruta();
		
        $data['list'] = $this->Cliente_model->listar_info_clien();

		$this->load->view('templates/header.php');
        $this->load->view('templates/navigator.php');
		$this->load->view('cliente/client.php', $data);
        $this->load->view('templates/footer.php');
	}
    
	
	public function save_client() {  
        if (!$this->session->userdata('session'))
            redirect('login');
            
            $data1 = array( // 
                'rif_clien' => $this->input->post("rif"),
                'nombre_clien' => $this->input->post("nombre_clien"),
                'direccion' => $this->input->post("direccion_fiscal"),
                'telefono' => $this->input->post("telefono"),
                'limitecredito' => $this->input->post("limitecredito"),
                'id_vendedor' => $this->input->post("id_vendedor"), 
                'status' => 1,
				'id_usuario' => $this->session->userdata('id_user'),
                'id_ruta' => $this->input->post("id_ruta"),
                
                'fecha_creacion' => date("Y-m-d"),                
            );
      //  print_r($data1);die;

        $data = $this->Cliente_model->save_client($data1);
        echo json_encode($data);
    } 

    public function read_list(){
        if(!$this->session->userdata('session'))redirect('login');
        $data = $this->input->post();
        $data =	$this->Cliente_model->read_list($data);
        echo json_encode($data);
    }
    public function llenar_vende(){
        if(!$this->session->userdata('session'))redirect('login');
        $data = $this->input->post();
        $data =	$this->Cliente_model->llenar_vende($data);
        echo json_encode($data);
    }
    public function llenar_ruta(){
        if(!$this->session->userdata('session'))redirect('login');
        $data = $this->input->post();
        $data =	$this->Cliente_model->llenar_ruta($data);
        echo json_encode($data);
    }
    public function save_modif_org1(){
        if(!$this->session->userdata('session'))redirect('login');
        $data = $this->input->post();
        $data =	$this->Cliente_model->save_modif_org1($data);
        echo json_encode($data);
    }
}