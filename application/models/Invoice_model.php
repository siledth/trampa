<?php
        class Invoice_model extends CI_Model {

            public function __construct() {
                parent::__construct();
                $this->load->database();
            }
        
            public function get_invoice_details($id) {
                $this->db->select('code1, cantidad');
                $this->db->from('public.deta_recibo');
                $this->db->where('id_fact', $id);
                $query = $this->db->get();
                return $query->result_array();
            }
        
            public function annul_invoice($id) {
                $invoice_details = $this->get_invoice_details($id);
                foreach ($invoice_details as $detail) {
                    $code_p = $detail['code1'];
                    $quantity = $this->get_product_quantity($code_p) + $detail['cantidad'];
                    $this->update_product_quantity($code_p, $quantity);
                }
                // $this->db->where('id_fact', $id);
                // $this->db->delete('public.deta_recibo');
                $this->db->where('id', $id);
                $data1 = array('id_status' => '5',  
                                'tipo_pago' => '5',
                                'forma_pago' => '5',              
                
                        'fecha_update' => date('Y-m-d h:i:s'));
                $this->db->where('id', $id);
                $update = $this->db->update('public.recibo', $data1);


                //$this->db->delete('public.recibo');
            }
        
            public function get_product_quantity($code_p) {
                $this->db->select('quantity');
                $this->db->from('public.producto');
                $this->db->where('code_p', $code_p);
                $query = $this->db->get();
                $result = $query->row_array();
                return $result['quantity'];
            }
        
            public function update_product_quantity($code_p, $quantity) {
                $data = array(
                    'quantity' => $quantity
                );
                $this->db->where('code_p', $code_p);
                $this->db->update('public.producto', $data);
            }
        }
