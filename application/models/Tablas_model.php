<?php

class Tablas_model extends CI_Model {

    //________FUENTE DE FINANCIAMIENTO_____________
    public function get_entries() {
        $query = $this->db->get('programacion.fuente_financiamiento');
        if (count($query->result()) > 0) {
            return $query->result();
        }
    }

    public function saves($data) {
        return $this->db->insert('programacion.fuente_financiamiento', $data);
    }

    public function delete_entry($id) {
        return $this->db->delete('programacion.fuente_financiamiento', array('id_fuente_financiamiento' => $id));
    }

    public function single_entry($id) {
        $this->db->select('*');
        $this->db->from('programacion.fuente_financiamiento');
        $this->db->where('id_fuente_financiamiento', $id);
        $query = $this->db->get();
        if (count($query->result()) > 0) {
            return $query->row();
        }
    }

    public function update_entry($data) {
        return $this->db->update('programacion.fuente_financiamiento', $data, array('id_fuente_financiamiento' => $data['id_fuente_financiamiento']));
    }

    //____________ALICUOTA______________________
    public function get_alicuota() {
        $query = $this->db->get('public.alicuota_iva');
        // if (count($query->result()) > 0) {
        return $query->result();
        // }
    }

    public function savesalicuota($data) {
        return $this->db->insert('public.alicuota_iva', $data);
    }

    public function delete_alicuota($id) {
        return $this->db->delete('public.alicuota_iva', array('id_alicuota_iva' => $id));
    }

    public function single_alicuota($id) {
        $this->db->select('*');
        $this->db->from('public.alicuota_iva');
        $this->db->where('id_alicuota_iva', $id);
        $query = $this->db->get();
        if (count($query->result()) > 0) {
            return $query->row();
        }
    }

    public function update_alicuota($data) {
        return $this->db->update('public.alicuota_iva', $data, array('id_alicuota_iva' => $data['id_alicuota_iva']));
    }

    //_________________PARTIDA PRESUPUESTARIA _________________________________________________
    public function get_partidap() {
        $query = $this->db->get('programacion.partida_presupuestaria');
        // if (count($query->result()) > 0) {
        return $query->result();
        // }
    }

    public function savepartidap($data) {
        return $this->db->insert('programacion.partida_presupuestaria', $data);
    }

    public function delete_partidap($id) {
        return $this->db->delete('programacion.partida_presupuestaria', array('id_partida_presupuestaria' => $id));
    }

    public function single_partidap($id) {
        $this->db->select('*');
        $this->db->from('programacion.partida_presupuestaria');
        $this->db->where('id_partida_presupuestaria', $id);
        $query = $this->db->get();
        if (count($query->result()) > 0) {
            return $query->row();
        }
    }

    public function update_partidap($data) {
        return $this->db->update('programacion.partida_presupuestaria', $data, array('id_partida_presupuestaria' => $data['id_partida_presupuestaria']));
    }

    //______________ACCION CENTRALIZADA______________________
    public function get_centra() {
        $query = $this->db->get('programacion.accion_centralizada');
        // if (count($query->result()) > 0) {
        return $query->result();
        // }
    }

    public function savecentra($data) {
        return $this->db->insert('programacion.accion_centralizada', $data);
    }

    public function delete_centra($id) {
        return $this->db->delete('programacion.accion_centralizada', array('id_accion_centralizada' => $id));
    }

    public function single_centra($id) {
        $this->db->select('*');
        $this->db->from('programacion.accion_centralizada');
        $this->db->where('id_accion_centralizada', $id);
        $query = $this->db->get();
        if (count($query->result()) > 0) {
            return $query->row();
        }
    }

    public function update_centra($data) {
        return $this->db->update('programacion.accion_centralizada', $data, array('id_accion_centralizada' => $data['id_accion_centralizada']));
    }

    //_______________UNIDAD DE MEDIDA _____________
    public function get_und() {
        $query = $this->db->get('public.tipobarco');
        // if (count($query->result()) > 0) {
        return $query->result();
        // }
    }

    public function save_und($data) {
        return $this->db->insert('public.tipobarco', $data);
    }

    public function delete_und($id) {
        return $this->db->delete('public.tipobarco', array('id_tipobarco' => $id));
    }

    public function single_und($id) {
        $this->db->select('*');
        $this->db->from('public.tipobarco');
        $this->db->where('id_tipobarco', $id);
        $query = $this->db->get();
        if (count($query->result()) > 0) {
            return $query->row();
        }
    }

    public function update_und($data) {
        return $this->db->update('public.tipobarco', $data, array('id_tipobarco' => $data['id_tipobarco']));
    }

    //_____________________CCNU____________________

    public function get_ccnu() {
        $query = $this->db->get('programacion.ccnu');
        if (count($query->result()) > 0) {
            return $query->result();
        }
    }

    public function save_ccnu($data) {
        return $this->db->insert('programacion.ccnu', $data);
    }

    public function delete_ccnu($id) {
        return $this->db->delete('programacion.ccnu', array('id_ccnu' => $id));
    }

    public function single_ccnu($id) {
        $this->db->select('*');
        $this->db->from('programacion.ccnu');
        $this->db->where('id_ccnu', $id);
        $query = $this->db->get();
        if (count($query->result()) > 0) {
            return $query->row();
        }
    }

    public function update_ccnu($data) {
        return $this->db->update('programacion.ccnu', $data, array('id_ccnu' => $data['id_ccnu']));
    }

//_______ESTADO CRUD___________________________________________________
    public function get_estado() {
        $query = $this->db->get('public.estados');
        if (count($query->result()) > 0) {
            return $query->result();
        }
    }

    public function save_estado($data) {
        return $this->db->insert('public.estados', $data);
    }

    public function single_estado($id) {
        $this->db->select('*');
        $this->db->from('public.estados');
        $this->db->where('id', $id);
        $query = $this->db->get();
        if (count($query->result()) > 0) {
            return $query->row();
        }
    }

    public function update_estado($data) {
        return $this->db->update('public.estados', $data, array('id' => $data['id']));
    }

    //_______ municipio___________________________________________________
    public function get_municipio() {
        $this->db->order_by("estado_id", "ASC");
        $query = $this->db->get('public.municipios');

        if (count($query->result()) > 0) {
            return $query->result();
        }
    }

    public function save_municipio($data) {
        return $this->db->insert('public.municipios', $data);
    }

    public function single_municipio($id) {
        $this->db->select('*');
        $this->db->from('public.municipios');
        $this->db->where('id', $id);
        $query = $this->db->get();
        if (count($query->result()) > 0) {
            return $query->row();
        }
    }

    public function update_municipio($data) {
        return $this->db->update('public.municipios', $data, array('id' => $data['id']));
    }

//_______ parroquia___________________________________________________
    public function get_parroquia() {
        $this->db->order_by("estado_id", "ASC");
        $query = $this->db->get('public.parroquias');

        if (count($query->result()) > 0) {
            return $query->result();
        }
    }

    public function save_parroquia($data) {
        return $this->db->insert('public.parroquias', $data);
    }

    public function single_parroquia($id) {
        $this->db->select('*');
        $this->db->from('public.parroquias');
        $this->db->where('id', $id);

        $query = $this->db->get();
        if (count($query->result()) > 0) {
            return $query->row();
        }
    }

    public function update_parroquia($data) {
        return $this->db->update('public.parroquias', $data, array('id' => $data['id']));
    }

//_______ ciudades___________________________________________________
    public function get_ciudades() {
        $this->db->order_by("estado_id", "ASC");
        $query = $this->db->get('public.ciudades');

        if (count($query->result()) > 0) {
            return $query->result();
        }
    }

    public function save_ciudades($data) {
        return $this->db->insert('public.ciudades', $data);
    }

    public function single_ciudades($id) {
        $this->db->select('*');
        $this->db->from('public.ciudades');
        $this->db->where('id', $id);
        $query = $this->db->get();
        if (count($query->result()) > 0) {
            return $query->row();
        }
    }

    public function update_ciudades($data) {
        return $this->db->update('public.ciudades', $data, array('id' => $data['id']));
    }

//_______ operadoras___________________________________________________
    public function get_operadora() {
        $this->db->order_by("id_operadora", "ASC");
        $query = $this->db->get('public.operadora');

        if (count($query->result()) > 0) {
            return $query->result();
        }
    }

    public function save_operadoras($data) {
        return $this->db->insert('public.operadora', $data);
    }

    public function single_operadora($id) {
        $this->db->select('*');
        $this->db->from('public.operadora');
        $this->db->where('id_operadora', $id);
        $query = $this->db->get();
        if (count($query->result()) > 0) {
            return $query->row();
        }
    }

    public function update_operadora($data) {
        return $this->db->update('public.operadora', $data, array('id_operadora' => $data['id_operadora']));
    }

//_______ proce___________________________________________________
    public function get_proce() {
        $this->db->order_by("id", "ASC");
        $query = $this->db->get('evaluacion_desempenio.modalidad');

        if (count($query->result()) > 0) {
            return $query->result();
        }
    }

    public function save_proce($data) {
        return $this->db->insert('evaluacion_desempenio.modalidad', $data);
    }

    public function single_proce($id) {
        $this->db->select('*');
        $this->db->from('evaluacion_desempenio.modalidad');
        $this->db->where('id', $id);
        $query = $this->db->get();
        if (count($query->result()) > 0) {
            return $query->row();
        }
    }

    public function update_proce($data) {
        return $this->db->update('evaluacion_desempenio.modalidad', $data, array('id' => $data['id']));
    }

//_________________________________________supuestos modslidad_________________
    public function get_supuestos() {
        $this->db->order_by("id", "ASC");
        $query = $this->db->get('evaluacion_desempenio.sub_modalidad');

        if (count($query->result()) > 0) {
            return $query->result();
        }
    }

    public function save_supuestos($data) {

        return $this->db->insert('evaluacion_desempenio.sub_modalidad', $data);
    }

    public function single_supuestos($id) {
        $this->db->select('*');
        $this->db->from('evaluacion_desempenio.sub_modalidad');
        $this->db->where('id', $id);
        $query = $this->db->get();
        if (count($query->result()) > 0) {
            return $query->row();
        }
    }

    public function update_supuestos($data) {
        return $this->db->update('evaluacion_desempenio.sub_modalidad', $data, array('id' => $data['id']));
    }

//_________________________________________edo civil_________________
    public function get_edocivil() {
        $this->db->order_by("id_tipocliente", "ASC");
        $query = $this->db->get('public.tipocliente');

        if (count($query->result()) > 0) {
            return $query->result();
        }
    }

    public function save_edocivil($data) {

        return $this->db->insert('public.tipocliente', $data);
    }

    public function single_edocivil($id) {
        $this->db->select('*');
        $this->db->from('public.tipocliente');
        $this->db->where('id_tipocliente', $id);
        $query = $this->db->get();
        if (count($query->result()) > 0) {
            return $query->row();
        }
    }

    public function update_edocivil($data) {
        return $this->db->update('public.tipocliente', $data, array('id_tipocliente' => $data['id_tipocliente']));
    }
//_________________________________________tipo estacionamiento_________________
public function get_tipoestac() {
    $this->db->order_by("id", "ASC");
    $query = $this->db->get('public.ubicacion');

    if (count($query->result()) > 0) {
        return $query->result();
    }
}

public function save_tipoestac($data) {

    return $this->db->insert('public.ubicacion', $data);
}

public function single_tipoestac($id) {
    $this->db->select('*');
    $this->db->from('public.ubicacion');
    $this->db->where('id', $id);
    $query = $this->db->get();
    if (count($query->result()) > 0) {
        return $query->row();
    }
}

public function update_tipoestac($data) {
    return $this->db->update('public.ubicacion', $data, array('id' => $data['id']));
}
//_____________________dolar____________________

public function get_dolar() {
    $query = $this->db->get('public.dolar');
    if (count($query->result()) > 0) {
        return $query->result();
    }
}

public function save_dolar($data) {
    return $this->db->insert('public.dolar', $data);
}

public function delete_dolar($id) {
    return $this->db->delete('public.dolar', array('id_dolar' => $id));
}

public function single_dolar($id) {
    $this->db->select('*');
    $this->db->from('public.dolar');
    $this->db->where('id_dolar', $id);
    $query = $this->db->get();
    if (count($query->result()) > 0) {
        return $query->row();
    }
}

public function update_dolar($data) {
    return $this->db->update('public.dolar', $data, array('id_dolar' => $data['id_dolar']));
}

}
