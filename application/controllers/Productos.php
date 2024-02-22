<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Productos extends CI_Controller {

	public function Stock_model(){
		if(!$this->session->userdata('session'))redirect('login');
		$data['marca'] = $this->Productos_model->read_marca();
        $data['und'] = $this->Productos_model->read_und();
        $data['list'] = $this->Productos_model->read_lis();
        $data['time']=date("d-m-Y");

		$this->load->view('templates/header.php');
        $this->load->view('templates/navigator.php');
		$this->load->view('productos/productos.php', $data);
        $this->load->view('templates/footer.php');
	}
    
	
	public function save_produc() {  
        if (!$this->session->userdata('session'))
            redirect('login');
            
            $data1 = array( // 
                'code_p' => $this->input->post("code_p"),
                'descripcion' => $this->input->post("descripcion"),
                'id_und' => $this->input->post("id_und"),
                'id_marca' => $this->input->post("id_marca"),
                'quantity' => $this->input->post("quantity"),
                'price_purchase' => $this->input->post("price_purchase"),
                'price_sale' => $this->input->post("price_sale"),
                'status' => 1,
				'id_usuario' => $this->session->userdata('id_user'),
                'fecha_creacion' => date("Y-m-d"),                
            );
      //  print_r($data1);die;

        $data = $this->Productos_model->save_produc($data1);
        echo json_encode($data);
    } 
    public function consultar_prod(){
        if(!$this->session->userdata('session'))redirect('login');
        $data = $this->input->post();
        $data =	$this->Productos_model->consultar_prod($data);
        echo json_encode($data);
    }

    public function guardar_stock(){
        if(!$this->session->userdata('session'))redirect('login');
        $data['time']=date("d-m-Y");
        $data = $this->input->post();
        $data =	$this->Productos_model->guardar_stock($data);
        echo json_encode($data);
    }
}