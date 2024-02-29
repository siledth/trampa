<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Rutas extends CI_Controller {
    public function consul_estado(){
        if(!$this->session->userdata('session'))redirect('login');
        $data = $this->input->post();
        $data =	$this->Rutas_model->consul_estado($data);
        echo json_encode($data);
    }
    public function listar_municipio(){
		if(!$this->session->userdata('session'))redirect('login');
		$data = $this->input->post();
		$data =	$this->Rutas_model->listar_municipio($data);
		echo json_encode($data);
	}

	public function listar_parroquia(){
		if(!$this->session->userdata('session'))redirect('login');
		$data = $this->input->post();
		$data =	$this->Rutas_model->listar_parroquia($data);
		echo json_encode($data);
	}
    public function llenar_munic(){
        if(!$this->session->userdata('session'))redirect('login');
        $data = $this->input->post();
        $data =	$this->Rutas_model->llenar_munic($data);
        echo json_encode($data);
    }
    public function llenar_parroq(){
        if(!$this->session->userdata('session'))redirect('login');
        $data = $this->input->post();
        $data =	$this->Rutas_model->llenar_parroq($data);
        echo json_encode($data);
    }
	public function create_rutas(){
		if(!$this->session->userdata('session'))redirect('login');
 
		
        $data['list'] = $this->Rutas_model->listar_info_rut();
        $data['estados'] = $this->Configuracion_model->consulta_estados();

		$this->load->view('templates/header.php');
        $this->load->view('templates/navigator.php');
		$this->load->view('Rutas/rut.php', $data);
        $this->load->view('templates/footer.php');
	}
    
	
	public function save_rut() {  
        if (!$this->session->userdata('session'))
            redirect('login');
            
            $data1 = array( // 
                'nombre_ruta' => $this->input->post("nombre_ruta"),
                'id_estado' => $this->input->post("id_estado_n"),
                'id_municipio' => $this->input->post("id_municipio_n"),
                'id_parroquia' => $this->input->post("id_parroquia_n"),
                'direccion' => $this->input->post("direccion"),              
            );
      //  print_r($data1);die;

        $data = $this->Rutas_model->save_rut($data1);
        echo json_encode($data);
    } 

    public function read_list(){
        if(!$this->session->userdata('session'))redirect('login');
        $data = $this->input->post();
        $data =	$this->Rutas_model->read_list($data);
        echo json_encode($data);
    }
    public function llenar_status(){
        if(!$this->session->userdata('session'))redirect('login');
        $data = $this->input->post();
        $data =	$this->Vendedores_model->llenar_status($data);
        echo json_encode($data);
    }
    public function save_modiruta(){
        if(!$this->session->userdata('session'))redirect('login');
        $data = $this->input->post();
        $data =	$this->Rutas_model->save_modiruta($data);
        echo json_encode($data);
    }

    

}