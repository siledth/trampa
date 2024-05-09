<?php

defined('BASEPATH') or exit('No direct script access allowed');

class Productos_model extends CI_Model
{
    public function read_marca()
    {
        $this->db->select("id_marca,desc_marca");
        $query = $this->db->get('public.marca');
        return $result = $query->result_array();


    }
    public function read_und()
    {
        $this->db->select("id_und,desc_und");
        $query = $this->db->get('public.und');
        return $result = $query->result_array();


    }
    public function consultar_prod($data){
        $this->db->select('id_producto,code_p, descripcion,quantity, price_purchase, price_sale');
        $this->db->from('public.producto ');
       // $this->db->join('mov_consig mc', 'm.id_mensualidad = mc.id_mensualidad', 'left');
        $this->db->where('id_producto', $data['id_producto']);
        //$this->db->order_by('public.producto desc');
        $query = $this->db->get();
        $resultado = $query->row_array();
        return $resultado;
    }
    public function save_produc($data1){

        $this->db->select('code_p');
        $this->db->where('code_p', $data1['code_p']);
        $query2 = $this->db->get('public.producto');
        $response2 = $query2->row_array();
        
        $this->db->select('max(e.id_producto) as id');
        $query = $this->db->get('public.producto e');
        $response3 = $query->row_array();

        if ($response2) {
            return 'false';
        }else {
            $id = $response3['id'] + 1 ;
            $data = array(
                'id_producto'		    => $id,
                'code_p'		=> $data1['code_p'],
                'descripcion'		=> $data1['descripcion'],
                'id_und'	 	=> $data1['id_und'],
                'id_marca' 			=> $data1['id_marca'], 
                'quantity' 			=> $data1['quantity'],                    
                'price_purchase' 			=> $data1['price_purchase'],                    
                'price_sale' 			=> $data1['price_sale'],                    
                'status' 			=> $data1['status'],                    
                'id_usuario' 			=> $data1['id_usuario'],                    
                'fecha_creacion' 			=> $data1['fecha_creacion'],                    
               

            );
            // print_r($data);die;

            $this->db->insert("public.producto",$data);
            return true;
        }
    }

    function read_lis(){
        $this->db->select('id_producto,code_p, descripcion,quantity, price_purchase, price_sale');
            // $this->db->where('orn.certificaciones', 0);
            $this->db->from('public.producto');
            $query = $this->db->get();
            return $query->result_array();
    }
    function read_descu(){
        $this->db->select('id_desc, desc_desc, porcentaje');
            // $this->db->where('orn.certificaciones', 0);
            $this->db->from('public.descuento');
            $query = $this->db->get();
            return $query->result_array();
    }

    public function guardar_stock($data){
        
        
        $this->db->select('max(e.id_mov) as id');
        $query = $this->db->get('public.mov_prod   e');
        $response3 = $query->row_array();
        if ($response3){
            $id = $response3['id']+ 1;
        
        $data1 = array('id_mov'     =>  $id,
                        'id_producto'      => $data['id_producto'],
                        'quantity'    => $data['quantity2'],
                        'quantity_ant'    => $data['quantity1'],                       
                        'id_usuario'           => $this->session->userdata('id_user'),
                        'fecha_creacion'        => date('Y-m-d'),
                        'total_stock'    => $data['quantity3'],                       

                    );
        $x = $this->db->insert('mov_prod',$data1);
        //aca modifique
        $data1 = array(
                       // 'quantity' => $data['quantity3'],
                        'price_purchase' => $data['price_purchase1'],
                        'price_sale' => $data['price_sale1'],
                    );
                        
        $this->db->where('id_producto', $data['id_producto']);
        $update = $this->db->update('public.producto', $data1);
        
        
        if ($update= true) {               
            return 1;        
        } else {
            return 0;
        }
        // //return true;
        // return $id;
    }
    } 
    public function get_top_products($limit = 10) {
        $this->db->select('rc.code1, SUM(rc.cantidad) as total_sold, p.descripcion');
        $this->db->from('deta_recibo rc');
        $this->db->join('public.producto p', 'p.code_p = rc.code1');
        $this->db->group_by('rc.code1,p.descripcion');
        $this->db->order_by('total_sold', 'DESC');
        $this->db->limit($limit);
        $query = $this->db->get();
        return $query->result();
    }
}