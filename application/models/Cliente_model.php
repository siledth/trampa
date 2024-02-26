<?php

defined('BASEPATH') or exit('No direct script access allowed');

class Cliente_model extends CI_Model
{  public function read_vend()
    {
        $this->db->select("id_vendedor, nombre_vendedor");
        $query = $this->db->get('public.vendedor');
        return $result = $query->result_array();


    }
    public function Consulta_cliente(){
    $this->db->select('c.id_cliente, c.nombre_clien, c.rif_clien');
    $this->db->from('public.cliente c');
   // $this->db->where('desincorporar !=', '0');
    $query = $this->db->get();
    return $result = $query->result_array();
    }

    public function listar_info($data){
        $this->db->select('c.id_cliente, c.nombre_clien, c.rif_clien, c.direccion, c.telefono, c.limitecredito,c.id_vendedor,v.nombre_vendedor');
        $this->db->where('c.id_cliente', $data['matricular']);
       // $this->db->where('desincorporar !=', '0');        
        $this->db->join('vendedor v', 'v.id_vendedor = c.id_vendedor', 'left');    
        $query = $this->db->get('public.cliente c');
        return $query->row_array();
    }
    public function listar_info_clien(){
        $this->db->select('c.id_cliente, c.nombre_clien, c.rif_clien,c.direccion,c.id_vendedor,v.nombre_vendedor');
    $this->db->from('public.cliente c');
    $this->db->join('vendedor v', 'v.id_vendedor = c.id_vendedor', 'left');    
    
    $query = $this->db->get();
    return $result = $query->result_array();
     }

     public function save_client($data1){

        $this->db->select('rif_clien');
        $this->db->where('rif_clien', $data1['rif_clien']);
        $query2 = $this->db->get('public.cliente');
        $response2 = $query2->row_array();
        
        $this->db->select('max(e.id_cliente) as id');
        $query = $this->db->get('public.cliente e');
        $response3 = $query->row_array();

        if ($response2) {
            return 'false';
        }else {
            $id = $response3['id'] + 1 ;
            $data = array(
                'id_cliente'		    => $id,
                'rif_clien'		=> $data1['rif_clien'],
                'nombre_clien'		=> $data1['nombre_clien'],
                'direccion'	 	=> $data1['direccion'],
                'telefono' 			=> $data1['telefono'], 
                'limitecredito' 			=> $data1['limitecredito'],                    
                'id_vendedor' 			=> $data1['id_vendedor'],                    
                'status' 			=> $data1['status'],                    
                'id_usuario' 			=> $data1['id_usuario'],                    
                'fecha_creacion' 			=> $data1['fecha_creacion'],                    
               

            );
            // print_r($data);die;

            $this->db->insert("public.cliente",$data);
            return true;
        }
    }

    public function read_list($data){
        $this->db->select('c.id_cliente, c.nombre_clien, c.rif_clien, c.direccion, c.telefono, c.limitecredito,c.id_vendedor,v.nombre_vendedor');
        $this->db->where('c.id_cliente', $data['id_cliente']);
        $this->db->join('vendedor v', 'v.id_vendedor = c.id_vendedor', 'left');    

		$this->db->from('public.cliente c');
 		// $this->db->order_by('mc.id_p_items desc');
		$query = $this->db->get();
		$resultado = $query->row_array();
		return $resultado;
	}
    public function llenar_vende($data){
        $this->db->select("id_vendedor, nombre_vendedor");
      //  $this->db->where('pi2.id !=', $data['id_estado']);
        $query = $this->db->get('public.vendedor');
        return $query->result_array();
    }
    public function save_modif_org1($data){

        $this->db->where('id_cliente', $data['id_cliente']);
    
        $pp_s = $data['cambio_edo'];
        if ($pp_s == 0) {
            $id_vendedor = $data['id_vendedor'];
        }else {
            $id_vendedor = $data['cambio_edo'];
        } 
       
        $data1 = array(
            'nombre_clien'        => $data['nombre_clien'],
            
            'id_vendedor'          => $id_vendedor,
           
            'direccion'         => $data['direccion'],
            'telefono'         => $data['telefono'],
            'limitecredito'         => $data['limitecredito'],

            
                
           
    
    
        );
        $update = $this->db->update('public.cliente', $data1);
        return true;
    }
}