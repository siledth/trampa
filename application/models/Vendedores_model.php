<?php

defined('BASEPATH') or exit('No direct script access allowed');

class Vendedores_model extends CI_Model
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
    public function listar_info_vend(){
        $this->db->select('id_vendedor, nombre_vendedor, rif_vendedor, direccion, telefono, status,');
    $this->db->from('public.vendedor ');
   // $this->db->join('vendedor v', 'v.id_vendedor = c.id_vendedor', 'left');    
    $query = $this->db->get();
    return $result = $query->result_array();
     }

     public function save_vend($data1){

        $this->db->select('rif_vendedor');
        $this->db->where('rif_vendedor', $data1['rif_vendedor']);
        $query2 = $this->db->get('public.vendedor');
        $response2 = $query2->row_array();
        
        $this->db->select('max(e.id_vendedor) as id');
        $query = $this->db->get('public.vendedor e');
        $response3 = $query->row_array();

        if ($response2) {
            return 'false';
        }else {
            $id = $response3['id'] + 1 ;
            $data = array(
                'id_vendedor'		    => $id,
                'rif_vendedor'		=> $data1['rif_vendedor'],
                'nombre_vendedor'		=> $data1['nombre_vendedor'],
                'direccion'	 	=> $data1['direccion'],
                'telefono' 			=> $data1['telefono'],   
                'status' 			=> $data1['status'],                    
                'id_usuario' 			=> $data1['id_usuario'],                    
                'fecha_creacion' 			=> $data1['fecha_creacion'],                    
               

            );
            // print_r($data);die;

            $this->db->insert("public.vendedor",$data);
            return true;
        }
    }

    public function read_list($data){
        $this->db->select('v.nombre_vendedor, v.rif_vendedor, v.direccion, v.telefono, v.status, e.descripcion');
        $this->db->where('id_vendedor', $data['id_vendedor']);
        $this->db->join('estatus_act_inact e', 'e.id_stat_act = v.status', 'left');    

		$this->db->from('public.vendedor v');
 		// $this->db->order_by('mc.id_p_items desc');
		$query = $this->db->get();
		$resultado = $query->row_array();
		return $resultado;
	}
    public function llenar_status($data){
        $this->db->select("id_stat_act, descripcion");
      //  $this->db->where('pi2.id !=', $data['id_estado']);
        $query = $this->db->get('public.estatus_act_inact');
        return $query->result_array();
    }
    public function save_modif_org1($data){

        $this->db->where('id_vendedor', $data['id_vendedor']);
    
        $pp_s = $data['cambio_edo'];
        if ($pp_s == 0) {
            $status = $data['id_status'];
        }else {
            $status = $data['cambio_edo'];
        } 
       
        $data1 = array(
            'nombre_vendedor'        => $data['nombre_vendedor'],
            
            'status'          => $status,
           
            'direccion'         => $data['direccion'],
            'telefono'         => $data['telefono'],
        );
        $update = $this->db->update('public.vendedor', $data1);
        return true;
    }
}