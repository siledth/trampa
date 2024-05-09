<?php
    class Factura_model extends CI_model{
        
        public function cons_nro_factura(){
            $this->db->select('id');
            $this->db->order_by('r.id desc');
            $query = $this->db->get('recibo r');
            $response = $query->row_array();
            return $response;
        }
        public function cons_nro_compra(){
            $this->db->select('id');
            $this->db->order_by('r.id desc');
            $query = $this->db->get('compras r');
            $response = $query->row_array();
            return $response;
        }
    public function save_recibo($acc_cargar,$dato1,$p_items){
            
        $this->db->select('max(e.nro_factura) as id1');
        $query1 = $this->db->get('public.recibo e');
        $response4 = $query1->row_array();
        $id1 = $response4['id1'] + 1 ;
    
        $data1 = array(
            'id'		    => $id1,
            'nro_factura' => $dato1['nro_factura'],
            'id_cliente' => $dato1['id_cliente'],

            'nombre' => $dato1['nombre'],
            'cedula' => $dato1['cedula'],
            'tele_1' => $dato1['tele_1'],
            'total_iva' => $dato1['total_iva'],
            'total_mas_iva'=>  $dato1['total_mas_iva'],
            'total_bs'=>  $dato1['total_bs'],
            'fecha_crear'=> $dato1['fecha_crear'],
           'id_status' => $dato1['id_status'],
           'fecha_update' => $dato1['fecha_update'],
           'tipo_pago' => $dato1['tipo_pago'],  
           'forma_pago' => $dato1['forma_pago'],    


    
        );
        $quers =$this->db->insert("public.recibo", $data1);
            if ($quers) {
                $cant_proy = $p_items['cantidad'];
                $count_prog = count($cant_proy);
                for ($i=0; $i < $count_prog; $i++) {
                    // $tarifas = $p_items['tarifa'][$i];
                    // $explode = explode('/', $tarifas);
                    // $tarifa = $explode['0'];
                    // $id_tarifa = $explode['1'];

                    $data1 = array(
                        'id'        => $id1,
                        'cedula'   		 => $p_items['cedula'][$i],
                        'code1'      => $p_items['code1'][$i],
                        'cantidad'      => $p_items['cantidad'][$i],
                        'cot_u'         => $p_items['cot_u'][$i],
                        'sub_t' 	         => $p_items['sub_t'][$i],
                        'id_des' => $p_items['id_des'][$i],
                        't_desc' => $p_items['t_desc'][$i],
                        'total' 	     => $p_items['total'][$i],
                        'id_fact' 	     => $dato1['nro_factura'],
                        'id_cliente' 	     => $dato1['id_cliente'],

                        

                    );
                    $quert = $this->db->insert('public.deta_recibo', $data1);
                }
            }
            //return true;
            return $id1;
        

    
    }

     function ver_recibo($data){
        //print_r($data);die;
        $this->db->select("f.*,
                        e.id_status,                        
                        e.descripcion as estatus, 
                      p.descripcion as tipo_p,
                      p.id_tipo_pago, c.direccion, v.nombre_vendedor");
        $this->db->join('estatus e', 'e.id_status = f.id_status');
        $this->db->join('tipopago p', 'p.id_tipo_pago = f.tipo_pago');
        $this->db->join('public.cliente c', 'c.rif_clien = f.cedula');
        $this->db->join('public.vendedor v', 'v.id_vendedor = c.id_vendedor');
        


        $this->db->where('f.id',$data);
        $query = $this->db->get('recibo f');
        return $result = $query->row_array();
    }
    function ver_recibo_tabla($data){
        //print_r($data);die;
        $this->db->select("df.*,  p.descripcion as product");
        $this->db->join('public.producto p', 'p.code_p = df.code1', 'left');
        $this->db->where('df.id_fact',$data);
        $query = $this->db->get('deta_recibo df');
        return $result = $query->result_array();
    }
    function consulta_recibo(){
        $this->db->select('m.*,e.descripcion as estatus');
        $this->db->from('public.recibo m');  
        //$this->db->join('proveedor b', 'b.id_proveedor = m.id_proveedor ');
        $this->db->join('estatus e', 'e.id_status = m.forma_pago');
        //$this->db->where('m.tipo_pago', 4);
        // $this->db->where('m.forma_pago', 0);
        $this->db->order_by("m.id", "asc");
        $query = $this->db->get();
        $resultado = $query->result_array();
       return $resultado;

    }
    public function save_compra($acc_cargar,$dato1,$p_items){
       
     

        $this->db->select('max(e.nro_factura) as id1');
        $query1 = $this->db->get('public.compras e');
        $response4 = $query1->row_array();
        if ($response4 === null) {
            $id1 = '1';
        }else{
            $id1 = $response4['id1'] + 1 ;
        }
       
    
        $data1 = array(
            'id'		    => $id1,
            'nro_factura' => $dato1['nro_factura'],
            'id_proveedor' => $dato1['id_proveedor'],
            'n_fac_proveedor' => $dato1['n_fac_proveedor'],

            //'cedula' => $dato1['cedula'],
           // 'tele_1' => $dato1['tele_1'],
            'total_iva' => $dato1['total_iva'],
            'total_mas_iva'=>  $dato1['total_mas_iva'],
            'total_bs'=>  $dato1['total_bs'],
            //'fecha_crear'=> $dato1['fecha_crear'],
           'id_status' => $dato1['id_status'],
           'fecha_update' => $dato1['fecha_update'],
           'tipo_pago' => $dato1['tipo_pago'],  
           'forma_pago' => $dato1['forma_pago'],    

    
        );
        $quers =$this->db->insert("public.compras", $data1);
            if ($quers) {
                $cant_proy = $p_items['cantidad'];
                $count_prog = count($cant_proy);
                for ($i=0; $i < $count_prog; $i++) {
                    // $tarifas = $p_items['tarifa'][$i];
                    // $explode = explode('/', $tarifas);
                    // $tarifa = $explode['0'];
                    // $id_tarifa = $explode['1'];

                    $data1 = array(
                        'id'        => $id1,
                        'cedula'   		 => $p_items['cedula'][$i],
                        'code1'      => $p_items['code1'][$i],
                        'cantidad'      => $p_items['cantidad'][$i],
                        'cot_u'         => $p_items['cot_u'][$i],
                        'sub_t' 	         => $p_items['sub_t'][$i],
                        'id_des' => $p_items['id_des'][$i],
                        't_desc' => $p_items['t_desc'][$i],
                        'total' 	     => $p_items['total'][$i],
                        'id_fact' 	     => $dato1['nro_factura'],
                        

                    );
                    $quert = $this->db->insert('public.deta_compra', $data1);
                }
            }
            //return true;
            return $id1;
        

    
    }

    function ver_comprs1($data){
        //print_r($data);die;
        $this->db->select("f.*,
                        e.id_status,                        
                        e.descripcion as estatus,
                      p.descripcion as tipo_p,
                      p.id_tipo_pago ,pr.nombre_proveedor, pr.rif_proveedor, pr,direccion");
        $this->db->join('proveedor pr', 'pr.id_proveedor = f.id_proveedor' );
        $this->db->join('estatus e', 'e.id_status = f.id_status' );
        $this->db->join('tipopago p', 'p.id_tipo_pago = f.tipo_pago');
        $this->db->where('f.id',$data);
        $query = $this->db->get('compras f');
        return $result = $query->row_array();
    }
    function ver_recibo_tabla_compra($data){
        //print_r($data);die;
        $this->db->select("df.*,  p.descripcion as product");
        $this->db->join('public.producto p', 'p.code_p = df.code1', 'left');
        $this->db->where('df.id_fact',$data);
        $query = $this->db->get('deta_compra df');
        return $result = $query->result_array();
    }
    
    function consulta_compra(){
        $this->db->select("f.*, p.nombre_proveedor");    
        $this->db->join('public.proveedor p', 'p.id_proveedor = f.id_proveedor', 'left');

        $query = $this->db->get('compras f');
   
        return $result = $query->result_array();

    }
    function ver_recibocompra($data){
        //print_r($data);die;
        $this->db->select("f.*,c.nombre_proveedor,c.rif_proveedor, e.id_status,                        
        e.descripcion as estatus,
      p.descripcion as tipo_p,
                        ");
        $this->db->join('estatus e', 'e.id_status = f.id_status');
        $this->db->join('tipopago p', 'p.id_tipo_pago = f.tipo_pago');
        $this->db->join('public.proveedor c', 'c.id_proveedor = f.id_proveedor');
      //  $this->db->join('public.vendedor v', 'v.id_vendedor = c.id_vendedor');
        


        $this->db->where('f.id',$data);
        $query = $this->db->get('compras f');
        return $result = $query->row_array();
    }
    function ver_recibo_tabla_compras($data){
        //print_r($data);die;
        $this->db->select("df.*,  p.descripcion as product");
        $this->db->join('public.producto p', 'p.code_p = df.code1', 'left');
        $this->db->where('df.id',$data);
        $query = $this->db->get('public.deta_compra df');
        return $result = $query->result_array();
    }
}