<?php

defined('BASEPATH') or exit('No direct script access allowed');

class Rutas_model extends CI_Model

{ 
    public function listar_municipio($data){
        $response = array();
        $this->db->select('*');
        $this->db->where('estado_id', $data['id_estado']);
        $query = $this->db->get('public.municipios');
        $response = $query->result_array();
        return $response;
    }

    public function listar_parroquia($data){
        $response = array();
        $this->db->select('*');
        $this->db->where('id_municipio', $data['id_municipio']);
        $query = $this->db->get('public.parroquias');
        $response = $query->result_array();
        return $response;
    }

    public function llenar_munic($data){
        $this->db->select('pi2.id, pi2.estado_id,  pi2.descmun');
        $this->db->where('pi2.estado_id =', $data['id_edos']);
        $query = $this->db->get('public.municipios pi2');
        return $result = $query->result_array();
    }
    public function llenar_parroq($data){
        $this->db->select('pi2.id, pi2.estado_id, pi2.descparro, pi2.id_municipio');
        $this->db->where('pi2.id_municipio =', $data['id_edos']);
        $query = $this->db->get('public.parroquias pi2');
        return $result = $query->result_array();
    }


public function read_vend()
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
    public function listar_info_rut(){
        $this->db->select('r.id as id_ruta, r.nombre_ruta, r.id_estado, r.id_municipio, r.id_parroquia, r.direccion, e.descedo, 
                            m.descmun,p.descparro');
    $this->db->from('public.rutas r');
    $this->db->join('estados e', 'e.id = r.id_estado');  
    $this->db->join('municipios m', 'm.id = r.id_municipio');    
    $this->db->join('parroquias p', 'p.id = r.id_parroquia');  
    $query = $this->db->get();
    return $result = $query->result_array();
     }

     public function save_rut($data1){

        $this->db->select('nombre_ruta');
        $this->db->where('nombre_ruta', $data1['nombre_ruta']);
        $query2 = $this->db->get('public.rutas');
        $response2 = $query2->row_array();
        
        $this->db->select('max(e.id) as id');
        $query = $this->db->get('public.rutas e');
        $response3 = $query->row_array();

        if ($response2) {
            return 'false';
        }else {
            $id = $response3['id'] + 1 ;
            $data = array(
                'id'		    => $id,
                'nombre_ruta'		=> $data1['nombre_ruta'],
                'id_estado'		=> $data1['id_estado'],
                'id_municipio'	 	=> $data1['id_municipio'],
                'id_parroquia' 			=> $data1['id_parroquia'],   
                'direccion' 			=> $data1['direccion'],   

                // 'status' 			=> $data1['status'],                    
                // 'id_usuario' 			=> $data1['id_usuario'],                    
                // 'fecha_creacion' 			=> $data1['fecha_creacion'],                      
               

            );
            // print_r($data);die;

            $this->db->insert("public.rutas",$data);
            return true;
        }
    }

    public function read_list($data){
        $this->db->select('r.id as id_ruta, r.nombre_ruta, r.id_estado, 
        r.id_municipio, r.id_parroquia, r.direccion, e.descedo, 
        m.descmun,p.descparro');
        $this->db->where('r.id', $data['id_ruta']);
        $this->db->join('estados e', 'e.id = r.id_estado');  
        $this->db->join('municipios m', 'm.id = r.id_municipio');    
        $this->db->join('parroquias p', 'p.id = r.id_parroquia');    
	    $this->db->from('public.rutas r');
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
    public function consul_estado($data){
        $this->db->select("id, descedo");
      //  $this->db->where('pi2.id !=', $data['id_estado']);
        $query = $this->db->get('public.estados');
        return $query->result_array();
    }
    public function save_modiruta($data){

        $this->db->where('id', $data['id']);
    
        $pp_s = $data['cambio_edo'];
        if ($pp_s == 0) {
            $id_estado = $data['id_estado'];
        }else {
            $id_estado = $data['cambio_edo'];
        }
    
        $ccnu_s = $data['camb_muni'];
        if ($ccnu_s == 0) {
            $id_municipio = $data['id_municipio'];
        }else {
            $id_municipio = $data['camb_muni'];
        }
        $alcance = $data['camb_parrq'];
        if ($alcance == 0) {
            $id_parroquia = $data['id_parroquia'];
        }else {
            $id_parroquia = $data['camb_parrq'];
        }  
       
    
        $data1 = array(
            'nombre_ruta'        => $data['nombre_ruta'],
            'id_estado'          => $id_estado,
            'id_municipio'          => $id_municipio,
            'id_parroquia'          => $id_parroquia,
            'direccion'         => $data['direccion'],
           
    
    
        );
        $update = $this->db->update('public.rutas', $data1);
        return true;
    }
}