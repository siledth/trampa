--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg20.04+1)
-- Dumped by pg_dump version 16.1 (Ubuntu 16.1-1.pgdg20.04+1)

-- Started on 2024-02-25 21:12:30 -04

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 6 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- TOC entry 3285 (class 0 OID 0)
-- Dependencies: 6
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- TOC entry 8 (class 2615 OID 84605)
-- Name: seguridad; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA seguridad;


ALTER SCHEMA seguridad OWNER TO postgres;

--
-- TOC entry 262 (class 1255 OID 132142)
-- Name: update_product_quantity(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.update_product_quantity() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  UPDATE producto
     SET quantity = quantity - NEW.cantidad
   WHERE code_p = NEW.code1;
  RETURN NEW;
END;
$$;


ALTER FUNCTION public.update_product_quantity() OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 203 (class 1259 OID 84606)
-- Name: alicuota_iva; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.alicuota_iva (
    id_alicuota_iva integer NOT NULL,
    desc_alicuota_iva character varying(50) NOT NULL,
    desc_porcentaj character varying(50)
);


ALTER TABLE public.alicuota_iva OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 84609)
-- Name: alicuota_iva_id_alicuota_iva_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.alicuota_iva_id_alicuota_iva_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.alicuota_iva_id_alicuota_iva_seq OWNER TO postgres;

--
-- TOC entry 3287 (class 0 OID 0)
-- Dependencies: 204
-- Name: alicuota_iva_id_alicuota_iva_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.alicuota_iva_id_alicuota_iva_seq OWNED BY public.alicuota_iva.id_alicuota_iva;


--
-- TOC entry 205 (class 1259 OID 84611)
-- Name: banco; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.banco (
    id_banco integer NOT NULL,
    codigo_b character varying(100),
    nombre_b character varying(100)
);


ALTER TABLE public.banco OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 84614)
-- Name: banco_id_banco_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.banco_id_banco_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.banco_id_banco_seq OWNER TO postgres;

--
-- TOC entry 3288 (class 0 OID 0)
-- Dependencies: 206
-- Name: banco_id_banco_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.banco_id_banco_seq OWNED BY public.banco.id_banco;


--
-- TOC entry 207 (class 1259 OID 84616)
-- Name: buque; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.buque (
    id integer NOT NULL,
    nombrebuque character varying(100),
    matricula character varying(30),
    trailer character varying(2),
    pies integer,
    tipo character varying(20),
    color character varying(20),
    eslora character varying(10),
    manga character varying(10),
    puntal character varying(10),
    bruto character varying(10),
    neto character varying(10),
    canon numeric,
    tarifa character varying(100),
    dia character varying(10),
    ubicacion integer,
    fechaingreso date,
    fecha_pago date,
    id_tarifa integer,
    observacion text,
    fecha_desincorporacion date,
    desincorporar integer
);


ALTER TABLE public.buque OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 84622)
-- Name: buque_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.buque_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.buque_id_seq OWNER TO postgres;

--
-- TOC entry 3289 (class 0 OID 0)
-- Dependencies: 208
-- Name: buque_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.buque_id_seq OWNED BY public.buque.id;


--
-- TOC entry 257 (class 1259 OID 123922)
-- Name: cliente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cliente (
    id_cliente integer NOT NULL,
    nombre_clien character varying(100) NOT NULL,
    rif_clien character varying(9) NOT NULL,
    direccion character varying(100) NOT NULL,
    telefono character varying(12) NOT NULL,
    limitecredito character varying NOT NULL,
    id_vendedor integer NOT NULL,
    status integer NOT NULL,
    id_usuario integer NOT NULL,
    fecha_creacion date NOT NULL
);


ALTER TABLE public.cliente OWNER TO postgres;

--
-- TOC entry 256 (class 1259 OID 123920)
-- Name: cliente_id_cliente_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cliente_id_cliente_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cliente_id_cliente_seq OWNER TO postgres;

--
-- TOC entry 3290 (class 0 OID 0)
-- Dependencies: 256
-- Name: cliente_id_cliente_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cliente_id_cliente_seq OWNED BY public.cliente.id_cliente;


--
-- TOC entry 219 (class 1259 OID 84660)
-- Name: mensualidad; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mensualidad (
    id_mensualidad integer NOT NULL,
    matricula character varying NOT NULL,
    pies character varying(100) NOT NULL,
    id_tarifa integer NOT NULL,
    tarifa character varying NOT NULL,
    dia integer NOT NULL,
    canon numeric NOT NULL,
    fecha_deuda date NOT NULL,
    id_status integer NOT NULL,
    fecha_reg date DEFAULT now() NOT NULL,
    fecha_update timestamp without time zone NOT NULL,
    id_factura integer,
    nro_factura character varying,
    nota text,
    fechapago date
);


ALTER TABLE public.mensualidad OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 84673)
-- Name: mov_consig; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mov_consig (
    id_mov_consig integer NOT NULL,
    id_mensualidad integer NOT NULL,
    id_tipo_pago integer NOT NULL,
    nro_referencia character varying,
    total_ant_d character varying NOT NULL,
    id_dolar integer NOT NULL,
    valor character varying NOT NULL,
    total_ant_bs character varying NOT NULL,
    total_abonado_bs character varying,
    total_abonado_om character varying,
    restante_bs character varying,
    restante_om character varying,
    id_user integer NOT NULL,
    id_estatus integer NOT NULL,
    fecha_reg date DEFAULT now() NOT NULL,
    id_banco integer,
    fechatrnas date
);


ALTER TABLE public.mov_consig OWNER TO postgres;

--
-- TOC entry 239 (class 1259 OID 84728)
-- Name: tipopago; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tipopago (
    id_tipo_pago integer NOT NULL,
    descripcion character varying(50) NOT NULL
);


ALTER TABLE public.tipopago OWNER TO postgres;

--
-- TOC entry 249 (class 1259 OID 84803)
-- Name: condxpagar_detallado; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.condxpagar_detallado AS
 SELECT est.matricula,
    b.nombrebuque,
    est.canon,
    est.pies,
    llc.id_mov_consig,
    llc.total_abonado_om,
    llc.total_abonado_bs,
    llc.fecha_reg,
    t.descripcion,
    ban.nombre_b,
    llc.id_banco,
    llc.id_estatus,
    llc.fechatrnas,
    llc.nro_referencia,
    est.fecha_deuda
   FROM ((((public.mov_consig llc
     JOIN public.mensualidad est ON ((llc.id_mensualidad = est.id_mensualidad)))
     JOIN public.buque b ON (((b.matricula)::text = (est.matricula)::text)))
     JOIN public.banco ban ON ((ban.id_banco = llc.id_banco)))
     JOIN public.tipopago t ON ((t.id_tipo_pago = llc.id_tipo_pago)))
  WHERE (llc.id_tipo_pago > 0)
  ORDER BY est.matricula, llc.fecha_reg;


ALTER VIEW public.condxpagar_detallado OWNER TO postgres;

--
-- TOC entry 258 (class 1259 OID 123936)
-- Name: descuento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.descuento (
    id_desc integer NOT NULL,
    desc_desc character varying(20),
    porcentaje character varying(20)
);


ALTER TABLE public.descuento OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 84624)
-- Name: deta_factura; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.deta_factura (
    id integer NOT NULL,
    matricula character varying(30),
    pies character varying(50),
    ob character varying(100),
    tarifa character varying(50),
    dia character varying(50),
    canon character varying(30),
    monto_estimado character varying(30),
    id_fact integer,
    id_tarifa integer
);


ALTER TABLE public.deta_factura OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 84627)
-- Name: deta_factura_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.deta_factura_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.deta_factura_id_seq OWNER TO postgres;

--
-- TOC entry 3291 (class 0 OID 0)
-- Dependencies: 210
-- Name: deta_factura_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.deta_factura_id_seq OWNED BY public.deta_factura.id;


--
-- TOC entry 260 (class 1259 OID 132128)
-- Name: deta_recibo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.deta_recibo (
    id integer NOT NULL,
    cedula text,
    code1 integer,
    cantidad integer,
    cot_u character varying(100),
    sub_t character varying(100),
    id_des character varying(50),
    t_desc character varying(100),
    total character varying(100),
    id_fact integer,
    fecha_reg date DEFAULT now()
);


ALTER TABLE public.deta_recibo OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 84629)
-- Name: deta_recibo1; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.deta_recibo1 (
    id integer NOT NULL,
    matricula text,
    pies character varying(50),
    ob character varying(100),
    tarifa character varying(50),
    dia character varying(50),
    canon character varying(100),
    monto_estimado character varying(100),
    totald character varying(100),
    totalb character varying(100),
    id_fact integer,
    id_tarifa integer,
    cot_u character varying(100),
    code1 integer,
    sub_t character varying(100),
    id_des character varying(50),
    t_desc character varying(100)
);


ALTER TABLE public.deta_recibo1 OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 84635)
-- Name: deta_recibo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.deta_recibo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.deta_recibo_id_seq OWNER TO postgres;

--
-- TOC entry 3292 (class 0 OID 0)
-- Dependencies: 212
-- Name: deta_recibo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.deta_recibo_id_seq OWNED BY public.deta_recibo1.id;


--
-- TOC entry 213 (class 1259 OID 84637)
-- Name: dolar; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dolar (
    id_dolar integer NOT NULL,
    desc_dolarc character varying(50) NOT NULL,
    desc_dolarp character varying(50) NOT NULL
);


ALTER TABLE public.dolar OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 84640)
-- Name: dolar_id_dolar_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dolar_id_dolar_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.dolar_id_dolar_seq OWNER TO postgres;

--
-- TOC entry 3293 (class 0 OID 0)
-- Dependencies: 214
-- Name: dolar_id_dolar_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dolar_id_dolar_seq OWNED BY public.dolar.id_dolar;


--
-- TOC entry 215 (class 1259 OID 84642)
-- Name: empresa; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.empresa (
    id integer NOT NULL,
    descripcion character varying(50) NOT NULL,
    rif character varying(10),
    fecha timestamp without time zone NOT NULL,
    fecha_update timestamp without time zone
);


ALTER TABLE public.empresa OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 84645)
-- Name: estatus; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.estatus (
    id_status integer NOT NULL,
    descripcion character varying NOT NULL,
    fecha_reg date DEFAULT now() NOT NULL,
    fecha_update timestamp without time zone NOT NULL
);


ALTER TABLE public.estatus OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 84652)
-- Name: factura; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.factura (
    id integer NOT NULL,
    nro_factura character varying,
    nombre character varying(100),
    matricula character varying(30),
    tele_1 character varying(50),
    total_iva character varying(50),
    total_mas_iva character varying(50),
    total_bs character varying(50),
    fechaingreso date,
    id_status integer,
    fecha_update date,
    valor_iva character varying,
    cedula character varying(20),
    id_tipo_pago integer,
    id_banco integer,
    nro_referencia character varying(40),
    fechatrnas date,
    nombrep text,
    cedulap text
);


ALTER TABLE public.factura OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 84658)
-- Name: factura_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.factura_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.factura_id_seq OWNER TO postgres;

--
-- TOC entry 3294 (class 0 OID 0)
-- Dependencies: 218
-- Name: factura_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.factura_id_seq OWNED BY public.factura.id;


--
-- TOC entry 250 (class 1259 OID 123823)
-- Name: marca; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.marca (
    id_marca integer NOT NULL,
    desc_marca character varying(50) NOT NULL,
    id_usuario bigint NOT NULL,
    fecha date NOT NULL
);


ALTER TABLE public.marca OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 84667)
-- Name: mensualidad_id_mensualidad_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.mensualidad_id_mensualidad_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.mensualidad_id_mensualidad_seq OWNER TO postgres;

--
-- TOC entry 3295 (class 0 OID 0)
-- Dependencies: 220
-- Name: mensualidad_id_mensualidad_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.mensualidad_id_mensualidad_seq OWNED BY public.mensualidad.id_mensualidad;


--
-- TOC entry 221 (class 1259 OID 84669)
-- Name: mensualidadess; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.mensualidadess AS
 SELECT buque.id,
    buque.nombrebuque,
    buque.matricula,
    buque.trailer,
    buque.pies,
    buque.tipo,
    buque.color,
    buque.eslora,
    buque.manga,
    buque.puntal,
    buque.bruto,
    buque.neto,
    buque.canon,
    buque.tarifa,
    buque.dia,
    buque.ubicacion,
    buque.fechaingreso,
    buque.fecha_pago,
    buque.id_tarifa,
    date_part('day'::text, buque.fecha_pago) AS diar
   FROM public.buque;


ALTER VIEW public.mensualidadess OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 84680)
-- Name: mov_consig_id_mov_consig_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.mov_consig_id_mov_consig_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.mov_consig_id_mov_consig_seq OWNER TO postgres;

--
-- TOC entry 3296 (class 0 OID 0)
-- Dependencies: 223
-- Name: mov_consig_id_mov_consig_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.mov_consig_id_mov_consig_seq OWNED BY public.mov_consig.id_mov_consig;


--
-- TOC entry 261 (class 1259 OID 132144)
-- Name: mov_prod; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mov_prod (
    id_mov integer NOT NULL,
    id_producto integer NOT NULL,
    quantity integer NOT NULL,
    id_usuario bigint NOT NULL,
    fecha_creacion date NOT NULL,
    quantity_ant integer,
    total_stock integer
);


ALTER TABLE public.mov_prod OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 84682)
-- Name: por_pagar_barco; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.por_pagar_barco AS
 SELECT sum(mensualidad.canon) AS deuda,
    count(DISTINCT mensualidad.matricula) AS barcos
   FROM public.mensualidad
  WHERE (mensualidad.id_status = 0);


ALTER VIEW public.por_pagar_barco OWNER TO postgres;

--
-- TOC entry 253 (class 1259 OID 123869)
-- Name: producto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.producto (
    id_producto integer NOT NULL,
    code_p integer NOT NULL,
    descripcion character varying(100) NOT NULL,
    id_und integer NOT NULL,
    id_marca integer NOT NULL,
    quantity integer NOT NULL,
    price_purchase character varying(200) NOT NULL,
    price_sale character varying(200),
    status integer NOT NULL,
    id_usuario bigint NOT NULL,
    fecha_creacion date NOT NULL
);


ALTER TABLE public.producto OWNER TO postgres;

--
-- TOC entry 252 (class 1259 OID 123867)
-- Name: producto_id_producto_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.producto_id_producto_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.producto_id_producto_seq OWNER TO postgres;

--
-- TOC entry 3297 (class 0 OID 0)
-- Dependencies: 252
-- Name: producto_id_producto_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.producto_id_producto_seq OWNED BY public.producto.id_producto;


--
-- TOC entry 225 (class 1259 OID 84686)
-- Name: propiet; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.propiet (
    id_propiet integer NOT NULL,
    cedula character varying(50),
    tipo_ced character varying(1),
    nombrecom character varying(250),
    tele_1 character varying(15),
    email character varying(50),
    tipo character varying(15),
    matricula character varying(50),
    id_buque integer
);


ALTER TABLE public.propiet OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 84689)
-- Name: propiet_id_propiet_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.propiet_id_propiet_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.propiet_id_propiet_seq OWNER TO postgres;

--
-- TOC entry 3298 (class 0 OID 0)
-- Dependencies: 226
-- Name: propiet_id_propiet_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.propiet_id_propiet_seq OWNED BY public.propiet.id_propiet;


--
-- TOC entry 259 (class 1259 OID 123939)
-- Name: recibo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.recibo (
    id integer NOT NULL,
    nombre character varying(100),
    cedula text,
    tele_1 character varying(15),
    fecha_crear date,
    nro_factura character varying(100),
    total_iva character varying(100),
    total_mas_iva character varying(100),
    total_bs character varying(100),
    id_status integer,
    fecha_update date,
    tipo_pago integer
);


ALTER TABLE public.recibo OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 84691)
-- Name: recibo1; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.recibo1 (
    id integer NOT NULL,
    nombre character varying(100),
    matricula text,
    tele_1 character varying(15),
    fechaingreso date,
    nro_factura character varying(100),
    total_iva character varying(100),
    total_mas_iva character varying(100),
    total_bs character varying(100),
    id_status integer,
    fecha_update date,
    valor_iva character varying(100),
    cedula character varying(20),
    efectivo character varying(20),
    transferencia character varying(20),
    banco character varying(60),
    trnas character varying(15),
    fechatrnas character varying(15),
    id_fact integer,
    nro_referencia character varying(100),
    id_tipo_pago integer,
    id_banco integer,
    nombrep text
);


ALTER TABLE public.recibo1 OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 84697)
-- Name: recibo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.recibo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.recibo_id_seq OWNER TO postgres;

--
-- TOC entry 3299 (class 0 OID 0)
-- Dependencies: 228
-- Name: recibo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.recibo_id_seq OWNED BY public.recibo1.id;


--
-- TOC entry 229 (class 1259 OID 84699)
-- Name: reporte_deuda_corto; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.reporte_deuda_corto AS
 SELECT mensualidad.id_status,
    mensualidad.matricula,
    mensualidad.canon,
    mensualidad.pies,
    to_char((mensualidad.fecha_deuda)::timestamp with time zone, 'TMMonth'::text) AS to_char,
    mensualidad.id_tarifa
   FROM public.mensualidad
  WHERE (mensualidad.id_status = 0)
  GROUP BY mensualidad.matricula, mensualidad.pies, mensualidad.canon, mensualidad.id_status, mensualidad.fecha_deuda, mensualidad.id_tarifa
  ORDER BY mensualidad.fecha_deuda DESC;


ALTER VIEW public.reporte_deuda_corto OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 84703)
-- Name: reporte_deuda_corto_final; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.reporte_deuda_corto_final AS
 SELECT r.id_status,
    b.nombrebuque,
    r.matricula,
    sum(r.canon) AS total,
    r.pies,
    string_agg(r.to_char, ','::text) AS string_agg,
    r.id_tarifa
   FROM (public.reporte_deuda_corto r
     JOIN public.buque b ON (((b.matricula)::text = (r.matricula)::text)))
  GROUP BY r.matricula, r.pies, r.id_status, b.nombrebuque, r.id_tarifa;


ALTER VIEW public.reporte_deuda_corto_final OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 84708)
-- Name: tarifa; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tarifa (
    id_tarifa integer NOT NULL,
    desc_concepto character varying(100),
    desc_condicion character varying(100),
    desc_tarifa character varying(50),
    des_unidad character varying(10),
    fecha date
);


ALTER TABLE public.tarifa OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 84711)
-- Name: tarifa_id_tarifa_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tarifa_id_tarifa_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tarifa_id_tarifa_seq OWNER TO postgres;

--
-- TOC entry 3300 (class 0 OID 0)
-- Dependencies: 232
-- Name: tarifa_id_tarifa_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tarifa_id_tarifa_seq OWNED BY public.tarifa.id_tarifa;


--
-- TOC entry 233 (class 1259 OID 84713)
-- Name: tipobarco; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tipobarco (
    id_tipobarco integer NOT NULL,
    desc_tipobarco character varying(50) NOT NULL
);


ALTER TABLE public.tipobarco OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 84716)
-- Name: tipobarco_id_tipobarco_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tipobarco_id_tipobarco_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tipobarco_id_tipobarco_seq OWNER TO postgres;

--
-- TOC entry 3301 (class 0 OID 0)
-- Dependencies: 234
-- Name: tipobarco_id_tipobarco_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tipobarco_id_tipobarco_seq OWNED BY public.tipobarco.id_tipobarco;


--
-- TOC entry 235 (class 1259 OID 84718)
-- Name: tipocliente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tipocliente (
    id_tipocliente integer NOT NULL,
    desc_tipocliente character varying(80) NOT NULL
);


ALTER TABLE public.tipocliente OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 84721)
-- Name: tipocliente_id_tipocliente_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tipocliente_id_tipocliente_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tipocliente_id_tipocliente_seq OWNER TO postgres;

--
-- TOC entry 3302 (class 0 OID 0)
-- Dependencies: 236
-- Name: tipocliente_id_tipocliente_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tipocliente_id_tipocliente_seq OWNED BY public.tipocliente.id_tipocliente;


--
-- TOC entry 237 (class 1259 OID 84723)
-- Name: tipoestac; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tipoestac (
    id_tipoestac integer NOT NULL,
    desc_tipoestac character varying(80) NOT NULL
);


ALTER TABLE public.tipoestac OWNER TO postgres;

--
-- TOC entry 238 (class 1259 OID 84726)
-- Name: tipoestac_id_tipoestac_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tipoestac_id_tipoestac_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tipoestac_id_tipoestac_seq OWNER TO postgres;

--
-- TOC entry 3303 (class 0 OID 0)
-- Dependencies: 238
-- Name: tipoestac_id_tipoestac_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tipoestac_id_tipoestac_seq OWNED BY public.tipoestac.id_tipoestac;


--
-- TOC entry 240 (class 1259 OID 84731)
-- Name: tipopago_id_tipo_pago_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tipopago_id_tipo_pago_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tipopago_id_tipo_pago_seq OWNER TO postgres;

--
-- TOC entry 3304 (class 0 OID 0)
-- Dependencies: 240
-- Name: tipopago_id_tipo_pago_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tipopago_id_tipo_pago_seq OWNED BY public.tipopago.id_tipo_pago;


--
-- TOC entry 241 (class 1259 OID 84733)
-- Name: total_barco; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.total_barco AS
 SELECT count(DISTINCT buque.nombrebuque) AS totalbarco,
    sum(buque.canon) AS totalcanon
   FROM public.buque
  WHERE (buque.desincorporar = 1);


ALTER VIEW public.total_barco OWNER TO postgres;

--
-- TOC entry 242 (class 1259 OID 84737)
-- Name: total_barco_ubica; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.total_barco_ubica AS
 SELECT buque.id,
    buque.nombrebuque,
    buque.matricula,
    buque.ubicacion,
    buque.fechaingreso,
    buque.fecha_pago,
    buque.id_tarifa,
    buque.desincorporar,
    buque.pies
   FROM public.buque
  WHERE (buque.desincorporar = 1);


ALTER VIEW public.total_barco_ubica OWNER TO postgres;

--
-- TOC entry 243 (class 1259 OID 84741)
-- Name: tripulacion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tripulacion (
    id_tripulacion integer NOT NULL,
    cedulat character varying(50),
    tipo_cedt character varying(1),
    nombrecomt character varying(150),
    tele_1t character varying(15),
    cargot character varying(50),
    matricula character varying(50),
    id_buque integer,
    autor character varying(50)
);


ALTER TABLE public.tripulacion OWNER TO postgres;

--
-- TOC entry 244 (class 1259 OID 84744)
-- Name: tripulacion_id_tripulacion_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tripulacion_id_tripulacion_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tripulacion_id_tripulacion_seq OWNER TO postgres;

--
-- TOC entry 3305 (class 0 OID 0)
-- Dependencies: 244
-- Name: tripulacion_id_tripulacion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tripulacion_id_tripulacion_seq OWNED BY public.tripulacion.id_tripulacion;


--
-- TOC entry 245 (class 1259 OID 84746)
-- Name: ubicacion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ubicacion (
    id integer NOT NULL,
    descripcion character varying(100),
    maximo character varying(50)
);


ALTER TABLE public.ubicacion OWNER TO postgres;

--
-- TOC entry 246 (class 1259 OID 84749)
-- Name: ubicacion_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ubicacion_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ubicacion_id_seq OWNER TO postgres;

--
-- TOC entry 3306 (class 0 OID 0)
-- Dependencies: 246
-- Name: ubicacion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ubicacion_id_seq OWNED BY public.ubicacion.id;


--
-- TOC entry 251 (class 1259 OID 123828)
-- Name: und; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.und (
    id_und integer NOT NULL,
    desc_und character varying(50) NOT NULL,
    id_usuario bigint NOT NULL,
    fecha date NOT NULL
);


ALTER TABLE public.und OWNER TO postgres;

--
-- TOC entry 255 (class 1259 OID 123914)
-- Name: vendedor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vendedor (
    id_vendedor integer NOT NULL,
    nombre_vendedor character varying(100) NOT NULL,
    rif_vendedor character varying(9) NOT NULL,
    direccion character varying(100) NOT NULL,
    telefono character varying(12) NOT NULL,
    status integer NOT NULL,
    id_usuario integer NOT NULL,
    fecha_creacion date NOT NULL
);


ALTER TABLE public.vendedor OWNER TO postgres;

--
-- TOC entry 254 (class 1259 OID 123912)
-- Name: vendedor_id_vendedor_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.vendedor_id_vendedor_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.vendedor_id_vendedor_seq OWNER TO postgres;

--
-- TOC entry 3307 (class 0 OID 0)
-- Dependencies: 254
-- Name: vendedor_id_vendedor_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.vendedor_id_vendedor_seq OWNED BY public.vendedor.id_vendedor;


--
-- TOC entry 247 (class 1259 OID 84751)
-- Name: usuarios; Type: TABLE; Schema: seguridad; Owner: postgres
--

CREATE TABLE seguridad.usuarios (
    id integer NOT NULL,
    cedula character varying(50),
    email character varying(50) NOT NULL,
    nombre character varying(30),
    apellido character varying(30),
    password text,
    rif character varying(10),
    tele_1 character varying(20),
    perfil integer,
    foto text,
    intentos integer,
    id_estatus integer,
    fecha timestamp without time zone,
    fecha_update timestamp without time zone
);


ALTER TABLE seguridad.usuarios OWNER TO postgres;

--
-- TOC entry 248 (class 1259 OID 84757)
-- Name: usuarios_id_seq; Type: SEQUENCE; Schema: seguridad; Owner: postgres
--

CREATE SEQUENCE seguridad.usuarios_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE seguridad.usuarios_id_seq OWNER TO postgres;

--
-- TOC entry 3308 (class 0 OID 0)
-- Dependencies: 248
-- Name: usuarios_id_seq; Type: SEQUENCE OWNED BY; Schema: seguridad; Owner: postgres
--

ALTER SEQUENCE seguridad.usuarios_id_seq OWNED BY seguridad.usuarios.id;


--
-- TOC entry 3032 (class 2604 OID 84759)
-- Name: alicuota_iva id_alicuota_iva; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alicuota_iva ALTER COLUMN id_alicuota_iva SET DEFAULT nextval('public.alicuota_iva_id_alicuota_iva_seq'::regclass);


--
-- TOC entry 3033 (class 2604 OID 84760)
-- Name: banco id_banco; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.banco ALTER COLUMN id_banco SET DEFAULT nextval('public.banco_id_banco_seq'::regclass);


--
-- TOC entry 3034 (class 2604 OID 84761)
-- Name: buque id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.buque ALTER COLUMN id SET DEFAULT nextval('public.buque_id_seq'::regclass);


--
-- TOC entry 3056 (class 2604 OID 123925)
-- Name: cliente id_cliente; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente ALTER COLUMN id_cliente SET DEFAULT nextval('public.cliente_id_cliente_seq'::regclass);


--
-- TOC entry 3035 (class 2604 OID 84762)
-- Name: deta_factura id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deta_factura ALTER COLUMN id SET DEFAULT nextval('public.deta_factura_id_seq'::regclass);


--
-- TOC entry 3036 (class 2604 OID 84763)
-- Name: deta_recibo1 id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deta_recibo1 ALTER COLUMN id SET DEFAULT nextval('public.deta_recibo_id_seq'::regclass);


--
-- TOC entry 3037 (class 2604 OID 84764)
-- Name: dolar id_dolar; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dolar ALTER COLUMN id_dolar SET DEFAULT nextval('public.dolar_id_dolar_seq'::regclass);


--
-- TOC entry 3039 (class 2604 OID 84765)
-- Name: factura id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factura ALTER COLUMN id SET DEFAULT nextval('public.factura_id_seq'::regclass);


--
-- TOC entry 3040 (class 2604 OID 84766)
-- Name: mensualidad id_mensualidad; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mensualidad ALTER COLUMN id_mensualidad SET DEFAULT nextval('public.mensualidad_id_mensualidad_seq'::regclass);


--
-- TOC entry 3042 (class 2604 OID 84767)
-- Name: mov_consig id_mov_consig; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mov_consig ALTER COLUMN id_mov_consig SET DEFAULT nextval('public.mov_consig_id_mov_consig_seq'::regclass);


--
-- TOC entry 3054 (class 2604 OID 123872)
-- Name: producto id_producto; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.producto ALTER COLUMN id_producto SET DEFAULT nextval('public.producto_id_producto_seq'::regclass);


--
-- TOC entry 3044 (class 2604 OID 84768)
-- Name: propiet id_propiet; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.propiet ALTER COLUMN id_propiet SET DEFAULT nextval('public.propiet_id_propiet_seq'::regclass);


--
-- TOC entry 3045 (class 2604 OID 84769)
-- Name: recibo1 id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recibo1 ALTER COLUMN id SET DEFAULT nextval('public.recibo_id_seq'::regclass);


--
-- TOC entry 3046 (class 2604 OID 84770)
-- Name: tarifa id_tarifa; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tarifa ALTER COLUMN id_tarifa SET DEFAULT nextval('public.tarifa_id_tarifa_seq'::regclass);


--
-- TOC entry 3047 (class 2604 OID 84771)
-- Name: tipobarco id_tipobarco; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipobarco ALTER COLUMN id_tipobarco SET DEFAULT nextval('public.tipobarco_id_tipobarco_seq'::regclass);


--
-- TOC entry 3048 (class 2604 OID 84772)
-- Name: tipocliente id_tipocliente; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipocliente ALTER COLUMN id_tipocliente SET DEFAULT nextval('public.tipocliente_id_tipocliente_seq'::regclass);


--
-- TOC entry 3049 (class 2604 OID 84773)
-- Name: tipoestac id_tipoestac; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipoestac ALTER COLUMN id_tipoestac SET DEFAULT nextval('public.tipoestac_id_tipoestac_seq'::regclass);


--
-- TOC entry 3050 (class 2604 OID 84774)
-- Name: tipopago id_tipo_pago; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipopago ALTER COLUMN id_tipo_pago SET DEFAULT nextval('public.tipopago_id_tipo_pago_seq'::regclass);


--
-- TOC entry 3051 (class 2604 OID 84775)
-- Name: tripulacion id_tripulacion; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tripulacion ALTER COLUMN id_tripulacion SET DEFAULT nextval('public.tripulacion_id_tripulacion_seq'::regclass);


--
-- TOC entry 3052 (class 2604 OID 84776)
-- Name: ubicacion id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ubicacion ALTER COLUMN id SET DEFAULT nextval('public.ubicacion_id_seq'::regclass);


--
-- TOC entry 3055 (class 2604 OID 123917)
-- Name: vendedor id_vendedor; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendedor ALTER COLUMN id_vendedor SET DEFAULT nextval('public.vendedor_id_vendedor_seq'::regclass);


--
-- TOC entry 3053 (class 2604 OID 84777)
-- Name: usuarios id; Type: DEFAULT; Schema: seguridad; Owner: postgres
--

ALTER TABLE ONLY seguridad.usuarios ALTER COLUMN id SET DEFAULT nextval('seguridad.usuarios_id_seq'::regclass);


--
-- TOC entry 3228 (class 0 OID 84606)
-- Dependencies: 203
-- Data for Name: alicuota_iva; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.alicuota_iva (id_alicuota_iva, desc_alicuota_iva, desc_porcentaj) FROM stdin;
1	0.16	16%
\.


--
-- TOC entry 3230 (class 0 OID 84611)
-- Dependencies: 205
-- Data for Name: banco; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.banco (id_banco, codigo_b, nombre_b) FROM stdin;
1	0001	Banco Central de Venezuela
2	0102	Banco de Venezuela
3	0104	Banco Venezolano de Credito
4	0105	Banco Mercantil
5	0108	BBVA Provincial
6	0114	Bancaribe
7	0115	Banco Exterior
8	0116	B.O.D.
9	0128	Banco Caroni
10	0134	Banesco
11	0137	Banco Sofitasa
12	0138	Banco Plaza
13	0146	Bangente
14	0151	BFC Banco Fondo Comun
15	0156	100% Banco
16	0157	DELSUR Banco Universal
17	0163	Banco Del Tesoro
18	0166	Banco Agricola de Venezuela
19	0168	Bancrecer
20	0169	Mi Banco
21	0171	Banco Activo
22	0172	Bancamiga
23	0173	Banco Internacional de Desarrollo
24	0174	Banplus
25	0175	Banco Bicentenario del Pueblo
26	0177	Banfanb
27	0190	Citibank
28	0191	Banco Nacional de Credito (BNC)
29	0601	Instituto Municipal de Credito Popular
\.


--
-- TOC entry 3232 (class 0 OID 84616)
-- Dependencies: 207
-- Data for Name: buque; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.buque (id, nombrebuque, matricula, trailer, pies, tipo, color, eslora, manga, puntal, bruto, neto, canon, tarifa, dia, ubicacion, fechaingreso, fecha_pago, id_tarifa, observacion, fecha_desincorporacion, desincorporar) FROM stdin;
44	GALERNA	AGSI-D-5426	No	35	LANCHA							175	5	1	7	2022-02-04	2022-02-01	2	el propietario entrega a la marina por no poder pagar 	2022-10-31	0
83	HOOK	AGSI-RE-0169	Si	36	LANCHA	BLANCO	10.97	3.04	1.21	8.91	2.23	180	5	1	7	2022-08-10	2022-02-01	2	DESINCORPORADO DE LAS INSTALACIONES EN AGOSTO	2022-11-01	0
125	CATACO 1	AGSI-D- 2796	No	27	LANCHA	AZUL	NO	NO	NO	NO	NO	165	5	1	3	2022-08-14	2022-02-01	1	el propietario retira la embarcacion de la marina 	2023-03-27	0
18	IDOLIDIA	AGSI-D-10408	No	28	YATE	AMARILLO	9.01	3.50	2.00	11.33	2.83	165	5	1	3	2022-07-26	2022-02-01	1	autorizado por la directiva el día 28/03/2023 y se le solicito de desalojo de las instalaciones 	2023-04-01	0
11	TABOGA	AGSI-D-5926	No	63	YATE	BLANCO	26.30	5.80	2.20	112.00	28.06	315	5	1	1	2022-07-27	2022-02-01	1	se retira de la marina POR CARTA DE DESALOJO 	2023-04-01	0
24	CINCO CERO	AGSI-D-11629	No	27	LANCHA	BLANCA CON VERDE	8.35	2.99	0.55	28.33	28.33	165	5	1	4	2022-08-11	2022-02-01	1	se retiro en el  mes abril del 2023	2023-04-18	0
21	NANCYS TOY	AGSI-D-22966	No	58	YATE	AZUL	17.86	4.88	1.27	44.68	11.17	290	5	1	4	2022-07-27	2022-02-01	1	EL PROPIETARIO RETIRA LA EMBARCACION EL 6/6/2023	2023-06-06	0
46	SAN ISIDRO	AGSI-D-23325	No	27	LANCHA	BLANCO 	8.50	2.60	1.20	7.44	1.86	165	5	1	3	2022-04-03	2022-02-01	1	se retira de la marina POR CARTA DE DESALOJO en mayo2023	2023-06-21	0
17	MARY ELENA	AGSI-RE-1176	No	81	YATE	BLANCO	24.40	5.30	2.50	105.20	47.36	405	5	1	3	2022-07-28	2022-02-01	1	se retira de la marina por venta	2023-06-21	0
130	ALFA OMEGA	ENTRAMITE001	No	88	YATE	BLANCO	27	6.27	1.92	92	90	660	7.50	1	5	2022-12-22	2022-02-01	1	\N	\N	1
12	ALMIRANTA	AGSI-2927	No	44	CASA BOTE	BLANCO	13.75	4.34	1.50	38.80	9.70	330	7.50	1	1	2022-07-18	2022-02-01	1	\N	\N	1
23	ANAMA	AGSI-PE-0830	No	23	LANCHA	BLANCO	8.20	2.60	2.05	4.77	3.58	247.5	7.50	1	4	2022-07-18	2022-02-01	1	\N	\N	1
57	BIG-E	AGSI-RE-0268	No	58	YATE	BLANCO	17.67	5.24	1.66	55.23	24.85	435	7.50	1	3	2022-07-29	2022-02-01	1	\N	\N	1
90	CISNE	AGSM-D-1776	No	43	VELERO	BLANCO	no	no	no	no	no	322.5	7.50	1	2	2022-08-11	2022-02-01	1	\N	\N	1
75	COSTA AZUL	DL1324AC	No	73	YATE	BLANCO	22.71	5.80	1.86	30.00	30.00	547.5	7.50	1	5	2022-08-10	2022-02-01	1	\N	\N	1
26	GRACE I	AGSI-PE-0887	No	25	LANCHA	BLANCO	7.45	3.14	1.95	6.02	1.65	247.5	7.50	1	4	2022-07-26	2022-02-01	1	\N	\N	1
15	MALECON	ADKN-D-3015	No	36	LANCHA							270	7.50	1	2	2022-02-04	2022-02-01	1	\N	\N	1
66	MARIA GRACIA 	ADKN-2106	No	44	PESQUERO	BLANCO	14.20	4.00	2.50	39.37	26.26	330	7.50	1	2	2022-08-01	2022-02-01	1	\N	\N	1
14	MARTA MERCEDES	ARSH-D-1850	No	85	YATE	CREMA	22.00	5.70	2.95	111.33	27.83	637.5	7.50	1	2	2022-07-26	2022-02-01	1	\N	\N	1
35	ONE MORE TOY	AGSI-RE-0202	No	88	YATE	NEGRO	22.97	6.23	2.29	95.84	23.96	660	7.50	1	5	2022-07-27	2022-02-01	1	\N	\N	1
103	PICASSO	AGSI-RE-TRAMITE 456	No	48	LANCHA		NO	no	no	no		360	7.50	1	2	2022-08-11	2022-02-01	1	\N	\N	1
56	RAIATEA	AGSI-RE-0205	No	58	YATE	AMARILLO	16.90	5.38	2.85	73.04	19.01	435	7.50	1	3	2022-07-29	2022-02-01	1	\N	\N	1
42	SAKAIKA	APNN-D-675	No	35	LANCHA	AZUL	10.70	2.75	1.56	9.95	5.97	262.5	7.50	1	6	2022-08-01	2022-02-01	2	\N	\N	1
86	SENIAT	AGSI-D-23647	No	36	LANCHA	BLANCO 	NO	NO	NO	NO	NO	270	7.50	1	2	2022-08-10	2022-02-01	1	\N	\N	1
77	SURYA STAR 	AGSI-RE-1593	No	23	DINGUI 	NARANJA 	7.62	2.73	0.60	2.65	0.63	172.5	7.50	1	6	2022-08-10	2022-02-01	2	\N	\N	1
82	WHAOO 2	AGSP-RE-0587	No	25	PEÑERO	BLANCO CON AZUL	8.53	2.50	1.05	4.74	1.18	187.5	7.50	1	7	2022-08-10	2022-02-01	2	\N	\N	1
117	TOM III	AGSI-D-15916	No	40	VELERO	BLANCO	NO	NO	NO	NO	NO	200	5	1	2	2022-08-13	2022-02-01	1	EL PROPIETARIO NO RESPONDE A LOS COMUNICADOS NI SE HA PRESENTADO EN LA MARINA POR MAS DE 1 AÑO SE PROSEDE HACER DESINCORPORACION TOTAL DE LA DEUDA 2600 HASTA MAYO	2023-05-02	0
37	TACHIAO	AGSI-TU-0058	No	48	VELERO	AZUL	14.56	5.57	2.20	30.61	26.78	360	7.50	1	5	2022-07-27	2022-02-01	1	\N	\N	1
59	MONKEY BUSINE	AGSI-RE-0753	No	60	YATE	BLANCO	18.28	5.30	1.82	41.68	10.42	450	7.50	1	5	2022-08-01	2022-02-01	1	\N	\N	1
33	4 FANTASTICOS	AGSI-RE-1011	No	45	YATE	BLANCO	11.70	3.89	1.80	39.53	9.88	337.5	7.50	1	5	2022-07-21	2022-02-01	1	\N	\N	1
112	EXIT EXTRATIGE	AGSI-RE-TRAMITE7458	No	115	YATE	BLANCO	NO	NO	NO	NO	NO	862.5	7.50	1	5	2022-08-13	2022-02-01	1	\N	\N	1
31	FAMILY TIME	AGSI-RE-0575	No	40	YATE	BLANCO	13.30	4.05	1.90	25.48	6.37	300	7.50	1	5	2022-07-26	2022-02-01	1	\N	\N	1
34	BROADWAY	AGSI-RE-22326	No	33	LANCHA							247.5	7.50	1	5	2022-07-26	2022-02-01	1	\N	\N	1
28	INTIMA	AGSI-D-5124	No	36	YATE	BLANCO	10.83	3.36	1.2	16.57	4.15	270	7.50	1	3	2022-07-26	2022-02-01	1	\N	\N	1
22	SANGRE AZUL	AGSI-PE-0829	No	34	YATE	AZUL	11.20	3.00	1.20	15.80	7.11	255	7.50	1	4	2022-07-27	2022-02-01	1	\N	\N	1
32	ALEJA	AGSI-D-5535	No	42	YATE	BLANCO	12.85	3.90	2.25	33.27	8.32	315	7.50	1	1	2022-07-18	2022-02-01	1	\N	\N	1
76	HURACAN	AGSI-RE-1420	No	60	YATE	BLANCO	20.10	5.70	1.80	69.95	17.48	450	7.50	1	5	2022-08-10	2022-02-01	1	\N	\N	1
60	SERENDIPITY	AGSI-RE-1303	No	63	YATE	BLANCO	19.05	5.28	2.25	69.81	17.46	472.5	7.50	1	5	2022-08-01	2022-02-01	1	\N	\N	1
95	CEST LA VIE 	Agsi-re-0678	No	42	YATE	BLANCO	NO	NO	NO	NO	NO	315	7.50	1	4	2022-08-11	2022-02-01	1	\N	\N	1
39	CAVAC	AGSI-RE-0437	No	30	VELERO	BLANCO	9.14	2.74	1.10	7.88	1.97	247.5	7.50	1	1	2022-07-18	2022-02-01	1	\N	\N	1
30	DIVING BLUE 	AGSI-TU-0182	No	35	YATE	BLANCO	10.10	3.86	1.77	13.74	3.44	262.5	7.50	1	5	2022-07-26	2022-02-01	1	\N	\N	1
99	MAGIC 1	AGSI-2221	No	42	YATE	AMARILLO	11.24	3.74	0.95	27.50	6.87	315	7.50	1	2	2022-08-11	2022-02-01	1	\N	\N	1
70	BLACK FISH	AGSI-PE-0842	No	24	LANCHA	VERDE	7.92	2.58	1.36	4.88	2.68	247.5	7.50	1	5	2022-08-02	2022-02-01	1	\N	\N	1
55	ANTIKING	AGSI-RE-1239	No	44	YATE	BLANCO	13.28	4.24	1.12	23.96	5.96	330	7.50	1	2	2022-07-29	2022-02-01	1	\N	\N	1
92	INDELEBILIS 	AGSI-RE-GTRAMITE52	No	70	YATE	BLANCO	NO	NO	NO	NO	no	525	7.50	1	2	2022-08-11	2022-02-01	1	\N	\N	1
54	CHICHI	AGSP-RE-1071	No	72	YATE	NEGRO	21.40	5.40	2.82	87.18	21.80	540	7.50	1	2	2022-07-29	2022-02-01	1	\N	\N	1
48	ABU	AGSI-PE-0816	No	28	YATE	BLANCO	8.54	3.00	0.70	0.70	8.14	247.5	7.50	1	4	2022-08-11	2022-02-01	1	\N	\N	1
20	GLADIUS 	AGSI-PE-0532	No	24	LANCHA	BLANCO	7.30	2.74	1.20	4.35	1.96	247.5	7.50	1	4	2022-09-01	2022-02-01	1	\N	\N	1
79	MARES 	AGSI-D-5810	No	55	YATE	BLANCO	16.63	4.64	1.25	84.76	21.19	412.5	7.50	1	2	2022-08-10	2022-02-01	1	\N	\N	1
72	MELY 	AGSP-2214	No	36	YATE	AZUL 	11.00	1.85	3.80	20	20	270	7.50	1	1	2022-08-10	2022-02-01	1	\N	\N	1
67	MY GOD	AGSP-RE-0963	Si	28	PEÑERO	BLANCO	8.30	2.28	1.04	4.17	1.04	165	5	1	1	2022-08-02	2022-02-01	1	se retiro de la marina la embarcacion desde junio 	2022-11-01	0
89	DEL VALLE 	AGSI-D-20765	No	35	LANCHA	BLANCO	NO	NO	NO	NO	NO	175	5	1	3	2022-08-10	2022-02-01	1	la embarcacion inoperativa el propietario la retiro del puerto en agua y de las instalaciones 	2022-11-07	0
110	BOTIJUELA 	AGSI-D-9606	Si	23	LANCHA	AZUL	5.30	2.48	1.15	3.20	NO	115	5	1	7	2022-08-13	2022-02-01	2	la embarcacion se encuentra en estado de abandono por mas de 1 año el propietario no responde a las llamadas y alas cartas enviadas 	2023-01-02	0
41	MI DUSHI	AGSI-RE-1472	No	19	LANCHA	BLANCO	5.50	2.00	0.60	1.39	0.35	95	5	1	6	2022-07-27	2022-02-01	2	se retira de la marina 	2022-10-31	0
94	PA ENCIMA	AGSI-RE-0989	Si	24	LANCHA	AZUL	7.92	2.58	1.36	5.59	2.68	120	5	1	7	2022-08-11	2022-02-01	2	LA EMBARCACION FUE TRASLADADA EN MAYO DEL 2022 PARA PUERTO LA CRUZ Y NO RECRESO EL PROPIETARIO SE LE MANDO MUCHOS COMUNICADOS DE PAGO Y NO PAGO 	2023-02-02	0
108	VALENTINA 	ARSK-D-1085	No	35	LANCHA	BLANCO	NO	NO	NO	NO	NO	175	5	1	7	2022-08-13	2022-02-01	2	autorizado por la directiva el día 28/03/2023 y se le solicito de desalojo de las instalaciones 	2023-03-31	0
91	TAKARABUNE 	AGSI-PE-0288	No	24	PESQUERO	AZUL	no	no	no	no	no	165	5	1	1	2022-08-11	2022-02-01	1	se le solicito desalojo en el mes de marzo y no pudo retirar hasta el dia 12 de abril   	2023-04-12	0
116	VIAJERO	AGSI-D-21173	No	32	VELERO	VINO TINTO	NO	NO	NO	NO	NO	165	5	1	2	2022-08-13	2022-02-01	1	la embarcación esta en abandono desde hace 2 años el propietario no responde 	2023-04-21	0
63	GASPARIN	ADKN-D-7303	Si	20	LANCHA	BLANCO	O	O	O	O	O	100	5	1	7	2022-08-01	2022-02-01	2	la embarcación se retiro de la marina 	2023-04-29	0
49	ROBALO FISH	AGSP-PJ-0066	No	25	LANCHA	AZUL	7.55	2.55	1.35	5.32	1.33	165	5	1	1	2022-07-28	2022-02-01	1	la embarcación se retiro de la marina 	2023-04-29	0
43	CAMIMAR	AGSI-RE-0601	No	22	LANCHA	AMARILLO	6.50	2.30	0.30	0.95	0.24	110	5	1	7	2022-08-24	2022-02-01	2	la embarcación se retiro de la marina por desalojo	2023-04-29	0
124	CORREO CAMINO	AGSI-RE-1587	No	55	VELERO	AZUL	NO	NO	NO	NO	NO	275	5	1	5	2022-08-13	2022-02-01	1	se retira de la marina EN EL MES DE NOIVIEMBRE	2022-11-24	0
120	LANCELOT	AGSI-D-16610	No	42	VELERO	AZUL	NO	NO	NO	NO	NO	210	5	1	2	2022-08-13	2022-02-01	1	entra en desincorporacion desde 2 de diciembre 	2022-12-02	0
111	AUX ACUARELA	AGSI-RE-TRAMITE 000123	No	11	DINGUI 	BLANCO	NO	NO	NO	NO	NO	55	5	1	7	2022-08-13	2022-02-01	2	la embarcación se retiro el 08 de febrero 2023	2023-06-01	0
19	DEL MAR	AGSI-D-22487	No	30	YATE							165	5	1	3	2022-07-26	2022-02-01	1	la embarcacion se retira de la marina pagando toda la deuda tiene 30 dias para retirar	2022-12-18	0
88	BREZZEN	ARSH-D-957	No	27	VELERO	BLANCO Y AZUL	NO	NO	NO	O	NO	247.5	7.50	1	1	2022-08-10	2022-02-01	1	\N	\N	1
3	CURIARA	AGSI-D-5814	No	37	VELERO	BLANCO	11.25	3.00	1.72	14.30	3.57	277.5	7.50	1	1	2022-07-26	2022-02-01	1	\N	\N	1
10	DUENDE I	AGSI-RE-0661	No	45	YATE	BLANCO	13.72	3.54	1.10	29.06	7.26	337.5	7.50	1	1	2022-07-26	2022-02-01	1	\N	\N	1
104	FRIDA	AGSI-RE-TRAMITE 741	No	41	VELERO	BLANCO	NO	NO	NO	NO	NO	307.5	7.50	1	2	2022-08-11	2022-02-01	1	\N	\N	1
13	KAMILA	ARSH-RE-0016	No	52	YATE	BLANCO	14.60	4.20	2.28	39.54	NO	390	7.50	1	2	2022-08-11	2022-02-01	1	\N	\N	1
4	KAYA	AGSI-2720	No	47	VELERO	BLANCO	14.30	4.00	1.90	24.50	10.06	352.5	7.50	1	1	2022-07-28	2022-02-01	1	\N	\N	1
69	MANGUA	AGSI-PJ-0070	No	33	LANCHA	BLANCO	9.00	2.83	0.83	5.93	2.67	247.5	7.50	1	2	2022-08-02	2022-02-01	1	\N	\N	1
121	MANGUANGUA	AGSI-RE-1339	No	47	CATAMARAN	BLANCO	NO	NO	NO	NO	NO	705	7.50	1	2	2022-09-01	2022-02-01	1	\N	\N	1
74	SAMADHI	AGSI-RE-0891	No	32	VELERO	BLANCO	9.70	3.30	1.75	15.18	3.79	247.5	7.50	1	2	2022-08-10	2022-02-01	1	\N	\N	1
8	SIMILIQUIRI	AGSI-RE-1001	No	54	YATE	BLANCO	15.87	4.33	2.28	39.89	9.97	405	7.50	1	1	2022-07-27	2022-02-01	1	\N	\N	1
2	TELUMEE	AGSI-RE-0886	No	46	CATAMARAN	AZUL	14.16	4.49	2.38	18.30	8.23	690	7.50	1	1	2022-07-27	2022-02-01	1	\N	\N	1
38	TIGHT LINE	AGSI-RE-1243	No	53	YATE	BLANCO	16.15	4.88	2.06	33.33	8.33	397.5	7.50	1	5	2022-07-27	2022-02-01	1	\N	\N	1
84	TUNA 	AGSP-D-2875	No	30	LANCHA	BLANCO Y ROJA	10.75	3.75	2.30	14.44	5.78	225	7.50	1	7	2022-08-10	2022-02-01	2	\N	\N	1
27	VIKINGO	AGSI-RE-0606	No	32	YATE	BLANCO	9.94	4.20	1.90	10.00	2.50	247.5	7.50	1	5	2022-07-27	2022-02-01	1	\N	\N	1
81	WAKO	AGSI-D-TRAMI 023	No	15	LANCHA	BLANCO	4.90	1.82	0.70	1.32	0.33	112.5	7.50	1	7	2022-08-10	2022-02-01	2	\N	\N	1
126	WATT S  NEXTT	ADKN-RE-0740	No	63	YATE	BLANCO	18,6	4,8	1,80	39,4	9,85	472.5	7.50	1	5	2022-10-04	2022-02-01	1		\N	1
131	ZARATACO	AGSI-RE-1604	No	50	YATE	AMARILLO	14.81	4.88	2.19	33.03	8.26	375	7.50	1	4	2022-11-13	2022-02-01	1	\N	\N	1
123	MYSTIC	AGSI-D-TR3030	No	30	VELERO	BLANCO	NO	NO	NO	NO	NO	165	5	1	2	2022-08-13	2022-02-01	1	estado de abandono por mas de 3 años el propietario no responde a las llamadas y a las cartas enviadas 	2023-01-02	0
68	WUICHI WUICHA	AGSI-D-2494	No	27	PEÑERO	BLANCO	8.50	2.50	1.40	5.60	2.50	165	5	1	2	2022-08-02	2022-02-01	1	embarcacion hundida por problemas en el compas de caraballeda el dia 16/09/2022	2023-01-02	0
102	STRIKE	AGSI-RE-1324	No	40	YATE	MARRON CLARO	14.14	4.30	1.25	35.25	8.84	300	7.50	1	4	2022-08-13	2022-02-01	1	\N	\N	1
106	KING SAMURAI	Agsi-re-tramite-224466	No	48	LANCHA	BLANCO	NO	NO	NO	NO	NO	360	7.50	1	5	2022-08-11	2022-02-01	1	\N	\N	1
115	FINALLY	ARSH-D-2077	No	80	YATE	BLANCO CON AZUL	NO	NO	NO	NO	NO	600	7.50	1	1	2022-08-13	2022-02-01	1	\N	\N	1
100	AUX.MANGUANGUA	AGSI-re-tramite-098	No	14	DINGUI 	NARANJA 	NO	no	no	no	NO	105	7.50	1	6	2022-08-11	2022-02-01	2	\N	\N	1
96	AUX.MARENOSTRUM	Agsi-re-tramite-3344	No	11	DINGUI 	GRIS	no	no	no	no	no	82.5	7.50	1	6	2022-11-01	2022-02-01	2	\N	\N	1
107	DESTINY 3	AGSI-RE-0805	No	72	YATE	BLANCO	20.72	5.30	3.50	140.23	26.06	540	7.50	1	1	2022-08-11	2022-02-01	1	\N	\N	1
71	EL KID	ARSH-D-1448	No	30	YATE	AZUL	NO	NO	NO	NO	NO	247.5	7.50	1	6	2022-08-05	2022-02-01	1	\N	\N	1
65	GINGER 	AGSI-RE-1404	No	24	LANCHA	CREMA 	7.21	2.43	0.76	2.78	0.70	180	7.50	1	6	2022-08-01	2022-02-01	2	\N	\N	1
45	JEITOSA	AGSI-PE-0879	No	29	LANCHA	VERDE	9.37	3.67	0.58	4.40	1.98	247.5	7.50	1	4	2022-07-26	2022-02-01	1	\N	\N	1
101	MARIEM 3	AQYM-D-050	No	47	YATE	BLANCO	NO	NO	NO	NO	NO	352.5	7.50	1	3	2022-08-11	2022-02-01	1	\N	\N	1
9	MY TOY	AGSI-RE-1098	No	30	YATE	BLANCO	8.90	3.51	0.81	9.03	2.26	247.5	7.50	1	4	2022-07-27	2022-02-01	1	\N	\N	1
5	POSEIDON	AGSI-D-11413	No	32	VELERO	BLANCO	10.70	3.60	2.00	16.65	4.16	247.5	7.50	1	2	2022-07-27	2022-02-01	1	\N	\N	1
97	SEVEN 7	AMSH-RE 0323	No	62	YATE	MARRON CLARO	18.90	5.31	2.65	69.07	17.27	465	7.50	1	4	2022-08-13	2022-02-01	1	\N	\N	1
50	FREEDOM	AGSI-TU-0161	No	45	YATE	AZUL	13.83	4.30	2.12	27.82	6.95	225	5	1	1	2022-07-28	2022-02-01	1	la embarcacion esta solvente hasta septiembre solicito zarpe para puerto la cruz para reparacion y desde entonces no reporto mas pago ( extraoficial se conoce que en propietario viajo a colombia y la embarcacion sigue en puerto la cruz en abandono )	2023-02-01	0
114	ALEXIS	AGSI-RE TRAMITE00332211	No	30	LANCHA	AZUL	NO	NO	NO	NO	NO	165	5	1	3	2022-08-13	2022-02-01	1	el propietario tenia puesto en agua nunca trajo la embarcacion a las instalaciones cancelo al dia hasta julio 2022 pero a la fecha no cancelo mas	2023-02-01	0
78	SAN MICHELL	AGSP-1992	No	43	YATE	BLANCO	13.20	4.10	2.18	32.50	24.50	215	5	1	2	2022-08-10	2022-02-01	1	 notifica que de no poder pagar mas y teniendo el barco inoperativo lo retira de las instalaciones se le da salida el dia 02/02/2023	2023-02-02	0
129	TOXICA	AGSI-1444	No	42	YATE							210	5	1	7	2022-11-01	2022-02-01	2	DESINCORPORADO DE LAS INSTALACIONES EN DICIEMBRE 	2023-02-23	0
128	MGT	CA224625	No	74	YATE	NEGRO	21.61	5.50	1.45	53.97	53.97	370	5	1	2	2022-11-23	2022-02-01	1	DESINCORPORADO DE LAS INSTALACIONES EN DICIEMBRE 	2023-02-23	0
29	MARE NOUTRIOM 	AGSI-D-6150	No	35	YATE	AZUL	10.66	3.10	1.05	20.37	5.10	175	5	1	5	2022-07-26	2022-02-01	1	se retira de la marina en el mes de marzo	2023-03-20	0
47	CHIPIN 	ARSH-RE-0356	No	28	LANCHA	BLANCO	9.63	3.33	0.68	4.62	1.15	140	5	1	7	2022-07-25	2022-02-01	2	el propietario entrega a la marina por carta de desalojo que se le pidio el 20 de marzo	2023-03-27	0
62	SAMGER	AGSI-RE-1354	Si	24	LANCHA	BLANCO Y NEGRO	7.75	2.59	1.50	5.02	1.26	120	5	1	7	2022-08-01	2022-02-01	2	el señor no tenia la embarcacion en la marina desde agosto 2022 y por el reglamento pierde el puesto por no pagar 	2023-04-11	0
98	GUABIGUABI	AGSI-D-1648	No	25	LANCHA	BLANCO CON AZUL	5.50	2.40	1.30	28.33	NO	125	5	1	7	2022-08-11	2022-02-01	2	se le solicito desalojo por deuda y abandono autorizado por el señor eduardo capriles para exoneracion de deuda 	2023-04-12	0
113	GRILLO IV	AGSI-RE- TRAMITE96589	No	31	YATE	BLANCO	NO	NO	NO	NO	NO	165	5	1	2	2022-08-13	2022-02-01	1	la embarcación esta en estado de abandono por tal motivo es retirada de la marina el propietario no responde a las cartas enviadas se llevara a un deposito dejando una deuda de 2511 $ retirando el dia  22/04/2023	2023-04-21	0
64	FANTASY	AGSI-RE-1362	Si	20	LANCHA	AZUL	6.09	2.12	0.73	2.13	1.28	100	5	1	7	2022-08-01	2022-02-01	2	la embarcación se retiro de la marina 	2023-05-02	0
7	MAGIC BLUE	AGSI-RE-1072	No	47	YATE	BLANCO	12.80	4.72	2.70	37.72	9.73	235	5	1	1	2022-07-26	2022-02-01	1	la embarcación se retiro de la marina el dia 31/5/2023	2023-05-31	0
93	DEEP PROYECT	AGSI-RE-TRAMITE87	No	32	VELERO	AZUL	no	no	no	no	no	165	5	1	2	2022-08-11	2022-02-01	1	el señor se presento el día domingo 4 de junio 2023 para retirar la embarcación solo pago 400$ por no tener mas recursos 	2023-06-05	0
73	OHANA 	AGSI-RE-TRAMI01	Si	28	CATAMARAN	BLANCO	8.50	3.80	1.75	0.50	0.60	165	5	1	1	2022-08-10	2022-02-01	1	por orden del jefe eduardo capriles	2023-03-20	0
16	TONINA  	AGSI-RE-0655	No	50	CATAMARAN	BLANCO 	15.24	9	1.50	28	18	250	5	1	1	2022-09-06	2022-02-01	1	el señor retiro la embarcación en febrero por viaje a los roques  y el dia 31 de mayo se comunico para informar que no regresa a la marina dejando una deuda de 1000 $ de los meses febrero, marzo, abril y mayo 2023 	2023-05-31	0
80	PIGMALEON	AGSI-D-6032	No	34	YATE	BLANCO	10.38	3.65	1.50	0.80	24.98	170	5	1	7	2022-08-10	2022-02-01	1	se retira de la marina POR CARTA DE DESALOJO 	2023-05-09	0
105	ACUARELA	AGSI-RE-TRAMITE789	No	47	YATE	AZUL	NO	no	NO	NO	NO	352.5	7.50	1	2	2022-08-11	2022-02-01	1	\N	\N	1
138	AUX TORO	AGSI TRAMITE 14521452	No	35	LANCHA	blanco	9.96	3.00	1.00	8.23	2.05	262.5	7.50	1	6	2023-04-29	2022-02-01	2	\N	\N	1
141	AUX. EQUILOIBRIUM	AGSI-RE-0009	No	28	LANCHA	AZUL Y BLANCO	8.53	2.92	1.60	11.59	2.90	210	7.50	1	6	2023-05-02	2022-02-01	2	\N	\N	1
127	AUX. FAMILY TIME	AGSI-AUXILIAR	No	12	DINGUI 	gris	2	0.7	05	100	150	90	7.50	1	6	2022-10-05	2022-02-01	2	\N	\N	1
144	BLUE SEA	AGSI-RE-0692	No	32	LANCHA	blanco y aqzul	9.80	2.40	1.50	9.90	2.50	240	7.50	1	6	2023-06-01	2022-02-01	2	\N	\N	1
146	CACIOPEA	ADKN-D-57476	No	60	CATAMARAN	BLANCO 	18.29	6.53	1.95	32.50	9.73	900	7.50	1	1	2023-06-21	2022-02-01	1	\N	\N	1
147	MARANELO V	AGSI-RE-0940	No	60	YATE	BLANCO 	18.33	6.25	1.58	51.59	12.90	450	7.50	1	5	2023-06-22	2022-02-01	1	\N	\N	1
148	MARCELLA	ARSH-RE-0255	No	33	LANCHA	BLANCO 	10.02	2.60	0.35	3.69	0.90	247.5	7.50	1	6	2023-06-23	2022-02-01	2	\N	\N	1
133	MYTHOS	AGSI-RE-0346	No	64	YATE	AZUL	19.60	5.70	3.45	87.46	21.86	480	7.50	1	5	2023-01-24	2022-02-01	1	\N	\N	1
142	NAUTILUS	AGSI-TU-0203	No	30	0		9.30	2.70	1.80	6.64	2.81	225	7.50	1	6	2023-05-18	2022-02-01	2	\N	\N	1
136	ONE MORE TOY LANCHA	AGSI-RE-1346	No	32	LANCHA	negro	9.60	2.90	1.80	7.83	1.96	240	7.50	1	6	2023-04-27	2022-02-01	2	\N	\N	1
134	ORINOQUIA 2	AGSI-RE-0544	No	33	LANCHA	blanco	9.96	3.00	1.00	8.23	2.05	247.5	7.50	1	7	2023-02-10	2022-02-01	2	\N	\N	1
143	STRIKER III	AGSI-RE-1573	No	34	LANCHA	verde	10.40	3.50	2.12	14.77	3.69	255	7.50	1	6	2023-06-01	2022-02-01	2	\N	\N	1
40	TITANIA	AGSI-TU-0072	No	14	LANCHA	AZUL	4.40	2.00	0.70	1.30	0.38	105	7.50	1	6	2022-07-27	2022-02-01	2	INGRESA EL 07 MDE JUNIO DEL 2023	2023-06-07	1
137	TORO	JMP-22159	No	88	YATE	blanco y negro	23.95	6.47	3.26	120	96	660	7.50	1	5	2023-04-29	2022-02-01	1	\N	\N	1
132	X FACTOR 	AGSI-RE-1264	No	36	LANCHA	NEGRO	11.05	3.05	1.59	11.87	2.97	270	7.50	1	7	2023-01-20	2022-02-01	2	\N	\N	1
140	EQUILIBRIUM	AGSI-RE-0008	No	82	YATE	AZUL Y BÑLANCO	24.80	6.00	2.25	108.25	27.17	615	7.50	1	1	2023-05-02	2022-02-01	1	\N	\N	1
1	SANS SOUCI	AGSI-D-23005	No	63	YATE	BLANCO	19.30	5.10	1.45	31.57	7.89	472.5	7.50	1	1	2022-07-27	2022-02-01	1		\N	1
150	AMALFI	AGSI-RE-1673	No	80	YATE	BLANCO	24.38	5.89	3.20	90	22.50	600	7.50	1	5	2023-06-29	2022-02-01	1	\N	\N	1
36	INVICTUS 	AGSP-RE-0514	No	63	YATE	AMARILLO	20.40	5.52	1.60	89.43	22.37	472.5	7.50	1	5	2022-08-01	2022-02-01	1	\N	\N	1
61	PURA VIDA	AGSM-RE-0620	No	47	YATE	AZUL	14.27	4.20	2.47	28.85	17.31	352.5	7.50	1	5	2022-08-01	2022-02-01	1	\N	\N	1
53	3D	AGSM-RE-0897	No	50	YATE	BLANCO	15.24	4.90	1.80	44.90	12.08	375	7.50	1	1	2022-08-11	2022-02-01	1	cambio de propietario	2023-05-31	1
135	CORNAMUSA	AGSI-RE-1674	No	36	LANCHA	gris	11.00	2.90	1.10	8.80	2.20	270	7.50	1	6	2023-03-20	2022-02-01	2	\N	\N	1
145	DRAKO 	AGSP-RE.0016	No	24	DINGUI 	gris	7.20	2.66	0.60	4.45	1.11	180	7.50	1	6	2023-06-06	2022-02-01	2	\N	\N	1
149	ONENESS	AGSI-RE-TREMITE1258	No	64	CATAMARAN	GRIS	19.49	9.84	1.70	47.30	33.70	960	7.50	1	5	2023-06-23	2022-02-01	1	\N	\N	1
139	BLACK WHITE	AGSI-RE-1687	No	33	LANCHA	blanco y negro	10.03	3.25	1.84	12.14	7.29	247.5	7.50	1	6	2023-05-02	2022-02-01	2	\N	\N	1
6	TANGAROA	AGSI-RE-1349	No	60	YATE	BLANCO	18.29	4.57	3.10	33.65	8.42	450	7.50	1	1	2022-07-27	2022-02-01	1	\N	\N	1
122	MARUCA	AGSI-D-4396	No	62	YATE	BLANCO	NO	NO	NO	NO	NO	310	5	1	2	2022-09-01	2022-02-01	1	ENTREGA LA EMBARCACION A LA MARINA POR INCAPACIDAD DE PAGO	2023-07-11	0
151	GAVIOTA XII	AGSI-RE-1473	Si	26	YATE	blaco	7.90	3.02	0.71	3.60	0.90	195	7.50	1	6	2023-07-29	2022-02-01	2	\N	\N	1
58	DALI	ARSH-PJ-0034	No	43	CATAMARAN	BLANCO	12.95	7.52	1.98	26.65	12.00	645	7.50	1	2	2022-08-01	2022-02-01	1	Se retira de la Marina de Caraballeda por Incapacidad de PAGO DE CANON DE ARRENDAMIENTO, según notificación de Fecha 05/07/2023.  Por lo tanto queda exonerado el mes de JULIO 2023	2023-07-30	0
152	SIROCCO	AGSI-RE-TRAMITE	No	50	CATAMARAN	BLANCO	14.76	9.1	1.5	30	17.64	750	7.50	1	2	2023-08-02	2022-02-01	1	\N	\N	1
153	ALEXANDRA	AGSI-D-22141	No	15	DINGUI 	GRIS CLARO	4.52	2.05	0.52	1.02	0.25	112.5	7.50	1	7	2023-08-06	2022-02-01	2	\N	\N	1
25	4 CARIBES	AGSI-D-9005	No	31	YATE	BLANCO	10.67	3.00	1.40	11.66	2.91	247.5	7.50	1	3	2022-08-11	2022-02-01	1	el día 9 de agosto del 2023 se retira de las instalaciones a las 6:51 pm teniendo estos días de tramite para el retiro de la misma la embarcación tenia orden de desalojo desde el mes junio del 2023	2023-08-10	0
\.


--
-- TOC entry 3275 (class 0 OID 123922)
-- Dependencies: 257
-- Data for Name: cliente; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cliente (id_cliente, nombre_clien, rif_clien, direccion, telefono, limitecredito, id_vendedor, status, id_usuario, fecha_creacion) FROM stdin;
1	Comercio AMD	J000000	s	041400000	0	1	1	1	2024-02-12
3	Comercio Orinoco	J55555	xxxxx	3333	0	1	1	2	2024-02-17
2	Siled Delgado.	V21151374	santa teresa del tuy	04123934242	1500	2	1	1	2024-02-12
\.


--
-- TOC entry 3276 (class 0 OID 123936)
-- Dependencies: 258
-- Data for Name: descuento; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.descuento (id_desc, desc_desc, porcentaje) FROM stdin;
1	0%	0
2	5%	0.05
\.


--
-- TOC entry 3234 (class 0 OID 84624)
-- Dependencies: 209
-- Data for Name: deta_factura; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.deta_factura (id, matricula, pies, ob, tarifa, dia, canon, monto_estimado, id_fact, id_tarifa) FROM stdin;
34	ARSH-PJ-0034	43	2022-07-05	1	1	215	215	24	1
36	AGSI-RE-TRAMI01	28	2022-05-01	1	1	165	165	26	1
37	AGSI-RE-0544	33	2023-06-01	2	1	165	165	27	2
38	Agsi-re-0678	42	2023-06-01	1	1	210	210	28	1
\.


--
-- TOC entry 3278 (class 0 OID 132128)
-- Dependencies: 260
-- Data for Name: deta_recibo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.deta_recibo (id, cedula, code1, cantidad, cot_u, sub_t, id_des, t_desc, total, id_fact, fecha_reg) FROM stdin;
3	J000000	222	10	 9,63	96,3	0	0	96,3	3	2024-02-05
3	J000000	331086	20	 17,50	350	0	0	350	3	2024-02-05
4	J55555	222	1	 9,63	9,63	0	0	9,63	4	2024-02-20
4	J55555	288	33	 4,73	156,09	0	0	156,09	4	2024-02-20
4	J55555	223	1	 5,30	5,3	0	0	5,3	4	2024-02-20
4	J55555	101	1	 10,50	10,5	5	0,53	9,97	4	2024-02-20
4	J55555	331086	12	 17,50	210	5	10,5	199,5	4	2024-02-20
4	J55555	5670	1	 10,50	10,5	0	0	10,5	4	2024-02-20
4	J55555	105	1	 4,73	4,73	0	0	4,73	4	2024-02-20
6	J000000	288	10	 4,73	47,3	0	0	47,3	6	2024-02-20
7	J55555	331086	16	 17,50	280	0	0	280	7	2024-02-20
8	J55555	101	8	 10,50	84	0	0	84	8	2024-02-20
2	V21151374	222	0	 9,63	96,3	5	4,82	91,48	2	2024-02-20
\.


--
-- TOC entry 3236 (class 0 OID 84629)
-- Dependencies: 211
-- Data for Name: deta_recibo1; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.deta_recibo1 (id, matricula, pies, ob, tarifa, dia, canon, monto_estimado, totald, totalb, id_fact, id_tarifa, cot_u, code1, sub_t, id_des, t_desc) FROM stdin;
1	V21151374	10	\N	\N	\N	91,48	\N	\N	\N	1	\N	 9,63	222	96,3	5	4,82
188	J000000	5	\N	\N	\N	87,5	\N	\N	\N	148	\N	 17,50	331086	87,5	0	0
189	J000000	1	\N	\N	\N	9,63	\N	\N	\N	148	\N	 9,63	222	9,63	0	0
\.


--
-- TOC entry 3238 (class 0 OID 84637)
-- Dependencies: 213
-- Data for Name: dolar; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dolar (id_dolar, desc_dolarc, desc_dolarp) FROM stdin;
1	5.77	5.68
\.


--
-- TOC entry 3240 (class 0 OID 84642)
-- Dependencies: 215
-- Data for Name: empresa; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.empresa (id, descripcion, rif, fecha, fecha_update) FROM stdin;
1	MINIMARKET LA TRAMPA C.A	J501228442	2022-02-04 00:00:00	2022-02-04 00:00:00
\.


--
-- TOC entry 3241 (class 0 OID 84645)
-- Dependencies: 216
-- Data for Name: estatus; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.estatus (id_status, descripcion, fecha_reg, fecha_update) FROM stdin;
1	Anulado	2022-06-29	2022-06-29 00:00:00
2	Pagado	2022-03-07	2022-03-07 00:00:00
0	Deuda	2022-06-29	2022-06-29 00:00:00
3	Abonado	2022-07-02	2022-07-02 00:00:00
\.


--
-- TOC entry 3242 (class 0 OID 84652)
-- Dependencies: 217
-- Data for Name: factura; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.factura (id, nro_factura, nombre, matricula, tele_1, total_iva, total_mas_iva, total_bs, fechaingreso, id_status, fecha_update, valor_iva, cedula, id_tipo_pago, id_banco, nro_referencia, fechatrnas, nombrep, cedulap) FROM stdin;
1	0000000001	DALI	ARSH-PJ-0034	NO	191.52	1388.52	249.29	2022-08-03	2	2022-08-03	5.57	V-9487054	1	10	12580027498/32111	2022-07-11	\N	\N
26	00002	OHANA 	AGSI-RE-TRAMI01	04241595502	137.28	995.28	191.40	2022-10-12	1	2023-03-14	5.20	V-12164617	1	2	96840644	2022-06-12	\N	\N
27	00003	ORINOQUIA 2	AGSI-RE-0544	04142329477	660	4785	191.40	2023-07-28	2	2023-07-28	25	J-295980469	3	0		2023-05-18	\N	\N
28	00004	CEST LA VIE 	Agsi-re-0678	04143354740	705.6	5115.6	243.60	2023-08-08	1	2023-08-08	21	V-13727447	3	0		2023-02-03	\N	\N
\.


--
-- TOC entry 3268 (class 0 OID 123823)
-- Dependencies: 250
-- Data for Name: marca; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.marca (id_marca, desc_marca, id_usuario, fecha) FROM stdin;
1	Coca-Cola Orig	1	2024-02-06
2	Glup	1	2024-02-06
3	Pepsi	1	2024-02-06
4	Schweppes	1	2024-02-06
5	Nevada	1	2024-02-06
6	Fresh	1	2024-02-06
7	Justy	1	2024-02-06
8	Powerade	1	2024-02-06
9	Zulia	1	2024-02-06
10	Regional	1	2024-02-06
11	Natulac	1	2024-02-06
\.


--
-- TOC entry 3244 (class 0 OID 84660)
-- Dependencies: 219
-- Data for Name: mensualidad; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mensualidad (id_mensualidad, matricula, pies, id_tarifa, tarifa, dia, canon, fecha_deuda, id_status, fecha_reg, fecha_update, id_factura, nro_factura, nota, fechapago) FROM stdin;
398	AGSI-RE-TRAMITE7458	115	1	5	1	575	2022-05-01	0	2022-05-01	2022-05-01 00:00:00	0	0		2022-11-22
518	AGSI-RE-TRAMITE7458	115	1	5	1	575	2022-06-01	0	2022-06-01	2022-06-01 00:00:00	0	0		2022-11-22
638	AGSI-RE-TRAMITE7458	115	1	5	1	575	2022-07-01	0	2022-07-01	2022-07-01 00:00:00	0	0		2022-11-22
273	AGSI-D-20765	35	1	5	1	175	2022-04-01	2	2022-04-01	2022-08-31 02:48:17	0	0000000612	en el mes de agosto pago abril 	2022-11-22
107	AGSI-TU-0058	48	1	1	1	48	2022-02-01	2	2022-02-01	2022-08-30 10:22:14	0	0000000611	CUENTA POR COBRAR VENETUR POR TRANSFERENCIA REALIZADA A LA CTA MARINAS DE VENETUR SEGUN REFERENCIAS	2022-11-22
586	AGSI-D-5926	63	1	5	1	315	2022-06-01	2	2022-06-01	2022-09-12 07:34:45	0	0000000621		2022-11-22
282	AGSI-TU-0161	45	1	5	1	225	2022-04-01	2	2022-04-01	2022-09-12 07:42:34	0	0000000623		2022-11-22
408	AGSI-PE-0532	24	1	5	1	165	2022-05-01	2	2022-05-01	2022-09-12 08:09:25	0	0000000628		2022-11-22
310	AGSI-D-5810	55	1	5	1	275	2022-04-01	2	2022-04-01	2022-09-12 10:05:55	0	0000000632		2022-11-22
430	AGSI-D-5810	55	1	5	1	275	2022-05-01	2	2022-05-01	2022-09-12 10:06:15	0	0000000633		2022-11-22
550	AGSI-D-5810	55	1	5	1	275	2022-06-01	2	2022-06-01	2022-09-12 10:06:45	0	0000000634		2022-11-22
726	AGSI-D-5535	42	1	5	1	210	2022-08-01	2	2022-08-01	2022-08-23 11:53:20	0	0000000543		2022-11-22
599	AGSI-D-TRAMI 023	15	2	5	1	75	2022-06-01	2	2022-06-01	2022-09-16 07:32:22	0	0000000640		2022-11-22
642	AGSI-TU-0161	45	1	5	1	225	2022-07-01	2	2022-07-01	2022-09-16 07:37:15	0	0000000644		2022-11-22
568	AGSI-D-11413	32	1	5	1	165	2022-06-01	2	2022-06-01	2022-09-17 03:06:26	0	0000000650	PAGO JUMIO EN SEPTIEMBRE 	2022-11-22
542	Agsi-re-tramite-224466	48	1	5	1	240	2022-06-01	2	2022-06-01	2022-09-28 02:27:49	0	0000000671		2022-11-22
632	AGSI-D-22487	30	1	5	1	165	2022-07-01	2	2022-07-01	2022-09-28 06:10:18	0	0000000680	numero de deposito 91254703	2022-11-22
602	AGSI-D-9005	31	1	5	1	165	2022-07-01	2	2022-07-01	2022-09-29 07:07:50	0	0000000684		2022-11-22
371	AGSI-RE-TRAMITE 000123	11	2	5	1	55	2022-05-01	2	2022-05-01	2022-09-30 02:53:50	0	0000000696		2022-11-22
491	AGSI-RE-TRAMITE 000123	11	2	5	1	55	2022-06-01	2	2022-06-01	2022-09-30 02:54:09	0	0000000697		2022-11-22
498	AGSI-RE-22326	33	1	5	1	165	2022-06-01	2	2022-06-01	2022-09-30 07:17:13	0	0000000701		2022-11-22
618	AGSI-RE-22326	33	1	5	1	165	2022-07-01	2	2022-07-01	2022-09-30 07:17:38	0	0000000702		2022-11-22
528	AGSI-PE-0532	24	1	5	1	165	2022-06-01	2	2022-06-01	2022-10-04 04:49:53	0	0000000737		2022-11-22
648	AGSI-PE-0532	24	1	5	1	165	2022-07-01	2	2022-07-01	2022-10-04 04:50:47	0	0000000738		2022-11-22
544	AGSI-2221	42	1	5	1	210	2022-06-01	2	2022-06-01	2022-10-04 10:59:52	0	0000000744		2022-11-22
635	AGSI-TU-0182	35	1	5	1	175	2022-07-01	2	2022-07-01	2022-10-08 08:58:15	0	0000000759		2022-11-22
393	AGSI-D-20765	35	1	5	1	175	2022-05-01	2	2022-05-01	2022-10-11 03:54:01	0	0000000771		2022-11-22
513	AGSI-D-20765	35	1	5	1	175	2022-06-01	2	2022-06-01	2022-10-11 03:54:27	0	0000000772		2022-11-22
633	AGSI-D-20765	35	1	5	1	175	2022-07-01	2	2022-07-01	2022-10-11 03:55:02	0	0000000773		2022-11-22
401	ARSH-D-2077	80	1	5	1	400	2022-05-01	2	2022-05-01	2022-10-11 06:05:25	0	0000000778		2022-11-22
521	ARSH-D-2077	80	1	5	1	400	2022-06-01	2	2022-06-01	2022-10-11 06:05:57	0	0000000779		2022-11-22
641	ARSH-D-2077	80	1	5	1	400	2022-07-01	2	2022-07-01	2022-10-11 06:06:23	0	0000000780		2022-11-22
524	AGSI-D-5426	35	2	5	1	175	2022-06-01	2	2022-06-01	2022-10-31 11:42:27	0	0000000815	el propietario entrega la embarcacion a la marina 	2022-11-22
1232	CA224625	74	1	5	1	370	2022-10-01	2	2022-10-01	2022-11-23 07:43:00	0	0000000948		2022-11-23
1233	CA224625	74	1	5	1	370	2022-11-01	2	2022-10-01	2022-11-23 07:43:32	0	0000000949		2022-11-23
1228	AGSI-1444	42	2	5	1	210	2022-09-01	2	2022-08-01	2022-11-23 09:21:58	0	0000000955		2022-11-23
1229	AGSI-1444	42	2	5	1	210	2022-10-01	2	2022-08-01	2022-11-23 09:23:00	0	0000000956		2022-11-23
1230	AGSI-1444	42	2	5	1	210	2022-11-01	2	2022-08-01	2022-11-23 09:23:31	0	0000000957		2022-11-23
765	ADKN-D-7303	20	2	5	1	100	2022-08-01	2	2022-08-01	2022-08-29 07:14:33	0	0000000553		2022-11-22
423	AGSI-D-16610	42	1	5	1	210	2022-05-01	2	2022-05-01	2022-12-02 06:50:10	0	0000000969		2022-12-02
543	AGSI-D-16610	42	1	5	1	210	2022-06-01	2	2022-06-01	2022-12-02 06:50:50	0	0000000970		2022-12-02
759	AGSI-RE-0575	40	1	5	1	200	2022-08-01	2	2022-08-01	2022-08-29 06:26:42	0	0000000552		2022-11-22
376	AGSI-D-9606	23	2	5	1	115	2022-05-01	2	2022-05-01	2023-01-02 01:52:37	0	0000001104	embarcacion en abandono por mas de 1 años se le a notificado al propietario y se le presento en muchas ocaciones la carte de cobranza con la nota del desalojo incluso llamadas telefonicas y el propietario nunca respondio a los llamados en marzo del 2022 fue retirada del puesto en agua 	2023-01-02
644	AGSI-D-5426	35	2	5	1	175	2022-07-01	2	2022-07-01	2022-10-31 11:42:47	0	0000000816	el propietario entrega la embarcacion a la marina 	2022-11-22
267	AGSI-RE-1587	55	1	5	1	275	2022-04-01	2	2022-04-01	2022-11-10 09:48:16	0	0000000890		2022-11-22
387	AGSI-RE-1587	55	1	5	1	275	2022-05-01	2	2022-05-01	2022-11-10 09:48:56	0	0000000891		2022-11-22
627	AGSI-RE-1587	55	1	5	1	275	2022-07-01	2	2022-07-01	2022-11-10 09:49:39	0	0000000893		2022-11-22
554	AGSI-D-4396	62	1	5	1	310	2022-06-01	2	2022-06-01	2023-03-20 05:42:15	0	0000001401	se desincorporar por orden de la directiva 	2023-03-20
476	ARSK-D-1085	35	2	5	1	175	2022-05-01	2	2022-05-01	2023-03-31 05:51:06	0	0000001429	autorizado por la directiva el día 28/03/2023 y se le solicito de desalojo de las instalaciones 	2023-03-31
477	AGSI-D-21173	32	1	5	1	165	2022-05-01	2	2022-05-01	2023-04-01 02:41:54	0	0000001456	embarcacion en abandono por mas de 3 años propietarios no responden a los comunicados se le dio desincorporacion 01/04/2023	2023-04-01
291	AGSI-D-1648	25	2	5	1	125	2022-04-01	2	2022-04-01	2023-04-12 03:34:20	0	0000001506	se le solicito desalojo por deuda y abandono autorizado por el señor eduardo capriles para exoneracion de deuda 	2023-04-12
531	AGSI-D-1648	25	2	5	1	125	2022-06-01	2	2022-06-01	2023-04-12 05:24:06	0	0000001508	se le solicito desalojo por deuda y abandono autorizado por el señor eduardo capriles para exoneracion de deuda 	2023-04-12
410	AGSI-RE- TRAMITE96589	31	1	5	1	165	2022-05-01	2	2022-05-01	2023-04-21 07:57:54	0	0000001551	la embarcación esta en estado de abandono por tal motivo es retirada de la marina el propietario no responde a las cartas enviadas se llevara a un deposito dejando una deuda de 2511 $	2023-04-21
353	AGSI-D-15916	40	1	5	1	200	2022-04-01	2	2022-04-01	2023-05-02 03:35:24	0	0000001588	EL PROPIETARIO NO RESPONDE A LOS COMUNICADOS NI SE HA PRESENTADO EN LA MARINA POR MAS DE 1 AÑO SE PROSEDE HACER DESINCORPORACION 	2023-05-02
593	AGSI-D-15916	40	1	5	1	200	2022-06-01	2	2022-06-01	2023-05-02 03:36:06	0	0000001590	EL PROPIETARIO NO RESPONDE A LOS COMUNICADOS NI SE HA PRESENTADO EN LA MARINA POR MAS DE 1 AÑO SE PROSEDE HACER DESINCORPORACION 	2023-05-02
718	AGSI-RE-0606	32	1	5	1	165	2022-07-01	2	2022-07-01	2022-08-24 07:15:44	0	0000000548		2022-11-22
741	AGSI-RE-0437	30	1	5	1	165	2022-08-01	2	2022-08-01	2022-08-24 05:41:52	0	0000000544		2022-11-22
65	AGSI-RE-1072	47	1	1	1	47	2022-02-01	2	2022-02-01	2022-08-30 09:38:30	0	0000000610	CUENTA POR COBRAR VENETUR POR TRANSFERENCIA REALIZADA EL 31-01-22 SEGUN REFERENCIA  A LA CUENTA BCO VZLA DE MARINAS VENETUR.	2022-11-22
701	AGSI-RE-1303	63	1	5	1	315	2022-07-01	2	2022-07-01	2022-08-30 08:25:49	0	0000000609	PAGADO EL 08-07-22	2022-11-22
461	AGSI-RE-1303	63	1	5	1	315	2022-05-01	2	2022-05-01	2022-08-30 08:24:13	0	0000000608	PAGADO EL 06-06-22	2022-11-22
844	AGSI-PE-0816	28	1	1	1	165	2022-09-01	2	2022-08-27	2022-08-27 00:00:00	0	0		2022-11-22
600	AGSP-RE-0587	25	2	5	1	125	2022-06-01	2	2022-06-01	2022-08-30 08:10:52	0	0000000607	PAGADO EL 22-06-22	2022-11-22
825	AGSI-RE-1593	23	2	5	1	115	2022-08-01	2	2022-08-01	2022-08-30 08:01:56	0	0000000606		2022-11-22
167	AGSI-RE-1404	24	2	1	1	24	2022-03-01	2	2022-03-01	2022-08-30 05:34:46	0	0000000605		2022-11-22
53	AGSI-RE-0169	36	2	1	1	36	2022-02-01	2	2022-02-01	2022-08-30 04:53:11	0	0000000604	CUENTAS POR COBRAR VENETUR. TRANSFERENCIA REALIZADA A LA CUENTA VENETUR BCO VENEZUELA SEGUN REFERENCIA 151644896	2022-11-22
400	AGSI-RE-1362	20	2	5	1	100	2022-05-01	2	2022-05-01	2022-08-30 04:42:26	0	0000000603	transferencia referencia 7929 por 360  25-05 y referencia 2438  por 98  de fecha 23-05	2022-11-22
329	AGSM-RE-0620	47	1	5	1	235	2022-04-01	2	2022-04-01	2022-08-26 12:02:37	0	0000000601		2022-11-22
512	AGSI-D-22487	30	1	5	1	165	2022-06-01	2	2022-06-01	2022-08-24 06:28:15	0	0000000600	DEPOSITO EN DIVISA BANCO BNC	2022-11-22
32	AGSI-D-22487	30	1	1	1	33	2022-02-01	2	2022-02-01	2022-08-24 06:25:24	0	0000000599	transferencia realizada en la cuenta de VENETUR   según referencia 12486062260 de fecha 02-02-2022 \n CUENTAS POR COBRAR VENETUR.	2022-11-22
308	AGSI-RE-1339	47	1	5	1	235	2022-04-01	2	2022-04-01	2022-08-23 11:29:11	0	0000000598	TRANSFERENCIA 137896 DE FECHA 25-05 POR 531.25 Y TRANSF 13233010 DE FECHA 01-07 POR 631.41	2022-11-22
86	AGSI-RE-TRAMITE 456	48	1	1	1	48	2022-02-01	2	2022-02-01	2022-08-23 10:01:45	0	0000000597		2022-11-22
643	AGSI-RE-TRAMITE 741	41	1	5	1	205	2022-07-01	2	2022-07-01	2022-08-23 09:59:35	0	0000000596		2022-11-22
582	AMSH-RE 0323	62	1	5	1	310	2022-06-01	2	2022-06-01	2022-08-23 09:28:21	0	0000000595		2022-11-22
222	AMSH-RE 0323	62	1	1	1	62	2022-03-01	2	2022-03-01	2022-08-23 09:25:55	0	0000000594		2022-11-22
277	ARSH-D-1448	30	1	5	1	165	2022-04-01	2	2022-04-01	2022-08-23 09:22:01	0	0000000593		2022-11-22
692	AGSP-PJ-0066	25	1	5	1	165	2022-07-01	2	2022-07-01	2022-08-23 07:41:09	0	0000000592		2022-11-22
452	AGSP-PJ-0066	25	1	5	1	165	2022-05-01	2	2022-05-01	2022-08-23 07:37:22	0	0000000591	deposito en efectivo divisa	2022-11-22
332	AGSP-PJ-0066	25	1	5	1	165	2022-04-01	2	2022-04-01	2022-08-23 07:32:43	0	0000000590	transferencia 88106671 es de fecha 22-04  por 146,52 bs y transf  9264 de fecha 27-04 por 585,90	2022-11-22
829	AGSI-RE-1349	60	1	5	1	300	2022-08-01	2	2022-08-01	2022-08-23 07:16:19	0	0000000589		2022-11-22
589	AGSI-RE-1349	60	1	5	1	300	2022-06-01	2	2022-06-01	2022-08-23 07:10:27	0	0000000588	deposito en efectivo divisa	2022-11-22
708	AGSI-PE-0288	24	1	5	1	165	2022-07-01	2	2022-07-01	2022-08-23 07:02:04	0	0000000587		2022-11-22
468	AGSI-PE-0288	24	1	5	1	165	2022-05-01	2	2022-05-01	2022-08-23 07:01:03	0	0000000586		2022-11-22
151	AGSI-RE-TRAMITE87	32	1	1	1	33	2022-03-01	2	2022-03-01	2022-08-23 06:56:19	0	0000000585		2022-11-22
672	AQYM-D-050	47	1	5	1	235	2022-07-01	2	2022-07-01	2022-08-23 06:52:12	0	0000000584		2022-11-22
552	AQYM-D-050	47	1	5	1	235	2022-06-01	2	2022-06-01	2022-08-23 06:50:14	0	0000000583		2022-11-22
432	AQYM-D-050	47	1	5	1	235	2022-05-01	2	2022-05-01	2022-08-23 06:46:35	0	0000000582		2022-11-22
312	AQYM-D-050	47	1	5	1	235	2022-04-01	2	2022-04-01	2022-08-23 06:45:29	0	0000000581		2022-11-22
192	AQYM-D-050	47	1	1	1	47	2022-03-01	2	2022-03-01	2022-08-23 06:40:23	0	0000000580		2022-11-22
72	AQYM-D-050	47	1	1	1	47	2022-02-01	2	2022-02-01	2022-08-23 06:38:32	0	0000000579		2022-11-22
806	AGSI-RE-TRAMITE 456	48	1	5	1	240	2022-08-01	2	2022-08-01	2022-09-01 08:53:51	0	0000000578		2022-11-22
775	AGSI-D-10408	28	1	5	1	165	2022-08-01	2	2022-08-01	2022-09-01 08:12:22	0	0000000577		2022-11-22
828	AGSI-PE-0288	24	1	5	1	165	2022-08-01	2	2022-08-01	2022-09-01 07:48:28	0	0000000576		2022-11-22
792	AQYM-D-050	47	1	5	1	235	2022-08-01	2	2022-08-01	2022-08-30 10:57:49	0	0000000575		2022-11-22
827	AGSI-TU-0058	48	1	5	1	240	2022-08-01	2	2022-08-01	2022-08-30 10:29:13	0	0000000574		2022-11-22
785	AGSI-RE-1072	47	1	5	1	235	2022-08-01	2	2022-08-01	2022-08-30 09:43:44	0	0000000573		2022-11-22
767	AGSI-RE-1404	24	2	5	1	120	2022-08-01	2	2022-08-01	2022-08-30 05:40:12	0	0000000572		2022-11-22
813	APNN-D-675	35	2	5	1	175	2022-08-01	2	2022-08-01	2022-08-29 06:58:09	0	0000000571		2022-11-22
831	AGSI-RE-1243	53	1	5	1	265	2022-08-01	2	2022-08-01	2022-08-25 11:50:20	0	0000000570		2022-11-22
814	AGSI-RE-0891	32	1	5	1	165	2022-08-01	2	2022-08-01	2022-08-24 08:48:57	0	0000000569		2022-11-22
838	AGSI-RE-0606	32	1	5	1	165	2022-08-01	2	2022-08-01	2022-08-24 07:16:23	0	0000000568		2022-11-22
810	AGSI-RE-0205	58	1	5	1	290	2022-08-01	2	2022-08-01	2022-08-24 05:49:38	0	0000000567		2022-11-22
779	AGSI-PE-0879	29	1	5	1	165	2022-08-01	2	2022-08-01	2022-08-23 09:19:52	0	0000000566		2022-11-22
812	AGSP-PJ-0066	25	1	5	1	165	2022-08-01	2	2022-08-01	2022-08-23 07:42:21	0	0000000565		2022-11-22
2	AGSI-D-9005	31	1	1	1	33	2022-02-01	2	2022-02-01	2022-08-16 02:38:57	0	0000000564		2022-11-22
763	AGSI-RE-TRAMITE 741	41	1	5	1	205	2022-08-01	2	2022-08-01	2022-09-01 08:56:10	0	0000000563		2022-11-22
750	ARSH-PJ-0034	43	1	5	1	215	2022-08-01	2	2022-08-01	2022-09-01 08:55:09	0	0000000562		2022-11-22
743	AGSP-RE-1071	72	1	5	1	360	2022-08-01	2	2022-08-01	2022-09-01 07:22:52	0	0000000561	PAGA ENCARGADA ELAINE 	2022-11-22
751	AGSI-RE-TRAMITE87	32	1	5	1	165	2022-08-01	2	2022-08-01	2022-08-31 08:15:53	0	0000000560		2022-11-22
707	AGSI-TU-0058	48	1	5	1	240	2022-07-01	2	2022-07-01	2022-08-30 10:28:14	0	0000000559		2022-11-22
737	ARSH-D-957	27	1	5	1	165	2022-08-01	2	2022-08-01	2022-08-30 09:59:59	0	0000000558		2022-11-22
705	AGSI-RE-1593	23	2	5	1	115	2022-07-01	2	2022-07-01	2022-08-30 08:00:48	0	0000000557		2022-11-22
696	AGSI-D-23325	27	1	5	1	165	2022-07-01	2	2022-07-01	2022-08-30 07:39:45	0	0000000556		2022-11-22
695	AGSI-RE-1354	24	2	5	1	120	2022-07-01	2	2022-07-01	2022-08-30 05:25:59	0	0000000555		2022-11-22
760	AGSI-RE-1362	20	2	5	1	100	2022-08-01	2	2022-08-01	2022-08-30 04:47:07	0	0000000554		2022-11-22
711	AGSI-RE-1243	53	1	5	1	265	2022-07-01	2	2022-07-01	2022-08-25 11:49:22	0	0000000551		2022-11-22
724	AGSI-PE-0816	28	1	5	1	165	2022-08-01	2	2022-08-01	2022-08-25 10:48:19	0	0000000550		2022-11-22
694	AGSI-RE-0891	32	1	5	1	165	2022-07-01	2	2022-07-01	2022-08-24 08:48:26	0	0000000549		2022-11-22
698	AGSI-PE-0829	34	1	5	1	170	2022-07-01	2	2022-07-01	2022-08-24 06:55:32	0	0000000547		2022-11-22
734	AGSI-RE-0268	58	1	5	1	290	2022-08-01	2	2022-08-01	2022-08-24 05:56:57	0	0000000546		2022-11-22
690	AGSI-RE-0205	58	1	5	1	290	2022-07-01	2	2022-07-01	2022-08-24 05:48:42	0	0000000545		2022-11-22
729	AGSI-PE-0830	23	1	5	1	165	2022-08-01	2	2022-08-01	2022-08-23 11:41:59	0	0000000542		2022-11-22
746	AGSM-D-1776	43	1	5	1	215	2022-08-01	2	2022-08-01	2022-08-23 11:02:31	0	0000000541		2022-11-22
700	AGSI-D-23647	36	1	5	1	180	2022-07-01	2	2022-07-01	2022-08-23 09:47:43	0	0000000540		2022-11-22
704	AGSI-RE-1324	40	1	5	1	200	2022-07-01	2	2022-07-01	2022-08-23 09:44:28	0	0000000539		2022-11-22
702	AMSH-RE 0323	62	1	5	1	310	2022-07-01	2	2022-07-01	2022-08-23 09:28:51	0	0000000538		2022-11-22
845	AGSI-RE-1072	47	1	1	1	235	2022-09-01	2	2022-09-02	2022-09-02 00:00:00	0	0		2022-11-22
756	AGSI-RE-0661	45	1	5	1	225	2022-08-01	2	2022-08-01	2022-08-23 09:00:02	0	0000000537		2022-11-22
703	AGSI-RE-1001	54	1	5	1	270	2022-07-01	2	2022-07-01	2022-08-23 07:54:05	0	0000000536		2022-11-22
709	AGSI-RE-1349	60	1	5	1	300	2022-07-01	2	2022-07-01	2022-08-23 07:14:20	0	0000000535		2022-11-22
631	AGSI-RE-TRAMITE87	32	1	5	1	165	2022-07-01	2	2022-07-01	2022-08-31 08:15:17	0	0000000534		2022-11-22
629	AGSI-D-5814	37	1	5	1	185	2022-07-01	2	2022-07-01	2022-08-30 10:55:27	0	0000000533		2022-11-22
617	ARSH-D-957	27	1	5	1	165	2022-07-01	2	2022-07-01	2022-08-30 09:58:56	0	0000000532		2022-11-22
665	AGSI-RE-1072	47	1	5	1	235	2022-07-01	2	2022-07-01	2022-08-30 09:42:44	0	0000000531		2022-11-22
623	AGSP-RE-1071	72	1	5	1	360	2022-07-01	2	2022-07-01	2022-08-30 08:46:00	0	0000000530		2022-11-22
678	AGSI-RE-0753	60	1	5	1	300	2022-07-01	2	2022-07-01	2022-08-30 08:30:50	0	0000000529		2022-11-22
671	ADKN-2106	44	1	5	1	220	2022-07-01	2	2022-07-01	2022-08-30 07:53:19	0	0000000528		2022-11-22
687	AGSI-D-6032	34	1	5	1	170	2022-07-01	2	2022-07-01	2022-08-30 07:28:38	0	0000000527		2022-11-22
620	AGSI-D- 2796	27	1	5	1	165	2022-07-01	2	2022-07-01	2022-08-30 07:25:00	0	0000000526		2022-11-22
647	AGSI-RE-1404	24	2	5	1	120	2022-07-01	2	2022-07-01	2022-08-30 05:39:24	0	0000000525		2022-11-22
653	AGSI-RE-0169	36	2	5	1	180	2022-07-01	2	2022-07-01	2022-08-30 04:57:30	0	0000000524		2022-11-22
640	AGSI-RE-1362	20	2	5	1	100	2022-07-01	2	2022-07-01	2022-08-30 04:46:13	0	0000000523		2022-11-22
645	ADKN-D-7303	20	2	5	1	100	2022-07-01	2	2022-07-01	2022-08-29 07:11:24	0	0000000522		2022-11-22
624	ARSH-RE-0356	28	2	5	1	140	2022-07-01	2	2022-07-01	2022-08-29 07:02:11	0	0000000521		2022-11-22
654	AGSI-RE-1420	60	1	5	1	300	2022-07-01	2	2022-07-01	2022-08-29 06:53:12	0	0000000520		2022-11-22
639	AGSI-RE-0575	40	1	5	1	200	2022-07-01	2	2022-07-01	2022-08-29 06:25:45	0	0000000519		2022-11-22
689	AGSM-RE-0620	47	1	5	1	235	2022-07-01	2	2022-07-01	2022-08-26 12:13:32	0	0000000518		2022-11-22
655	AGSI-D-10408	28	1	5	1	165	2022-07-01	2	2022-07-01	2022-08-24 06:09:44	0	0000000517		2022-11-22
675	AGSI-RE-1176	81	1	5	1	405	2022-07-01	2	2022-07-01	2022-08-24 06:06:55	0	0000000516		2022-11-22
614	AGSI-RE-0268	58	1	5	1	290	2022-07-01	2	2022-07-01	2022-08-24 05:55:51	0	0000000515		2022-11-22
621	AGSI-RE-0437	30	1	5	1	165	2022-07-01	2	2022-07-01	2022-08-24 05:40:41	0	0000000514		2022-11-22
622	Agsi-re-0678	42	1	5	1	210	2022-07-01	2	2022-07-01	2022-08-23 11:40:28	0	0000000513		2022-11-22
673	ARSH-D-1850	85	1	5	1	425	2022-07-01	2	2022-07-01	2022-08-23 11:21:40	0	0000000512		2022-11-22
626	AGSM-D-1776	43	1	5	1	215	2022-07-01	2	2022-07-01	2022-08-23 11:01:21	0	0000000511		2022-11-22
686	AGSI-RE-TRAMITE 456	48	1	5	1	240	2022-07-01	2	2022-07-01	2022-08-23 10:05:39	0	0000000510		2022-11-22
637	ARSH-D-1448	30	1	5	1	165	2022-07-01	2	2022-07-01	2022-08-23 09:23:45	0	0000000509		2022-11-22
636	AGSI-RE-0661	45	1	5	1	225	2022-07-01	2	2022-07-01	2022-08-23 08:58:25	0	0000000508		2022-11-22
680	AGSI-RE-1098	30	1	5	1	165	2022-07-01	2	2022-07-01	2022-08-23 08:57:22	0	0000000507		2022-11-22
592	AGSI-TU-0072	14	2	5	1	70	2022-06-01	2	2022-06-01	2022-08-30 10:38:54	0	0000000506		2022-11-22
587	AGSI-TU-0058	48	1	5	1	240	2022-06-01	2	2022-06-01	2022-08-30 10:27:43	0	0000000505		2022-11-22
545	AGSI-RE-1072	47	1	5	1	235	2022-06-01	2	2022-06-01	2022-08-30 09:42:15	0	0000000504		2022-11-22
601	AGSM-RE-0897	50	1	5	1	250	2022-07-01	2	2022-07-01	2022-08-30 08:49:38	0	0000000503		2022-11-22
610	AGSI-RE-1239	44	1	5	1	220	2022-07-01	2	2022-07-01	2022-08-30 08:37:05	0	0000000502		2022-11-22
558	AGSI-RE-0753	60	1	5	1	300	2022-06-01	2	2022-06-01	2022-08-30 08:30:08	0	0000000501		2022-11-22
581	AGSI-RE-1303	63	1	5	1	315	2022-06-01	2	2022-06-01	2022-08-30 08:25:01	0	0000000500	PAGADO EL 08-07-22	2022-11-22
585	AGSI-RE-1593	23	2	5	1	115	2022-06-01	2	2022-06-01	2022-08-30 08:00:25	0	0000000499		2022-11-22
551	ADKN-2106	44	1	5	1	220	2022-06-01	2	2022-06-01	2022-08-30 07:52:48	0	0000000498		2022-11-22
576	AGSI-D-23325	27	1	5	1	165	2022-06-01	2	2022-06-01	2022-08-30 07:39:17	0	0000000497		2022-11-22
567	AGSI-D-6032	34	1	5	1	170	2022-06-01	2	2022-06-01	2022-08-30 07:28:17	0	0000000496		2022-11-22
575	AGSI-RE-1354	24	2	5	1	120	2022-06-01	2	2022-06-01	2022-08-30 05:25:23	0	0000000495		2022-11-22
534	AGSI-RE-1420	60	1	5	1	300	2022-06-01	2	2022-06-01	2022-08-29 06:52:42	0	0000000494		2022-11-22
577	AGSP-1992	43	1	5	1	215	2022-06-01	2	2022-06-01	2022-08-29 06:29:49	0	0000000493		2022-11-22
607	AGSI-RE TRAMITE00332211	30	1	5	1	165	2022-07-01	2	2022-07-01	2022-08-27 08:37:08	0	0000000492	PAGO JULIO EN AGOSTO 	2022-11-22
569	AGSM-RE-0620	47	1	5	1	235	2022-06-01	2	2022-06-01	2022-08-26 12:12:36	0	0000000491		2022-11-22
591	AGSI-RE-1243	53	1	5	1	265	2022-06-01	2	2022-06-01	2022-08-25 11:37:17	0	0000000490		2022-11-22
604	AGSI-PE-0816	28	1	5	1	165	2022-07-01	2	2022-07-01	2022-08-25 10:42:52	0	0000000489		2022-11-22
574	AGSI-RE-0891	32	1	5	1	165	2022-06-01	2	2022-06-01	2022-08-24 08:47:33	0	0000000488		2022-11-22
598	AGSI-RE-0606	32	1	5	1	165	2022-06-01	2	2022-06-01	2022-08-24 07:14:55	0	0000000487		2022-11-22
535	AGSI-D-10408	28	1	5	1	165	2022-06-01	2	2022-06-01	2022-08-24 06:09:17	0	0000000486		2022-11-22
555	AGSI-RE-1176	81	1	5	1	405	2022-06-01	2	2022-06-01	2022-08-24 06:04:32	0	0000000485		2022-11-22
570	AGSI-RE-0205	58	1	5	1	290	2022-06-01	2	2022-06-01	2022-08-24 05:47:07	0	0000000484		2022-11-22
605	AGSI-RE-TRAMITE789	47	1	5	1	235	2022-07-01	2	2022-07-01	2022-08-23 11:07:32	0	0000000483		2022-11-22
566	AGSI-RE-TRAMITE 456	48	1	5	1	240	2022-06-01	2	2022-06-01	2022-08-23 10:04:55	0	0000000482		2022-11-22
580	AGSI-D-23647	36	1	5	1	180	2022-06-01	2	2022-06-01	2022-08-23 09:47:16	0	0000000481		2022-11-22
584	AGSI-RE-1324	40	1	5	1	200	2022-06-01	2	2022-06-01	2022-08-23 09:44:01	0	0000000480		2022-11-22
560	AGSI-RE-1098	30	1	5	1	165	2022-06-01	2	2022-06-01	2022-08-23 08:56:25	0	0000000479	TRANSFERENCIA 39211 DE FECHA 08/07 Y TRANSFERENCIA 551273 DE FECHA 05-08	2022-11-22
440	AGSI-RE-1098	30	1	5	1	165	2022-05-01	2	2022-05-01	2022-08-23 08:51:51	0	0000000408		2022-11-22
352	AGSI-TU-0072	14	2	5	1	70	2022-04-01	2	2022-04-01	2022-08-30 10:37:17	0	0000000407		2022-11-22
572	AGSP-PJ-0066	25	1	5	1	165	2022-06-01	2	2022-06-01	2022-08-23 07:38:53	0	0000000478	deposito en efectivo divisa	2022-11-22
588	AGSI-PE-0288	24	1	5	1	165	2022-06-01	2	2022-06-01	2022-08-23 07:01:30	0	0000000477		2022-11-22
511	AGSI-RE-TRAMITE87	32	1	5	1	165	2022-06-01	2	2022-06-01	2022-08-31 08:14:55	0	0000000476		2022-11-22
472	AGSI-TU-0072	14	2	5	1	70	2022-05-01	2	2022-05-01	2022-08-30 10:37:39	0	0000000475		2022-11-22
467	AGSI-TU-0058	48	1	5	1	240	2022-05-01	2	2022-05-01	2022-08-30 10:25:27	0	0000000474		2022-11-22
497	ARSH-D-957	27	1	5	1	165	2022-06-01	2	2022-06-01	2022-08-30 09:57:17	0	0000000473		2022-11-22
503	AGSP-RE-1071	72	1	5	1	360	2022-06-01	2	2022-06-01	2022-08-30 08:45:26	0	0000000472		2022-11-22
490	AGSI-RE-1239	44	1	5	1	220	2022-06-01	2	2022-06-01	2022-08-30 08:36:37	0	0000000471		2022-11-22
480	AGSP-RE-0587	25	2	5	1	125	2022-05-01	2	2022-05-01	2022-08-30 08:09:49	0	0000000470	PAGADO EL 22-06	2022-11-22
465	AGSI-RE-1593	23	2	5	1	115	2022-05-01	2	2022-05-01	2022-08-30 07:58:55	0	0000000469		2022-11-22
500	AGSI-D- 2796	27	1	5	1	165	2022-06-01	2	2022-06-01	2022-08-30 07:24:35	0	0000000467		2022-11-22
527	AGSI-RE-1404	24	2	5	1	120	2022-06-01	2	2022-06-01	2022-08-30 05:38:44	0	0000000466		2022-11-22
533	AGSI-RE-0169	36	2	5	1	180	2022-06-01	2	2022-06-01	2022-08-30 04:57:04	0	0000000465		2022-11-22
520	AGSI-RE-1362	20	2	5	1	100	2022-06-01	2	2022-06-01	2022-08-30 04:43:12	0	0000000464		2022-11-22
525	ADKN-D-7303	20	2	5	1	100	2022-06-01	2	2022-06-01	2022-08-29 07:10:17	0	0000000463	DEPOSITO EN EFECTIVO DIVISA	2022-11-22
504	ARSH-RE-0356	28	2	5	1	140	2022-06-01	2	2022-06-01	2022-08-29 07:01:48	0	0000000462		2022-11-22
519	AGSI-RE-0575	40	1	5	1	200	2022-06-01	2	2022-06-01	2022-08-29 06:24:51	0	0000000461		2022-11-22
487	AGSI-RE TRAMITE00332211	30	1	5	1	165	2022-06-01	2	2022-06-01	2022-08-27 08:36:05	0	0000000460	PAGO JUNIO EN AGOSTO	2022-11-22
471	AGSI-RE-1243	53	1	5	1	265	2022-05-01	2	2022-05-01	2022-08-25 11:36:24	0	0000000459		2022-11-22
484	AGSI-PE-0816	28	1	5	1	165	2022-06-01	2	2022-06-01	2022-08-25 10:42:20	0	0000000458		2022-11-22
495	AGSI-PE-0842	24	1	5	1	165	2022-06-01	2	2022-06-01	2022-08-25 10:38:36	0	0000000457		2022-11-22
478	AGSI-RE-0606	32	1	5	1	165	2022-05-01	2	2022-05-01	2022-08-24 07:13:05	0	0000000456		2022-11-22
494	AGSI-RE-0268	58	1	5	1	290	2022-06-01	2	2022-06-01	2022-08-24 05:54:10	0	0000000455		2022-11-22
501	AGSI-RE-0437	30	1	5	1	165	2022-06-01	2	2022-06-01	2022-08-24 05:39:16	0	0000000454		2022-11-22
515	AGSI-TU-0182	35	1	5	1	175	2022-06-01	2	2022-06-01	2022-08-23 11:50:17	0	0000000453		2022-11-22
502	Agsi-re-0678	42	1	5	1	210	2022-06-01	2	2022-06-01	2022-08-23 11:39:43	0	0000000452		2022-11-22
485	AGSI-RE-TRAMITE789	47	1	5	1	235	2022-06-01	2	2022-06-01	2022-08-23 11:06:53	0	0000000451		2022-11-22
506	AGSM-D-1776	43	1	5	1	215	2022-06-01	2	2022-06-01	2022-08-23 10:56:29	0	0000000450		2022-11-22
523	AGSI-RE-TRAMITE 741	41	1	5	1	205	2022-06-01	2	2022-06-01	2022-08-23 09:58:44	0	0000000449		2022-11-22
460	AGSI-D-23647	36	1	5	1	180	2022-05-01	2	2022-05-01	2022-08-23 09:46:49	0	0000000448		2022-11-22
464	AGSI-RE-1324	40	1	5	1	200	2022-05-01	2	2022-05-01	2022-08-23 09:43:38	0	0000000447		2022-11-22
462	AMSH-RE 0323	62	1	5	1	310	2022-05-01	2	2022-05-01	2022-08-23 09:26:53	0	0000000446		2022-11-22
517	ARSH-D-1448	30	1	5	1	165	2022-06-01	2	2022-06-01	2022-08-23 09:23:15	0	0000000445		2022-11-22
469	AGSI-RE-1349	60	1	5	1	300	2022-05-01	2	2022-05-01	2022-08-23 07:07:19	0	0000000444	transferencia elaborada efectivo divisa 	2022-11-22
448	AGSI-D-11413	32	1	5	1	165	2022-05-01	2	2022-05-01	2022-09-02 02:40:48	0	0000000443	paga mayo en septiembre	2022-11-22
391	AGSI-RE-TRAMITE87	32	1	5	1	165	2022-05-01	2	2022-05-01	2022-08-31 08:14:25	0	0000000442	pago 	2022-11-22
422	Agsi-re-tramite-224466	48	1	5	1	240	2022-05-01	2	2022-05-01	2022-08-30 10:19:30	0	0000000441		2022-11-22
425	AGSI-RE-1072	47	1	5	1	235	2022-05-01	2	2022-05-01	2022-08-30 09:41:23	0	0000000440		2022-11-22
438	AGSI-RE-0753	60	1	5	1	300	2022-05-01	2	2022-05-01	2022-08-30 08:29:43	0	0000000439		2022-11-22
431	ADKN-2106	44	1	5	1	220	2022-05-01	2	2022-05-01	2022-08-30 07:52:19	0	0000000438		2022-11-22
456	AGSI-D-23325	27	1	5	1	165	2022-05-01	2	2022-05-01	2022-08-30 07:38:30	0	0000000437		2022-11-22
447	AGSI-D-6032	34	1	5	1	170	2022-05-01	2	2022-05-01	2022-08-30 07:27:55	0	0000000435		2022-11-22
404	AGSI-D-5426	35	2	5	1	175	2022-05-01	2	2022-05-01	2022-08-30 06:01:31	0	0000000434		2022-11-22
407	AGSI-RE-1404	24	2	5	1	120	2022-05-01	2	2022-05-01	2022-08-30 05:38:02	0	0000000433		2022-11-22
455	AGSI-RE-1354	24	2	5	1	120	2022-05-01	2	2022-05-01	2022-08-30 05:24:54	0	0000000432		2022-11-22
405	ADKN-D-7303	20	2	5	1	100	2022-05-01	2	2022-05-01	2022-08-29 07:09:20	0	0000000431	DEPOSITO EFECTIVO DIVISA	2022-11-22
384	ARSH-RE-0356	28	2	5	1	140	2022-05-01	2	2022-05-01	2022-08-29 07:01:03	0	0000000430		2022-11-22
414	AGSI-RE-1420	60	1	5	1	300	2022-05-01	2	2022-05-01	2022-08-29 06:51:43	0	0000000429		2022-11-22
457	AGSP-1992	43	1	5	1	215	2022-05-01	2	2022-05-01	2022-08-29 06:29:12	0	0000000428		2022-11-22
399	AGSI-RE-0575	40	1	5	1	200	2022-05-01	2	2022-05-01	2022-08-29 06:23:28	0	0000000427		2022-11-22
449	AGSM-RE-0620	47	1	5	1	235	2022-05-01	2	2022-05-01	2022-08-26 12:03:00	0	0000000426		2022-11-22
445	AGSI-RE-0989	24	2	5	1	120	2022-05-01	2	2022-05-01	2022-08-30 10:44:21	0	0000000425		2022-11-22
454	AGSI-RE-0891	32	1	5	1	165	2022-05-01	2	2022-05-01	2022-08-24 08:47:05	0	0000000424		2022-11-22
436	AGSP-2214	36	1	5	1	180	2022-05-01	2	2022-05-01	2022-08-24 06:50:13	0	0000000423		2022-11-22
424	AGSI-2221	42	1	5	1	210	2022-05-01	2	2022-05-01	2022-08-24 06:46:42	0	0000000422		2022-11-22
392	AGSI-D-22487	30	1	5	1	165	2022-05-01	2	2022-05-01	2022-08-24 06:27:16	0	0000000421	DEPOSITO EN DIVISA  CUENTA BNC	2022-11-22
415	AGSI-D-10408	28	1	5	1	165	2022-05-01	2	2022-05-01	2022-08-24 06:08:43	0	0000000420		2022-11-22
435	AGSI-RE-1176	81	1	5	1	405	2022-05-01	2	2022-05-01	2022-08-24 06:03:10	0	0000000419		2022-11-22
450	AGSI-RE-0205	58	1	5	1	290	2022-05-01	2	2022-05-01	2022-08-24 05:45:54	0	0000000418		2022-11-22
381	AGSI-RE-0437	30	1	5	1	165	2022-05-01	2	2022-05-01	2022-08-24 05:37:32	0	0000000417		2022-11-22
427	AGSI-PJ-0070	33	1	5	1	165	2022-05-01	2	2022-05-01	2022-08-24 05:36:19	0	0000000416		2022-11-22
395	AGSI-TU-0182	35	1	5	1	175	2022-05-01	2	2022-05-01	2022-08-23 11:49:39	0	0000000415		2022-11-22
382	Agsi-re-0678	42	1	5	1	210	2022-05-01	2	2022-05-01	2022-08-23 11:39:04	0	0000000414		2022-11-22
428	AGSI-RE-1339	47	1	5	1	235	2022-05-01	2	2022-05-01	2022-08-23 11:30:27	0	0000000413		2022-11-22
386	AGSM-D-1776	43	1	5	1	215	2022-05-01	2	2022-05-01	2022-08-23 10:54:37	0	0000000412		2022-11-22
446	AGSI-RE-TRAMITE 456	48	1	5	1	240	2022-05-01	2	2022-05-01	2022-08-23 10:04:17	0	0000000411		2022-11-22
403	AGSI-RE-TRAMITE 741	41	1	5	1	205	2022-05-01	2	2022-05-01	2022-08-23 09:57:52	0	0000000410		2022-11-22
397	ARSH-D-1448	30	1	5	1	165	2022-05-01	2	2022-05-01	2022-08-23 09:22:31	0	0000000409		2022-11-22
347	AGSI-TU-0058	48	1	5	1	240	2022-04-01	2	2022-04-01	2022-08-30 10:24:16	0	0000000406		2022-11-22
377	ARSH-D-957	27	1	5	1	165	2022-05-01	2	2022-05-01	2022-08-30 09:55:47	0	0000000405		2022-11-22
360	AGSP-RE-0587	25	2	5	1	125	2022-04-01	2	2022-04-01	2022-08-30 08:07:57	0	0000000404		2022-11-22
345	AGSI-RE-1593	23	2	5	1	115	2022-04-01	2	2022-04-01	2022-08-30 07:58:26	0	0000000403		2022-11-22
311	ADKN-2106	44	1	5	1	220	2022-04-01	2	2022-04-01	2022-08-30 07:51:53	0	0000000402		2022-11-22
336	AGSI-D-23325	27	1	5	1	165	2022-04-01	2	2022-04-01	2022-08-30 07:37:05	0	0000000401		2022-11-22
356	ARSK-D-1085	35	2	5	1	175	2022-04-01	2	2022-04-01	2022-08-30 07:31:03	0	0000000400		2022-11-22
327	AGSI-D-6032	34	1	5	1	170	2022-04-01	2	2022-04-01	2022-08-30 07:27:31	0	0000000399		2022-11-22
380	AGSI-D- 2796	27	1	5	1	165	2022-05-01	2	2022-05-01	2022-08-30 07:24:05	0	0000000398		2022-11-22
372	AGSI-re-tramite-098	14	2	5	1	70	2022-05-01	2	2022-05-01	2022-08-30 07:20:02	0	0000000397		2022-11-22
359	AGSI-D-TRAMI 023	15	2	5	1	75	2022-04-01	2	2022-04-01	2022-08-30 05:45:09	0	0000000396		2022-11-22
335	AGSI-RE-1354	24	2	5	1	120	2022-04-01	2	2022-04-01	2022-08-30 05:24:23	0	0000000395		2022-11-22
323	AGSI-RE-TRAMI01	28	1	5	1	165	2022-04-01	2	2022-04-01	2022-08-29 06:32:37	0	0000000394		2022-11-22
337	AGSP-1992	43	1	5	1	215	2022-04-01	2	2022-04-01	2022-08-29 06:28:48	0	0000000393		2022-11-22
367	AGSI-RE TRAMITE00332211	30	1	5	1	165	2022-05-01	2	2022-05-01	2022-08-27 08:34:56	0	0000000392	PAGO MAYO EN AGOSTO	2022-11-22
378	AGSI-RE-22326	33	1	5	1	165	2022-05-01	2	2022-05-01	2022-08-26 12:00:19	0	0000000391		2022-11-22
351	AGSI-RE-1243	53	1	5	1	265	2022-04-01	2	2022-04-01	2022-08-25 11:35:00	0	0000000390		2022-11-22
364	AGSI-PE-0816	28	1	5	1	165	2022-05-01	2	2022-05-01	2022-08-25 10:41:54	0	0000000389		2022-11-22
375	AGSI-PE-0842	24	1	5	1	165	2022-05-01	2	2022-05-01	2022-08-25 10:37:57	0	0000000388		2022-11-22
358	AGSI-RE-0606	32	1	5	1	165	2022-04-01	2	2022-04-01	2022-08-24 07:11:41	0	0000000387		2022-11-22
316	AGSP-2214	36	1	5	1	180	2022-04-01	2	2022-04-01	2022-08-24 06:49:40	0	0000000386		2022-11-22
315	AGSI-RE-1176	81	1	5	1	405	2022-04-01	2	2022-04-01	2022-08-24 06:02:20	0	0000000385		2022-11-22
374	AGSI-RE-0268	58	1	5	1	290	2022-05-01	2	2022-05-01	2022-08-24 05:53:05	0	0000000384		2022-11-22
330	AGSI-RE-0205	58	1	5	1	290	2022-04-01	2	2022-04-01	2022-08-24 05:44:47	0	0000000383		2022-11-22
314	AGSI-D-4396	62	1	5	1	310	2022-04-01	2	2022-04-01	2022-08-24 05:31:27	0	0000000382		2022-11-22
334	AGSI-RE-0891	32	1	5	1	165	2022-04-01	2	2022-04-01	2022-08-23 11:46:33	0	0000000381		2022-11-22
365	AGSI-RE-TRAMITE789	47	1	5	1	235	2022-05-01	2	2022-05-01	2022-08-23 11:06:00	0	0000000380		2022-11-22
326	AGSI-RE-TRAMITE 456	48	1	5	1	240	2022-04-01	2	2022-04-01	2022-08-23 10:03:31	0	0000000379		2022-11-22
340	AGSI-D-23647	36	1	5	1	180	2022-04-01	2	2022-04-01	2022-08-23 09:46:24	0	0000000378		2022-11-22
344	AGSI-RE-1324	40	1	5	1	200	2022-04-01	2	2022-04-01	2022-08-23 09:42:35	0	0000000377		2022-11-22
342	AMSH-RE 0323	62	1	5	1	310	2022-04-01	2	2022-04-01	2022-08-23 09:26:27	0	0000000376		2022-11-22
320	AGSI-RE-1098	30	1	5	1	165	2022-04-01	2	2022-04-01	2022-08-23 08:49:44	0	0000000374		2022-11-22
348	AGSI-PE-0288	24	1	5	1	165	2022-04-01	2	2022-04-01	2022-08-23 07:00:31	0	0000000373		2022-11-22
302	Agsi-re-tramite-224466	48	1	5	1	240	2022-04-01	2	2022-04-01	2022-08-30 10:18:57	0	0000000372		2022-11-22
257	ARSH-D-957	27	1	5	1	165	2022-04-01	2	2022-04-01	2022-08-30 09:54:38	0	0000000371		2022-11-22
305	AGSI-RE-1072	47	1	5	1	235	2022-04-01	2	2022-04-01	2022-08-30 09:40:43	0	0000000370		2022-11-22
247	AGSI-RE TRAMITE00332211	30	1	5	1	165	2022-04-01	2	2022-04-01	2022-08-30 07:49:13	0	0000000369		2022-11-22
236	ARSK-D-1085	35	2	1	1	35	2022-03-01	2	2022-03-01	2022-08-30 07:30:24	0	0000000367		2022-11-22
260	AGSI-D- 2796	27	1	5	1	165	2022-04-01	2	2022-04-01	2022-08-30 07:23:31	0	0000000366		2022-11-22
252	AGSI-re-tramite-098	14	2	5	1	70	2022-04-01	2	2022-04-01	2022-08-30 07:18:25	0	0000000365		2022-11-22
284	AGSI-D-5426	35	2	5	1	175	2022-04-01	2	2022-04-01	2022-08-30 06:00:52	0	0000000364		2022-11-22
239	AGSI-D-TRAMI 023	15	2	1	1	15	2022-03-01	2	2022-03-01	2022-08-30 05:44:44	0	0000000363		2022-11-22
287	AGSI-RE-1404	24	2	5	1	120	2022-04-01	2	2022-04-01	2022-08-30 05:36:01	0	0000000362		2022-11-22
293	AGSI-RE-0169	36	2	5	1	180	2022-04-01	2	2022-04-01	2022-08-30 04:56:15	0	0000000361		2022-11-22
280	AGSI-RE-1362	20	2	5	1	100	2022-04-01	2	2022-04-01	2022-08-29 07:20:07	0	0000000360		2022-11-22
285	ADKN-D-7303	20	2	5	1	100	2022-04-01	2	2022-04-01	2022-08-29 07:06:59	0	0000000359		2022-11-22
264	ARSH-RE-0356	28	2	5	1	140	2022-04-01	2	2022-04-01	2022-08-29 07:00:28	0	0000000358		2022-11-22
294	AGSI-RE-1420	60	1	5	1	300	2022-04-01	2	2022-04-01	2022-08-29 06:51:15	0	0000000357		2022-11-22
279	AGSI-RE-0575	40	1	5	1	200	2022-04-01	2	2022-04-01	2022-08-29 06:14:56	0	0000000356		2022-11-22
258	AGSI-RE-22326	33	1	5	1	165	2022-04-01	2	2022-04-01	2022-08-25 11:59:29	0	0000000355		2022-11-22
244	AGSI-PE-0816	28	1	5	1	165	2022-04-01	2	2022-04-01	2022-08-25 10:41:05	0	0000000354		2022-11-22
255	AGSI-PE-0842	24	1	5	1	165	2022-04-01	2	2022-04-01	2022-08-25 10:36:48	0	0000000353		2022-11-22
271	AGSI-RE-TRAMITE87	32	1	5	1	165	2022-04-01	2	2022-04-01	2022-08-31 08:13:49	0	0000000352	pago abril en agosto	2022-11-22
238	AGSI-RE-0606	32	1	1	1	33	2022-03-01	2	2022-03-01	2022-08-24 07:10:58	0	0000000351		2022-11-22
249	AGSI-PE-0830	23	1	5	1	165	2022-04-01	2	2022-04-01	2022-08-24 07:07:00	0	0000000350		2022-11-22
304	AGSI-2221	42	1	5	1	210	2022-04-01	2	2022-04-01	2022-08-24 06:42:39	0	0000000349		2022-11-22
272	AGSI-D-22487	30	1	5	1	165	2022-04-01	2	2022-04-01	2022-08-24 06:21:25	0	0000000348	deposito en efectivo divisa	2022-11-22
295	AGSI-D-10408	28	1	5	1	165	2022-04-01	2	2022-04-01	2022-08-24 06:08:20	0	0000000347		2022-11-22
254	AGSI-RE-0268	58	1	5	1	290	2022-04-01	2	2022-04-01	2022-08-24 05:52:01	0	0000000346		2022-11-22
307	AGSI-PJ-0070	33	1	5	1	165	2022-04-01	2	2022-04-01	2022-08-24 05:35:11	0	0000000345		2022-11-22
275	AGSI-TU-0182	35	1	5	1	175	2022-04-01	2	2022-04-01	2022-08-23 11:49:10	0	0000000344		2022-11-22
262	Agsi-re-0678	42	1	5	1	210	2022-04-01	2	2022-04-01	2022-08-23 11:38:23	0	0000000343		2022-11-22
245	AGSI-RE-TRAMITE789	47	1	5	1	235	2022-04-01	2	2022-04-01	2022-08-23 11:05:26	0	0000000342		2022-11-22
266	AGSM-D-1776	43	1	5	1	215	2022-04-01	2	2022-04-01	2022-08-23 10:52:46	0	0000000341		2022-11-22
233	AGSI-D-15916	40	1	1	1	40	2022-03-01	2	2022-03-01	2022-08-23 10:19:30	0	0000000340		2022-11-22
283	AGSI-RE-TRAMITE 741	41	1	5	1	205	2022-04-01	2	2022-04-01	2022-08-23 09:56:59	0	0000000339		2022-11-22
227	AGSI-TU-0058	48	1	1	1	48	2022-03-01	2	2022-03-01	2022-08-30 10:23:30	0	0000000338		2022-11-22
185	AGSI-RE-1072	47	1	1	1	47	2022-03-01	2	2022-03-01	2022-08-30 09:39:15	0	0000000337		2022-11-22
191	ADKN-2106	44	1	1	1	44	2022-03-01	2	2022-03-01	2022-08-30 07:51:26	0	0000000336		2022-11-22
216	AGSI-D-23325	27	1	1	1	33	2022-03-01	2	2022-03-01	2022-08-30 07:36:29	0	0000000335		2022-11-22
207	AGSI-D-6032	34	1	1	1	34	2022-03-01	2	2022-03-01	2022-08-30 07:27:10	0	0000000333		2022-11-22
164	AGSI-D-5426	35	2	1	1	35	2022-03-01	2	2022-03-01	2022-08-30 06:00:06	0	0000000332		2022-11-22
171	AGSI-D-1648	25	2	1	1	25	2022-03-01	2	2022-03-01	2022-08-30 05:54:57	0	0000000331		2022-11-22
215	AGSI-RE-1354	24	2	1	1	24	2022-03-01	2	2022-03-01	2022-08-30 05:18:44	0	0000000330		2022-11-22
173	AGSI-RE-0169	36	2	1	1	36	2022-03-01	2	2022-03-01	2022-08-30 04:54:13	0	0000000329		2022-11-22
160	AGSI-RE-1362	20	2	1	1	20	2022-03-01	2	2022-03-01	2022-08-29 07:17:55	0	0000000328		2022-11-22
165	ADKN-D-7303	20	2	1	1	20	2022-03-01	2	2022-03-01	2022-08-29 07:05:16	0	0000000327		2022-11-22
174	AGSI-RE-1420	60	1	1	1	60	2022-03-01	2	2022-03-01	2022-08-29 06:50:37	0	0000000326		2022-11-22
203	AGSI-RE-TRAMI01	28	1	1	1	33	2022-03-01	2	2022-03-01	2022-08-29 06:31:56	0	0000000325		2022-11-22
217	AGSP-1992	43	1	1	1	43	2022-03-01	2	2022-03-01	2022-08-29 06:28:24	0	0000000324		2022-11-22
159	AGSI-RE-0575	40	1	1	1	40	2022-03-01	2	2022-03-01	2022-08-29 06:14:05	0	0000000323		2022-11-22
209	AGSM-RE-0620	47	1	1	1	47	2022-03-01	2	2022-03-01	2022-08-26 12:02:00	0	0000000322		2022-11-22
231	AGSI-RE-1243	53	1	1	1	53	2022-03-01	2	2022-03-01	2022-08-25 11:33:39	0	0000000321		2022-11-22
196	AGSP-2214	36	1	1	1	36	2022-03-01	2	2022-03-01	2022-08-24 06:48:31	0	0000000320		2022-11-22
184	AGSI-2221	42	1	1	1	42	2022-03-01	2	2022-03-01	2022-08-24 06:39:35	0	0000000319		2022-11-22
175	AGSI-D-10408	28	1	1	1	33	2022-03-01	2	2022-03-01	2022-08-24 06:07:56	0	0000000318		2022-11-22
195	AGSI-RE-1176	81	1	1	1	81	2022-03-01	2	2022-03-01	2022-08-24 06:00:41	0	0000000317		2022-11-22
210	AGSI-RE-0205	58	1	1	1	58	2022-03-01	2	2022-03-01	2022-08-24 05:43:53	0	0000000316		2022-11-22
187	AGSI-PJ-0070	33	1	1	1	33	2022-03-01	2	2022-03-01	2022-08-24 05:32:49	0	0000000315		2022-11-22
194	AGSI-D-4396	62	1	1	1	62	2022-03-01	2	2022-03-01	2022-08-24 05:30:56	0	0000000314		2022-11-22
155	AGSI-TU-0182	35	1	1	1	35	2022-03-01	2	2022-03-01	2022-08-23 11:48:30	0	0000000313		2022-11-22
214	AGSI-RE-0891	32	1	1	1	33	2022-03-01	2	2022-03-01	2022-08-23 11:45:45	0	0000000312		2022-11-22
188	AGSI-RE-1339	47	1	1	1	47	2022-03-01	2	2022-03-01	2022-08-23 11:25:46	0	0000000311		2022-11-22
182	Agsi-re-tramite-224466	48	1	1	1	48	2022-03-01	2	2022-03-01	2022-08-23 11:09:15	0	0000000310		2022-11-22
183	AGSI-D-16610	42	1	1	1	42	2022-03-01	2	2022-03-01	2022-08-23 10:36:29	0	0000000309		2022-11-22
206	AGSI-RE-TRAMITE 456	48	1	1	1	48	2022-03-01	2	2022-03-01	2022-08-23 10:02:45	0	0000000308		2022-11-22
163	AGSI-RE-TRAMITE 741	41	1	1	1	41	2022-03-01	2	2022-03-01	2022-08-23 09:54:19	0	0000000307		2022-11-22
220	AGSI-D-23647	36	1	1	1	36	2022-03-01	2	2022-03-01	2022-08-23 09:45:53	0	0000000306		2022-11-22
224	AGSI-RE-1324	40	1	1	1	40	2022-03-01	2	2022-03-01	2022-08-23 09:41:57	0	0000000305		2022-11-22
157	ARSH-D-1448	30	1	1	1	33	2022-03-01	2	2022-03-01	2022-08-23 09:21:27	0	0000000304		2022-11-22
212	AGSP-PJ-0066	25	1	1	1	33	2022-03-01	2	2022-03-01	2022-08-23 07:28:45	0	0000000303		2022-11-22
228	AGSI-PE-0288	24	1	1	1	33	2022-03-01	2	2022-03-01	2022-08-23 06:59:23	0	0000000302		2022-11-22
153	AGSI-D-20765	35	1	1	1	35	2022-03-01	2	2022-03-01	2022-08-31 02:47:23	0	0000000301	en el mes de agosto pago marzo	2022-11-22
137	ARSH-D-957	27	1	1	1	33	2022-03-01	2	2022-03-01	2022-08-30 09:53:37	0	0000000300		2022-11-22
127	AGSI-RE TRAMITE00332211	30	1	1	1	33	2022-03-01	2	2022-03-01	2022-08-30 07:48:21	0	0000000299		2022-11-22
96	AGSI-D-23325	27	1	1	1	33	2022-02-01	2	2022-02-01	2022-08-30 07:36:10	0	0000000298		2022-11-22
116	ARSK-D-1085	35	2	1	1	35	2022-02-01	2	2022-02-01	2022-08-30 07:29:42	0	0000000297		2022-11-22
87	AGSI-D-6032	34	1	1	1	34	2022-02-01	2	2022-02-01	2022-08-30 07:26:48	0	0000000296		2022-11-22
140	AGSI-D- 2796	27	1	1	1	33	2022-03-01	2	2022-03-01	2022-08-30 07:22:22	0	0000000295		2022-11-22
132	AGSI-re-tramite-098	14	2	1	1	14	2022-03-01	2	2022-03-01	2022-08-30 07:13:08	0	0000000294		2022-11-22
119	AGSI-D-TRAMI 023	15	2	1	1	15	2022-02-01	2	2022-02-01	2022-08-30 05:44:22	0	0000000293		2022-11-22
95	AGSI-RE-1354	24	2	1	1	24	2022-02-01	2	2022-02-01	2022-08-30 05:17:11	0	0000000292		2022-11-22
144	ARSH-RE-0356	28	2	1	1	28	2022-03-01	2	2022-03-01	2022-08-29 06:59:57	0	0000000291		2022-11-22
83	AGSI-RE-TRAMI01	28	1	1	1	33	2022-02-01	2	2022-02-01	2022-08-29 06:31:08	0	0000000290		2022-11-22
97	AGSP-1992	43	1	1	1	43	2022-02-01	2	2022-02-01	2022-08-29 06:28:00	0	0000000289		2022-11-22
89	AGSM-RE-0620	47	1	1	1	47	2022-02-01	2	2022-02-01	2022-08-26 12:01:38	0	0000000288		2022-11-22
138	AGSI-RE-22326	33	1	1	1	33	2022-03-01	2	2022-03-01	2022-08-25 11:59:07	0	0000000287		2022-11-22
111	AGSI-RE-1243	53	1	1	1	53	2022-02-01	2	2022-02-01	2022-08-25 11:33:07	0	0000000286		2022-11-22
124	AGSI-PE-0816	28	1	1	1	33	2022-03-01	2	2022-03-01	2022-08-25 10:40:38	0	0000000285		2022-11-22
135	AGSI-PE-0842	24	1	1	1	33	2022-03-01	2	2022-03-01	2022-08-25 10:36:19	0	0000000284		2022-11-22
118	AGSI-RE-0606	32	1	1	1	33	2022-02-01	2	2022-02-01	2022-08-24 07:10:14	0	0000000283		2022-11-22
152	AGSI-D-22487	30	1	1	1	33	2022-03-01	2	2022-03-01	2022-08-24 06:14:36	0	0000000282		2022-11-22
134	AGSI-RE-0268	58	1	1	1	58	2022-03-01	2	2022-03-01	2022-08-24 05:51:13	0	0000000281		2022-11-22
90	AGSI-RE-0205	58	1	1	1	58	2022-02-01	2	2022-02-01	2022-08-24 05:43:25	0	0000000280		2022-11-22
94	AGSI-RE-0891	32	1	1	1	33	2022-02-01	2	2022-02-01	2022-08-23 11:45:16	0	0000000279		2022-11-22
142	Agsi-re-0678	42	1	1	1	42	2022-03-01	2	2022-03-01	2022-08-23 11:37:25	0	0000000278		2022-11-22
125	AGSI-RE-TRAMITE789	47	1	1	1	47	2022-03-01	2	2022-03-01	2022-08-23 11:04:37	0	0000000277		2022-11-22
146	AGSM-D-1776	43	1	1	1	43	2022-03-01	2	2022-03-01	2022-08-23 10:41:43	0	0000000276		2022-11-22
113	AGSI-D-15916	40	1	1	1	40	2022-02-01	2	2022-02-01	2022-08-23 10:18:10	0	0000000275		2022-11-22
100	AGSI-D-23647	36	1	1	1	36	2022-02-01	2	2022-02-01	2022-08-23 09:45:14	0	0000000274		2022-11-22
104	AGSI-RE-1324	40	1	1	1	40	2022-02-01	2	2022-02-01	2022-08-23 09:41:22	0	0000000273		2022-11-22
102	AMSH-RE 0323	62	1	1	1	62	2022-02-01	2	2022-02-01	2022-08-23 09:25:21	0	0000000272		2022-11-22
92	AGSP-PJ-0066	25	1	1	1	33	2022-02-01	2	2022-02-01	2022-08-23 07:27:12	0	0000000271		2022-11-22
108	AGSI-PE-0288	24	1	1	1	33	2022-02-01	2	2022-02-01	2022-08-23 06:58:27	0	0000000270		2022-11-22
33	AGSI-D-20765	35	1	1	1	35	2022-02-01	2	2022-02-01	2022-08-31 02:46:36	0	0000000269	en agosto pago febrero	2022-11-22
223	AGSI-RE-1001	54	1	1	1	54	2022-03-01	2	2022-03-01	2022-08-17 07:34:06	0	0000000197		2022-11-22
17	ARSH-D-957	27	1	1	1	33	2022-02-01	2	2022-02-01	2022-08-30 09:51:20	0	0000000268	CUENTAS POR COBRAR VENETUR POR TRANSFERENCIA REALIZADA A LA CUENTA MARINAS VENETUR SEGUN REFERENCIA	2022-11-22
71	ADKN-2106	44	1	1	1	44	2022-02-01	2	2022-02-01	2022-08-30 07:51:05	0	0000000267		2022-11-22
7	AGSI-RE TRAMITE00332211	30	1	1	1	33	2022-02-01	2	2022-02-01	2022-08-30 07:47:37	0	0000000266		2022-11-22
20	AGSI-D- 2796	27	1	1	1	33	2022-02-01	2	2022-02-01	2022-08-30 07:21:59	0	0000000264		2022-11-22
12	AGSI-re-tramite-098	14	2	1	1	14	2022-02-01	2	2022-02-01	2022-08-30 07:12:24	0	0000000263		2022-11-22
51	AGSI-D-1648	25	2	1	1	25	2022-02-01	2	2022-02-01	2022-08-30 05:54:37	0	0000000262		2022-11-22
47	AGSI-RE-1404	24	2	1	1	24	2022-02-01	2	2022-02-01	2022-08-30 05:33:43	0	0000000261		2022-11-22
40	AGSI-RE-1362	20	2	1	1	20	2022-02-01	2	2022-02-01	2022-08-29 07:17:10	0	0000000260		2022-11-22
45	ADKN-D-7303	20	2	1	1	20	2022-02-01	2	2022-02-01	2022-08-29 07:04:02	0	0000000259		2022-11-22
24	ARSH-RE-0356	28	2	1	1	28	2022-02-01	2	2022-02-01	2022-08-29 06:59:36	0	0000000258		2022-11-22
54	AGSI-RE-1420	60	1	1	1	60	2022-02-01	2	2022-02-01	2022-08-29 06:49:58	0	0000000257	CUENTA POR COBRAR VENETUR. TRANSFERENCIA CANON MES FEBRERO REALIZADA A LA CUENTA DE VENETUR .	2022-11-22
39	AGSI-RE-0575	40	1	1	1	40	2022-02-01	2	2022-02-01	2022-08-29 06:13:30	0	0000000256		2022-11-22
18	AGSI-RE-22326	33	1	1	1	33	2022-02-01	2	2022-02-01	2022-08-25 11:58:42	0	0000000255		2022-11-22
4	AGSI-PE-0816	28	1	1	1	33	2022-02-01	2	2022-02-01	2022-08-25 10:40:10	0	0000000254		2022-11-22
15	AGSI-PE-0842	24	1	1	1	33	2022-02-01	2	2022-02-01	2022-08-25 10:34:42	0	0000000253		2022-11-22
76	AGSP-2214	36	1	1	1	36	2022-02-01	2	2022-02-01	2022-08-24 06:47:43	0	0000000252		2022-11-22
64	AGSI-2221	42	1	1	1	42	2022-02-01	2	2022-02-01	2022-08-24 06:36:29	0	0000000251		2022-11-22
55	AGSI-D-10408	28	1	1	1	33	2022-02-01	2	2022-02-01	2022-08-24 06:07:35	0	0000000250		2022-11-22
67	AGSI-PJ-0070	33	1	1	1	33	2022-02-01	2	2022-02-01	2022-08-24 05:32:18	0	0000000248		2022-11-22
74	AGSI-D-4396	62	1	1	1	62	2022-02-01	2	2022-02-01	2022-08-24 05:30:31	0	0000000247		2022-11-22
35	AGSI-TU-0182	35	1	1	1	35	2022-02-01	2	2022-02-01	2022-08-23 11:48:06	0	0000000246		2022-11-22
22	Agsi-re-0678	42	1	1	1	42	2022-02-01	2	2022-02-01	2022-08-23 11:36:50	0	0000000245		2022-11-22
62	Agsi-re-tramite-224466	48	1	1	1	48	2022-02-01	2	2022-02-01	2022-08-23 11:08:44	0	0000000243		2022-11-22
26	AGSM-D-1776	43	1	1	1	43	2022-02-01	2	2022-02-01	2022-08-23 10:39:47	0	0000000241		2022-11-22
63	AGSI-D-16610	42	1	1	1	42	2022-02-01	2	2022-02-01	2022-08-23 10:34:34	0	0000000240		2022-11-22
43	AGSI-RE-TRAMITE 741	41	1	1	1	41	2022-02-01	2	2022-02-01	2022-08-23 09:51:28	0	0000000239		2022-11-22
37	ARSH-D-1448	30	1	1	1	33	2022-02-01	2	2022-02-01	2022-08-23 09:21:00	0	0000000238		2022-11-22
735	AGSI-PE-0842	24	1	5	1	165	2022-08-01	2	2022-08-01	2022-08-22 08:36:07	0	0000000237		2022-11-22
615	AGSI-PE-0842	24	1	5	1	165	2022-07-01	2	2022-07-01	2022-08-22 08:35:35	0	0000000236	pago el mes julio el 22/08/2022	2022-11-22
712	AGSI-TU-0072	14	2	5	1	70	2022-07-01	2	2022-07-01	2022-08-22 04:50:40	0	0000000235	pago 22/08/2022 el mes de julio 	2022-11-22
669	AGSI-D-6150	35	1	5	1	175	2022-07-01	2	2022-07-01	2022-08-21 02:06:54	0	0000000234		2022-11-22
789	AGSI-D-6150	35	1	5	1	175	2022-08-01	2	2022-08-01	2022-08-21 02:07:42	0	0000000233		2022-11-22
821	AGSI-RE-1303	63	1	5	1	315	2022-08-01	2	2022-08-01	2022-08-21 01:55:08	0	0000000232		2022-11-22
721	AGSM-RE-0897	50	1	5	1	250	2022-08-01	2	2022-08-01	2022-08-19 05:37:04	0	0000000231		2022-11-22
819	AGSI-D-23005	63	1	5	1	315	2022-08-01	2	2022-08-01	2022-08-18 10:12:38	0	0000000230	pagado juan blanco el 16-08	2022-11-22
699	AGSI-D-23005	63	1	5	1	315	2022-07-01	2	2022-07-01	2022-08-18 09:20:42	0	0000000229	pagado por juan blanco el 16-08-22	2022-11-22
630	ARSH-PJ-0034	43	1	5	1	215	2022-07-01	2	2022-07-01	2022-08-17 09:25:26	0	0000000228		2022-11-22
510	ARSH-PJ-0034	43	1	5	1	215	2022-06-01	2	2022-06-01	2022-08-17 09:23:53	0	0000000227		2022-11-22
390	ARSH-PJ-0034	43	1	5	1	215	2022-05-01	2	2022-05-01	2022-08-17 09:22:32	0	0000000226		2022-11-22
270	ARSH-PJ-0034	43	1	5	1	215	2022-04-01	2	2022-04-01	2022-08-17 09:20:24	0	0000000225		2022-11-22
150	ARSH-PJ-0034	43	1	1	1	43	2022-03-01	2	2022-03-01	2022-08-17 09:18:52	0	0000000224		2022-11-22
30	ARSH-PJ-0034	43	1	1	1	43	2022-02-01	2	2022-02-01	2022-08-17 09:16:45	0	0000000223		2022-11-22
659	AGSI-PE-0879	29	1	5	1	165	2022-07-01	2	2022-07-01	2022-08-17 09:14:03	0	0000000222		2022-11-22
539	AGSI-PE-0879	29	1	5	1	165	2022-06-01	2	2022-06-01	2022-08-17 09:12:30	0	0000000221		2022-11-22
419	AGSI-PE-0879	29	1	5	1	165	2022-05-01	2	2022-05-01	2022-08-17 09:06:42	0	0000000220		2022-11-22
299	AGSI-PE-0879	29	1	5	1	165	2022-04-01	2	2022-04-01	2022-08-17 09:04:44	0	0000000219		2022-11-22
179	AGSI-PE-0879	29	1	1	1	33	2022-03-01	2	2022-03-01	2022-08-17 09:03:41	0	0000000218		2022-11-22
59	AGSI-PE-0879	29	1	1	1	33	2022-02-01	2	2022-02-01	2022-08-17 09:02:46	0	0000000217		2022-11-22
594	AGSI-RE-0655	50	1	5	1	250	2022-06-01	2	2022-06-01	2022-08-17 08:59:18	0	0000000216		2022-11-22
474	AGSI-RE-0655	50	1	5	1	250	2022-05-01	2	2022-05-01	2022-08-17 08:57:22	0	0000000215		2022-11-22
354	AGSI-RE-0655	50	1	5	1	250	2022-04-01	2	2022-04-01	2022-08-17 08:52:38	0	0000000214		2022-11-22
234	AGSI-RE-0655	50	1	1	1	50	2022-03-01	2	2022-03-01	2022-08-17 08:49:24	0	0000000213		2022-11-22
114	AGSI-RE-0655	50	1	1	1	50	2022-02-01	2	2022-02-01	2022-08-17 08:46:44	0	0000000212		2022-11-22
710	AGSI-RE-0886	46	1	5	1	230	2022-07-01	2	2022-07-01	2022-08-17 08:16:41	0	0000000211		2022-11-22
590	AGSI-RE-0886	46	1	5	1	230	2022-06-01	2	2022-06-01	2022-08-17 08:14:29	0	0000000210		2022-11-22
470	AGSI-RE-0886	46	1	5	1	230	2022-05-01	2	2022-05-01	2022-08-17 08:11:33	0	0000000209		2022-11-22
350	AGSI-RE-0886	46	1	5	1	230	2022-04-01	2	2022-04-01	2022-08-17 08:08:52	0	0000000208		2022-11-22
230	AGSI-RE-0886	46	1	1	1	46	2022-03-01	2	2022-03-01	2022-08-17 08:05:13	0	0000000207		2022-11-22
110	AGSI-RE-0886	46	1	1	1	46	2022-02-01	2	2022-02-01	2022-08-17 08:02:03	0	0000000206		2022-11-22
349	AGSI-RE-1349	60	1	5	1	300	2022-04-01	2	2022-04-01	2022-08-17 07:54:51	0	0000000205		2022-11-22
229	AGSI-RE-1349	60	1	1	1	60	2022-03-01	2	2022-03-01	2022-08-17 07:51:11	0	0000000204		2022-11-22
109	AGSI-RE-1349	60	1	1	1	60	2022-02-01	2	2022-02-01	2022-08-17 07:46:24	0	0000000203		2022-11-22
226	AGSI-D-5926	63	1	1	1	63	2022-03-01	2	2022-03-01	2022-08-17 07:43:02	0	0000000202		2022-11-22
106	AGSI-D-5926	63	1	1	1	63	2022-02-01	2	2022-02-01	2022-08-17 07:42:08	0	0000000201		2022-11-22
583	AGSI-RE-1001	54	1	5	1	270	2022-06-01	2	2022-06-01	2022-08-17 07:40:20	0	0000000200		2022-11-22
463	AGSI-RE-1001	54	1	5	1	270	2022-05-01	2	2022-05-01	2022-08-17 07:38:28	0	0000000199		2022-11-22
343	AGSI-RE-1001	54	1	5	1	270	2022-04-01	2	2022-04-01	2022-08-17 07:36:48	0	0000000198		2022-11-22
103	AGSI-RE-1001	54	1	1	1	54	2022-02-01	2	2022-02-01	2022-08-17 07:32:13	0	0000000196		2022-11-22
579	AGSI-D-23005	63	1	5	1	315	2022-06-01	2	2022-06-01	2022-08-17 07:28:22	0	0000000195		2022-11-22
459	AGSI-D-23005	63	1	5	1	315	2022-05-01	2	2022-05-01	2022-08-17 07:26:53	0	0000000194		2022-11-22
339	AGSI-D-23005	63	1	5	1	315	2022-04-01	2	2022-04-01	2022-08-17 07:25:46	0	0000000193		2022-11-22
219	AGSI-D-23005	63	1	1	1	63	2022-03-01	2	2022-03-01	2022-08-17 07:24:29	0	0000000192		2022-11-22
99	AGSI-D-23005	63	1	1	1	63	2022-02-01	2	2022-02-01	2022-08-17 07:23:24	0	0000000191		2022-11-22
578	AGSI-PE-0829	34	1	5	1	170	2022-06-01	2	2022-06-01	2022-08-17 07:21:15	0	0000000190		2022-11-22
458	AGSI-PE-0829	34	1	5	1	170	2022-05-01	2	2022-05-01	2022-08-17 07:20:01	0	0000000189		2022-11-22
338	AGSI-PE-0829	34	1	5	1	170	2022-04-01	2	2022-04-01	2022-08-17 07:18:06	0	0000000188		2022-11-22
218	AGSI-PE-0829	34	1	1	1	34	2022-03-01	2	2022-03-01	2022-08-17 07:16:59	0	0000000187		2022-11-22
98	AGSI-PE-0829	34	1	1	1	34	2022-02-01	2	2022-02-01	2022-08-17 07:15:45	0	0000000186		2022-11-22
693	APNN-D-675	35	2	5	1	175	2022-07-01	2	2022-07-01	2022-08-17 07:13:12	0	0000000185		2022-11-22
573	APNN-D-675	35	2	5	1	175	2022-06-01	2	2022-06-01	2022-08-17 07:11:45	0	0000000184		2022-11-22
453	APNN-D-675	35	2	5	1	175	2022-05-01	2	2022-05-01	2022-08-17 07:10:10	0	0000000183		2022-11-22
333	APNN-D-675	35	2	5	1	175	2022-04-01	2	2022-04-01	2022-08-17 07:09:01	0	0000000182		2022-11-22
213	APNN-D-675	35	2	1	1	35	2022-03-01	2	2022-03-01	2022-08-17 07:07:04	0	0000000181		2022-11-22
93	APNN-D-675	35	2	1	1	35	2022-02-01	2	2022-02-01	2022-08-17 07:05:57	0	0000000180		2022-11-22
328	AGSI-D-11413	32	1	5	1	165	2022-04-01	2	2022-04-01	2022-08-17 07:03:50	0	0000000179		2022-11-22
208	AGSI-D-11413	32	1	1	1	33	2022-03-01	2	2022-03-01	2022-08-17 07:01:34	0	0000000178		2022-11-22
88	AGSI-D-11413	32	1	1	1	33	2022-02-01	2	2022-02-01	2022-08-17 06:59:19	0	0000000177		2022-11-22
444	AGSI-RE-0202	88	1	5	1	440	2022-05-01	2	2022-05-01	2022-08-17 06:56:26	0	0000000176		2022-11-22
324	AGSI-RE-0202	88	1	5	1	440	2022-04-01	2	2022-04-01	2022-08-17 06:55:31	0	0000000175		2022-11-22
204	AGSI-RE-0202	88	1	1	1	88	2022-03-01	2	2022-03-01	2022-08-17 06:54:28	0	0000000174		2022-11-22
84	AGSI-RE-0202	88	1	1	1	88	2022-02-01	2	2022-02-01	2022-08-17 06:53:02	0	0000000173		2022-11-22
682	AGSI-D-22966	58	1	5	1	290	2022-07-01	2	2022-07-01	2022-08-17 06:50:53	0	0000000172		2022-11-22
562	AGSI-D-22966	58	1	5	1	290	2022-06-01	2	2022-06-01	2022-08-17 06:49:23	0	0000000171		2022-11-22
442	AGSI-D-22966	58	1	5	1	290	2022-05-01	2	2022-05-01	2022-08-17 06:48:34	0	0000000170		2022-11-22
732	AGSI-re-tramite-098	14	2	5	1	70	2022-08-01	2	2022-08-01	2022-09-09 05:12:29	0	0000000169		2022-11-22
557	AGSI-RE-1472	19	2	5	1	95	2022-06-01	2	2022-06-01	2022-09-07 06:29:01	0	0000000168		2022-11-22
437	AGSI-RE-1472	19	2	5	1	95	2022-05-01	2	2022-05-01	2022-09-07 06:27:38	0	0000000167		2022-11-22
197	AGSI-RE-1472	19	2	1	1	19	2022-03-01	2	2022-03-01	2022-09-07 06:20:24	0	0000000166		2022-11-22
199	AGSP-RE-0963	28	1	1	1	28	2022-03-01	2	2022-03-01	2022-09-07 06:06:58	0	0000000165		2022-11-22
79	AGSP-RE-0963	28	1	1	1	28	2022-02-01	2	2022-02-01	2022-09-07 06:05:26	0	0000000164		2022-11-22
176	AGSI-RE-GTRAMITE52	70	1	1	1	70	2022-03-01	2	2022-03-01	2022-09-07 09:01:56	0	0000000163	CASA MILITAR PAGA A PARTIR DE MAYO POR TRASPASO EMBARCACION	2022-11-22
797	AGSI-RE-1472	19	2	5	1	95	2022-08-01	2	2022-08-01	2022-09-07 06:31:21	0	0000000162		2022-11-22
978	AGSI-RE-1011	45	1	5	1	225	2022-10-01	2	2022-09-06	2022-09-06 00:00:00	0	0000000161	pago octubre en septiembre pago alejandro encargado	2022-11-22
677	AGSI-RE-1472	19	2	5	1	95	2022-07-01	2	2022-07-01	2022-09-07 06:30:16	0	0000000160		2022-11-22
920	AGSI-RE-0753	60	1	5	1	300	2022-09-01	2	2022-09-01	2022-09-05 09:24:20	0	0000000159		2022-11-22
896	AGSI-RE-0169	36	2	5	1	180	2022-09-01	2	2022-09-01	2022-09-01 06:55:19	0	0000000158	DESINCORPORADO DE LAS INSTALACIONES EN AGOSTO 	2022-11-22
773	AGSI-RE-0169	36	2	5	1	180	2022-08-01	2	2022-08-01	2022-09-01 06:54:29	0	0000000157	DESINCORPORADO DE LAS INSTALACIONES EN AGOSTO 	2022-11-22
835	AGSP-D-2875	30	2	5	1	150	2022-08-01	2	2022-08-01	2022-09-09 04:56:43	0	0000000156		2022-11-22
879	AGSI-RE-0661	45	1	5	1	225	2022-09-01	2	2022-09-01	2022-09-06 10:30:42	0	0000000155		2022-11-22
847	AGSI-RE-1011	45	1	5	1	225	2022-09-01	2	2022-09-01	2022-09-06 07:34:58	0	0000000154	pago alejandro encargado	2022-11-22
715	AGSP-D-2875	30	2	5	1	150	2022-07-01	2	2022-07-01	2022-09-09 04:55:37	0	0000000153		2022-11-22
740	AGSI-D- 2796	27	1	5	1	165	2022-08-01	2	2022-08-01	2022-09-08 04:42:01	0	0000000152		2022-11-22
830	AGSI-RE-0886	46	1	5	1	230	2022-08-01	2	2022-08-01	2022-09-07 07:35:09	0	0000000151		2022-11-22
799	AGSP-RE-0963	28	1	5	1	165	2022-08-01	2	2022-08-01	2022-09-07 06:13:23	0	0000000150		2022-11-22
728	AGSI-2927	44	1	5	1	220	2022-08-01	2	2022-08-01	2022-09-07 05:56:00	0	0000000149	PAGADO POR JOSE VILLAR EL 02-09	2022-11-22
781	AGSI-2720	47	1	5	1	235	2022-08-01	2	2022-08-01	2022-09-07 05:53:14	0	0000000148	PAGADO POR JOSE VILLAR EL 02-09	2022-11-22
749	AGSI-D-5814	37	1	5	1	185	2022-08-01	2	2022-08-01	2022-09-07 05:45:34	0	0000000147		2022-11-22
739	AGSI-RE-0601	22	1	1	1	110	2022-08-01	2	2022-08-01	2022-09-05 10:26:04	0	0000000146		2022-11-22
832	AGSI-TU-0072	14	2	5	1	70	2022-08-01	2	2022-08-01	2022-09-05 10:30:32	0	0000000145		2022-11-22
798	AGSI-RE-0753	60	1	5	1	300	2022-08-01	2	2022-08-01	2022-09-05 09:23:52	0	0000000144		2022-11-22
787	AGSI-PJ-0070	33	1	5	1	165	2022-08-01	2	2022-08-01	2022-09-09 05:17:16	0	0000000143		2022-11-22
667	AGSI-PJ-0070	33	1	5	1	165	2022-07-01	2	2022-07-01	2022-09-09 05:16:41	0	0000000142		2022-11-22
547	AGSI-PJ-0070	33	1	5	1	165	2022-06-01	2	2022-06-01	2022-09-09 05:14:00	0	0000000141		2022-11-22
595	AGSP-D-2875	30	2	5	1	150	2022-06-01	2	2022-06-01	2022-09-09 04:54:55	0	0000000140		2022-11-22
548	AGSI-RE-1339	47	1	5	1	235	2022-06-01	2	2022-06-01	2022-09-09 05:28:51	0	0000000138		2022-11-22
656	AGSI-RE-GTRAMITE52	70	1	5	1	350	2022-07-01	2	2022-07-01	2022-09-07 09:07:02	0	0000000137		2022-11-22
536	AGSI-RE-GTRAMITE52	70	1	5	1	350	2022-06-01	2	2022-06-01	2022-09-07 09:06:14	0	0000000136		2022-11-22
625	AGSI-D-11629	27	1	5	1	165	2022-07-01	2	2022-07-01	2022-09-07 08:56:36	0	0000000135		2022-11-22
522	AGSI-TU-0161	45	1	5	1	225	2022-06-01	2	2022-06-01	2022-09-07 08:38:41	0	0000000134		2022-11-22
679	AGSP-RE-0963	28	1	5	1	165	2022-07-01	2	2022-07-01	2022-09-07 06:12:37	0	0000000133		2022-11-22
619	AGSI-RE-0601	22	1	1	1	110	2022-07-01	2	2022-07-01	2022-09-05 10:25:47	0	0000000132		2022-11-22
559	AGSP-RE-0963	28	1	5	1	165	2022-06-01	2	2022-06-01	2022-09-07 06:11:15	0	0000000131		2022-11-22
499	AGSI-RE-0601	22	1	1	1	110	2022-06-01	2	2022-06-01	2022-09-05 10:25:32	0	0000000130		2022-11-22
612	AGSI-re-tramite-098	14	2	5	1	70	2022-07-01	2	2022-07-01	2022-09-09 05:11:46	0	0000000129		2022-11-22
317	AGSI-RE-1472	19	2	5	1	95	2022-04-01	2	2022-04-01	2022-09-07 06:26:24	0	0000000128		2022-11-22
439	AGSP-RE-0963	28	1	5	1	140	2022-05-01	2	2022-05-01	2022-09-07 06:10:15	0	0000000127		2022-11-22
319	AGSP-RE-0963	28	1	5	1	140	2022-04-01	2	2022-04-01	2022-09-07 06:07:48	0	0000000126		2022-11-22
253	Agsi-re-tramite-3344	11	2	5	1	55	2022-04-01	2	2022-04-01	2022-09-05 11:17:18	0	0000000125		2022-11-22
373	Agsi-re-tramite-3344	11	2	5	1	55	2022-05-01	2	2022-05-01	2022-09-05 11:16:28	0	0000000124		2022-11-22
492	AGSI-re-tramite-098	14	2	5	1	70	2022-06-01	2	2022-06-01	2022-09-09 05:10:52	0	0000000123		2022-11-22
416	AGSI-RE-GTRAMITE52	70	1	5	1	350	2022-05-01	2	2022-05-01	2022-09-07 09:05:33	0	0000000122		2022-11-22
232	AGSI-TU-0072	14	2	1	1	33	2022-03-01	2	2022-03-01	2022-09-05 10:29:53	0	0000000121		2022-11-22
325	AGSI-RE-0989	24	2	5	1	165	2022-04-01	2	2022-04-01	2022-09-05 11:04:12	0	0000000120		2022-11-22
205	AGSI-RE-0989	24	2	1	1	33	2022-03-01	2	2022-03-01	2022-09-05 11:03:56	0	0000000119		2022-11-22
296	AGSI-RE-GTRAMITE52	70	1	5	1	350	2022-04-01	2	2022-04-01	2022-09-07 09:04:25	0	0000000118	CASA MILITAR, PAGA A PARTIR DE MAYO POR TRASPASO DE EMBARCACION	2022-11-22
402	AGSI-TU-0161	45	1	5	1	225	2022-05-01	2	2022-05-01	2022-09-07 08:38:04	0	0000000117		2022-11-22
379	AGSI-RE-0601	22	1	1	1	110	2022-05-01	2	2022-05-01	2022-09-05 10:25:14	0	0000000116		2022-11-22
259	AGSI-RE-0601	22	1	1	1	110	2022-04-01	2	2022-04-01	2022-09-05 10:24:46	0	0000000115		2022-11-22
475	AGSP-D-2875	30	2	5	1	150	2022-05-01	2	2022-05-01	2022-09-07 07:06:50	0	0000000114		2022-11-22
355	AGSP-D-2875	30	2	5	1	150	2022-04-01	2	2022-04-01	2022-09-07 07:03:45	0	0000000113		2022-11-22
235	AGSP-D-2875	30	2	1	1	30	2022-03-01	2	2022-03-01	2022-09-07 06:58:46	0	0000000112		2022-11-22
77	AGSI-RE-1472	19	2	1	1	19	2022-02-01	2	2022-02-01	2022-09-07 06:19:14	0	0000000111		2022-11-22
133	Agsi-re-tramite-3344	11	2	1	1	11	2022-03-01	2	2022-03-01	2022-09-05 11:15:03	0	0000000110		2022-11-22
13	Agsi-re-tramite-3344	11	2	1	1	11	2022-02-01	2	2022-02-01	2022-09-05 11:14:45	0	0000000109		2022-11-22
85	AGSI-RE-0989	24	2	1	1	33	2022-02-01	2	2022-02-01	2022-09-05 11:03:32	0	0000000108		2022-11-22
112	AGSI-TU-0072	14	2	1	1	33	2022-02-01	2	2022-02-01	2022-09-05 10:29:30	0	0000000107		2022-11-22
56	AGSI-RE-GTRAMITE52	70	1	1	1	70	2022-02-01	2	2022-02-01	2022-09-07 09:00:03	0	0000000106	CASA MILITAR PAGA A PARTIR DE MAYO POR TRASPASO DE EMBARCACION	2022-11-22
162	AGSI-TU-0161	45	1	1	1	45	2022-03-01	2	2022-03-01	2022-09-07 08:35:20	0	0000000105		2022-11-22
139	AGSI-RE-0601	22	1	1	1	33	2022-03-01	2	2022-03-01	2022-09-05 10:24:24	0	0000000104		2022-11-22
19	AGSI-RE-0601	22	1	1	1	33	2022-02-01	2	2022-02-01	2022-09-05 10:24:09	0	0000000103		2022-11-22
42	AGSI-TU-0161	45	1	1	1	45	2022-02-01	2	2022-02-01	2022-09-07 08:33:20	0	0000000102		2022-11-22
115	AGSP-D-2875	30	2	1	1	30	2022-02-01	2	2022-02-01	2022-09-07 06:57:47	0	0000000101		2022-11-22
322	AGSI-D-22966	58	1	5	1	290	2022-04-01	2	2022-04-01	2022-08-17 06:46:38	0	0000000100		2022-11-22
202	AGSI-D-22966	58	1	1	1	58	2022-03-01	2	2022-03-01	2022-08-17 06:45:11	0	0000000099		2022-11-22
82	AGSI-D-22966	58	1	1	1	58	2022-02-01	2	2022-02-01	2022-08-17 06:44:17	0	0000000098		2022-11-22
200	AGSI-RE-1098	30	1	1	1	33	2022-03-01	2	2022-03-01	2022-08-17 06:41:07	0	0000000097		2022-11-22
80	AGSI-RE-1098	30	1	1	1	33	2022-02-01	2	2022-02-01	2022-08-17 06:39:43	0	0000000096		2022-11-22
75	AGSI-RE-1176	81	1	1	1	81	2022-02-01	2	2022-02-01	2022-08-17 06:37:43	0	0000000095		2022-11-22
553	ARSH-D-1850	85	1	5	1	425	2022-06-01	2	2022-06-01	2022-08-17 06:34:04	0	0000000094		2022-11-22
433	ARSH-D-1850	85	1	5	1	425	2022-05-01	2	2022-05-01	2022-08-17 06:31:52	0	0000000093		2022-11-22
313	ARSH-D-1850	85	1	5	1	425	2022-04-01	2	2022-04-01	2022-08-17 06:28:56	0	0000000092		2022-11-22
193	ARSH-D-1850	85	1	1	1	85	2022-03-01	2	2022-03-01	2022-08-17 06:27:06	0	0000000091		2022-11-22
73	ARSH-D-1850	85	1	1	1	85	2022-02-01	2	2022-02-01	2022-08-17 06:25:39	0	0000000090		2022-11-22
549	AGSI-D-6150	35	1	5	1	175	2022-06-01	2	2022-06-01	2022-08-17 06:22:35	0	0000000089		2022-11-22
429	AGSI-D-6150	35	1	5	1	175	2022-05-01	2	2022-05-01	2022-08-17 06:20:52	0	0000000088		2022-11-22
309	AGSI-D-6150	35	1	5	1	175	2022-04-01	2	2022-04-01	2022-08-17 06:18:37	0	0000000087		2022-11-22
189	AGSI-D-6150	35	1	1	1	35	2022-03-01	2	2022-03-01	2022-08-17 06:16:34	0	0000000086		2022-11-22
69	AGSI-D-6150	35	1	1	1	35	2022-02-01	2	2022-02-01	2022-08-17 06:14:16	0	0000000085		2022-11-22
666	ADKN-D-3015	36	1	5	1	180	2022-07-01	2	2022-07-01	2022-08-17 06:05:08	0	0000000083		2022-11-22
546	ADKN-D-3015	36	1	5	1	180	2022-06-01	2	2022-06-01	2022-08-17 06:02:53	0	0000000082		2022-11-22
426	ADKN-D-3015	36	1	5	1	180	2022-05-01	2	2022-05-01	2022-08-17 06:01:09	0	0000000081		2022-11-22
306	ADKN-D-3015	36	1	5	1	180	2022-04-01	2	2022-04-01	2022-08-17 05:59:15	0	0000000080		2022-11-22
186	ADKN-D-3015	36	1	1	1	36	2022-03-01	2	2022-03-01	2022-08-17 05:56:34	0	0000000079		2022-11-22
66	ADKN-D-3015	36	1	1	1	36	2022-02-01	2	2022-02-01	2022-08-17 05:55:00	0	0000000078		2022-11-22
661	AGSI-2720	47	1	5	1	235	2022-07-01	2	2022-07-01	2022-08-17 05:49:17	0	0000000077		2022-11-22
541	AGSI-2720	47	1	5	1	235	2022-06-01	2	2022-06-01	2022-08-17 05:47:18	0	0000000076		2022-11-22
421	AGSI-2720	47	1	5	1	235	2022-05-01	2	2022-05-01	2022-08-17 05:45:27	0	0000000075		2022-11-22
301	AGSI-2720	47	1	5	1	235	2022-04-01	2	2022-04-01	2022-08-17 05:43:19	0	0000000074		2022-11-22
181	AGSI-2720	47	1	1	1	47	2022-03-01	2	2022-03-01	2022-08-17 05:39:54	0	0000000073		2022-11-22
61	AGSI-2720	47	1	1	1	47	2022-02-01	2	2022-02-01	2022-08-17 05:37:01	0	0000000072		2022-11-22
540	ARSH-RE-0016	52	1	5	1	260	2022-06-01	2	2022-06-01	2022-08-16 02:20:09	0	0000000071		2022-11-22
420	ARSH-RE-0016	52	1	5	1	260	2022-05-01	2	2022-05-01	2022-08-16 02:09:16	0	0000000070		2022-11-22
300	ARSH-RE-0016	52	1	5	1	260	2022-04-01	2	2022-04-01	2022-08-16 02:04:25	0	0000000069		2022-11-22
180	ARSH-RE-0016	52	1	1	1	52	2022-03-01	2	2022-03-01	2022-08-16 01:01:42	0	0000000068		2022-11-22
60	ARSH-RE-0016	52	1	1	1	52	2022-02-01	2	2022-02-01	2022-08-16 12:41:17	0	0000000067		2022-11-22
778	AGSP-RE-0514	63	1	5	1	315	2022-08-01	2	2022-08-01	2022-08-16 04:40:18	0	0000000066		2022-11-22
658	AGSP-RE-0514	63	1	5	1	315	2022-07-01	2	2022-07-01	2022-08-16 04:39:32	0	0000000065		2022-11-22
538	AGSP-RE-0514	63	1	5	1	315	2022-06-01	2	2022-06-01	2022-08-16 04:38:42	0	0000000064		2022-11-22
418	AGSP-RE-0514	63	1	5	1	315	2022-05-01	2	2022-05-01	2022-08-16 04:38:00	0	0000000063		2022-11-22
298	AGSP-RE-0514	63	1	5	1	315	2022-04-01	2	2022-04-01	2022-08-16 04:37:00	0	0000000062		2022-11-22
178	AGSP-RE-0514	63	1	1	1	63	2022-03-01	2	2022-03-01	2022-08-16 04:36:20	0	0000000061		2022-11-22
58	AGSP-RE-0514	63	1	1	1	63	2022-02-01	2	2022-02-01	2022-08-16 04:35:44	0	0000000060		2022-11-22
657	AGSI-D-5124	36	1	5	1	180	2022-07-01	2	2022-07-01	2022-08-16 04:33:40	0	0000000059		2022-11-22
537	AGSI-D-5124	36	1	5	1	180	2022-06-01	2	2022-06-01	2022-08-16 04:32:33	0	0000000058		2022-11-22
417	AGSI-D-5124	36	1	5	1	180	2022-05-01	2	2022-05-01	2022-08-16 04:31:16	0	0000000057		2022-11-22
297	AGSI-D-5124	36	1	5	1	180	2022-04-01	2	2022-04-01	2022-08-16 04:30:11	0	0000000056		2022-11-22
177	AGSI-D-5124	36	1	1	1	36	2022-03-01	2	2022-03-01	2022-08-16 04:28:54	0	0000000055		2022-11-22
57	AGSI-D-5124	36	1	1	1	36	2022-02-01	2	2022-02-01	2022-08-16 04:28:10	0	0000000054		2022-11-22
649	AGSI-PE-0887	25	1	5	1	165	2022-07-01	2	2022-07-01	2022-08-16 04:22:07	0	0000000053		2022-11-22
529	AGSI-PE-0887	25	1	5	1	165	2022-06-01	2	2022-06-01	2022-08-16 04:21:05	0	0000000052		2022-11-22
409	AGSI-PE-0887	25	1	5	1	165	2022-05-01	2	2022-05-01	2022-08-16 04:19:34	0	0000000051		2022-11-22
289	AGSI-PE-0887	25	1	5	1	165	2022-04-01	2	2022-04-01	2022-08-16 04:18:13	0	0000000050		2022-11-22
169	AGSI-PE-0887	25	1	1	1	33	2022-03-01	2	2022-03-01	2022-08-16 04:17:21	0	0000000049		2022-11-22
49	AGSI-PE-0887	25	1	1	1	33	2022-02-01	2	2022-02-01	2022-08-16 04:16:18	0	0000000048		2022-11-22
516	AGSI-RE-0661	45	1	5	1	225	2022-06-01	2	2022-06-01	2022-08-16 04:13:16	0	0000000047		2022-11-22
396	AGSI-RE-0661	45	1	5	1	225	2022-05-01	2	2022-05-01	2022-08-16 04:12:27	0	0000000046		2022-11-22
276	AGSI-RE-0661	45	1	5	1	225	2022-04-01	2	2022-04-01	2022-08-16 04:11:26	0	0000000045		2022-11-22
156	AGSI-RE-0661	45	1	1	1	45	2022-03-01	2	2022-03-01	2022-08-16 04:09:46	0	0000000044		2022-11-22
36	AGSI-RE-0661	45	1	1	1	45	2022-02-01	2	2022-02-01	2022-08-16 04:08:38	0	0000000043		2022-11-22
509	AGSI-D-5814	37	1	5	1	185	2022-06-01	2	2022-06-01	2022-08-16 04:06:01	0	0000000042		2022-11-22
389	AGSI-D-5814	37	1	5	1	185	2022-05-01	2	2022-05-01	2022-08-16 04:04:44	0	0000000041		2022-11-22
269	AGSI-D-5814	37	1	5	1	185	2022-04-01	2	2022-04-01	2022-08-16 04:03:05	0	0000000040		2022-11-22
149	AGSI-D-5814	37	1	1	1	37	2022-03-01	2	2022-03-01	2022-08-16 04:01:08	0	0000000039		2022-11-22
29	AGSI-D-5814	37	1	1	1	37	2022-02-01	2	2022-02-01	2022-08-16 03:59:18	0	0000000038		2022-11-22
505	AGSI-D-11629	27	1	5	1	165	2022-06-01	2	2022-06-01	2022-08-16 03:57:26	0	0000000037		2022-11-22
385	AGSI-D-11629	27	1	5	1	165	2022-05-01	2	2022-05-01	2022-08-16 03:56:35	0	0000000036		2022-11-22
265	AGSI-D-11629	27	1	5	1	165	2022-04-01	2	2022-04-01	2022-08-16 03:55:56	0	0000000035		2022-11-22
145	AGSI-D-11629	27	1	1	1	33	2022-03-01	2	2022-03-01	2022-08-16 03:54:59	0	0000000034		2022-11-22
25	AGSI-D-11629	27	1	1	1	33	2022-02-01	2	2022-02-01	2022-08-16 03:54:13	0	0000000033		2022-11-22
261	AGSI-RE-0437	30	1	5	1	165	2022-04-01	2	2022-04-01	2022-08-16 03:52:35	0	0000000032		2022-11-22
141	AGSI-RE-0437	30	1	1	1	33	2022-03-01	2	2022-03-01	2022-08-16 03:51:03	0	0000000031		2022-11-22
21	AGSI-RE-0437	30	1	1	1	33	2022-02-01	2	2022-02-01	2022-08-16 03:50:27	0	0000000030		2022-11-22
609	AGSI-PE-0830	23	1	5	1	165	2022-07-01	2	2022-07-01	2022-08-16 03:47:26	0	0000000028		2022-11-22
369	AGSI-PE-0830	23	1	5	1	165	2022-05-01	2	2022-05-01	2022-08-16 03:45:20	0	0000000027		2022-11-22
129	AGSI-PE-0830	23	1	1	1	33	2022-03-01	2	2022-03-01	2022-08-16 03:43:50	0	0000000026		2022-11-22
9	AGSI-PE-0830	23	1	1	1	33	2022-02-01	2	2022-02-01	2022-08-16 03:43:07	0	0000000025		2022-11-22
608	AGSI-2927	44	1	5	1	220	2022-07-01	2	2022-07-01	2022-08-16 03:41:23	0	0000000024		2022-11-22
488	AGSI-2927	44	1	5	1	220	2022-06-01	2	2022-06-01	2022-08-16 03:38:30	0	0000000023		2022-11-22
368	AGSI-2927	44	1	5	1	220	2022-05-01	2	2022-05-01	2022-08-16 03:35:51	0	0000000022		2022-11-22
248	AGSI-2927	44	1	5	1	220	2022-04-01	2	2022-04-01	2022-08-16 03:34:10	0	0000000021		2022-11-22
128	AGSI-2927	44	1	1	1	44	2022-03-01	2	2022-03-01	2022-08-16 03:32:43	0	0000000020		2022-11-22
8	AGSI-2927	44	1	1	1	44	2022-02-01	2	2022-02-01	2022-08-16 03:31:59	0	0000000019		2022-11-22
606	AGSI-D-5535	42	1	5	1	210	2022-07-01	2	2022-07-01	2022-08-16 03:29:43	0	0000000018		2022-11-22
486	AGSI-D-5535	42	1	5	1	210	2022-06-01	2	2022-06-01	2022-08-16 03:29:06	0	0000000017		2022-11-22
366	AGSI-D-5535	42	1	5	1	210	2022-05-01	2	2022-05-01	2022-08-16 03:27:51	0	0000000016		2022-11-22
246	AGSI-D-5535	42	1	5	1	210	2022-04-01	2	2022-04-01	2022-08-16 03:26:58	0	0000000015		2022-11-22
126	AGSI-D-5535	42	1	1	1	42	2022-03-01	2	2022-03-01	2022-08-16 03:24:40	0	0000000014		2022-11-22
6	AGSI-D-5535	42	1	1	1	42	2022-02-01	2	2022-02-01	2022-08-16 03:23:15	0	0000000013		2022-11-22
723	AGSI-RE-1011	45	1	5	1	225	2022-08-01	2	2022-08-01	2022-08-16 03:19:38	0	0000000012		2022-11-22
603	AGSI-RE-1011	45	1	5	1	225	2022-07-01	2	2022-07-01	2022-08-16 03:17:52	0	0000000011		2022-11-22
483	AGSI-RE-1011	45	1	5	1	225	2022-06-01	2	2022-06-01	2022-08-16 03:16:26	0	0000000010		2022-11-22
363	AGSI-RE-1011	45	1	5	1	225	2022-05-01	2	2022-05-01	2022-08-16 03:13:33	0	0000000009		2022-11-22
243	AGSI-RE-1011	45	1	5	1	225	2022-04-01	2	2022-04-01	2022-08-16 03:10:30	0	0000000008		2022-11-22
123	AGSI-RE-1011	45	1	1	1	45	2022-03-01	2	2022-03-01	2022-08-16 03:07:50	0	0000000007		2022-11-22
3	AGSI-RE-1011	45	1	1	1	45	2022-02-01	2	2022-02-01	2022-08-16 03:03:47	0	0000000006		2022-11-22
482	AGSI-D-9005	31	1	5	1	165	2022-06-01	2	2022-06-01	2022-08-16 02:59:59	0	0000000005		2022-11-22
362	AGSI-D-9005	31	1	5	1	165	2022-05-01	2	2022-05-01	2022-08-16 02:57:49	0	0000000004		2022-11-22
242	AGSI-D-9005	31	1	5	1	165	2022-04-01	2	2022-04-01	2022-08-16 02:55:41	0	0000000003		2022-11-22
122	AGSI-D-9005	31	1	1	1	33	2022-03-01	2	2022-03-01	2022-08-16 02:40:09	0	0000000002		2022-11-22
31	AGSI-RE-TRAMITE87	32	1	1	1	33	2022-02-01	2	2022-02-01	2022-08-23 06:54:54	0	0000000001		2022-11-22
670	AGSI-D-5810	55	1	5	1	275	2022-07-01	0	2022-07-01	2022-07-01 00:00:00	0	0		2022-11-22
168	AGSI-PE-0532	24	1	1	1	33	2022-03-01	2	2022-03-01	2022-09-12 08:04:32	0	0000000626	CUENTA POR COBRAR VENETUR	2022-11-22
70	AGSI-D-5810	55	1	1	1	55	2022-02-01	2	2022-02-01	2022-09-12 10:04:54	0	0000000630		2022-11-22
674	AGSI-D-4396	62	1	5	1	310	2022-07-01	2	2022-07-01	2023-03-20 05:41:00	0	0000001400	se desincorporar por orden de la directiva 	2023-03-20
717	AGSI-D-21173	32	1	5	1	165	2022-07-01	2	2022-07-01	2023-04-01 02:39:35	0	0000001452	embarcacion en abandono por mas de 3 años propietarios no responden a los comunicados se le dio desincorporacion 01/04/2023	2023-04-01
50	AGSI-RE- TRAMITE96589	31	1	1	1	33	2022-02-01	2	2022-02-01	2023-04-21 06:46:49	0	0000001548	la embarcación esta en estado de abandono por tal motivo es retirada de la marina el propietario no responde a las cartas enviadas se llevara a un deposito 	2023-04-21
713	AGSI-D-15916	40	1	5	1	200	2022-07-01	2	2022-07-01	2023-05-02 03:36:35	0	0000001591	EL PROPIETARIO NO RESPONDE A LOS COMUNICADOS NI SE HA PRESENTADO EN LA MARINA POR MAS DE 1 AÑO SE PROSEDE HACER DESINCORPORACION 	2023-05-02
190	AGSI-D-5810	55	1	1	1	55	2022-03-01	2	2022-03-01	2022-09-12 10:05:35	0	0000000631		2022-11-22
489	AGSI-PE-0830	23	1	5	1	165	2022-06-01	2	2022-06-01	2022-09-13 07:30:55	0	0000000636		2022-11-22
714	AGSI-RE-0655	50	1	5	1	250	2022-07-01	2	2022-07-01	2022-09-16 07:39:03	0	0000000645		2022-11-22
720	AGSP-RE-0587	25	2	5	1	125	2022-07-01	2	2022-07-01	2022-09-16 07:48:44	0	0000000647		2022-11-22
730	AGSI-RE-1239	44	1	5	1	220	2022-08-01	2	2022-08-01	2022-09-23 08:46:53	0	0000000661	pago agosto en septiembre 	2022-11-22
662	Agsi-re-tramite-224466	48	1	5	1	240	2022-07-01	2	2022-07-01	2022-09-28 02:28:12	0	0000000672		2022-11-22
660	ARSH-RE-0016	52	1	5	1	260	2022-07-01	2	2022-07-01	2022-09-28 04:01:55	0	0000000677		2022-11-22
722	AGSI-D-9005	31	1	5	1	165	2022-08-01	2	2022-08-01	2022-09-29 07:08:16	0	0000000685		2022-11-22
725	AGSI-RE-TRAMITE789	47	1	5	1	235	2022-08-01	2	2022-08-01	2022-09-30 02:41:29	0	0000000687		2022-11-22
11	AGSI-RE-TRAMITE 000123	11	2	1	1	11	2022-02-01	2	2022-02-01	2022-09-30 02:52:56	0	0000000693		2022-11-22
131	AGSI-RE-TRAMITE 000123	11	2	1	1	11	2022-03-01	2	2022-03-01	2022-09-30 02:53:19	0	0000000694		2022-11-22
251	AGSI-RE-TRAMITE 000123	11	2	5	1	55	2022-04-01	2	2022-04-01	2022-09-30 02:53:35	0	0000000695		2022-11-22
731	AGSI-RE-TRAMITE 000123	11	2	5	1	55	2022-08-01	2	2022-08-01	2022-09-30 02:54:39	0	0000000699		2022-11-22
697	AGSP-1992	43	1	5	1	215	2022-07-01	2	2022-07-01	2022-10-01 05:41:09	0	0000000717		2022-11-22
664	AGSI-2221	42	1	5	1	210	2022-07-01	2	2022-07-01	2022-10-04 11:00:40	0	0000000745		2022-11-22
688	AGSI-D-11413	32	1	5	1	165	2022-07-01	2	2022-07-01	2022-10-07 02:55:51	0	0000000751		2022-11-22
41	ARSH-D-2077	80	1	1	1	80	2022-02-01	2	2022-02-01	2022-10-11 06:03:35	0	0000000775		2022-11-22
161	ARSH-D-2077	80	1	1	1	80	2022-03-01	2	2022-03-01	2022-10-11 06:04:12	0	0000000776		2022-11-22
27	AGSI-RE-1587	55	1	1	1	55	2022-02-01	2	2022-02-01	2022-11-10 09:47:29	0	0000000888		2022-11-22
147	AGSI-RE-1587	55	1	1	1	55	2022-03-01	2	2022-03-01	2022-11-10 09:47:52	0	0000000889		2022-11-22
758	AGSI-RE-TRAMITE7458	115	1	5	1	575	2022-08-01	0	2022-08-01	2022-08-01 00:00:00	0	0		2022-11-22
790	AGSI-D-5810	55	1	5	1	275	2022-08-01	0	2022-08-01	2022-08-01 00:00:00	0	0		2022-11-22
841	AGSM-RE-0897	50	1	1	1	250	2022-09-01	2	2022-08-22	2022-08-22 00:00:00	0	0		2022-11-22
842	AGSI-RE-1303	63	1	5	1	315	2022-09-01	2	2022-08-22	2022-08-22 00:00:00	0	0		2022-11-22
843	AGSI-RE-0891	32	1	1	1	165	2022-09-01	2	2022-08-24	2022-08-24 00:00:00	0	0		2022-11-22
733	Agsi-re-tramite-3344	11	2	5	1	55	2022-08-01	2	2022-08-01	2022-11-19 03:06:50	0	0000000912		2022-11-22
784	AGSI-2221	42	1	5	1	210	2022-08-01	2	2022-08-01	2022-11-19 03:13:45	0	0000000914		2022-11-22
769	AGSI-PE-0887	25	1	5	1	165	2022-08-01	2	2022-08-01	2022-09-12 06:58:03	0	0000000615		2022-11-22
816	AGSI-D-23325	27	1	5	1	165	2022-08-01	2	2022-08-01	2022-09-12 06:59:49	0	0000000616		2022-11-22
788	AGSI-RE-1339	47	1	5	1	235	2022-08-01	2	2022-08-01	2022-09-12 07:12:56	0	0000000618		2022-11-22
834	AGSI-RE-0655	50	1	5	1	250	2022-08-01	2	2022-08-01	2022-09-16 07:39:33	0	0000000646		2022-11-22
840	AGSP-RE-0587	25	2	5	1	125	2022-08-01	2	2022-08-01	2022-09-16 07:49:14	0	0000000648		2022-11-22
807	AGSI-D-6032	34	1	5	1	170	2022-08-01	2	2022-08-01	2022-09-16 07:51:44	0	0000000649		2022-11-22
754	AGSI-RE-0805	72	1	5	1	360	2022-08-01	2	2022-08-01	2022-09-21 10:49:58	0	0000000653	pago agosto en septiembre 	2022-11-22
791	ADKN-2106	44	1	5	1	220	2022-08-01	2	2022-08-01	2022-09-23 09:11:08	0	0000000662		2022-11-22
818	AGSI-PE-0829	34	1	5	1	170	2022-08-01	2	2022-08-01	2022-09-27 11:43:54	0	0000000666		2022-11-22
804	AGSI-RE-0202	88	1	5	1	440	2022-08-01	2	2022-08-01	2022-09-28 02:24:58	0	0000000669		2022-11-22
782	Agsi-re-tramite-224466	48	1	5	1	240	2022-08-01	2	2022-08-01	2022-09-28 02:28:45	0	0000000673		2022-11-22
809	AGSM-RE-0620	47	1	5	1	235	2022-08-01	2	2022-08-01	2022-09-28 05:58:14	0	0000000678	carlos perez ( capitan )	2022-11-22
823	AGSI-RE-1001	54	1	5	1	270	2022-08-01	2	2022-08-01	2022-09-28 06:12:18	0	0000000681		2022-11-22
815	AGSI-RE-1354	24	2	5	1	120	2022-08-01	2	2022-08-01	2022-09-28 10:55:42	0	0000000682		2022-11-22
848	AGSI-RE-TRAMITE789	47	1	5	1	235	2022-09-01	2	2022-09-01	2022-09-30 02:41:56	0	0000000688		2022-11-22
786	ADKN-D-3015	36	1	5	1	180	2022-08-01	2	2022-08-01	2022-09-30 02:46:33	0	0000000689		2022-11-22
748	DL1324AC	73	1	5	1	365	2022-08-01	2	2022-08-01	2022-12-23 07:10:07	0	0000001073		2022-12-23
820	AGSI-D-23647	36	1	5	1	180	2022-08-01	2	2022-08-01	2022-09-30 02:49:27	0	0000000691		2022-11-22
859	AGSI-D-9606	23	2	5	1	115	2022-09-01	2	2022-09-01	2023-01-02 01:54:43	0	0000001108	embarcacion en abandono por mas de 1 años se le a notificado al propietario y se le presento en muchas ocaciones la carte de cobranza con la nota del desalojo incluso llamadas telefonicas y el propietario nunca respondio a los llamados en marzo del 2022 fue retirada del puesto en agua 	2023-01-02
854	AGSI-RE-TRAMITE 000123	11	2	5	1	55	2022-09-01	2	2022-09-01	2022-09-30 02:54:55	0	0000000700		2022-11-22
861	AGSI-RE-22326	33	1	5	1	165	2022-09-01	2	2022-09-01	2022-09-30 07:18:13	0	0000000704		2022-11-22
822	AMSH-RE 0323	62	1	5	1	310	2022-08-01	2	2022-08-01	2022-09-30 07:28:14	0	0000000707		2022-11-22
851	AGSI-2927	44	1	5	1	220	2022-09-01	2	2022-09-01	2022-09-30 08:14:29	0	0000000710	PAGO CAPITAN CADIZ	2022-11-22
864	AGSI-RE-0437	30	1	5	1	165	2022-09-01	2	2022-09-01	2022-10-01 01:48:47	0	0000000712		2022-11-22
817	AGSP-1992	43	1	5	1	215	2022-08-01	2	2022-08-01	2022-10-01 05:42:17	0	0000000718		2022-11-22
742	Agsi-re-0678	42	1	5	1	210	2022-08-01	2	2022-08-01	2022-10-02 06:40:29	0	0000000724		2022-11-22
802	AGSI-D-22966	58	1	5	1	290	2022-08-01	2	2022-08-01	2022-10-02 06:43:01	0	0000000725		2022-11-22
795	AGSI-RE-1176	81	1	5	1	405	2022-08-01	2	2022-08-01	2022-10-03 05:47:47	0	0000000732		2022-11-22
793	ARSH-D-1850	85	1	5	1	425	2022-08-01	2	2022-08-01	2022-10-03 07:14:38	0	0000000734	PAGO EL ENCARGADO RICHAR MORENO	2022-11-22
768	AGSI-PE-0532	24	1	5	1	165	2022-08-01	2	2022-08-01	2022-10-04 04:51:10	0	0000000739		2022-11-22
753	AGSI-D-20765	35	1	5	1	175	2022-08-01	2	2022-08-01	2022-10-11 03:55:30	0	0000000774		2022-11-22
745	AGSI-D-11629	27	1	5	1	165	2022-08-01	2	2022-08-01	2022-10-05 08:10:31	0	0000000747		2022-11-22
794	AGSI-D-4396	62	1	5	1	310	2022-08-01	2	2022-08-01	2023-03-20 05:40:34	0	0000001399	se desincorporar por orden de la directiva 	2023-03-20
837	AGSI-D-21173	32	1	5	1	165	2022-08-01	2	2022-08-01	2023-04-01 02:39:17	0	0000001451	embarcacion en abandono por mas de 3 años propietarios no responden a los comunicados se le dio desincorporacion 01/04/2023	2023-04-01
808	AGSI-D-11413	32	1	5	1	165	2022-08-01	2	2022-08-01	2022-10-07 02:56:18	0	0000000752		2022-11-22
755	AGSI-TU-0182	35	1	5	1	175	2022-08-01	2	2022-08-01	2022-10-08 09:07:10	0	0000000760		2022-11-22
780	ARSH-RE-0016	52	1	5	1	260	2022-08-01	2	2022-08-01	2022-10-09 08:34:43	0	0000000762		2022-11-22
772	AGSI-D-2494	27	1	5	1	165	2022-08-01	2	2022-08-01	2022-10-10 04:36:26	0	0000000765		2022-11-22
761	ARSH-D-2077	80	1	5	1	400	2022-08-01	2	2022-08-01	2022-10-11 06:07:02	0	0000000781		2022-11-22
863	AGSI-D- 2796	27	1	5	1	165	2022-09-01	2	2022-09-01	2022-10-12 11:14:53	0	0000000783		2022-11-22
858	AGSI-PE-0842	24	1	5	1	165	2022-09-01	2	2022-09-01	2022-10-13 06:17:27	0	0000000785		2022-11-22
853	AGSI-RE-1239	44	1	5	1	220	2022-09-01	2	2022-09-01	2022-10-19 05:59:35	0	0000000793		2022-11-22
849	AGSI-D-5535	42	1	5	1	210	2022-09-01	2	2022-09-01	2022-10-22 03:41:46	0	0000000800		2022-11-22
764	AGSI-D-5426	35	2	5	1	175	2022-08-01	2	2022-08-01	2022-10-31 11:43:06	0	0000000817	el propietario entrega la embarcacion a la marina 	2022-11-22
846	AGSI-D-9005	31	1	5	1	165	2022-09-01	2	2022-09-01	2022-11-03 09:02:26	0	0000000836		2022-11-22
855	AGSI-re-tramite-098	14	2	5	1	70	2022-09-01	2	2022-09-01	2022-11-03 10:52:25	0	0000000841		2022-11-22
852	AGSI-PE-0830	23	1	5	1	165	2022-09-01	2	2022-09-01	2022-11-05 03:34:28	0	0000000852		2022-11-22
757	ARSH-D-1448	30	1	5	1	165	2022-08-01	2	2022-08-01	2022-11-10 07:42:28	0	0000000883		2022-11-22
747	AGSI-RE-1587	55	1	5	1	275	2022-08-01	2	2022-08-01	2022-11-10 09:49:57	0	0000000894		2022-11-22
777	AGSI-D-5124	36	1	5	1	180	2022-08-01	2	2022-08-01	2022-11-12 02:08:59	0	0000000901		2022-11-22
881	AGSI-RE-TRAMITE7458	115	1	5	1	575	2022-09-01	0	2022-09-01	2022-09-01 00:00:00	0	0		2022-11-22
912	AGSI-D-5810	55	1	5	1	275	2022-09-01	0	2022-09-01	2022-09-01 00:00:00	0	0		2022-11-22
883	AGSI-RE-1362	20	2	5	1	100	2022-09-01	2	2022-09-01	2022-09-12 07:58:31	0	0000000624		2022-11-22
888	ADKN-D-7303	20	2	5	1	100	2022-09-01	2	2022-09-01	2022-09-22 06:05:03	0	0000000655		2022-11-22
933	AGSP-PJ-0066	25	1	5	1	165	2022-09-01	2	2022-09-01	2022-09-22 06:05:59	0	0000000656		2022-11-22
948	AGSI-RE-1349	60	1	5	1	300	2022-09-01	2	2022-09-01	2022-09-22 06:06:43	0	0000000657		2022-11-22
890	AGSI-RE-1404	24	2	5	1	120	2022-09-01	2	2022-09-01	2022-09-22 06:10:15	0	0000000658		2022-11-22
913	ADKN-2106	44	1	5	1	220	2022-09-01	2	2022-09-01	2022-09-23 09:11:31	0	0000000663		2022-11-22
867	ARSH-RE-0356	28	2	5	1	140	2022-09-01	2	2022-09-01	2022-09-27 11:39:32	0	0000000665		2022-11-22
907	AGSI-2221	42	1	5	1	210	2022-09-01	2	2022-09-01	2022-11-19 03:14:58	0	0000000915		2022-11-22
826	AGSI-D-5926	63	1	5	1	315	2022-08-01	2	2022-08-01	2022-11-22 03:21:40	0	0000000930		2022-11-22
926	AGSI-RE-0202	88	1	5	1	440	2022-09-01	2	2022-09-01	2022-09-28 02:25:17	0	0000000670		2022-11-22
897	AGSI-RE-1420	60	1	5	1	300	2022-09-01	2	2022-09-01	2022-09-28 02:35:00	0	0000000676	cancelo el encargado brian chavez  en euros de 100	2022-11-22
931	AGSM-RE-0620	47	1	5	1	235	2022-09-01	2	2022-09-01	2022-09-28 05:58:41	0	0000000679	carlos perez ( capitan )	2022-11-22
935	AGSI-RE-1354	24	2	5	1	120	2022-09-01	2	2022-09-01	2022-09-28 10:56:00	0	0000000683		2022-11-22
940	AGSI-D-23647	36	1	5	1	180	2022-09-01	2	2022-09-01	2022-09-30 02:49:48	0	0000000692		2022-11-22
943	AGSI-RE-1324	40	1	5	1	200	2022-09-01	2	2022-09-01	2022-09-30 07:25:59	0	0000000706		2022-11-22
941	AMSH-RE 0323	62	1	5	1	310	2022-09-01	2	2022-09-01	2022-09-30 07:28:37	0	0000000708		2022-11-22
904	AGSI-2720	47	1	5	1	235	2022-09-01	2	2022-09-01	2022-09-30 08:11:51	0	0000000709	PAGO CAPITAN CADIZ	2022-11-22
950	AGSI-RE-1243	53	1	5	1	265	2022-09-01	2	2022-09-01	2022-10-01 01:50:45	0	0000000713		2022-11-22
932	AGSI-RE-0205	58	1	5	1	290	2022-09-01	2	2022-09-01	2022-10-01 01:51:51	0	0000000714		2022-11-22
937	AGSP-1992	43	1	5	1	215	2022-09-01	2	2022-09-01	2022-10-01 05:42:39	0	0000000719		2022-11-22
947	AGSI-PE-0288	24	1	5	1	165	2022-09-01	2	2022-09-01	2022-10-01 06:38:33	0	0000000721		2022-11-22
885	AGSI-TU-0161	45	1	5	1	225	2022-09-01	2	2022-09-01	2022-10-02 05:46:31	0	0000000723		2022-11-22
906	AGSI-D-16610	42	1	5	1	210	2022-09-01	2	2022-09-01	2022-12-02 06:55:49	0	0000000973		2022-12-02
924	AGSI-D-22966	58	1	5	1	290	2022-09-01	2	2022-09-01	2022-10-02 06:43:18	0	0000000726		2022-11-22
917	AGSI-RE-1176	81	1	5	1	405	2022-09-01	2	2022-09-01	2022-10-03 05:48:13	0	0000000733		2022-11-22
946	AGSI-TU-0058	48	1	5	1	240	2022-09-01	2	2022-09-01	2022-10-03 09:14:05	0	0000000736		2022-11-22
914	AQYM-D-050	47	1	5	1	235	2022-09-01	2	2022-09-01	2022-12-13 03:57:02	0	0000001024		2022-12-13
875	AGSI-D-22487	30	1	5	1	165	2022-09-01	2	2022-09-01	2022-12-18 03:32:50	0	0000001055		2022-12-18
871	DL1324AC	73	1	5	1	365	2022-09-01	2	2022-09-01	2022-12-23 07:10:51	0	0000001074		2022-12-23
891	AGSI-PE-0532	24	1	5	1	165	2022-09-01	2	2022-09-01	2022-10-04 04:51:28	0	0000000740		2022-11-22
862	AGSI-RE-0601	22	2	5	1	110	2022-09-01	2	2022-09-01	2022-10-04 10:00:11	0	0000000742		2022-11-22
868	AGSI-D-11629	27	1	5	1	165	2022-09-01	2	2022-09-01	2022-10-05 08:11:48	0	0000000748		2022-11-22
869	AGSM-D-1776	43	1	5	1	215	2022-09-01	2	2022-09-01	2022-10-05 09:24:33	0	0000000749		2022-11-22
922	AGSI-RE-1098	30	1	5	1	165	2022-09-01	2	2022-09-01	2022-10-07 09:03:35	0	0000000755	encargado walter 	2022-11-22
878	AGSI-TU-0182	35	1	5	1	175	2022-09-01	2	2022-09-01	2022-10-08 09:10:51	0	0000000761		2022-11-22
939	AGSI-D-23005	63	1	5	1	315	2022-09-01	2	2022-09-01	2022-10-10 05:16:20	0	0000000767	ENCARGADO JUAN BLANCO	2022-11-22
944	AGSI-RE-1593	23	2	5	1	115	2022-09-01	2	2022-09-01	2022-10-10 05:19:30	0	0000000769	ENCARGADO JUAN BLANCO	2022-11-22
884	ARSH-D-2077	80	1	5	1	400	2022-09-01	2	2022-09-01	2022-10-11 06:07:37	0	0000000782		2022-11-22
929	AGSI-D-6032	34	1	5	1	170	2022-09-01	2	2022-09-01	2022-10-14 01:25:03	0	0000000788		2022-11-22
901	AGSP-RE-0514	63	1	5	1	315	2022-09-01	2	2022-09-01	2022-10-17 03:32:07	0	0000000789		2022-11-22
934	APNN-D-675	35	2	5	1	175	2022-09-01	2	2022-09-01	2022-10-17 03:34:15	0	0000000790		2022-11-22
942	AGSI-RE-1001	54	1	5	1	270	2022-09-01	2	2022-09-01	2022-10-18 06:43:19	0	0000000792		2022-11-22
899	AGSI-RE-GTRAMITE52	70	1	5	1	350	2022-09-01	2	2022-09-01	2022-10-19 06:02:52	0	0000000795		2022-11-22
866	AGSP-RE-1071	72	1	5	1	360	2022-09-01	2	2022-09-01	2022-10-20 04:36:24	0	0000000798		2022-11-22
892	AGSI-PE-0887	25	1	5	1	165	2022-09-01	2	2022-09-01	2022-10-22 09:08:50	0	0000000801		2022-11-22
916	AGSI-D-4396	62	1	5	1	310	2022-09-01	2	2022-09-01	2023-03-20 05:39:48	0	0000001398	se desincorporar por orden de la directiva 	2023-03-20
876	AGSI-D-20765	35	1	5	1	175	2022-09-01	2	2022-09-01	2022-10-31 11:25:38	0	0000000813	la embarcacion inoperativa el propietario la retiro del puerto en agua y de las instalaciones 	2022-11-22
921	AGSP-RE-0963	28	1	5	1	165	2022-09-01	2	2022-09-01	2022-11-01 04:42:31	0	0000000824	retiro la embarcacion en junio	2022-11-22
910	AGSI-RE-1339	47	1	5	1	235	2022-09-01	2	2022-09-01	2022-11-03 10:56:29	0	0000000843		2022-11-22
909	AGSI-PJ-0070	33	1	5	1	165	2022-09-01	2	2022-09-01	2022-11-03 11:01:26	0	0000000845		2022-11-22
949	AGSI-RE-0886	46	1	5	1	230	2022-09-01	2	2022-09-01	2022-11-04 08:30:31	0	0000000848		2022-11-22
930	AGSI-D-11413	32	1	5	1	165	2022-09-01	2	2022-09-01	2022-11-05 02:07:49	0	0000000851		2022-11-22
900	AGSI-D-5124	36	1	5	1	180	2022-09-01	2	2022-09-01	2022-11-05 05:52:04	0	0000000858		2022-11-22
903	ARSH-RE-0016	52	1	5	1	260	2022-09-01	2	2022-09-01	2022-11-09 05:35:01	0	0000000875		2022-11-22
870	AGSI-RE-1587	55	1	5	1	275	2022-09-01	2	2022-09-01	2022-11-10 09:51:30	0	0000000895		2022-11-22
938	AGSI-PE-0829	34	1	5	1	170	2022-09-01	2	2022-09-01	2022-11-11 01:05:01	0	0000000898		2022-11-22
872	AGSI-D-5814	37	1	5	1	185	2022-09-01	2	2022-09-01	2022-11-11 10:50:46	0	0000000900		2022-11-22
5	AGSI-RE-TRAMITE789	47	1	1	1	47	2022-02-01	2	2022-02-01	2022-09-12 12:52:59	0	0000000613		2022-11-22
744	ARSH-RE-0356	28	2	5	1	140	2022-08-01	2	2022-08-01	2022-09-12 06:55:29	0	0000000614		2022-11-22
668	AGSI-RE-1339	47	1	5	1	235	2022-07-01	2	2022-07-01	2022-09-12 07:12:18	0	0000000617		2022-11-22
882	AGSI-RE-0575	40	1	5	1	200	2022-09-01	2	2022-09-01	2022-09-12 07:26:56	0	0000000619		2022-11-22
466	AGSI-D-5926	63	1	5	1	315	2022-05-01	2	2022-05-01	2022-09-12 07:33:07	0	0000000620		2022-11-22
706	AGSI-D-5926	63	1	5	1	315	2022-07-01	2	2022-07-01	2022-09-12 07:35:41	0	0000000622		2022-11-22
48	AGSI-PE-0532	24	1	1	1	33	2022-02-01	2	2022-02-01	2022-09-12 08:03:51	0	0000000625	CUENTA POR COBRAR VENETUR 	2022-11-22
288	AGSI-PE-0532	24	1	5	1	165	2022-04-01	2	2022-04-01	2022-09-12 08:07:26	0	0000000627		2022-11-22
44	AGSI-D-5426	35	2	1	1	35	2022-02-01	2	2022-02-01	2022-09-12 08:13:05	0	0000000629	CUENTA POR COBRAR VENETUR EL PROPIETARIO REALIZÓ PAGO A LA CTA DE VENETUR	2022-11-22
873	ARSH-PJ-0034	43	1	5	1	215	2022-09-01	2	2022-09-01	2022-09-13 07:00:44	0	0000000635		2022-11-22
14	AGSI-RE-0268	58	1	1	1	58	2022-02-01	2	2022-02-01	2022-09-13 09:57:21	0	0000000637		2022-11-22
68	AGSI-RE-1339	47	1	1	1	47	2022-02-01	2	2022-02-01	2022-09-13 09:58:20	0	0000000638		2022-11-22
479	AGSI-D-TRAMI 023	15	2	5	1	75	2022-05-01	2	2022-05-01	2022-09-16 07:31:54	0	0000000639	PAGADO POR SANDRO ZANETTI EL 16-09	2022-11-22
719	AGSI-D-TRAMI 023	15	2	5	1	75	2022-07-01	2	2022-07-01	2022-09-16 07:32:47	0	0000000641		2022-11-22
839	AGSI-D-TRAMI 023	15	2	5	1	75	2022-08-01	2	2022-08-01	2022-09-16 07:33:09	0	0000000642		2022-11-22
958	AGSI-D-TRAMI 023	15	2	5	1	75	2022-09-01	2	2022-09-01	2022-09-16 07:33:40	0	0000000643		2022-11-22
911	AGSI-D-6150	35	1	5	1	175	2022-09-01	2	2022-09-01	2022-09-17 07:41:31	0	0000000651		2022-11-22
951	AGSI-TU-0072	14	2	5	1	70	2022-09-01	2	2022-09-01	2022-09-20 05:00:46	0	0000000652		2022-11-22
877	AGSI-RE-0805	72	1	5	1	360	2022-09-01	2	2022-09-01	2022-09-21 10:50:38	0	0000000654	pago capitan felix	2022-11-22
776	AGSI-RE-GTRAMITE52	70	1	5	1	350	2022-08-01	2	2022-08-01	2022-09-23 08:46:20	0	0000000660	pago agosto en septiembre 	2022-11-22
919	AGSI-RE-1472	19	2	5	1	95	2022-09-01	2	2022-09-01	2022-09-26 10:05:17	0	0000000664		2022-11-22
564	AGSI-RE-0202	88	1	5	1	440	2022-06-01	2	2022-06-01	2022-09-28 02:24:19	0	0000000667		2022-11-22
684	AGSI-RE-0202	88	1	5	1	440	2022-07-01	2	2022-07-01	2022-09-28 02:24:37	0	0000000668		2022-11-22
905	Agsi-re-tramite-224466	48	1	5	1	240	2022-09-01	2	2022-09-01	2022-09-28 02:29:20	0	0000000674		2022-11-22
774	AGSI-RE-1420	60	1	5	1	300	2022-08-01	2	2022-08-01	2022-09-28 02:34:09	0	0000000675	cancelo el encargado brian chavez en euros de 100	2022-11-22
979	AGSI-RE-0891	32	1	5	1	165	2022-10-01	2	2022-09-29	2022-09-29 00:00:00	0	0000000686	encargado richar hernandez pago adelantado	2022-11-22
908	ADKN-D-3015	36	1	5	1	180	2022-09-01	2	2022-09-01	2022-09-30 02:46:50	0	0000000690		2022-11-22
611	AGSI-RE-TRAMITE 000123	11	2	5	1	55	2022-07-01	2	2022-07-01	2022-09-30 02:54:23	0	0000000698		2022-11-22
738	AGSI-RE-22326	33	1	5	1	165	2022-08-01	2	2022-08-01	2022-09-30 07:17:57	0	0000000703		2022-11-22
824	AGSI-RE-1324	40	1	5	1	200	2022-08-01	2	2022-08-01	2022-09-30 07:25:35	0	0000000705	pago gledys salazar (capitan )	2022-11-22
980	AGSI-PE-0816	28	1	5	1	165	2022-10-01	2	2022-09-30	2022-09-30 00:00:00	0	0000000711	MANUEL FAR FAN 	2022-11-22
1006	DL1324AC	73	1	5	1	365	2022-10-01	2	2022-10-01	2022-12-23 07:11:26	0	0000001075		2022-12-23
957	AGSI-RE-0606	32	1	5	1	165	2022-09-01	2	2022-09-01	2022-10-08 04:13:42	0	0000000756		2022-11-22
1008	ARSH-PJ-0034	43	1	5	1	215	2022-10-01	2	2022-10-01	2022-10-13 01:54:28	0	0000000784		2022-11-22
993	AGSI-PE-0842	24	1	5	1	165	2022-10-01	2	2022-10-01	2022-10-13 06:18:02	0	0000000786		2022-11-22
997	AGSI-RE-0601	22	2	5	1	110	2022-10-01	2	2022-10-01	2022-10-17 10:23:52	0	0000000791		2022-11-22
988	AGSI-RE-1239	44	1	5	1	220	2022-10-01	2	2022-10-01	2022-10-19 06:00:00	0	0000000794		2022-11-22
1001	AGSP-RE-1071	72	1	5	1	360	2022-10-01	2	2022-10-01	2022-10-20 04:36:57	0	0000000799		2022-11-22
1004	AGSM-D-1776	43	1	5	1	215	2022-10-01	2	2022-10-01	2022-10-26 09:56:55	0	0000000803		2022-11-22
959	AGSP-RE-0587	25	2	5	1	125	2022-09-01	2	2022-09-01	2022-10-27 01:22:05	0	0000000804		2022-11-22
1002	ARSH-RE-0356	28	2	5	1	140	2022-10-01	2	2022-10-01	2022-10-28 01:40:53	0	0000000807		2022-11-22
995	ARSH-D-957	27	1	5	1	165	2022-10-01	2	2022-10-01	2022-11-01 05:08:25	0	0000000830	pago con el minmo deposito septiembre 	2022-11-22
986	AGSI-2927	44	1	5	1	220	2022-10-01	2	2022-10-01	2022-11-02 11:15:30	0	0000000833		2022-11-22
981	AGSM-RE-0897	50	1	5	1	250	2022-10-01	2	2022-10-01	2022-11-03 09:12:18	0	0000000837		2022-11-22
954	AGSP-D-2875	30	2	5	1	150	2022-09-01	2	2022-09-01	2022-11-03 10:49:34	0	0000000839		2022-11-22
990	AGSI-re-tramite-098	14	2	5	1	70	2022-10-01	2	2022-10-01	2022-11-03 10:52:49	0	0000000842		2022-11-22
1003	AGSI-D-11629	27	1	5	1	165	2022-10-01	2	2022-10-01	2022-11-05 02:01:06	0	0000000850		2022-11-22
987	AGSI-PE-0830	23	1	5	1	165	2022-10-01	2	2022-10-01	2022-11-05 03:34:53	0	0000000853		2022-11-22
953	AGSI-RE-0655	50	1	5	1	250	2022-09-01	2	2022-09-01	2022-11-09 05:32:27	0	0000000874		2022-11-22
1005	AGSI-RE-1587	55	1	5	1	275	2022-10-01	2	2022-10-01	2022-11-10 09:51:50	0	0000000896		2022-11-22
1016	AGSI-RE-TRAMITE7458	115	1	5	1	575	2022-10-01	0	2022-10-01	2022-10-01 00:00:00	0	0	\N	2022-11-22
1046	AGSI-D-5810	55	1	5	1	275	2022-10-01	0	2022-10-01	2022-10-01 00:00:00	0	0	\N	2022-11-22
1068	APNN-D-675	35	2	5	1	175	2022-10-01	2	2022-10-01	2022-11-19 03:21:44	0	0000000917		2022-11-22
996	AGSI-RE-22326	33	1	5	1	165	2022-10-01	2	2022-10-01	2022-11-19 03:54:47	0	0000000922		2022-11-22
1014	AGSI-RE-0661	45	1	5	1	225	2022-10-01	2	2022-10-01	2022-11-21 02:39:29	0	0000000926		2022-11-22
1049	ARSH-D-1850	85	1	5	1	425	2022-10-01	2	2022-10-01	2022-11-22 05:00:00	0	0000000934		2022-11-22
999	AGSI-RE-0437	30	1	5	1	165	2022-10-01	2	2022-10-01	2022-11-22 06:56:11	0	0000000939		2022-11-22
992	AGSI-RE-0268	58	1	5	1	290	2022-10-01	2	2022-10-01	2022-11-22 07:14:15	0	0000000943		2022-11-22
982	AGSI-D-9005	31	1	5	1	165	2022-10-01	2	2022-10-01	2022-11-22 07:17:35	0	0000000945		2022-11-22
1066	AGSI-RE-0205	58	1	5	1	290	2022-10-01	2	2022-10-01	2022-11-22 07:23:31	0	0000000946		2022-11-22
1041	AGSI-RE-1072	47	1	5	1	235	2022-10-01	2	2022-10-01	2022-10-03 04:28:08	0	0000000728		2022-11-22
1083	AGSI-RE-1349	60	1	5	1	300	2022-10-01	2	2022-10-01	2022-10-03 05:36:39	0	0000000729	PAGO EL MOTORIZADO DE LA COMPAÑIA	2022-11-22
1026	AGSI-PE-0887	25	1	5	1	165	2022-10-01	2	2022-10-01	2022-11-23 09:02:15	0	0000000953		2022-11-23
998	AGSI-D- 2796	27	1	5	1	165	2022-10-01	2	2022-10-01	2022-11-23 10:17:59	0	0000000959		2022-11-23
1038	Agsi-re-tramite-224466	48	1	5	1	240	2022-10-01	2	2022-10-01	2023-07-27 05:11:20	0	0000001847		2023-07-27
1067	AGSP-PJ-0066	25	1	5	1	165	2022-10-01	2	2022-10-01	2022-10-03 05:37:41	0	0000000730	PAGO MOTORIZADO DE LA COMPAÑIA	2022-11-22
1023	ADKN-D-7303	20	2	5	1	100	2022-10-01	2	2022-10-01	2022-10-03 05:38:32	0	0000000731	PAGO MOTORIZADO DE LA COMPAÑIA	2022-11-22
1025	AGSI-PE-0532	24	1	5	1	165	2022-10-01	2	2022-10-01	2022-10-04 04:56:20	0	0000000741		2022-11-22
984	AGSI-D-5535	42	1	5	1	210	2022-10-01	2	2022-10-01	2022-11-28 12:30:16	0	0000000962		2022-11-28
1077	AGSI-RE-1001	54	1	5	1	270	2022-10-01	2	2022-10-01	2022-12-02 03:35:26	0	0000000964		2022-12-02
1039	AGSI-D-16610	42	1	5	1	210	2022-10-01	2	2022-10-01	2022-12-02 06:56:28	0	0000000974		2022-12-02
1072	AGSI-PE-0829	34	1	5	1	170	2022-10-01	2	2022-10-01	2022-12-03 07:10:05	0	0000000982		2022-12-03
1042	ADKN-D-3015	36	1	5	1	180	2022-10-01	2	2022-10-01	2022-12-06 02:08:49	0	0000000984		2022-12-06
1074	AGSI-D-23647	36	1	5	1	180	2022-10-01	2	2022-10-01	2022-12-06 02:11:11	0	0000000986		2022-12-06
989	AGSI-RE-TRAMITE 000123	11	2	5	1	55	2022-10-01	2	2022-10-01	2022-12-06 02:18:24	0	0000000990		2022-12-06
1045	AGSI-D-6150	35	1	5	1	175	2022-10-01	2	2022-10-01	2022-10-08 08:55:19	0	0000000758		2022-11-22
1073	AGSI-D-23005	63	1	5	1	315	2022-10-01	2	2022-10-01	2022-10-10 05:16:48	0	0000000768	ENCARGADO JUAN BLANCO	2022-11-22
1079	AGSI-RE-1593	23	2	5	1	115	2022-10-01	2	2022-10-01	2022-10-10 05:19:54	0	0000000770	ENCARGADO JUAN BLANCO	2022-11-22
1032	AGSI-RE-GTRAMITE52	70	1	5	1	350	2022-10-01	2	2022-10-01	2022-10-19 06:03:33	0	0000000796		2022-11-22
1021	AGSI-RE-TRAMITE 741	41	1	5	1	205	2022-10-01	2	2022-10-01	2022-12-10 05:59:21	0	0000001014		2022-12-10
1012	AGSI-RE-0805	72	1	5	1	360	2022-10-01	2	2022-10-01	2022-12-13 03:22:08	0	0000001021		2022-12-13
1048	AQYM-D-050	47	1	5	1	235	2022-10-01	2	2022-10-01	2022-12-13 03:58:10	0	0000001025		2022-12-13
1082	AGSI-PE-0288	24	1	5	1	165	2022-10-01	2	2022-10-01	2022-12-14 06:24:38	0	0000001034		2022-12-14
1058	AGSI-D-22966	58	1	5	1	290	2022-10-01	2	2022-10-01	2022-12-17 03:54:33	0	0000001051		2022-12-17
1010	AGSI-D-22487	30	1	5	1	165	2022-10-01	2	2022-10-01	2022-12-18 03:33:41	0	0000001056		2022-12-18
1036	ARSH-RE-0016	52	1	5	1	260	2022-10-01	2	2022-10-01	2022-12-22 04:52:46	0	0000001071		2022-12-22
1051	AGSI-RE-1176	81	1	5	1	405	2022-10-01	2	2022-10-01	2022-12-26 05:12:52	0	0000001081		2022-12-26
1024	AGSI-RE-1404	24	2	5	1	120	2022-10-01	2	2022-10-01	2022-10-23 07:48:16	0	0000000802		2022-11-22
1053	AGSI-RE-1472	19	2	5	1	95	2022-10-01	2	2022-10-01	2022-10-27 09:07:11	0	0000000806		2022-11-22
1052	AGSP-2214	36	1	5	1	180	2022-10-01	2	2022-10-01	2022-10-28 06:53:34	0	0000000808		2022-11-22
1029	AGSI-RE-0169	36	2	5	1	180	2022-10-01	2	2022-10-01	2022-11-01 04:07:25	0	0000000820	retiro la embarcacion en julio 	2022-11-22
1030	AGSI-RE-1420	60	1	5	1	300	2022-10-01	2	2022-10-01	2022-11-01 04:20:00	0	0000000822		2022-11-22
1065	AGSM-RE-0620	47	1	5	1	235	2022-10-01	2	2022-10-01	2022-11-01 04:23:22	0	0000000823		2022-11-22
1055	AGSP-RE-0963	28	1	5	1	165	2022-10-01	2	2022-10-01	2022-11-01 04:43:15	0	0000000825	retiro la embarcacion en junio	2022-11-22
1037	AGSI-2720	47	1	5	1	235	2022-10-01	2	2022-10-01	2022-11-02 11:17:02	0	0000000834		2022-11-22
1044	AGSI-RE-1339	47	1	5	1	235	2022-10-01	2	2022-10-01	2022-11-03 10:58:56	0	0000000844		2022-11-22
1043	AGSI-PJ-0070	33	1	5	1	165	2022-10-01	2	2022-10-01	2022-11-03 11:02:30	0	0000000846		2022-11-22
1018	AGSI-RE-1362	20	2	5	1	100	2022-10-01	2	2022-10-01	2022-11-04 05:24:28	0	0000000847		2022-11-22
1084	AGSI-RE-0886	46	1	5	1	230	2022-10-01	2	2022-10-01	2022-11-04 08:32:27	0	0000000849		2022-11-22
1033	AGSI-D-5124	36	1	5	1	180	2022-10-01	2	2022-10-01	2022-11-05 05:51:35	0	0000000857		2022-11-22
1013	AGSI-TU-0182	35	1	5	1	175	2022-10-01	2	2022-10-01	2022-11-05 06:11:36	0	0000000860		2022-11-22
1031	AGSI-D-10408	28	1	5	1	165	2022-10-01	2	2022-10-01	2022-11-06 05:31:41	0	0000000862		2022-11-22
1054	AGSI-RE-0753	60	1	5	1	300	2022-10-01	2	2022-10-01	2022-11-07 08:14:12	0	0000000865		2022-11-22
1187	AGSI-RE-0205	58	1	5	1	290	2022-11-01	2	2022-11-01	2023-02-03 09:55:24	0	0000001225		2023-02-03
1047	ADKN-2106	44	1	5	1	220	2022-10-01	2	2022-10-01	2022-11-08 09:04:53	0	0000000869		2022-11-22
1056	AGSI-RE-1098	30	1	5	1	165	2022-10-01	2	2022-10-01	2022-11-08 09:14:49	0	0000000871		2022-11-22
1075	AGSI-RE-1303	63	1	5	1	315	2022-10-01	2	2022-10-01	2022-11-09 09:44:11	0	0000000876		2022-11-22
1076	AMSH-RE 0323	62	1	5	1	310	2022-10-01	2	2022-10-01	2022-11-09 09:46:23	0	0000000877		2022-11-22
1015	ARSH-D-1448	30	1	5	1	165	2022-10-01	2	2022-10-01	2022-11-10 07:43:41	0	0000000885		2022-11-22
1070	AGSI-D-23325	27	1	5	1	165	2022-10-01	2	2022-10-01	2022-11-11 07:38:41	0	0000000899		2022-11-22
1086	AGSI-TU-0072	14	2	5	1	70	2022-10-01	2	2022-10-01	2022-11-12 04:52:55	0	0000000902		2022-11-22
1019	ARSH-D-2077	80	1	5	1	400	2022-10-01	2	2022-10-01	2022-11-12 05:14:41	0	0000000903		2022-11-22
1069	AGSI-RE-1354	24	2	5	1	120	2022-10-01	2	2022-10-01	2023-04-11 06:48:08	0	0000001493	el señor no tenia la embarcacion en la marina desde agosto 2022	2023-04-11
1087	AGSI-D-15916	40	1	5	1	200	2022-10-01	2	2022-10-01	2023-05-02 03:39:01	0	0000001594	EL PROPIETARIO NO RESPONDE A LOS COMUNICADOS NI SE HA PRESENTADO EN LA MARINA POR MAS DE 1 AÑO SE PROSEDE HACER DESINCORPORACION TOTAL DE LA DEUDA 2600 HASTA MAYO	2023-05-02
1063	AGSI-D-6032	34	1	5	1	170	2022-10-01	2	2022-10-01	2022-11-14 06:27:31	0	0000000904		2022-11-22
857	AGSI-RE-0268	58	1	5	1	290	2022-09-01	2	2022-09-01	2022-10-01 01:53:21	0	0000000715		2022-11-22
1071	AGSP-1992	43	1	5	1	215	2022-10-01	2	2022-10-01	2022-10-01 06:37:21	0	0000000720		2022-11-22
762	AGSI-TU-0161	45	1	5	1	225	2022-08-01	2	2022-08-01	2022-10-02 05:42:02	0	0000000722	cancelo 50 dolares por pago pendiente del mes 	2022-11-22
1081	AGSI-TU-0058	48	1	5	1	240	2022-10-01	2	2022-10-01	2022-10-03 03:52:36	0	0000000727	jiovani ( capitan ) del barco	2022-11-22
915	ARSH-D-1850	85	1	5	1	425	2022-09-01	2	2022-09-01	2022-10-03 07:15:13	0	0000000735	PAGO ENCARGADO RICHAR MORENO	2022-11-22
1017	AGSI-RE-0575	40	1	5	1	200	2022-10-01	2	2022-10-01	2022-10-05 12:36:17	0	0000000746	DEPOSITO EN DOLARES EN EFECTIVO	2022-11-22
532	AGSI-D-2494	27	1	5	1	165	2022-06-01	2	2022-06-01	2022-08-30 07:35:18	0	0000000468		2022-11-22
412	AGSI-D-2494	27	1	5	1	165	2022-05-01	2	2022-05-01	2022-08-30 07:34:34	0	0000000436		2022-11-22
292	AGSI-D-2494	27	1	5	1	165	2022-04-01	2	2022-04-01	2022-08-30 07:34:05	0	0000000368		2022-11-22
172	AGSI-D-2494	27	1	1	1	33	2022-03-01	2	2022-03-01	2022-08-30 07:32:34	0	0000000334		2022-11-22
52	AGSI-D-2494	27	1	1	1	33	2022-02-01	2	2022-02-01	2022-08-30 07:32:16	0	0000000265		2022-11-22
652	AGSI-D-2494	27	1	5	1	165	2022-07-01	2	2022-07-01	2022-09-22 07:24:39	0	0000000659	el señor se compromete a paras la deuda pendiente antes del 6 de octubre 2022	2022-11-22
1098	AGSI-AUXILIAR	12	2	5	1	60	2022-10-05	2	2022-10-05	2022-10-05 10:30:17	0	0000000750		2022-11-22
902	AGSI-PE-0879	29	1	5	1	165	2022-09-01	2	2022-09-01	2022-10-07 05:04:27	0	0000000753		2022-11-22
800	AGSI-RE-1098	30	1	5	1	165	2022-08-01	2	2022-08-01	2022-10-07 09:03:01	0	0000000754	encargado walter 	2022-11-22
1092	AGSI-RE-0606	32	1	5	1	165	2022-10-01	2	2022-10-01	2022-10-08 04:14:15	0	0000000757		2022-11-22
898	AGSI-D-10408	28	1	5	1	165	2022-09-01	2	2022-09-01	2022-10-10 05:07:24	0	0000000766	ENCARGADO ELI PLAZA	2022-11-22
281	ARSH-D-2077	80	1	5	1	400	2022-04-01	2	2022-04-01	2022-10-11 06:04:47	0	0000000777		2022-11-22
936	AGSI-D-23325	27	1	5	1	165	2022-09-01	2	2022-09-01	2022-10-13 09:16:55	0	0000000787	jorge marcano	2022-11-22
1099	AGSI-RE-0891	32	1	5	1	165	2022-11-01	2	2022-10-19	2022-10-19 00:00:00	0	0000000797		2022-11-22
1094	AGSP-RE-0587	25	2	5	1	125	2022-10-01	2	2022-10-01	2022-10-27 01:22:40	0	0000000805		2022-11-22
1085	AGSI-RE-1243	53	1	5	1	265	2022-10-01	2	2022-10-01	2022-11-22 07:00:03	0	0000000941		2022-11-22
1113	AGSI-RE-0268	58	1	5	1	290	2022-11-01	2	2022-11-01	2022-11-22 07:15:32	0	0000000944		2022-11-22
556	AGSP-2214	36	1	5	1	180	2022-06-01	2	2022-06-01	2022-10-31 04:10:48	0	0000000809	autorizado la exoneraacion de la  deuda por el señor eduardo capriles 	2022-11-22
676	AGSP-2214	36	1	5	1	180	2022-07-01	2	2022-07-01	2022-10-31 04:11:39	0	0000000810	autorizado la exoneraacion de la  deuda por el señor eduardo capriles 	2022-11-22
796	AGSP-2214	36	1	5	1	180	2022-08-01	2	2022-08-01	2022-10-31 04:13:43	0	0000000811	autorizado la exoneraacion de la  deuda por el señor eduardo capriles 	2022-11-22
918	AGSP-2214	36	1	5	1	180	2022-09-01	2	2022-09-01	2022-10-31 04:14:03	0	0000000812	autorizado la exoneraacion de la  deuda por el señor eduardo capriles 	2022-11-22
1011	AGSI-D-20765	35	1	5	1	175	2022-10-01	2	2022-10-01	2022-10-31 11:25:59	0	0000000814	la embarcacion inoperativa el propietario la retiro del puerto en agua y de las instalaciones 	2022-11-22
887	AGSI-D-5426	35	2	5	1	175	2022-09-01	2	2022-09-01	2022-10-31 11:43:27	0	0000000818	el propietario entrega la embarcacion a la marina 	2022-11-22
1022	AGSI-D-5426	35	2	5	1	175	2022-10-01	2	2022-10-01	2022-10-31 11:43:49	0	0000000819	el propietario entrega la embarcacion a la marina 	2022-11-22
1101	AGSI-D-9005	31	1	5	1	165	2022-11-01	2	2022-11-01	2023-01-02 02:19:59	0	0000001113		2023-01-02
1100	AGSM-RE-0897	50	1	5	1	250	2022-11-01	2	2022-11-01	2022-11-03 09:12:42	0	0000000838		2022-11-22
1089	AGSP-D-2875	30	2	5	1	150	2022-10-01	2	2022-10-01	2022-11-03 10:49:57	0	0000000840		2022-11-22
1108	AGSI-PE-0830	23	1	5	1	165	2022-11-01	2	2022-11-01	2022-11-05 03:35:30	0	0000000854		2022-11-22
1093	AGSI-D-TRAMI 023	15	2	5	1	75	2022-10-01	2	2022-10-01	2022-11-08 09:00:50	0	0000000867		2022-11-22
1103	AGSI-PE-0816	28	1	5	1	165	2022-11-01	2	2022-11-01	2022-11-09 05:28:21	0	0000000872		2022-11-22
1126	AGSI-RE-1587	55	1	5	1	275	2022-11-01	2	2022-11-01	2022-11-10 09:52:15	0	0000000897		2022-11-22
1118	AGSI-RE-0601	22	2	5	1	110	2022-11-01	2	2022-11-01	2022-11-14 06:59:23	0	0000000905		2022-11-22
1137	AGSI-RE-TRAMITE7458	115	1	5	1	575	2022-11-01	0	2022-11-01	2022-11-01 00:00:00	0	0	\N	2022-11-22
1105	AGSI-D-5535	42	1	5	1	210	2022-11-01	2	2022-11-01	2023-01-11 12:11:15	0	0000001131		2023-01-11
1147	AGSI-PE-0887	25	1	5	1	165	2022-11-01	2	2022-11-01	2023-01-20 06:16:56	0	0000001155		2023-01-20
1125	AGSM-D-1776	43	1	5	1	215	2022-11-01	2	2022-11-01	2023-01-20 06:18:56	0	0000001156		2023-01-20
1111	AGSI-re-tramite-098	14	2	5	1	70	2022-11-01	2	2022-11-01	2023-01-20 10:26:22	0	0000001158		2023-01-20
1106	AGSI-RE TRAMITE00332211	30	1	5	1	165	2022-11-01	2	2022-11-01	2023-02-01 08:15:34	0	0000001195	el propietario tenia puesto en agua nunca trajo la embarcacion a las instalaciones  cancelo al dia hasta julio 2022 pero a la fecha no cancelo mas 	2023-02-01
1146	AGSI-PE-0532	24	1	5	1	165	2022-11-01	2	2022-11-01	2023-02-09 02:16:06	0	0000001248		2023-02-09
1167	AGSI-D-5810	55	1	5	1	275	2022-11-01	0	2022-11-01	2022-11-01 00:00:00	0	0	\N	2022-11-22
1117	AGSI-RE-22326	33	1	5	1	165	2022-11-01	2	2022-11-01	2022-11-19 03:55:15	0	0000000923		2022-11-22
1135	AGSI-RE-0661	45	1	5	1	225	2022-11-01	2	2022-11-01	2022-11-21 02:41:55	0	0000000927		2022-11-22
1170	ARSH-D-1850	85	1	5	1	425	2022-11-01	2	2022-11-01	2022-11-22 05:00:39	0	0000000935		2022-11-22
1120	AGSI-RE-0437	30	1	5	1	165	2022-11-01	2	2022-11-01	2022-11-22 06:57:56	0	0000000940		2022-11-22
443	AGSI-RE-TRAMI01	28	1	5	1	165	2022-05-01	2	2022-05-01	2023-03-14 12:56:54	0			2022-11-22
1080	AGSI-D-5926	63	1	5	1	315	2022-10-01	2	2022-10-01	2023-03-27 07:27:18	0	0000001416		2023-03-27
1090	ARSK-D-1085	35	2	5	1	175	2022-10-01	2	2022-10-01	2023-03-31 05:53:10	0	0000001435	autorizado por la directiva el día 28/03/2023 y se le solicito de desalojo de las instalaciones 	2023-03-31
1148	AGSI-RE- TRAMITE96589	31	1	5	1	165	2022-11-01	2	2022-11-01	2023-04-21 08:00:11	0	0000001557	la embarcación esta en estado de abandono por tal motivo es retirada de la marina el propietario no responde a las cartas enviadas se llevara a un deposito dejando una deuda de 2511 $	2023-04-21
1160	AGSI-D-16610	42	1	5	1	210	2022-11-01	2	2022-11-01	2022-12-02 06:57:26	0	0000000975		2022-12-02
1107	AGSI-2927	44	1	5	1	220	2022-11-01	2	2022-11-01	2022-12-02 07:45:32	0	0000000978		2022-12-02
1158	AGSI-2720	47	1	5	1	235	2022-11-01	2	2022-11-01	2022-12-02 07:47:33	0	0000000979		2022-12-02
1163	ADKN-D-3015	36	1	5	1	180	2022-11-01	2	2022-11-01	2022-12-06 02:09:52	0	0000000985		2022-12-06
1104	AGSI-RE-TRAMITE789	47	1	5	1	235	2022-11-01	2	2022-11-01	2022-12-06 02:15:26	0	0000000989		2022-12-06
1110	AGSI-RE-TRAMITE 000123	11	2	5	1	55	2022-11-01	2	2022-11-01	2022-12-06 02:19:06	0	0000000991		2022-12-06
1185	AGSI-D-11413	32	1	5	1	165	2022-11-01	0	2022-11-01	2022-11-01 00:00:00	0	0	\N	2022-11-22
1124	AGSI-D-11629	27	1	5	1	165	2022-11-01	2	2022-11-01	2022-12-07 02:50:00	0	0000000998		2022-12-07
1142	AGSI-RE-TRAMITE 741	41	1	5	1	205	2022-11-01	2	2022-11-01	2022-12-10 06:01:01	0	0000001015		2022-12-10
1133	AGSI-RE-0805	72	1	5	1	360	2022-11-01	2	2022-11-01	2022-12-13 03:23:13	0	0000001022		2022-12-13
1169	AQYM-D-050	47	1	5	1	235	2022-11-01	2	2022-11-01	2022-12-13 03:59:05	0	0000001026		2022-12-13
1139	AGSI-RE-1362	20	2	5	1	100	2022-11-01	2	2022-11-01	2022-12-13 08:11:42	0	0000001030		2022-12-13
1123	ARSH-RE-0356	28	2	5	1	140	2022-11-01	2	2022-11-01	2022-12-14 08:37:26	0	0000001035		2022-12-14
1152	AGSI-D-10408	28	1	5	1	165	2022-11-01	2	2022-11-01	2022-12-14 08:38:57	0	0000001036		2022-12-14
1188	AGSP-PJ-0066	25	1	5	1	165	2022-11-01	2	2022-11-01	2022-12-14 08:58:30	0	0000001039		2022-12-14
1144	ADKN-D-7303	20	2	5	1	100	2022-11-01	2	2022-11-01	2022-12-14 09:02:12	0	0000001041		2022-12-14
1184	AGSI-D-6032	34	1	5	1	170	2022-11-01	2	2022-11-01	2022-12-15 12:59:49	0	0000001043		2022-12-15
1193	AGSI-PE-0829	34	1	5	1	170	2022-11-01	2	2022-11-01	2022-12-15 03:07:48	0	0000001044		2022-12-15
1140	ARSH-D-2077	80	1	5	1	400	2022-11-01	2	2022-11-01	2022-12-15 05:36:03	0	0000001045		2022-12-15
1159	Agsi-re-tramite-224466	48	1	5	1	240	2022-11-01	2	2022-11-01	2023-07-27 05:11:55	0	0000001848		2023-07-27
1191	AGSI-D-23325	27	1	5	1	165	2022-11-01	2	2022-11-01	2022-12-16 09:21:23	0	0000001050		2022-12-16
1179	AGSI-D-22966	58	1	5	1	290	2022-11-01	2	2022-11-01	2022-12-17 03:55:28	0	0000001052		2022-12-17
1131	AGSI-D-22487	30	1	5	1	165	2022-11-01	2	2022-11-01	2022-12-18 03:34:11	0	0000001057		2022-12-18
1109	AGSI-RE-1239	44	1	5	1	220	2022-11-01	2	2022-11-01	2022-12-21 05:24:03	0	0000001060		2022-12-21
1153	AGSI-RE-GTRAMITE52	70	1	5	1	350	2022-11-01	2	2022-11-01	2022-12-21 05:26:06	0	0000001062		2022-12-21
1155	AGSP-RE-0514	63	1	5	1	315	2022-11-01	2	2022-11-01	2022-12-21 05:32:18	0	0000001064		2022-12-21
1189	APNN-D-675	35	2	5	1	175	2022-11-01	2	2022-11-01	2022-12-21 05:33:57	0	0000001066		2022-12-21
1127	DL1324AC	73	1	5	1	365	2022-11-01	2	2022-11-01	2022-12-23 07:12:22	0	0000001076		2022-12-23
1172	AGSI-RE-1176	81	1	5	1	405	2022-11-01	2	2022-11-01	2022-12-26 05:13:43	0	0000001082		2022-12-26
1202	AGSI-TU-0058	48	1	5	1	240	2022-11-01	2	2022-11-01	2022-11-01 05:00:13	0	0000000827	pago con el mismo deposito diciembre 	2022-11-22
1162	AGSI-RE-1072	47	1	5	1	235	2022-11-01	2	2022-11-01	2022-11-02 02:32:44	0	0000000832		2022-11-22
1138	AGSI-RE-0575	40	1	5	1	200	2022-11-01	2	2022-11-01	2022-11-03 08:58:47	0	0000000835		2022-11-22
1154	AGSI-D-5124	36	1	5	1	180	2022-11-01	2	2022-11-01	2022-11-05 05:51:05	0	0000000856		2022-11-22
1166	AGSI-D-6150	35	1	5	1	175	2022-11-01	2	2022-11-01	2022-11-05 05:58:12	0	0000000859		2022-11-22
1128	AGSI-D-5814	37	1	5	1	185	2022-11-01	2	2022-11-01	2023-01-04 05:28:36	0	0000001121		2023-01-04
1134	AGSI-TU-0182	35	1	5	1	175	2022-11-01	2	2022-11-01	2022-11-05 06:12:10	0	0000000861		2022-11-22
1174	AGSI-RE-1472	19	2	5	1	95	2022-11-01	2	2022-11-01	2022-11-07 04:11:15	0	0000000864	el señor retiro la embarcacion de la marina el dia 3 de noviembre 	2022-11-22
1175	AGSI-RE-0753	60	1	5	1	300	2022-11-01	2	2022-11-01	2022-11-07 08:14:56	0	0000000866		2022-11-22
1168	ADKN-2106	44	1	5	1	220	2022-11-01	2	2022-11-01	2022-11-08 09:05:19	0	0000000870		2022-11-22
1197	AMSH-RE 0323	62	1	5	1	310	2022-11-01	2	2022-11-01	2022-11-09 09:46:51	0	0000000878		2022-11-22
1199	AGSI-RE-1324	40	1	5	1	200	2022-11-01	2	2022-11-01	2022-11-09 09:52:56	0	0000000881		2022-11-22
1136	ARSH-D-1448	30	1	5	1	165	2022-11-01	2	2022-11-01	2022-11-10 07:43:59	0	0000000886		2022-11-22
1145	AGSI-RE-1404	24	2	5	1	120	2022-11-01	2	2022-11-01	2022-11-15 02:09:06	0	0000000906		2022-11-22
1150	AGSI-RE-0169	36	2	5	1	180	2022-11-01	2	2022-11-01	2022-11-01 04:07:54	0	0000000821	retiro la embarcacion en julio 	2022-11-22
1176	AGSP-RE-0963	28	1	5	1	165	2022-11-01	2	2022-11-01	2022-11-01 04:43:51	0	0000000826	retiro la embarcacion en junio	2022-11-22
1217	AGSI-TU-0058	48	1	5	1	240	2022-12-01	2	2022-11-01	2022-11-01 00:00:00	0	0000000828	pago con el minmo deposito noviembre 	2022-11-22
1165	AGSI-RE-1339	47	1	5	1	235	2022-11-01	2	2022-11-01	2023-01-20 10:28:20	0	0000001159		2023-01-20
1210	AGSP-D-2875	30	2	5	1	150	2022-11-01	2	2022-11-01	2023-01-20 10:30:07	0	0000001160		2023-01-20
1164	AGSI-PJ-0070	33	1	5	1	165	2022-11-01	2	2022-11-01	2023-01-20 10:32:32	0	0000001161		2023-01-20
1203	AGSI-PE-0288	24	1	5	1	165	2022-11-01	2	2022-11-01	2023-01-25 02:57:15	0	0000001173		2023-01-25
1157	ARSH-RE-0016	52	1	5	1	260	2022-11-01	2	2022-11-01	2023-01-27 02:43:55	0	0000001175		2023-01-27
1194	AGSI-D-23005	63	1	5	1	315	2022-11-01	2	2022-11-01	2023-01-31 06:29:47	0	0000001179		2023-01-31
1200	AGSI-RE-1593	23	2	5	1	115	2022-11-01	2	2022-11-01	2023-01-31 06:33:27	0	0000001182		2023-01-31
860	ARSH-D-957	27	1	5	1	165	2022-09-01	2	2022-09-01	2022-11-01 05:06:38	0	0000000829	pago con el mismo deposito octubre	2022-11-22
1129	ARSH-PJ-0034	43	1	5	1	215	2022-11-01	2	2022-11-01	2022-11-02 02:06:31	0	0000000831		2022-11-22
1218	AGSI-AUXILIAR	12	2	5	1	60	2022-11-05	2	2022-11-05	2022-11-05 05:38:03	0	0000000855		2022-11-22
1132	AGSI-D-20765	35	1	5	1	175	2022-11-01	2	2022-11-01	2022-11-07 03:59:20	0	0000000863	el señor retiro la embarcacion hgace el mes pasado 	2022-11-22
1214	AGSI-D-TRAMI 023	15	2	5	1	75	2022-11-01	2	2022-11-01	2022-11-08 09:01:12	0	0000000868		2022-11-22
1219	AGSI-PE-0816	28	1	5	1	165	2022-12-01	2	2022-11-09	2022-11-09 00:00:00	0	0000000873		2022-11-22
1220	AMSH-RE 0323	62	1	5	1	310	2022-12-01	2	2022-11-09	2022-11-09 00:00:00	0	0000000879		2022-11-22
1078	AGSI-RE-1324	40	1	5	1	200	2022-10-01	2	2022-10-01	2022-11-09 09:52:25	0	0000000880		2022-11-22
1221	AGSI-RE-1324	40	1	5	1	200	2022-12-01	2	2022-11-09	2022-11-09 00:00:00	0	0000000882		2022-11-22
880	ARSH-D-1448	30	1	5	1	165	2022-09-01	2	2022-09-01	2022-11-10 07:42:56	0	0000000884		2022-11-22
1222	ARSH-D-1448	30	1	5	1	165	2022-12-01	2	2022-11-10	2022-11-10 00:00:00	0	0000000887		2022-11-22
1190	AGSI-RE-1354	24	2	5	1	120	2022-11-01	2	2022-11-01	2023-04-11 06:49:52	0	0000001494	el señor no tenia la embarcacion en la marina desde agosto 2022 y por el reglamento pierde el puesto por no pagar 	2023-04-11
507	AGSI-RE-1587	55	1	5	1	275	2022-06-01	2	2022-06-01	2022-11-10 09:49:16	0	0000000892		2022-11-22
1143	AGSI-D-5426	35	2	5	1	175	2022-11-01	2	2022-11-01	2022-11-16 01:29:31	0	0000000909	exonerado por desincorpora	2022-11-22
493	Agsi-re-tramite-3344	11	2	5	1	55	2022-06-01	2	2022-06-01	2022-11-19 03:03:59	0	0000000910		2022-11-22
613	Agsi-re-tramite-3344	11	2	5	1	55	2022-07-01	2	2022-07-01	2022-11-19 03:06:11	0	0000000911		2022-11-22
856	Agsi-re-tramite-3344	11	2	5	1	55	2022-09-01	2	2022-09-01	2022-11-19 03:08:11	0	0000000913		2022-11-22
1040	AGSI-2221	42	1	5	1	210	2022-10-01	2	2022-10-01	2022-11-19 03:16:23	0	0000000916		2022-11-22
1034	AGSP-RE-0514	63	1	5	1	315	2022-10-01	2	2022-10-01	2022-11-19 03:22:43	0	0000000918		2022-11-22
1192	AGSP-1992	43	1	5	1	215	2022-11-01	2	2022-11-01	2022-11-19 03:24:30	0	0000000919		2022-11-22
1102	AGSI-RE-1011	45	1	5	1	225	2022-11-01	2	2022-11-01	2022-11-19 03:52:27	0	0000000920		2022-11-22
991	Agsi-re-tramite-3344	11	2	5	1	55	2022-10-01	2	2022-10-01	2022-11-22 03:37:04	0	0000000932		2022-11-22
1112	Agsi-re-tramite-3344	11	2	5	1	55	2022-11-01	2	2022-11-01	2022-11-22 03:37:50	0	0000000933		2022-11-22
1206	AGSI-RE-1243	53	1	5	1	265	2022-11-01	2	2022-11-01	2022-11-22 07:01:59	0	0000000942		2022-11-22
1223	AGSI-RE-1011	45	1	5	1	225	2022-12-01	2	2022-11-19	2022-11-19 00:00:00	0	0000000921		2022-11-22
1224	AGSI-RE-22326	33	1	5	1	165	2022-12-01	2	2022-11-19	2022-11-19 00:00:00	0	0000000924		2022-11-22
1096	ADKN-RE-0740	63	1	5	1	315	2022-10-04	2	2022-10-04	2022-11-19 06:45:51	0	0000000925		2022-11-22
1225	AGSI-RE-0661	45	1	5	1	225	2022-12-01	2	2022-11-21	2022-11-21 00:00:00	0	0000000928		2022-11-22
1186	AGSM-RE-0620	47	1	5	1	235	2022-11-01	2	2022-11-01	2022-12-02 04:05:40	0	0000000966		2022-12-02
1209	AGSI-RE-0655	50	1	5	1	250	2022-11-01	2	2022-11-01	2022-12-02 07:06:02	0	0000000977		2022-12-02
1195	AGSI-D-23647	36	1	5	1	180	2022-11-01	2	2022-11-01	2022-12-06 02:12:55	0	0000000987		2022-12-06
1213	AGSI-RE-0606	32	1	5	1	165	2022-11-01	2	2022-11-01	2022-12-06 02:38:36	0	0000000992		2022-12-06
1116	ARSH-D-957	27	1	5	1	165	2022-11-01	2	2022-11-01	2022-11-21 09:25:31	0	0000000929		2022-11-22
945	AGSI-D-5926	63	1	5	1	315	2022-09-01	2	2022-09-01	2022-11-22 03:22:28	0	0000000931		2022-11-22
1231	CA224625	74	1	5	1	370	2022-09-01	2	2022-09-01	2022-11-23 07:42:05	0	0000000947		2022-11-23
1236	CA224625	74	1	5	1	370	2022-12-01	2	2022-11-23	2022-11-23 00:00:00	0	0000000950		\N
1035	AGSI-PE-0879	29	1	5	1	165	2022-10-01	2	2022-10-01	2022-11-23 08:58:10	0	0000000951		2022-11-23
1156	AGSI-PE-0879	29	1	5	1	165	2022-11-01	2	2022-11-01	2022-11-23 08:59:00	0	0000000952		2022-11-23
1207	AGSI-TU-0072	14	2	5	1	70	2022-11-01	2	2022-11-01	2022-12-12 04:46:46	0	0000001020		2022-12-12
1205	AGSI-RE-0886	46	1	5	1	230	2022-11-01	2	2022-11-01	2022-12-13 04:22:03	0	0000001028		2022-12-13
1204	AGSI-RE-1349	60	1	5	1	300	2022-11-01	2	2022-11-01	2022-12-14 08:56:30	0	0000001037		2022-12-14
1238	AGSI-1444	42	2	5	1	210	2022-12-01	2	2022-11-23	2022-11-23 00:00:00	0	0000000958		\N
928	AGSI-RE-TRAMITE 456	48	1	5	1	240	2022-09-01	2	2022-09-01	2022-11-26 02:49:00	0	0000000960		2022-11-26
1062	AGSI-RE-TRAMITE 456	48	1	5	1	240	2022-10-01	2	2022-10-01	2022-11-26 02:50:17	0	0000000961		2022-11-26
1122	AGSP-RE-1071	72	1	5	1	360	2022-11-01	2	2022-11-01	2022-11-29 01:34:58	0	0000000963		2022-11-29
1215	AGSP-RE-0587	25	2	5	1	125	2022-11-01	2	2022-11-01	2023-01-02 02:45:45	0	0000001115		2023-01-02
1273	AGSI-RE-TRAMITE7458	115	1	5	1	575	2022-12-01	0	2022-12-01	2022-12-01 00:00:00	0	0	\N	\N
1245	AGSI-2927	44	1	5	1	220	2022-12-01	2	2022-12-01	2023-01-09 05:15:04	0	0000001126		2023-01-09
1243	AGSI-D-5535	42	1	5	1	210	2022-12-01	2	2022-12-01	2023-01-11 12:12:54	0	0000001132		2023-01-11
1261	ARSH-RE-0356	28	2	5	1	140	2022-12-01	2	2022-12-01	2023-01-11 09:25:04	0	0000001142		2023-01-11
1250	AGSI-re-tramite-098	14	2	5	1	70	2022-12-01	2	2022-12-01	2023-01-20 10:36:27	0	0000001163		2023-01-20
1097	ADKN-RE-0740	63	1	5	1	315	2022-11-04	2	2022-10-04	2023-01-21 04:40:29	0	0000001167		2023-01-21
1244	AGSI-RE TRAMITE00332211	30	1	5	1	165	2022-12-01	2	2022-12-01	2023-02-01 08:15:59	0	0000001196	el propietario tenia puesto en agua nunca trajo la embarcacion a las instalaciones  cancelo al dia hasta julio 2022 pero a la fecha no cancelo mas 	2023-02-01
865	Agsi-re-0678	42	1	5	1	210	2022-09-01	2	2022-09-01	2023-02-03 09:34:29	0	0000001215		2023-02-03
1000	Agsi-re-0678	42	1	5	1	210	2022-10-01	2	2022-10-01	2023-02-03 09:35:38	0	0000001216		2023-02-03
1121	Agsi-re-0678	42	1	5	1	210	2022-11-01	2	2022-11-01	2023-02-03 09:36:20	0	0000001217		2023-02-03
1259	Agsi-re-0678	42	1	5	1	210	2022-12-01	2	2022-12-01	2023-02-03 09:37:28	0	0000001218		2023-02-03
1258	AGSI-RE-0437	30	1	5	1	165	2022-12-01	2	2022-12-01	2023-02-03 09:57:41	0	0000001227		2023-02-03
1252	AGSI-RE-0268	58	1	5	1	290	2022-12-01	2	2022-12-01	2023-02-03 10:00:05	0	0000001228		2023-02-03
1282	AGSI-PE-0532	24	1	5	1	165	2022-12-01	2	2022-12-01	2023-02-09 02:17:08	0	0000001249		2023-02-09
1267	ARSH-PJ-0034	43	1	5	1	215	2022-12-01	2	2022-12-01	2022-12-05 01:48:11	0	0000000983		2022-12-05
1303	AGSI-D-5810	55	1	5	1	275	2022-12-01	0	2022-12-01	2022-12-01 00:00:00	0	0	\N	\N
1249	AGSI-AUXILIAR	12	2	5	1	60	2022-12-01	2	2022-12-01	2022-12-07 02:45:41	0	0000000996		2022-12-07
1274	AGSI-RE-0575	40	1	5	1	200	2022-12-01	2	2022-12-01	2022-12-07 02:46:50	0	0000000997		2022-12-07
1304	ADKN-2106	44	1	5	1	220	2022-12-01	2	2022-12-01	2022-12-07 04:28:01	0	0000000999		2022-12-07
1246	AGSI-PE-0830	23	1	5	1	165	2022-12-01	2	2022-12-01	2022-12-07 09:30:36	0	0000001008		2022-12-07
1256	AGSI-RE-0601	22	2	5	1	110	2022-12-01	2	2022-12-01	2022-12-09 05:32:16	0	0000001012		2022-12-09
1290	AGSI-D-5124	36	1	5	1	180	2022-12-01	2	2022-12-01	2022-12-11 03:48:47	0	0000001016		2022-12-11
1281	AGSI-RE-1404	24	2	5	1	120	2022-12-01	2	2022-12-01	2022-12-12 04:43:52	0	0000001019		2022-12-12
1271	AGSI-RE-0805	72	1	5	1	360	2022-12-01	2	2022-12-01	2022-12-13 03:24:46	0	0000001023		2022-12-13
1263	AGSM-D-1776	43	1	5	1	215	2022-12-01	2	2022-12-01	2023-03-04 10:01:48	0	0000001260		2023-03-04
1272	AGSI-TU-0182	35	1	5	1	175	2022-12-01	2	2022-12-01	2023-02-14 09:21:05	0	0000001261		2023-02-14
1283	AGSI-PE-0887	25	1	5	1	165	2022-12-01	2	2022-12-01	2023-02-22 02:28:27	0	0000001262		2023-02-22
1305	AQYM-D-050	47	1	5	1	235	2022-12-01	2	2022-12-01	2022-12-13 04:01:25	0	0000001027		2022-12-13
1201	AGSI-D-5926	63	1	5	1	315	2022-11-01	2	2022-11-01	2023-03-27 07:28:28	0	0000001417		2023-03-27
1275	AGSI-RE-1362	20	2	5	1	100	2022-12-01	2	2022-12-01	2022-12-13 08:12:32	0	0000001031		2022-12-13
1292	AGSI-PE-0879	29	1	5	1	165	2022-12-01	2	2022-12-01	2022-12-14 04:05:34	0	0000001033		2022-12-14
1280	ADKN-D-7303	20	2	5	1	100	2022-12-01	2	2022-12-01	2022-12-14 09:03:10	0	0000001042		2022-12-14
1276	ARSH-D-2077	80	1	5	1	400	2022-12-01	2	2022-12-01	2022-12-15 05:38:33	0	0000001046		2022-12-15
1311	AGSI-RE-0753	60	1	5	1	300	2022-12-01	2	2022-12-01	2022-12-15 10:24:36	0	0000001047		2022-12-15
1253	AGSI-PE-0842	24	1	5	1	165	2022-12-01	2	2022-12-01	2022-12-15 11:11:03	0	0000001049		2022-12-15
1269	AGSI-D-22487	30	1	5	1	165	2022-12-01	2	2022-12-01	2022-12-18 03:35:13	0	0000001058		2022-12-18
1260	AGSP-RE-1071	72	1	5	1	360	2022-12-01	2	2022-12-01	2022-12-19 09:21:07	0	0000001059		2022-12-19
1247	AGSI-RE-1239	44	1	5	1	220	2022-12-01	2	2022-12-01	2022-12-21 05:24:52	0	0000001061		2022-12-21
1291	AGSP-RE-0514	63	1	5	1	315	2022-12-01	2	2022-12-01	2022-12-21 05:33:24	0	0000001065		2022-12-21
1251	Agsi-re-tramite-3344	11	2	5	1	55	2022-12-01	2	2022-12-01	2022-12-22 04:46:06	0	0000001068		2022-12-22
1302	AGSI-D-6150	35	1	5	1	175	2022-12-01	2	2022-12-01	2022-12-22 04:48:37	0	0000001069		2022-12-22
1255	ARSH-D-957	27	1	5	1	165	2022-12-01	2	2022-12-01	2022-12-22 04:51:09	0	0000001070		2022-12-22
1265	DL1324AC	73	1	5	1	365	2022-12-01	2	2022-12-01	2022-12-23 07:12:59	0	0000001077		2022-12-23
1306	ARSH-D-1850	85	1	5	1	425	2022-12-01	2	2022-12-01	2022-12-23 10:27:17	0	0000001080		2022-12-23
1321	AGSI-D-11413	32	1	5	1	165	2022-12-01	0	2022-12-01	2022-12-01 00:00:00	0	0	\N	\N
1313	AGSI-RE-1098	30	1	5	1	165	2022-12-01	2	2022-12-01	2023-01-02 08:09:26	0	0000001118		2023-01-02
1330	AGSI-PE-0829	34	1	5	1	170	2022-12-01	2	2022-12-01	2023-01-04 12:38:19	0	0000001119		2023-01-04
1266	AGSI-D-5814	37	1	5	1	185	2022-12-01	2	2022-12-01	2023-01-04 05:29:49	0	0000001122		2023-01-04
1198	AGSI-RE-1001	54	1	5	1	270	2022-11-01	2	2022-11-01	2022-12-02 03:36:38	0	0000000965		2022-12-02
1322	AGSM-RE-0620	47	1	5	1	235	2022-12-01	2	2022-12-01	2022-12-02 04:06:42	0	0000000967		2022-12-02
303	AGSI-D-16610	42	1	5	1	210	2022-04-01	2	2022-04-01	2022-12-02 06:49:40	0	0000000968		2022-12-02
663	AGSI-D-16610	42	1	5	1	210	2022-07-01	2	2022-07-01	2022-12-02 06:52:34	0	0000000971		2022-12-02
783	AGSI-D-16610	42	1	5	1	210	2022-08-01	2	2022-08-01	2022-12-02 06:53:21	0	0000000972		2022-12-02
1088	AGSI-RE-0655	50	1	5	1	250	2022-10-01	2	2022-10-01	2022-12-02 07:05:04	0	0000000976		2022-12-02
1295	Agsi-re-tramite-224466	48	1	5	1	240	2022-12-01	2	2022-12-01	2023-07-27 05:12:37	0	0000001849		2023-07-27
1296	AGSI-D-16610	42	1	5	1	210	2022-12-01	2	2022-12-01	2022-12-02 07:55:48	0	0000000980	se encuentra desde el 2 de diciembre en desincorporacion  y 30 dias para salir de la marina 	2022-12-02
1343	AGSI-RE-0655	50	1	5	1	250	2022-12-01	2	2022-12-01	2023-01-11 06:52:48	0	0000001136		2023-01-11
1288	AGSI-D-10408	28	1	5	1	165	2022-12-01	2	2022-12-01	2023-01-11 09:22:43	0	0000001141		2023-01-11
1309	AGSP-2214	36	1	5	1	180	2022-12-01	2	2022-12-01	2023-01-12 03:45:14	0	0000001147		2023-01-12
1297	AGSI-2221	42	1	5	1	210	2022-12-01	2	2022-12-01	2023-01-17 02:19:18	0	0000001150		2023-01-17
1320	AGSI-D-6032	34	1	5	1	170	2022-12-01	2	2022-12-01	2023-01-17 02:24:32	0	0000001152		2023-01-17
1328	AGSI-D-23325	27	1	5	1	165	2022-12-01	2	2022-12-01	2023-01-20 06:40:13	0	0000001157		2023-01-20
1344	AGSP-D-2875	30	2	5	1	150	2022-12-01	2	2022-12-01	2023-01-20 10:34:43	0	0000001162		2023-01-20
1300	AGSI-PJ-0070	33	1	5	1	165	2022-12-01	2	2022-12-01	2023-01-20 10:38:12	0	0000001164		2023-01-20
1301	AGSI-RE-1339	47	1	5	1	235	2022-12-01	2	2022-12-01	2023-01-20 10:40:03	0	0000001165		2023-01-20
1337	AGSI-PE-0288	24	1	5	1	165	2022-12-01	2	2022-12-01	2023-01-25 02:58:31	0	0000001174		2023-01-25
1331	AGSI-D-23005	63	1	5	1	315	2022-12-01	2	2022-12-01	2023-01-31 06:30:41	0	0000001180		2023-01-31
1335	AGSI-RE-1593	23	2	5	1	115	2022-12-01	2	2022-12-01	2023-01-31 06:34:33	0	0000001183		2023-01-31
1318	AGSI-RE-0989	24	2	5	1	120	2022-12-01	2	2022-12-01	2023-02-02 06:37:26	0	0000001211	LA EMBARCACION FUE TRASLADADA EN MAYO DEL 2022 PARA PUERTO LA CRUZ Y NO RECRESO EL PROPIETARIO SE LE MANDO MUCHOS COMUNICADOS DE PAGO Y NO PAGO 	2023-02-02
1323	AGSI-RE-0205	58	1	5	1	290	2022-12-01	2	2022-12-01	2023-02-03 09:56:00	0	0000001226		2023-02-03
1319	AGSI-RE-TRAMITE 456	48	1	5	1	240	2022-12-01	2	2022-12-01	2023-02-11 02:14:26	0	0000001252		2023-02-11
1298	AGSI-RE-1072	47	1	5	1	235	2022-12-01	2	2022-12-01	2022-12-03 02:26:03	0	0000000981		2022-12-03
983	AGSI-RE-TRAMITE789	47	1	5	1	235	2022-10-01	2	2022-10-01	2022-12-06 02:13:53	0	0000000988		2022-12-06
1352	AGSI-RE-1604	50	1	5	1	250	2022-12-01	2	2022-12-01	2022-12-06 04:30:19	0	0000000993		2022-12-06
1151	AGSI-RE-1420	60	1	5	1	300	2022-11-01	2	2022-11-01	2022-12-07 02:42:17	0	0000000994		2022-12-07
1287	AGSI-RE-1420	60	1	5	1	300	2022-12-01	2	2022-12-01	2022-12-07 02:42:59	0	0000000995		2022-12-07
1348	AGSI-D-TRAMI 023	15	2	5	1	75	2022-12-01	2	2022-12-01	2022-12-07 04:28:59	0	0000001000		2022-12-07
1353	AGSI-D-TRAMI 023	15	2	5	1	75	2023-01-01	2	2022-12-07	2022-12-07 00:00:00	0	0000001001		\N
1354	AGSI-D-TRAMI 023	15	2	5	1	75	2023-02-01	2	2022-12-07	2022-12-07 00:00:00	0	0000001002		\N
1355	AGSI-D-TRAMI 023	15	2	5	1	75	2023-03-01	2	2022-12-07	2022-12-07 00:00:00	0	0000001003		\N
1356	ADKN-2106	44	1	5	1	220	2023-01-01	2	2022-12-07	2022-12-07 00:00:00	0	0000001004		\N
1357	ADKN-2106	44	1	5	1	220	2023-02-01	2	2022-12-07	2022-12-07 00:00:00	0	0000001005		\N
1358	ADKN-2106	44	1	5	1	220	2023-03-01	2	2022-12-07	2022-12-07 00:00:00	0	0000001006		\N
1007	AGSI-D-5814	37	1	5	1	185	2022-10-01	2	2022-10-01	2022-12-07 06:30:01	0	0000001007		2022-12-07
1326	AGSI-RE-0891	32	1	5	1	165	2022-12-01	2	2022-12-01	2022-12-09 05:25:40	0	0000001009		2022-12-09
1359	AGSI-RE-0891	32	1	5	1	165	2023-01-01	2	2022-12-09	2022-12-09 00:00:00	0	0000001010		\N
1299	ADKN-D-3015	36	1	5	1	180	2022-12-01	2	2022-12-01	2023-02-22 06:29:07	0	0000001264		2023-02-22
1308	AGSI-RE-1176	81	1	5	1	405	2022-12-01	2	2022-12-01	2023-02-22 02:47:21	0	0000001265		2023-02-22
1332	AGSI-D-23647	36	1	5	1	180	2022-12-01	2	2022-12-01	2023-02-22 06:31:33	0	0000001266		2023-02-22
1064	AGSI-D-11413	32	1	5	1	165	2022-10-01	2	2022-10-01	2022-12-09 05:30:02	0	0000001011		2022-12-09
886	AGSI-RE-TRAMITE 741	41	1	5	1	205	2022-09-01	2	2022-09-01	2022-12-10 05:55:36	0	0000001013		2022-12-10
1336	AGSI-D-5926	63	1	5	1	315	2022-12-01	2	2022-12-01	2023-03-27 07:29:41	0	0000001418		2023-03-27
1346	AGSI-D-21173	32	1	5	1	165	2022-12-01	2	2022-12-01	2023-04-01 02:37:52	0	0000001448	embarcacion en abandono por mas de 3 años propietarios no responden a los comunicados se le dio desincorporacion 01/04/2023	2023-04-01
1196	AGSI-RE-1303	63	1	5	1	315	2022-11-01	2	2022-11-01	2022-12-12 01:20:00	0	0000001017		2022-12-11
1339	AGSI-RE-0886	46	1	5	1	230	2022-12-01	2	2022-12-01	2022-12-13 04:22:51	0	0000001029		2022-12-13
1240	AGSM-RE-0897	50	1	5	1	250	2022-12-01	2	2022-12-01	2022-12-13 10:01:28	0	0000001032		2022-12-13
1333	AGSI-RE-1303	63	1	5	1	315	2022-12-01	2	2022-12-01	2022-12-12 01:22:21	0	0000001018		2022-12-12
1338	AGSI-RE-1349	60	1	5	1	300	2022-12-01	2	2022-12-01	2022-12-14 08:57:28	0	0000001038		2022-12-14
1324	AGSP-PJ-0066	25	1	5	1	165	2022-12-01	2	2022-12-01	2022-12-14 09:01:13	0	0000001040		2022-12-14
1114	AGSI-PE-0842	24	1	5	1	165	2022-11-01	2	2022-11-01	2022-12-15 11:10:06	0	0000001048		2022-12-15
1315	AGSI-D-22966	58	1	5	1	290	2022-12-01	2	2022-12-01	2022-12-17 03:56:42	0	0000001053		2022-12-17
752	AGSI-D-22487	30	1	5	1	165	2022-08-01	2	2022-08-01	2022-12-18 03:32:15	0	0000001054		2022-12-18
1289	AGSI-RE-GTRAMITE52	70	1	5	1	350	2022-12-01	2	2022-12-01	2022-12-21 05:26:50	0	0000001063		2022-12-21
1325	APNN-D-675	35	2	5	1	175	2022-12-01	2	2022-12-01	2022-12-21 05:50:29	0	0000001067		2022-12-21
628	DL1324AC	73	1	5	1	365	2022-07-01	2	2022-07-01	2022-12-23 07:09:32	0	0000001072		2022-12-23
1360	DL1324AC	73	1	5	1	365	2023-01-01	2	2022-12-23	2022-12-23 00:00:00	0	0000001078		\N
1361	DL1324AC	73	1	5	1	365	2023-02-01	2	2022-12-23	2022-12-23 00:00:00	0	0000001079		\N
1161	AGSI-2221	42	1	5	1	210	2022-11-01	2	2022-11-01	2022-12-27 03:22:46	0	0000001083		2022-12-27
1362	AGSI-PE-0816	28	1	5	1	165	2023-01-01	2	2022-12-27	2022-12-27 00:00:00	0	0000001084		\N
1341	AGSI-TU-0072	14	2	5	1	70	2022-12-01	2	2022-12-01	2023-01-02 01:25:52	0	0000001085		2023-01-02
895	AGSI-D-2494	27	1	5	1	165	2022-09-01	2	2022-09-01	2023-01-02 01:30:51	0	0000001086	embarcacion solvente hasta el mes septiembre salio a navegar y descargando en el compas de caraballeda presento fintraciones en el casco y en horas de la la madrugada del dia 16/09/2022  se hundio hasta la fecha no regreso a las instalaciones de la marina 	2023-01-02
1095	AGSI-D-2494	27	1	5	1	165	2022-10-01	2	2022-10-01	2023-01-02 01:31:33	0	0000001087	embarcacion solvente hasta el mes septiembre salio a navegar y descargando en el compas de caraballeda presento fintraciones en el casco y en horas de la la madrugada del dia 16/09/2022  se hundio hasta la fecha no regreso a las instalaciones de la marina 	2023-01-02
1402	AGSI-RE-TRAMITE 741	41	1	5	1	205	2023-01-01	2	2023-01-01	2023-01-10 06:53:11	0	0000001129		2023-01-10
1216	AGSI-D-2494	27	1	5	1	165	2022-11-01	2	2022-11-01	2023-01-02 01:32:13	0	0000001088	embarcacion solvente hasta el mes septiembre salio a navegar y descargando en el compas de caraballeda presento fintraciones en el casco y en horas de la la madrugada del dia 16/09/2022  se hundio hasta la fecha no regreso a las instalaciones de la marina 	2023-01-02
1173	AGSP-2214	36	1	5	1	180	2022-11-01	2	2022-11-01	2023-01-12 03:41:50	0	0000001146		2023-01-12
81	AGSI-D-TR3030	30	1	1	1	33	2022-02-01	2	2022-02-01	2023-01-02 01:37:17	0	0000001090	embarcacion en abandono por mas de 3 años se le a notificado al propietario y se le presento en muchas ocaciones la carte de cobranza con la nota del desalojo incluso llamadas telefonicas y el propietario nunca respondio a los llamados 	2023-01-02
1350	AGSP-RE-0587	25	2	5	1	125	2022-12-01	2	2022-12-01	2023-01-02 02:47:00	0	0000001116		2023-01-02
1347	AGSI-RE-0606	32	1	5	1	165	2022-12-01	2	2022-12-01	2023-01-04 12:39:38	0	0000001120		2023-01-04
1351	AGSI-D-2494	27	1	5	1	165	2022-12-01	2	2022-12-01	2023-01-02 01:33:21	0	0000001089	embarcacion solvente hasta el mes septiembre salio a navegar y descargando en el compas de caraballeda presento fintraciones en el casco y en horas de la la madrugada del dia 16/09/2022  se hundio hasta la fecha no regreso a las instalaciones de la marina 	2023-01-02
201	AGSI-D-TR3030	30	1	1	1	33	2022-03-01	2	2022-03-01	2023-01-02 01:37:49	0	0000001091	embarcacion en abandono por mas de 3 años se le a notificado al propietario y se le presento en muchas ocaciones la carte de cobranza con la nota del desalojo incluso llamadas telefonicas y el propietario nunca respondio a los llamados 	2023-01-02
321	AGSI-D-TR3030	30	1	5	1	165	2022-04-01	2	2022-04-01	2023-01-02 01:38:16	0	0000001092	embarcacion en abandono por mas de 3 años se le a notificado al propietario y se le presento en muchas ocaciones la carte de cobranza con la nota del desalojo incluso llamadas telefonicas y el propietario nunca respondio a los llamados 	2023-01-02
441	AGSI-D-TR3030	30	1	5	1	165	2022-05-01	2	2022-05-01	2023-01-02 01:38:49	0	0000001093	embarcacion en abandono por mas de 3 años se le a notificado al propietario y se le presento en muchas ocaciones la carte de cobranza con la nota del desalojo incluso llamadas telefonicas y el propietario nunca respondio a los llamados 	2023-01-02
561	AGSI-D-TR3030	30	1	5	1	165	2022-06-01	2	2022-06-01	2023-01-02 01:39:19	0	0000001094	embarcacion en abandono por mas de 3 años se le a notificado al propietario y se le presento en muchas ocaciones la carte de cobranza con la nota del desalojo incluso llamadas telefonicas y el propietario nunca respondio a los llamados 	2023-01-02
681	AGSI-D-TR3030	30	1	5	1	165	2022-07-01	2	2022-07-01	2023-01-02 01:39:50	0	0000001095	embarcacion en abandono por mas de 3 años se le a notificado al propietario y se le presento en muchas ocaciones la carte de cobranza con la nota del desalojo incluso llamadas telefonicas y el propietario nunca respondio a los llamados 	2023-01-02
1388	ARSH-RE-0356	28	2	5	1	140	2023-01-01	2	2023-01-01	2023-02-08 02:33:18	0	0000001242		2023-02-08
801	AGSI-D-TR3030	30	1	5	1	165	2022-08-01	2	2022-08-01	2023-01-02 01:40:39	0	0000001096	embarcacion en abandono por mas de 3 años se le a notificado al propietario y se le presento en muchas ocaciones la cartas de cobranza con la nota del desalojo incluso llamadas telefonicas y el propietario nunca respondio a los llamados 	2023-01-02
923	AGSI-D-TR3030	30	1	5	1	165	2022-09-01	2	2022-09-01	2023-01-02 01:41:08	0	0000001097	embarcacion en abandono por mas de 3 años se le a notificado al propietario y se le presento en muchas ocaciones la cartas de cobranza con la nota del desalojo incluso llamadas telefonicas y el propietario nunca respondio a los llamados 	2023-01-02
1057	AGSI-D-TR3030	30	1	5	1	165	2022-10-01	2	2022-10-01	2023-01-02 01:41:43	0	0000001098	embarcacion en abandono por mas de 3 años se le a notificado al propietario y se le presento en muchas ocaciones la cartas de cobranza con la nota del desalojo incluso llamadas telefonicas y el propietario nunca respondio a los llamados 	2023-01-02
1178	AGSI-D-TR3030	30	1	5	1	165	2022-11-01	2	2022-11-01	2023-01-02 01:42:47	0	0000001099	embarcacion en abandono por mas de 3 años se le a notificado al propietario y se le presento en muchas ocaciones la cartas de cobranza con la nota del desalojo incluso llamadas telefonicas y el propietario nunca respondio a los llamados 	2023-01-02
1314	AGSI-D-TR3030	30	1	5	1	165	2022-12-01	2	2022-12-01	2023-01-02 01:43:18	0	0000001100	embarcacion en abandono por mas de 3 años se le a notificado al propietario y se le presento en muchas ocaciones la cartas de cobranza con la nota del desalojo incluso llamadas telefonicas y el propietario nunca respondio a los llamados 	2023-01-02
1438	AGSI-D-11413	32	1	5	1	165	2023-01-01	0	2023-01-01	2023-01-01 00:00:00	0	0	\N	\N
1455	AGSI-TU-0058	48	1	5	1	240	2023-01-01	2	2023-01-01	2023-01-11 12:18:47	0	0000001133		2023-01-11
16	AGSI-D-9606	23	2	1	1	23	2022-02-01	2	2022-02-01	2023-01-02 01:48:10	0	0000001101	embarcacion el abandono propietario no responde a los llamados fue retirada del puesto en agua en junio del 2022 y hasta la fecha el propietario no responde a las cartas enviadas 	2023-01-02
136	AGSI-D-9606	23	2	1	1	23	2022-03-01	2	2022-03-01	2023-01-02 01:49:15	0	0000001102	embarcacion el abandono propietario no responde a los llamados fue retirada del puesto en agua en junio del 2022 y hasta la fecha el propietario no responde a las cartas enviadas 	2023-01-02
256	AGSI-D-9606	23	2	5	1	115	2022-04-01	2	2022-04-01	2023-01-02 01:51:48	0	0000001103	embarcacion en abandono por mas de 1 años se le a notificado al propietario y se le presento en muchas ocaciones la carte de cobranza con la nota del desalojo incluso llamadas telefonicas y el propietario nunca respondio a los llamados en marzo del 2022 fue retirada del puesto en agua 	2023-01-02
496	AGSI-D-9606	23	2	5	1	115	2022-06-01	2	2022-06-01	2023-01-02 01:53:06	0	0000001105	embarcacion en abandono por mas de 1 años se le a notificado al propietario y se le presento en muchas ocaciones la carte de cobranza con la nota del desalojo incluso llamadas telefonicas y el propietario nunca respondio a los llamados en marzo del 2022 fue retirada del puesto en agua 	2023-01-02
616	AGSI-D-9606	23	2	5	1	115	2022-07-01	2	2022-07-01	2023-01-02 01:53:33	0	0000001106	embarcacion en abandono por mas de 1 años se le a notificado al propietario y se le presento en muchas ocaciones la carte de cobranza con la nota del desalojo incluso llamadas telefonicas y el propietario nunca respondio a los llamados en marzo del 2022 fue retirada del puesto en agua 	2023-01-02
736	AGSI-D-9606	23	2	5	1	115	2022-08-01	2	2022-08-01	2023-01-02 01:54:06	0	0000001107	embarcacion en abandono por mas de 1 años se le a notificado al propietario y se le presento en muchas ocaciones la carte de cobranza con la nota del desalojo incluso llamadas telefonicas y el propietario nunca respondio a los llamados en marzo del 2022 fue retirada del puesto en agua 	2023-01-02
994	AGSI-D-9606	23	2	5	1	115	2022-10-01	2	2022-10-01	2023-01-02 01:58:43	0	0000001109	embarcacion en abandono por mas de 1 años se le a notificado al propietario y se le presento en muchas ocaciones la carte de cobranza con la nota del desalojo incluso llamadas telefonicas y el propietario nunca respondio a los llamados en marzo del 2022 fue retirada del puesto en agua 	2023-01-02
1371	ENTRAMITE001	88	1	5	1	440	2023-01-01	2	2023-01-01	2023-01-11 12:04:14	0	0000001130		2023-01-11
1462	AGSI-RE-0655	50	1	5	1	250	2023-01-01	2	2023-01-01	2023-01-11 06:53:42	0	0000001137		2023-01-11
1115	AGSI-D-9606	23	2	5	1	115	2022-11-01	2	2022-11-01	2023-01-02 01:59:10	0	0000001110	embarcacion en abandono por mas de 1 años se le a notificado al propietario y se le presento en muchas ocaciones la carte de cobranza con la nota del desalojo incluso llamadas telefonicas y el propietario nunca respondio a los llamados en marzo del 2022 fue retirada del puesto en agua 	2023-01-02
1254	AGSI-D-9606	23	2	5	1	115	2022-12-01	2	2022-12-01	2023-01-02 02:00:20	0	0000001111	embarcacion en abandono por mas de 1 años se le a notificado al propietario y se le presento en muchas ocaciones la carte de cobranza con la nota del desalojo incluso llamadas telefonicas y el propietario nunca respondio a los llamados en marzo del 2022 fue retirada del puesto en agua 	2023-01-02
1334	AGSI-RE-1001	54	1	5	1	270	2022-12-01	2	2022-12-01	2023-01-02 02:17:20	0	0000001112		2023-01-02
1363	AGSI-RE-1072	47	1	5	1	235	2023-01-01	2	2023-01-02	2023-01-02 00:00:00	0	0000001114		\N
1177	AGSI-RE-1098	30	1	5	1	165	2022-11-01	2	2022-11-01	2023-01-02 08:08:39	0	0000001117		2023-01-02
1364	ARSH-PJ-0034	43	1	5	1	215	2023-01-01	2	2023-01-05	2023-01-05 00:00:00	0	0000001123		\N
1376	AGSI-AUXILIAR	12	2	5	1	60	2023-01-01	2	2023-01-01	2023-01-11 12:20:11	0	0000001134		2023-01-11
1367	AGSI-RE-1011	45	1	5	1	225	2023-01-01	2	2023-01-01	2023-01-11 06:56:12	0	0000001138		2023-01-11
1382	AGSI-RE-22326	33	1	5	1	165	2023-01-01	2	2023-01-01	2023-01-11 09:29:52	0	0000001143		2023-01-11
1369	AGSI-D-5535	42	1	5	1	210	2023-01-01	2	2023-01-01	2023-01-17 06:56:27	0	0000001153		2023-01-17
1383	AGSI-RE-0601	22	2	5	1	110	2023-01-01	2	2023-01-01	2023-01-23 09:28:02	0	0000001170		2023-01-23
1373	AGSI-PE-0830	23	1	5	1	165	2023-01-01	2	2023-01-01	2023-01-31 06:37:42	0	0000001185		2023-01-31
1386	Agsi-re-0678	42	1	5	1	210	2023-01-01	2	2023-01-01	2023-02-03 09:38:08	0	0000001219		2023-02-03
1385	AGSI-RE-0437	30	1	5	1	165	2023-01-01	2	2023-01-01	2023-02-03 10:03:27	0	0000001230		2023-02-03
1372	AGSI-2927	44	1	5	1	220	2023-01-01	2	2023-01-01	2023-02-12 03:36:12	0	0000001255		2023-02-12
1384	AGSI-D- 2796	27	1	5	1	165	2023-01-01	2	2023-01-01	2023-02-12 04:07:25	0	0000001256		2023-02-12
1397	AGSI-RE-TRAMITE7458	115	1	5	1	575	2023-01-01	0	2023-01-01	2023-01-01 00:00:00	0	0	\N	\N
1418	AGSI-2221	42	1	5	1	210	2023-01-01	0	2023-01-01	2023-01-01 00:00:00	0	0	\N	\N
1423	AGSI-D-5810	55	1	5	1	275	2023-01-01	0	2023-01-01	2023-01-01 00:00:00	0	0	\N	\N
1368	AGSI-RE-TRAMITE789	47	1	5	1	235	2023-01-01	2	2023-01-01	2023-02-22 06:27:48	0	0000001269		2023-02-22
1374	AGSI-RE-1239	44	1	5	1	220	2023-01-01	2	2023-01-01	2023-02-14 09:32:29	0	0000001270		2023-02-14
1375	AGSI-RE-TRAMITE 000123	11	2	5	1	55	2023-01-01	2	2023-01-01	2023-02-22 06:49:05	0	0000001271		2023-02-22
1379	AGSI-RE-0268	58	1	5	1	290	2023-01-01	2	2023-01-01	2023-03-04 01:06:30	0	0000001272		2023-03-04
1381	ARSH-D-957	27	1	5	1	165	2023-01-01	2	2023-01-01	2023-02-27 09:18:51	0	0000001273		2023-02-27
1377	AGSI-re-tramite-098	14	2	5	1	70	2023-01-01	2	2023-01-01	2023-03-09 01:45:47	0	0000001345		2023-03-09
1421	AGSI-RE-1339	47	1	5	1	235	2023-01-01	2	2023-01-01	2023-03-09 01:50:16	0	0000001348		2023-03-09
1433	AGSI-RE-TRAMI01	28	1	5	1	165	2023-01-01	2	2023-01-01	2023-03-14 12:54:04	0	0000001355	EXONERADA POR EL SEÑOR EDUARDO	2023-03-14
1380	AGSI-PE-0842	24	1	5	1	165	2023-01-01	2	2023-01-01	2023-03-15 01:07:33	0	0000001365		2023-03-15
1399	AGSI-RE-1362	20	2	5	1	100	2023-01-01	2	2023-01-01	2023-03-16 02:13:43	0	0000001373		2023-03-16
1426	AGSI-D-4396	62	1	5	1	310	2023-01-01	2	2023-01-01	2023-03-20 05:38:09	0	0000001394	se desincorporar por orden de la directiva 	2023-03-20
1414	AGSI-PE-0879	29	1	5	1	165	2023-01-01	2	2023-01-01	2023-03-22 04:53:01	0	0000001406		2023-03-22
1454	AGSI-D-5926	63	1	5	1	315	2023-01-01	2	2023-01-01	2023-03-27 07:30:35	0	0000001419		2023-03-27
1432	AGSI-D-22966	58	1	5	1	290	2023-01-01	2	2023-01-01	2023-03-31 05:47:09	0	0000001424		2023-03-29
1396	ARSH-D-1448	30	1	5	1	165	2023-01-01	2	2023-01-01	2023-04-04 10:55:07	0	0000001482		2023-04-04
1378	Agsi-re-tramite-3344	11	2	5	1	55	2023-01-01	2	2023-01-01	2023-04-30 03:05:26	0	0000001581		2023-04-30
1398	AGSI-RE-0575	40	1	5	1	200	2023-01-01	2	2023-01-01	2023-01-11 12:21:08	0	0000001135		2023-01-11
1428	AGSP-2214	36	1	5	1	180	2023-01-01	2	2023-01-01	2023-01-12 03:55:06	0	0000001148		2023-01-12
1439	AGSM-RE-0620	47	1	5	1	235	2023-01-01	2	2023-01-01	2023-01-13 03:39:47	0	0000001149		2023-01-13
1460	AGSI-TU-0072	14	2	5	1	70	2023-01-01	2	2023-01-01	2023-01-19 02:59:40	0	0000001154		2023-01-19
1404	AGSI-RE-1404	24	2	5	1	120	2023-01-01	2	2023-01-01	2023-01-20 10:43:34	0	0000001166		2023-01-20
1442	APNN-D-675	35	2	5	1	175	2023-01-01	2	2023-01-01	2023-01-25 02:48:45	0	0000001171		2023-01-25
1413	AGSP-RE-0514	63	1	5	1	315	2023-01-01	2	2023-01-01	2023-01-25 02:49:33	0	0000001172		2023-01-25
1430	AGSI-RE-0753	60	1	5	1	300	2023-01-01	2	2023-01-01	2023-01-31 05:15:29	0	0000001176		2023-01-31
1400	ARSH-D-2077	80	1	5	1	400	2023-01-01	2	2023-01-01	2023-01-31 06:24:39	0	0000001178		2023-01-31
1447	AGSI-D-23005	63	1	5	1	315	2023-01-01	2	2023-01-01	2023-01-31 06:32:03	0	0000001181		2023-01-31
1445	AGSP-1992	43	1	5	1	215	2023-01-01	2	2023-01-01	2023-02-02 06:02:45	0	0000001200	 notifica que de no poder pagar mas y teniendo el barco inoperativo lo retira de las instalaciones se le da salida el dia 02/02/2023	2023-02-02
1412	AGSI-D-5124	36	1	5	1	180	2023-01-01	2	2023-01-01	2023-02-02 06:05:36	0	0000001202		2023-02-02
1446	AGSI-PE-0829	34	1	5	1	170	2023-01-01	2	2023-01-01	2023-02-06 09:23:14	0	0000001236		2023-02-06
1458	AGSI-RE-0886	46	1	5	1	230	2023-01-01	2	2023-01-01	2023-02-07 04:59:05	0	0000001237		2023-02-07
1409	AGSI-RE-1420	60	1	5	1	300	2023-01-01	2	2023-01-01	2023-02-07 05:02:53	0	0000001239		2023-02-07
1389	AGSI-D-11629	27	1	5	1	165	2023-01-01	2	2023-01-01	2023-02-07 09:19:12	0	0000001241	ya estaba cancelado pero tubo un error 	2023-02-07
1410	AGSI-D-10408	28	1	5	1	165	2023-01-01	2	2023-01-01	2023-02-08 02:35:10	0	0000001243		2023-02-08
1422	AGSI-D-6150	35	1	5	1	175	2023-01-01	2	2023-01-01	2023-02-08 02:37:35	0	0000001244		2023-02-08
1456	AGSI-PE-0288	24	1	5	1	165	2023-01-01	2	2023-01-01	2023-02-08 06:27:05	0	0000001245		2023-02-08
1431	AGSI-RE-1098	30	1	5	1	165	2023-01-01	2	2023-01-01	2023-02-08 06:30:04	0	0000001247		2023-02-08
1119	AGSI-D- 2796	27	1	5	1	165	2022-11-01	2	2022-11-01	2023-01-09 05:02:01	0	0000001124		2023-01-09
1257	AGSI-D- 2796	27	1	5	1	165	2022-12-01	2	2022-12-01	2023-01-09 05:03:04	0	0000001125		2023-01-09
1294	AGSI-2720	47	1	5	1	235	2022-12-01	2	2022-12-01	2023-01-09 05:16:11	0	0000001127		2023-01-09
1278	AGSI-RE-TRAMITE 741	41	1	5	1	205	2022-12-01	2	2022-12-01	2023-01-10 06:51:00	0	0000001128		2023-01-10
1420	AGSI-PJ-0070	33	1	5	1	165	2023-01-01	2	2023-01-01	2023-06-08 10:41:46	0	0000001723		2023-06-08
1471	AGSI-RE-1011	45	1	5	1	225	2023-02-01	2	2023-01-11	2023-01-11 00:00:00	0	0000001139		\N
1472	AGSI-RE-1011	45	1	5	1	225	2023-03-01	2	2023-01-11	2023-01-11 00:00:00	0	0000001140		\N
1473	AGSI-RE-22326	33	1	5	1	165	2023-02-01	2	2023-01-11	2023-01-11 00:00:00	0	0000001144		\N
1474	AGSI-RE-22326	33	1	5	1	165	2023-03-01	2	2023-01-11	2023-01-11 00:00:00	0	0000001145		\N
1417	Agsi-re-tramite-224466	48	1	5	1	240	2023-01-01	2	2023-01-01	2023-07-27 05:13:22	0	0000001850		2023-07-27
1470	AGSI-RE-1604	50	1	5	1	250	2023-01-01	2	2023-01-01	2023-01-17 02:22:59	0	0000001151		2023-01-17
1349	ADKN-RE-0740	63	1	5	1	315	2022-12-01	2	2022-12-01	2023-01-21 04:40:55	0	0000001168		2023-01-21
1468	ADKN-RE-0740	63	1	5	1	315	2023-01-01	2	2023-01-01	2023-01-21 04:41:57	0	0000001169		2023-01-21
1391	AGSI-D-5814	37	1	5	1	185	2023-01-01	2	2023-01-01	2023-02-19 07:44:10	0	0000001275		2023-02-19
1393	AGSI-RE-0805	72	1	5	1	360	2023-01-01	2	2023-01-01	2023-02-17 04:09:45	0	0000001276		2023-02-17
1394	AGSI-TU-0182	35	1	5	1	175	2023-01-01	2	2023-01-01	2023-02-14 09:21:56	0	0000001277		2023-02-14
1395	AGSI-RE-0661	45	1	5	1	225	2023-01-01	2	2023-01-01	2023-03-02 09:33:31	0	0000001278		2023-03-02
1403	ADKN-D-7303	20	2	5	1	100	2023-01-01	2	2023-01-01	2023-02-16 02:59:04	0	0000001279		2023-02-16
1449	AGSI-RE-1303	63	1	5	1	315	2023-01-01	2	2023-01-01	2023-02-14 09:23:36	0	0000001281		2023-02-14
1411	AGSI-RE-GTRAMITE52	70	1	5	1	350	2023-01-01	2	2023-01-01	2023-02-14 09:34:45	0	0000001282		2023-02-14
1457	AGSI-RE-1349	60	1	5	1	300	2023-01-01	2	2023-01-01	2023-02-16 02:57:07	0	0000001283		2023-02-16
1441	AGSP-PJ-0066	25	1	5	1	165	2023-01-01	2	2023-01-01	2023-02-16 03:01:02	0	0000001284		2023-02-16
1444	AGSI-D-23325	27	1	5	1	165	2023-01-01	2	2023-01-01	2023-02-17 04:59:55	0	0000001285		2023-02-17
1416	AGSI-2720	47	1	5	1	235	2023-01-01	2	2023-01-01	2023-02-22 02:15:03	0	0000001286		2023-02-22
1450	AMSH-RE 0323	62	1	5	1	310	2023-01-01	2	2023-01-01	2023-02-22 02:37:33	0	0000001287		2023-02-22
1452	AGSI-RE-1324	40	1	5	1	200	2023-01-01	2	2023-01-01	2023-02-22 02:38:51	0	0000001288		2023-02-22
1419	ADKN-D-3015	36	1	5	1	180	2023-01-01	2	2023-01-01	2023-02-22 06:29:52	0	0000001288		2023-02-22
1448	AGSI-D-23647	36	1	5	1	180	2023-01-01	2	2023-01-01	2023-02-22 06:32:36	0	0000001289		2023-02-22
1429	CA224625	74	1	5	1	370	2023-01-01	2	2023-01-01	2023-02-23 08:22:48	0	0000001290	el señor retiro la embarcación en diciembre  	2023-02-23
1437	AGSI-D-6032	34	1	5	1	170	2023-01-01	2	2023-01-01	2023-02-23 08:33:24	0	0000001291		2023-02-23
1424	AQYM-D-050	47	1	5	1	235	2023-01-01	2	2023-01-01	2023-02-27 09:23:18	0	0000001292		2023-02-27
1415	ARSH-RE-0016	52	1	5	1	260	2023-01-01	2	2023-01-01	2023-02-28 04:47:29	0	0000001293		2023-02-28
1451	AGSI-RE-1001	54	1	5	1	270	2023-01-01	2	2023-01-01	2023-03-01 08:22:46	0	0000001294		2023-03-01
1440	AGSI-RE-0205	58	1	5	1	290	2023-01-01	2	2023-01-01	2023-03-02 04:02:59	0	0000001295		2023-03-02
1427	AGSI-RE-1176	81	1	5	1	405	2023-01-01	2	2023-01-01	2023-03-03 02:44:45	0	0000001296		2023-03-03
1459	AGSI-RE-1243	53	1	5	1	265	2023-01-01	2	2023-01-01	2023-03-04 01:08:22	0	0000001297		2023-03-04
1476	AGSI-RE-0753	60	1	5	1	300	2023-02-01	2	2023-01-31	2023-01-31 00:00:00	0	0000001177		\N
1453	AGSI-RE-1593	23	2	5	1	115	2023-01-01	2	2023-01-01	2023-01-31 06:37:08	0	0000001184		2023-01-31
1469	AGSP-RE-0587	25	2	5	1	125	2023-01-01	2	2023-01-01	2023-03-15 12:41:46	0	0000001363		2023-03-15
1517	AGSI-PE-0532	24	1	5	1	165	2023-02-01	2	2023-02-01	2023-03-17 02:44:40	0	0000001382		2023-03-17
1516	AGSI-RE-1404	24	2	5	1	120	2023-02-01	2	2023-02-01	2023-03-19 05:13:52	0	0000001388		2023-03-19
1478	AGSI-D-9005	31	1	5	1	165	2023-02-01	2	2023-02-01	2023-03-23 07:40:14	0	0000001411		2023-03-23
1466	AGSI-D-21173	32	1	5	1	165	2023-01-01	2	2023-01-01	2023-04-01 02:37:34	0	0000001447	embarcacion en abandono por mas de 3 años propietarios no responden a los comunicados se le dio desincorporacion 01/04/2023	2023-04-01
1464	AGSP-D-2875	30	2	5	1	150	2023-01-01	2	2023-01-01	2023-05-02 09:21:58	0	0000001602		2023-05-02
1483	ENTRAMITE001	88	1	5	1	440	2023-02-01	0	2023-02-01	2023-02-01 00:00:00	0	0	\N	\N
1509	AGSI-RE-TRAMITE7458	115	1	5	1	575	2023-02-01	0	2023-02-01	2023-02-01 00:00:00	0	0	\N	\N
1497	Agsi-re-0678	42	1	5	1	210	2023-02-01	2	2023-02-01	2023-02-03 09:39:06	0	0000001220		2023-02-03
1496	AGSI-RE-0437	30	1	5	1	165	2023-02-01	2	2023-02-01	2023-02-03 10:05:57	0	0000001231		2023-02-03
1479	AGSI-PE-0816	28	1	5	1	165	2023-02-01	2	2023-02-01	2023-02-06 02:21:30	0	0000001232		2023-02-06
1503	ARSH-PJ-0034	43	1	5	1	215	2023-02-01	2	2023-02-01	2023-02-06 08:12:56	0	0000001233		2023-02-06
1488	AGSI-AUXILIAR	12	2	5	1	60	2023-02-01	2	2023-02-01	2023-02-06 08:16:34	0	0000001234		2023-02-06
1510	AGSI-RE-0575	40	1	5	1	200	2023-02-01	2	2023-02-01	2023-02-06 08:17:34	0	0000001235		2023-02-06
1467	AGSI-RE-0606	32	1	5	1	165	2023-01-01	2	2023-01-01	2023-02-10 07:34:36	0	0000001250		2023-02-10
1495	AGSI-D- 2796	27	1	5	1	165	2023-02-01	2	2023-02-01	2023-02-12 04:08:12	0	0000001257		2023-02-12
1530	AGSI-2221	42	1	5	1	210	2023-02-01	0	2023-02-01	2023-02-01 00:00:00	0	0	\N	\N
1536	AGSI-D-5810	55	1	5	1	275	2023-02-01	0	2023-02-01	2023-02-01 00:00:00	0	0	\N	\N
1546	AGSI-RE-0202	88	1	5	1	440	2023-02-01	0	2023-02-01	2023-02-01 00:00:00	0	0	\N	\N
1550	AGSI-D-11413	32	1	5	1	165	2023-02-01	0	2023-02-01	2023-02-01 00:00:00	0	0	\N	\N
1523	AGSI-RE-GTRAMITE52	70	1	5	1	350	2023-02-01	2	2023-02-01	2023-02-14 09:35:37	0	0000001299		2023-02-14
1515	ADKN-D-7303	20	2	5	1	100	2023-02-01	2	2023-02-01	2023-02-16 03:00:17	0	0000001300		2023-02-16
1502	AGSI-D-5814	37	1	5	1	185	2023-02-01	2	2023-02-01	2023-02-19 07:45:20	0	0000001301		2023-02-19
1518	AGSI-PE-0887	25	1	5	1	165	2023-02-01	2	2023-02-01	2023-02-22 02:30:06	0	0000001302		2023-02-22
1480	AGSI-RE-TRAMITE789	47	1	5	1	235	2023-02-01	2	2023-02-01	2023-02-22 06:28:32	0	0000001303		2023-02-22
1521	AGSI-RE-1420	60	1	5	1	300	2023-02-01	2	2023-02-01	2023-02-27 03:34:43	0	0000001304		2023-02-27
1493	ARSH-D-957	27	1	5	1	165	2023-02-01	2	2023-02-01	2023-02-27 09:19:52	0	0000001305		2023-02-27
1522	AGSI-D-10408	28	1	5	1	165	2023-02-01	2	2023-02-01	2023-03-03 08:40:11	0	0000001307		2023-03-03
1491	AGSI-RE-0268	58	1	5	1	290	2023-02-01	2	2023-02-01	2023-03-04 01:07:36	0	0000001308		2023-03-04
1501	AGSM-D-1776	43	1	5	1	215	2023-02-01	2	2023-02-01	2023-03-04 10:02:19	0	0000001309		2023-03-04
1487	AGSI-RE-TRAMITE 000123	11	2	5	1	55	2023-02-01	2	2023-02-01	2023-06-01 03:23:29	0	0000001675	la embarcación se retiro el 08 de febrero 2023	2023-06-01
1533	AGSI-PJ-0070	33	1	5	1	165	2023-02-01	2	2023-02-01	2023-06-08 10:41:13	0	0000001722		2023-06-08
1494	AGSI-RE-0601	22	2	5	1	110	2023-02-01	2	2023-02-01	2023-03-06 10:02:37	0	0000001338		2023-03-06
1500	AGSI-D-11629	27	1	5	1	165	2023-02-01	2	2023-02-01	2023-03-06 10:03:18	0	0000001339		2023-03-06
1568	AGSI-TU-0058	48	1	5	1	240	2023-02-01	2	2023-02-01	2023-03-06 10:22:35	0	0000001342		2023-03-06
1489	AGSI-re-tramite-098	14	2	5	1	70	2023-02-01	2	2023-02-01	2023-03-09 01:45:13	0	0000001344		2023-03-09
1534	AGSI-RE-1339	47	1	5	1	235	2023-02-01	2	2023-02-01	2023-03-09 01:48:37	0	0000001347		2023-03-09
1557	AGSI-D-23325	27	1	5	1	165	2023-02-01	2	2023-02-01	2023-03-11 04:08:36	0	0000001350		2023-03-11
1498	AGSP-RE-1071	72	1	5	1	360	2023-02-01	2	2023-02-01	2023-03-11 05:12:27	0	0000001352		2023-03-11
1545	AGSI-RE-TRAMI01	28	1	5	1	165	2023-02-01	2	2023-02-01	2023-03-14 12:53:41	0	0000001354	EXONERADA POR EL SEÑOR EDUARDO	2023-03-14
1492	AGSI-PE-0842	24	1	5	1	165	2023-02-01	2	2023-02-01	2023-03-15 01:07:59	0	0000001366		2023-03-15
1485	AGSI-PE-0830	23	1	5	1	165	2023-02-01	2	2023-02-01	2023-03-16 02:01:50	0	0000001368		2023-03-16
1484	AGSI-2927	44	1	5	1	220	2023-02-01	2	2023-02-01	2023-03-16 02:07:04	0	0000001369		2023-03-16
1506	AGSI-TU-0182	35	1	5	1	175	2023-02-01	2	2023-02-01	2023-03-16 02:11:05	0	0000001371		2023-03-16
1511	AGSI-RE-1362	20	2	5	1	100	2023-02-01	2	2023-02-01	2023-03-16 02:14:18	0	0000001374		2023-03-16
1525	AGSP-RE-0514	63	1	5	1	315	2023-02-01	2	2023-02-01	2023-03-17 02:48:19	0	0000001384		2023-03-17
1554	APNN-D-675	35	2	5	1	175	2023-02-01	2	2023-02-01	2023-03-17 02:48:49	0	0000001385		2023-03-17
1512	ARSH-D-2077	80	1	5	1	400	2023-02-01	2	2023-02-01	2023-03-17 07:05:26	0	0000001386		2023-03-17
1535	AGSI-D-6150	35	1	5	1	175	2023-02-01	2	2023-02-01	2023-03-19 05:17:31	0	0000001390		2023-03-19
1499	ARSH-RE-0356	28	2	5	1	140	2023-02-01	2	2023-02-01	2023-03-22 05:02:45	0	0000001407		2023-03-22
1549	AGSI-D-6032	34	1	5	1	170	2023-02-01	2	2023-02-01	2023-03-22 05:03:45	0	0000001408		2023-03-22
1567	AGSI-D-5926	63	1	5	1	315	2023-02-01	2	2023-02-01	2023-03-27 07:31:07	0	0000001420		2023-03-27
1527	ARSH-RE-0016	52	1	5	1	260	2023-02-01	2	2023-02-01	2023-03-30 04:54:01	0	0000001424		2023-03-30
1526	AGSI-PE-0879	29	1	5	1	165	2023-02-01	2	2023-02-01	2023-03-30 05:12:52	0	0000001425		2023-03-30
1544	AGSI-D-22966	58	1	5	1	290	2023-02-01	2	2023-02-01	2023-03-31 05:47:30	0	0000001427		2023-03-31
1543	AGSI-RE-1098	30	1	5	1	165	2023-02-01	2	2023-02-01	2023-03-31 08:47:02	0	0000001440		2023-03-31
1579	AGSI-D-21173	32	1	5	1	165	2023-02-01	2	2023-02-01	2023-04-01 02:37:14	0	0000001446	embarcacion en abandono por mas de 3 años propietarios no responden a los comunicados se le dio desincorporacion 01/04/2023	2023-04-01
1524	AGSI-D-5124	36	1	5	1	180	2023-02-01	2	2023-02-01	2023-04-01 06:08:03	0	0000001470		2023-04-01
1505	AGSI-RE-0805	72	1	5	1	360	2023-02-01	2	2023-02-01	2023-04-04 02:15:30	0	0000001479		2023-04-04
1508	ARSH-D-1448	30	1	5	1	165	2023-02-01	2	2023-02-01	2023-04-04 10:56:27	0	0000001483		2023-04-04
1520	AGSI-D-1648	25	2	5	1	125	2023-02-01	2	2023-02-01	2023-04-12 05:28:23	0	0000001516	se le solicito desalojo por deuda y abandono autorizado por el señor eduardo capriles para exoneracion de deuda 	2023-04-12
1566	AGSI-RE-1593	23	2	5	1	115	2023-02-01	2	2023-02-01	2023-04-15 05:59:10	0	0000001530		2023-04-15
1560	AGSI-D-23005	63	1	5	1	315	2023-02-01	2	2023-02-01	2023-04-15 06:04:51	0	0000001533		2023-04-15
1490	Agsi-re-tramite-3344	11	2	5	1	55	2023-02-01	2	2023-02-01	2023-04-30 03:06:40	0	0000001582		2023-04-30
1541	AGSP-2214	36	1	5	1	180	2023-02-01	2	2023-02-01	2023-05-02 02:04:50	0	0000001583		2023-05-02
1577	AGSP-D-2875	30	2	5	1	150	2023-02-01	2	2023-02-01	2023-05-02 09:22:35	0	0000001603		2023-05-02
1551	AGSM-RE-0620	47	1	5	1	235	2023-02-01	2	2023-02-01	2023-02-01 08:01:35	0	0000001186		2023-02-01
1020	AGSI-TU-0161	45	1	5	1	225	2022-10-01	2	2022-10-01	2023-02-01 08:06:27	0	0000001187	la embarcacion esta solvente hasta septiembre solicito zarpe para puerto la cruz para reparacion y desde entonces no reporto mas pago ( extraoficial se conoce que en propietario viajo a colombia y la embarcacion sigue en puerto la cruz en abandono )	2023-02-01
1141	AGSI-TU-0161	45	1	5	1	225	2022-11-01	2	2022-11-01	2023-02-01 08:06:58	0	0000001188	la embarcacion esta solvente hasta septiembre solicito zarpe para puerto la cruz para reparacion y desde entonces no reporto mas pago ( extraoficial se conoce que en propietario viajo a colombia y la embarcacion sigue en puerto la cruz en abandono )	2023-02-01
1401	AGSI-TU-0161	45	1	5	1	225	2023-01-01	2	2023-01-01	2023-02-01 08:08:37	0	0000001190	la embarcacion esta solvente hasta septiembre solicito zarpe para puerto la cruz para reparacion y desde entonces no reporto mas pago ( extraoficial se conoce que en propietario viajo a colombia y la embarcacion sigue en puerto la cruz en abandono )	2023-02-01
1277	AGSI-TU-0161	45	1	5	1	225	2022-12-01	2	2022-12-01	2023-02-01 08:08:09	0	0000001189	la embarcacion esta solvente hasta septiembre solicito zarpe para puerto la cruz para reparacion y desde entonces no reporto mas pago ( extraoficial se conoce que en propietario viajo a colombia y la embarcacion sigue en puerto la cruz en abandono )	2023-02-01
1513	AGSI-TU-0161	45	1	5	1	225	2023-02-01	2	2023-02-01	2023-02-01 08:09:01	0	0000001191	la embarcacion esta solvente hasta septiembre solicito zarpe para puerto la cruz para reparacion y desde entonces no reporto mas pago ( extraoficial se conoce que en propietario viajo a colombia y la embarcacion sigue en puerto la cruz en abandono )	2023-02-01
1531	AGSI-RE-1072	47	1	5	1	235	2023-02-01	2	2023-02-01	2023-02-02 06:08:27	0	0000001204		2023-02-02
1571	AGSI-RE-0886	46	1	5	1	230	2023-02-01	2	2023-02-01	2023-02-07 05:00:18	0	0000001238		2023-02-07
1569	AGSI-PE-0288	24	1	5	1	165	2023-02-01	2	2023-02-01	2023-02-08 06:27:37	0	0000001246		2023-02-08
1548	AGSI-RE-TRAMITE 456	48	1	5	1	240	2023-02-01	2	2023-02-01	2023-02-11 02:19:02	0	0000001254		2023-02-11
727	AGSI-RE TRAMITE00332211	30	1	5	1	165	2022-08-01	2	2022-08-01	2023-02-01 08:14:02	0	0000001192	el propietario tenia puesto en agua nunca trajo la embarcacion a las instalaciones  cancelo al dia hasta julio 2022 pero a la fecha no cancelo mas 	2023-02-01
850	AGSI-RE TRAMITE00332211	30	1	5	1	165	2022-09-01	2	2022-09-01	2023-02-01 08:14:46	0	0000001193	el propietario tenia puesto en agua nunca trajo la embarcacion a las instalaciones  cancelo al dia hasta julio 2022 pero a la fecha no cancelo mas 	2023-02-01
985	AGSI-RE TRAMITE00332211	30	1	5	1	165	2022-10-01	2	2022-10-01	2023-02-01 08:15:13	0	0000001194	el propietario tenia puesto en agua nunca trajo la embarcacion a las instalaciones  cancelo al dia hasta julio 2022 pero a la fecha no cancelo mas 	2023-02-01
1370	AGSI-RE TRAMITE00332211	30	1	5	1	165	2023-01-01	2	2023-01-01	2023-02-01 08:16:31	0	0000001197	el propietario tenia puesto en agua nunca trajo la embarcacion a las instalaciones  cancelo al dia hasta julio 2022 pero a la fecha no cancelo mas 	2023-02-01
1482	AGSI-RE TRAMITE00332211	30	1	5	1	165	2023-02-01	2	2023-02-01	2023-02-01 08:17:07	0	0000001198	el propietario tenia puesto en agua nunca trajo la embarcacion a las instalaciones  cancelo al dia hasta julio 2022 pero a la fecha no cancelo mas 	2023-02-01
1329	AGSP-1992	43	1	5	1	215	2022-12-01	2	2022-12-01	2023-02-02 06:01:38	0	0000001199	el propietario cancela el mes y notifica que de no poder pagar mas y teniendo el barco inoperativo lo retira de las instalaciones 	2023-02-02
1558	AGSP-1992	43	1	5	1	215	2023-02-01	2	2023-02-01	2023-02-02 06:03:17	0	0000001201	 notifica que de no poder pagar mas y teniendo el barco inoperativo lo retira de las instalaciones se le da salida el dia 02/02/2023	2023-02-02
1241	AGSI-D-9005	31	1	5	1	165	2022-12-01	2	2022-12-01	2023-02-02 06:07:08	0	0000001203		2023-02-02
565	AGSI-RE-0989	24	2	5	1	120	2022-06-01	2	2022-06-01	2023-02-02 06:34:34	0	0000001205	LA EMBARCACION FUE TRASLADADA EN MAYO DEL 2022 PARA PUERTO LA CRUZ Y NO RECRESO EL PROPIETARIO SE LE MANDO MUCHOS COMUNICADOS DE PAGO Y NO PAGO 	2023-02-02
685	AGSI-RE-0989	24	2	5	1	120	2022-07-01	2	2022-07-01	2023-02-02 06:35:17	0	0000001206	LA EMBARCACION FUE TRASLADADA EN MAYO DEL 2022 PARA PUERTO LA CRUZ Y NO RECRESO EL PROPIETARIO SE LE MANDO MUCHOS COMUNICADOS DE PAGO Y NO PAGO 	2023-02-02
805	AGSI-RE-0989	24	2	5	1	120	2022-08-01	2	2022-08-01	2023-02-02 06:35:42	0	0000001207	LA EMBARCACION FUE TRASLADADA EN MAYO DEL 2022 PARA PUERTO LA CRUZ Y NO RECRESO EL PROPIETARIO SE LE MANDO MUCHOS COMUNICADOS DE PAGO Y NO PAGO 	2023-02-02
1570	AGSI-RE-1349	60	1	5	1	300	2023-02-01	2	2023-02-01	2023-02-16 02:58:10	0	0000001311		2023-02-16
1553	AGSP-PJ-0066	25	1	5	1	165	2023-02-01	2	2023-02-01	2023-02-16 03:02:16	0	0000001312		2023-02-16
1563	AMSH-RE 0323	62	1	5	1	310	2023-02-01	2	2023-02-01	2023-02-22 02:38:21	0	0000001313		2023-02-22
1565	AGSI-RE-1324	40	1	5	1	200	2023-02-01	2	2023-02-01	2023-02-22 02:39:26	0	0000001314		2023-02-22
1532	ADKN-D-3015	36	1	5	1	180	2023-02-01	2	2023-02-01	2023-02-22 06:30:53	0	0000001315		2023-02-22
1561	AGSI-D-23647	36	1	5	1	180	2023-02-01	2	2023-02-01	2023-02-22 06:33:16	0	0000001316		2023-02-22
1573	AGSI-TU-0072	14	2	5	1	70	2023-02-01	2	2023-02-01	2023-02-23 05:58:01	0	0000001317		2023-02-23
1542	CA224625	74	1	5	1	370	2023-02-01	2	2023-02-01	2023-02-23 08:23:07	0	0000001318	el señor retiro la embarcación en diciembre  	2023-02-23
1555	AGSI-RE-0891	32	1	5	1	165	2023-02-01	2	2023-02-01	2023-02-24 06:09:38	0	0000001319		2023-02-24
1537	AQYM-D-050	47	1	5	1	235	2023-02-01	2	2023-02-01	2023-02-27 09:23:58	0	0000001320		2023-02-27
1540	AGSI-RE-1176	81	1	5	1	405	2023-02-01	2	2023-02-01	2023-03-03 02:45:43	0	0000001321		2023-03-03
1552	AGSI-RE-0205	58	1	5	1	290	2023-02-01	2	2023-02-01	2023-03-04 01:05:24	0	0000001322		2023-03-04
1572	AGSI-RE-1243	53	1	5	1	265	2023-02-01	2	2023-02-01	2023-03-04 01:09:41	0	0000001323		2023-03-04
927	AGSI-RE-0989	24	2	5	1	120	2022-09-01	2	2022-09-01	2023-02-02 06:36:06	0	0000001208	LA EMBARCACION FUE TRASLADADA EN MAYO DEL 2022 PARA PUERTO LA CRUZ Y NO RECRESO EL PROPIETARIO SE LE MANDO MUCHOS COMUNICADOS DE PAGO Y NO PAGO 	2023-02-02
1061	AGSI-RE-0989	24	2	5	1	120	2022-10-01	2	2022-10-01	2023-02-02 06:36:37	0	0000001209	LA EMBARCACION FUE TRASLADADA EN MAYO DEL 2022 PARA PUERTO LA CRUZ Y NO RECRESO EL PROPIETARIO SE LE MANDO MUCHOS COMUNICADOS DE PAGO Y NO PAGO 	2023-02-02
1182	AGSI-RE-0989	24	2	5	1	120	2022-11-01	2	2022-11-01	2023-02-02 06:37:02	0	0000001210	LA EMBARCACION FUE TRASLADADA EN MAYO DEL 2022 PARA PUERTO LA CRUZ Y NO RECRESO EL PROPIETARIO SE LE MANDO MUCHOS COMUNICADOS DE PAGO Y NO PAGO 	2023-02-02
1583	AGSI-RE-1604	50	1	5	1	250	2023-02-01	2	2023-02-01	2023-03-16 02:18:33	0	0000001377		2023-03-16
1580	AGSI-RE-0606	32	1	5	1	165	2023-02-01	2	2023-02-01	2023-03-22 04:17:41	0	0000001404		2023-03-22
1634	AGSI-PE-0887	25	1	5	1	165	2023-03-01	2	2023-03-01	2023-04-11 02:07:18	0	0000001491		2023-04-11
1581	ADKN-RE-0740	63	1	5	1	315	2023-02-01	2	2023-02-01	2023-04-12 10:21:04	0	0000001519		2023-04-12
1435	AGSI-RE-0989	24	2	5	1	120	2023-01-01	2	2023-01-01	2023-02-02 06:37:56	0	0000001212	LA EMBARCACION FUE TRASLADADA EN MAYO DEL 2022 PARA PUERTO LA CRUZ Y NO RECRESO EL PROPIETARIO SE LE MANDO MUCHOS COMUNICADOS DE PAGO Y NO PAGO 	2023-02-02
1547	AGSI-RE-0989	24	2	5	1	120	2023-02-01	2	2023-02-01	2023-02-02 06:38:40	0	0000001213	LA EMBARCACION FUE TRASLADADA EN MAYO DEL 2022 PARA PUERTO LA CRUZ Y NO RECRESO EL PROPIETARIO SE LE MANDO MUCHOS COMUNICADOS DE PAGO Y NO PAGO 	2023-02-02
1387	AGSP-RE-1071	72	1	5	1	360	2023-01-01	2	2023-01-01	2023-02-03 06:01:19	0	0000001214		2023-02-03
1584	Agsi-re-0678	42	1	5	1	210	2023-03-01	2	2023-02-03	2023-02-03 00:00:00	0	0000001221		\N
1585	Agsi-re-0678	42	1	5	1	210	2023-04-01	2	2023-02-03	2023-02-03 00:00:00	0	0000001222		\N
1586	Agsi-re-0678	42	1	5	1	210	2023-05-01	2	2023-02-03	2023-02-03 09:47:05	0	0000001224		2023-02-03
1340	AGSI-RE-1243	53	1	5	1	265	2022-12-01	2	2022-12-01	2023-02-03 10:02:12	0	0000001229		2023-02-03
1262	AGSI-D-11629	27	1	5	1	165	2022-12-01	2	2022-12-01	2023-02-07 09:18:42	0	0000001240	ya estaba cancelado pero tubo un error 	2023-02-07
1183	AGSI-RE-TRAMITE 456	48	1	5	1	240	2022-11-01	2	2022-11-01	2023-02-11 02:13:18	0	0000001251		2023-02-11
1436	AGSI-RE-TRAMITE 456	48	1	5	1	240	2023-01-01	2	2023-01-01	2023-02-11 02:15:36	0	0000001253		2023-02-11
1600	ENTRAMITE001	88	1	5	1	440	2023-03-01	0	2023-03-01	2023-03-01 00:00:00	0	0	\N	\N
1608	AGSI-RE-0268	58	1	5	1	290	2023-03-01	0	2023-03-01	2023-03-01 00:00:00	0	0	\N	\N
1613	AGSI-RE-0437	30	1	5	1	165	2023-03-01	0	2023-03-01	2023-03-01 00:00:00	0	0	\N	\N
1618	DL1324AC	73	1	5	1	365	2023-03-01	0	2023-03-01	2023-03-01 00:00:00	0	0	\N	\N
1626	AGSI-RE-TRAMITE7458	115	1	5	1	575	2023-03-01	0	2023-03-01	2023-03-01 00:00:00	0	0	\N	\N
1248	AGSI-RE-TRAMITE 000123	11	2	5	1	55	2022-12-01	2	2022-12-01	2023-02-22 06:47:52	0	0000001259		2023-02-22
1406	AGSI-PE-0887	25	1	5	1	165	2023-01-01	2	2023-01-01	2023-02-22 02:29:17	0	0000001280		2023-02-22
1589	AGSI-RE-0544	33	2	5	1	165	2022-04-01	2	2023-02-13	2023-02-13 00:00:00	0	0000001324		\N
1590	AGSI-RE-0544	33	2	5	1	165	2022-05-01	2	2023-02-13	2023-02-13 00:00:00	0	0000001325		\N
1481	AGSI-D-5535	42	1	5	1	210	2023-02-01	2	2023-02-01	2023-02-22 02:30:35	0	0000001326		2023-02-22
1576	AGSI-1444	42	2	5	1	210	2023-02-01	2	2023-02-01	2023-02-23 08:23:47	0	0000001328	el señor retiro la embarcación en diciembre  	2023-02-23
1593	AGSI-RE-0891	32	1	5	1	165	2023-03-01	2	2023-02-24	2023-02-24 00:00:00	0	0000001329		\N
1630	AGSI-RE-TRAMITE 741	41	1	5	1	205	2023-03-01	2	2023-03-01	2023-05-19 06:48:56	0	0000001651		2023-05-19
1598	AGSI-RE-TRAMITE789	47	1	5	1	235	2023-03-01	2	2023-03-01	2023-05-24 02:39:35	0	0000001654		2023-05-24
1633	AGSI-PE-0532	24	1	5	1	165	2023-03-01	2	2023-03-01	2023-05-24 02:59:48	0	0000001657		2023-05-24
1617	AGSM-D-1776	43	1	5	1	215	2023-03-01	2	2023-03-01	2023-06-09 06:41:32	0	0000001725		2023-06-09
1594	AGSI-RE-1072	47	1	5	1	235	2023-03-01	2	2023-02-27	2023-02-27 00:00:00	0	0000001330		\N
1475	AGSI-RE-1264	36	2	5	1	180	2023-01-20	2	2023-01-20	2023-02-27 08:47:27	0	0000001331	EL SEÑOR PAGO LOS DIAS DE ENERO MAS EL SISTEMA LO TOMA LOS 30 DIAS COMPLETOS 	2023-02-27
1597	AGSI-PE-0816	28	1	5	1	165	2023-03-01	2	2023-03-01	2023-03-11 05:10:23	0	0000001351		2023-03-11
1609	AGSI-PE-0842	24	1	5	1	165	2023-03-01	2	2023-03-01	2023-03-15 01:09:14	0	0000001367		2023-03-15
1623	AGSI-TU-0182	35	1	5	1	175	2023-03-01	2	2023-03-01	2023-03-16 02:11:35	0	0000001372		2023-03-16
1628	AGSI-RE-1362	20	2	5	1	100	2023-03-01	2	2023-03-01	2023-03-16 02:15:06	0	0000001375		2023-03-16
1605	AGSI-AUXILIAR	12	2	5	1	60	2023-03-01	2	2023-03-01	2023-03-16 02:25:20	0	0000001379		2023-03-16
1627	AGSI-RE-0575	40	1	5	1	200	2023-03-01	2	2023-03-01	2023-03-16 02:26:07	0	0000001380		2023-03-16
1632	AGSI-RE-1404	24	2	5	1	120	2023-03-01	2	2023-03-01	2023-03-19 05:13:17	0	0000001387		2023-03-19
1612	AGSI-D- 2796	27	1	5	1	165	2023-03-01	2	2023-03-01	2023-03-19 05:14:58	0	0000001389		2023-03-19
1603	AGSI-RE-1239	44	1	5	1	220	2023-03-01	2	2023-03-01	2023-03-24 04:31:10	0	0000001412		2023-03-24
1615	ARSH-RE-0356	28	2	5	1	140	2023-03-01	2	2023-03-01	2023-03-27 04:06:31	0	0000001415	el propietario se le pidio desalojo de la marina el dia 20 de marzo la cual cumplio el diia 25 de marzo 	2023-03-27
1602	AGSI-PE-0830	23	1	5	1	165	2023-03-01	2	2023-03-01	2023-03-29 03:39:05	0	0000001423		2023-03-29
1614	AGSP-RE-1071	72	1	5	1	360	2023-03-01	2	2023-03-01	2023-03-31 10:14:49	0	0000001441		2023-03-31
1638	AGSI-D-10408	28	1	5	1	165	2023-03-01	2	2023-03-01	2023-03-31 10:53:36	0	0000001442	se le solicito desalojo de la marina el dia 30 de marzo	2023-03-31
1640	AGSI-D-5124	36	1	5	1	180	2023-03-01	2	2023-03-01	2023-04-01 06:09:26	0	0000001471		2023-04-01
1629	ARSH-D-2077	80	1	5	1	400	2023-03-01	2	2023-03-01	2023-04-01 06:10:58	0	0000001472		2023-04-01
1625	ARSH-D-1448	30	1	5	1	165	2023-03-01	2	2023-03-01	2023-04-04 10:57:45	0	0000001484		2023-04-04
1601	AGSI-2927	44	1	5	1	220	2023-03-01	2	2023-03-01	2023-04-05 05:07:59	0	0000001485		2023-04-05
1644	AGSI-2720	47	1	5	1	235	2023-03-01	2	2023-03-01	2023-04-05 05:09:39	0	0000001486		2023-04-05
1619	AGSI-D-5814	37	1	5	1	185	2023-03-01	2	2023-03-01	2023-04-05 08:04:13	0	0000001487		2023-04-05
1599	AGSI-D-5535	42	1	5	1	210	2023-03-01	2	2023-03-01	2023-04-06 04:16:42	0	0000001488		2023-04-06
1642	AGSI-PE-0879	29	1	5	1	165	2023-03-01	2	2023-03-01	2023-04-08 04:07:29	0	0000001489		2023-04-08
1616	AGSI-D-11629	27	1	5	1	165	2023-03-01	2	2023-03-01	2023-04-18 02:39:05	0	0000001542		2023-04-18
1637	AGSI-RE-1420	60	1	5	1	300	2023-03-01	2	2023-03-01	2023-04-11 09:18:32	0	0000001502		2023-04-11
1641	AGSP-RE-0514	63	1	5	1	315	2023-03-01	2	2023-03-01	2023-04-14 10:25:30	0	0000001524		2023-04-14
1631	ADKN-D-7303	20	2	5	1	100	2023-03-01	2	2023-03-01	2023-04-17 08:24:00	0	0000001537		2023-04-17
1591	AGSI-RE-1264	36	2	5	1	180	2023-02-20	2	2023-02-20	2023-04-25 06:14:37	0	0000001570		2023-04-25
1607	Agsi-re-tramite-3344	11	2	5	1	55	2023-03-01	2	2023-03-01	2023-05-02 02:14:13	0	0000001586		2023-05-02
1596	AGSI-D-9005	31	1	5	1	165	2023-03-01	2	2023-03-01	2023-05-06 06:45:04	0	0000001618		2023-05-06
1645	Agsi-re-tramite-224466	48	1	5	1	240	2023-03-01	0	2023-03-01	2023-03-01 00:00:00	0	0	\N	\N
1646	AGSI-2221	42	1	5	1	210	2023-03-01	0	2023-03-01	2023-03-01 00:00:00	0	0	\N	\N
1651	AGSI-D-5810	55	1	5	1	275	2023-03-01	0	2023-03-01	2023-03-01 00:00:00	0	0	\N	\N
1661	AGSI-RE-0202	88	1	5	1	440	2023-03-01	0	2023-03-01	2023-03-01 00:00:00	0	0	\N	\N
1665	AGSI-D-11413	32	1	5	1	165	2023-03-01	0	2023-03-01	2023-03-01 00:00:00	0	0	\N	\N
1667	AGSI-RE-0205	58	1	5	1	290	2023-03-01	0	2023-03-01	2023-03-01 00:00:00	0	0	\N	\N
1685	AGSI-RE-1243	53	1	5	1	265	2023-03-01	0	2023-03-01	2023-03-01 00:00:00	0	0	\N	\N
1588	AGSI-RE-0544	33	2	2	1	165	2022-03-01	2	2023-02-13	2023-02-13 00:00:00	0	0	\N	\N
1242	AGSI-RE-TRAMITE789	47	1	5	1	235	2022-12-01	2	2022-12-01	2023-02-22 06:26:46	0	0000001258		2023-02-22
1293	ARSH-RE-0016	52	1	5	1	260	2022-12-01	2	2022-12-01	2023-02-28 04:46:30	0	0000001263		2023-02-28
1365	AGSM-RE-0897	50	1	5	1	250	2023-01-01	2	2023-01-01	2023-03-02 04:10:24	0	0000001267		2023-03-02
1366	AGSI-D-9005	31	1	5	1	165	2023-01-01	2	2023-01-01	2023-02-27 08:39:18	0	0000001268		2023-02-27
1390	AGSM-D-1776	43	1	5	1	215	2023-01-01	2	2023-01-01	2023-03-04 10:01:19	0	0000001274		2023-03-04
1486	AGSI-RE-1239	44	1	5	1	220	2023-02-01	2	2023-02-01	2023-02-14 09:33:11	0	0000001298		2023-02-14
1507	AGSI-RE-0661	45	1	5	1	225	2023-02-01	2	2023-02-01	2023-03-02 09:34:01	0	0000001306		2023-03-02
1562	AGSI-RE-1303	63	1	5	1	315	2023-02-01	2	2023-02-01	2023-02-14 09:24:07	0	0000001310		2023-02-14
1463	AGSI-1444	42	2	5	1	210	2023-01-01	2	2023-01-01	2023-02-23 08:23:28	0	0000001327	el señor retiro la embarcación en diciembre  	2023-02-23
1666	AGSM-RE-0620	47	1	5	1	235	2023-03-01	2	2023-03-01	2023-03-01 06:18:54	0	0000001333		2023-03-01
1620	ARSH-PJ-0034	43	1	5	1	215	2023-03-01	2	2023-03-01	2023-03-02 04:08:00	0	0000001334		2023-03-02
1624	AGSI-RE-0661	45	1	5	1	225	2023-03-01	2	2023-03-01	2023-03-02 09:34:51	0	0000001332		2023-03-02
1425	ARSH-D-1850	85	1	5	1	425	2023-01-01	2	2023-01-01	2023-03-06 09:58:21	0	0000001335		2023-03-06
1538	ARSH-D-1850	85	1	5	1	425	2023-02-01	2	2023-02-01	2023-03-06 09:58:56	0	0000001336		2023-03-06
1653	ARSH-D-1850	85	1	5	1	425	2023-03-01	2	2023-03-01	2023-03-06 09:59:28	0	0000001337		2023-03-06
1477	AGSM-RE-0897	50	1	5	1	250	2023-02-01	2	2023-02-01	2023-03-06 10:04:15	0	0000001340		2023-03-06
1595	AGSM-RE-0897	50	1	5	1	250	2023-03-01	2	2023-03-01	2023-03-06 10:05:20	0	0000001341		2023-03-06
1606	AGSI-re-tramite-098	14	2	5	1	70	2023-03-01	2	2023-03-01	2023-03-09 01:44:43	0	0000001343		2023-03-09
1649	AGSI-RE-1339	47	1	5	1	235	2023-03-01	2	2023-03-01	2023-03-09 01:46:27	0	0000001346		2023-03-09
1559	AGSI-PE-0829	34	1	5	1	170	2023-02-01	2	2023-02-01	2023-03-09 01:51:49	0	0000001349		2023-03-09
1660	AGSI-RE-TRAMI01	28	1	5	1	165	2023-03-01	2	2023-03-01	2023-03-14 12:53:13	0	0000001353	EXONERADA POR EL SEÑOR EDUARDO	2023-03-14
1316	AGSI-RE-TRAMI01	28	1	5	1	165	2022-12-01	2	2022-12-01	2023-03-14 12:54:24	0	0000001356	EXONERADA POR EL SEÑOR EDUARDO	2023-03-14
1643	ARSH-RE-0016	52	1	5	1	260	2023-03-01	2	2023-03-01	2023-05-17 08:26:53	0	0000001642		2023-05-17
1663	AGSI-RE-TRAMITE 456	48	1	5	1	240	2023-03-01	2	2023-03-01	2023-05-19 06:45:21	0	0000001649		2023-05-19
1647	ADKN-D-3015	36	1	5	1	180	2023-03-01	2	2023-03-01	2023-05-24 02:49:08	0	0000001655		2023-05-24
1648	AGSI-PJ-0070	33	1	5	1	165	2023-03-01	2	2023-03-01	2023-06-08 10:40:26	0	0000001721		2023-06-08
1674	AGSI-D-23647	36	1	5	1	180	2023-03-01	2	2023-03-01	2023-06-20 03:17:58	0	0000001741		2023-06-20
1180	AGSI-RE-TRAMI01	28	1	5	1	165	2022-11-01	2	2022-11-01	2023-03-14 12:54:55	0	0000001357	EXONERADA POR EL SEÑOR EDUARDO	2023-03-14
1695	AGSI-RE-1604	50	1	5	1	250	2023-03-01	2	2023-03-01	2023-03-16 02:21:42	0	0000001378		2023-03-16
1694	AGSP-RE-0587	25	2	5	1	125	2023-03-01	2	2023-03-01	2023-03-17 02:47:23	0	0000001383		2023-03-17
1654	AGSI-D-4396	62	1	5	1	310	2023-03-01	2	2023-03-01	2023-03-20 05:35:36	0	0000001392	se desincorporar por orden de la directiva 	2023-03-20
1652	AQYM-D-050	47	1	5	1	235	2023-03-01	2	2023-03-01	2023-03-20 06:27:27	0	0000001403		2023-03-20
1692	AGSI-RE-0606	32	1	5	1	165	2023-03-01	2	2023-03-01	2023-03-22 04:20:14	0	0000001405		2023-03-22
1681	AGSI-TU-0058	48	1	5	1	240	2023-03-01	2	2023-03-01	2023-03-23 07:36:09	0	0000001410		2023-03-23
1686	AGSI-TU-0072	14	2	5	1	70	2023-03-01	2	2023-03-01	2023-03-24 04:54:18	0	0000001414		2023-03-24
1655	AGSI-RE-1176	81	1	5	1	405	2023-03-01	2	2023-03-01	2023-03-28 09:18:46	0	0000001422		2023-03-28
1659	AGSI-D-22966	58	1	5	1	290	2023-03-01	2	2023-03-01	2023-03-31 05:48:04	0	0000001428		2023-03-31
1691	AGSI-D-21173	32	1	5	1	165	2023-03-01	2	2023-03-01	2023-04-01 02:36:55	0	0000001445	embarcacion en abandono por mas de 3 años propietarios no responden a los comunicados se le dio desincorporacion 01/04/2023	2023-04-01
1677	AGSI-RE-1001	54	1	5	1	270	2023-03-01	2	2023-03-01	2023-04-01 02:49:53	0	0000001461		2023-04-01
1684	AGSI-RE-0886	46	1	5	1	230	2023-03-01	2	2023-03-01	2023-04-03 04:17:36	0	0000001476		2023-04-03
1672	AGSI-PE-0829	34	1	5	1	170	2023-03-01	2	2023-03-01	2023-04-11 02:08:49	0	0000001492		2023-04-11
1682	AGSI-PE-0288	24	1	5	1	165	2023-03-01	2	2023-03-01	2023-04-12 03:32:09	0	0000001504	se le solicito desalojo en el mes de marzo y no pudo retirar hasta el dia 12 de abril   	2023-04-12
1693	ADKN-RE-0740	63	1	5	1	315	2023-03-01	2	2023-03-01	2023-04-12 10:21:27	0	0000001520		2023-04-12
1675	AGSI-RE-1303	63	1	5	1	315	2023-03-01	2	2023-03-01	2023-04-13 07:50:35	0	0000001522		2023-04-12
1658	AGSI-RE-1098	30	1	5	1	165	2023-03-01	2	2023-03-01	2023-04-15 02:43:25	0	0000001528		2023-04-15
1671	AGSI-D-23325	27	1	5	1	165	2023-03-01	2	2023-03-01	2023-04-15 04:38:25	0	0000001529		2023-04-15
1679	AGSI-RE-1593	23	2	5	1	115	2023-03-01	2	2023-03-01	2023-04-15 06:00:30	0	0000001531		2023-04-15
1673	AGSI-D-23005	63	1	5	1	315	2023-03-01	2	2023-03-01	2023-04-15 06:05:37	0	0000001534		2023-04-15
1683	AGSI-RE-1349	60	1	5	1	300	2023-03-01	2	2023-03-01	2023-04-17 08:22:53	0	0000001535		2023-04-17
1668	AGSP-PJ-0066	25	1	5	1	165	2023-03-01	2	2023-03-01	2023-04-17 08:24:56	0	0000001539		2023-04-17
1657	AGSI-RE-0753	60	1	5	1	300	2023-03-01	2	2023-03-01	2023-04-21 10:01:13	0	0000001563		2023-04-21
1656	AGSP-2214	36	1	5	1	180	2023-03-01	2	2023-03-01	2023-05-02 02:05:39	0	0000001584		2023-05-02
1689	AGSP-D-2875	30	2	5	1	150	2023-03-01	2	2023-03-01	2023-05-02 09:23:02	0	0000001604		2023-05-02
1676	AMSH-RE 0323	62	1	5	1	310	2023-03-01	2	2023-03-01	2023-05-05 02:54:55	0	0000001611		2023-05-05
1678	AGSI-RE-1324	40	1	5	1	200	2023-03-01	2	2023-03-01	2023-05-05 02:57:04	0	0000001613		2023-05-05
1059	AGSI-RE-TRAMI01	28	1	5	1	165	2022-10-01	2	2022-10-01	2023-03-14 12:55:15	0	0000001358	EXONERADA POR EL SEÑOR EDUARDO	2023-03-14
925	AGSI-RE-TRAMI01	28	1	5	1	165	2022-09-01	2	2022-09-01	2023-03-14 12:55:33	0	0000001359	EXONERADA POR EL SEÑOR EDUARDO	2023-03-14
803	AGSI-RE-TRAMI01	28	1	5	1	165	2022-08-01	2	2022-08-01	2023-03-14 12:55:51	0	0000001360	EXONERADA POR EL SEÑOR EDUARDO	2023-03-14
683	AGSI-RE-TRAMI01	28	1	5	1	165	2022-07-01	2	2022-07-01	2023-03-14 12:56:09	0	0000001361	EXONERADA POR EL SEÑOR EDUARDO	2023-03-14
563	AGSI-RE-TRAMI01	28	1	5	1	165	2022-06-01	2	2022-06-01	2023-03-14 12:56:27	0	0000001362	EXONERADA POR EL SEÑOR EDUARDO	2023-03-14
1582	AGSP-RE-0587	25	2	5	1	125	2023-02-01	2	2023-02-01	2023-03-15 12:42:55	0	0000001364		2023-03-15
1528	AGSI-2720	47	1	5	1	235	2023-02-01	2	2023-02-01	2023-03-16 02:09:08	0	0000001370	ABONO DE 5 $	2023-03-16
1696	AGSI-RE-1362	20	2	5	1	100	2023-04-01	2	2023-03-16	2023-03-16 00:00:00	0	0000001376		\N
1405	AGSI-PE-0532	24	1	5	1	165	2023-01-01	2	2023-01-01	2023-03-17 02:43:31	0	0000001381		2023-03-17
1650	AGSI-D-6150	35	1	5	1	175	2023-03-01	2	2023-03-01	2023-03-19 05:18:33	0	0000001391		2023-03-19
1539	AGSI-D-4396	62	1	5	1	310	2023-02-01	2	2023-02-01	2023-03-20 05:37:15	0	0000001393	se desincorporar por orden de la directiva 	2023-03-20
1307	AGSI-D-4396	62	1	5	1	310	2022-12-01	2	2022-12-01	2023-03-20 05:38:27	0	0000001395	se desincorporar por orden de la directiva 	2023-03-20
1171	AGSI-D-4396	62	1	5	1	310	2022-11-01	2	2022-11-01	2023-03-20 05:38:56	0	0000001396	se desincorporar por orden de la directiva 	2023-03-20
1050	AGSI-D-4396	62	1	5	1	310	2022-10-01	2	2022-10-01	2023-03-20 05:39:19	0	0000001397	se desincorporar por orden de la directiva 	2023-03-20
434	AGSI-D-4396	62	1	5	1	310	2022-05-01	2	2022-05-01	2023-03-20 05:43:25	0	0000001402	se desincorporar por orden de la directiva 	2023-03-20
1697	AGSI-RE-1674	36	2	5	1	180	2023-03-20	2	2023-03-20	2023-03-23 07:24:14	0	0000001409		2023-03-23
1639	AGSI-RE-GTRAMITE52	70	1	5	1	350	2023-03-01	2	2023-03-01	2023-03-24 04:32:25	0	0000001413		2023-03-24
1680	AGSI-D-5926	63	1	5	1	315	2023-03-01	2	2023-03-01	2023-03-27 07:31:51	0	0000001421		2023-03-27
1611	AGSI-RE-0601	22	2	5	1	110	2023-03-01	2	2023-03-01	2023-03-31 04:18:03	0	0000001426		2023-03-31
1578	ARSK-D-1085	35	2	5	1	175	2023-02-01	2	2023-02-01	2023-03-31 05:51:24	0	0000001430	autorizado por la directiva el día 28/03/2023 y se le solicito de desalojo de las instalaciones 	2023-03-31
1690	ARSK-D-1085	35	2	5	1	175	2023-03-01	2	2023-03-01	2023-03-31 05:51:49	0	0000001431	autorizado por la directiva el día 28/03/2023 y se le solicito de desalojo de las instalaciones 	2023-03-31
1465	ARSK-D-1085	35	2	5	1	175	2023-01-01	2	2023-01-01	2023-03-31 05:52:05	0	0000001432	autorizado por la directiva el día 28/03/2023 y se le solicito de desalojo de las instalaciones 	2023-03-31
1345	ARSK-D-1085	35	2	5	1	175	2022-12-01	2	2022-12-01	2023-03-31 05:52:31	0	0000001433	autorizado por la directiva el día 28/03/2023 y se le solicito de desalojo de las instalaciones 	2023-03-31
1211	ARSK-D-1085	35	2	5	1	175	2022-11-01	2	2022-11-01	2023-03-31 05:52:53	0	0000001434	autorizado por la directiva el día 28/03/2023 y se le solicito de desalojo de las instalaciones 	2023-03-31
955	ARSK-D-1085	35	2	5	1	175	2022-09-01	2	2022-09-01	2023-03-31 05:53:29	0	0000001436	autorizado por la directiva el día 28/03/2023 y se le solicito de desalojo de las instalaciones 	2023-03-31
836	ARSK-D-1085	35	2	5	1	175	2022-08-01	2	2022-08-01	2023-03-31 05:53:48	0	0000001437	autorizado por la directiva el día 28/03/2023 y se le solicito de desalojo de las instalaciones 	2023-03-31
716	ARSK-D-1085	35	2	5	1	175	2022-07-01	2	2022-07-01	2023-03-31 05:54:19	0	0000001438	autorizado por la directiva el día 28/03/2023 y se le solicito de desalojo de las instalaciones 	2023-03-31
596	ARSK-D-1085	35	2	5	1	175	2022-06-01	2	2022-06-01	2023-03-31 05:54:35	0	0000001439	autorizado por la directiva el día 28/03/2023 y se le solicito de desalojo de las instalaciones 	2023-03-31
1706	ENTRAMITE001	88	1	5	1	440	2023-04-01	0	2023-04-01	2023-04-01 00:00:00	0	0	\N	\N
1714	AGSI-RE-0268	58	1	5	1	290	2023-04-01	0	2023-04-01	2023-04-01 00:00:00	0	0	\N	\N
1715	AGSI-PE-0842	24	1	5	1	165	2023-04-01	0	2023-04-01	2023-04-01 00:00:00	0	0	\N	\N
1719	AGSI-RE-0437	30	1	5	1	165	2023-04-01	0	2023-04-01	2023-04-01 00:00:00	0	0	\N	\N
1723	DL1324AC	73	1	5	1	365	2023-04-01	0	2023-04-01	2023-04-01 00:00:00	0	0	\N	\N
1717	AGSI-RE-22326	33	1	5	1	165	2023-04-01	2	2023-04-01	2023-04-01 03:53:12	0	0000001467		2023-04-01
1725	ARSH-PJ-0034	43	1	5	1	215	2023-04-01	2	2023-04-01	2023-04-03 04:58:52	0	0000001478		2023-04-03
1703	AGSI-PE-0816	28	1	5	1	165	2023-04-01	2	2023-04-01	2023-04-04 03:02:57	0	0000001481		2023-04-04
1709	AGSI-RE-1239	44	1	5	1	220	2023-04-01	2	2023-04-01	2023-04-11 08:53:51	0	0000001500		2023-04-11
1730	ARSH-D-1448	30	1	5	1	165	2023-04-01	0	2023-04-01	2023-04-05 05:04:24	0	0000001485		2023-04-04
1711	AGSI-AUXILIAR	12	2	5	1	60	2023-04-01	2	2023-04-01	2023-04-21 03:59:29	0	0000001546		2023-04-21
1758	ARSH-D-1850	85	1	5	1	425	2023-04-01	2	2023-04-01	2023-04-27 08:15:01	0	0000001575		2023-04-27
1713	Agsi-re-tramite-3344	11	2	5	1	55	2023-04-01	2	2023-04-01	2023-07-30 04:27:25	0	0000001871		2023-07-30
1700	AGSM-RE-0897	50	1	5	1	250	2023-04-01	2	2023-04-01	2023-04-24 05:07:31	0	0000001567	la embarcación se retiro por que el propietario cambio de lancha para una mas grande 	2023-04-24
1698	AGSI-RE-1264	36	2	5	1	180	2023-03-20	2	2023-03-20	2023-04-25 06:15:22	0	0000001571		2023-04-25
1728	AGSI-TU-0182	35	1	5	1	175	2023-04-01	2	2023-04-01	2023-04-30 03:04:29	0	0000001580		2023-04-30
1708	AGSI-PE-0830	23	1	5	1	165	2023-04-01	2	2023-04-01	2023-05-06 06:43:17	0	0000001617		2023-05-06
1729	AGSI-RE-0661	45	1	5	1	225	2023-04-01	2	2023-04-01	2023-05-09 12:02:20	0	0000001622		2023-05-09
1731	AGSI-RE-TRAMITE7458	115	1	5	1	575	2023-04-01	0	2023-04-01	2023-04-01 00:00:00	0	0	\N	\N
1749	Agsi-re-tramite-224466	48	1	5	1	240	2023-04-01	0	2023-04-01	2023-04-01 00:00:00	0	0	\N	\N
1750	AGSI-2221	42	1	5	1	210	2023-04-01	0	2023-04-01	2023-04-01 00:00:00	0	0	\N	\N
1755	AGSI-D-5810	55	1	5	1	275	2023-04-01	0	2023-04-01	2023-04-01 00:00:00	0	0	\N	\N
1764	AGSI-RE-0202	88	1	5	1	440	2023-04-01	0	2023-04-01	2023-04-01 00:00:00	0	0	\N	\N
1768	AGSI-D-11413	32	1	5	1	165	2023-04-01	0	2023-04-01	2023-04-01 00:00:00	0	0	\N	\N
1770	AGSI-RE-0205	58	1	5	1	290	2023-04-01	0	2023-04-01	2023-04-01 00:00:00	0	0	\N	\N
1788	AGSI-RE-1243	53	1	5	1	265	2023-04-01	0	2023-04-01	2023-04-01 00:00:00	0	0	\N	\N
346	AGSI-D-5926	63	1	5	1	315	2022-04-01	2	2022-04-01	2023-04-01 02:34:05	0	0000001443		2023-04-01
1742	AGSI-D-10408	28	1	5	1	165	2023-04-01	2	2023-04-01	2023-04-01 06:16:09	0	0000001473	el sistema le sumo abril y la embarcación salió en marzo	2023-04-01
1212	AGSI-D-21173	32	1	5	1	165	2022-11-01	2	2022-11-01	2023-04-01 02:38:11	0	0000001449	embarcacion en abandono por mas de 3 años propietarios no responden a los comunicados se le dio desincorporacion 01/04/2023	2023-04-01
1091	AGSI-D-21173	32	1	5	1	165	2022-10-01	2	2022-10-01	2023-04-01 02:38:29	0	0000001450	embarcacion en abandono por mas de 3 años propietarios no responden a los comunicados se le dio desincorporacion 01/04/2023	2023-04-01
1777	AGSI-D-23005	63	1	5	1	315	2023-04-01	2	2023-04-01	2023-04-24 10:55:45	0	0000001568		2023-04-24
1769	AGSM-RE-0620	47	1	5	1	235	2023-04-01	2	2023-04-01	2023-04-01 06:40:09	0	0000001474		2023-04-01
1751	AGSI-RE-1072	47	1	5	1	235	2023-04-01	2	2023-04-01	2023-04-03 03:35:22	0	0000001475		2023-04-03
1787	AGSI-RE-0886	46	1	5	1	230	2023-04-01	2	2023-04-01	2023-04-03 04:18:03	0	0000001477		2023-04-03
1773	AGSI-RE-0891	32	1	5	1	165	2023-04-01	2	2023-04-01	2023-04-09 03:59:46	0	0000001490		2023-04-09
1743	AGSI-RE-GTRAMITE52	70	1	5	1	350	2023-04-01	2	2023-04-01	2023-04-11 08:54:38	0	0000001501		2023-04-11
1741	AGSI-RE-1420	60	1	5	1	300	2023-04-01	2	2023-04-01	2023-04-11 09:19:30	0	0000001503		2023-04-11
1785	AGSI-PE-0288	24	1	5	1	165	2023-04-01	2	2023-04-01	2023-04-12 03:32:29	0	0000001505	se le solicito desalojo en el mes de marzo y no pudo retirar hasta el dia 12 de abril   	2023-04-12
1796	ADKN-RE-0740	63	1	5	1	315	2023-04-01	2	2023-04-01	2023-04-12 10:21:50	0	0000001521		2023-04-12
1727	AGSI-RE-0805	72	1	5	1	360	2023-04-01	2	2023-04-01	2023-05-12 03:37:07	0	0000001632		2023-05-12
1724	AGSI-D-5814	37	1	5	1	185	2023-04-01	2	2023-04-01	2023-05-12 04:03:47	0	0000001633		2023-05-12
1762	AGSI-RE-1098	30	1	5	1	165	2023-04-01	2	2023-04-01	2023-05-12 04:06:15	0	0000001634		2023-05-12
1744	AGSI-D-5124	36	1	5	1	180	2023-04-01	2	2023-04-01	2023-05-12 04:25:59	0	0000001636		2023-05-12
1757	AQYM-D-050	47	1	5	1	235	2023-04-01	2	2023-04-01	2023-05-12 07:33:32	0	0000001638		2023-05-12
1766	AGSI-RE-TRAMITE 456	48	1	5	1	240	2023-04-01	3	2023-04-01	2023-05-19 06:46:25	0	0000001650		2023-05-19
1701	AGSI-D-9005	31	1	5	1	165	2023-04-01	2	2023-04-01	2023-05-23 10:23:12	0	0000001653		2023-05-23
1752	ADKN-D-3015	36	1	5	1	180	2023-04-01	2	2023-04-01	2023-05-24 02:50:19	0	0000001656		2023-05-24
1737	AGSI-PE-0532	24	1	5	1	165	2023-04-01	2	2023-04-01	2023-05-24 03:00:49	0	0000001658		2023-05-24
1738	AGSI-PE-0887	25	1	5	1	165	2023-04-01	2	2023-04-01	2023-05-24 03:03:24	0	0000001659		2023-05-24
1748	AGSI-2720	47	1	5	1	235	2023-04-01	2	2023-04-01	2023-05-24 04:06:06	0	0000001660		2023-05-24
1707	AGSI-2927	44	1	5	1	220	2023-04-01	2	2023-04-01	2023-05-24 04:07:11	0	0000001661		2023-05-24
1720	AGSP-RE-1071	72	1	5	1	360	2023-04-01	2	2023-04-01	2023-05-31 08:17:33	0	0000001672		2023-05-31
1710	AGSI-RE-TRAMITE 000123	11	2	5	1	55	2023-04-01	2	2023-04-01	2023-06-01 03:24:36	0	0000001678	la embarcación se retiro el 08 de febrero 2023	2023-06-01
1747	ARSH-RE-0016	52	1	5	1	260	2023-04-01	2	2023-04-01	2023-06-02 04:12:25	0	0000001685		2023-06-02
1763	AGSI-D-22966	58	1	5	1	290	2023-04-01	2	2023-04-01	2023-06-06 06:02:46	0	0000001699		2023-06-06
1753	AGSI-PJ-0070	33	1	5	1	165	2023-04-01	2	2023-04-01	2023-06-08 10:37:27	0	0000001718		2023-06-08
1722	AGSM-D-1776	43	1	5	1	215	2023-04-01	2	2023-04-01	2023-06-09 06:42:02	0	0000001726		2023-06-09
1705	AGSI-D-5535	42	1	5	1	210	2023-04-01	2	2023-04-01	2023-06-11 04:28:19	0	0000001728		2023-06-11
1778	AGSI-D-23647	36	1	5	1	180	2023-04-01	2	2023-04-01	2023-06-20 03:19:10	0	0000001744		2023-06-20
1704	AGSI-RE-TRAMITE789	47	1	5	1	235	2023-04-01	2	2023-04-01	2023-06-20 03:20:48	0	0000001747		2023-06-20
1754	AGSI-RE-1339	47	1	5	1	235	2023-04-01	2	2023-04-01	2023-06-20 03:53:33	0	0000001752		2023-06-20
1712	AGSI-re-tramite-098	14	2	5	1	70	2023-04-01	2	2023-04-01	2023-06-20 03:54:03	0	0000001753		2023-06-20
1779	AGSI-RE-1303	63	1	5	1	315	2023-04-01	2	2023-04-01	2023-04-13 07:52:16	0	0000001523		2023-04-13
1745	AGSP-RE-0514	63	1	5	1	315	2023-04-01	2	2023-04-01	2023-04-14 10:26:16	0	0000001525		2023-04-14
1772	APNN-D-675	35	2	5	1	175	2023-04-01	2	2023-04-01	2023-04-14 10:30:27	0	0000001527		2023-04-14
1783	AGSI-RE-1593	23	2	5	1	115	2023-04-01	2	2023-04-01	2023-04-15 06:01:21	0	0000001532		2023-04-15
1786	AGSI-RE-1349	60	1	5	1	300	2023-04-01	2	2023-04-01	2023-04-17 08:23:20	0	0000001536		2023-04-17
1735	ADKN-D-7303	20	2	5	1	100	2023-04-01	2	2023-04-01	2023-04-17 08:24:26	0	0000001538		2023-04-17
1771	AGSP-PJ-0066	25	1	5	1	165	2023-04-01	2	2023-04-01	2023-04-17 08:25:16	0	0000001540		2023-04-17
1736	AGSI-RE-1404	24	2	5	1	120	2023-04-01	2	2023-04-01	2023-04-18 02:37:43	0	0000001541		2023-04-18
1732	AGSI-RE-0575	40	1	5	1	200	2023-04-01	2	2023-04-01	2023-04-21 03:56:52	0	0000001545		2023-04-21
1784	AGSI-TU-0058	48	1	5	1	240	2023-04-01	2	2023-04-01	2023-04-21 04:11:50	0	0000001547		2023-04-21
1761	AGSI-RE-0753	60	1	5	1	300	2023-04-01	2	2023-04-01	2023-04-21 10:02:16	0	0000001564		2023-04-21
1776	AGSI-PE-0829	34	1	5	1	170	2023-04-01	2	2023-04-01	2023-04-24 04:46:14	0	0000001565		2023-04-24
1781	AGSI-RE-1001	54	1	5	1	270	2023-04-01	2	2023-04-01	2023-04-24 05:02:11	0	0000001566		2023-04-24
1797	AGSP-RE-0587	25	2	5	1	125	2023-04-01	2	2023-04-01	2023-04-25 06:09:35	0	0000001569		2023-04-25
1756	ADKN-2106	44	1	5	1	220	2023-04-01	2	2023-04-01	2023-06-27 05:22:31	0	0000001768		2023-06-27
1733	ARSH-D-2077	80	1	5	1	400	2023-04-01	2	2023-04-01	2023-04-29 05:35:42	0	0000001578		2023-04-29
1759	AGSI-RE-1176	81	1	5	1	405	2023-04-01	2	2023-04-01	2023-04-30 03:02:54	0	0000001579		2023-04-30
1760	AGSP-2214	36	1	5	1	180	2023-04-01	2	2023-04-01	2023-05-02 02:06:18	0	0000001585		2023-05-02
1792	AGSP-D-2875	30	2	5	1	150	2023-04-01	2	2023-04-01	2023-05-02 09:23:30	0	0000001605		2023-05-02
1780	AMSH-RE 0323	62	1	5	1	310	2023-04-01	2	2023-04-01	2023-05-05 02:55:52	0	0000001612		2023-05-05
1782	AGSI-RE-1324	40	1	5	1	200	2023-04-01	2	2023-04-01	2023-05-05 02:58:06	0	0000001614		2023-05-05
1775	AGSI-D-23325	27	1	5	1	165	2023-04-01	2	2023-04-01	2023-05-06 06:35:29	0	0000001615		2023-05-06
1746	AGSI-PE-0879	29	1	5	1	165	2023-04-01	2	2023-04-01	2023-05-07 07:37:49	0	0000001619		2023-05-07
1798	AGSI-RE-1604	50	1	5	1	250	2023-04-01	2	2023-04-01	2023-05-08 03:55:35	0	0000001620		2023-05-08
1767	AGSI-D-6032	34	1	5	1	170	2023-04-01	2	2023-04-01	2023-05-09 02:45:45	0	0000001625	la embarcacion se retiro de la marina el dia 25 de abril ( se le solicito desalojo ) 	2023-05-09
1794	AGSI-RE-0606	32	1	5	1	165	2023-04-01	2	2023-04-01	2023-05-09 04:22:36	0	0000001627		2023-05-09
1793	AGSI-D-21173	32	1	5	1	165	2023-04-01	2	2023-04-01	2023-04-01 02:40:18	0	0000001453	embarcacion en abandono por mas de 3 años propietarios no responden a los comunicados se le dio desincorporacion 01/04/2023	2023-04-01
290	AGSI-RE- TRAMITE96589	31	1	5	1	165	2022-04-01	2	2022-04-01	2023-04-21 06:48:01	0	0000001549	la embarcación esta en estado de abandono por tal motivo es retirada de la marina el propietario no responde a las cartas enviadas se llevara a un deposito dejando una deuda de 2511 $	2023-04-21
956	AGSI-D-21173	32	1	5	1	165	2022-09-01	2	2022-09-01	2023-04-01 02:41:11	0	0000001454	embarcacion en abandono por mas de 3 años propietarios no responden a los comunicados se le dio desincorporacion 01/04/2023	2023-04-01
597	AGSI-D-21173	32	1	5	1	165	2022-06-01	2	2022-06-01	2023-04-01 02:41:32	0	0000001455	embarcacion en abandono por mas de 3 años propietarios no responden a los comunicados se le dio desincorporacion 01/04/2023	2023-04-01
357	AGSI-D-21173	32	1	5	1	165	2022-04-01	2	2022-04-01	2023-04-01 02:42:23	0	0000001457	embarcacion en abandono por mas de 3 años propietarios no responden a los comunicados se le dio desincorporacion 01/04/2023	2023-04-01
237	AGSI-D-21173	32	1	1	1	33	2022-03-01	2	2022-03-01	2023-04-01 02:43:03	0	0000001458	embarcacion en abandono por mas de 3 años propietarios no responden a los comunicados se le dio desincorporacion 01/04/2023	2023-04-01
117	AGSI-D-21173	32	1	1	1	33	2022-02-01	2	2022-02-01	2023-04-01 02:43:25	0	0000001459	embarcacion en abandono por mas de 3 años propietarios no responden a los comunicados se le dio desincorporacion 01/04/2023	2023-04-01
1564	AGSI-RE-1001	54	1	5	1	270	2023-02-01	2	2023-02-01	2023-04-01 03:31:19	0	0000001463		2023-04-01
1702	AGSI-RE-1011	45	1	5	1	225	2023-04-01	2	2023-04-01	2023-04-01 03:49:43	0	0000001464		2023-04-01
1799	AGSI-RE-1011	45	1	5	1	225	2023-05-01	2	2023-04-01	2023-04-01 00:00:00	0	0000001465		\N
1800	AGSI-RE-1011	45	1	5	1	225	2023-06-01	2	2023-04-01	2023-04-01 00:00:00	0	0000001466		\N
1801	AGSI-RE-22326	33	1	5	1	165	2023-05-01	2	2023-04-01	2023-04-01 00:00:00	0	0000001468		\N
1802	AGSI-RE-22326	33	1	5	1	165	2023-06-01	2	2023-04-01	2023-04-01 00:00:00	0	0000001469		\N
1622	AGSI-RE-0805	72	1	5	1	360	2023-03-01	2	2023-03-01	2023-04-04 02:16:38	0	0000001480		2023-04-04
1327	AGSI-RE-1354	24	2	5	1	120	2022-12-01	2	2022-12-01	2023-04-11 06:50:12	0	0000001495	el señor no tenia la embarcacion en la marina desde agosto 2022 y por el reglamento pierde el puesto por no pagar 	2023-04-11
1443	AGSI-RE-1354	24	2	5	1	120	2023-01-01	2	2023-01-01	2023-04-11 06:50:32	0	0000001496	el señor no tenia la embarcacion en la marina desde agosto 2022 y por el reglamento pierde el puesto por no pagar 	2023-04-11
1556	AGSI-RE-1354	24	2	5	1	120	2023-02-01	2	2023-02-01	2023-04-11 06:50:54	0	0000001497	el señor no tenia la embarcacion en la marina desde agosto 2022 y por el reglamento pierde el puesto por no pagar 	2023-04-11
1670	AGSI-RE-1354	24	2	5	1	120	2023-03-01	2	2023-03-01	2023-04-11 06:51:14	0	0000001498	el señor no tenia la embarcacion en la marina desde agosto 2022 y por el reglamento pierde el puesto por no pagar 	2023-04-11
1774	AGSI-RE-1354	24	2	5	1	120	2023-04-01	2	2023-04-01	2023-04-11 06:51:39	0	0000001499	el señor no tenia la embarcacion en la marina desde agosto 2022 y por el reglamento pierde el puesto por no pagar 	2023-04-11
411	AGSI-D-1648	25	2	5	1	125	2022-05-01	2	2022-05-01	2023-04-12 05:23:28	0	0000001507	se le solicito desalojo por deuda y abandono autorizado por el señor eduardo capriles para exoneracion de deuda 	2023-04-12
651	AGSI-D-1648	25	2	5	1	125	2022-07-01	2	2022-07-01	2023-04-12 05:24:27	0	0000001509	se le solicito desalojo por deuda y abandono autorizado por el señor eduardo capriles para exoneracion de deuda 	2023-04-12
771	AGSI-D-1648	25	2	5	1	125	2022-08-01	2	2022-08-01	2023-04-12 05:24:50	0	0000001510	se le solicito desalojo por deuda y abandono autorizado por el señor eduardo capriles para exoneracion de deuda 	2023-04-12
894	AGSI-D-1648	25	2	5	1	125	2022-09-01	2	2022-09-01	2023-04-12 05:25:16	0	0000001511	se le solicito desalojo por deuda y abandono autorizado por el señor eduardo capriles para exoneracion de deuda 	2023-04-12
1028	AGSI-D-1648	25	2	5	1	125	2022-10-01	2	2022-10-01	2023-04-12 05:26:03	0	0000001512	se le solicito desalojo por deuda y abandono autorizado por el señor eduardo capriles para exoneracion de deuda 	2023-04-12
1149	AGSI-D-1648	25	2	5	1	125	2022-11-01	2	2022-11-01	2023-04-12 05:27:17	0	0000001513	se le solicito desalojo por deuda y abandono autorizado por el señor eduardo capriles para exoneracion de deuda 	2023-04-12
1285	AGSI-D-1648	25	2	5	1	125	2022-12-01	2	2022-12-01	2023-04-12 05:27:37	0	0000001514	se le solicito desalojo por deuda y abandono autorizado por el señor eduardo capriles para exoneracion de deuda 	2023-04-12
1408	AGSI-D-1648	25	2	5	1	125	2023-01-01	2	2023-01-01	2023-04-12 05:28:02	0	0000001515	se le solicito desalojo por deuda y abandono autorizado por el señor eduardo capriles para exoneracion de deuda 	2023-04-12
1636	AGSI-D-1648	25	2	5	1	125	2023-03-01	2	2023-03-01	2023-04-12 05:28:44	0	0000001517	se le solicito desalojo por deuda y abandono autorizado por el señor eduardo capriles para exoneracion de deuda 	2023-04-12
1740	AGSI-D-1648	25	2	5	1	125	2023-04-01	2	2023-04-01	2023-04-12 05:29:10	0	0000001518	se le solicito desalojo por deuda y abandono autorizado por el señor eduardo capriles para exoneracion de deuda 	2023-04-12
1669	APNN-D-675	35	2	5	1	175	2023-03-01	2	2023-03-01	2023-04-14 10:27:53	0	0000001526		2023-04-14
1721	AGSI-D-11629	27	1	5	1	165	2023-04-01	2	2023-04-01	2023-04-18 02:40:41	0	0000001543	se retiro de la marina por desalojo no se realizo los primeros dias del mes por falta de rampa 	2023-04-18
1803	AGSI-RE-1674	36	2	5	1	180	2023-04-20	2	2023-04-20	2023-04-20 02:24:47	0	0000001544		2023-04-20
530	AGSI-RE- TRAMITE96589	31	1	5	1	165	2022-06-01	2	2022-06-01	2023-04-21 07:58:13	0	0000001552	la embarcación esta en estado de abandono por tal motivo es retirada de la marina el propietario no responde a las cartas enviadas se llevara a un deposito dejando una deuda de 2511 $	2023-04-21
1835	AGSI-RE-0268	58	1	5	1	290	2023-05-01	0	2023-05-01	2023-05-01 00:00:00	0	0	\N	\N
170	AGSI-RE- TRAMITE96589	31	1	1	1	33	2022-03-01	2	2022-03-01	2023-04-21 07:57:14	0	0000001550	la embarcación esta en estado de abandono por tal motivo es retirada de la marina el propietario no responde a las cartas enviadas se llevara a un deposito dejando una deuda de 2511 $	2023-04-21
650	AGSI-RE- TRAMITE96589	31	1	5	1	165	2022-07-01	2	2022-07-01	2023-04-21 07:58:47	0	0000001553	la embarcación esta en estado de abandono por tal motivo es retirada de la marina el propietario no responde a las cartas enviadas se llevara a un deposito dejando una deuda de 2511 $	2023-04-21
770	AGSI-RE- TRAMITE96589	31	1	5	1	165	2022-08-01	2	2022-08-01	2023-04-21 07:59:14	0	0000001554	la embarcación esta en estado de abandono por tal motivo es retirada de la marina el propietario no responde a las cartas enviadas se llevara a un deposito dejando una deuda de 2511 $	2023-04-21
893	AGSI-RE- TRAMITE96589	31	1	5	1	165	2022-09-01	2	2022-09-01	2023-04-21 07:59:32	0	0000001555	la embarcación esta en estado de abandono por tal motivo es retirada de la marina el propietario no responde a las cartas enviadas se llevara a un deposito dejando una deuda de 2511 $	2023-04-21
1027	AGSI-RE- TRAMITE96589	31	1	5	1	165	2022-10-01	2	2022-10-01	2023-04-21 07:59:53	0	0000001556	la embarcación esta en estado de abandono por tal motivo es retirada de la marina el propietario no responde a las cartas enviadas se llevara a un deposito dejando una deuda de 2511 $	2023-04-21
1284	AGSI-RE- TRAMITE96589	31	1	5	1	165	2022-12-01	2	2022-12-01	2023-04-21 08:00:34	0	0000001558	la embarcación esta en estado de abandono por tal motivo es retirada de la marina el propietario no responde a las cartas enviadas se llevara a un deposito dejando una deuda de 2511 $	2023-04-21
1407	AGSI-RE- TRAMITE96589	31	1	5	1	165	2023-01-01	2	2023-01-01	2023-04-21 08:00:53	0	0000001559	la embarcación esta en estado de abandono por tal motivo es retirada de la marina el propietario no responde a las cartas enviadas se llevara a un deposito dejando una deuda de 2511 $	2023-04-21
1519	AGSI-RE- TRAMITE96589	31	1	5	1	165	2023-02-01	2	2023-02-01	2023-04-21 08:01:10	0	0000001560	la embarcación esta en estado de abandono por tal motivo es retirada de la marina el propietario no responde a las cartas enviadas se llevara a un deposito dejando una deuda de 2511 $	2023-04-21
1635	AGSI-RE- TRAMITE96589	31	1	5	1	165	2023-03-01	2	2023-03-01	2023-04-21 08:01:31	0	0000001561	la embarcación esta en estado de abandono por tal motivo es retirada de la marina el propietario no responde a las cartas enviadas se llevara a un deposito dejando una deuda de 2511 $	2023-04-21
1739	AGSI-RE- TRAMITE96589	31	1	5	1	165	2023-04-01	2	2023-04-01	2023-04-21 08:01:49	0	0000001562	la embarcación esta en estado de abandono por tal motivo es retirada de la marina el propietario no responde a las cartas enviadas se llevara a un deposito dejando una deuda de 2511 $	2023-04-21
1804	AGSI-RE-1264	36	2	5	1	180	2023-04-20	2	2023-04-20	2023-04-25 06:15:56	0	0000001572		2023-04-25
1806	AGSI-RE-1264	36	2	5	1	180	2023-05-20	2	2023-04-25	2023-04-25 00:00:00	0	0000001573		\N
1718	AGSI-RE-0601	22	2	5	1	110	2023-04-01	2	2023-04-01	2023-04-29 03:27:56	0	0000001576	el señor retiro la embarcación en el mes de abril 	2023-04-29
1789	AGSI-TU-0072	14	2	5	1	70	2023-04-01	2	2023-04-01	2023-04-29 03:29:02	0	0000001577	el señor retiro la embarcación en el mes de abril por desalojo	2023-04-29
1811	AGSI-PE-0816	28	1	5	1	165	2023-05-01	2	2023-05-02	2023-05-02 00:00:00	0	0000001587		\N
473	AGSI-D-15916	40	1	5	1	200	2022-05-01	2	2022-05-01	2023-05-02 03:35:41	0	0000001589	EL PROPIETARIO NO RESPONDE A LOS COMUNICADOS NI SE HA PRESENTADO EN LA MARINA POR MAS DE 1 AÑO SE PROSEDE HACER DESINCORPORACION 	2023-05-02
952	AGSI-D-15916	40	1	5	1	200	2022-09-01	2	2022-09-01	2023-05-02 03:37:19	0	0000001592	EL PROPIETARIO NO RESPONDE A LOS COMUNICADOS NI SE HA PRESENTADO EN LA MARINA POR MAS DE 1 AÑO SE PROSEDE HACER DESINCORPORACION 	2023-05-02
833	AGSI-D-15916	40	1	5	1	200	2022-08-01	2	2022-08-01	2023-05-02 03:38:25	0	0000001593	EL PROPIETARIO NO RESPONDE A LOS COMUNICADOS NI SE HA PRESENTADO EN LA MARINA POR MAS DE 1 AÑO SE PROSEDE HACER DESINCORPORACION TOTAL DE LA DEUDA 2600 HASTA MAYO	2023-05-02
1208	AGSI-D-15916	40	1	5	1	200	2022-11-01	2	2022-11-01	2023-05-02 03:39:27	0	0000001595	EL PROPIETARIO NO RESPONDE A LOS COMUNICADOS NI SE HA PRESENTADO EN LA MARINA POR MAS DE 1 AÑO SE PROSEDE HACER DESINCORPORACION TOTAL DE LA DEUDA 2600 HASTA MAYO	2023-05-02
1342	AGSI-D-15916	40	1	5	1	200	2022-12-01	2	2022-12-01	2023-05-02 03:39:48	0	0000001596	EL PROPIETARIO NO RESPONDE A LOS COMUNICADOS NI SE HA PRESENTADO EN LA MARINA POR MAS DE 1 AÑO SE PROSEDE HACER DESINCORPORACION TOTAL DE LA DEUDA 2600 HASTA MAYO	2023-05-02
1813	ARSH-PJ-0034	43	1	5	1	215	2023-05-01	2	2023-05-02	2023-05-02 00:00:00	0	0000001597		\N
1461	AGSI-D-15916	40	1	5	1	200	2023-01-01	2	2023-01-01	2023-05-02 03:43:09	0	0000001598	EL PROPIETARIO NO RESPONDE A LOS COMUNICADOS NI SE HA PRESENTADO EN LA MARINA POR MAS DE 1 AÑO SE PROSEDE HACER DESINCORPORACION TOTAL DE LA DEUDA 2600 HASTA MAYO	2023-05-02
1574	AGSI-D-15916	40	1	5	1	200	2023-02-01	2	2023-02-01	2023-05-02 03:43:27	0	0000001599	EL PROPIETARIO NO RESPONDE A LOS COMUNICADOS NI SE HA PRESENTADO EN LA MARINA POR MAS DE 1 AÑO SE PROSEDE HACER DESINCORPORACION TOTAL DE LA DEUDA 2600 HASTA MAYO	2023-05-02
1809	AGSI TRAMITE 14521452	35	2	5	1	175	2023-04-29	2	2023-04-29	2023-05-11 03:10:11	0	0000001629		2023-05-11
1887	AGSI-PE-0829	34	1	5	1	170	2023-05-01	2	2023-05-01	2023-05-31 05:20:33	0	0000001664		2023-05-31
1687	AGSI-D-15916	40	1	5	1	200	2023-03-01	2	2023-03-01	2023-05-02 03:43:44	0	0000001600	EL PROPIETARIO NO RESPONDE A LOS COMUNICADOS NI SE HA PRESENTADO EN LA MARINA POR MAS DE 1 AÑO SE PROSEDE HACER DESINCORPORACION TOTAL DE LA DEUDA 2600 HASTA MAYO	2023-05-02
1790	AGSI-D-15916	40	1	5	1	200	2023-04-01	2	2023-04-01	2023-05-02 03:44:01	0	0000001601	EL PROPIETARIO NO RESPONDE A LOS COMUNICADOS NI SE HA PRESENTADO EN LA MARINA POR MAS DE 1 AÑO SE PROSEDE HACER DESINCORPORACION TOTAL DE LA DEUDA 2600 HASTA MAYO	2023-05-02
1816	AGSI-RE-1176	81	1	5	1	405	2023-05-01	2	2023-05-03	2023-05-03 00:00:00	0	0000001606		\N
1817	AGSI-RE-1420	60	1	5	1	300	2023-05-01	2	2023-05-03	2023-05-03 00:00:00	0	0000001607		\N
1818	AGSI-RE-1072	47	1	5	1	235	2023-05-01	2	2023-05-03	2023-05-03 00:00:00	0	0000001608		\N
1819	AGSM-RE-0620	47	1	5	1	235	2023-05-01	2	2023-05-03	2023-05-03 00:00:00	0	0000001609		\N
1820	AGSI-TU-0058	48	1	5	1	240	2023-05-01	2	2023-05-04	2023-05-04 00:00:00	0	0000001610		\N
1821	AGSI-RE-1404	24	2	5	1	120	2023-05-01	2	2023-05-06	2023-05-06 00:00:00	0	0000001616		\N
1825	ENTRAMITE001	88	1	5	1	440	2023-05-01	0	2023-05-01	2023-05-01 00:00:00	0	0	\N	\N
1827	AGSI-PE-0830	23	1	5	1	165	2023-05-01	0	2023-05-01	2023-05-01 00:00:00	0	0	\N	\N
1805	AGSI-RE-0346	64	1	5	1	320	2023-04-24	2	2023-04-24	2023-07-27 10:17:00	0	0000001855		2023-07-27
1834	Agsi-re-tramite-3344	11	2	5	1	55	2023-05-01	2	2023-05-01	2023-07-30 04:26:33	0	0000001870		2023-07-30
1808	AGSI-RE-1346	32	2	5	1	160	2023-05-01	2	2023-04-01	2023-05-01 00:00:00	0	0000001574		\N
1836	AGSI-PE-0842	24	1	5	1	165	2023-05-01	0	2023-05-01	2023-05-01 00:00:00	0	0	\N	\N
1839	AGSI-RE-0437	30	1	5	1	165	2023-05-01	0	2023-05-01	2023-05-01 00:00:00	0	0	\N	\N
1843	DL1324AC	73	1	5	1	365	2023-05-01	0	2023-05-01	2023-05-01 00:00:00	0	0	\N	\N
1849	ARSH-D-1448	30	1	5	1	165	2023-05-01	0	2023-05-01	2023-05-01 00:00:00	0	0	\N	\N
1851	AGSI-RE-TRAMITE7458	115	1	5	1	575	2023-05-01	0	2023-05-01	2023-05-01 00:00:00	0	0	\N	\N
1854	AGSI-RE-TRAMITE 741	41	1	5	1	205	2023-05-01	0	2023-05-01	2023-05-01 00:00:00	0	0	\N	\N
1863	Agsi-re-tramite-224466	48	1	5	1	240	2023-05-01	0	2023-05-01	2023-05-01 00:00:00	0	0	\N	\N
1864	AGSI-2221	42	1	5	1	210	2023-05-01	0	2023-05-01	2023-05-01 00:00:00	0	0	\N	\N
1868	AGSI-D-5810	55	1	5	1	275	2023-05-01	0	2023-05-01	2023-05-01 00:00:00	0	0	\N	\N
1877	AGSI-RE-0202	88	1	5	1	440	2023-05-01	0	2023-05-01	2023-05-01 00:00:00	0	0	\N	\N
1882	AGSI-D-11413	32	1	5	1	165	2023-05-01	0	2023-05-01	2023-05-01 00:00:00	0	0	\N	\N
1883	AGSI-RE-0205	58	1	5	1	290	2023-05-01	0	2023-05-01	2023-05-01 00:00:00	0	0	\N	\N
1858	AGSI-D-5124	36	1	5	1	180	2023-05-01	2	2023-05-01	2023-05-12 04:26:48	0	0000001637		2023-05-12
1842	AGSI-RE-1674	36	2	5	1	180	2023-05-01	2	2023-05-01	2023-05-13 07:24:14	0	0000001640		2023-05-13
1844	AGSI-D-5814	37	1	5	1	185	2023-05-01	2	2023-05-01	2023-05-17 06:32:10	0	0000001641		2023-05-17
1832	AGSI-AUXILIAR	12	2	5	1	60	2023-05-01	2	2023-05-01	2023-05-18 02:44:14	0	0000001643		2023-05-18
1852	AGSI-RE-0575	40	1	5	1	200	2023-05-01	2	2023-05-01	2023-05-18 02:45:16	0	0000001644		2023-05-18
1879	AGSI-RE-0544	33	2	5	1	165	2023-05-01	2	2023-05-01	2023-05-18 03:23:46	0	0000001647	pago el 13/02/2023 en efectivo	2023-05-18
1847	AGSI-TU-0182	35	1	5	1	175	2023-05-01	2	2023-05-01	2023-05-21 03:29:03	0	0000001652		2023-05-21
1871	ARSH-D-1850	85	1	5	1	425	2023-05-01	2	2023-05-01	2023-05-26 07:01:09	0	0000001663		2023-05-26
1886	AGSI-D-23325	27	1	5	1	165	2023-05-01	2	2023-05-01	2023-05-31 05:46:25	0	0000001669	la embarcación se le solicito el desalojo de la misma en el mes de mayo 2023	2023-05-31
1838	ARSH-D-957	27	1	5	1	165	2023-05-01	2	2023-05-01	2023-05-31 08:17:47	0	0000001672		2023-05-31
1840	AGSP-RE-1071	72	1	5	1	360	2023-05-01	2	2023-05-01	2023-05-31 08:18:17	0	0000001673		2023-05-31
1829	AGSI-RE-TRAMITE 000123	11	2	5	1	55	2023-05-01	2	2023-05-01	2023-06-01 03:24:11	0	0000001677	la embarcación se retiro el 08 de febrero 2023	2023-06-01
1855	AGSI-PE-0532	24	1	5	1	165	2023-05-01	2	2023-05-01	2023-06-01 08:19:23	0	0000001683		2023-06-01
1846	AGSI-RE-0805	72	1	5	1	360	2023-05-01	2	2023-05-01	2023-06-02 04:50:10	0	0000001686		2023-06-02
1885	AGSI-RE-0891	32	1	5	1	165	2023-05-01	2	2023-05-01	2023-06-02 08:00:00	0	0000001687		2023-06-02
1876	AGSI-D-22966	58	1	5	1	290	2023-05-01	2	2023-05-01	2023-06-06 06:06:49	0	0000001700	nota el deposito es por 540$ el propietario trajo el efectivo 40$	2023-06-06
1859	AGSP-RE-0514	63	1	5	1	315	2023-05-01	2	2023-05-01	2023-06-06 06:08:09	0	0000001700		2023-06-06
1884	APNN-D-675	35	2	5	1	175	2023-05-01	2	2023-05-01	2023-06-06 06:10:28	0	0000001702		2023-06-06
1866	AGSI-PJ-0070	33	1	5	1	165	2023-05-01	2	2023-05-01	2023-06-08 10:38:06	0	0000001719		2023-06-08
1861	ARSH-RE-0016	52	1	5	1	260	2023-05-01	2	2023-05-01	2023-06-11 04:17:14	0	0000001727		2023-06-11
1853	ARSH-D-2077	80	1	5	1	400	2023-05-01	2	2023-05-01	2023-06-13 05:45:30	0	0000001730		2023-06-13
1824	AGSI-D-5535	42	1	5	1	210	2023-05-01	2	2023-05-01	2023-06-14 06:03:49	0	0000001731		2023-06-14
1828	AGSI-RE-1239	44	1	5	1	220	2023-05-01	2	2023-05-01	2023-06-14 06:48:54	0	0000001732		2023-06-14
1857	AGSI-RE-GTRAMITE52	70	1	5	1	350	2023-05-01	2	2023-05-01	2023-06-14 06:49:43	0	0000001733		2023-06-14
1831	AGSI-RE-0009	28	2	5	1	140	2023-05-01	2	2023-05-01	2023-06-15 07:40:37	0	0000001734		2023-06-15
1850	AGSI-RE-0008	82	1	5	1	410	2023-05-01	2	2023-05-01	2023-06-15 07:41:48	0	0000001735		2023-06-15
1860	AGSI-PE-0879	29	1	5	1	165	2023-05-01	2	2023-05-01	2023-06-20 02:26:23	0	0000001740		2023-06-20
1823	AGSI-RE-TRAMITE789	47	1	5	1	235	2023-05-01	2	2023-05-01	2023-06-20 03:21:23	0	0000001748		2023-06-20
1867	AGSI-RE-1339	47	1	5	1	235	2023-05-01	2	2023-05-01	2023-06-20 03:53:09	0	0000001751		2023-06-20
1833	AGSI-re-tramite-098	14	2	5	1	70	2023-05-01	2	2023-05-01	2023-06-20 03:54:30	0	0000001754		2023-06-20
1873	AGSI-RE-0753	60	1	5	1	300	2023-05-01	2	2023-05-01	2023-06-20 07:52:49	0	0000001757		2023-06-20
1897	AGSI-RE-1243	53	1	5	1	265	2023-05-01	0	2023-05-01	2023-05-01 00:00:00	0	0	\N	\N
1906	AGSI-RE-1604	50	1	5	1	250	2023-05-01	2	2023-05-01	2023-05-08 03:56:11	0	0000001621		2023-05-08
1848	AGSI-RE-0661	45	1	5	1	225	2023-05-01	2	2023-05-01	2023-05-09 12:02:55	0	0000001623		2023-05-09
1664	AGSI-D-6032	34	1	5	1	170	2023-03-01	2	2023-03-01	2023-05-09 02:44:24	0	0000001624	la embarcacion se retiro de la marina el dia 25 de abril ( se le solicito desalojo )	2023-05-09
1881	AGSI-D-6032	34	1	5	1	170	2023-05-01	2	2023-05-01	2023-05-09 02:46:40	0	0000001626	la embarcacion se retiro de la marina el dia 25 de abril ( se le solicito desalojo ) 	2023-05-09
1810	JMP-22159	88	1	5	1	440	2023-04-29	2	2023-04-29	2023-05-11 03:09:23	0	0000001628		2023-05-11
1610	ARSH-D-957	27	1	5	1	165	2023-03-01	2	2023-03-01	2023-05-11 07:36:26	0	0000001630		2023-05-11
1716	ARSH-D-957	27	1	5	1	165	2023-04-01	2	2023-04-01	2023-05-11 07:38:59	0	0000001631		2023-05-11
1874	AGSI-RE-1098	30	1	5	1	165	2023-05-01	2	2023-05-01	2023-05-12 04:07:40	0	0000001635		2023-05-12
1870	AQYM-D-050	47	1	5	1	235	2023-05-01	2	2023-05-01	2023-05-13 05:31:04	0	0000001639		2023-05-13
1662	AGSI-RE-0544	33	2	5	1	165	2023-03-01	2	2023-03-01	2023-05-18 03:22:55	0	0000001645	pago el 13/02/2023 en efectivo	2023-05-18
1869	ADKN-2106	44	1	5	1	220	2023-05-01	2	2023-05-01	2023-06-27 05:22:53	0	0000001769		2023-06-27
1765	AGSI-RE-0544	33	2	5	1	165	2023-04-01	2	2023-04-01	2023-05-18 03:23:24	0	0000001646	pago el 13/02/2023 en efectivo	2023-05-18
1862	AGSI-2720	47	1	5	1	235	2023-05-01	2	2023-05-01	2023-07-05 03:56:00	0	0000001785		2023-07-05
1880	AGSI-RE-TRAMITE 456	48	1	5	1	240	2023-05-01	2	2023-05-01	2023-07-06 10:35:42	0	0000001795		2023-07-06
1894	AGSI-RE-1593	23	2	5	1	115	2023-05-01	2	2023-05-01	2023-07-13 07:07:05	0	0000001813		2023-07-13
1903	ADKN-RE-0740	63	1	5	1	315	2023-05-01	2	2023-05-01	2023-07-14 03:09:39	0	0000001817		2023-07-14
1875	AGSI-RE-0346	64	1	5	1	320	2023-05-01	2	2023-05-01	2023-07-27 10:17:31	0	0000001856		2023-07-27
1908	AGSI-RE-0544	33	2	5	1	165	2023-06-01	2	2023-05-18	2023-07-28 05:24:46	27	0000001648	pago el 13/02/2023 en efectivo	\N
1841	AGSM-D-1776	43	1	5	1	215	2023-05-01	2	2023-05-01	2023-08-03 08:05:14	0	0000001881		2023-08-03
1837	AGSI-RE-1687	33	2	5	1	165	2023-05-01	2	2023-05-01	2023-08-04 07:00:18	0	0000001891		2023-08-04
1514	AGSI-RE-TRAMITE 741	41	1	5	1	205	2023-02-01	2	2023-02-01	2023-05-19 06:48:18	0	0000001650		2023-05-19
1826	AGSI-2927	44	1	5	1	220	2023-05-01	2	2023-05-01	2023-05-24 04:08:35	0	0000001662		2023-05-24
1575	AGSI-RE-0655	50	1	5	1	250	2023-02-01	2	2023-02-01	2023-05-31 05:42:25	0	0000001665	el señor retiro la embarcación en febrero por viaje a los roques  y el dia 31 de mayo se comunico para informar que no regresa a la marina dejando una deuda de 1000 $ de los meses febrero, marzo, abril y mayo 2023 	2023-05-31
1688	AGSI-RE-0655	50	1	5	1	250	2023-03-01	2	2023-03-01	2023-05-31 05:42:47	0	0000001666	el señor retiro la embarcación en febrero por viaje a los roques  y el dia 31 de mayo se comunico para informar que no regresa a la marina dejando una deuda de 1000 $ de los meses febrero, marzo, abril y mayo 2023 	2023-05-31
1791	AGSI-RE-0655	50	1	5	1	250	2023-04-01	2	2023-04-01	2023-05-31 05:43:10	0	0000001667	el señor retiro la embarcación en febrero por viaje a los roques  y el dia 31 de mayo se comunico para informar que no regresa a la marina dejando una deuda de 1000 $ de los meses febrero, marzo, abril y mayo 2023 	2023-05-31
1898	AGSI-RE-0655	50	1	5	1	250	2023-05-01	2	2023-05-01	2023-05-31 05:43:39	0	0000001668	el señor retiro la embarcación en febrero por viaje a los roques  y el dia 31 de mayo se comunico para informar que no regresa a la marina dejando una deuda de 1000 $ de los meses febrero, marzo, abril y mayo 2023 	2023-05-31
1830	AGSI TRAMITE 14521452	35	2	5	1	175	2023-05-01	2	2023-05-01	2023-05-31 05:58:14	0	0000001670		2023-05-31
1899	JMP-22159	88	1	5	1	440	2023-05-01	2	2023-05-01	2023-05-31 05:58:53	0	0000001671		2023-05-31
1909	ARSH-D-957	27	1	5	1	165	2023-06-01	2	2023-05-31	2023-05-31 00:00:00	0	0000001673		\N
1915	ENTRAMITE001	88	1	5	1	440	2023-06-01	0	2023-06-01	2023-06-01 00:00:00	0	0	\N	\N
1917	AGSI-PE-0830	23	1	5	1	165	2023-06-01	0	2023-06-01	2023-06-01 00:00:00	0	0	\N	\N
1925	AGSI-RE-0268	58	1	5	1	290	2023-06-01	0	2023-06-01	2023-06-01 00:00:00	0	0	\N	\N
1926	AGSI-PE-0842	24	1	5	1	165	2023-06-01	0	2023-06-01	2023-06-01 00:00:00	0	0	\N	\N
1929	AGSI-RE-0437	30	1	5	1	165	2023-06-01	0	2023-06-01	2023-06-01 00:00:00	0	0	\N	\N
1933	DL1324AC	73	1	5	1	365	2023-06-01	0	2023-06-01	2023-06-01 00:00:00	0	0	\N	\N
1901	AGSI-RE-0606	32	1	5	1	165	2023-05-01	2	2023-05-01	2023-06-01 05:49:43	0	0000001680		2023-06-01
1892	AGSI-RE-1001	54	1	5	1	270	2023-05-01	2	2023-05-01	2023-06-01 06:10:19	0	0000001681	deposito 10$ de mas	2023-06-01
1935	ARSH-PJ-0034	43	1	5	1	215	2023-06-01	2	2023-06-01	2023-06-02 02:35:30	0	0000001684		2023-06-02
1912	AGSI-PE-0816	28	1	5	1	165	2023-06-01	2	2023-06-01	2023-06-05 03:08:46	0	0000001688		2023-06-05
1896	AGSI-RE-0886	46	1	5	1	230	2023-05-01	2	2023-05-01	2023-06-07 09:10:29	0	0000001707		2023-06-07
1904	AGSP-RE-0587	25	2	5	1	125	2023-05-01	2	2023-05-01	2023-06-07 09:57:30	0	0000001708		2023-06-07
1932	AGSI-RE-1674	36	2	5	1	180	2023-06-01	2	2023-06-01	2023-06-08 06:50:14	0	0000001710		2023-06-08
1891	AMSH-RE 0323	62	1	5	1	310	2023-05-01	2	2023-05-01	2023-06-08 10:19:46	0	0000001711		2023-06-08
1893	AGSI-RE-1324	40	1	5	1	200	2023-05-01	2	2023-05-01	2023-06-08 10:22:35	0	0000001713		2023-06-08
1900	AGSP-D-2875	30	2	5	1	150	2023-05-01	2	2023-05-01	2023-06-08 10:34:06	0	0000001716		2023-06-08
1921	AGSI-RE-0009	28	2	5	1	140	2023-06-01	2	2023-06-01	2023-06-15 07:42:32	0	0000001736		2023-06-15
1922	AGSI-AUXILIAR	12	2	5	1	60	2023-06-01	2	2023-06-01	2023-06-16 06:30:42	0	0000001738		2023-06-16
1889	AGSI-D-23647	36	1	5	1	180	2023-05-01	2	2023-05-01	2023-06-20 03:19:34	0	0000001745		2023-06-20
1913	AGSI-RE-TRAMITE789	47	1	5	1	235	2023-06-01	2	2023-06-01	2023-06-20 03:21:50	0	0000001749		2023-06-20
1923	AGSI-re-tramite-098	14	2	5	1	70	2023-06-01	2	2023-06-01	2023-06-20 03:54:56	0	0000001755		2023-06-20
1934	AGSI-D-5814	37	1	5	1	185	2023-06-01	2	2023-06-01	2023-06-20 04:29:35	0	0000001756		2023-06-20
1895	AGSI-RE-1349	60	1	5	1	300	2023-05-01	2	2023-05-01	2023-06-23 06:56:52	0	0000001762		2023-06-23
1940	ARSH-D-1448	30	1	5	1	165	2023-06-01	0	2023-06-01	2023-06-01 00:00:00	0	0	\N	\N
1942	AGSI-RE-TRAMITE7458	115	1	5	1	575	2023-06-01	0	2023-06-01	2023-06-01 00:00:00	0	0	\N	\N
1945	AGSI-RE-TRAMITE 741	41	1	5	1	205	2023-06-01	0	2023-06-01	2023-06-01 00:00:00	0	0	\N	\N
1947	AGSI-PE-0532	24	1	5	1	165	2023-06-01	0	2023-06-01	2023-06-01 00:00:00	0	0	\N	\N
1956	Agsi-re-tramite-224466	48	1	5	1	240	2023-06-01	0	2023-06-01	2023-06-01 00:00:00	0	0	\N	\N
1957	AGSI-2221	42	1	5	1	210	2023-06-01	0	2023-06-01	2023-06-01 00:00:00	0	0	\N	\N
1961	AGSI-D-5810	55	1	5	1	275	2023-06-01	0	2023-06-01	2023-06-01 00:00:00	0	0	\N	\N
1939	AGSI-RE-0661	45	1	5	1	225	2023-06-01	2	2023-06-01	2023-06-28 10:34:02	0	0000001773		2023-06-28
1972	AGSI-RE-0202	88	1	5	1	440	2023-06-01	0	2023-06-01	2023-06-01 00:00:00	0	0	\N	\N
1974	AGSI-RE-TRAMITE 456	48	1	5	1	240	2023-06-01	0	2023-06-01	2023-06-01 00:00:00	0	0	\N	\N
1953	AGSI-PE-0879	29	1	5	1	165	2023-06-01	2	2023-06-01	2023-07-03 08:55:53	0	0000001778		2023-07-03
1930	AGSP-RE-1071	72	1	5	1	360	2023-06-01	2	2023-06-01	2023-07-04 03:28:09	0	0000001779		2023-07-04
1948	AGSI-PE-0887	25	1	5	1	165	2023-06-01	2	2023-06-01	2023-07-04 10:07:43	0	0000001782		2023-07-04
1955	AGSI-2720	47	1	5	1	235	2023-06-01	2	2023-06-01	2023-07-05 03:56:36	0	0000001786		2023-07-05
1916	AGSI-2927	44	1	5	1	220	2023-06-01	2	2023-06-01	2023-07-05 03:58:30	0	0000001787		2023-07-05
1954	ARSH-RE-0016	52	1	5	1	260	2023-06-01	2	2023-06-01	2023-07-06 06:36:33	0	0000001792		2023-07-06
1918	AGSI-RE-1239	44	1	5	1	220	2023-06-01	2	2023-06-01	2023-07-07 03:13:29	0	0000001796		2023-07-07
1968	AGSI-RE-1098	30	1	5	1	165	2023-06-01	2	2023-06-01	2023-07-13 06:05:00	0	0000001811		2023-07-13
1971	AGSI-TU-0203	30	2	5	1	150	2023-06-01	2	2023-06-01	2023-07-16 07:19:11	0	0000001827		2023-07-16
1937	AGSI-RE-0805	72	1	5	1	360	2023-06-01	2	2023-06-01	2023-07-19 02:13:10	0	0000001830		2023-07-19
1914	AGSI-D-5535	42	1	5	1	210	2023-06-01	2	2023-06-01	2023-07-25 08:16:59	0	0000001840		2023-07-25
1944	ARSH-D-2077	80	1	5	1	400	2023-06-01	2	2023-06-01	2023-07-26 11:43:55	0	0000001842		2023-07-26
1911	AGSI-D-9005	31	1	5	1	165	2023-06-01	2	2023-06-01	2023-07-27 10:06:17	0	0000001852		2023-07-27
1969	AGSI-RE-0346	64	1	5	1	320	2023-06-01	2	2023-06-01	2023-07-27 10:18:12	0	0000001857		2023-07-27
1949	AGSI-RE-1420	60	1	5	1	300	2023-06-01	2	2023-06-01	2023-07-28 09:57:58	0	0000001865		2023-07-28
1924	Agsi-re-tramite-3344	11	2	5	1	55	2023-06-01	2	2023-06-01	2023-07-30 04:26:01	0	0000001869		2023-07-30
1966	AGSP-2214	36	1	5	1	180	2023-06-01	2	2023-06-01	2023-08-04 05:09:37	0	0000001887		2023-08-04
1927	AGSI-RE-1687	33	2	5	1	165	2023-06-01	2	2023-06-01	2023-08-04 06:07:49	0	0000001888		2023-08-04
1973	AGSI-RE-1346	32	2	5	1	160	2023-06-01	2	2023-06-01	2023-08-05 01:45:44	0	0000001892		2023-08-05
1975	AGSI-D-11413	32	1	5	1	165	2023-06-01	0	2023-06-01	2023-06-01 00:00:00	0	0	\N	\N
1977	AGSI-RE-0205	58	1	5	1	290	2023-06-01	0	2023-06-01	2023-06-01 00:00:00	0	0	\N	\N
1979	AGSI-RE-0891	32	1	5	1	165	2023-06-01	0	2023-06-01	2023-06-01 00:00:00	0	0	\N	\N
1993	AGSI-RE-1243	53	1	5	1	265	2023-06-01	0	2023-06-01	2023-06-01 00:00:00	0	0	\N	\N
1928	AGSI-RE-0692	32	2	5	1	160	2023-06-01	2	2023-06-01	2023-06-01 03:14:55	0	0000001674		2023-06-01
1919	AGSI-RE-TRAMITE 000123	11	2	5	1	55	2023-06-01	2	2023-06-01	2023-06-01 03:23:52	0	0000001676	la embarcación se retiro el 08 de febrero 2023	2023-06-01
1604	AGSI-RE-TRAMITE 000123	11	2	5	1	55	2023-03-01	2	2023-03-01	2023-06-01 03:24:56	0	0000001679	la embarcación se retiro el 08 de febrero 2023	2023-06-01
1963	AQYM-D-050	47	1	5	1	235	2023-06-01	2	2023-06-01	2023-06-01 07:27:17	0	0000001682		2023-06-01
874	AGSI-RE-TRAMITE87	32	1	5	1	165	2022-09-01	2	2022-09-01	2023-06-05 03:11:42	0	0000001689	el señor se presento el día domingo 4 de junio 2023 para retirar la embarcación solo pago 400$ por no tener mas recursos 	2023-06-05
1009	AGSI-RE-TRAMITE87	32	1	5	1	165	2022-10-01	2	2022-10-01	2023-06-05 03:12:01	0	0000001690	el señor se presento el día domingo 4 de junio 2023 para retirar la embarcación solo pago 400$ por no tener mas recursos 	2023-06-05
1952	AGSP-RE-0514	63	1	5	1	315	2023-06-01	2	2023-06-01	2023-06-06 06:09:19	0	0000001701		2023-06-06
1978	APNN-D-675	35	2	5	1	175	2023-06-01	2	2023-06-01	2023-06-06 06:11:22	0	0000001703		2023-06-06
1965	AGSI-RE-1176	81	1	5	1	405	2023-06-01	2	2023-06-01	2023-06-06 06:56:00	0	0000001705	LA EMBARCACION SE RETIRA EL DIDA 07/06/2023 A LAS 5:30 AM 	2023-06-06
1990	AGSI-TU-0058	48	1	5	1	240	2023-06-01	2	2023-06-01	2023-06-07 08:33:59	0	0000001706		2023-06-07
1999	AGSP-RE-0587	25	2	5	1	125	2023-06-01	2	2023-06-01	2023-06-07 09:58:03	0	0000001709		2023-06-07
1985	AMSH-RE 0323	62	1	5	1	310	2023-06-01	2	2023-06-01	2023-06-08 10:20:36	0	0000001712		2023-06-08
1987	AGSI-RE-1324	40	1	5	1	200	2023-06-01	2	2023-06-01	2023-06-08 10:23:15	0	0000001714		2023-06-08
1995	AGSP-D-2875	30	2	5	1	150	2023-06-01	2	2023-06-01	2023-06-08 10:34:38	0	0000001717		2023-06-08
1959	AGSI-PJ-0070	33	1	5	1	165	2023-06-01	2	2023-06-01	2023-06-08 10:38:58	0	0000001720		2023-06-08
1938	AGSI-TU-0182	35	1	5	1	175	2023-06-01	2	2023-06-01	2023-06-13 02:32:02	0	0000001729		2023-06-13
1941	AGSI-RE-0008	82	1	5	1	410	2023-06-01	2	2023-06-01	2023-06-15 07:43:20	0	0000001737		2023-06-15
1943	AGSI-RE-0575	40	1	5	1	200	2023-06-01	2	2023-06-01	2023-06-16 06:35:05	0	0000001739		2023-06-16
1958	ADKN-D-3015	36	1	5	1	180	2023-06-01	2	2023-06-01	2023-06-20 03:18:47	0	0000001743		2023-06-20
1983	AGSI-D-23647	36	1	5	1	180	2023-06-01	2	2023-06-01	2023-06-20 03:20:06	0	0000001746		2023-06-20
1960	AGSI-RE-1339	47	1	5	1	235	2023-06-01	2	2023-06-01	2023-06-20 03:52:43	0	0000001750		2023-06-20
1967	AGSI-RE-0753	60	1	5	1	300	2023-06-01	2	2023-06-01	2023-06-20 07:53:32	0	0000001758		2023-06-20
1980	AGSI-D-23325	27	1	5	1	165	2023-06-01	2	2023-06-01	2023-06-21 10:20:24	0	0000001761	la embarcacion se retiro en 25 de mayo 2023	2023-06-21
1991	AGSI-RE-1349	60	1	5	1	300	2023-06-01	2	2023-06-01	2023-06-23 07:00:24	0	0000001763		2023-06-23
1946	AGSI-RE-1404	24	2	5	1	120	2023-06-01	2	2023-06-01	2023-06-24 02:28:27	0	0000001764		2023-06-24
1130	AGSI-RE-TRAMITE87	32	1	5	1	165	2022-11-01	2	2022-11-01	2023-06-05 03:12:18	0	0000001691	el señor se presento el día domingo 4 de junio 2023 para retirar la embarcación solo pago 400$ por no tener mas recursos 	2023-06-05
1268	AGSI-RE-TRAMITE87	32	1	5	1	165	2022-12-01	2	2022-12-01	2023-06-05 03:12:38	0	0000001692	el señor se presento el día domingo 4 de junio 2023 para retirar la embarcación solo pago 400$ por no tener mas recursos 	2023-06-05
1392	AGSI-RE-TRAMITE87	32	1	5	1	165	2023-01-01	2	2023-01-01	2023-06-05 03:12:52	0	0000001693	el señor se presento el día domingo 4 de junio 2023 para retirar la embarcación solo pago 400$ por no tener mas recursos 	2023-06-05
1504	AGSI-RE-TRAMITE87	32	1	5	1	165	2023-02-01	2	2023-02-01	2023-06-05 03:13:07	0	0000001694	el señor se presento el día domingo 4 de junio 2023 para retirar la embarcación solo pago 400$ por no tener mas recursos 	2023-06-05
1621	AGSI-RE-TRAMITE87	32	1	5	1	165	2023-03-01	2	2023-03-01	2023-06-05 03:13:22	0	0000001695	el señor se presento el día domingo 4 de junio 2023 para retirar la embarcación solo pago 400$ por no tener mas recursos 	2023-06-05
1726	AGSI-RE-TRAMITE87	32	1	5	1	165	2023-04-01	2	2023-04-01	2023-06-05 03:14:08	0	0000001696	el señor se presento el día domingo 4 de junio 2023 para retirar la embarcación solo pago 400$ por no tener mas recursos 	2023-06-05
1845	AGSI-RE-TRAMITE87	32	1	5	1	165	2023-05-01	2	2023-05-01	2023-06-05 03:14:31	0	0000001697	el señor se presento el día domingo 4 de junio 2023 para retirar la embarcación solo pago 400$ por no tener mas recursos 	2023-06-05
1936	AGSI-RE-TRAMITE87	32	1	5	1	165	2023-06-01	2	2023-06-01	2023-06-05 03:15:15	0	0000001698	el señor se presento el día domingo 4 de junio 2023 para retirar la embarcación solo pago 400$ por no tener mas recursos 	2023-06-05
1970	AGSI-D-22966	58	1	5	1	290	2023-06-01	2	2023-06-01	2023-06-06 06:51:33	0	0000001704	EL SEÑOR RETIRO LA EMBARCACION EL 06/06/2023 	2023-06-06
1988	AGSI-RE-1573	34	2	5	1	170	2023-06-01	2	2023-06-01	2023-06-08 10:24:38	0	0000001715		2023-06-08
1872	AGSP-2214	36	1	5	1	180	2023-05-01	2	2023-05-01	2023-06-09 04:15:54	0	0000001724		2023-06-09
1865	ADKN-D-3015	36	1	5	1	180	2023-05-01	2	2023-05-01	2023-06-20 03:18:23	0	0000001742		2023-06-20
1994	JMP-22159	88	1	5	1	440	2023-06-01	2	2023-06-01	2023-06-27 07:54:59	0	0000001772		2023-06-27
1984	AGSI-RE-1303	63	1	5	1	315	2023-06-01	2	2023-06-01	2023-06-30 02:34:56	0	0000001775		2023-06-30
1910	AGSM-RE-0897	50	1	5	1	250	2023-06-01	2	2023-06-01	2023-06-21 03:11:49	0	0000001759		2023-06-21
1964	ARSH-D-1850	85	1	5	1	425	2023-06-01	2	2023-06-01	2023-06-21 06:59:38	0	0000001760		2023-06-21
2002	ADKN-D-57476	60	1	5	1	300	2023-04-01	0	2023-04-01	2023-04-01 00:00:00	0	0	\N	\N
2003	ADKN-D-57476	60	1	5	1	300	2023-05-01	0	2023-05-01	2023-05-01 00:00:00	0	0	\N	\N
2004	ADKN-D-57476	60	1	5	1	300	2023-06-01	0	2023-06-01	2023-06-01 00:00:00	0	0	\N	\N
1996	AGSI-RE-0606	32	1	5	1	165	2023-06-01	2	2023-06-01	2023-07-04 03:36:00	0	0000001780		2023-07-04
1976	AGSM-RE-0620	47	1	5	1	235	2023-06-01	2	2023-06-01	2023-07-05 04:01:58	0	0000001788		2023-07-05
1992	AGSI-RE-0886	46	1	5	1	230	2023-06-01	2	2023-06-01	2023-07-07 07:04:01	0	0000001800		2023-07-07
1989	AGSI-RE-1593	23	2	5	1	115	2023-06-01	2	2023-06-01	2023-07-13 07:07:43	0	0000001814		2023-07-13
1982	AGSI-D-23005	63	1	5	1	315	2023-06-01	2	2023-06-01	2023-07-13 07:09:32	0	0000001816		2023-07-13
1998	ADKN-RE-0740	63	1	5	1	315	2023-06-01	2	2023-06-01	2023-07-14 03:10:31	0	0000001818		2023-07-14
2000	AGSI-RE-1264	36	2	5	1	180	2023-06-01	2	2023-06-01	2023-07-18 06:08:12	0	0000001829		2023-07-18
1795	AGSI-D-TRAMI 023	15	2	5	1	75	2023-04-01	2	2023-04-01	2023-06-27 05:20:34	0	0000001765		2023-06-27
1902	AGSI-D-TRAMI 023	15	2	5	1	75	2023-05-01	2	2023-05-01	2023-06-27 05:21:33	0	0000001766		2023-06-27
1997	AGSI-D-TRAMI 023	15	2	5	1	75	2023-06-01	2	2023-06-01	2023-06-27 05:21:58	0	0000001767		2023-06-27
1962	ADKN-2106	44	1	5	1	220	2023-06-01	2	2023-06-01	2023-06-27 05:23:13	0	0000001770		2023-06-27
1920	AGSI TRAMITE 14521452	35	2	5	1	175	2023-06-01	2	2023-06-01	2023-06-27 07:53:30	0	0000001771		2023-06-27
1890	AGSI-RE-1303	63	1	5	1	315	2023-05-01	2	2023-05-01	2023-06-30 02:34:22	0	0000001774		2023-06-30
2005	AGSM-RE-0897	50	1	7.50	1	375	2023-07-01	0	2023-07-01	2023-07-01 00:00:00	0	0	\N	\N
2009	AGSI-RE-TRAMITE789	47	1	7.50	1	352.5	2023-07-01	0	2023-07-01	2023-07-01 00:00:00	0	0	\N	\N
2010	AGSI-D-5535	42	1	7.50	1	315	2023-07-01	0	2023-07-01	2023-07-01 00:00:00	0	0	\N	\N
2011	ENTRAMITE001	88	1	7.50	1	660	2023-07-01	0	2023-07-01	2023-07-01 00:00:00	0	0	\N	\N
2014	AGSI-PE-0830	23	1	7.50	1	247.5	2023-07-01	0	2023-07-01	2023-07-01 00:00:00	0	0	\N	\N
2019	AGSI-re-tramite-098	14	2	7.50	1	105	2023-07-01	0	2023-07-01	2023-07-01 00:00:00	0	0	\N	\N
2021	AGSI-RE-0268	58	1	7.50	1	435	2023-07-01	0	2023-07-01	2023-07-01 00:00:00	0	0	\N	\N
2022	AGSI-PE-0842	24	1	7.50	1	247.5	2023-07-01	0	2023-07-01	2023-07-01 00:00:00	0	0	\N	\N
2025	ARSH-D-957	27	1	7.50	1	247.5	2023-07-01	0	2023-07-01	2023-07-01 00:00:00	0	0	\N	\N
2027	ADKN-D-57476	60	1	7.50	1	900	2023-07-01	0	2023-07-01	2023-07-01 00:00:00	0	0	\N	\N
2028	AGSI-RE-0437	30	1	7.50	1	247.5	2023-07-01	0	2023-07-01	2023-07-01 00:00:00	0	0	\N	\N
2033	DL1324AC	73	1	7.50	1	547.5	2023-07-01	0	2023-07-01	2023-07-01 00:00:00	0	0	\N	\N
2040	ARSH-D-1448	30	1	7.50	1	247.5	2023-07-01	0	2023-07-01	2023-07-01 00:00:00	0	0	\N	\N
2042	AGSI-RE-TRAMITE7458	115	1	7.50	1	862.5	2023-07-01	0	2023-07-01	2023-07-01 00:00:00	0	0	\N	\N
2044	ARSH-D-2077	80	1	7.50	1	600	2023-07-01	0	2023-07-01	2023-07-01 00:00:00	0	0	\N	\N
2045	AGSI-RE-TRAMITE 741	41	1	7.50	1	307.5	2023-07-01	0	2023-07-01	2023-07-01 00:00:00	0	0	\N	\N
2047	AGSI-PE-0532	24	1	7.50	1	247.5	2023-07-01	0	2023-07-01	2023-07-01 00:00:00	0	0	\N	\N
2048	AGSI-PE-0887	25	1	7.50	1	247.5	2023-07-01	0	2023-07-01	2023-07-01 00:00:00	0	0	\N	\N
2056	Agsi-re-tramite-224466	48	1	7.50	1	360	2023-07-01	0	2023-07-01	2023-07-01 00:00:00	0	0	\N	\N
2057	AGSI-2221	42	1	7.50	1	315	2023-07-01	0	2023-07-01	2023-07-01 00:00:00	0	0	\N	\N
2058	ADKN-D-3015	36	1	7.50	1	270	2023-07-01	0	2023-07-01	2023-07-01 00:00:00	0	0	\N	\N
2059	AGSI-PJ-0070	33	1	7.50	1	247.5	2023-07-01	0	2023-07-01	2023-07-01 00:00:00	0	0	\N	\N
2060	AGSI-RE-1339	47	1	7.50	1	705	2023-07-01	0	2023-07-01	2023-07-01 00:00:00	0	0	\N	\N
2062	ARSH-RE-0255	33	2	7.50	1	247.5	2023-07-01	0	2023-07-01	2023-07-01 00:00:00	0	0	\N	\N
2063	AGSI-D-5810	55	1	7.50	1	412.5	2023-07-01	0	2023-07-01	2023-07-01 00:00:00	0	0	\N	\N
2067	AGSP-2214	36	1	7.50	1	270	2023-07-01	0	2023-07-01	2023-07-01 00:00:00	0	0	\N	\N
2072	AGSI-RE-0202	88	1	7.50	1	660	2023-07-01	0	2023-07-01	2023-07-01 00:00:00	0	0	\N	\N
2017	AGSI-AUXILIAR	12	2	7.50	1	90	2023-07-01	2	2023-07-01	2023-07-04 10:16:26	0	0000001783		2023-07-04
2043	AGSI-RE-0575	40	1	7.50	1	300	2023-07-01	2	2023-07-01	2023-07-04 10:17:57	0	0000001784		2023-07-04
2050	AGSI-RE-GTRAMITE52	70	1	7.50	1	525	2023-07-01	2	2023-07-01	2023-07-07 03:15:21	0	0000001799		2023-07-07
2032	AGSI-RE-1674	36	2	7.50	1	270	2023-07-01	2	2023-07-01	2023-07-08 07:16:57	0	0000001801		2023-07-08
2051	AGSI-D-5124	36	1	7.50	1	270	2023-07-01	2	2023-07-01	2023-07-08 07:25:09	0	0000001802		2023-07-08
2046	AGSI-RE-1404	24	2	7.50	1	180	2023-07-01	2	2023-07-01	2023-07-09 06:15:43	0	0000001803		2023-07-09
2018	AGSI TRAMITE 14521452	35	2	7.50	1	262.5	2023-07-01	2	2023-07-01	2023-07-11 10:26:12	0	0000001807		2023-07-11
2034	AGSI-D-5814	37	1	7.50	1	277.5	2023-07-01	2	2023-07-01	2023-07-16 04:41:10	0	0000001823		2023-07-16
2013	AGSI-RE-1673	80	1	7.50	1	600	2023-07-01	2	2023-07-01	2023-07-13 03:52:53	0	0000001810		2023-07-13
2069	AGSI-RE-1098	30	1	7.50	1	247.5	2023-07-01	2	2023-07-01	2023-07-13 06:06:15	0	0000001812		2023-07-13
2026	AGSI-RE-22326	33	1	7.50	1	247.5	2023-07-01	2	2023-07-01	2023-07-16 04:41:46	0	0000001824		2023-07-16
2071	AGSI-TU-0203	30	2	7.50	1	225	2023-07-01	2	2023-07-01	2023-07-16 07:20:04	0	0000001828		2023-07-16
2036	AGSI-RE-0805	72	1	7.50	1	540	2023-07-01	2	2023-07-01	2023-07-19 02:14:43	0	0000001831		2023-07-19
2066	ARSH-D-1850	85	1	7.50	1	637.5	2023-07-01	2	2023-07-01	2023-07-19 06:11:41	0	0000001833		2023-07-19
2065	AQYM-D-050	47	1	7.50	1	352.5	2023-07-01	2	2023-07-01	2023-07-19 06:25:01	0	0000001834		2023-07-19
2064	ADKN-2106	44	1	7.50	1	330	2023-07-01	2	2023-07-01	2023-07-20 10:21:18	0	0000001835		2023-07-20
2068	AGSI-RE-0753	60	1	7.50	1	450	2023-07-01	2	2023-07-01	2023-07-21 06:03:14	0	0000001839		2023-07-21
2037	AGSI-TU-0182	35	1	7.50	1	262.5	2023-07-01	2	2023-07-01	2023-07-26 05:13:17	0	0000001841		2023-07-26
2070	AGSI-RE-0346	64	1	7.50	1	480	2023-07-01	2	2023-07-01	2023-07-27 10:19:30	0	0000001858		2023-07-27
2020	Agsi-re-tramite-3344	11	2	7.50	1	82.5	2023-07-01	2	2023-07-01	2023-07-30 04:25:05	0	0000001868		2023-07-30
2008	AGSI-PE-0816	28	1	7.50	1	247.5	2023-07-01	2	2023-07-01	2023-07-31 02:40:07	0	0000001872		2023-07-31
2006	AGSI-D-9005	31	1	7.50	1	247.5	2023-07-01	2	2023-07-01	2023-08-02 09:00:23	0	0000001874		2023-08-02
2054	ARSH-RE-0016	52	1	7.50	1	390	2023-07-01	2	2023-07-01	2023-08-03 05:38:07	0	0000001877		2023-08-03
2031	AGSM-D-1776	43	1	7.50	1	322.5	2023-07-01	2	2023-07-01	2023-08-03 08:07:17	0	0000001883		2023-08-03
2012	AGSI-2927	44	1	7.50	1	330	2023-07-01	2	2023-07-01	2023-08-04 03:29:09	0	0000001884		2023-08-04
2055	AGSI-2720	47	1	7.50	1	352.5	2023-07-01	2	2023-07-01	2023-08-04 03:29:46	0	0000001885		2023-08-04
2023	AGSI-RE-1687	33	2	7.50	1	247.5	2023-07-01	2	2023-07-01	2023-08-04 06:08:52	0	0000001889		2023-08-04
2029	Agsi-re-0678	42	1	7.50	1	315	2023-07-01	2	2023-07-01	2023-08-08 02:24:59	0	0000001899		2023-08-08
2053	AGSI-PE-0879	29	1	7.50	1	247.5	2023-07-01	2	2023-07-01	2023-08-08 09:20:36	0	0000001900		2023-08-08
2030	AGSP-RE-1071	72	1	7.50	1	540	2023-07-01	2	2023-07-01	2023-08-11 04:06:35	0	0000001903		2023-08-11
2016	AGSI-RE-0009	28	2	7.50	1	210	2023-07-01	2	2023-07-01	2023-08-15 06:00:05	0	0000001905		2023-08-15
2041	AGSI-RE-0008	82	1	7.50	1	615	2023-07-01	2	2023-07-01	2023-08-15 06:15:40	0	0000001907		2023-08-15
2061	AGSI-RE-0940	60	1	7.50	1	450	2023-07-01	2	2023-07-01	2023-08-16 05:45:09	0	0000001910		2023-08-16
2052	AGSP-RE-0514	63	1	7.50	1	472.5	2023-07-01	2	2023-07-01	2023-08-17 08:44:49	0	0000001917		2023-08-17
2038	AGSP-RE.0016	24	2	7.50	1	180	2023-07-01	2	2023-07-01	2023-08-17 08:47:08	0	0000001919		2023-08-17
2039	AGSI-RE-0661	45	1	7.50	1	337.5	2023-07-01	2	2023-07-01	2023-08-18 08:01:16	0	0000001920		2023-08-18
2076	AGSI-RE-TRAMITE 456	48	1	7.50	1	360	2023-07-01	0	2023-07-01	2023-07-01 00:00:00	0	0	\N	\N
2077	AGSI-D-11413	32	1	7.50	1	247.5	2023-07-01	0	2023-07-01	2023-07-01 00:00:00	0	0	\N	\N
2079	AGSI-RE-0205	58	1	7.50	1	435	2023-07-01	0	2023-07-01	2023-07-01 00:00:00	0	0	\N	\N
2081	AGSI-RE-0891	32	1	7.50	1	247.5	2023-07-01	0	2023-07-01	2023-07-01 00:00:00	0	0	\N	\N
2083	AGSI-D-23005	63	1	7.50	1	472.5	2023-07-01	0	2023-07-01	2023-07-01 00:00:00	0	0	\N	\N
2084	AGSI-D-23647	36	1	7.50	1	270	2023-07-01	0	2023-07-01	2023-07-01 00:00:00	0	0	\N	\N
2085	AGSI-RE-1303	63	1	7.50	1	472.5	2023-07-01	0	2023-07-01	2023-07-01 00:00:00	0	0	\N	\N
2087	AGSI-RE-1001	54	1	7.50	1	405	2023-07-01	0	2023-07-01	2023-07-01 00:00:00	0	0	\N	\N
2090	AGSI-RE-1593	23	2	7.50	1	172.5	2023-07-01	0	2023-07-01	2023-07-01 00:00:00	0	0	\N	\N
2093	AGSI-RE-0886	46	1	7.50	1	690	2023-07-01	0	2023-07-01	2023-07-01 00:00:00	0	0	\N	\N
2094	AGSI-RE-1243	53	1	7.50	1	397.5	2023-07-01	0	2023-07-01	2023-07-01 00:00:00	0	0	\N	\N
2097	AGSP-D-2875	30	2	7.50	1	225	2023-07-01	0	2023-07-01	2023-07-01 00:00:00	0	0	\N	\N
2101	AGSP-RE-0587	25	2	7.50	1	187.5	2023-07-01	0	2023-07-01	2023-07-01 00:00:00	0	0	\N	\N
2024	AGSI-RE-0692	32	2	7.50	1	240	2023-07-01	2	2023-07-01	2023-07-01 04:08:41	0	0000001776		2023-07-01
1951	AGSI-D-5124	36	1	5	1	180	2023-06-01	2	2023-06-01	2023-07-02 03:22:45	0	0000001777		2023-07-02
2102	AGSI-RE-1264	36	2	7.50	1	270	2023-07-01	2	2023-07-01	2023-07-21 05:11:20	0	0000001838		2023-07-21
1060	AGSI-RE-0202	88	1	5	1	440	2022-10-01	2	2022-10-01	2023-07-27 05:06:24	0	0000001843		2023-07-27
1181	AGSI-RE-0202	88	1	5	1	440	2022-11-01	2	2022-11-01	2023-07-27 05:07:11	0	0000001844		2023-07-27
1856	AGSI-PE-0887	25	1	5	1	165	2023-05-01	2	2023-05-01	2023-07-04 10:06:51	0	0000001781		2023-07-04
1981	AGSI-PE-0829	34	1	5	1	170	2023-06-01	2	2023-06-01	2023-07-04 10:32:11	0	0000001783		2023-07-04
2086	AMSH-RE 0323	62	1	7.50	1	465	2023-07-01	2	2023-07-01	2023-07-05 10:33:43	0	0000001789		2023-07-05
2088	AGSI-RE-1324	40	1	7.50	1	300	2023-07-01	2	2023-07-01	2023-07-05 10:34:21	0	0000001790		2023-07-05
2089	AGSI-RE-1573	34	2	7.50	1	255	2023-07-01	2	2023-07-01	2023-07-05 10:34:55	0	0000001791		2023-07-05
2095	AGSI-TU-0072	14	2	7.50	1	105	2023-07-01	2	2023-07-01	2023-07-06 09:11:22	0	0000001793		2023-07-06
1734	AGSI-RE-TRAMITE 741	41	1	5	1	205	2023-04-01	2	2023-04-01	2023-07-06 10:35:00	0	0000001794		2023-07-06
2015	AGSI-RE-1239	44	1	7.50	1	330	2023-07-01	2	2023-07-01	2023-07-07 03:14:09	0	0000001797		2023-07-07
1950	AGSI-RE-GTRAMITE52	70	1	5	1	350	2023-06-01	2	2023-06-01	2023-07-07 03:14:47	0	0000001798		2023-07-07
1822	AGSI-D-9005	31	1	5	1	165	2023-05-01	2	2023-05-01	2023-07-11 03:21:00	0	0000001804		2023-07-11
2092	AGSI-RE-1349	60	1	7.50	1	450	2023-07-01	2	2023-07-01	2023-07-11 04:24:20	0	0000001805		2023-07-11
2096	JMP-22159	88	1	7.50	1	660	2023-07-01	2	2023-07-01	2023-07-11 10:22:57	0	0000001806		2023-07-11
2001	AGSI-RE-1604	50	1	5	1	250	2023-06-01	2	2023-06-01	2023-07-13 03:34:45	0	0000001808		2023-07-13
2103	AGSI-RE-1604	50	1	7.50	1	375	2023-07-01	2	2023-07-01	2023-07-13 03:35:24	0	0000001809		2023-07-13
1888	AGSI-D-23005	63	1	5	1	315	2023-05-01	2	2023-05-01	2023-07-13 07:08:55	0	0000001815		2023-07-13
2100	ADKN-RE-0740	63	1	7.50	1	472.5	2023-07-01	2	2023-07-01	2023-07-14 03:11:11	0	0000001819		2023-07-14
2007	AGSI-RE-1011	45	1	7.50	1	337.5	2023-07-01	2	2023-07-01	2023-07-14 06:32:00	0	0000001820		2023-07-14
2104	AGSI-RE-1011	45	1	7.50	1	337.5	2023-08-01	2	2023-07-14	2023-07-14 00:00:00	0	0000001821		\N
2105	AGSI-RE-1011	45	1	7.50	1	337.5	2023-09-01	2	2023-07-14	2023-07-14 00:00:00	0	0000001822		\N
1317	AGSI-RE-0202	88	1	5	1	440	2022-12-01	2	2022-12-01	2023-07-27 05:07:56	0	0000001845		2023-07-27
1434	AGSI-RE-0202	88	1	5	1	440	2023-01-01	2	2023-01-01	2023-07-27 05:08:43	0	0000001846		2023-07-27
2108	AGSI-RE-22326	33	1	7.50	1	247.5	2023-08-01	2	2023-07-16	2023-07-16 00:00:00	0	0000001825	247,50	\N
2109	AGSI-RE-22326	33	1	7.50	1	247.5	2023-09-01	2	2023-07-16	2023-07-16 00:00:00	0	0000001826		\N
2110	AGSI-RE-0692	32	2	7.50	1	240	2023-08-01	2	2023-07-19	2023-07-19 00:00:00	0	0000001832		\N
2099	AGSI-D-TRAMI 023	15	2	7.50	1	112.5	2023-07-01	2	2023-07-01	2023-07-20 10:22:05	0	0000001836		2023-07-20
2074	AGSI-RE-TREMITE1258	64	1	7.50	1	960	2023-07-01	2	2023-07-01	2023-07-20 10:54:45	0	0000001837		2023-07-20
1529	Agsi-re-tramite-224466	48	1	5	1	240	2023-02-01	2	2023-02-01	2023-07-27 05:14:34	0	0000001851		2023-07-27
1592	AGSI-RE-0346	64	1	5	1	320	2023-02-24	2	2023-02-24	2023-07-27 10:15:29	0	0000001853		2023-07-27
1699	AGSI-RE-0346	64	1	5	1	320	2023-03-24	2	2023-03-24	2023-07-27 10:16:20	0	0000001854		2023-07-27
2111	AGSI-RE-0346	64	1	7.50	1	480	2023-08-01	3	2023-07-27	2023-07-27 00:00:00	0	0000001859		\N
2075	AGSI-RE-0544	33	2	7.50	1	247.5	2023-07-01	2	2023-07-01	2023-07-28 05:23:53	0	0000001859		2023-07-28
2112	AGSI-RE-0544	33	2	7.50	1	247.5	2023-08-01	2	2023-07-28	2023-07-28 00:00:00	0	0000001860		\N
2113	AGSI-RE-0544	33	2	7.50	1	247.5	2023-09-01	2	2023-07-28	2023-07-28 00:00:00	0	0000001861		\N
2114	AGSI-RE-0544	33	2	7.50	1	247.5	2023-10-01	2	2023-07-28	2023-07-28 00:00:00	0	0000001862		\N
2115	AGSI-RE-0544	33	2	7.50	1	247.5	2023-11-01	2	2023-07-28	2023-07-28 00:00:00	0	0000001863		\N
2116	AGSI-RE-0544	33	2	7.50	1	247.5	2023-12-01	2	2023-07-28	2023-07-28 00:00:00	0	0000001864		\N
2049	AGSI-RE-1420	60	1	7.50	1	450	2023-07-01	2	2023-07-01	2023-07-28 09:58:46	0	0000001866		2023-07-28
2035	ARSH-PJ-0034	43	1	7.50	1	645	2023-07-01	2	2023-07-01	2023-07-30 03:41:10	0	0000001867	      EXONERADO EL MES DE JULIO SEGUN NOTIFICACION DEL 05/07/2023 \r\n      POR INCAPACIDAD DE PAGO DEL CANON DE ARRENDAMIENTO	2023-07-30
2117	AGSM-RE-0897	50	1	7.50	1	375	2023-08-01	0	2023-08-01	2023-08-01 00:00:00	0	0	\N	\N
2119	AGSI-PE-0816	28	1	7.50	1	247.5	2023-08-01	0	2023-08-01	2023-08-01 00:00:00	0	0	\N	\N
2120	AGSI-RE-TRAMITE789	47	1	7.50	1	352.5	2023-08-01	0	2023-08-01	2023-08-01 00:00:00	0	0	\N	\N
2121	AGSI-D-5535	42	1	7.50	1	315	2023-08-01	0	2023-08-01	2023-08-01 00:00:00	0	0	\N	\N
2122	ENTRAMITE001	88	1	7.50	1	660	2023-08-01	0	2023-08-01	2023-08-01 00:00:00	0	0	\N	\N
2123	AGSI-2927	44	1	7.50	1	330	2023-08-01	0	2023-08-01	2023-08-01 00:00:00	0	0	\N	\N
2124	AGSI-RE-1673	80	1	7.50	1	600	2023-08-01	0	2023-08-01	2023-08-01 00:00:00	0	0	\N	\N
2098	AGSI-RE-0606	32	1	7.50	1	247.5	2023-07-01	2	2023-07-01	2023-08-10 07:53:24	0	0000001902		2023-08-10
2073	AGSI-RE-1346	32	2	7.50	1	240	2023-07-01	2	2023-07-01	2023-08-16 06:27:20	0	0000001912		2023-08-16
2080	APNN-D-675	35	2	7.50	1	262.5	2023-07-01	2	2023-07-01	2023-08-17 08:46:35	0	0000001918		2023-08-17
2125	AGSI-PE-0830	23	1	7.50	1	247.5	2023-08-01	0	2023-08-01	2023-08-01 00:00:00	0	0	\N	\N
2126	AGSI-RE-1239	44	1	7.50	1	330	2023-08-01	0	2023-08-01	2023-08-01 00:00:00	0	0	\N	\N
2130	AGSI-re-tramite-098	14	2	7.50	1	105	2023-08-01	0	2023-08-01	2023-08-01 00:00:00	0	0	\N	\N
2131	Agsi-re-tramite-3344	11	2	7.50	1	82.5	2023-08-01	0	2023-08-01	2023-08-01 00:00:00	0	0	\N	\N
2132	AGSI-RE-0268	58	1	7.50	1	435	2023-08-01	0	2023-08-01	2023-08-01 00:00:00	0	0	\N	\N
2133	AGSI-PE-0842	24	1	7.50	1	247.5	2023-08-01	0	2023-08-01	2023-08-01 00:00:00	0	0	\N	\N
2135	ARSH-D-957	27	1	7.50	1	247.5	2023-08-01	0	2023-08-01	2023-08-01 00:00:00	0	0	\N	\N
2136	ADKN-D-57476	60	1	7.50	1	900	2023-08-01	0	2023-08-01	2023-08-01 00:00:00	0	0	\N	\N
2137	AGSI-RE-0437	30	1	7.50	1	247.5	2023-08-01	0	2023-08-01	2023-08-01 00:00:00	0	0	\N	\N
2138	Agsi-re-0678	42	1	7.50	1	315	2023-08-01	0	2023-08-01	2023-08-01 00:00:00	0	0	\N	\N
2139	AGSP-RE-1071	72	1	7.50	1	540	2023-08-01	0	2023-08-01	2023-08-01 00:00:00	0	0	\N	\N
2140	AGSM-D-1776	43	1	7.50	1	322.5	2023-08-01	0	2023-08-01	2023-08-01 00:00:00	0	0	\N	\N
2142	DL1324AC	73	1	7.50	1	547.5	2023-08-01	0	2023-08-01	2023-08-01 00:00:00	0	0	\N	\N
2143	AGSI-D-5814	37	1	7.50	1	277.5	2023-08-01	0	2023-08-01	2023-08-01 00:00:00	0	0	\N	\N
2144	AGSI-RE-0805	72	1	7.50	1	540	2023-08-01	0	2023-08-01	2023-08-01 00:00:00	0	0	\N	\N
2145	AGSI-TU-0182	35	1	7.50	1	262.5	2023-08-01	0	2023-08-01	2023-08-01 00:00:00	0	0	\N	\N
2146	AGSP-RE.0016	24	2	7.50	1	180	2023-08-01	0	2023-08-01	2023-08-01 00:00:00	0	0	\N	\N
2147	AGSI-RE-0661	45	1	7.50	1	337.5	2023-08-01	0	2023-08-01	2023-08-01 00:00:00	0	0	\N	\N
2148	ARSH-D-1448	30	1	7.50	1	247.5	2023-08-01	0	2023-08-01	2023-08-01 00:00:00	0	0	\N	\N
2150	AGSI-RE-TRAMITE7458	115	1	7.50	1	862.5	2023-08-01	0	2023-08-01	2023-08-01 00:00:00	0	0	\N	\N
2152	ARSH-D-2077	80	1	7.50	1	600	2023-08-01	0	2023-08-01	2023-08-01 00:00:00	0	0	\N	\N
2153	AGSI-RE-TRAMITE 741	41	1	7.50	1	307.5	2023-08-01	0	2023-08-01	2023-08-01 00:00:00	0	0	\N	\N
2154	AGSI-RE-1473	26	2	7.50	1	195	2023-08-01	0	2023-08-01	2023-08-01 00:00:00	0	0	\N	\N
2155	AGSI-RE-1404	24	2	7.50	1	180	2023-08-01	0	2023-08-01	2023-08-01 00:00:00	0	0	\N	\N
2156	AGSI-PE-0532	24	1	7.50	1	247.5	2023-08-01	0	2023-08-01	2023-08-01 00:00:00	0	0	\N	\N
2157	AGSI-PE-0887	25	1	7.50	1	247.5	2023-08-01	0	2023-08-01	2023-08-01 00:00:00	0	0	\N	\N
2158	AGSI-RE-1420	60	1	7.50	1	450	2023-08-01	0	2023-08-01	2023-08-01 00:00:00	0	0	\N	\N
2159	AGSI-RE-GTRAMITE52	70	1	7.50	1	525	2023-08-01	0	2023-08-01	2023-08-01 00:00:00	0	0	\N	\N
2160	AGSI-D-5124	36	1	7.50	1	270	2023-08-01	0	2023-08-01	2023-08-01 00:00:00	0	0	\N	\N
2161	AGSP-RE-0514	63	1	7.50	1	472.5	2023-08-01	0	2023-08-01	2023-08-01 00:00:00	0	0	\N	\N
2162	AGSI-PE-0879	29	1	7.50	1	247.5	2023-08-01	0	2023-08-01	2023-08-01 00:00:00	0	0	\N	\N
2163	ARSH-RE-0016	52	1	7.50	1	390	2023-08-01	0	2023-08-01	2023-08-01 00:00:00	0	0	\N	\N
2164	AGSI-2720	47	1	7.50	1	352.5	2023-08-01	0	2023-08-01	2023-08-01 00:00:00	0	0	\N	\N
2165	Agsi-re-tramite-224466	48	1	7.50	1	360	2023-08-01	0	2023-08-01	2023-08-01 00:00:00	0	0	\N	\N
2166	AGSI-2221	42	1	7.50	1	315	2023-08-01	0	2023-08-01	2023-08-01 00:00:00	0	0	\N	\N
2167	ADKN-D-3015	36	1	7.50	1	270	2023-08-01	0	2023-08-01	2023-08-01 00:00:00	0	0	\N	\N
2168	AGSI-PJ-0070	33	1	7.50	1	247.5	2023-08-01	0	2023-08-01	2023-08-01 00:00:00	0	0	\N	\N
2169	AGSI-RE-1339	47	1	7.50	1	705	2023-08-01	0	2023-08-01	2023-08-01 00:00:00	0	0	\N	\N
2171	ARSH-RE-0255	33	2	7.50	1	247.5	2023-08-01	0	2023-08-01	2023-08-01 00:00:00	0	0	\N	\N
2172	AGSI-D-5810	55	1	7.50	1	412.5	2023-08-01	0	2023-08-01	2023-08-01 00:00:00	0	0	\N	\N
2175	ARSH-D-1850	85	1	7.50	1	637.5	2023-08-01	0	2023-08-01	2023-08-01 00:00:00	0	0	\N	\N
2176	AGSP-2214	36	1	7.50	1	270	2023-08-01	0	2023-08-01	2023-08-01 00:00:00	0	0	\N	\N
2178	AGSI-RE-1098	30	1	7.50	1	247.5	2023-08-01	0	2023-08-01	2023-08-01 00:00:00	0	0	\N	\N
2179	AGSI-TU-0203	30	2	7.50	1	225	2023-08-01	0	2023-08-01	2023-08-01 00:00:00	0	0	\N	\N
2180	AGSI-RE-0202	88	1	7.50	1	660	2023-08-01	0	2023-08-01	2023-08-01 00:00:00	0	0	\N	\N
2182	AGSI-RE-TREMITE1258	64	1	7.50	1	960	2023-08-01	0	2023-08-01	2023-08-01 00:00:00	0	0	\N	\N
2183	AGSI-RE-TRAMITE 456	48	1	7.50	1	360	2023-08-01	0	2023-08-01	2023-08-01 00:00:00	0	0	\N	\N
2184	AGSI-D-11413	32	1	7.50	1	247.5	2023-08-01	0	2023-08-01	2023-08-01 00:00:00	0	0	\N	\N
2186	AGSI-RE-0205	58	1	7.50	1	435	2023-08-01	0	2023-08-01	2023-08-01 00:00:00	0	0	\N	\N
2187	APNN-D-675	35	2	7.50	1	262.5	2023-08-01	0	2023-08-01	2023-08-01 00:00:00	0	0	\N	\N
2188	AGSI-RE-0891	32	1	7.50	1	247.5	2023-08-01	0	2023-08-01	2023-08-01 00:00:00	0	0	\N	\N
2189	AGSI-PE-0829	34	1	7.50	1	255	2023-08-01	0	2023-08-01	2023-08-01 00:00:00	0	0	\N	\N
2190	AGSI-D-23005	63	1	7.50	1	472.5	2023-08-01	0	2023-08-01	2023-08-01 00:00:00	0	0	\N	\N
2191	AGSI-D-23647	36	1	7.50	1	270	2023-08-01	0	2023-08-01	2023-08-01 00:00:00	0	0	\N	\N
2192	AGSI-RE-1303	63	1	7.50	1	472.5	2023-08-01	0	2023-08-01	2023-08-01 00:00:00	0	0	\N	\N
2193	AMSH-RE 0323	62	1	7.50	1	465	2023-08-01	0	2023-08-01	2023-08-01 00:00:00	0	0	\N	\N
2194	AGSI-RE-1001	54	1	7.50	1	405	2023-08-01	0	2023-08-01	2023-08-01 00:00:00	0	0	\N	\N
2195	AGSI-RE-1324	40	1	7.50	1	300	2023-08-01	0	2023-08-01	2023-08-01 00:00:00	0	0	\N	\N
2196	AGSI-RE-1573	34	2	7.50	1	255	2023-08-01	0	2023-08-01	2023-08-01 00:00:00	0	0	\N	\N
2197	AGSI-RE-1593	23	2	7.50	1	172.5	2023-08-01	0	2023-08-01	2023-08-01 00:00:00	0	0	\N	\N
2127	AGSI TRAMITE 14521452	35	2	7.50	1	262.5	2023-08-01	2	2023-08-01	2023-08-03 04:41:07	0	0000001875		2023-08-03
2185	AGSM-RE-0620	47	1	7.50	1	352.5	2023-08-01	2	2023-08-01	2023-08-03 06:33:58	0	0000001880		2023-08-03
2134	AGSI-RE-1687	33	2	7.50	1	247.5	2023-08-01	2	2023-08-01	2023-08-04 06:09:49	0	0000001890		2023-08-04
2129	AGSI-AUXILIAR	12	2	7.50	1	90	2023-08-01	2	2023-08-01	2023-08-07 04:50:34	0	0000001895		2023-08-07
2151	AGSI-RE-0575	40	1	7.50	1	300	2023-08-01	2	2023-08-01	2023-08-07 04:51:08	0	0000001896		2023-08-07
2141	AGSI-RE-1674	36	2	7.50	1	270	2023-08-01	2	2023-08-01	2023-08-11 06:34:20	0	0000001904		2023-08-11
2128	AGSI-RE-0009	28	2	7.50	1	210	2023-08-01	2	2023-08-01	2023-08-15 06:01:28	0	0000001906		2023-08-15
2149	AGSI-RE-0008	82	1	7.50	1	615	2023-08-01	2	2023-08-01	2023-08-15 06:16:29	0	0000001908		2023-08-15
2177	AGSI-RE-0753	60	1	7.50	1	450	2023-08-01	2	2023-08-01	2023-08-15 06:17:33	0	0000001909		2023-08-15
2170	AGSI-RE-0940	60	1	7.50	1	450	2023-08-01	2	2023-08-01	2023-08-16 05:46:37	0	0000001911		2023-08-16
2181	AGSI-RE-1346	32	2	7.50	1	240	2023-08-01	2	2023-08-01	2023-08-16 06:28:09	0	0000001913		2023-08-16
2173	ADKN-2106	44	1	7.50	1	330	2023-08-01	2	2023-08-01	2023-08-17 02:36:09	0	0000001916		2023-08-17
2199	AGSI-RE-1349	60	1	7.50	1	450	2023-08-01	0	2023-08-01	2023-08-01 00:00:00	0	0	\N	\N
2200	AGSI-RE-0886	46	1	7.50	1	690	2023-08-01	0	2023-08-01	2023-08-01 00:00:00	0	0	\N	\N
2201	AGSI-RE-1243	53	1	7.50	1	397.5	2023-08-01	0	2023-08-01	2023-08-01 00:00:00	0	0	\N	\N
2204	AGSP-D-2875	30	2	7.50	1	225	2023-08-01	0	2023-08-01	2023-08-01 00:00:00	0	0	\N	\N
2205	AGSI-RE-0606	32	1	7.50	1	247.5	2023-08-01	0	2023-08-01	2023-08-01 00:00:00	0	0	\N	\N
2206	AGSI-D-TRAMI 023	15	2	7.50	1	112.5	2023-08-01	0	2023-08-01	2023-08-01 00:00:00	0	0	\N	\N
2207	ADKN-RE-0740	63	1	7.50	1	472.5	2023-08-01	0	2023-08-01	2023-08-01 00:00:00	0	0	\N	\N
2208	AGSP-RE-0587	25	2	7.50	1	187.5	2023-08-01	0	2023-08-01	2023-08-01 00:00:00	0	0	\N	\N
2209	AGSI-RE-1264	36	2	7.50	1	270	2023-08-01	0	2023-08-01	2023-08-01 00:00:00	0	0	\N	\N
2210	AGSI-RE-1604	50	1	7.50	1	375	2023-08-01	0	2023-08-01	2023-08-01 00:00:00	0	0	\N	\N
2174	AQYM-D-050	47	1	7.50	1	352.5	2023-08-01	2	2023-08-01	2023-08-02 08:15:46	0	0000001873		2023-08-02
2203	JMP-22159	88	1	7.50	1	660	2023-08-01	2	2023-08-01	2023-08-03 04:41:40	0	0000001876		2023-08-03
2078	AGSM-RE-0620	47	1	7.50	1	352.5	2023-07-01	2	2023-07-01	2023-08-03 06:33:20	0	0000001879		2023-08-03
1931	AGSM-D-1776	43	1	5	1	215	2023-06-01	2	2023-06-01	2023-08-03 08:06:35	0	0000001882		2023-08-03
1986	AGSI-RE-1001	54	1	5	1	270	2023-06-01	2	2023-06-01	2023-08-04 04:12:55	0	0000001886	SE CANCELO EL CANON DE ARRENDAMIENTO DEL MES DE JUNIO DE 270$   SEGUN SERIAL Nª 151646979 DE FECHA 28/07/2023 CON UN MONTO DE 400$ QUEDANDO UN RESTANTE DE 130$ A FAVOR DEL PROPIETARIO PARA ABONAR EL MES DE JULIO.	2023-08-04
2202	AGSI-TU-0072	14	2	7.50	1	105	2023-08-01	2	2023-08-01	2023-08-05 04:41:51	0	0000001893		2023-08-05
2082	AGSI-PE-0829	34	1	7.50	1	255	2023-07-01	2	2023-07-01	2023-08-06 06:01:29	0	0000001894		2023-08-06
2091	AGSI-TU-0058	48	1	7.50	1	360	2023-07-01	2	2023-07-01	2023-08-07 05:34:30	0	0000001897	EL MES DE JULIO FUE CANCELADO EN DOS DEPOSITOS Nª 85237901 POR UN MONTO DE 240 Y LA DIFERENCIA FUE CANCELADA CON EL DEPOSITO Nª 175642485 POR UN MONTO DE 480 Y CON ESE MISMO DEPOSITO CANCELA EL MES DE AGOSTO POR UN MONTO DE 360	2023-08-07
2198	AGSI-TU-0058	48	1	7.50	1	360	2023-08-01	2	2023-08-01	2023-08-07 05:38:41	0	0000001898	EL MES DE AGOSTO FUE CANCELADO CON EL DEPOSITO Nª 175642485 DE FECHA 04/08/2023, ES EL MISMO DEPOSITO QUE CANCELO LA DIFERENCIA DEL MES DE JULIO	2023-08-07
1587	Agsi-re-0678	42	1	5	1	210	2023-06-01	2	2023-02-03	2023-08-08 05:58:48	0			\N
2118	AGSI-D-9005	31	1	7.50	1	247.5	2023-08-01	2	2023-08-01	2023-08-10 02:46:04	0	0000001901	el día 9 de agosto del 2023 se retira de las instalaciones a las 6:51 pm teniendo estos días de tramite para el retiro de la misma la embarcación tenia orden de desalojo desde el mes junio del 2023	2023-08-10
2211	AGSI-RE-1346	32	2	7.50	1	240	2023-09-01	2	2023-08-16	2023-08-16 00:00:00	0	0000001914		\N
2212	AGSI-RE-1346	32	2	7.50	1	240	2023-10-01	2	2023-08-16	2023-08-16 00:00:00	0	0000001915		\N
\.


--
-- TOC entry 3246 (class 0 OID 84673)
-- Dependencies: 222
-- Data for Name: mov_consig; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mov_consig (id_mov_consig, id_mensualidad, id_tipo_pago, nro_referencia, total_ant_d, id_dolar, valor, total_ant_bs, total_abonado_bs, total_abonado_om, restante_bs, restante_om, id_user, id_estatus, fecha_reg, id_banco, fechatrnas) FROM stdin;
2	2	0		0	1	5.77	0	0	0	5.72	33	1	0	2022-02-01	\N	\N
3	3	0		0	1	5.77	0	0	0	7.8	45	1	0	2022-02-01	\N	\N
4	4	0		0	1	5.77	0	0	0	5.72	33	1	0	2022-02-01	\N	\N
6	6	0		0	1	5.77	0	0	0	7.28	42	1	0	2022-02-01	\N	\N
7	7	0		0	1	5.77	0	0	0	5.72	33	1	0	2022-02-01	\N	\N
8	8	0		0	1	5.77	0	0	0	7.63	44	1	0	2022-02-01	\N	\N
9	9	0		0	1	5.77	0	0	0	5.72	33	1	0	2022-02-01	\N	\N
11	11	0		0	1	5.77	0	0	0	1.91	11	1	0	2022-02-01	\N	\N
12	12	0		0	1	5.77	0	0	0	2.43	14	1	0	2022-02-01	\N	\N
15	15	0		0	1	5.77	0	0	0	5.72	33	1	0	2022-02-01	\N	\N
16	16	0		0	1	5.77	0	0	0	3.99	23	1	0	2022-02-01	\N	\N
17	17	0		0	1	5.77	0	0	0	5.72	33	1	0	2022-02-01	\N	\N
18	18	0		0	1	5.77	0	0	0	5.72	33	1	0	2022-02-01	\N	\N
20	20	0		0	1	5.77	0	0	0	5.72	33	1	0	2022-02-01	\N	\N
21	21	0		0	1	5.77	0	0	0	5.72	33	1	0	2022-02-01	\N	\N
22	22	0		0	1	5.77	0	0	0	7.28	42	1	0	2022-02-01	\N	\N
24	24	0		0	1	5.77	0	0	0	4.85	28	1	0	2022-02-01	\N	\N
25	25	0		0	1	5.77	0	0	0	5.72	33	1	0	2022-02-01	\N	\N
26	26	0		0	1	5.77	0	0	0	7.45	43	1	0	2022-02-01	\N	\N
27	27	0		0	1	5.77	0	0	0	9.53	55	1	0	2022-02-01	\N	\N
29	29	0		0	1	5.77	0	0	0	6.41	37	1	0	2022-02-01	\N	\N
30	30	0		0	1	5.77	0	0	0	7.45	43	1	0	2022-02-01	\N	\N
31	31	0		0	1	5.77	0	0	0	5.72	33	1	0	2022-02-01	\N	\N
32	32	0		0	1	5.77	0	0	0	5.72	33	1	0	2022-02-01	\N	\N
33	33	0		0	1	5.77	0	0	0	6.07	35	1	0	2022-02-01	\N	\N
35	35	0		0	1	5.77	0	0	0	6.07	35	1	0	2022-02-01	\N	\N
36	36	0		0	1	5.77	0	0	0	7.8	45	1	0	2022-02-01	\N	\N
37	37	0		0	1	5.77	0	0	0	5.72	33	1	0	2022-02-01	\N	\N
39	39	0		0	1	5.77	0	0	0	6.93	40	1	0	2022-02-01	\N	\N
40	40	0		0	1	5.77	0	0	0	3.47	20	1	0	2022-02-01	\N	\N
41	41	0		0	1	5.77	0	0	0	13.86	80	1	0	2022-02-01	\N	\N
42	42	0		0	1	5.77	0	0	0	7.8	45	1	0	2022-02-01	\N	\N
43	43	0		0	1	5.77	0	0	0	7.11	41	1	0	2022-02-01	\N	\N
44	44	0		0	1	5.77	0	0	0	6.07	35	1	0	2022-02-01	\N	\N
45	45	0		0	1	5.77	0	0	0	3.47	20	1	0	2022-02-01	\N	\N
47	47	0		0	1	5.77	0	0	0	4.16	24	1	0	2022-02-01	\N	\N
48	48	0		0	1	5.77	0	0	0	5.72	33	1	0	2022-02-01	\N	\N
49	49	0		0	1	5.77	0	0	0	5.72	33	1	0	2022-02-01	\N	\N
50	50	0		0	1	5.77	0	0	0	5.72	33	1	0	2022-02-01	\N	\N
51	51	0		0	1	5.77	0	0	0	4.33	25	1	0	2022-02-01	\N	\N
52	52	0		0	1	5.77	0	0	0	5.72	33	1	0	2022-02-01	\N	\N
53	53	0		0	1	5.77	0	0	0	6.24	36	1	0	2022-02-01	\N	\N
54	54	0		0	1	5.77	0	0	0	10.4	60	1	0	2022-02-01	\N	\N
55	55	0		0	1	5.77	0	0	0	5.72	33	1	0	2022-02-01	\N	\N
56	56	0		0	1	5.77	0	0	0	12.13	70	1	0	2022-02-01	\N	\N
57	57	0		0	1	5.77	0	0	0	6.24	36	1	0	2022-02-01	\N	\N
58	58	0		0	1	5.77	0	0	0	10.92	63	1	0	2022-02-01	\N	\N
59	59	0		0	1	5.77	0	0	0	5.72	33	1	0	2022-02-01	\N	\N
60	60	0		0	1	5.77	0	0	0	9.01	52	1	0	2022-02-01	\N	\N
61	61	0		0	1	5.77	0	0	0	8.15	47	1	0	2022-02-01	\N	\N
63	63	0		0	1	5.77	0	0	0	7.28	42	1	0	2022-02-01	\N	\N
64	64	0		0	1	5.77	0	0	0	7.28	42	1	0	2022-02-01	\N	\N
65	65	0		0	1	5.77	0	0	0	8.15	47	1	0	2022-02-01	\N	\N
66	66	0		0	1	5.77	0	0	0	6.24	36	1	0	2022-02-01	\N	\N
67	67	0		0	1	5.77	0	0	0	5.72	33	1	0	2022-02-01	\N	\N
69	69	0		0	1	5.77	0	0	0	6.07	35	1	0	2022-02-01	\N	\N
70	70	0		0	1	5.77	0	0	0	9.53	55	1	0	2022-02-01	\N	\N
71	71	0		0	1	5.77	0	0	0	7.63	44	1	0	2022-02-01	\N	\N
72	72	0		0	1	5.77	0	0	0	8.15	47	1	0	2022-02-01	\N	\N
73	73	0		0	1	5.77	0	0	0	14.73	85	1	0	2022-02-01	\N	\N
74	74	0		0	1	5.77	0	0	0	10.75	62	1	0	2022-02-01	\N	\N
75	75	0		0	1	5.77	0	0	0	14.04	81	1	0	2022-02-01	\N	\N
76	76	0		0	1	5.77	0	0	0	6.24	36	1	0	2022-02-01	\N	\N
80	80	0		0	1	5.77	0	0	0	5.72	33	1	0	2022-02-01	\N	\N
81	81	0		0	1	5.77	0	0	0	5.72	33	1	0	2022-02-01	\N	\N
82	82	0		0	1	5.77	0	0	0	10.05	58	1	0	2022-02-01	\N	\N
83	83	0		0	1	5.77	0	0	0	5.72	33	1	0	2022-02-01	\N	\N
84	84	0		0	1	5.77	0	0	0	15.25	88	1	0	2022-02-01	\N	\N
86	86	0		0	1	5.77	0	0	0	8.32	48	1	0	2022-02-01	\N	\N
87	87	0		0	1	5.77	0	0	0	5.89	34	1	0	2022-02-01	\N	\N
88	88	0		0	1	5.77	0	0	0	5.72	33	1	0	2022-02-01	\N	\N
89	89	0		0	1	5.77	0	0	0	8.15	47	1	0	2022-02-01	\N	\N
77	77	0		0	1	5.77	0	0	0	3.47	19	1	0	2022-02-01	\N	\N
19	19	0		0	1	5.77	0	0	0	3.81	33	1	0	2022-02-01	\N	\N
1522	19	3		33	1	4.38	144,54	144,54	33	0	0	5	2	2022-09-05	0	2022-09-05
13	13	0		0	1	5.77	0	0	0	2.08	11	1	0	2022-02-01	\N	\N
85	85	0		0	1	5.77	0	0	0	4.16	33	1	0	2022-02-01	\N	\N
1539	847	3		225	1	5.77	1.298,25	1.298,25	225	0	0	1	2	2022-09-06	0	2022-09-06
1541	879	3		225	1	5.77	1.298,25	1.298,25	225	0	0	1	2	2022-09-06	0	2022-09-06
1557	677	1	1276723479	95	1	5.61	532,95	532,95	95	0	0	1	2	2022-09-07	6	2022-07-11
1572	416	3		350	1	5.07	1.774,5	1.774,5	350	0	0	1	2	2022-09-07	0	2022-09-07
1585	667	3		165	1	7.99	1.318,35	1.318,35	165	-0	0	1	2	2022-09-09	0	2022-09-09
90	90	0		0	1	5.77	0	0	0	10.05	58	1	0	2022-02-01	\N	\N
92	92	0		0	1	5.77	0	0	0	5.72	33	1	0	2022-02-01	\N	\N
93	93	0		0	1	5.77	0	0	0	6.07	35	1	0	2022-02-01	\N	\N
94	94	0		0	1	5.77	0	0	0	5.72	33	1	0	2022-02-01	\N	\N
95	95	0		0	1	5.77	0	0	0	4.16	24	1	0	2022-02-01	\N	\N
96	96	0		0	1	5.77	0	0	0	5.72	33	1	0	2022-02-01	\N	\N
97	97	0		0	1	5.77	0	0	0	7.45	43	1	0	2022-02-01	\N	\N
98	98	0		0	1	5.77	0	0	0	5.89	34	1	0	2022-02-01	\N	\N
99	99	0		0	1	5.77	0	0	0	10.92	63	1	0	2022-02-01	\N	\N
100	100	0		0	1	5.77	0	0	0	6.24	36	1	0	2022-02-01	\N	\N
102	102	0		0	1	5.77	0	0	0	10.75	62	1	0	2022-02-01	\N	\N
103	103	0		0	1	5.77	0	0	0	9.36	54	1	0	2022-02-01	\N	\N
104	104	0		0	1	5.77	0	0	0	6.93	40	1	0	2022-02-01	\N	\N
106	106	0		0	1	5.77	0	0	0	10.92	63	1	0	2022-02-01	\N	\N
107	107	0		0	1	5.77	0	0	0	8.32	48	1	0	2022-02-01	\N	\N
108	108	0		0	1	5.77	0	0	0	5.72	33	1	0	2022-02-01	\N	\N
109	109	0		0	1	5.77	0	0	0	10.4	60	1	0	2022-02-01	\N	\N
110	110	0		0	1	5.77	0	0	0	7.97	46	1	0	2022-02-01	\N	\N
111	111	0		0	1	5.77	0	0	0	9.19	53	1	0	2022-02-01	\N	\N
113	113	0		0	1	5.77	0	0	0	6.93	40	1	0	2022-02-01	\N	\N
114	114	0		0	1	5.77	0	0	0	8.67	50	1	0	2022-02-01	\N	\N
116	116	0		0	1	5.77	0	0	0	6.07	35	1	0	2022-02-01	\N	\N
117	117	0		0	1	5.77	0	0	0	5.72	33	1	0	2022-02-01	\N	\N
118	118	0		0	1	5.77	0	0	0	5.72	33	1	0	2022-02-01	\N	\N
119	119	0		0	1	5.77	0	0	0	2.6	15	1	0	2022-02-01	\N	\N
122	122	0		0	1	5.77	0	0	0	5.72	33	1	0	2022-03-01	\N	\N
123	123	0		0	1	5.77	0	0	0	7.8	45	1	0	2022-03-01	\N	\N
124	124	0		0	1	5.77	0	0	0	5.72	33	1	0	2022-03-01	\N	\N
125	125	0		0	1	5.77	0	0	0	8.15	47	1	0	2022-03-01	\N	\N
126	126	0		0	1	5.77	0	0	0	7.28	42	1	0	2022-03-01	\N	\N
127	127	0		0	1	5.77	0	0	0	5.72	33	1	0	2022-03-01	\N	\N
128	128	0		0	1	5.77	0	0	0	7.63	44	1	0	2022-03-01	\N	\N
129	129	0		0	1	5.77	0	0	0	5.72	33	1	0	2022-03-01	\N	\N
131	131	0		0	1	5.77	0	0	0	1.91	11	1	0	2022-03-01	\N	\N
132	132	0		0	1	5.77	0	0	0	2.43	14	1	0	2022-03-01	\N	\N
134	134	0		0	1	5.77	0	0	0	10.05	58	1	0	2022-03-01	\N	\N
135	135	0		0	1	5.77	0	0	0	5.72	33	1	0	2022-03-01	\N	\N
136	136	0		0	1	5.77	0	0	0	3.99	23	1	0	2022-03-01	\N	\N
137	137	0		0	1	5.77	0	0	0	5.72	33	1	0	2022-03-01	\N	\N
138	138	0		0	1	5.77	0	0	0	5.72	33	1	0	2022-03-01	\N	\N
140	140	0		0	1	5.77	0	0	0	5.72	33	1	0	2022-03-01	\N	\N
141	141	0		0	1	5.77	0	0	0	5.72	33	1	0	2022-03-01	\N	\N
142	142	0		0	1	5.77	0	0	0	7.28	42	1	0	2022-03-01	\N	\N
144	144	0		0	1	5.77	0	0	0	4.85	28	1	0	2022-03-01	\N	\N
145	145	0		0	1	5.77	0	0	0	5.72	33	1	0	2022-03-01	\N	\N
146	146	0		0	1	5.77	0	0	0	7.45	43	1	0	2022-03-01	\N	\N
147	147	0		0	1	5.77	0	0	0	9.53	55	1	0	2022-03-01	\N	\N
149	149	0		0	1	5.77	0	0	0	6.41	37	1	0	2022-03-01	\N	\N
150	150	0		0	1	5.77	0	0	0	7.45	43	1	0	2022-03-01	\N	\N
151	151	0		0	1	5.77	0	0	0	5.72	33	1	0	2022-03-01	\N	\N
152	152	0		0	1	5.77	0	0	0	5.72	33	1	0	2022-03-01	\N	\N
153	153	0		0	1	5.77	0	0	0	6.07	35	1	0	2022-03-01	\N	\N
155	155	0		0	1	5.77	0	0	0	6.07	35	1	0	2022-03-01	\N	\N
156	156	0		0	1	5.77	0	0	0	7.8	45	1	0	2022-03-01	\N	\N
157	157	0		0	1	5.77	0	0	0	5.72	33	1	0	2022-03-01	\N	\N
159	159	0		0	1	5.77	0	0	0	6.93	40	1	0	2022-03-01	\N	\N
160	160	0		0	1	5.77	0	0	0	3.47	20	1	0	2022-03-01	\N	\N
161	161	0		0	1	5.77	0	0	0	13.86	80	1	0	2022-03-01	\N	\N
162	162	0		0	1	5.77	0	0	0	7.8	45	1	0	2022-03-01	\N	\N
163	163	0		0	1	5.77	0	0	0	7.11	41	1	0	2022-03-01	\N	\N
164	164	0		0	1	5.77	0	0	0	6.07	35	1	0	2022-03-01	\N	\N
165	165	0		0	1	5.77	0	0	0	3.47	20	1	0	2022-03-01	\N	\N
167	167	0		0	1	5.77	0	0	0	4.16	24	1	0	2022-03-01	\N	\N
168	168	0		0	1	5.77	0	0	0	5.72	33	1	0	2022-03-01	\N	\N
169	169	0		0	1	5.77	0	0	0	5.72	33	1	0	2022-03-01	\N	\N
171	171	0		0	1	5.77	0	0	0	4.33	25	1	0	2022-03-01	\N	\N
172	172	0		0	1	5.77	0	0	0	5.72	33	1	0	2022-03-01	\N	\N
173	173	0		0	1	5.77	0	0	0	6.24	36	1	0	2022-03-01	\N	\N
174	174	0		0	1	5.77	0	0	0	10.4	60	1	0	2022-03-01	\N	\N
175	175	0		0	1	5.77	0	0	0	5.72	33	1	0	2022-03-01	\N	\N
176	176	0		0	1	5.77	0	0	0	12.13	70	1	0	2022-03-01	\N	\N
177	177	0		0	1	5.77	0	0	0	6.24	36	1	0	2022-03-01	\N	\N
139	139	0		0	1	5.77	0	0	0	3.81	33	1	0	2022-03-01	\N	\N
1523	139	3		33	1	4.38	144,54	190,41	33	0	0	5	2	2022-09-05	0	2022-09-05
112	112	0		0	1	5.77	0	0	0	2.43	33	1	0	2022-02-01	\N	\N
133	133	0		0	1	5.77	0	0	0	2.08	11	1	0	2022-03-01	\N	\N
1540	978	3		225	1	5.77	1.298,25	1.298,25	225	0	0	1	2	2022-09-06	0	2022-09-06
1542	749	3		185	1	7.91	1.463,35	1.463,35	185	-0	0	1	2	2022-09-07	0	2022-09-07
1558	797	1	137442138	95	1	5.84	554,8	554,8	95	0	0	1	2	2022-09-07	6	2022-08-05
1573	536	3		350	1	5.53	1.935,5	1.935,5	350	0	0	1	2	2022-09-07	0	2022-09-07
1586	787	3		165	1	7.99	1.318,35	1.318,35	165	-0	0	1	2	2022-09-09	0	2022-09-09
178	178	0		0	1	5.77	0	0	0	10.92	63	1	0	2022-03-01	\N	\N
179	179	0		0	1	5.77	0	0	0	5.72	33	1	0	2022-03-01	\N	\N
180	180	0		0	1	5.77	0	0	0	9.01	52	1	0	2022-03-01	\N	\N
181	181	0		0	1	5.77	0	0	0	8.15	47	1	0	2022-03-01	\N	\N
182	182	0		0	1	5.77	0	0	0	6.24	36	1	0	2022-03-01	\N	\N
183	183	0		0	1	5.77	0	0	0	7.28	42	1	0	2022-03-01	\N	\N
184	184	0		0	1	5.77	0	0	0	7.28	42	1	0	2022-03-01	\N	\N
185	185	0		0	1	5.77	0	0	0	8.15	47	1	0	2022-03-01	\N	\N
186	186	0		0	1	5.77	0	0	0	6.24	36	1	0	2022-03-01	\N	\N
187	187	0		0	1	5.77	0	0	0	5.72	33	1	0	2022-03-01	\N	\N
188	188	0		0	1	5.77	0	0	0	8.15	47	1	0	2022-03-01	\N	\N
189	189	0		0	1	5.77	0	0	0	6.07	35	1	0	2022-03-01	\N	\N
190	190	0		0	1	5.77	0	0	0	9.53	55	1	0	2022-03-01	\N	\N
191	191	0		0	1	5.77	0	0	0	7.63	44	1	0	2022-03-01	\N	\N
192	192	0		0	1	5.77	0	0	0	8.15	47	1	0	2022-03-01	\N	\N
193	193	0		0	1	5.77	0	0	0	14.73	85	1	0	2022-03-01	\N	\N
194	194	0		0	1	5.77	0	0	0	10.75	62	1	0	2022-03-01	\N	\N
195	195	0		0	1	5.77	0	0	0	14.04	81	1	0	2022-03-01	\N	\N
196	196	0		0	1	5.77	0	0	0	6.24	36	1	0	2022-03-01	\N	\N
200	200	0		0	1	5.77	0	0	0	5.72	33	1	0	2022-03-01	\N	\N
201	201	0		0	1	5.77	0	0	0	5.72	33	1	0	2022-03-01	\N	\N
202	202	0		0	1	5.77	0	0	0	10.05	58	1	0	2022-03-01	\N	\N
203	203	0		0	1	5.77	0	0	0	5.72	33	1	0	2022-03-01	\N	\N
204	204	0		0	1	5.77	0	0	0	15.25	88	1	0	2022-03-01	\N	\N
206	206	0		0	1	5.77	0	0	0	8.32	48	1	0	2022-03-01	\N	\N
207	207	0		0	1	5.77	0	0	0	5.89	34	1	0	2022-03-01	\N	\N
208	208	0		0	1	5.77	0	0	0	5.72	33	1	0	2022-03-01	\N	\N
209	209	0		0	1	5.77	0	0	0	8.15	47	1	0	2022-03-01	\N	\N
210	210	0		0	1	5.77	0	0	0	10.05	58	1	0	2022-03-01	\N	\N
212	212	0		0	1	5.77	0	0	0	5.72	33	1	0	2022-03-01	\N	\N
213	213	0		0	1	5.77	0	0	0	6.07	35	1	0	2022-03-01	\N	\N
214	214	0		0	1	5.77	0	0	0	5.72	33	1	0	2022-03-01	\N	\N
215	215	0		0	1	5.77	0	0	0	4.16	24	1	0	2022-03-01	\N	\N
216	216	0		0	1	5.77	0	0	0	5.72	33	1	0	2022-03-01	\N	\N
217	217	0		0	1	5.77	0	0	0	7.45	43	1	0	2022-03-01	\N	\N
218	218	0		0	1	5.77	0	0	0	5.89	34	1	0	2022-03-01	\N	\N
219	219	0		0	1	5.77	0	0	0	10.92	63	1	0	2022-03-01	\N	\N
220	220	0		0	1	5.77	0	0	0	6.24	36	1	0	2022-03-01	\N	\N
222	222	0		0	1	5.77	0	0	0	10.75	62	1	0	2022-03-01	\N	\N
223	223	0		0	1	5.77	0	0	0	9.36	54	1	0	2022-03-01	\N	\N
224	224	0		0	1	5.77	0	0	0	6.93	40	1	0	2022-03-01	\N	\N
226	226	0		0	1	5.77	0	0	0	10.92	63	1	0	2022-03-01	\N	\N
227	227	0		0	1	5.77	0	0	0	8.32	48	1	0	2022-03-01	\N	\N
228	228	0		0	1	5.77	0	0	0	5.72	33	1	0	2022-03-01	\N	\N
229	229	0		0	1	5.77	0	0	0	10.4	60	1	0	2022-03-01	\N	\N
230	230	0		0	1	5.77	0	0	0	7.97	46	1	0	2022-03-01	\N	\N
231	231	0		0	1	5.77	0	0	0	9.19	53	1	0	2022-03-01	\N	\N
233	233	0		0	1	5.77	0	0	0	6.93	40	1	0	2022-03-01	\N	\N
234	234	0		0	1	5.77	0	0	0	8.67	50	1	0	2022-03-01	\N	\N
236	236	0		0	1	5.77	0	0	0	6.07	35	1	0	2022-03-01	\N	\N
237	237	0		0	1	5.77	0	0	0	5.72	33	1	0	2022-03-01	\N	\N
238	238	0		0	1	5.77	0	0	0	5.72	33	1	0	2022-03-01	\N	\N
239	239	0		0	1	5.77	0	0	0	2.6	15	1	0	2022-03-01	\N	\N
242	242	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-04-01	\N	\N
243	243	0		0	1	5.77	0	0	0	38.99	225	1	0	2022-04-01	\N	\N
244	244	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-04-01	\N	\N
245	245	0		0	1	5.77	0	0	0	40.73	235	1	0	2022-04-01	\N	\N
246	246	0		0	1	5.77	0	0	0	36.4	210	1	0	2022-04-01	\N	\N
247	247	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-04-01	\N	\N
248	248	0		0	1	5.77	0	0	0	38.13	220	1	0	2022-04-01	\N	\N
249	249	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-04-01	\N	\N
251	251	0		0	1	5.77	0	0	0	9.53	55	1	0	2022-04-01	\N	\N
252	252	0		0	1	5.77	0	0	0	12.13	70	1	0	2022-04-01	\N	\N
254	254	0		0	1	5.77	0	0	0	50.26	290	1	0	2022-04-01	\N	\N
255	255	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-04-01	\N	\N
257	257	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-04-01	\N	\N
258	258	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-04-01	\N	\N
260	260	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-04-01	\N	\N
261	261	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-04-01	\N	\N
262	262	0		0	1	5.77	0	0	0	36.4	210	1	0	2022-04-01	\N	\N
264	264	0		0	1	5.77	0	0	0	24.26	140	1	0	2022-04-01	\N	\N
265	265	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-04-01	\N	\N
197	197	0		0	1	5.77	0	0	0	3.47	19	1	0	2022-03-01	\N	\N
235	235	0		0	1	5.77	0	0	0	6.24	30	1	0	2022-03-01	\N	\N
259	259	0		0	1	5.77	0	0	0	5.72	110	1	0	2022-04-01	\N	\N
1524	259	3		110	1	4.49	493,9	493,9	110	-0	0	5	2	2022-09-05	0	2022-09-05
232	232	0		0	1	5.77	0	0	0	2.43	33	1	0	2022-03-01	\N	\N
205	205	0		0	1	5.77	0	0	0	4.16	33	1	0	2022-03-01	\N	\N
253	253	0		0	1	5.77	0	0	0	10.4	55	1	0	2022-04-01	\N	\N
1543	781	3		235	1	7.91	1.858,85	1.858,85	235	-0	0	1	2	2022-09-07	0	2022-09-07
1559	115	3		30	1	4.38	131,4	131,4	30	0	0	1	2	2022-09-07	0	2022-09-07
1574	656	3		350	1	5.78	2.023	2.023	350	0	0	1	2	2022-09-07	0	2022-09-07
1587	548	0		0	1	5.77	0	0	0	40.73	235	1	0	2022-09-09	\N	\N
266	266	0		0	1	5.77	0	0	0	37.26	215	1	0	2022-04-01	\N	\N
267	267	0		0	1	5.77	0	0	0	47.66	275	1	0	2022-04-01	\N	\N
269	269	0		0	1	5.77	0	0	0	32.06	185	1	0	2022-04-01	\N	\N
270	270	0		0	1	5.77	0	0	0	37.26	215	1	0	2022-04-01	\N	\N
271	271	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-04-01	\N	\N
272	272	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-04-01	\N	\N
273	273	0		0	1	5.77	0	0	0	30.33	175	1	0	2022-04-01	\N	\N
275	275	0		0	1	5.77	0	0	0	30.33	175	1	0	2022-04-01	\N	\N
276	276	0		0	1	5.77	0	0	0	38.99	225	1	0	2022-04-01	\N	\N
277	277	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-04-01	\N	\N
279	279	0		0	1	5.77	0	0	0	34.66	200	1	0	2022-04-01	\N	\N
280	280	0		0	1	5.77	0	0	0	17.33	100	1	0	2022-04-01	\N	\N
281	281	0		0	1	5.77	0	0	0	69.32	400	1	0	2022-04-01	\N	\N
282	282	0		0	1	5.77	0	0	0	38.99	225	1	0	2022-04-01	\N	\N
283	283	0		0	1	5.77	0	0	0	35.53	205	1	0	2022-04-01	\N	\N
284	284	0		0	1	5.77	0	0	0	30.33	175	1	0	2022-04-01	\N	\N
285	285	0		0	1	5.77	0	0	0	17.33	100	1	0	2022-04-01	\N	\N
287	287	0		0	1	5.77	0	0	0	20.8	120	1	0	2022-04-01	\N	\N
288	288	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-04-01	\N	\N
289	289	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-04-01	\N	\N
290	290	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-04-01	\N	\N
291	291	0		0	1	5.77	0	0	0	21.66	125	1	0	2022-04-01	\N	\N
292	292	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-04-01	\N	\N
293	293	0		0	1	5.77	0	0	0	31.2	180	1	0	2022-04-01	\N	\N
294	294	0		0	1	5.77	0	0	0	51.99	300	1	0	2022-04-01	\N	\N
295	295	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-04-01	\N	\N
296	296	0		0	1	5.77	0	0	0	60.66	350	1	0	2022-04-01	\N	\N
297	297	0		0	1	5.77	0	0	0	31.2	180	1	0	2022-04-01	\N	\N
298	298	0		0	1	5.77	0	0	0	54.59	315	1	0	2022-04-01	\N	\N
299	299	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-04-01	\N	\N
300	300	0		0	1	5.77	0	0	0	45.06	260	1	0	2022-04-01	\N	\N
301	301	0		0	1	5.77	0	0	0	40.73	235	1	0	2022-04-01	\N	\N
303	303	0		0	1	5.77	0	0	0	36.4	210	1	0	2022-04-01	\N	\N
304	304	0		0	1	5.77	0	0	0	36.4	210	1	0	2022-04-01	\N	\N
305	305	0		0	1	5.77	0	0	0	40.73	235	1	0	2022-04-01	\N	\N
306	306	0		0	1	5.77	0	0	0	31.2	180	1	0	2022-04-01	\N	\N
307	307	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-04-01	\N	\N
308	308	0		0	1	5.77	0	0	0	40.73	235	1	0	2022-04-01	\N	\N
309	309	0		0	1	5.77	0	0	0	30.33	175	1	0	2022-04-01	\N	\N
310	310	0		0	1	5.77	0	0	0	47.66	275	1	0	2022-04-01	\N	\N
311	311	0		0	1	5.77	0	0	0	38.13	220	1	0	2022-04-01	\N	\N
312	312	0		0	1	5.77	0	0	0	40.73	235	1	0	2022-04-01	\N	\N
313	313	0		0	1	5.77	0	0	0	73.66	425	1	0	2022-04-01	\N	\N
314	314	0		0	1	5.77	0	0	0	53.73	310	1	0	2022-04-01	\N	\N
315	315	0		0	1	5.77	0	0	0	70.19	405	1	0	2022-04-01	\N	\N
316	316	0		0	1	5.77	0	0	0	31.2	180	1	0	2022-04-01	\N	\N
320	320	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-04-01	\N	\N
321	321	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-04-01	\N	\N
322	322	0		0	1	5.77	0	0	0	50.26	290	1	0	2022-04-01	\N	\N
323	323	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-04-01	\N	\N
324	324	0		0	1	5.77	0	0	0	76.26	440	1	0	2022-04-01	\N	\N
326	326	0		0	1	5.77	0	0	0	41.59	240	1	0	2022-04-01	\N	\N
327	327	0		0	1	5.77	0	0	0	29.46	170	1	0	2022-04-01	\N	\N
328	328	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-04-01	\N	\N
329	329	0		0	1	5.77	0	0	0	40.73	235	1	0	2022-04-01	\N	\N
330	330	0		0	1	5.77	0	0	0	50.26	290	1	0	2022-04-01	\N	\N
332	332	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-04-01	\N	\N
333	333	0		0	1	5.77	0	0	0	30.33	175	1	0	2022-04-01	\N	\N
334	334	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-04-01	\N	\N
335	335	0		0	1	5.77	0	0	0	20.8	120	1	0	2022-04-01	\N	\N
336	336	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-04-01	\N	\N
337	337	0		0	1	5.77	0	0	0	37.26	215	1	0	2022-04-01	\N	\N
338	338	0		0	1	5.77	0	0	0	29.46	170	1	0	2022-04-01	\N	\N
339	339	0		0	1	5.77	0	0	0	54.59	315	1	0	2022-04-01	\N	\N
340	340	0		0	1	5.77	0	0	0	31.2	180	1	0	2022-04-01	\N	\N
342	342	0		0	1	5.77	0	0	0	53.73	310	1	0	2022-04-01	\N	\N
343	343	0		0	1	5.77	0	0	0	46.79	270	1	0	2022-04-01	\N	\N
344	344	0		0	1	5.77	0	0	0	34.66	200	1	0	2022-04-01	\N	\N
345	345	0		0	1	5.77	0	0	0	19.93	115	1	0	2022-04-01	\N	\N
347	347	0		0	1	5.77	0	0	0	41.59	240	1	0	2022-04-01	\N	\N
348	348	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-04-01	\N	\N
349	349	0		0	1	5.77	0	0	0	51.99	300	1	0	2022-04-01	\N	\N
350	350	0		0	1	5.77	0	0	0	39.86	230	1	0	2022-04-01	\N	\N
351	351	0		0	1	5.77	0	0	0	45.93	265	1	0	2022-04-01	\N	\N
352	352	0		0	1	5.77	0	0	0	12.13	70	1	0	2022-04-01	\N	\N
353	353	0		0	1	5.77	0	0	0	34.66	200	1	0	2022-04-01	\N	\N
354	354	0		0	1	5.77	0	0	0	43.33	250	1	0	2022-04-01	\N	\N
317	317	0		0	1	5.77	0	0	0	17.33	95	1	0	2022-04-01	\N	\N
1525	379	3		110	1	5.07	557,7	634,7	110	0	0	5	2	2022-09-05	0	2022-09-05
325	325	0		0	1	5.77	0	0	0	20.8	165	1	0	2022-04-01	\N	\N
1544	728	3		220	1	7.91	1.740,2	1.740,2	220	0	0	1	2	2022-09-07	0	2022-09-07
1560	235	3		30	1	4.38	131,4	131,4	30	0	0	1	2	2022-09-07	0	2022-09-07
1575	740	3		165	1	5.77	952,05	952,05	165	0	0	1	2	2022-09-08	0	2022-09-08
1588	668	0		0	1	5.77	0	0	0	40.73	235	1	0	2022-09-09	\N	\N
356	356	0		0	1	5.77	0	0	0	30.33	175	1	0	2022-04-01	\N	\N
357	357	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-04-01	\N	\N
358	358	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-04-01	\N	\N
359	359	0		0	1	5.77	0	0	0	13	75	1	0	2022-04-01	\N	\N
360	360	0		0	1	5.77	0	0	0	21.66	125	1	0	2022-04-01	\N	\N
362	362	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-05-01	\N	\N
363	363	0		0	1	5.77	0	0	0	38.99	225	1	0	2022-05-01	\N	\N
364	364	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-05-01	\N	\N
365	365	0		0	1	5.77	0	0	0	40.73	235	1	0	2022-05-01	\N	\N
366	366	0		0	1	5.77	0	0	0	36.4	210	1	0	2022-05-01	\N	\N
367	367	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-05-01	\N	\N
368	368	0		0	1	5.77	0	0	0	38.13	220	1	0	2022-05-01	\N	\N
369	369	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-05-01	\N	\N
371	371	0		0	1	5.77	0	0	0	9.53	55	1	0	2022-05-01	\N	\N
372	372	0		0	1	5.77	0	0	0	12.13	70	1	0	2022-05-01	\N	\N
374	374	0		0	1	5.77	0	0	0	50.26	290	1	0	2022-05-01	\N	\N
375	375	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-05-01	\N	\N
376	376	0		0	1	5.77	0	0	0	19.93	115	1	0	2022-05-01	\N	\N
377	377	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-05-01	\N	\N
378	378	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-05-01	\N	\N
380	380	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-05-01	\N	\N
381	381	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-05-01	\N	\N
382	382	0		0	1	5.77	0	0	0	36.4	210	1	0	2022-05-01	\N	\N
384	384	0		0	1	5.77	0	0	0	24.26	140	1	0	2022-05-01	\N	\N
385	385	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-05-01	\N	\N
386	386	0		0	1	5.77	0	0	0	37.26	215	1	0	2022-05-01	\N	\N
387	387	0		0	1	5.77	0	0	0	47.66	275	1	0	2022-05-01	\N	\N
389	389	0		0	1	5.77	0	0	0	32.06	185	1	0	2022-05-01	\N	\N
390	390	0		0	1	5.77	0	0	0	37.26	215	1	0	2022-05-01	\N	\N
391	391	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-05-01	\N	\N
392	392	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-05-01	\N	\N
393	393	0		0	1	5.77	0	0	0	30.33	175	1	0	2022-05-01	\N	\N
395	395	0		0	1	5.77	0	0	0	30.33	175	1	0	2022-05-01	\N	\N
396	396	0		0	1	5.77	0	0	0	38.99	225	1	0	2022-05-01	\N	\N
397	397	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-05-01	\N	\N
398	398	0		0	1	5.77	0	0	0	99.65	575	1	0	2022-05-01	\N	\N
399	399	0		0	1	5.77	0	0	0	34.66	200	1	0	2022-05-01	\N	\N
400	400	0		0	1	5.77	0	0	0	17.33	100	1	0	2022-05-01	\N	\N
401	401	0		0	1	5.77	0	0	0	69.32	400	1	0	2022-05-01	\N	\N
402	402	0		0	1	5.77	0	0	0	38.99	225	1	0	2022-05-01	\N	\N
403	403	0		0	1	5.77	0	0	0	35.53	205	1	0	2022-05-01	\N	\N
404	404	0		0	1	5.77	0	0	0	30.33	175	1	0	2022-05-01	\N	\N
405	405	0		0	1	5.77	0	0	0	17.33	100	1	0	2022-05-01	\N	\N
407	407	0		0	1	5.77	0	0	0	20.8	120	1	0	2022-05-01	\N	\N
408	408	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-05-01	\N	\N
409	409	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-05-01	\N	\N
410	410	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-05-01	\N	\N
411	411	0		0	1	5.77	0	0	0	21.66	125	1	0	2022-05-01	\N	\N
412	412	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-05-01	\N	\N
413	413	0		0	1	5.77	0	0	0	31.2	180	1	0	2022-05-01	\N	\N
414	414	0		0	1	5.77	0	0	0	51.99	300	1	0	2022-05-01	\N	\N
415	415	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-05-01	\N	\N
416	416	0		0	1	5.77	0	0	0	60.66	350	1	0	2022-05-01	\N	\N
417	417	0		0	1	5.77	0	0	0	31.2	180	1	0	2022-05-01	\N	\N
418	418	0		0	1	5.77	0	0	0	54.59	315	1	0	2022-05-01	\N	\N
419	419	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-05-01	\N	\N
420	420	0		0	1	5.77	0	0	0	45.06	260	1	0	2022-05-01	\N	\N
421	421	0		0	1	5.77	0	0	0	40.73	235	1	0	2022-05-01	\N	\N
423	423	0		0	1	5.77	0	0	0	36.4	210	1	0	2022-05-01	\N	\N
424	424	0		0	1	5.77	0	0	0	36.4	210	1	0	2022-05-01	\N	\N
425	425	0		0	1	5.77	0	0	0	40.73	235	1	0	2022-05-01	\N	\N
426	426	0		0	1	5.77	0	0	0	31.2	180	1	0	2022-05-01	\N	\N
427	427	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-05-01	\N	\N
428	428	0		0	1	5.77	0	0	0	40.73	235	1	0	2022-05-01	\N	\N
429	429	0		0	1	5.77	0	0	0	30.33	175	1	0	2022-05-01	\N	\N
430	430	0		0	1	5.77	0	0	0	47.66	275	1	0	2022-05-01	\N	\N
431	431	0		0	1	5.77	0	0	0	38.13	220	1	0	2022-05-01	\N	\N
432	432	0		0	1	5.77	0	0	0	40.73	235	1	0	2022-05-01	\N	\N
433	433	0		0	1	5.77	0	0	0	73.66	425	1	0	2022-05-01	\N	\N
434	434	0		0	1	5.77	0	0	0	53.73	310	1	0	2022-05-01	\N	\N
435	435	0		0	1	5.77	0	0	0	70.19	405	1	0	2022-05-01	\N	\N
436	436	0		0	1	5.77	0	0	0	31.2	180	1	0	2022-05-01	\N	\N
438	438	0		0	1	5.77	0	0	0	51.99	300	1	0	2022-05-01	\N	\N
440	440	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-05-01	\N	\N
441	441	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-05-01	\N	\N
442	442	0		0	1	5.77	0	0	0	50.26	290	1	0	2022-05-01	\N	\N
443	443	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-05-01	\N	\N
437	437	0		0	1	5.77	0	0	0	17.33	95	1	0	2022-05-01	\N	\N
355	355	0		0	1	5.77	0	0	0	31.2	150	1	0	2022-04-01	\N	\N
379	379	0		0	1	5.77	0	0	0	5.72	110	1	0	2022-05-01	\N	\N
1526	499	3		110	1	5.53	608,3	608,3	110	-0	0	5	2	2022-09-05	0	2022-09-05
373	373	0		0	1	5.77	0	0	0	10.4	55	1	0	2022-05-01	\N	\N
1545	79	3		28	1	4.38	122,64	122,64	28	0	0	1	2	2022-09-07	0	2022-09-07
1561	355	1	137896	150	1	4.95	742,5	742,5	150	0	0	1	2	2022-09-07	10	2022-05-25
1589	548	3		235	1	7.99	1.877,65	1.877,65	235	0	0	1	2	2022-09-09	0	2022-09-09
444	444	0		0	1	5.77	0	0	0	76.26	440	1	0	2022-05-01	\N	\N
445	445	0		0	1	5.77	0	0	0	20.8	120	1	0	2022-05-01	\N	\N
446	446	0		0	1	5.77	0	0	0	41.59	240	1	0	2022-05-01	\N	\N
447	447	0		0	1	5.77	0	0	0	29.46	170	1	0	2022-05-01	\N	\N
448	448	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-05-01	\N	\N
449	449	0		0	1	5.77	0	0	0	40.73	235	1	0	2022-05-01	\N	\N
450	450	0		0	1	5.77	0	0	0	50.26	290	1	0	2022-05-01	\N	\N
452	452	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-05-01	\N	\N
453	453	0		0	1	5.77	0	0	0	30.33	175	1	0	2022-05-01	\N	\N
454	454	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-05-01	\N	\N
455	455	0		0	1	5.77	0	0	0	20.8	120	1	0	2022-05-01	\N	\N
456	456	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-05-01	\N	\N
457	457	0		0	1	5.77	0	0	0	37.26	215	1	0	2022-05-01	\N	\N
458	458	0		0	1	5.77	0	0	0	29.46	170	1	0	2022-05-01	\N	\N
459	459	0		0	1	5.77	0	0	0	54.59	315	1	0	2022-05-01	\N	\N
460	460	0		0	1	5.77	0	0	0	31.2	180	1	0	2022-05-01	\N	\N
461	461	0		0	1	5.77	0	0	0	54.59	315	1	0	2022-05-01	\N	\N
462	462	0		0	1	5.77	0	0	0	53.73	310	1	0	2022-05-01	\N	\N
463	463	0		0	1	5.77	0	0	0	46.79	270	1	0	2022-05-01	\N	\N
464	464	0		0	1	5.77	0	0	0	34.66	200	1	0	2022-05-01	\N	\N
465	465	0		0	1	5.77	0	0	0	19.93	115	1	0	2022-05-01	\N	\N
466	466	0		0	1	5.77	0	0	0	54.59	315	1	0	2022-05-01	\N	\N
467	467	0		0	1	5.77	0	0	0	41.59	240	1	0	2022-05-01	\N	\N
468	468	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-05-01	\N	\N
469	469	0		0	1	5.77	0	0	0	51.99	300	1	0	2022-05-01	\N	\N
470	470	0		0	1	5.77	0	0	0	39.86	230	1	0	2022-05-01	\N	\N
471	471	0		0	1	5.77	0	0	0	45.93	265	1	0	2022-05-01	\N	\N
472	472	0		0	1	5.77	0	0	0	12.13	70	1	0	2022-05-01	\N	\N
473	473	0		0	1	5.77	0	0	0	34.66	200	1	0	2022-05-01	\N	\N
474	474	0		0	1	5.77	0	0	0	43.33	250	1	0	2022-05-01	\N	\N
476	476	0		0	1	5.77	0	0	0	30.33	175	1	0	2022-05-01	\N	\N
477	477	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-05-01	\N	\N
478	478	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-05-01	\N	\N
479	479	0		0	1	5.77	0	0	0	13	75	1	0	2022-05-01	\N	\N
480	480	0		0	1	5.77	0	0	0	21.66	125	1	0	2022-05-01	\N	\N
482	482	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-06-01	\N	\N
483	483	0		0	1	5.77	0	0	0	38.99	225	1	0	2022-06-01	\N	\N
484	484	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-06-01	\N	\N
485	485	0		0	1	5.77	0	0	0	40.73	235	1	0	2022-06-01	\N	\N
486	486	0		0	1	5.77	0	0	0	36.4	210	1	0	2022-06-01	\N	\N
487	487	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-06-01	\N	\N
488	488	0		0	1	5.77	0	0	0	38.13	220	1	0	2022-06-01	\N	\N
490	490	0		0	1	5.77	0	0	0	38.13	220	1	0	2022-06-01	\N	\N
491	491	0		0	1	5.77	0	0	0	9.53	55	1	0	2022-06-01	\N	\N
492	492	0		0	1	5.77	0	0	0	12.13	70	1	0	2022-06-01	\N	\N
494	494	0		0	1	5.77	0	0	0	50.26	290	1	0	2022-06-01	\N	\N
495	495	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-06-01	\N	\N
496	496	0		0	1	5.77	0	0	0	19.93	115	1	0	2022-06-01	\N	\N
497	497	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-06-01	\N	\N
498	498	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-06-01	\N	\N
500	500	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-06-01	\N	\N
501	501	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-06-01	\N	\N
502	502	0		0	1	5.77	0	0	0	36.4	210	1	0	2022-06-01	\N	\N
503	503	0		0	1	5.77	0	0	0	62.39	360	1	0	2022-06-01	\N	\N
504	504	0		0	1	5.77	0	0	0	24.26	140	1	0	2022-06-01	\N	\N
505	505	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-06-01	\N	\N
506	506	0		0	1	5.77	0	0	0	37.26	215	1	0	2022-06-01	\N	\N
507	507	0		0	1	5.77	0	0	0	47.66	275	1	0	2022-06-01	\N	\N
509	509	0		0	1	5.77	0	0	0	32.06	185	1	0	2022-06-01	\N	\N
510	510	0		0	1	5.77	0	0	0	37.26	215	1	0	2022-06-01	\N	\N
511	511	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-06-01	\N	\N
512	512	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-06-01	\N	\N
513	513	0		0	1	5.77	0	0	0	30.33	175	1	0	2022-06-01	\N	\N
515	515	0		0	1	5.77	0	0	0	30.33	175	1	0	2022-06-01	\N	\N
516	516	0		0	1	5.77	0	0	0	38.99	225	1	0	2022-06-01	\N	\N
517	517	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-06-01	\N	\N
518	518	0		0	1	5.77	0	0	0	99.65	575	1	0	2022-06-01	\N	\N
519	519	0		0	1	5.77	0	0	0	34.66	200	1	0	2022-06-01	\N	\N
520	520	0		0	1	5.77	0	0	0	17.33	100	1	0	2022-06-01	\N	\N
521	521	0		0	1	5.77	0	0	0	69.32	400	1	0	2022-06-01	\N	\N
522	522	0		0	1	5.77	0	0	0	38.99	225	1	0	2022-06-01	\N	\N
523	523	0		0	1	5.77	0	0	0	35.53	205	1	0	2022-06-01	\N	\N
524	524	0		0	1	5.77	0	0	0	30.33	175	1	0	2022-06-01	\N	\N
525	525	0		0	1	5.77	0	0	0	17.33	100	1	0	2022-06-01	\N	\N
527	527	0		0	1	5.77	0	0	0	20.8	120	1	0	2022-06-01	\N	\N
528	528	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-06-01	\N	\N
529	529	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-06-01	\N	\N
530	530	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-06-01	\N	\N
531	531	0		0	1	5.77	0	0	0	21.66	125	1	0	2022-06-01	\N	\N
499	499	0		0	1	5.77	0	0	0	5.72	110	1	0	2022-06-01	\N	\N
1527	619	3		110	1	5.78	635,8	635,8	110	-0	0	5	2	2022-09-05	0	2022-09-05
493	493	0		0	1	5.77	0	0	0	10.4	55	1	0	2022-06-01	\N	\N
1546	199	3		28	1	4.38	122,64	122,64	28	0	0	1	2	2022-09-07	0	2022-09-07
1562	475	1	138862	150	1	5.31	796,5	796,5	150	0	0	1	2	2022-09-07	10	2022-06-15
532	532	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-06-01	\N	\N
533	533	0		0	1	5.77	0	0	0	31.2	180	1	0	2022-06-01	\N	\N
534	534	0		0	1	5.77	0	0	0	51.99	300	1	0	2022-06-01	\N	\N
535	535	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-06-01	\N	\N
536	536	0		0	1	5.77	0	0	0	60.66	350	1	0	2022-06-01	\N	\N
537	537	0		0	1	5.77	0	0	0	31.2	180	1	0	2022-06-01	\N	\N
538	538	0		0	1	5.77	0	0	0	54.59	315	1	0	2022-06-01	\N	\N
539	539	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-06-01	\N	\N
540	540	0		0	1	5.77	0	0	0	45.06	260	1	0	2022-06-01	\N	\N
541	541	0		0	1	5.77	0	0	0	40.73	235	1	0	2022-06-01	\N	\N
543	543	0		0	1	5.77	0	0	0	36.4	210	1	0	2022-06-01	\N	\N
544	544	0		0	1	5.77	0	0	0	36.4	210	1	0	2022-06-01	\N	\N
545	545	0		0	1	5.77	0	0	0	40.73	235	1	0	2022-06-01	\N	\N
546	546	0		0	1	5.77	0	0	0	31.2	180	1	0	2022-06-01	\N	\N
547	547	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-06-01	\N	\N
549	549	0		0	1	5.77	0	0	0	30.33	175	1	0	2022-06-01	\N	\N
550	550	0		0	1	5.77	0	0	0	47.66	275	1	0	2022-06-01	\N	\N
551	551	0		0	1	5.77	0	0	0	38.13	220	1	0	2022-06-01	\N	\N
552	552	0		0	1	5.77	0	0	0	40.73	235	1	0	2022-06-01	\N	\N
553	553	0		0	1	5.77	0	0	0	73.66	425	1	0	2022-06-01	\N	\N
554	554	0		0	1	5.77	0	0	0	53.73	310	1	0	2022-06-01	\N	\N
555	555	0		0	1	5.77	0	0	0	70.19	405	1	0	2022-06-01	\N	\N
556	556	0		0	1	5.77	0	0	0	31.2	180	1	0	2022-06-01	\N	\N
558	558	0		0	1	5.77	0	0	0	51.99	300	1	0	2022-06-01	\N	\N
559	559	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-06-01	\N	\N
560	560	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-06-01	\N	\N
561	561	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-06-01	\N	\N
562	562	0		0	1	5.77	0	0	0	50.26	290	1	0	2022-06-01	\N	\N
563	563	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-06-01	\N	\N
564	564	0		0	1	5.77	0	0	0	76.26	440	1	0	2022-06-01	\N	\N
565	565	0		0	1	5.77	0	0	0	20.8	120	1	0	2022-06-01	\N	\N
566	566	0		0	1	5.77	0	0	0	41.59	240	1	0	2022-06-01	\N	\N
567	567	0		0	1	5.77	0	0	0	29.46	170	1	0	2022-06-01	\N	\N
568	568	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-06-01	\N	\N
569	569	0		0	1	5.77	0	0	0	40.73	235	1	0	2022-06-01	\N	\N
570	570	0		0	1	5.77	0	0	0	50.26	290	1	0	2022-06-01	\N	\N
572	572	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-06-01	\N	\N
573	573	0		0	1	5.77	0	0	0	30.33	175	1	0	2022-06-01	\N	\N
574	574	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-06-01	\N	\N
575	575	0		0	1	5.77	0	0	0	20.8	120	1	0	2022-06-01	\N	\N
576	576	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-06-01	\N	\N
577	577	0		0	1	5.77	0	0	0	37.26	215	1	0	2022-06-01	\N	\N
578	578	0		0	1	5.77	0	0	0	29.46	170	1	0	2022-06-01	\N	\N
579	579	0		0	1	5.77	0	0	0	54.59	315	1	0	2022-06-01	\N	\N
580	580	0		0	1	5.77	0	0	0	31.2	180	1	0	2022-06-01	\N	\N
581	581	0		0	1	5.77	0	0	0	54.59	315	1	0	2022-06-01	\N	\N
582	582	0		0	1	5.77	0	0	0	53.73	310	1	0	2022-06-01	\N	\N
583	583	0		0	1	5.77	0	0	0	46.79	270	1	0	2022-06-01	\N	\N
584	584	0		0	1	5.77	0	0	0	34.66	200	1	0	2022-06-01	\N	\N
585	585	0		0	1	5.77	0	0	0	19.93	115	1	0	2022-06-01	\N	\N
586	586	0		0	1	5.77	0	0	0	54.59	315	1	0	2022-06-01	\N	\N
587	587	0		0	1	5.77	0	0	0	41.59	240	1	0	2022-06-01	\N	\N
588	588	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-06-01	\N	\N
589	589	0		0	1	5.77	0	0	0	51.99	300	1	0	2022-06-01	\N	\N
590	590	0		0	1	5.77	0	0	0	39.86	230	1	0	2022-06-01	\N	\N
591	591	0		0	1	5.77	0	0	0	45.93	265	1	0	2022-06-01	\N	\N
592	592	0		0	1	5.77	0	0	0	12.13	70	1	0	2022-06-01	\N	\N
593	593	0		0	1	5.77	0	0	0	34.66	200	1	0	2022-06-01	\N	\N
594	594	0		0	1	5.77	0	0	0	43.33	250	1	0	2022-06-01	\N	\N
596	596	0		0	1	5.77	0	0	0	30.33	175	1	0	2022-06-01	\N	\N
597	597	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-06-01	\N	\N
598	598	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-06-01	\N	\N
599	599	0		0	1	5.77	0	0	0	13	75	1	0	2022-06-01	\N	\N
600	600	0		0	1	5.77	0	0	0	21.66	125	1	0	2022-06-01	\N	\N
601	601	0		0	1	5.77	0	0	0	43.33	250	1	0	2022-07-01	\N	\N
602	602	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-07-01	\N	\N
603	603	0		0	1	5.77	0	0	0	38.99	225	1	0	2022-07-01	\N	\N
604	604	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-07-01	\N	\N
605	605	0		0	1	5.77	0	0	0	40.73	235	1	0	2022-07-01	\N	\N
606	606	0		0	1	5.77	0	0	0	36.4	210	1	0	2022-07-01	\N	\N
607	607	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-07-01	\N	\N
608	608	0		0	1	5.77	0	0	0	38.13	220	1	0	2022-07-01	\N	\N
609	609	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-07-01	\N	\N
610	610	0		0	1	5.77	0	0	0	38.13	220	1	0	2022-07-01	\N	\N
611	611	0		0	1	5.77	0	0	0	9.53	55	1	0	2022-07-01	\N	\N
612	612	0		0	1	5.77	0	0	0	12.13	70	1	0	2022-07-01	\N	\N
614	614	0		0	1	5.77	0	0	0	50.26	290	1	0	2022-07-01	\N	\N
615	615	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-07-01	\N	\N
616	616	0		0	1	5.77	0	0	0	19.93	115	1	0	2022-07-01	\N	\N
617	617	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-07-01	\N	\N
618	618	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-07-01	\N	\N
620	620	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-07-01	\N	\N
595	595	0		0	1	5.77	0	0	0	31.2	150	1	0	2022-06-01	\N	\N
619	619	0		0	1	5.77	0	0	0	5.72	110	1	0	2022-07-01	\N	\N
1528	739	3		110	1	7.86	864,6	634,7	110	0	0	5	2	2022-09-05	0	2022-09-05
1547	319	3		140	1	4.49	628,6	628,6	140	0	0	1	2	2022-09-07	0	2022-09-07
621	621	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-07-01	\N	\N
622	622	0		0	1	5.77	0	0	0	36.4	210	1	0	2022-07-01	\N	\N
623	623	0		0	1	5.77	0	0	0	62.39	360	1	0	2022-07-01	\N	\N
624	624	0		0	1	5.77	0	0	0	24.26	140	1	0	2022-07-01	\N	\N
625	625	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-07-01	\N	\N
626	626	0		0	1	5.77	0	0	0	37.26	215	1	0	2022-07-01	\N	\N
627	627	0		0	1	5.77	0	0	0	47.66	275	1	0	2022-07-01	\N	\N
628	628	0		0	1	5.77	0	0	0	63.26	365	1	0	2022-07-01	\N	\N
629	629	0		0	1	5.77	0	0	0	32.06	185	1	0	2022-07-01	\N	\N
630	630	0		0	1	5.77	0	0	0	37.26	215	1	0	2022-07-01	\N	\N
631	631	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-07-01	\N	\N
632	632	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-07-01	\N	\N
633	633	0		0	1	5.77	0	0	0	30.33	175	1	0	2022-07-01	\N	\N
635	635	0		0	1	5.77	0	0	0	30.33	175	1	0	2022-07-01	\N	\N
636	636	0		0	1	5.77	0	0	0	38.99	225	1	0	2022-07-01	\N	\N
637	637	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-07-01	\N	\N
638	638	0		0	1	5.77	0	0	0	99.65	575	1	0	2022-07-01	\N	\N
639	639	0		0	1	5.77	0	0	0	34.66	200	1	0	2022-07-01	\N	\N
640	640	0		0	1	5.77	0	0	0	17.33	100	1	0	2022-07-01	\N	\N
641	641	0		0	1	5.77	0	0	0	69.32	400	1	0	2022-07-01	\N	\N
642	642	0		0	1	5.77	0	0	0	38.99	225	1	0	2022-07-01	\N	\N
643	643	0		0	1	5.77	0	0	0	35.53	205	1	0	2022-07-01	\N	\N
644	644	0		0	1	5.77	0	0	0	30.33	175	1	0	2022-07-01	\N	\N
645	645	0		0	1	5.77	0	0	0	17.33	100	1	0	2022-07-01	\N	\N
647	647	0		0	1	5.77	0	0	0	20.8	120	1	0	2022-07-01	\N	\N
648	648	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-07-01	\N	\N
649	649	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-07-01	\N	\N
650	650	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-07-01	\N	\N
651	651	0		0	1	5.77	0	0	0	21.66	125	1	0	2022-07-01	\N	\N
652	652	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-07-01	\N	\N
653	653	0		0	1	5.77	0	0	0	31.2	180	1	0	2022-07-01	\N	\N
654	654	0		0	1	5.77	0	0	0	51.99	300	1	0	2022-07-01	\N	\N
655	655	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-07-01	\N	\N
656	656	0		0	1	5.77	0	0	0	60.66	350	1	0	2022-07-01	\N	\N
657	657	0		0	1	5.77	0	0	0	31.2	180	1	0	2022-07-01	\N	\N
658	658	0		0	1	5.77	0	0	0	54.59	315	1	0	2022-07-01	\N	\N
659	659	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-07-01	\N	\N
660	660	0		0	1	5.77	0	0	0	45.06	260	1	0	2022-07-01	\N	\N
661	661	0		0	1	5.77	0	0	0	40.73	235	1	0	2022-07-01	\N	\N
663	663	0		0	1	5.77	0	0	0	36.4	210	1	0	2022-07-01	\N	\N
664	664	0		0	1	5.77	0	0	0	36.4	210	1	0	2022-07-01	\N	\N
665	665	0		0	1	5.77	0	0	0	40.73	235	1	0	2022-07-01	\N	\N
666	666	0		0	1	5.77	0	0	0	31.2	180	1	0	2022-07-01	\N	\N
667	667	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-07-01	\N	\N
669	669	0		0	1	5.77	0	0	0	30.33	175	1	0	2022-07-01	\N	\N
670	670	0		0	1	5.77	0	0	0	47.66	275	1	0	2022-07-01	\N	\N
671	671	0		0	1	5.77	0	0	0	38.13	220	1	0	2022-07-01	\N	\N
672	672	0		0	1	5.77	0	0	0	40.73	235	1	0	2022-07-01	\N	\N
673	673	0		0	1	5.77	0	0	0	73.66	425	1	0	2022-07-01	\N	\N
674	674	0		0	1	5.77	0	0	0	53.73	310	1	0	2022-07-01	\N	\N
675	675	0		0	1	5.77	0	0	0	70.19	405	1	0	2022-07-01	\N	\N
676	676	0		0	1	5.77	0	0	0	31.2	180	1	0	2022-07-01	\N	\N
678	678	0		0	1	5.77	0	0	0	51.99	300	1	0	2022-07-01	\N	\N
679	679	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-07-01	\N	\N
680	680	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-07-01	\N	\N
681	681	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-07-01	\N	\N
682	682	0		0	1	5.77	0	0	0	50.26	290	1	0	2022-07-01	\N	\N
683	683	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-07-01	\N	\N
684	684	0		0	1	5.77	0	0	0	76.26	440	1	0	2022-07-01	\N	\N
685	685	0		0	1	5.77	0	0	0	20.8	120	1	0	2022-07-01	\N	\N
686	686	0		0	1	5.77	0	0	0	41.59	240	1	0	2022-07-01	\N	\N
687	687	0		0	1	5.77	0	0	0	29.46	170	1	0	2022-07-01	\N	\N
688	688	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-07-01	\N	\N
689	689	0		0	1	5.77	0	0	0	40.73	235	1	0	2022-07-01	\N	\N
690	690	0		0	1	5.77	0	0	0	50.26	290	1	0	2022-07-01	\N	\N
692	692	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-07-01	\N	\N
693	693	0		0	1	5.77	0	0	0	30.33	175	1	0	2022-07-01	\N	\N
694	694	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-07-01	\N	\N
695	695	0		0	1	5.77	0	0	0	20.8	120	1	0	2022-07-01	\N	\N
696	696	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-07-01	\N	\N
697	697	0		0	1	5.77	0	0	0	37.26	215	1	0	2022-07-01	\N	\N
698	698	0		0	1	5.77	0	0	0	29.46	170	1	0	2022-07-01	\N	\N
699	699	0		0	1	5.77	0	0	0	54.59	315	1	0	2022-07-01	\N	\N
700	700	0		0	1	5.77	0	0	0	31.2	180	1	0	2022-07-01	\N	\N
701	701	0		0	1	5.77	0	0	0	54.59	315	1	0	2022-07-01	\N	\N
702	702	0		0	1	5.77	0	0	0	53.73	310	1	0	2022-07-01	\N	\N
703	703	0		0	1	5.77	0	0	0	46.79	270	1	0	2022-07-01	\N	\N
704	704	0		0	1	5.77	0	0	0	34.66	200	1	0	2022-07-01	\N	\N
705	705	0		0	1	5.77	0	0	0	19.93	115	1	0	2022-07-01	\N	\N
706	706	0		0	1	5.77	0	0	0	54.59	315	1	0	2022-07-01	\N	\N
707	707	0		0	1	5.77	0	0	0	41.59	240	1	0	2022-07-01	\N	\N
708	708	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-07-01	\N	\N
709	709	0		0	1	5.77	0	0	0	51.99	300	1	0	2022-07-01	\N	\N
1529	112	3		33	1	4.38	144,54	144,54	33	0	0	5	2	2022-09-05	0	2022-09-05
1548	439	1	54677382	140	1	6.2464	874,5	874,5	140	0	0	1	2	2022-09-07	2	2022-06-11
1563	830	1	6667075	230	1	6.28	1.444,4	1.444,4	230	0	0	1	2	2022-09-07	10	2022-08-24
710	710	0		0	1	5.77	0	0	0	39.86	230	1	0	2022-07-01	\N	\N
711	711	0		0	1	5.77	0	0	0	45.93	265	1	0	2022-07-01	\N	\N
712	712	0		0	1	5.77	0	0	0	12.13	70	1	0	2022-07-01	\N	\N
713	713	0		0	1	5.77	0	0	0	34.66	200	1	0	2022-07-01	\N	\N
714	714	0		0	1	5.77	0	0	0	43.33	250	1	0	2022-07-01	\N	\N
716	716	0		0	1	5.77	0	0	0	30.33	175	1	0	2022-07-01	\N	\N
717	717	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-07-01	\N	\N
718	718	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-07-01	\N	\N
719	719	0		0	1	5.77	0	0	0	13	75	1	0	2022-07-01	\N	\N
720	720	0		0	1	5.77	0	0	0	21.66	125	1	0	2022-07-01	\N	\N
721	721	0		0	1	5.77	0	0	0	43.33	250	1	0	2022-08-01	\N	\N
722	722	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-08-01	\N	\N
723	723	0		0	1	5.77	0	0	0	38.99	225	1	0	2022-08-01	\N	\N
724	724	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-08-01	\N	\N
725	725	0		0	1	5.77	0	0	0	40.73	235	1	0	2022-08-01	\N	\N
726	726	0		0	1	5.77	0	0	0	36.4	210	1	0	2022-08-01	\N	\N
727	727	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-08-01	\N	\N
728	728	0		0	1	5.77	0	0	0	38.13	220	1	0	2022-08-01	\N	\N
729	729	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-08-01	\N	\N
730	730	0		0	1	5.77	0	0	0	38.13	220	1	0	2022-08-01	\N	\N
731	731	0		0	1	5.77	0	0	0	9.53	55	1	0	2022-08-01	\N	\N
732	732	0		0	1	5.77	0	0	0	12.13	70	1	0	2022-08-01	\N	\N
734	734	0		0	1	5.77	0	0	0	50.26	290	1	0	2022-08-01	\N	\N
735	735	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-08-01	\N	\N
736	736	0		0	1	5.77	0	0	0	19.93	115	1	0	2022-08-01	\N	\N
737	737	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-08-01	\N	\N
738	738	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-08-01	\N	\N
740	740	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-08-01	\N	\N
741	741	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-08-01	\N	\N
742	742	0		0	1	5.77	0	0	0	36.4	210	1	0	2022-08-01	\N	\N
743	743	0		0	1	5.77	0	0	0	62.39	360	1	0	2022-08-01	\N	\N
744	744	0		0	1	5.77	0	0	0	24.26	140	1	0	2022-08-01	\N	\N
746	746	0		0	1	5.77	0	0	0	37.26	215	1	0	2022-08-01	\N	\N
747	747	0		0	1	5.77	0	0	0	47.66	275	1	0	2022-08-01	\N	\N
748	748	0		0	1	5.77	0	0	0	63.26	365	1	0	2022-08-01	\N	\N
749	749	0		0	1	5.77	0	0	0	32.06	185	1	0	2022-08-01	\N	\N
750	750	0		0	1	5.77	0	0	0	37.26	215	1	0	2022-08-01	\N	\N
751	751	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-08-01	\N	\N
752	752	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-08-01	\N	\N
753	753	0		0	1	5.77	0	0	0	30.33	175	1	0	2022-08-01	\N	\N
754	754	0		0	1	5.77	0	0	0	62.39	360	1	0	2022-08-01	\N	\N
755	755	0		0	1	5.77	0	0	0	30.33	175	1	0	2022-08-01	\N	\N
756	756	0		0	1	5.77	0	0	0	38.99	225	1	0	2022-08-01	\N	\N
757	757	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-08-01	\N	\N
758	758	0		0	1	5.77	0	0	0	99.65	575	1	0	2022-08-01	\N	\N
759	759	0		0	1	5.77	0	0	0	34.66	200	1	0	2022-08-01	\N	\N
760	760	0		0	1	5.77	0	0	0	17.33	100	1	0	2022-08-01	\N	\N
761	761	0		0	1	5.77	0	0	0	69.32	400	1	0	2022-08-01	\N	\N
762	762	0		0	1	5.77	0	0	0	38.99	225	1	0	2022-08-01	\N	\N
763	763	0		0	1	5.77	0	0	0	35.53	205	1	0	2022-08-01	\N	\N
764	764	0		0	1	5.77	0	0	0	30.33	175	1	0	2022-08-01	\N	\N
765	765	0		0	1	5.77	0	0	0	17.33	100	1	0	2022-08-01	\N	\N
767	767	0		0	1	5.77	0	0	0	20.8	120	1	0	2022-08-01	\N	\N
768	768	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-08-01	\N	\N
769	769	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-08-01	\N	\N
770	770	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-08-01	\N	\N
771	771	0		0	1	5.77	0	0	0	21.66	125	1	0	2022-08-01	\N	\N
772	772	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-08-01	\N	\N
773	773	0		0	1	5.77	0	0	0	31.2	180	1	0	2022-08-01	\N	\N
774	774	0		0	1	5.77	0	0	0	51.99	300	1	0	2022-08-01	\N	\N
775	775	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-08-01	\N	\N
776	776	0		0	1	5.77	0	0	0	60.66	350	1	0	2022-08-01	\N	\N
777	777	0		0	1	5.77	0	0	0	31.2	180	1	0	2022-08-01	\N	\N
778	778	0		0	1	5.77	0	0	0	54.59	315	1	0	2022-08-01	\N	\N
779	779	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-08-01	\N	\N
780	780	0		0	1	5.77	0	0	0	45.06	260	1	0	2022-08-01	\N	\N
781	781	0		0	1	5.77	0	0	0	40.73	235	1	0	2022-08-01	\N	\N
783	783	0		0	1	5.77	0	0	0	36.4	210	1	0	2022-08-01	\N	\N
784	784	0		0	1	5.77	0	0	0	36.4	210	1	0	2022-08-01	\N	\N
785	785	0		0	1	5.77	0	0	0	40.73	235	1	0	2022-08-01	\N	\N
786	786	0		0	1	5.77	0	0	0	31.2	180	1	0	2022-08-01	\N	\N
787	787	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-08-01	\N	\N
788	788	0		0	1	5.77	0	0	0	40.73	235	1	0	2022-08-01	\N	\N
789	789	0		0	1	5.77	0	0	0	30.33	175	1	0	2022-08-01	\N	\N
790	790	0		0	1	5.77	0	0	0	47.66	275	1	0	2022-08-01	\N	\N
791	791	0		0	1	5.77	0	0	0	38.13	220	1	0	2022-08-01	\N	\N
792	792	0		0	1	5.77	0	0	0	40.73	235	1	0	2022-08-01	\N	\N
793	793	0		0	1	5.77	0	0	0	73.66	425	1	0	2022-08-01	\N	\N
794	794	0		0	1	5.77	0	0	0	53.73	310	1	0	2022-08-01	\N	\N
795	795	0		0	1	5.77	0	0	0	70.19	405	1	0	2022-08-01	\N	\N
798	798	0		0	1	5.77	0	0	0	51.99	300	1	0	2022-08-01	\N	\N
715	715	0		0	1	5.77	0	0	0	31.2	150	1	0	2022-07-01	\N	\N
739	739	0		0	1	5.77	0	0	0	5.72	110	1	0	2022-08-01	\N	\N
1530	232	3		33	1	438	14.454	14.454	33	0	0	5	2	2022-09-05	0	2022-09-05
1549	559	3		165	1	5.16	851,4	851,4	165	0	0	1	2	2022-09-07	0	2022-09-07
1564	42	1	12533483212	45	1	4.5955	206,8	206,8	45	0	0	1	2	2022-09-07	10	2022-04-24
799	799	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-08-01	\N	\N
800	800	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-08-01	\N	\N
801	801	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-08-01	\N	\N
802	802	0		0	1	5.77	0	0	0	50.26	290	1	0	2022-08-01	\N	\N
803	803	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-08-01	\N	\N
804	804	0		0	1	5.77	0	0	0	76.26	440	1	0	2022-08-01	\N	\N
805	805	0		0	1	5.77	0	0	0	20.8	120	1	0	2022-08-01	\N	\N
806	806	0		0	1	5.77	0	0	0	41.59	240	1	0	2022-08-01	\N	\N
807	807	0		0	1	5.77	0	0	0	29.46	170	1	0	2022-08-01	\N	\N
808	808	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-08-01	\N	\N
809	809	0		0	1	5.77	0	0	0	40.73	235	1	0	2022-08-01	\N	\N
810	810	0		0	1	5.77	0	0	0	50.26	290	1	0	2022-08-01	\N	\N
812	812	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-08-01	\N	\N
813	813	0		0	1	5.77	0	0	0	30.33	175	1	0	2022-08-01	\N	\N
814	814	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-08-01	\N	\N
815	815	0		0	1	5.77	0	0	0	20.8	120	1	0	2022-08-01	\N	\N
816	816	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-08-01	\N	\N
817	817	0		0	1	5.77	0	0	0	37.26	215	1	0	2022-08-01	\N	\N
818	818	0		0	1	5.77	0	0	0	29.46	170	1	0	2022-08-01	\N	\N
819	819	0		0	1	5.77	0	0	0	54.59	315	1	0	2022-08-01	\N	\N
820	820	0		0	1	5.77	0	0	0	31.2	180	1	0	2022-08-01	\N	\N
821	821	0		0	1	5.77	0	0	0	54.59	315	1	0	2022-08-01	\N	\N
822	822	0		0	1	5.77	0	0	0	53.73	310	1	0	2022-08-01	\N	\N
823	823	0		0	1	5.77	0	0	0	46.79	270	1	0	2022-08-01	\N	\N
824	824	0		0	1	5.77	0	0	0	34.66	200	1	0	2022-08-01	\N	\N
825	825	0		0	1	5.77	0	0	0	19.93	115	1	0	2022-08-01	\N	\N
827	827	0		0	1	5.77	0	0	0	41.59	240	1	0	2022-08-01	\N	\N
828	828	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-08-01	\N	\N
829	829	0		0	1	5.77	0	0	0	51.99	300	1	0	2022-08-01	\N	\N
830	830	0		0	1	5.77	0	0	0	39.86	230	1	0	2022-08-01	\N	\N
831	831	0		0	1	5.77	0	0	0	45.93	265	1	0	2022-08-01	\N	\N
832	832	0		0	1	5.77	0	0	0	12.13	70	1	0	2022-08-01	\N	\N
834	834	0		0	1	5.77	0	0	0	43.33	250	1	0	2022-08-01	\N	\N
836	836	0		0	1	5.77	0	0	0	30.33	175	1	0	2022-08-01	\N	\N
837	837	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-08-01	\N	\N
838	838	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-08-01	\N	\N
839	839	0		0	1	5.77	0	0	0	13	75	1	0	2022-08-01	\N	\N
840	840	0		0	1	5.77	0	0	0	21.66	125	1	0	2022-08-01	\N	\N
843	242	1	230059	165	1	5.60	924	924	165	0	0	1	2	2022-08-16	7	2022-06-22
844	362	1	308567	165	1	5.22	861,3	861,3	165	0	0	1	2	2022-08-16	7	2022-06-29
845	482	1	556863	165	1	5.15	849,75	849,75	165	-0	0	1	2	2022-08-16	7	2022-07-19
846	3	1	12519841244	45	1	4.41	198,45	198,45	45	-0	0	1	2	2022-08-16	2	2022-04-06
847	123	1	12519841244	45	1	4.41	198,45	198,45	45	-0	0	1	2	2022-08-16	2	2022-04-06
848	243	1	12540586258	225	1	4.54	1.021,5	1.021,5	225	0	0	1	2	2022-08-16	2	2022-05-04
849	363	1	12540586258	225	1	4.54	1.021,5	1.021,5	225	0	0	1	2	2022-08-16	2	2022-05-04
850	483	1	12562992628	225	1	5.20	1.170	1.170	225	0	0	1	2	2022-08-16	2	2022-06-09
851	603	1	12578155787	225	1	5.55	1.248,75	1.248,75	225	0	0	1	2	2022-08-16	2	2022-07-06
852	723	1	12593223719	225	1	5.79	1.302,75	1.302,75	225	0	0	1	2	2022-08-16	2	2022-08-01
853	6	3		42	1	4.44	186,48	186,48	42	-0	0	1	2	2022-08-16	0	2022-08-01
854	126	3		42	1	4.38	183,96	183,96	42	0	0	1	2	2022-08-16	0	2022-08-01
855	246	3		210	1	4.49	942,9	942,9	210	-0	0	1	2	2022-08-16	0	2022-08-01
856	366	3		210	1	5.07	1.064,7	1.064,7	210	0	0	1	2	2022-08-16	0	2022-08-01
857	486	3		210	1	5.53	1.161,3	1.161,3	210	0	0	1	2	2022-08-16	0	2022-08-01
858	606	3		210	1	5.78	1.213,8	1.213,8	210	0	0	1	2	2022-08-16	0	2022-08-01
859	8	3		44	1	4.38	192,72	192,72	44	0	0	1	2	2022-08-16	0	2022-08-03
860	128	3		44	1	4.38	192,72	192,72	44	0	0	1	2	2022-08-16	0	2022-08-06
861	248	1	12558389662	220	1	5.09	1.119,8	1.119,8	220	0	0	1	2	2022-08-16	10	2022-06-02
862	368	1	12578318298	220	1	5.56	1.223,2	1.223,2	220	0	0	1	2	2022-08-16	10	2022-07-06
863	488	3		220	1	5.53	1.216,6	1.216,6	220	-0	0	1	2	2022-08-16	0	2022-08-03
864	608	1	22093422951\t	220	1	5.77278	1.270,01	1.270,01	220	-0	0	1	2	2022-08-16	10	2022-07-28
867	369	1	90776897	165	1	5.80	957	957	165	0	0	1	2	2022-08-16	5	2022-08-03
872	261	1	52300841817	165	1	4.8317	797,23	797,23	165	-0	0	1	2	2022-08-16	4	2022-05-19
873	25	3		33	1	4.38	144,54	144,54	33	0	0	1	2	2022-08-16	0	2022-08-01
874	145	3		33	1	4.38	144,54	144,54	33	0	0	1	2	2022-08-16	0	2022-08-01
875	265	3		165	1	4.49	740,85	740,85	165	0	0	1	2	2022-08-16	0	2022-08-01
876	385	3		165	1	5.07	836,55	836,55	165	-0	0	1	2	2022-08-16	0	2022-08-01
877	505	3		165	1	5.53	912,45	912,45	165	0	0	1	2	2022-08-16	0	2022-08-01
878	29	1	52300693113	37	1	4.4189	163,5	163,5	37	0	0	1	2	2022-08-16	3	2022-04-06
879	149	2	52300693113	37	1	4.4189	163,5	163,5	37	0	0	1	2	2022-08-16	3	2022-04-06
880	269	1	52300570520	185	1	4.58	847,3	847,3	185	-0	0	1	2	2022-08-16	3	2022-05-10
835	835	0		0	1	5.77	0	0	0	31.2	150	1	0	2022-08-01	\N	\N
1531	832	3		70	1	7.91	553,7	553,7	70	0	0	5	2	2022-09-05	0	2022-09-05
1550	679	3		165	1	5.68	937,2	937,2	165	0	0	1	2	2022-09-07	0	2022-09-07
1565	162	1	12533483212	45	1	4.5955	206,8	206,8	45	0	0	1	2	2022-09-07	10	2022-04-24
1578	595	3		150	1	7.99	1.198,5	1.198,5	150	0	0	1	2	2022-09-09	0	2022-09-09
881	389	1	52300282088	185	1	5.15	952,75	952,75	185	-0	0	1	2	2022-08-16	3	2022-06-07
882	509	1	25371659	185	1	5.5459	1.025,99	1.025,99	185	-0	0	1	2	2022-08-16	3	2022-07-08
883	36	3		45	1	4.38	197,1	197,1	45	0	0	1	2	2022-08-16	0	2022-08-03
884	156	3		45	1	4.38	197,1	197,1	45	0	0	1	2	2022-08-16	0	2022-08-03
885	276	3		225	1	4.49	1.010,25	1.010,25	225	0	0	1	2	2022-08-16	0	2022-08-03
886	396	3		225	1	5.07	1.140,75	1.140,75	225	0	0	1	2	2022-08-16	0	2022-08-03
887	516	3		225	1	5.53	1.244,25	1.244,25	225	0	0	1	2	2022-08-16	0	2022-08-03
888	49	3		33	1	4.38	144,54	144,54	33	0	0	1	2	2022-08-16	0	2022-08-01
889	169	3		33	1	4.38	144,54	144,54	33	0	0	1	2	2022-08-16	0	2022-08-01
890	289	3		165	1	4.49	740,85	740,85	165	0	0	1	2	2022-08-16	0	2022-08-01
891	409	1	12593323646	165	1	5.80	957	957	165	0	0	1	2	2022-08-16	2	2022-08-01
892	529	1	12593323646	165	1	5.80	957	957	165	0	0	1	2	2022-08-16	2	2022-08-01
893	649	1	12593323646	165	1	5.80	957	957	165	0	0	1	2	2022-08-16	2	2022-08-01
894	57	3		36	1	4.38	157,68	157,68	36	0	0	1	2	2022-08-16	0	2022-08-02
895	177	3		36	1	4.38	157,68	157,68	36	0	0	1	2	2022-08-16	0	2022-08-02
896	297	3		180	1	4.49	808,2	808,2	180	0	0	1	2	2022-08-16	0	2022-08-01
897	417	3		180	1	5.07	912,6	912,6	180	0	0	1	2	2022-08-16	0	2022-08-01
898	537	3		180	1	5.53	995,4	995,4	180	-0	0	1	2	2022-08-16	0	2022-08-01
899	657	3		180	1	5.78	1.040,4	1.040,4	180	0	0	1	2	2022-08-16	0	2022-08-01
900	58	3		63	1	4.38	275,94	275,94	63	0	0	1	2	2022-08-16	0	2022-08-01
901	178	3		63	1	4.38	275,94	275,94	63	0	0	1	2	2022-08-16	0	2022-08-01
902	298	3		315	1	4.49	1.414,35	1.414,35	315	-0	0	1	2	2022-08-16	0	2022-08-03
903	418	3		315	1	5.07	1.597,05	1.597,05	315	-0	0	1	2	2022-08-16	0	2022-08-03
1569	56	6		70	1	4.38	306,6	403,9	70	0	0	1	2	2022-09-07	0	2022-09-07
904	538	3		315	1	5.53	1.741,95	1.741,95	315	0	0	1	2	2022-08-16	0	2022-08-03
905	658	3		315	1	5.78	1.820,7	1.820,7	315	0	0	1	2	2022-08-16	0	2022-08-03
906	778	3		315	1	5.79	1.823,85	1.823,85	315	0	0	1	2	2022-08-16	0	2022-08-03
907	60	1	52300769609	52	1	4.4038	229	229	52	0	0	1	2	2022-08-16	4	2022-04-07
908	180	1	52300769609	52	1	4.4038	229	229	52	0	0	1	2	2022-08-16	4	2022-04-07
909	300	1	152928524	260	1	5.55	1.443	1.443	260	0	0	1	2	2022-08-16	3	2022-07-07
910	420	1	160608675	260	1	5.59	1.453,4	1.453,4	260	0	0	1	2	2022-08-16	3	2022-07-14
911	540	1	133130195	260	1	5.8542	1.522,09	1.522,09	260	-0	0	1	2	2022-08-16	3	2022-08-08
912	61	3		47	1	4.38	205,86	205,86	47	0	0	1	2	2022-08-17	0	2022-08-01
913	181	3		47	1	4.38	205,86	205,86	47	0	0	1	2	2022-08-17	0	2022-08-01
914	301	1	12558392751	235	1	5.09	1.196,15	1.196,15	235	0	0	1	2	2022-08-17	2	2022-06-02
1441	897	0		0	1	5.77	0	0	0	51.99	300	1	0	2022-09-01	\N	\N
915	421	1	12578304672	235	1	5.56	1.306,6	1.306,6	235	0	0	1	2	2022-08-17	2	2022-07-06
916	541	3		235	1	5.53	1.299,55	1.299,55	235	0	0	1	2	2022-08-17	0	2022-08-01
917	661	1	12590582102	235	1	5.75	1.351,25	1.351,25	235	0	0	1	2	2022-08-17	2	2022-07-28
918	66	3		36	1	4.38	157,68	157,68	36	0	0	1	2	2022-08-17	0	2022-08-01
919	186	3		36	1	4.38	157,68	157,68	36	0	0	1	2	2022-08-17	0	2022-08-01
920	306	3		180	1	4.49	808,2	808,2	180	0	0	1	2	2022-08-17	0	2022-08-01
921	426	3		180	1	5.07	912,6	912,6	180	0	0	1	2	2022-08-17	0	2022-08-01
925	69	3		35	1	4.38	153,3	153,3	35	0	0	1	2	2022-08-17	0	2022-08-01
926	189	3		35	1	4.38	153,3	153,3	35	0	0	1	2	2022-08-17	0	2022-08-01
927	309	3		175	1	4.38	766,5	766,5	175	0	0	1	2	2022-08-17	0	2022-08-01
928	429	3		175	1	5.07	887,25	887,25	175	0	0	1	2	2022-08-17	0	2022-08-01
929	549	3		175	1	5.53	967,75	967,75	175	0	0	1	2	2022-08-17	0	2022-08-01
930	73	3		85	1	4.38	372,3	372,3	85	0	0	1	2	2022-08-17	0	2022-08-03
931	193	3		85	1	4.38	372,3	372,3	85	0	0	1	2	2022-08-17	0	2022-08-03
932	313	1	994086784/169379\t	425	1	4.78	2.031,5	2.031,5	425	0	0	1	2	2022-08-17	24	2022-05-20
933	433	1	994086784/169379	425	1	4.78	2.031,5	2.031,5	425	0	0	1	2	2022-08-17	24	2022-05-20
934	553	1	1011101552	425	1	5.56	2.363	2.363	425	0	0	1	2	2022-08-17	24	2022-07-07
935	75	1	11072022	81	1	5.61	454,41	454,41	81	0	0	1	2	2022-08-17	2	2022-07-07
936	80	3		33	1	4.38	144,54	144,54	33	0	0	1	2	2022-08-17	0	2022-08-03
937	200	3		33	1	4.38	144,54	144,54	33	0	0	1	2	2022-08-17	0	2022-08-03
938	82	3		58	1	4.38	254,04	254,04	58	0	0	1	2	2022-08-17	0	2022-08-01
939	202	3		58	1	4.38	254,04	254,04	58	0	0	1	2	2022-08-17	0	2022-08-01
940	322	3		290	1	4.45	1.290,5	1.290,5	290	0	0	1	2	2022-08-17	0	2022-08-01
941	442	3		290	1	5.07	1.470,3	1.470,3	290	-0	0	1	2	2022-08-17	0	2022-08-01
942	562	3		290	1	5.53	1.603,7	1.603,7	290	0	0	1	2	2022-08-17	0	2022-08-01
943	682	3		290	1	5.78	1.676,2	1.676,2	290	0	0	1	2	2022-08-17	0	2022-08-01
944	84	3		88	1	4.38	385,44	385,44	88	0	0	1	2	2022-08-17	0	2022-08-01
945	204	3		88	1	4.38	385,44	385,44	88	0	0	1	2	2022-08-17	0	2022-08-01
946	324	3		440	1	4.49	1.975,6	1.975,6	440	-0	0	1	2	2022-08-17	0	2022-08-01
947	444	3		440	1	5.07	2.230,8	2.230,8	440	0	0	1	2	2022-08-17	0	2022-08-01
948	88	1	170810482	33	1	4.2878	141,5	141,5	33	0	0	1	2	2022-08-17	3	2022-04-19
949	208	1	170810482	33	1	4.2878	141,5	141,5	33	0	0	1	2	2022-08-17	3	2022-04-19
950	328	3		165	1	4.49	740,85	740,85	165	0	0	1	2	2022-08-17	0	2022-08-03
951	93	3		35	1	4.38	153,3	0	33	0	2	1	2	2022-08-17	0	2022-08-01
952	213	3		35	1	4.38	153,3	0	35	0	0	1	2	2022-08-17	0	2022-08-01
953	333	3		175	1	4.49	785,75	785,75	175	0	0	1	2	2022-08-17	0	2022-08-01
954	453	3		175	1	5.07	887,25	887,25	175	0	0	1	2	2022-08-17	0	2022-08-01
955	573	3		175	1	5.53	967,75	967,75	175	0	0	1	2	2022-08-17	0	2022-08-01
956	693	3		175	1	5.78	1.011,5	1.011,5	175	0	0	1	2	2022-08-17	0	2022-08-01
957	98	3		34	1	4.38	148,92	148,92	34	0	0	1	2	2022-08-17	0	2022-08-01
958	218	3		34	1	4.38	148,92	148,92	34	0	0	1	2	2022-08-17	0	2022-08-01
959	338	3		170	1	4.49	763,3	763,3	170	-0	0	1	2	2022-08-17	0	2022-08-01
613	613	0		0	1	5.77	0	0	0	10.4	55	1	0	2022-07-01	\N	\N
733	733	0		0	1	5.77	0	0	0	10.4	55	1	0	2022-08-01	\N	\N
960	458	3		170	1	5.07	861,9	861,9	170	-0	0	1	2	2022-08-17	0	2022-08-01
961	578	3		170	1	5.78	982,6	982,6	170	0	0	1	2	2022-08-17	0	2022-08-01
962	99	3		63	1	4.38	275,94	275,94	63	0	0	1	2	2022-08-17	0	2022-08-01
963	219	3		63	1	4.38	275,94	275,94	63	0	0	1	2	2022-08-17	0	2022-08-01
964	339	3		315	1	4.49	1.414,35	1.414,35	315	-0	0	1	2	2022-08-17	0	2022-08-01
965	459	3		315	1	5.07	1.597,05	1.597,05	315	-0	0	1	2	2022-08-17	0	2022-08-01
966	579	3		315	1	5.53	1.741,95	1.741,95	315	0	0	1	2	2022-08-17	0	2022-08-01
967	103	1	12543022549	54	1	4.6481	251	251	54	0	0	1	2	2022-08-17	10	2022-05-09
968	223	1	12543022549\t	54	1	4.6481	251	251	54	0	0	1	2	2022-08-17	10	2022-05-09
969	343	1	12544520294	270	1	4.6667	1.260,01	1.260,01	270	0	0	1	2	2022-08-17	10	2022-05-10
970	463	1	21865235111\t	270	1	5.5398	1.495,75	1.495,75	270\t	0	0	1	2	2022-08-17	10	2022-05-07
971	583	1	12578414869	270	1	5.6111	1.515	1.515	270	0	0	1	2	2022-08-17	10	2022-06-06
972	106	3		63	1	4.38	275,94	275,94	63	0	0	1	2	2022-08-17	0	2022-08-03
973	226	3		63	1	4.38	275,94	275,94	63	0	0	1	2	2022-08-17	0	2022-08-03
974	109	1	8288106577	60	1	4.44	266,4	266,4	60	-0	0	1	2	2022-08-17	5	2022-04-22
975	229	1	8288106577	60	1	4.44	266,4	266,4	60	-0	0	1	2	2022-08-17	5	2022-04-22
976	349	1	209262	300	1	4.44	1.332	1.332	300	-0	0	1	2	2022-08-17	5	2022-04-27
977	110	1	12520632989	46	1	4.40	202,4	202,4	46	0	0	1	2	2022-08-17	2	2022-04-06
978	230	1	12520632989	46	1	4.40	202,4	202,4	46	0	0	1	2	2022-08-17	2	2022-04-06
979	350	1	12558664147	230	1	5.06	1.163,8	1.163,8	230	0	0	1	2	2022-08-17	2	2022-06-02
1535	13	3		11	1	4.38	48,18	63,47	11	0	0	5	2	2022-09-05	0	2022-09-05
980	470	1	12558931031	230	1	5.06	1.163,8	1.163,8	230	0	0	1	2	2022-08-17	2	2022-06-02
1582	612	3		70	1	7.99	559,3	559,3	70	-0	0	1	2	2022-09-09	0	2022-09-09
981	590	1	12579608462	230	1	5.55	1.276,5	1.276,5	230	0	0	1	2	2022-08-17	2	2022-07-08
982	710	1	12594448720	230	1	5.7902	1.331,75	1.331,75	230	0	0	1	2	2022-08-17	10	2022-08-03
983	114	1	88601072\t	50	1	4.58	229	229	50	0	0	1	2	2022-08-17	10	2022-08-17
984	234	1	88601072	50	1	4.58	229	229	50	0	0	1	2	2022-08-17	10	2022-08-02
985	354	1	12578620221/2187596137	250	1	5.60	1.400	1.400	250	0	0	1	2	2022-08-17	10	2022-06-07
986	474	1	12578620221/2187596137	250	1	5.60	1.400	1.400	250	0	0	1	2	2022-08-17	10	2022-07-06
987	594	1	12578620221/2187596137	250	1	5.60	1.400	1.400	250	0	0	1	2	2022-08-17	10	2022-07-06
988	59	3		33	1	4.38	144,54	144,54	33	0	0	1	2	2022-08-17	0	2022-08-04
989	179	3		33	1	4.38	144,54	144,54	33	0	0	1	2	2022-08-17	0	2022-08-04
991	419	1	90056077	165	1	5.5495	915,67	915,67	165	0	0	1	2	2022-08-17	5	2022-07-07
992	539	1	90056077	165	1	5.5495	915,67	915,67	165	0	0	1	2	2022-08-17	5	2022-07-07
993	659	1	90056077	165	1	5.5495	915,67	915,67	165	0	0	1	2	2022-08-17	5	2022-07-07
994	30	1	20956136417	43	1	4.41	189,63	189,63	43	0	0	1	2	2022-08-17	10	2022-04-06
995	150	1	20956240228	43	1	4.41	189,63	189,63	43	0	0	1	2	2022-08-17	10	2022-04-06
996	270	1	12552462932	215	1	4.9489	1.064,01	1.064,01	215	-0	0	1	2	2022-08-17	10	2022-05-23
997	390	1	12552462932	215	1	4.9489	1.064,01	1.064,01	215	-0	0	1	2	2022-08-17	10	2022-05-23
998	510	1	12563255064	215	1	4.9489	1.064,01	1.064,01	215	-0	0	1	2	2022-08-17	10	2022-06-10
999	630	1	12580027498/32111	215	1	5.57	1.197,55	1.197,55	6.670,35	0	0	1	2	2022-08-17	10	2022-07-11
1011	72	1	36326288	47	1	4.42	207,74	207,74	918,21	0	0	5	2	2022-08-23	5	2022-04-22
1012	192	1	36326288	47	1	4.42	207,74	207,74	47	0	0	5	2	2022-08-23	5	2022-04-22
1013	312	1	pap0806	235	1	5.09	1.196,15	1.196,15	235	0	0	5	2	2022-08-23	5	2022-06-08
1014	432	1	pap16062022	235	1	5.25	1.233,75	1.233,75	235	0	0	5	2	2022-08-23	5	2022-06-16
1015	552	1	37272075	235	1	5.54	1.301,9	1.301,9	235	0	0	5	2	2022-08-23	5	2022-07-01
1016	672	1	37487299	235	1	5.68	1.334,8	1.334,8	235	0	0	5	2	2022-08-23	5	2022-07-20
1025	469	2	114113246	300	1	5.07	1.521	1.521	300	0	0	5	2	2022-08-23	0	2022-06-14
1026	589	2	114113246	300	1	5.53	1.659	1.659	300	0	0	5	2	2022-08-23	0	2022-06-14
1028	829	1	90752800	300	1	5.79	1.737	1.737	300	0	0	5	2	2022-08-23	5	2022-08-02
1029	92	1	88106671	33	1	4.44	146,52	146,52	33	0	0	5	2	2022-08-23	5	2022-04-22
1030	212	1	88106671	33	1	4.44	146,52	146,52	33	0	0	5	2	2022-08-23	5	2022-04-22
1031	332	1	88106671 /6200209264	165	1	4.4389	732,42	732,42	165	0	0	5	2	2022-08-23	5	2022-04-27
1032	452	2	114208857	165	1	5.07	836,55	836,55	165	-0	0	5	2	2022-08-23	0	2022-06-14
1033	572	2	114208857	165	1	5.53	912,45	912,45	165	0	0	5	2	2022-08-23	0	2022-06-14
1532	85	3		33	1	4.38	144,54	144,54	33	0	0	5	2	2022-09-05	0	2022-09-05
1551	799	3		165	1	5.98	986,7	986,7	165	0	0	1	2	2022-09-07	0	2022-09-07
1566	402	3		225	1	5.77	1.298,25	1.298,25	225	0	0	1	2	2022-09-07	0	2022-09-07
1579	715	3		150	1	7.99	1.198,5	1.198,5	150	0	0	1	2	2022-09-09	0	2022-09-09
1035	812	1	90752844	165	1	5.79	955,35	955,35	165	0	0	5	2	2022-08-23	5	2022-08-02
1036	703	1	22223371234	270	1	5.748148	1.552	1.552	270	0	0	5	2	2022-08-23	28	2022-08-10
1037	320	1	53300952678	165	1	4.557575	752	752	165	0	0	5	2	2022-08-23	4	2022-05-25
1038	440	1	39211	165	1	5.57	919,05	919,05	165	-0	0	5	2	2022-08-23	4	2022-07-08
1039	560	1	39211/20402551273	165	1	5.2421	864,95	864,95	165	0	0	5	2	2022-08-23	4	2022-08-05
1040	680	1	20402551273	165	1	5.84	963,6	963,6	165	0	0	5	2	2022-08-23	4	2022-08-05
1044	779	1	91181553	165	1	5.975757	986	986	165	0	0	5	2	2022-08-23	5	2022-08-18
1069	43	1	20956136417	41	1	4.41	180,81	180,81	41	0	0	5	2	2022-08-23	10	2022-04-05
1070	163	1	20956238282	41	1	4.41	180,81	180,81	797,37	0	0	5	2	2022-08-23	10	2022-04-06
1071	283	1	1255116458	205	1	4.946341	1.014	1.012,7	205	0	0	5	2	2022-08-23	10	2022-05-21
1072	403	1	12552517549	205	1	4.946341	1.014	1.014	205	0	0	5	2	2022-08-23	10	2022-05-23
1073	523	1	12563061653	205	1	4.946341	1.014	1.014	5.015,59	0	0	5	2	2022-08-23	10	2022-06-09
1074	643	1	12581529980	205	1	5.60	1.148	1.148	205	0	0	5	2	2022-08-23	10	2022-07-11
1075	86	1	20956136417	48	1	4.41	211,68	211,68	48	0	0	5	2	2022-08-23	10	2022-04-05
1076	206	1	20956241774	48	1	4.41	211,68	211,68	48	0	0	5	2	2022-08-23	10	2022-04-06
1077	326	1	12551129709	240	1	4.95	1.188	1.188	5.880,6	0	0	5	2	2022-08-23	10	2022-05-20
1078	446	1	12552461845	240	1	4.95	1.188	1.188	240	0	0	5	2	2022-08-23	10	2022-05-23
1079	566	1	12563255315	240	1	4.95	1.188	1.188	240	0	0	5	2	2022-08-23	10	2022-06-10
1080	686	1	12582210734	240	1	5.60	1.344	1.344	240	0	0	5	2	2022-08-23	10	2022-07-13
1081	113	1	52300166518	40	1	4.661	186,44	186,44	40	0	0	5	2	2022-08-23	4	2022-04-26
1082	233	1	52300166518	40	1	4.661	186,44	186,44	40	0	0	5	2	2022-08-23	4	2022-04-26
1083	63	1	52300414035	42	1	4.3928	184,5	184,5	810,47	0	0	5	2	2022-08-23	4	2022-05-04
1084	183	1	52300414035	42	1	4.3928	184,5	184,5	810,47	0	0	5	2	2022-08-23	4	2022-05-04
1085	26	1	123804846	43	1	4.58	196,94	196,94	43	0	0	5	2	2022-08-23	28	2022-05-09
1086	146	1	123903588	43	1	4.58	196,94	196,94	43	0	0	5	2	2022-08-23	28	2022-05-09
1087	266	1	124037300	215	1	4.58	984,7	984,7	4.509,93	0	0	5	2	2022-08-23	28	2022-05-09
1089	506	1	133528745	215	1	5.46	1.173,9	1.173,9	215	0	0	5	2	2022-08-23	28	2022-06-20
1090	626	1	75638603	215	1	5.572093	1.198	1.198	215	0	0	5	2	2022-08-23	28	2022-07-10
1091	746	1	3126889	215	1	5.97	1.283,55	1.283,55	215	0	0	5	2	2022-08-23	28	2022-08-15
1100	673	1	1011101552	425	1	5.56	2.363	2.363	425	0	0	5	2	2022-08-23	24	2022-07-07
1103	308	1	137896 / 13233010	235	1	4.947489	1.162,66	1.162,66	235	0	0	5	2	2022-08-23	10	2022-05-25
1104	428	1	138862	235	1	5.31	1.247,85	1.247,85	6.626,08	0	0	5	2	2022-08-23	10	2022-06-15
1111	729	1	12601414751	165	1	6	990	990	5.940	0	0	5	2	2022-08-23	10	2022-08-16
1533	205	3		33	1	4.38	144,54	190,41	33	0	0	5	2	2022-09-05	0	2022-09-05
1552	77	1	915413058	19	1	4.421052	84	84	19	0	0	1	2	2022-09-07	6	2022-04-06
1567	522	3		225	1	5.77	1.298,25	1.298,25	225	0	0	1	2	2022-09-07	0	2022-09-07
1580	835	3		150	1	7.99	1.198,5	1.198,5	150	0	0	1	2	2022-09-09	0	2022-09-09
1126	307	1	137896	165	1	4.95	816,75	816,75	165	0	0	5	2	2022-08-24	10	2022-05-25
1127	427	1	138862	165	1	5.31	876,15	876,15	165	0	0	5	2	2022-08-24	10	2022-06-15
1128	381	1	12558666673	165	1	5.09	839,85	839,85	4.274,84	0	0	5	2	2022-08-24	10	2022-06-02
1129	501	1	817594	165	1	5.513090	909,66	909,66	165	0	0	5	2	2022-08-24	4	2022-06-29
1130	621	1	12582175525	165	1	5.599878	923,98	923,98	165	0	0	5	2	2022-08-24	10	2022-07-12
1131	741	1	12600673497	165	1	5.9481	981,44	981,44	165	0	0	5	2	2022-08-24	10	2022-08-14
1134	330	1	12558840768	290	1	5.09	1.476,1	1.476,1	290	0	0	5	2	2022-08-24	10	2022-06-02
1135	450	1	664672	290	1	5.457206	1.582,59	1.582,59	290	0	0	5	2	2022-08-24	4	2022-06-23
1136	570	1	817662	290	1	5.513090	1.598,8	1.598,8	8.814,33	0	0	5	2	2022-08-24	4	2022-06-29
1137	690	1	12852174132	290	1	5.599896	1.623,97	1.623,97	290	0	0	5	2	2022-08-24	10	2022-07-12
1138	810	1	12600669757	290	1	5.9481	1.724,95	1.724,95	290	0	0	5	2	2022-08-24	10	2022-08-14
1141	254	1	12558843748	290	1	5.09	1.476,1	1.476,1	290	0	0	5	2	2022-08-24	10	2022-06-02
1142	374	1	664644	290	1	5.457206	1.582,59	1.582,59	290	0	0	5	2	2022-08-24	4	2022-06-23
1143	494	1	52300817722	290	1	5.513090	1.598,8	1.598,8	290	0	0	5	2	2022-08-24	4	2022-06-29
1144	614	1	1282175728	290	1	5.599896	1.623,97	1.623,97	290	0	0	5	2	2022-08-24	10	2022-07-12
1146	195	1	ldpem110722	81	1	5.61	454,41	454,41	81	0	0	5	2	2022-08-24	10	2022-07-11
1147	315	1	ldpem110722	405	1	5.61049	2.272,25	2.272,25	405	0	0	5	2	2022-08-24	10	2022-07-11
1148	435	1	ldpem110722	405	1	5.61049	2.272,25	2.272,25	405	0	0	5	2	2022-08-24	10	2022-07-11
1149	555	1	ldpem110722	405	1	5.61049	2.272,25	2.272,25	405	0	0	5	2	2022-08-24	10	2022-07-11
1150	675	1	ldpem110722	405	1	5.61049	2.272,25	2.272,25	405	0	0	5	2	2022-08-24	10	2022-07-11
1157	152	1	125259022574	33	1	4.42	145,86	145,86	33	0	0	5	2	2022-08-24	10	2022-04-12
1158	272	2		165	1	4.49	740,85	740,85	165	0	0	5	2	2022-08-24	0	2022-08-24
1159	32	1	12486062260	33	1	4.38	144,54	144,54	33	0	0	5	2	2022-08-24	10	2022-02-02
1160	392	2		165	1	5.07	836,55	836,55	165	-0	0	5	2	2022-08-24	0	2022-08-24
1161	512	2		165	1	5.53	912,45	912,45	165	0	0	5	2	2022-08-24	0	2022-08-24
1162	64	1	03682471	42	1	4.52261	189,95	189,95	42	0	0	5	2	2022-08-24	1	2022-05-04
1163	184	1	03684657	42	1	4.52261	189,95	189,95	42	0	0	5	2	2022-08-24	1	2022-05-04
1164	304	1	06422769	210	1	5.50	1.155	1.155	210	0	0	5	2	2022-08-24	1	2022-07-04
1171	249	1	87966589	165	1	4.424242	730	730	165	0	0	5	2	2022-08-24	5	2022-04-14
1174	358	1	24892	165	1	5.09	839,85	839,85	165	0	0	5	2	2022-08-24	5	2022-06-03
1175	478	1	12578389338	165	1	5.555212	916,61	916,61	165	0	0	5	2	2022-08-24	10	2022-07-06
1176	598	1	12580995370	165	1	5.612	925,98	925,98	165	0	0	5	2	2022-08-24	10	2022-07-11
1177	718	1	12590516122	165	1	5.77	952,05	952,05	165	0	0	5	2	2022-08-24	10	2022-07-28
1178	838	1	91127498	165	1	5.97	985,05	985,05	165	0	0	5	2	2022-08-24	5	2022-08-16
1145	734	1	12600673312	290	1	5.9481	1.724,95	1.724,95	290	0	0	5	2	2022-08-24	10	2022-08-14
62	62	0		0	1	5.77	0	0	48	6.24	36	1	0	2022-02-01	\N	\N
1534	325	3		165	1	4.49	740,85	740,85	165	0	0	5	2	2022-09-05	0	2022-09-05
1553	197	1	915413058	19	1	4.421052	84	84	19	0	0	1	2	2022-09-07	6	2022-04-06
1568	625	1	12613422466	165	1	7.957575	1.313	1.313,4	165	0	0	1	2	2022-09-07	10	2022-09-06
1581	492	3		70	1	7.99	559,3	559,3	70	-0	0	1	2	2022-09-09	0	2022-09-09
302	302	0		0	1	5.77	0	0	0	31.2	240	1	0	2022-04-01	\N	\N
422	422	0		0	1	5.77	0	0	0	31.2	240	1	0	2022-05-01	\N	\N
542	542	0		0	1	5.77	0	0	0	31.2	240	1	0	2022-06-01	\N	\N
662	662	0		0	1	5.77	0	0	0	31.2	240	1	0	2022-07-01	\N	\N
782	782	0		0	1	5.77	0	0	0	31.2	240	1	0	2022-08-01	\N	\N
1198	351	1	52300841791	265	1	4.831698	1.280,4	1.280,4	265	0	0	5	2	2022-08-25	4	2022-05-19
1199	471	1	12558664410	265	1	5.09	1.348,85	1.348,85	265	0	0	5	2	2022-08-25	10	2022-06-02
1200	591	1	52300817552	265	1	5.513094	1.460,97	1.460,97	265	0	0	5	2	2022-08-25	4	2022-06-29
1201	711	1	12582174958	265	1	5.599896	1.483,97	1.483,97	265	-0	0	5	2	2022-08-25	10	2022-07-12
1202	831	1	12600669550	265	1	5.9481	1.576,25	1.576,25	265	0	0	5	2	2022-08-25	10	2022-08-14
1211	569	1	12578558165/21886417967	235	1	5.542553	1.302,5	1.299,55	235	0	0	5	2	2022-08-25	10	2022-07-07
1212	689	1	12578558165/21886417967	235	1	5.542553	1.302,5	1.302,5	235	0	0	5	2	2022-08-25	10	2022-07-07
1220	399	1	03707941	200	1	4.52	904	1.014	200	0	0	5	2	2022-08-29	2	2022-05-04
1221	519	1	12558658926	200	1	5.09	1.018	1.018	200	0	0	5	2	2022-08-29	10	2022-06-02
1222	639	1	12578254029	200	1	5.56	1.112	1.112	200	0	0	5	2	2022-08-29	10	2022-07-06
1223	759	1	1295895735	200	1	5.84	1.168	1.168	200	0	0	5	2	2022-08-29	10	2022-08-05
1229	83	1	4937853/49383773	33	1	5	165	165	33	0	0	5	2	2022-08-29	2	2022-05-01
1230	203	1	4937853/49383773	33	1	5	165	165	33	0	0	5	2	2022-08-29	2	2022-05-31
1231	323	1	96840644	165	1	5.20	858	858	165	0	0	5	2	2022-08-29	2	2022-06-12
1232	443	1	96840644	165	1	5.20	858	858	165	0	0	5	2	2022-08-29	2	2022-06-12
1233	54	1	38092471 	60	1	4.52	271,2	262,8	60	0	0	5	2	2022-08-29	2	2022-02-02
1246	45	1	88106614	20	1	4.44	88,8	88,8	20	-0	0	5	2	2022-08-29	5	2022-04-22
1247	165	1	88106671	20	1	4.44	88,8	88,8	394,27	0	0	5	2	2022-08-29	5	2022-04-22
1248	285	1	88106614 / 6200209264	100	1	4.4389	443,89	443,89	100	-0	0	5	2	2022-08-29	5	2022-04-27
1249	405	2	114305681	100	1	5.07	507	507	100	0	0	5	2	2022-08-29	0	2022-06-14
1250	525	2	114305681	100	1	5.53	553	553	100	0	0	5	2	2022-08-29	0	2022-06-14
1252	765	1	90752820	100	1	5.79	579	579	100	0	0	5	2	2022-08-29	5	2022-08-02
1253	40	1	12519926151	20	1	4.38	87,6	87,6	20	0	0	5	2	2022-08-29	10	2022-04-26
1254	160	1	12519926151	20	1	4.38	87,6	87,6	20	0	0	5	2	2022-08-29	10	2022-04-26
1255	280	1	12534340910/125349796611	100	1	4.44	444	444	100	-0	0	5	2	2022-08-29	10	2022-04-26
1256	400	1	12552997929 / 12551662438	100	1	4.58	458	507	100	0	0	5	2	2022-08-30	10	2022-05-24
1257	520	1	12560286714	100	1	5.09	509	509	100	0	0	5	2	2022-08-30	10	2022-06-05
1554	317	1	1058793397	95	1	4.77	453,15	453,15	95	0	0	1	2	2022-09-07	6	2022-05-14
1258	640	1	125846330383	100	1	5.68	568	568	100	0	0	5	2	2022-08-30	10	2022-07-17
1259	760	1	12594969532	100	1	5.80	580	580	100	0	0	5	2	2022-08-30	10	2022-08-03
1260	53	1	151644896	36	1	4.52	162,72	0	36	0	0	5	2	2022-08-30	28	2022-02-02
1266	95	1	12532254832	24	1	4.90	117,6	117,6	24	-0	0	5	2	2022-08-30	10	2022-04-25
1267	215	1	12532254832	24	1	4.90	117,6	117,6	24	-0	0	5	2	2022-08-30	10	2022-04-25
1268	335	1	12532254832	120	1	4.90666	588,8	588,8	120	0	0	5	2	2022-08-30	10	2022-04-25
1272	47	1	12519915386	24	1	4.4104	105,85	105,85	24	0	0	5	2	2022-08-30	10	2022-04-06
1273	167	1	12519915386	24	1	4.4104	105,85	105,85	24	0	0	5	2	2022-08-30	10	2022-04-06
1274	287	1	12543568776	120	1	4.57	548,4	548,4	120	-0	0	5	2	2022-08-30	10	2022-05-09
1275	407	1	12556813710	120	1	5.066	607,92	607,92	120	0	0	5	2	2022-08-30	10	2022-05-31
1276	527	1	12566337131	120	1	5.31	637,2	637,2	120	0	0	5	2	2022-08-30	10	2022-06-15
1277	647	1	12585636189	120	1	5.68	681,6	681,6	120	0	0	5	2	2022-08-30	10	2022-07-19
1278	767	1	12601197997	120	1	5.95	714	714	120	0	0	5	2	2022-08-30	10	2022-08-15
1284	164	1	12528051882	35	1	4.43	155,05	155,05	35	0	0	5	2	2022-08-30	10	2022-04-16
1285	284	1	12538970820	175	1	4.50	787,5	787,5	175	0	0	5	2	2022-08-30	10	2022-05-02
1286	404	1	12558346322	175	1	5.09	890,75	890,75	175	0	0	5	2	2022-08-30	10	2022-06-02
1289	252	1	137896	70	1	4.95	346,5	346,5	70	0	0	5	2	2022-08-30	10	2022-05-25
1290	372	1	138862	70	1	5.31	371,7	371,7	70	0	0	5	2	2022-08-30	10	2022-06-15
1293	260	1	12751985263	165	1	4.80	792	792	165	0	0	5	2	2022-08-30	10	2022-05-23
1303	116	1	6361915	35	1	5.54	193,9	193,9	35	0	0	5	2	2022-08-30	2	2022-07-06
1304	236	1	6361915	35	1	5.54	193,9	193,9	35	0	0	5	2	2022-08-30	2	2022-07-06
1305	356	1	6361915	175	1	5.54	969,5	969,5	175	0	0	5	2	2022-08-30	2	2022-07-06
1536	133	3		11	1	4.38	48,18	63,47	11	0	0	5	2	2022-09-05	0	2022-09-05
1555	437	1	1058793397	95	1	4.77	453,15	453,15	95	0	0	1	2	2022-09-07	6	2022-05-14
1570	176	6		70	1	4.38	306,6	306,6	70	0	0	1	2	2022-09-07	0	2022-09-07
1583	732	3		70	1	7.99	559,3	559,3	70	-0	0	1	2	2022-09-09	0	2022-09-09
1345	65	1	52300062602	47	1	4.54	213,38	213,38	47	0	0	5	2	2022-08-30	4	2022-01-31
1347	305	1	52300970980	235	1	4.44	1.043,4	1.043,4	235	0	0	5	2	2022-08-30	5	2022-04-14
1352	17	1	86066486	33	1	4.121212	136	136	33	0	0	5	2	2022-08-30	5	2022-02-02
1353	137	1	87907152	33	1	4	132	132	33	0	0	5	2	2022-08-30	5	2022-04-13
1354	257	1	89410595	165	1	5.20	858	858	165	0	0	5	2	2022-08-30	5	2022-06-10
1355	377	1	89972687	165	1	5.55	915,75	915,75	165	0	0	5	2	2022-08-30	5	2022-07-04
1356	497	1	90026249	165	1	5.557575	917	917	165	0	0	5	2	2022-08-30	5	2022-07-06
1357	617	1	90311094	165	1	5.696969	940	940	165	0	0	5	2	2022-08-30	5	2022-07-16
1358	737	1	90630286	165	1	5.78	953,7	953,7	165	0	0	5	2	2022-08-30	5	2022-07-29
1361	107	1	955555991	48	1	4.53	217,44	217,44	48	0	0	5	2	2022-08-30	24	2022-02-01
1362	227	1	978002972	48	1	4.41	211,68	211,68	48	0	0	5	2	2022-08-30	24	2022-04-06
1363	347	1	983007336	240	1	4.44	1.065,6	1.065,6	240	-0	0	5	2	2022-08-30	24	2022-04-20
1364	467	1	963822788010	240	1	4.708333	1.130	1.130	240	0	0	5	2	2022-08-30	24	2022-05-13
1365	587	1	1000685507	240	1	5.15	1.236	1.236	240	0	0	5	2	2022-08-30	24	2022-06-08
1372	629	1	20402965018	185	1	6.23783	1.154	1.154	185	0	0	5	2	2022-08-30	4	2022-08-23
1373	792	1	PAP240822022	235	1	6.28	1.475,8	1.475,8	235	0	0	5	2	2022-08-30	5	2022-08-24
1390	846	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-09-01	\N	\N
1391	847	0		0	1	5.77	0	0	0	38.99	225	1	0	2022-09-01	\N	\N
1392	848	0		0	1	5.77	0	0	0	40.73	235	1	0	2022-09-01	\N	\N
1393	849	0		0	1	5.77	0	0	0	36.4	210	1	0	2022-09-01	\N	\N
1394	850	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-09-01	\N	\N
1395	851	0		0	1	5.77	0	0	0	38.13	220	1	0	2022-09-01	\N	\N
1396	852	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-09-01	\N	\N
1397	853	0		0	1	5.77	0	0	0	38.13	220	1	0	2022-09-01	\N	\N
1398	854	0		0	1	5.77	0	0	0	9.53	55	1	0	2022-09-01	\N	\N
1399	855	0		0	1	5.77	0	0	0	12.13	70	1	0	2022-09-01	\N	\N
1401	857	0		0	1	5.77	0	0	0	50.26	290	1	0	2022-09-01	\N	\N
1402	858	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-09-01	\N	\N
1403	859	0		0	1	5.77	0	0	0	19.93	115	1	0	2022-09-01	\N	\N
1404	860	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-09-01	\N	\N
1405	861	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-09-01	\N	\N
1406	862	0		0	1	5.77	0	0	0	19.06	110	1	0	2022-09-01	\N	\N
1407	863	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-09-01	\N	\N
1408	864	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-09-01	\N	\N
1410	866	0		0	1	5.77	0	0	0	62.39	360	1	0	2022-09-01	\N	\N
1411	867	0		0	1	5.77	0	0	0	24.26	140	1	0	2022-09-01	\N	\N
1412	868	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-09-01	\N	\N
1413	869	0		0	1	5.77	0	0	0	37.26	215	1	0	2022-09-01	\N	\N
1414	870	0		0	1	5.77	0	0	0	47.66	275	1	0	2022-09-01	\N	\N
1415	871	0		0	1	5.77	0	0	0	63.26	365	1	0	2022-09-01	\N	\N
1416	872	0		0	1	5.77	0	0	0	32.06	185	1	0	2022-09-01	\N	\N
1417	873	0		0	1	5.77	0	0	0	37.26	215	1	0	2022-09-01	\N	\N
1418	874	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-09-01	\N	\N
1419	875	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-09-01	\N	\N
1400	856	0		0	1	5.77	0	0	0	10.4	55	1	0	2022-09-01	\N	\N
1537	373	3		55	1	5.07	278,85	278,85	55	0	0	5	2	2022-09-05	0	2022-09-05
1556	557	1	1145694746	95	1	5.15	489,25	489,25	95	-0	0	1	2	2022-09-07	6	2022-06-06
1571	296	6		350	1	4.49	1.571,5	1.571,5	350	0	0	1	2	2022-09-07	0	2022-09-07
1584	547	3		165	1	7.99	1.318,35	1.318,35	165	-0	0	1	2	2022-09-09	0	2022-09-09
1420	876	0		0	1	5.77	0	0	0	30.33	175	1	0	2022-09-01	\N	\N
1421	877	0		0	1	5.77	0	0	0	62.39	360	1	0	2022-09-01	\N	\N
1422	878	0		0	1	5.77	0	0	0	30.33	175	1	0	2022-09-01	\N	\N
1423	879	0		0	1	5.77	0	0	0	38.99	225	1	0	2022-09-01	\N	\N
1424	880	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-09-01	\N	\N
1425	881	0		0	1	5.77	0	0	0	99.65	575	1	0	2022-09-01	\N	\N
1427	883	0		0	1	5.77	0	0	0	17.33	100	1	0	2022-09-01	\N	\N
1428	884	0		0	1	5.77	0	0	0	69.32	400	1	0	2022-09-01	\N	\N
1429	885	0		0	1	5.77	0	0	0	38.99	225	1	0	2022-09-01	\N	\N
1430	886	0		0	1	5.77	0	0	0	35.53	205	1	0	2022-09-01	\N	\N
1431	887	0		0	1	5.77	0	0	0	30.33	175	1	0	2022-09-01	\N	\N
1432	888	0		0	1	5.77	0	0	0	17.33	100	1	0	2022-09-01	\N	\N
1434	890	0		0	1	5.77	0	0	0	20.8	120	1	0	2022-09-01	\N	\N
1435	891	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-09-01	\N	\N
1436	892	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-09-01	\N	\N
1437	893	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-09-01	\N	\N
1438	894	0		0	1	5.77	0	0	0	21.66	125	1	0	2022-09-01	\N	\N
1439	895	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-09-01	\N	\N
1440	896	0		0	1	5.77	0	0	0	31.2	180	1	0	2022-09-01	\N	\N
1442	898	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-09-01	\N	\N
1443	899	0		0	1	5.77	0	0	0	60.66	350	1	0	2022-09-01	\N	\N
1444	900	0		0	1	5.77	0	0	0	31.2	180	1	0	2022-09-01	\N	\N
1445	901	0		0	1	5.77	0	0	0	54.59	315	1	0	2022-09-01	\N	\N
1447	903	0		0	1	5.77	0	0	0	45.06	260	1	0	2022-09-01	\N	\N
1448	904	0		0	1	5.77	0	0	0	40.73	235	1	0	2022-09-01	\N	\N
1449	905	0		0	1	5.77	0	0	0	41.59	240	1	0	2022-09-01	\N	\N
1450	906	0		0	1	5.77	0	0	0	36.4	210	1	0	2022-09-01	\N	\N
1451	907	0		0	1	5.77	0	0	0	36.4	210	1	0	2022-09-01	\N	\N
1452	908	0		0	1	5.77	0	0	0	31.2	180	1	0	2022-09-01	\N	\N
1453	909	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-09-01	\N	\N
1454	910	0		0	1	5.77	0	0	0	40.73	235	1	0	2022-09-01	\N	\N
1455	911	0		0	1	5.77	0	0	0	30.33	175	1	0	2022-09-01	\N	\N
1456	912	0		0	1	5.77	0	0	0	47.66	275	1	0	2022-09-01	\N	\N
1457	913	0		0	1	5.77	0	0	0	38.13	220	1	0	2022-09-01	\N	\N
1459	915	0		0	1	5.77	0	0	0	73.66	425	1	0	2022-09-01	\N	\N
1460	916	0		0	1	5.77	0	0	0	53.73	310	1	0	2022-09-01	\N	\N
1461	917	0		0	1	5.77	0	0	0	70.19	405	1	0	2022-09-01	\N	\N
1462	918	0		0	1	5.77	0	0	0	31.2	180	1	0	2022-09-01	\N	\N
1464	920	0		0	1	5.77	0	0	0	51.99	300	1	0	2022-09-01	\N	\N
1465	921	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-09-01	\N	\N
1466	922	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-09-01	\N	\N
1467	923	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-09-01	\N	\N
1468	924	0		0	1	5.77	0	0	0	50.26	290	1	0	2022-09-01	\N	\N
1469	925	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-09-01	\N	\N
1470	926	0		0	1	5.77	0	0	0	76.26	440	1	0	2022-09-01	\N	\N
1471	927	0		0	1	5.77	0	0	0	20.8	120	1	0	2022-09-01	\N	\N
1472	928	0		0	1	5.77	0	0	0	41.59	240	1	0	2022-09-01	\N	\N
1473	929	0		0	1	5.77	0	0	0	29.46	170	1	0	2022-09-01	\N	\N
1474	930	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-09-01	\N	\N
1475	931	0		0	1	5.77	0	0	0	40.73	235	1	0	2022-09-01	\N	\N
1476	932	0		0	1	5.77	0	0	0	50.26	290	1	0	2022-09-01	\N	\N
1477	933	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-09-01	\N	\N
1478	934	0		0	1	5.77	0	0	0	30.33	175	1	0	2022-09-01	\N	\N
1479	935	0		0	1	5.77	0	0	0	20.8	120	1	0	2022-09-01	\N	\N
1480	936	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-09-01	\N	\N
1481	937	0		0	1	5.77	0	0	0	37.26	215	1	0	2022-09-01	\N	\N
1482	938	0		0	1	5.77	0	0	0	29.46	170	1	0	2022-09-01	\N	\N
1483	939	0		0	1	5.77	0	0	0	54.59	315	1	0	2022-09-01	\N	\N
1484	940	0		0	1	5.77	0	0	0	31.2	180	1	0	2022-09-01	\N	\N
1485	941	0		0	1	5.77	0	0	0	53.73	310	1	0	2022-09-01	\N	\N
1486	942	0		0	1	5.77	0	0	0	46.79	270	1	0	2022-09-01	\N	\N
1487	943	0		0	1	5.77	0	0	0	34.66	200	1	0	2022-09-01	\N	\N
1488	944	0		0	1	5.77	0	0	0	19.93	115	1	0	2022-09-01	\N	\N
1490	946	0		0	1	5.77	0	0	0	41.59	240	1	0	2022-09-01	\N	\N
1491	947	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-09-01	\N	\N
1492	948	0		0	1	5.77	0	0	0	51.99	300	1	0	2022-09-01	\N	\N
1493	949	0		0	1	5.77	0	0	0	39.86	230	1	0	2022-09-01	\N	\N
1494	950	0		0	1	5.77	0	0	0	45.93	265	1	0	2022-09-01	\N	\N
1495	951	0		0	1	5.77	0	0	0	12.13	70	1	0	2022-09-01	\N	\N
1496	952	0		0	1	5.77	0	0	0	34.66	200	1	0	2022-09-01	\N	\N
1497	953	0		0	1	5.77	0	0	0	43.33	250	1	0	2022-09-01	\N	\N
1499	955	0		0	1	5.77	0	0	0	30.33	175	1	0	2022-09-01	\N	\N
1501	957	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-09-01	\N	\N
1502	958	0		0	1	5.77	0	0	0	13	75	1	0	2022-09-01	\N	\N
1503	959	0		0	1	5.77	0	0	0	21.66	125	1	0	2022-09-01	\N	\N
841	2	3		33	1	4.38	144,54	144,54	33	0	0	1	2	2022-08-16	0	2022-08-16
842	122	3		33	1	4.38	144,54	144,54	33	0	0	1	2	2022-08-16	0	2022-08-16
865	9	3		33	1	4.38	144,54	144,54	33	0	0	1	2	2022-08-16	0	2022-08-16
866	129	3		33	1	4.38	144,54	144,54	33	0	0	1	2	2022-08-16	0	2022-08-16
1498	954	0		0	1	5.77	0	0	0	31.2	150	1	0	2022-09-01	\N	\N
1538	253	3		55	1	4.49	246,95	317,35	55	0	0	5	2	2022-09-05	0	2022-09-05
868	609	3		165	1	5.78	953,7	953,7	165	0	0	1	2	2022-08-16	0	2022-08-16
870	21	3		33	1	4.38	144,54	144,54	33	0	0	1	2	2022-08-16	0	2022-08-16
871	141	3		33	1	4.38	144,54	144,54	33	0	0	1	2	2022-08-16	0	2022-08-16
922	546	3		180	1	5.53	995,4	995,4	180	-0	0	1	2	2022-08-17	0	2022-08-17
923	666	3		180	1	5.78	1.040,4	1.040,4	180	0	0	1	2	2022-08-17	0	2022-08-17
990	299	3		165	1	4.49	740,85	740,85	165	0	0	1	2	2022-08-17	0	2022-08-17
1000	699	3		315	1	5.98	1.883,7	1.883,7	315	0	0	5	2	2022-08-18	0	2022-08-18
1001	819	3		315	1	5.97	1.880,55	1.880,55	315	0	0	5	2	2022-08-18	0	2022-08-18
1002	721	3		250	1	6.09	1.522,5	1.522,5	250	0	0	5	2	2022-08-19	0	2022-08-19
1003	821	3		315	1	6.18	1.946,7	1.946,7	315	0	0	5	2	2022-08-20	0	2022-08-21
1005	789	3		175	1	6.18	1.081,5	1.081,5	175	0	0	5	2	2022-08-20	0	2022-08-21
1006	712	3		70	1	6.18	432,6	432,6	70	0	0	5	2	2022-08-22	0	2022-08-22
1007	615	3		165	1	6.18	1.019,7	1.019,7	165	0	0	5	2	2022-08-22	0	2022-08-22
1008	735	3		165	1	6.18	1.019,7	1.019,7	165	0	0	5	2	2022-08-22	0	2022-08-22
1009	841	3		250	1	5.77	1.442,5	1.442,5	250	0	0	5	2	2022-08-22	0	2022-08-22
1010	842	3		315	1	5.77	1.817,55	1.817,55	315	0	0	5	2	2022-08-22	0	2022-08-22
1004	669	3		175	1	6.18	370,8	1.081,5	175	0	0	5	3	2022-08-20	0	2022-08-21
1017	31	3		33	1	4.38	144,54	144,54	33	0	0	5	2	2022-08-23	0	2022-08-23
1018	151	3		33	1	4.38	144,54	144,54	33	0	0	5	2	2022-08-23	0	2022-08-23
1019	108	3		33	1	4.38	144,54	144,54	33	0	0	5	2	2022-08-23	0	2022-08-23
1020	228	3		33	1	4.38	144,54	144,54	33	0	0	5	2	2022-08-23	0	2022-08-23
1021	348	3		165	1	4.49	740,85	740,85	165	0	0	5	2	2022-08-23	0	2022-08-23
1022	468	3		165	1	5.07	836,55	836,55	165	-0	0	5	2	2022-08-23	0	2022-08-23
1023	588	3		165	1	5.53	912,45	912,45	165	0	0	5	2	2022-08-23	0	2022-08-23
1024	708	3		165	1	5.78	953,7	953,7	165	0	0	5	2	2022-08-23	0	2022-08-23
1027	709	3		300	1	5.78	1.734	1.734	300	0	0	5	2	2022-08-23	0	2022-08-23
1105	22	3		42	1	4.38	183,96	183,96	42	0	0	5	2	2022-08-23	0	2022-08-23
1034	692	3		165	1	5.78	953,7	953,7	165	0	0	5	2	2022-08-23	0	2022-08-23
1041	636	3		225	1	5.78	1.300,5	1.300,5	225	0	0	5	2	2022-08-23	0	2022-08-23
1042	756	3		225	1	5.98	1.345,5	1.345,5	225	0	0	5	2	2022-08-23	0	2022-08-23
1045	37	3		33	1	4.38	144,54	144,54	33	0	0	5	2	2022-08-23	0	2022-08-23
1046	157	3		33	1	4.38	144,54	144,54	33	0	0	5	2	2022-08-23	0	2022-08-23
1047	277	3		165	1	4.49	740,85	740,85	165	0	0	5	2	2022-08-23	0	2022-08-23
1048	397	3		165	1	5.07	836,55	836,55	165	-0	0	5	2	2022-08-23	0	2022-08-23
1049	517	3		165	1	5.53	912,45	912,45	165	0	0	5	2	2022-08-23	0	2022-08-23
1050	637	3		165	1	5.78	953,7	953,7	165	0	0	5	2	2022-08-23	0	2022-08-23
1051	102	3		62	1	4.38	271,56	271,56	62	0	0	5	2	2022-08-23	0	2022-08-23
1052	222	3		62	1	4.38	271,56	271,56	1.189,43	0	0	5	2	2022-08-23	0	2022-08-23
1053	342	3		310	1	4.49	1.391,9	1.391,9	310	0	0	5	2	2022-08-23	0	2022-08-23
1054	462	3		310	1	5.07	1.571,7	1.571,7	310	0	0	5	2	2022-08-23	0	2022-08-23
1055	582	3		310	1	5.53	1.714,3	1.714,3	310	-0	0	5	2	2022-08-23	0	2022-08-23
1056	702	3		310	1	5.78	1.791,8	1.791,8	310	-0	0	5	2	2022-08-23	0	2022-08-23
1057	104	3		40	1	4.38	175,2	175,2	40	0	0	5	2	2022-08-23	0	2022-08-23
1058	224	3		40	1	4.38	175,2	175,2	40	0	0	5	2	2022-08-23	0	2022-08-23
1059	344	3		200	1	4.49	898	898	200	0	0	5	2	2022-08-23	0	2022-08-23
1060	464	3		200	1	5.07	1.014	1.014	200	0	0	5	2	2022-08-23	0	2022-08-23
1061	584	3		200	1	5.53	1.106	1.106	200	0	0	5	2	2022-08-23	0	2022-08-23
1062	704	3		200	1	5.78	1.156	1.156	6.681,68	0	0	5	2	2022-08-23	0	2022-08-23
1063	100	3		36	1	4.38	157,68	157,68	36	0	0	5	2	2022-08-23	0	2022-08-23
1064	220	3		36	1	4.38	157,68	157,68	36	0	0	5	2	2022-08-23	0	2022-08-23
1065	340	3		180	1	4.49	808,2	808,2	180	0	0	5	2	2022-08-23	0	2022-08-23
1066	460	3		180	1	5.07	912,6	912,6	180	0	0	5	2	2022-08-23	0	2022-08-23
1067	580	3		180	1	5.53	995,4	995,4	180	-0	0	5	2	2022-08-23	0	2022-08-23
1068	700	3		180	1	5.78	1.040,4	1.040,4	180	0	0	5	2	2022-08-23	0	2022-08-23
1088	386	3		215	1	5.07	1.090,05	1.090,05	215	0	0	5	2	2022-08-23	0	2022-08-23
1093	125	3		47	1	4.38	205,86	205,86	47	0	0	5	2	2022-08-23	0	2022-08-23
1094	245	3		235	1	4.49	1.055,15	1.055,15	235	0	0	5	2	2022-08-23	0	2022-08-23
1095	365	3		235	1	5.07	1.191,45	1.191,45	235	0	0	5	2	2022-08-23	0	2022-08-23
1096	485	3		235	1	5.53	1.299,55	1.299,55	235	0	0	5	2	2022-08-23	0	2022-08-23
1097	605	3		235	1	5.78	1.358,3	1.358,3	235	0	0	5	2	2022-08-23	0	2022-08-23
1102	188	3		47	1	4.38	205,86	205,86	47	0	0	5	2	2022-08-23	0	2022-08-23
1099	182	3		36	1	4.38	157,68	157,68	48	0	0	5	2	2022-08-23	0	2022-08-23
1106	142	3		42	1	4.38	183,96	183,96	42	0	0	5	2	2022-08-23	0	2022-08-23
1107	262	3		210	1	4.49	942,9	942,9	210	-0	0	5	2	2022-08-23	0	2022-08-23
1108	382	3		210	1	5.07	1.064,7	1.064,7	210	0	0	5	2	2022-08-23	0	2022-08-23
1109	502	3		210	1	5.53	1.161,3	1.161,3	210	0	0	5	2	2022-08-23	0	2022-08-23
1110	622	3		210	1	5.78	1.213,8	1.213,8	210	0	0	5	2	2022-08-23	0	2022-08-23
1112	94	3		33	1	4.38	144,54	144,54	33	0	0	5	2	2022-08-23	0	2022-08-23
1113	214	3		33	1	4.38	144,54	144,54	33	0	0	5	2	2022-08-23	0	2022-08-23
1114	334	3		165	1	4.49	740,85	740,85	165	0	0	5	2	2022-08-23	0	2022-08-23
1115	35	3		35	1	4.38	153,3	153,3	35	0	0	5	2	2022-08-23	0	2022-08-23
1116	155	3		35	1	4.38	153,3	153,3	35	0	0	5	2	2022-08-23	0	2022-08-23
1117	275	3		175	1	4.49	785,75	785,75	175	0	0	5	2	2022-08-23	0	2022-08-23
1118	395	3		175	1	5.07	887,25	887,25	175	0	0	5	2	2022-08-23	0	2022-08-23
1119	515	3		175	1	5.53	967,75	967,75	175	0	0	5	2	2022-08-23	0	2022-08-23
1120	726	3		210	1	5.98	1.255,8	1.255,8	210	-0	0	5	2	2022-08-23	0	2022-08-23
1121	74	3		62	1	4.38	271,56	271,56	62	0	0	5	2	2022-08-24	0	2022-08-24
1122	194	3		62	1	4.38	271,56	271,56	62	0	0	5	2	2022-08-24	0	2022-08-24
1123	314	3		310	1	4.49	1.391,9	1.391,9	310	0	0	5	2	2022-08-24	0	2022-08-24
1124	67	3		33	1	4.38	144,54	144,54	33	0	0	5	2	2022-08-24	0	2022-08-24
1125	187	3		33	1	4.38	144,54	144,54	33	0	0	5	2	2022-08-24	0	2022-08-24
1132	90	3		58	1	4.38	254,04	254,04	58	0	0	5	2	2022-08-24	0	2022-08-24
1133	210	3		58	1	4.38	254,04	254,04	58	0	0	5	2	2022-08-24	0	2022-08-24
1140	134	3		58	1	4.38	254,04	254,04	58	0	0	5	2	2022-08-24	0	2022-08-24
1151	55	3		33	1	4.38	144,54	144,54	33	0	0	5	2	2022-08-24	0	2022-08-24
1152	175	3		33	1	4.38	144,54	144,54	33	0	0	5	2	2022-08-24	0	2022-08-24
1153	295	3		165	1	4.49	740,85	740,85	165	0	0	5	2	2022-08-24	0	2022-08-24
1154	415	3		165	1	5.077	837,71	837,71	165	0	0	5	2	2022-08-24	0	2022-08-24
1155	535	3		165	1	5.53	912,45	912,45	165	0	0	5	2	2022-08-24	0	2022-08-24
1156	655	3		165	1	5.78	953,7	953,7	165	0	0	5	2	2022-08-24	0	2022-08-24
1165	424	3		210	1	5.07	1.064,7	1.064,7	210	0	0	5	2	2022-08-24	0	2022-08-24
1166	76	3		36	1	4.38	157,68	157,68	36	0	0	5	2	2022-08-24	0	2022-08-24
1167	196	3		36	1	4.38	157,68	157,68	36	0	0	5	2	2022-08-24	0	2022-08-24
1168	316	3		180	1	4.49	808,2	808,2	180	0	0	5	2	2022-08-24	0	2022-08-24
1169	436	3		180	1	5.07	912,6	912,6	180	0	0	5	2	2022-08-24	0	2022-08-24
1170	698	3		170	1	5.78	982,6	982,6	170	0	0	5	2	2022-08-24	0	2022-08-24
1172	118	3		33	1	4.38	144,54	144,54	33	0	0	5	2	2022-08-24	0	2022-08-24
1173	238	3		33	1	4.38	144,54	144,54	33	0	0	5	2	2022-08-24	0	2022-08-24
1179	454	3		165	1	6.28	1.036,2	1.036,2	165	0	0	5	2	2022-08-24	0	2022-08-24
1180	574	3		165	1	6.28	1.036,2	1.036,2	165	0	0	5	2	2022-08-24	0	2022-08-24
1181	694	3		165	1	6.28	1.036,2	1.036,2	165	0	0	5	2	2022-08-24	0	2022-08-24
1331	360	3		125	1	4.43	553,75	553,75	125	0	0	5	2	2022-08-30	0	2022-08-30
1332	480	3		125	1	5.45	681,25	681,25	125	0	0	5	2	2022-08-30	0	2022-08-30
1182	814	3		165	1	6.28	1.036,2	1.036,2	165	0	0	5	2	2022-08-24	0	2022-08-24
1183	843	3		165	1	5.77	952,05	952,05	165	0	0	5	2	2022-08-24	0	2022-08-24
1098	62	3		36	1	4.38	157,68	157,68	48	0	0	5	2	2022-08-23	0	2022-08-23
1244	504	3		140	1	5.53	774,2	774,2	140	0	0	5	2	2022-08-29	0	2022-08-29
1184	15	3		33	1	4.38	144,54	144,54	33	0	0	5	2	2022-08-25	0	2022-08-25
1185	135	3		33	1	4.38	144,54	144,54	33	0	0	5	2	2022-08-25	0	2022-08-25
1186	255	3		165	1	4.49	740,85	740,85	165	0	0	5	2	2022-08-25	0	2022-08-25
1187	375	3		165	1	5.07	836,55	836,55	165	-0	0	5	2	2022-08-25	0	2022-08-25
1188	495	3		165	1	5.53	912,45	912,45	165	0	0	5	2	2022-08-25	0	2022-08-25
1189	4	3		33	1	4.38	144,54	144,54	33	0	0	5	2	2022-08-25	0	2022-08-25
1190	124	3		33	1	4.38	144,54	144,54	33	0	0	5	2	2022-08-25	0	2022-08-25
1191	244	3		165	1	4.49	740,85	740,85	165	0	0	5	2	2022-08-25	0	2022-08-25
1192	364	3		165	1	5.07	836,55	836,55	165	-0	0	5	2	2022-08-25	0	2022-08-25
1193	484	3		165	1	5.53	912,45	912,45	165	0	0	5	2	2022-08-25	0	2022-08-25
1194	604	3		165	1	5.78	953,7	953,7	165	0	0	5	2	2022-08-25	0	2022-08-25
1195	724	3		165	1	5.78	953,7	953,7	165	0	0	5	2	2022-08-25	0	2022-08-25
1196	111	3		53	1	4.38	232,14	232,14	53	0	0	5	2	2022-08-25	0	2022-08-25
1197	231	3		53	1	4.38	232,14	232,14	53	0	0	5	2	2022-08-25	0	2022-08-25
1203	18	3		33	1	4.38	144,54	144,54	33	0	0	5	2	2022-08-25	0	2022-08-25
1204	138	3		33	1	4.38	144,54	144,54	33	0	0	5	2	2022-08-25	0	2022-08-25
1205	258	3		165	1	4.49	740,85	740,85	165	0	0	5	2	2022-08-25	0	2022-08-25
1206	378	3		165	1	5.07	836,55	836,55	165	-0	0	5	2	2022-08-25	0	2022-08-26
1207	89	3		47	1	4.38	205,86	205,86	47	0	0	5	2	2022-08-25	0	2022-08-26
1208	209	3		47	1	4.38	205,86	205,86	47	0	0	5	2	2022-08-25	0	2022-08-26
1209	329	3		235	1	4.49	1.055,15	1.055,15	235	0	0	5	2	2022-08-25	0	2022-08-26
1210	449	3		235	1	5.07	1.191,45	1.191,45	235	0	0	5	2	2022-08-25	0	2022-08-26
1213	367	3		165	1	7.8	1.287	1.287	165	0	0	1	2	2022-08-27	0	2022-08-27
1214	487	3		165	1	7.85	1.295,25	1.295,25	165	0	0	1	2	2022-08-27	0	2022-08-27
1215	607	3		165	1	7.85	1.295,25	1.295,25	165	0	0	1	2	2022-08-27	0	2022-08-27
1216	844	3		165	1	5.77	952,05	952,05	165	0	0	1	2	2022-08-27	0	2022-08-27
1217	39	3		40	1	4.38	175,2	175,2	40	0	0	5	2	2022-08-29	0	2022-08-29
1218	159	3		40	1	4.38	175,2	175,2	40	0	0	5	2	2022-08-29	0	2022-08-29
1219	279	3		200	1	4.49	898	898	200	0	0	5	2	2022-08-29	0	2022-08-29
1224	97	3		43	1	4.38	188,34	188,34	43	0	0	5	2	2022-08-29	0	2022-08-29
1225	217	3		43	1	4.38	188,34	188,34	43	0	0	5	2	2022-08-29	0	2022-08-29
1226	337	3		215	1	4.49	965,35	965,35	215	0	0	5	2	2022-08-29	0	2022-08-29
1227	457	3		215	1	5.07	1.090,05	1.090,05	215	0	0	5	2	2022-08-29	0	2022-08-29
1228	577	3		215	1	5.53	1.188,95	1.188,95	215	0	0	5	2	2022-08-29	0	2022-08-29
1234	174	3		60	1	4.38	262,8	262,8	60	0	0	5	2	2022-08-29	0	2022-08-29
1235	294	3		300	1	4.49	1.347	1.347	300	0	0	5	2	2022-08-29	0	2022-08-29
1236	414	3		300	1	5.07	1.521	1.521	300	0	0	5	2	2022-08-29	0	2022-08-29
1237	534	3		300	1	5.53	1.659	1.659	300	0	0	5	2	2022-08-29	0	2022-08-29
1238	654	3		300	1	5.78	1.734	1.734	300	0	0	5	2	2022-08-29	0	2022-08-29
1239	813	3		175	1	5.79	1.013,25	1.013,25	175	0	0	5	2	2022-08-29	0	2022-08-29
1240	24	3		28	1	4.38	122,64	122,64	28	0	0	5	2	2022-08-29	0	2022-08-29
1241	144	3		28	1	4.38	122,64	122,64	28	0	0	5	2	2022-08-29	0	2022-08-29
1242	264	3		140	1	4.49	628,6	628,6	140	0	0	5	2	2022-08-29	0	2022-08-29
1243	384	3		140	1	5.07	709,8	709,8	140	-0	0	5	2	2022-08-29	0	2022-08-29
1245	624	3		140	1	5.53	774,2	774,2	140	0	0	5	2	2022-08-29	0	2022-08-29
1251	645	3		100	1	5.78	578	578	100	0	0	5	2	2022-08-29	0	2022-08-29
1261	173	3		36	1	4.38	157,68	157,68	36	0	0	5	2	2022-08-30	0	2022-08-30
1262	293	3		180	1	4.49	808,2	808,2	180	0	0	5	2	2022-08-30	0	2022-08-30
1263	413	3		180	1	5.07	912,6	912,6	180	0	0	5	2	2022-08-30	0	2022-08-30
1264	533	3		180	1	5.53	995,4	995,4	180	-0	0	5	2	2022-08-30	0	2022-08-30
1265	653	3		180	1	5.78	1.040,4	1.040,4	180	0	0	5	2	2022-08-30	0	2022-08-30
1269	455	3		120	1	5.07	608,4	608,4	120	-0	0	5	2	2022-08-30	0	2022-08-30
1270	575	3		120	1	5.53	663,6	663,6	120	0	0	5	2	2022-08-30	0	2022-08-30
1271	695	3		120	1	5.78	693,6	693,6	120	0	0	5	2	2022-08-30	0	2022-08-30
1279	119	3		15	1	4.38	65,7	65,7	15	0	0	5	2	2022-08-30	0	2022-08-30
1280	239	3		15	1	4.38	65,7	65,7	15	0	0	5	2	2022-08-30	0	2022-08-30
1281	359	3		75	1	4.49	336,75	336,75	75	0	0	5	2	2022-08-30	0	2022-08-30
1282	51	3		25	1	4.38	109,5	109,5	25	0	0	5	2	2022-08-30	0	2022-08-30
1283	171	3		25	1	4.38	109,5	109,5	25	0	0	5	2	2022-08-30	0	2022-08-30
1287	12	3		14	1	4.38	61,32	61,32	14	0	0	5	2	2022-08-30	0	2022-08-30
1288	132	3		14	1	4.38	61,32	61,32	14	0	0	5	2	2022-08-30	0	2022-08-30
1291	20	3		33	1	4.38	144,54	144,54	33	0	0	5	2	2022-08-30	0	2022-08-30
1292	140	3		33	1	4.38	144,54	144,54	33	0	0	5	2	2022-08-30	0	2022-08-30
1294	380	3		165	1	5.07	836,55	836,55	165	-0	0	5	2	2022-08-30	0	2022-08-30
1295	500	3		165	1	5.53	912,45	912,45	165	0	0	5	2	2022-08-30	0	2022-08-30
1296	620	3		165	1	5.78	953,7	953,7	165	0	0	5	2	2022-08-30	0	2022-08-30
1297	87	3		34	1	4.38	148,92	148,92	34	0	0	5	2	2022-08-30	0	2022-08-30
1298	207	3		34	1	4.38	148,92	148,92	34	0	0	5	2	2022-08-30	0	2022-08-30
1299	327	3		170	1	4.49	763,3	763,3	170	-0	0	5	2	2022-08-30	0	2022-08-30
1300	447	3		170	1	5.07	861,9	861,9	170	-0	0	5	2	2022-08-30	0	2022-08-30
1301	567	3		170	1	5.53	940,1	940,1	170	0	0	5	2	2022-08-30	0	2022-08-30
1302	687	3		170	1	5.78	982,6	982,6	170	0	0	5	2	2022-08-30	0	2022-08-30
1306	52	3		33	1	4.38	144,54	144,54	33	0	0	5	2	2022-08-30	0	2022-08-30
1307	172	3		33	1	4.38	144,54	144,54	33	0	0	5	2	2022-08-30	0	2022-08-30
1308	292	3		165	1	4.49	740,85	740,85	165	0	0	5	2	2022-08-30	0	2022-08-30
1309	412	3		165	1	5.07	836,55	836,55	165	-0	0	5	2	2022-08-30	0	2022-08-30
1310	532	3		165	1	5.53	912,45	912,45	165	0	0	5	2	2022-08-30	0	2022-08-30
1311	96	3		33	1	4.38	144,54	144,54	33	0	0	5	2	2022-08-30	0	2022-08-30
1312	216	3		33	1	4.38	144,54	144,54	33	0	0	5	2	2022-08-30	0	2022-08-30
1313	336	3		165	1	4.49	740,85	740,85	165	0	0	5	2	2022-08-30	0	2022-08-30
1314	456	3		165	1	5.07	836,55	836,55	165	-0	0	5	2	2022-08-30	0	2022-08-30
1315	576	3		165	1	5.53	912,45	912,45	165	0	0	5	2	2022-08-30	0	2022-08-30
1316	696	3		165	1	5.78	953,7	953,7	165	0	0	5	2	2022-08-30	0	2022-08-30
1317	7	3		33	1	4.38	144,54	144,54	33	0	0	5	2	2022-08-30	0	2022-08-30
1318	127	3		33	1	4.38	144,54	144,54	33	0	0	5	2	2022-08-30	0	2022-08-30
1319	247	3		165	1	4.49	740,85	740,85	165	0	0	5	2	2022-08-30	0	2022-08-30
1320	71	3		44	1	4.38	192,72	192,72	44	0	0	5	2	2022-08-30	0	2022-08-30
1321	191	3		44	1	4.38	192,72	192,72	44	0	0	5	2	2022-08-30	0	2022-08-30
1322	311	3		220	1	4.49	987,8	987,8	220	-0	0	5	2	2022-08-30	0	2022-08-30
1323	431	3		220	1	5.07	1.115,4	1.115,4	220	0	0	5	2	2022-08-30	0	2022-08-30
1324	551	3		220	1	5.53	1.216,6	1.216,6	220	-0	0	5	2	2022-08-30	0	2022-08-30
1325	671	3		220	1	5.78	1.271,6	1.271,6	220	-0	0	5	2	2022-08-30	0	2022-08-30
1326	345	3		115	1	4.49	516,35	516,35	115	0	0	5	2	2022-08-30	0	2022-08-30
1327	465	3		115	1	5.07	583,05	583,05	115	-0	0	5	2	2022-08-30	0	2022-08-30
1328	585	3		115	1	5.53	635,95	635,95	115	0	0	5	2	2022-08-30	0	2022-08-30
1329	705	3		115	1	5.78	664,7	664,7	115	0	0	5	2	2022-08-30	0	2022-08-30
1330	825	3		115	1	5.97	686,55	686,55	115	0	0	5	2	2022-08-30	0	2022-08-30
1333	600	3		125	1	5.45	681,25	681,25	125	0	0	5	2	2022-08-30	0	2022-08-30
1334	461	3		315	1	5.15	1.622,25	1.622,25	315	0	0	5	2	2022-08-30	0	2022-08-30
1335	581	3		315	1	5.57	1.754,55	1.754,55	315	-0	0	5	2	2022-08-30	0	2022-08-30
1336	701	3		315	1	5.57	1.754,55	1.754,55	315	-0	0	5	2	2022-08-30	0	2022-08-30
1337	438	3		300	1	5.07	1.521	1.521	300	0	0	5	2	2022-08-30	0	2022-08-30
1338	558	3		300	1	5.53	1.659	1.659	300	0	0	5	2	2022-08-30	0	2022-08-30
1339	678	3		300	1	5.78	1.734	1.734	300	0	0	5	2	2022-08-30	0	2022-08-30
1340	490	3		220	1	5.53	1.216,6	1.216,6	220	-0	0	5	2	2022-08-30	0	2022-08-30
1341	610	3		220	1	5.78	1.271,6	1.271,6	220	-0	0	5	2	2022-08-30	0	2022-08-30
1342	503	3		360	1	5.53	1.990,8	1.990,8	360	-0	0	5	2	2022-08-30	0	2022-08-30
1343	623	3		360	1	5.78	2.080,8	2.080,8	360	0	0	5	2	2022-08-30	0	2022-08-30
1344	601	3		250	1	5.78	1.445	1.445	250	0	0	5	2	2022-08-30	0	2022-08-30
1346	185	3		47	1	4.38	205,86	205,86	47	0	0	5	2	2022-08-30	0	2022-08-30
1348	425	3		235	1	5.07	1.191,45	1.191,45	235	0	0	5	2	2022-08-30	0	2022-08-30
1349	545	3		235	1	5.53	1.299,55	1.299,55	235	0	0	5	2	2022-08-30	0	2022-08-30
1350	665	3		235	1	5.78	1.358,3	1.358,3	235	0	0	5	2	2022-08-30	0	2022-08-30
1351	785	3		235	1	5.79	1.360,65	1.360,65	235	0	0	5	2	2022-08-30	0	2022-08-30
1359	302	3		240	1	4.49	1.077,6	1.077,6	240	-0	0	5	2	2022-08-30	0	2022-08-30
1360	422	3		240	1	5.07	1.216,8	1.216,8	240	-0	0	5	2	2022-08-30	0	2022-08-30
1366	707	3		240	1	5.78	1.387,2	1.387,2	240	0	0	5	2	2022-08-30	0	2022-08-30
1367	827	3		240	1	5.78	1.387,2	1.387,2	240	0	0	5	2	2022-08-30	0	2022-08-30
1368	352	3		70	1	4.49	314,3	314,3	70	0	0	5	2	2022-08-30	0	2022-08-30
1369	472	3		70	1	5.07	354,9	354,9	70	-0	0	5	2	2022-08-30	0	2022-08-30
1370	592	3		70	1	5.53	387,1	387,1	70	0	0	5	2	2022-08-30	0	2022-08-30
1371	445	3		120	1	5.07	608,4	608,4	120	-0	0	5	2	2022-08-30	0	2022-08-30
1374	33	3		35	1	7.85	274,75	274,75	35	0	0	1	2	2022-08-31	0	2022-08-31
1375	153	3		35	1	7.85	274,75	274,75	35	0	0	1	2	2022-08-31	0	2022-08-31
1376	273	3		175	1	7.85	1.373,75	1.373,75	175	0	0	1	2	2022-08-31	0	2022-08-31
1377	271	3		165	1	7.85	1.295,25	1.295,25	165	0	0	1	2	2022-08-31	0	2022-08-31
1378	391	3		165	1	7.85	1.295,25	1.295,25	165	0	0	1	2	2022-08-31	0	2022-08-31
1379	511	3		165	1	7.85	1.295,25	1.295,25	165	0	0	1	2	2022-08-31	0	2022-08-31
1380	631	3		165	1	7.85	1.295,25	1.295,25	165	0	0	1	2	2022-08-31	0	2022-08-31
1381	751	3		165	1	7.85	1.295,25	1.295,25	165	0	0	1	2	2022-08-31	0	2022-08-31
1382	743	3		360	1	7.81	2.811,6	2.811,6	360	0	0	1	2	2022-09-01	0	2022-09-01
1383	828	3		165	1	8.20	1.353	1.353	165	0	0	1	2	2022-09-01	0	2022-09-01
1384	775	3		165	1	7.89	1.301,85	1.301,85	165	0	0	1	2	2022-09-01	0	2022-09-01
1385	806	3		240	1	7.89	1.893,6	1.893,6	240	0	0	1	2	2022-09-01	0	2022-09-01
1386	750	3		215	1	7.89	1.696,35	1.696,35	215	0	0	1	2	2022-09-01	0	2022-09-01
1387	763	3		205	1	7.89	1.617,45	1.617,45	205	0	0	1	2	2022-09-01	0	2022-09-01
1388	845	3		235	1	5.77	1.355,95	1.355,95	235	0	0	1	2	2022-09-02	0	2022-09-02
1389	448	3		165	1	7.85	1.295,25	1.295,25	165	0	0	1	2	2022-09-02	0	2022-09-02
1504	773	6		180	1	5.77	1.038,6	1.038,6	180	0	0	1	2	2022-09-01	0	2022-09-01
1505	896	6		180	1	5.77	1.038,6	1.038,6	180	0	0	1	2	2022-09-01	0	2022-09-01
439	439	0		0	1	5.77	0	0	0	28.6	140	1	0	2022-05-01	\N	\N
319	319	0		0	1	5.77	0	0	0	28.6	140	1	0	2022-04-01	\N	\N
79	79	0		0	1	5.77	0	0	0	5.72	28	1	0	2022-02-01	\N	\N
199	199	0		0	1	5.77	0	0	0	5.72	28	1	0	2022-03-01	\N	\N
557	557	0		0	1	5.77	0	0	0	17.33	95	1	0	2022-06-01	\N	\N
677	677	0		0	1	5.77	0	0	0	17.33	95	1	0	2022-07-01	\N	\N
797	797	0		0	1	5.77	0	0	0	17.33	95	1	0	2022-08-01	\N	\N
1463	919	0		0	1	5.77	0	0	0	17.33	95	1	0	2022-09-01	\N	\N
115	115	0		0	1	5.77	0	0	0	6.24	30	1	0	2022-02-01	\N	\N
475	475	0		0	1	5.77	0	0	0	31.2	150	1	0	2022-05-01	\N	\N
1506	798	3		300	1	7.91	2.373	23,73	300	0	0	5	2	2022-09-05	0	2022-09-05
1507	920	3		300	1	7.91	2.373	2.373	300	0	0	5	2	2022-09-05	0	2022-09-05
1590	5	0		0	1	5.77	0	0	0	40.73	235	1	0	2022-09-11	\N	\N
1591	5	3		47	1	4.38	205.86	205.86	47	0	0	1	2	2022-09-11	0	2022-09-12
1592	744	3		140	1	8	1.120	1.120	140	0	0	5	2	2022-09-12	0	2022-09-12
1593	769	3		165	1	7.98	1.316,7	1.316,7	165	0	0	5	2	2022-09-12	0	2022-09-12
1762	1048	0		0	1	5.77	0	0	0	40.73	235	1	0	2022-10-01	\N	\N
1594	816	3		165	1	7.98	1.316,7	1.316,7	165	0	0	5	2	2022-09-12	0	2022-09-12
1595	668	3		235	1	7.99	1.877,65	1.877,65	235	0	0	5	2	2022-09-12	0	2022-09-12
1596	788	3		235	1	7.99	1.877,65	1.877,65	235	0	0	5	2	2022-09-12	0	2022-09-12
1598	882	0		0	1	5.77	0	0	0	34.66	200	5	0	2022-09-12	\N	\N
1599	882	2	95733542	200	1	7.94	1.588	1.588	200	0	0	5	2	2022-09-12	5	2022-09-06
1600	466	2	92953105	315	1	7.98	2.513,7	2.513,7	315	-0	0	5	2	2022-09-12	5	2022-09-12
1601	586	2	92953105	315	1	7.98	2.513,7	2.513,7	315	-0	0	5	2	2022-09-12	5	2022-09-12
1602	706	2	92953105	315	1	5.98	1.883,7	1.883,7	315	0	0	5	2	2022-09-12	5	2022-09-12
1603	282	1	12533483212	225	1	5.77	1.298,25	1.298,25	225	0	0	5	2	2022-09-12	10	2022-04-24
1604	883	1	22527800618	100	1	8	800	800	100	0	0	5	2	2022-09-12	10	2022-09-09
1605	48	6		33	1	4.38	144,54	190,41	33	0	0	5	2	2022-09-12	0	2022-09-12
1606	168	6		33	1	4.38	144,54	144,54	33	0	0	5	2	2022-09-12	0	2022-09-12
1607	288	1	12551765736	165	1	3.918181	646,5	646,5	165	0	0	5	2	2022-09-12	10	2022-05-22
1608	408	1	12551765736	165	1	3.918181	646,5	646,5	165	0	0	5	2	2022-09-12	10	2022-05-22
1609	44	6		35	1	4.38	153,3	153,3	35	0	0	5	2	2022-09-12	0	2022-09-12
1610	70	3		55	1	4.38	240,9	240,9	55	0	0	5	2	2022-09-12	0	2022-09-12
1611	190	3		55	1	4.38	240,9	240,9	55	0	0	5	2	2022-09-12	0	2022-09-12
1612	310	3		275	1	5.77	1.586,75	1.586,75	275	0	0	5	2	2022-09-12	0	2022-09-12
1613	430	3		275	1	5.77	1.586,75	1.586,75	275	0	0	5	2	2022-09-12	0	2022-09-12
1614	550	3		275	1	5.53	1.520,75	1.520,75	275	0	0	5	2	2022-09-12	0	2022-09-12
1615	873	3		215	1	7.98	1.715,7	1.715,7	215	0	0	5	2	2022-09-13	0	2022-09-13
1616	489	0		0	1	5.77	0	0	0	28.6	165	5	0	2022-09-13	\N	\N
1617	489	1	90776897	165	1	5.80	957	957	165	0	0	5	2	2022-09-13	5	2022-08-03
1618	14	0		0	1	5.77	0	0	58	50.26	58	5	0	2022-09-13	\N	\N
1619	68	0		0	1	5.77	0	0	0	40.73	47	5	0	2022-09-13	\N	\N
1620	14	3		58	1	4.38	254,04	254,04	58	0	0	5	2	2022-09-13	0	2022-09-13
1621	68	3		47	1	4.38	205,86	205,86	47	0	0	5	2	2022-09-13	0	2022-09-13
1622	479	3		75	1	8.03	602,25	602,25	75	0	0	5	2	2022-09-16	0	2022-09-16
1623	599	3		75	1	8.03	602,25	602,25	75	0	0	5	2	2022-09-16	0	2022-09-16
1624	719	3		75	1	8.03	602,25	602,25	75	0	0	5	2	2022-09-16	0	2022-09-16
1625	839	3		75	1	8.03	602,25	602,25	75	0	0	5	2	2022-09-16	0	2022-09-16
1626	958	3		75	1	8.03	602,25	602,25	75	0	0	5	2	2022-09-16	0	2022-09-16
1627	642	3		225	1	8.03	1.806,75	1.806,75	225	0	0	5	2	2022-09-16	0	2022-09-16
1628	714	3		250	1	8.03	2.007,5	2.007,5	250	0	0	5	2	2022-09-16	0	2022-09-16
1629	834	3		250	1	8.03	2.007,5	2.007,5	250	0	0	5	2	2022-09-16	0	2022-09-16
1630	720	3		125	1	8.03	1.003,75	1.003,75	125	0	0	5	2	2022-09-16	0	2022-09-16
1631	840	3		125	1	8.03	1.003,75	1.003,75	125	0	0	5	2	2022-09-16	0	2022-09-16
1632	807	3		170	1	8.03	1.365,1	1.365,1	170	0	0	5	2	2022-09-16	0	2022-09-16
1633	568	3		165	1	5.77	952,05	952,05	165	0	0	1	2	2022-09-17	0	2022-09-17
1634	911	3		175	1	5.77	1.009,75	1.009,75	175	0	0	1	2	2022-09-17	0	2022-09-17
1635	951	3		70	1	5.77	403,9	403,9	70	0	0	1	2	2022-09-20	0	2022-09-20
1636	754	3		360	1	5.77	2.077,2	2.077,2	360	0	0	1	2	2022-09-21	0	2022-09-21
1637	877	3		360	1	5.77	2.077,2	2.077,2	360	0	0	1	2	2022-09-21	0	2022-09-21
1638	888	3		100	1	5.77	577	577	100	0	0	1	2	2022-09-22	0	2022-09-22
1639	933	3		165	1	5.77	952,05	952,05	165	0	0	1	2	2022-09-22	0	2022-09-22
1640	948	3		300	1	5.77	1.731	1.731	300	0	0	1	2	2022-09-22	0	2022-09-22
1641	890	3		120	1	5.77	692,4	692,4	120	0	0	1	2	2022-09-22	0	2022-09-22
1642	652	3		165	1	5.77	952,05	952,05	165	0	0	1	2	2022-09-22	0	2022-09-22
1643	776	3		350	1	5.77	2.019,5	2.019,5	350	0	0	1	2	2022-09-23	0	2022-09-23
1644	730	3		220	1	5.77	1.269,4	1.269,4	220	0	0	1	2	2022-09-23	0	2022-09-23
1645	791	3		220	1	5.77	1.269,4	1.269,4	220	0	0	1	2	2022-09-23	0	2022-09-23
1646	913	3		220	1	5.77	1.269,4	1.269,4	220	0	0	1	2	2022-09-23	0	2022-09-23
1647	919	3		95	1	5.77	548,15	548,15	95	0	0	1	2	2022-09-26	0	2022-09-26
1648	867	3		140	1	5.77	807,8	807,8	140	0	0	1	2	2022-09-27	0	2022-09-27
1649	818	3		170	1	5.77	980,9	980,9	170	0	0	1	2	2022-09-27	0	2022-09-27
1650	564	3		440	1	5.77	2.538,8	2.538,8	440	0	0	1	2	2022-09-28	0	2022-09-28
1651	684	3		440	1	5.77	2.538,8	2.538,8	440	0	0	1	2	2022-09-28	0	2022-09-28
1652	804	3		440	1	5.77	2.538,8	2.538,8	440	0	0	1	2	2022-09-28	0	2022-09-28
1653	926	3		440	1	5.77	2.538,8	2.538,8	440	0	0	1	2	2022-09-28	0	2022-09-28
1654	542	3		240	1	5.77	1.384,8	1.384,8	240	0	0	1	2	2022-09-28	0	2022-09-28
1655	662	3		240	1	5.77	1.384,8	1.384,8	240	0	0	1	2	2022-09-28	0	2022-09-28
1656	782	3		240	1	5.77	1.384,8	1.384,8	240	0	0	1	2	2022-09-28	0	2022-09-28
1657	905	3		240	1	5.77	1.384,8	1.384,8	240	0	0	1	2	2022-09-28	0	2022-09-28
1658	774	3		300	1	5.77	1.731	1.731	300	0	0	1	2	2022-09-28	0	2022-09-28
1659	897	3		300	1	5.77	1.731	1.731	300	0	0	1	2	2022-09-28	0	2022-09-28
1660	660	3		260	1	5.77	1.500,2	1.500,2	260	0	0	1	2	2022-09-28	0	2022-09-28
1661	809	3		235	1	5.77	1.355,95	1.355,95	235	0	0	1	2	2022-09-28	0	2022-09-28
1662	931	3		235	1	5.77	1.355,95	1.355,95	235	0	0	1	2	2022-09-28	0	2022-09-28
1748	1034	0		0	1	5.77	0	0	0	54.59	315	1	0	2022-10-01	\N	\N
1663	632	2	91254703	165	1	5.77	952,05	952,05	165	0	0	1	2	2022-09-28	28	2022-07-14
1664	823	1	12606729953	270	1	6.2777	1.694,98	1.694,98	270	0	0	1	2	2022-09-28	10	2022-08-24
1665	815	3		120	1	5.77	692,4	692,4	120	0	0	1	2	2022-09-28	0	2022-09-28
1666	935	3		120	1	5.77	692,4	692,4	120	0	0	1	2	2022-09-28	0	2022-09-28
1667	602	3		165	1	5.77	952,05	952,05	165	0	0	1	2	2022-09-29	0	2022-09-29
1668	722	3		165	1	5.77	952,05	952,05	165	0	0	1	2	2022-09-29	0	2022-09-29
1669	979	3		165	1	5.77	952,05	952,05	165	0	0	1	2	2022-09-29	0	2022-09-29
1670	725	3		235	1	5.77	1.355,95	1.355,95	235	0	0	1	2	2022-09-30	0	2022-09-30
1671	848	3		235	1	5.77	1.355,95	1.355,95	235	0	0	1	2	2022-09-30	0	2022-09-30
1672	786	3		180	1	5.77	1.038,6	1.038,6	180	0	0	1	2	2022-09-30	0	2022-09-30
1673	908	3		180	1	5.77	1.038,6	1.038,6	180	0	0	1	2	2022-09-30	0	2022-09-30
1674	820	3		180	1	5.77	1.038,6	1.038,6	180	0	0	1	2	2022-09-30	0	2022-09-30
1675	940	3		180	1	5.77	1.038,6	1.038,6	180	0	0	1	2	2022-09-30	0	2022-09-30
1676	11	3		11	1	5.77	63,47	63,47	11	0	0	1	2	2022-09-30	0	2022-09-30
1677	131	3		11	1	5.77	63,47	63,47	11	0	0	1	2	2022-09-30	0	2022-09-30
1678	251	3		55	1	5.77	317,35	317,35	55	0	0	1	2	2022-09-30	0	2022-09-30
1679	371	3		55	1	5.77	317,35	317,35	55	0	0	1	2	2022-09-30	0	2022-09-30
1680	491	3		55	1	5.77	317,35	317,35	55	0	0	1	2	2022-09-30	0	2022-09-30
1681	611	3		55	1	5.77	317,35	317,35	55	0	0	1	2	2022-09-30	0	2022-09-30
1682	731	3		55	1	5.77	317,35	317,35	55	0	0	1	2	2022-09-30	0	2022-09-30
1683	854	3		55	1	5.77	317,35	317,35	55	0	0	1	2	2022-09-30	0	2022-09-30
1684	498	3		165	1	5.77	952,05	952,05	165	0	0	1	2	2022-09-30	0	2022-09-30
1685	618	3		165	1	5.77	952,05	952,05	165	0	0	1	2	2022-09-30	0	2022-09-30
1686	738	3		165	1	5.77	952,05	952,05	165	0	0	1	2	2022-09-30	0	2022-09-30
1687	861	3		165	1	5.77	952,05	952,05	165	0	0	1	2	2022-09-30	0	2022-09-30
1688	824	3		200	1	5.77	1.154	1.154	200	0	0	1	2	2022-09-30	0	2022-09-30
1689	943	3		200	1	5.77	1.154	1.154	200	0	0	1	2	2022-09-30	0	2022-09-30
1690	822	3		310	1	5.77	1.788,7	1.788,7	310	0	0	1	2	2022-09-30	0	2022-09-30
1691	941	3		310	1	5.77	1.788,7	1.788,7	310	0	0	1	2	2022-09-30	0	2022-09-30
1692	904	3		235	1	5.77	1.355,95	1.355,95	235	0	0	1	2	2022-09-30	0	2022-09-30
1693	851	3		220	1	5.77	1.269,4	1.269,4	220	0	0	1	2	2022-09-30	0	2022-09-30
1694	980	3		165	1	8.05	1.328,25	1.328,25	165	-0	0	1	2	2022-09-30	0	2022-09-30
1695	981	0		0	1	5.77	0	0	0	43.33	250	1	0	2022-10-01	\N	\N
1696	982	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-10-01	\N	\N
1697	983	0		0	1	5.77	0	0	0	40.73	235	1	0	2022-10-01	\N	\N
1698	984	0		0	1	5.77	0	0	0	36.4	210	1	0	2022-10-01	\N	\N
1699	985	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-10-01	\N	\N
1700	986	0		0	1	5.77	0	0	0	38.13	220	1	0	2022-10-01	\N	\N
1701	987	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-10-01	\N	\N
1702	988	0		0	1	5.77	0	0	0	38.13	220	1	0	2022-10-01	\N	\N
1703	989	0		0	1	5.77	0	0	0	9.53	55	1	0	2022-10-01	\N	\N
1704	990	0		0	1	5.77	0	0	0	12.13	70	1	0	2022-10-01	\N	\N
1706	992	0		0	1	5.77	0	0	0	50.26	290	1	0	2022-10-01	\N	\N
1707	993	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-10-01	\N	\N
1708	994	0		0	1	5.77	0	0	0	19.93	115	1	0	2022-10-01	\N	\N
1709	995	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-10-01	\N	\N
1710	996	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-10-01	\N	\N
1711	997	0		0	1	5.77	0	0	0	19.06	110	1	0	2022-10-01	\N	\N
1712	998	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-10-01	\N	\N
1713	999	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-10-01	\N	\N
1715	1001	0		0	1	5.77	0	0	0	62.39	360	1	0	2022-10-01	\N	\N
1716	1002	0		0	1	5.77	0	0	0	24.26	140	1	0	2022-10-01	\N	\N
1717	1003	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-10-01	\N	\N
1718	1004	0		0	1	5.77	0	0	0	37.26	215	1	0	2022-10-01	\N	\N
1719	1005	0		0	1	5.77	0	0	0	47.66	275	1	0	2022-10-01	\N	\N
1720	1006	0		0	1	5.77	0	0	0	63.26	365	1	0	2022-10-01	\N	\N
1721	1007	0		0	1	5.77	0	0	0	32.06	185	1	0	2022-10-01	\N	\N
1722	1008	0		0	1	5.77	0	0	0	37.26	215	1	0	2022-10-01	\N	\N
1723	1009	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-10-01	\N	\N
1724	1010	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-10-01	\N	\N
1725	1011	0		0	1	5.77	0	0	0	30.33	175	1	0	2022-10-01	\N	\N
1726	1012	0		0	1	5.77	0	0	0	62.39	360	1	0	2022-10-01	\N	\N
1727	1013	0		0	1	5.77	0	0	0	30.33	175	1	0	2022-10-01	\N	\N
1728	1014	0		0	1	5.77	0	0	0	38.99	225	1	0	2022-10-01	\N	\N
1729	1015	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-10-01	\N	\N
1730	1016	0		0	1	5.77	0	0	0	99.65	575	1	0	2022-10-01	\N	\N
1731	1017	0		0	1	5.77	0	0	0	34.66	200	1	0	2022-10-01	\N	\N
1732	1018	0		0	1	5.77	0	0	0	17.33	100	1	0	2022-10-01	\N	\N
1733	1019	0		0	1	5.77	0	0	0	69.32	400	1	0	2022-10-01	\N	\N
1734	1020	0		0	1	5.77	0	0	0	38.99	225	1	0	2022-10-01	\N	\N
1736	1022	0		0	1	5.77	0	0	0	30.33	175	1	0	2022-10-01	\N	\N
1737	1023	0		0	1	5.77	0	0	0	17.33	100	1	0	2022-10-01	\N	\N
1738	1024	0		0	1	5.77	0	0	0	20.8	120	1	0	2022-10-01	\N	\N
1739	1025	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-10-01	\N	\N
1740	1026	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-10-01	\N	\N
1741	1027	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-10-01	\N	\N
1742	1028	0		0	1	5.77	0	0	0	21.66	125	1	0	2022-10-01	\N	\N
1743	1029	0		0	1	5.77	0	0	0	31.2	180	1	0	2022-10-01	\N	\N
1744	1030	0		0	1	5.77	0	0	0	51.99	300	1	0	2022-10-01	\N	\N
1745	1031	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-10-01	\N	\N
1746	1032	0		0	1	5.77	0	0	0	60.66	350	1	0	2022-10-01	\N	\N
1747	1033	0		0	1	5.77	0	0	0	31.2	180	1	0	2022-10-01	\N	\N
1749	1035	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-10-01	\N	\N
1750	1036	0		0	1	5.77	0	0	0	45.06	260	1	0	2022-10-01	\N	\N
1751	1037	0		0	1	5.77	0	0	0	40.73	235	1	0	2022-10-01	\N	\N
1752	1038	0		0	1	5.77	0	0	0	41.59	240	1	0	2022-10-01	\N	\N
1753	1039	0		0	1	5.77	0	0	0	36.4	210	1	0	2022-10-01	\N	\N
1754	1040	0		0	1	5.77	0	0	0	36.4	210	1	0	2022-10-01	\N	\N
1755	1041	0		0	1	5.77	0	0	0	40.73	235	1	0	2022-10-01	\N	\N
1756	1042	0		0	1	5.77	0	0	0	31.2	180	1	0	2022-10-01	\N	\N
1757	1043	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-10-01	\N	\N
1758	1044	0		0	1	5.77	0	0	0	40.73	235	1	0	2022-10-01	\N	\N
1759	1045	0		0	1	5.77	0	0	0	30.33	175	1	0	2022-10-01	\N	\N
1760	1046	0		0	1	5.77	0	0	0	47.66	275	1	0	2022-10-01	\N	\N
1761	1047	0		0	1	5.77	0	0	0	38.13	220	1	0	2022-10-01	\N	\N
1763	1049	0		0	1	5.77	0	0	0	73.66	425	1	0	2022-10-01	\N	\N
1764	1050	0		0	1	5.77	0	0	0	53.73	310	1	0	2022-10-01	\N	\N
1765	1051	0		0	1	5.77	0	0	0	70.19	405	1	0	2022-10-01	\N	\N
1766	1052	0		0	1	5.77	0	0	0	31.2	180	1	0	2022-10-01	\N	\N
1767	1053	0		0	1	5.77	0	0	0	16.46	95	1	0	2022-10-01	\N	\N
1768	1054	0		0	1	5.77	0	0	0	51.99	300	1	0	2022-10-01	\N	\N
1769	1055	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-10-01	\N	\N
1770	1056	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-10-01	\N	\N
1771	1057	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-10-01	\N	\N
1772	1058	0		0	1	5.77	0	0	0	50.26	290	1	0	2022-10-01	\N	\N
1773	1059	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-10-01	\N	\N
1774	1060	0		0	1	5.77	0	0	0	76.26	440	1	0	2022-10-01	\N	\N
1775	1061	0		0	1	5.77	0	0	0	20.8	120	1	0	2022-10-01	\N	\N
1776	1062	0		0	1	5.77	0	0	0	41.59	240	1	0	2022-10-01	\N	\N
1777	1063	0		0	1	5.77	0	0	0	29.46	170	1	0	2022-10-01	\N	\N
1778	1064	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-10-01	\N	\N
1779	1065	0		0	1	5.77	0	0	0	40.73	235	1	0	2022-10-01	\N	\N
1780	1066	0		0	1	5.77	0	0	0	50.26	290	1	0	2022-10-01	\N	\N
1781	1067	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-10-01	\N	\N
1782	1068	0		0	1	5.77	0	0	0	30.33	175	1	0	2022-10-01	\N	\N
1783	1069	0		0	1	5.77	0	0	0	20.8	120	1	0	2022-10-01	\N	\N
1784	1070	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-10-01	\N	\N
1785	1071	0		0	1	5.77	0	0	0	37.26	215	1	0	2022-10-01	\N	\N
1786	1072	0		0	1	5.77	0	0	0	29.46	170	1	0	2022-10-01	\N	\N
1787	1073	0		0	1	5.77	0	0	0	54.59	315	1	0	2022-10-01	\N	\N
1788	1074	0		0	1	5.77	0	0	0	31.2	180	1	0	2022-10-01	\N	\N
1789	1075	0		0	1	5.77	0	0	0	54.59	315	1	0	2022-10-01	\N	\N
1790	1076	0		0	1	5.77	0	0	0	53.73	310	1	0	2022-10-01	\N	\N
1791	1077	0		0	1	5.77	0	0	0	46.79	270	1	0	2022-10-01	\N	\N
1792	1078	0		0	1	5.77	0	0	0	34.66	200	1	0	2022-10-01	\N	\N
1793	1079	0		0	1	5.77	0	0	0	19.93	115	1	0	2022-10-01	\N	\N
1795	1081	0		0	1	5.77	0	0	0	41.59	240	1	0	2022-10-01	\N	\N
1796	1082	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-10-01	\N	\N
1797	1083	0		0	1	5.77	0	0	0	51.99	300	1	0	2022-10-01	\N	\N
1798	1084	0		0	1	5.77	0	0	0	39.86	230	1	0	2022-10-01	\N	\N
1799	1085	0		0	1	5.77	0	0	0	45.93	265	1	0	2022-10-01	\N	\N
1800	1086	0		0	1	5.77	0	0	0	12.13	70	1	0	2022-10-01	\N	\N
1801	1087	0		0	1	5.77	0	0	0	34.66	200	1	0	2022-10-01	\N	\N
1802	1088	0		0	1	5.77	0	0	0	43.33	250	1	0	2022-10-01	\N	\N
1803	1089	0		0	1	5.77	0	0	0	26	150	1	0	2022-10-01	\N	\N
1804	1090	0		0	1	5.77	0	0	0	30.33	175	1	0	2022-10-01	\N	\N
1805	1091	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-10-01	\N	\N
1806	1092	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-10-01	\N	\N
1807	1093	0		0	1	5.77	0	0	0	13	75	1	0	2022-10-01	\N	\N
1808	1094	0		0	1	5.77	0	0	0	21.66	125	1	0	2022-10-01	\N	\N
1809	1095	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-10-01	\N	\N
1810	864	3		165	1	5.77	952,05	952,05	165	0	0	1	2	2022-10-01	0	2022-10-01
1811	950	3		265	1	5.77	1.529,05	1.529,05	265	0	0	1	2	2022-10-01	0	2022-10-01
1812	932	3		290	1	5.77	1.673,3	1.673,3	290	0	0	1	2	2022-10-01	0	2022-10-01
1813	857	3		290	1	5.77	1.673,3	1.673,3	290	0	0	1	2	2022-10-01	0	2022-10-01
1815	697	3		215	1	5.77	1.240,55	1.240,55	215	0	0	1	2	2022-10-01	0	2022-10-01
1816	817	3		215	1	5.77	1.240,55	1.240,55	215	0	0	1	2	2022-10-01	0	2022-10-01
1817	937	3		215	1	5.77	1.240,55	1.240,55	215	0	0	1	2	2022-10-01	0	2022-10-01
1818	1071	3		215	1	5.77	1.240,55	1.240,55	215	0	0	1	2	2022-10-01	0	2022-10-01
1819	947	3		165	1	5.77	952,05	952,05	165	0	0	1	2	2022-10-01	0	2022-10-01
1820	762	3		225	1	5.77	1.298,25	1.298,25	225	0	0	1	2	2022-10-02	0	2022-10-02
1821	885	3		225	1	5.77	1.298,25	1.298,25	225	0	0	1	2	2022-10-02	0	2022-10-02
1822	742	3		210	1	5.77	1.211,7	1.211,7	210	0	0	1	2	2022-10-02	0	2022-10-02
1823	802	3		290	1	5.77	1.673,3	1.673,3	290	0	0	1	2	2022-10-02	0	2022-10-02
1824	924	3		290	1	5.77	1.673,3	1.673,3	290	0	0	1	2	2022-10-02	0	2022-10-02
1825	1081	3		240	1	5.77	1.384,8	1.384,8	240	0	0	1	2	2022-10-03	0	2022-10-03
1826	1041	3		235	1	5.77	1.355,95	1.355,95	235	0	0	1	2	2022-10-03	0	2022-10-03
1827	1083	3		300	1	5.77	1.731	1.731	300	0	0	1	2	2022-10-03	0	2022-10-03
1828	1067	3		165	1	5.77	952,05	952,05	165	0	0	1	2	2022-10-03	0	2022-10-03
1829	1023	3		100	1	5.77	577	577	100	0	0	1	2	2022-10-03	0	2022-10-03
1830	795	3		405	1	5.77	2.336,85	2.336,85	405	0	0	1	2	2022-10-03	0	2022-10-03
1831	917	3		405	1	5.77	2.336,85	2.336,85	405	0	0	1	2	2022-10-03	0	2022-10-03
1832	793	3		425	1	5.77	2.452,25	2.452,25	425	0	0	1	2	2022-10-03	0	2022-10-03
1833	915	3		425	1	5.77	2.452,25	2.452,25	425	0	0	1	2	2022-10-03	0	2022-10-03
2007	1180	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-11-01	\N	\N
1834	946	1	1038088476	240	1	8.020	1.924,8	1.924,8	240	0	0	1	2	2022-10-03	24	2022-09-20
1835	528	3		165	1	5.77	952,05	952,05	165	0	0	1	2	2022-10-04	0	2022-10-04
1836	648	3		165	1	5.77	952,05	952,05	165	0	0	1	2	2022-10-04	0	2022-10-04
1837	768	3		165	1	5.77	952,05	952,05	165	0	0	1	2	2022-10-04	0	2022-10-04
1838	891	3		165	1	5.77	952,05	952,05	165	0	0	1	2	2022-10-04	0	2022-10-04
1839	1025	3		165	1	5.77	952,05	952,05	165	0	0	1	2	2022-10-04	0	2022-10-04
1842	1096	0		0	1	5.77	0	0	0	54.59	315	1	0	2022-10-04	\N	\N
1843	862	3		110	1	5.77	634,7	634,7	110	0	0	1	2	2022-10-04	0	2022-10-04
1845	544	3		210	1	5.77	1.211,7	1.211,7	210	0	0	1	2	2022-10-04	0	2022-10-04
1846	664	3		210	1	5.77	1.211,7	1.211,7	210	0	0	1	2	2022-10-04	0	2022-10-04
1847	1017	2	134955264	200	1	5.77	1.154	1.154	200	0	0	1	2	2022-10-04	28	2022-10-04
1848	1098	0		0	1	5.77	0	0	0	10.4	60	1	0	2022-10-05	\N	\N
1850	745	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-10-05	\N	\N
1851	745	1	126134224366	165	1	5.77	952,05	952,05	165	0	0	1	2	2022-10-05	10	2022-10-06
1852	868	3		165	1	5.77	952,05	952,05	165	0	0	1	2	2022-10-05	0	2022-10-05
1853	869	2	414281	215	1	5.77	1.240,55	1.240,55	215	0	0	1	2	2022-10-05	28	2022-09-29
1854	1098	2	134955253	60	1	5.77	346,2	346,2	60	0	0	1	2	2022-10-05	28	2022-10-04
1855	688	3		165	1	5.77	952,05	952,05	165	0	0	1	2	2022-10-07	0	2022-10-07
1856	808	3		165	1	5.77	952,05	952,05	165	0	0	1	2	2022-10-07	0	2022-10-07
1857	902	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-10-07	\N	\N
1858	902	1	173816837	165	1	8.1818	1.350	1.350	165	0	0	1	2	2022-10-07	28	2022-09-30
1859	800	3		165	1	5.77	952,05	952,05	165	0	0	1	2	2022-10-07	0	2022-10-07
1860	922	3		165	1	5.77	952,05	952,05	165	0	0	1	2	2022-10-07	0	2022-10-07
1861	957	3		165	1	5.77	952,05	952,05	165	0	0	1	2	2022-10-08	0	2022-10-08
1862	1092	3		165	1	5.77	952,05	952,05	165	0	0	1	2	2022-10-08	0	2022-10-08
1863	1045	3		175	1	5.77	1.009,75	1.009,75	175	0	0	1	2	2022-10-08	0	2022-10-08
1864	635	3		175	1	5.77	1.009,75	1.009,75	175	0	0	1	2	2022-10-08	0	2022-10-08
1865	755	3		175	1	5.77	1.009,75	1.009,75	175	0	0	1	2	2022-10-08	0	2022-10-08
1866	878	3		175	1	5.77	1.009,75	1.009,75	175	0	0	1	2	2022-10-08	0	2022-10-08
1867	780	3		260	1	5.77	1.500,2	1.500,2	260	0	0	1	2	2022-10-09	0	2022-10-09
1870	772	3		165	1	8.20	1.353	952,05	165	0	0	1	2	2022-10-10	0	2022-10-10
1871	898	3		165	1	5.77	952,05	952,05	165	0	0	1	2	2022-10-10	0	2022-10-10
1872	939	3		315	1	5.77	1.817,55	1.817,55	315	0	0	1	2	2022-10-10	0	2022-10-10
1873	1073	3		315	1	8.20	2.583	1.817,55	315	0	0	1	2	2022-10-10	0	2022-10-10
1874	944	3		115	1	8.20	943	943	115	0	0	1	2	2022-10-10	0	2022-10-10
1875	1079	3		115	1	8.20	943	943	115	0	0	1	2	2022-10-10	0	2022-10-10
1876	393	3		175	1	8.20	1.435	1.435	175	0	0	1	2	2022-10-11	0	2022-10-11
1877	513	3		175	1	5.77	1.009,75	1.009,75	175	0	0	1	2	2022-10-11	0	2022-10-11
1878	633	3		175	1	8.20	1.435	1.009,75	175	0	0	1	2	2022-10-11	0	2022-10-11
1879	753	3		175	1	8.20	1.435	1.435	175	0	0	1	2	2022-10-11	0	2022-10-11
1880	41	3		80	1	8.20	656	461,6	80	0	0	1	2	2022-10-11	0	2022-10-11
1881	161	3		80	1	8.20	656	461,6	80	0	0	1	2	2022-10-11	0	2022-10-11
1882	281	3		400	1	8.20	3.280	2.308	400	0	0	1	2	2022-10-11	0	2022-10-11
1883	401	3		400	1	8.20	3.280	3.280	400	0	0	1	2	2022-10-11	0	2022-10-11
1884	521	3		400	1	8.20	3.280	2.308	400	0	0	1	2	2022-10-11	0	2022-10-11
1885	641	3		400	1	8.20	3.280	2.308	400	0	0	1	2	2022-10-11	0	2022-10-11
1886	761	3		400	1	8.20	3.280	3.280	400	0	0	1	2	2022-10-11	0	2022-10-11
1887	884	3		400	1	8.20	3.280	3.280	400	0	0	1	2	2022-10-11	0	2022-10-11
1888	863	3		165	1	8.20	1.353	1.353	165	0	0	1	2	2022-10-12	0	2022-10-12
1889	1008	3		215	1	8.20	1.763	1.240,55	215	0	0	1	2	2022-10-13	0	2022-10-13
1890	858	3		165	1	8.20	1.353	1.353	165	0	0	1	2	2022-10-13	0	2022-10-13
1891	993	3		165	1	8.20	1.353	1.353	165	0	0	1	2	2022-10-13	0	2022-10-13
1892	936	3		165	1	8.20	1.353	1.353	165	0	0	1	2	2022-10-13	0	2022-10-13
1893	929	3		170	1	8.20	1.394	1.394	170	0	0	1	2	2022-10-14	0	2022-10-14
1894	901	3		315	1	8.30	2.614,5	2.614,5	315	0	0	1	2	2022-10-17	0	2022-10-17
1895	934	3		175	1	8.30	1.452,5	1.452,5	175	-0	0	1	2	2022-10-17	0	2022-10-17
1896	997	3		110	1	8.20	902	902	110	0	0	1	2	2022-10-17	0	2022-10-17
1897	942	3		270	1	8.20	2.214	2.214	270	0	0	1	2	2022-10-18	0	2022-10-18
1898	853	3		220	1	8.30	1.826	1.826	220	-0	0	1	2	2022-10-19	0	2022-10-19
1899	988	3		220	1	8.30	1.826	1.826	220	-0	0	1	2	2022-10-19	0	2022-10-19
1900	899	3		350	1	8.30	2.905	2.905	350	-0	0	1	2	2022-10-19	0	2022-10-19
1901	1032	3		350	1	8.30	2.905	2.905	350	-0	0	1	2	2022-10-19	0	2022-10-19
1902	1099	3		165	1	8.20	1.353	1.353	165	0	0	1	2	2022-10-19	0	2022-10-19
1903	866	3		360	1	8.30	2.988	2.988	360	-0	0	1	2	2022-10-20	0	2022-10-20
1904	1001	3		360	1	8.30	2.988	2.988	360	-0	0	1	2	2022-10-20	0	2022-10-20
1905	849	3		210	1	8.30	1.743	1.743	210	-0	0	1	2	2022-10-22	0	2022-10-22
1906	892	3		165	1	5.77	952,05	952,05	165	0	0	1	2	2022-10-22	0	2022-10-22
1907	1024	3		120	1	8.20	984	984	120	0	0	1	2	2022-10-23	0	2022-10-23
1908	1004	3		215	1	8.30	1.784,5	1.784,5	215	-0	0	1	2	2022-10-26	0	2022-10-26
1909	959	3		125	1	8.30	1.037,5	1.037,5	125	0	0	1	2	2022-10-27	0	2022-10-27
1910	1094	3		125	1	8.30	1.037,5	1.037,5	125	0	0	1	2	2022-10-27	0	2022-10-27
1911	1053	3		95	1	8.30	788,5	788,5	95	-0	0	1	2	2022-10-27	0	2022-10-27
1912	1002	3		140	1	8.30	1.162	1.162	140	0	0	1	2	2022-10-28	0	2022-10-28
1913	1052	3		180	1	8.30	1.494	1.494	180	-0	0	1	2	2022-10-28	0	2022-10-28
1914	556	6		180	1	5.77	1.038,6	1.038,6	180	0	0	1	2	2022-10-31	0	2022-10-31
1915	676	6		180	1	5.77	1.038,6	1.038,6	180	0	0	1	2	2022-10-31	0	2022-10-31
1917	796	0		0	1	5.77	0	0	0	31.2	180	1	0	2022-10-31	\N	\N
2008	1181	0		0	1	5.77	0	0	0	76.26	440	1	0	2022-11-01	\N	\N
1918	796	6		180	1	5.77	1.038,6	1.038,6	180	0	0	1	2	2022-10-31	0	2022-10-31
1919	918	6		180	1	5.77	1.038,6	1.038,6	180	0	0	1	2	2022-10-31	0	2022-10-31
1920	876	6		175	1	5.77	1.009,75	1.009,75	175	0	0	1	2	2022-10-31	0	2022-10-31
1921	1011	6		175	1	5.77	1.009,75	1.009,75	175	0	0	1	2	2022-10-31	0	2022-10-31
1922	524	6		175	1	5.77	1.009,75	1.009,75	175	0	0	1	2	2022-10-31	0	2022-10-31
1923	644	6		175	1	5.77	1.009,75	1.009,75	175	0	0	1	2	2022-10-31	0	2022-10-31
1924	764	6		175	1	5.77	1.009,75	1.009,75	175	0	0	1	2	2022-10-31	0	2022-10-31
1925	887	6		175	1	5.77	1.009,75	1.009,75	175	0	0	1	2	2022-10-31	0	2022-10-31
1926	1022	6		175	1	5.77	1.009,75	1.009,75	175	0	0	1	2	2022-10-31	0	2022-10-31
1927	1100	0		0	1	5.77	0	0	0	43.33	250	1	0	2022-11-01	\N	\N
1928	1101	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-11-01	\N	\N
1929	1102	0		0	1	5.77	0	0	0	38.99	225	1	0	2022-11-01	\N	\N
1930	1103	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-11-01	\N	\N
1931	1104	0		0	1	5.77	0	0	0	40.73	235	1	0	2022-11-01	\N	\N
1932	1105	0		0	1	5.77	0	0	0	36.4	210	1	0	2022-11-01	\N	\N
1933	1106	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-11-01	\N	\N
1934	1107	0		0	1	5.77	0	0	0	38.13	220	1	0	2022-11-01	\N	\N
1935	1108	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-11-01	\N	\N
1936	1109	0		0	1	5.77	0	0	0	38.13	220	1	0	2022-11-01	\N	\N
1937	1110	0		0	1	5.77	0	0	0	9.53	55	1	0	2022-11-01	\N	\N
1938	1111	0		0	1	5.77	0	0	0	12.13	70	1	0	2022-11-01	\N	\N
1940	1113	0		0	1	5.77	0	0	0	50.26	290	1	0	2022-11-01	\N	\N
1941	1114	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-11-01	\N	\N
1942	1115	0		0	1	5.77	0	0	0	19.93	115	1	0	2022-11-01	\N	\N
1944	1117	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-11-01	\N	\N
1945	1118	0		0	1	5.77	0	0	0	19.06	110	1	0	2022-11-01	\N	\N
1946	1119	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-11-01	\N	\N
1947	1120	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-11-01	\N	\N
1949	1122	0		0	1	5.77	0	0	0	62.39	360	1	0	2022-11-01	\N	\N
1950	1123	0		0	1	5.77	0	0	0	24.26	140	1	0	2022-11-01	\N	\N
1951	1124	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-11-01	\N	\N
1952	1125	0		0	1	5.77	0	0	0	37.26	215	1	0	2022-11-01	\N	\N
1953	1126	0		0	1	5.77	0	0	0	47.66	275	1	0	2022-11-01	\N	\N
1954	1127	0		0	1	5.77	0	0	0	63.26	365	1	0	2022-11-01	\N	\N
1955	1128	0		0	1	5.77	0	0	0	32.06	185	1	0	2022-11-01	\N	\N
1956	1129	0		0	1	5.77	0	0	0	37.26	215	1	0	2022-11-01	\N	\N
1957	1130	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-11-01	\N	\N
1958	1131	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-11-01	\N	\N
1959	1132	0		0	1	5.77	0	0	0	30.33	175	1	0	2022-11-01	\N	\N
1960	1133	0		0	1	5.77	0	0	0	62.39	360	1	0	2022-11-01	\N	\N
1961	1134	0		0	1	5.77	0	0	0	30.33	175	1	0	2022-11-01	\N	\N
1962	1135	0		0	1	5.77	0	0	0	38.99	225	1	0	2022-11-01	\N	\N
1963	1136	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-11-01	\N	\N
1964	1137	0		0	1	5.77	0	0	0	99.65	575	1	0	2022-11-01	\N	\N
1965	1138	0		0	1	5.77	0	0	0	34.66	200	1	0	2022-11-01	\N	\N
1966	1139	0		0	1	5.77	0	0	0	17.33	100	1	0	2022-11-01	\N	\N
1967	1140	0		0	1	5.77	0	0	0	69.32	400	1	0	2022-11-01	\N	\N
1968	1141	0		0	1	5.77	0	0	0	38.99	225	1	0	2022-11-01	\N	\N
1969	1142	0		0	1	5.77	0	0	0	35.53	205	1	0	2022-11-01	\N	\N
1970	1143	0		0	1	5.77	0	0	0	30.33	175	1	0	2022-11-01	\N	\N
1971	1144	0		0	1	5.77	0	0	0	17.33	100	1	0	2022-11-01	\N	\N
1972	1145	0		0	1	5.77	0	0	0	20.8	120	1	0	2022-11-01	\N	\N
1973	1146	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-11-01	\N	\N
1974	1147	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-11-01	\N	\N
1975	1148	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-11-01	\N	\N
1977	1150	0		0	1	5.77	0	0	0	31.2	180	1	0	2022-11-01	\N	\N
1978	1151	0		0	1	5.77	0	0	0	51.99	300	1	0	2022-11-01	\N	\N
1979	1152	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-11-01	\N	\N
1980	1153	0		0	1	5.77	0	0	0	60.66	350	1	0	2022-11-01	\N	\N
1981	1154	0		0	1	5.77	0	0	0	31.2	180	1	0	2022-11-01	\N	\N
1982	1155	0		0	1	5.77	0	0	0	54.59	315	1	0	2022-11-01	\N	\N
1983	1156	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-11-01	\N	\N
1984	1157	0		0	1	5.77	0	0	0	45.06	260	1	0	2022-11-01	\N	\N
1985	1158	0		0	1	5.77	0	0	0	40.73	235	1	0	2022-11-01	\N	\N
1986	1159	0		0	1	5.77	0	0	0	41.59	240	1	0	2022-11-01	\N	\N
1987	1160	0		0	1	5.77	0	0	0	36.4	210	1	0	2022-11-01	\N	\N
1988	1161	0		0	1	5.77	0	0	0	36.4	210	1	0	2022-11-01	\N	\N
1990	1163	0		0	1	5.77	0	0	0	31.2	180	1	0	2022-11-01	\N	\N
1991	1164	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-11-01	\N	\N
1992	1165	0		0	1	5.77	0	0	0	40.73	235	1	0	2022-11-01	\N	\N
1993	1166	0		0	1	5.77	0	0	0	30.33	175	1	0	2022-11-01	\N	\N
1994	1167	0		0	1	5.77	0	0	0	47.66	275	1	0	2022-11-01	\N	\N
1995	1168	0		0	1	5.77	0	0	0	38.13	220	1	0	2022-11-01	\N	\N
1996	1169	0		0	1	5.77	0	0	0	40.73	235	1	0	2022-11-01	\N	\N
1997	1170	0		0	1	5.77	0	0	0	73.66	425	1	0	2022-11-01	\N	\N
1998	1171	0		0	1	5.77	0	0	0	53.73	310	1	0	2022-11-01	\N	\N
1999	1172	0		0	1	5.77	0	0	0	70.19	405	1	0	2022-11-01	\N	\N
2000	1173	0		0	1	5.77	0	0	0	31.2	180	1	0	2022-11-01	\N	\N
2001	1174	0		0	1	5.77	0	0	0	16.46	95	1	0	2022-11-01	\N	\N
2002	1175	0		0	1	5.77	0	0	0	51.99	300	1	0	2022-11-01	\N	\N
2003	1176	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-11-01	\N	\N
2004	1177	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-11-01	\N	\N
2005	1178	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-11-01	\N	\N
2006	1179	0		0	1	5.77	0	0	0	50.26	290	1	0	2022-11-01	\N	\N
2009	1182	0		0	1	5.77	0	0	0	20.8	120	1	0	2022-11-01	\N	\N
2010	1183	0		0	1	5.77	0	0	0	41.59	240	1	0	2022-11-01	\N	\N
2011	1184	0		0	1	5.77	0	0	0	29.46	170	1	0	2022-11-01	\N	\N
2012	1185	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-11-01	\N	\N
2013	1186	0		0	1	5.77	0	0	0	40.73	235	1	0	2022-11-01	\N	\N
2014	1187	0		0	1	5.77	0	0	0	50.26	290	1	0	2022-11-01	\N	\N
2015	1188	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-11-01	\N	\N
2016	1189	0		0	1	5.77	0	0	0	30.33	175	1	0	2022-11-01	\N	\N
2018	1191	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-11-01	\N	\N
2019	1192	0		0	1	5.77	0	0	0	37.26	215	1	0	2022-11-01	\N	\N
2020	1193	0		0	1	5.77	0	0	0	29.46	170	1	0	2022-11-01	\N	\N
2021	1194	0		0	1	5.77	0	0	0	54.59	315	1	0	2022-11-01	\N	\N
2022	1195	0		0	1	5.77	0	0	0	31.2	180	1	0	2022-11-01	\N	\N
2023	1196	0		0	1	5.77	0	0	0	54.59	315	1	0	2022-11-01	\N	\N
2024	1197	0		0	1	5.77	0	0	0	53.73	310	1	0	2022-11-01	\N	\N
2025	1198	0		0	1	5.77	0	0	0	46.79	270	1	0	2022-11-01	\N	\N
2026	1199	0		0	1	5.77	0	0	0	34.66	200	1	0	2022-11-01	\N	\N
2027	1200	0		0	1	5.77	0	0	0	19.93	115	1	0	2022-11-01	\N	\N
2029	1202	0		0	1	5.77	0	0	0	41.59	240	1	0	2022-11-01	\N	\N
2030	1203	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-11-01	\N	\N
2031	1204	0		0	1	5.77	0	0	0	51.99	300	1	0	2022-11-01	\N	\N
2032	1205	0		0	1	5.77	0	0	0	39.86	230	1	0	2022-11-01	\N	\N
2033	1206	0		0	1	5.77	0	0	0	45.93	265	1	0	2022-11-01	\N	\N
2034	1207	0		0	1	5.77	0	0	0	12.13	70	1	0	2022-11-01	\N	\N
2035	1208	0		0	1	5.77	0	0	0	34.66	200	1	0	2022-11-01	\N	\N
2036	1209	0		0	1	5.77	0	0	0	43.33	250	1	0	2022-11-01	\N	\N
2037	1210	0		0	1	5.77	0	0	0	26	150	1	0	2022-11-01	\N	\N
2038	1211	0		0	1	5.77	0	0	0	30.33	175	1	0	2022-11-01	\N	\N
2039	1212	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-11-01	\N	\N
2040	1213	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-11-01	\N	\N
2041	1214	0		0	1	5.77	0	0	0	13	75	1	0	2022-11-01	\N	\N
2042	1215	0		0	1	5.77	0	0	0	21.66	125	1	0	2022-11-01	\N	\N
2043	1216	0		0	1	5.77	0	0	0	28.6	165	1	0	2022-11-01	\N	\N
2044	1029	6		180	1	5.77	1.038,6	1.038,6	180	0	0	1	2	2022-11-01	0	2022-11-01
2045	1150	6		180	1	5.77	1.038,6	1.038,6	180	0	0	1	2	2022-11-01	0	2022-11-01
2046	1030	3		300	1	8.59	2.577	1.731	300	0	0	1	2	2022-11-01	0	2022-11-01
2047	1065	3		235	1	8.59	2.018,65	1.355,95	235	0	0	1	2	2022-11-01	0	2022-11-01
2048	921	6		165	1	5.77	952,05	952,05	165	0	0	1	2	2022-11-01	0	2022-11-01
2049	1055	6		165	1	5.77	952,05	952,05	165	0	0	1	2	2022-11-01	0	2022-11-01
2050	1176	6		165	1	5.77	952,05	952,05	165	0	0	1	2	2022-11-01	0	2022-11-01
2051	1202	2	102133900	240	1	8.59	2.061,6	2.061,6	240	0	0	1	2	2022-11-01	28	2022-11-01
2052	1217	2	102133900	240	1	8.59	2.061,6	2.061,6	240	0	0	1	2	2022-11-01	28	2022-11-01
2053	860	2	102721758	165	1	8.59	1.417,35	1.417,35	165	0	0	1	2	2022-11-01	28	2022-11-01
2054	995	2	102721758	165	1	8.59	1.417,35	1.417,35	165	0	0	1	2	2022-11-01	28	2022-11-01
2055	1129	3		215	1	8.59	1.846,85	1.846,85	215	0	0	1	2	2022-11-02	0	2022-11-02
2057	1162	0		0	1	5.77	0	0	0	40.73	235	1	0	2022-11-02	\N	\N
2058	1162	2	85713876	235	1	8.59	2.018,65	2.018,65	235	0	0	1	2	2022-11-02	28	2022-11-02
2059	986	3		220	1	8.59	1.889,8	1.889,8	220	0	0	1	2	2022-11-02	0	2022-11-02
2060	1037	3		235	1	8.59	2.018,65	2.018,65	235	0	0	1	2	2022-11-02	0	2022-11-02
2061	1138	2	142301700	200	1	8.59	1.718	1.718	200	0	0	1	2	2022-11-03	28	2022-11-03
2062	846	2	125041643	165	1	8.59	1.417,35	1.417,35	165	0	0	1	2	2022-11-03	28	2022-11-02
2063	981	3		250	1	8.59	2.147,5	2.147,5	250	0	0	1	2	2022-11-03	0	2022-11-03
2064	1100	3		250	1	8.59	2.147,5	2.147,5	250	0	0	1	2	2022-11-03	0	2022-11-03
2065	954	3		150	1	8.59	1.288,5	1.288,5	150	0	0	1	2	2022-11-03	0	2022-11-03
2066	1089	3		150	1	8.59	1.288,5	1.288,5	150	0	0	1	2	2022-11-03	0	2022-11-03
2067	855	3		70	1	8.59	601,3	601,3	70	0	0	1	2	2022-11-03	0	2022-11-03
2068	990	3		70	1	5.77	403,9	403,9	70	0	0	1	2	2022-11-03	0	2022-11-03
2069	910	3		235	1	8.59	2.018,65	2.018,65	235	0	0	1	2	2022-11-03	0	2022-11-03
2070	1044	3		235	1	8.59	2.018,65	2.018,65	235	0	0	1	2	2022-11-03	0	2022-11-03
2071	909	3		165	1	8.59	1.417,35	1.417,35	165	0	0	1	2	2022-11-03	0	2022-11-03
2072	1043	3		165	1	8.59	1.417,35	1.417,35	165	0	0	1	2	2022-11-03	0	2022-11-03
2073	1018	1	12628212398	100	1	8.20	820	820	100	0	0	1	2	2022-11-04	10	2022-10-03
2074	949	3		230	1	8.59	1.975,7	1.975,7	230	0	0	1	2	2022-11-04	0	2022-11-04
2075	1084	3		230	1	8.59	1.975,7	1.975,7	230	0	0	1	2	2022-11-04	0	2022-11-04
2076	1218	0		0	1	5.77	0	0	0	10.4	60	1	0	2022-11-05	\N	\N
2077	1003	3		165	1	8.66	1.428,9	1.428,9	165	0	0	1	2	2022-11-05	0	2022-11-05
2078	930	3		165	1	8.66	1.428,9	1.428,9	165	0	0	1	2	2022-11-05	0	2022-11-05
2079	852	3		165	1	8.66	1.428,9	1.428,9	165	0	0	1	2	2022-11-05	0	2022-11-05
2080	987	3		165	1	8.66	1.428,9	1.428,9	165	0	0	1	2	2022-11-05	0	2022-11-05
2081	1108	3		165	1	8.66	1.428,9	1.428,9	165	0	0	1	2	2022-11-05	0	2022-11-05
2082	1218	2	142150206	60	1	8.66	519,6	519,6	60	0	0	1	2	2022-11-05	28	2022-11-01
2083	1154	3		180	1	8.66	1.558,8	1.558,8	180	0	0	1	2	2022-11-05	0	2022-11-05
2084	1033	3		180	1	8.66	1.558,8	1.558,8	180	0	0	1	2	2022-11-05	0	2022-11-05
2085	900	3		180	1	8.66	1.558,8	1.558,8	180	0	0	1	2	2022-11-05	0	2022-11-05
2086	1166	3		175	1	8.66	1.515,5	1.515,5	175	0	0	1	2	2022-11-05	0	2022-11-05
2087	1013	3		175	1	8.66	1.515,5	1.515,5	175	0	0	1	2	2022-11-05	0	2022-11-05
2088	1134	3		175	1	8.66	1.515,5	1.515,5	175	0	0	1	2	2022-11-05	0	2022-11-05
2089	1031	3		165	1	8.66	1.428,9	1.428,9	165	0	0	1	2	2022-11-06	0	2022-11-06
2090	1132	6		175	1	5.77	1.009,75	1.009,75	175	0	0	1	2	2022-11-07	0	2022-11-07
2091	1174	6		95	1	5.77	548,15	548,15	95	0	0	1	2	2022-11-07	0	2022-11-07
2092	1054	3		300	1	8.70	2.610	2.610	300	0	0	1	2	2022-11-07	0	2022-11-07
2093	1175	3		300	1	8.70	2.610	2.610	300	0	0	1	2	2022-11-07	0	2022-11-07
2094	1093	3		75	1	8.70	652,5	652,5	75	0	0	1	2	2022-11-08	0	2022-11-08
2095	1214	3		75	1	8.70	652,5	652,5	75	0	0	1	2	2022-11-08	0	2022-11-08
2096	1047	3		220	1	8.70	1.914	1.914	220	0	0	1	2	2022-11-08	0	2022-11-08
2097	1168	3		220	1	8.70	1.914	1.914	220	0	0	1	2	2022-11-08	0	2022-11-08
2098	1056	3		165	1	8.70	1.435,5	1.435,5	165	0	0	1	2	2022-11-08	0	2022-11-08
2099	1103	3		165	1	8.87	1.463,55	1.463,55	165	0	0	1	2	2022-11-09	0	2022-11-09
2100	1219	3		165	1	8.87	1.463,55	1.463,55	165	0	0	1	2	2022-11-09	0	2022-11-09
2101	953	3		250	1	8.87	2.217,5	2.217,5	250	0	0	1	2	2022-11-09	0	2022-11-09
2102	903	3		260	1	8.87	2.306,2	2.306,2	260	0	0	1	2	2022-11-09	0	2022-11-09
2103	1075	3		315	1	8.87	2.794,05	2.794,05	315	0	0	1	2	2022-11-09	0	2022-11-09
2104	1076	3		310	1	8.87	2.749,7	2.749,7	310	0	0	1	2	2022-11-09	0	2022-11-09
2105	1197	3		310	1	8.87	2.749,7	2.749,7	310	0	0	1	2	2022-11-09	0	2022-11-09
2106	1220	3		310	1	8.87	2.749,7	2.749,7	310	0	0	1	2	2022-11-09	0	2022-11-09
2107	1078	3		200	1	8.87	1.774	1.774	200	0	0	1	2	2022-11-09	0	2022-11-09
2108	1199	3		200	1	8.87	1.774	1.774	200	0	0	1	2	2022-11-09	0	2022-11-09
2109	1221	3		200	1	8.87	1.774	1.774	200	0	0	1	2	2022-11-09	0	2022-11-09
2110	757	3		165	1	8.77	1.447,05	1.447,05	165	0	0	1	2	2022-11-10	0	2022-11-10
2111	880	3		165	1	8.87	1.463,55	1.463,55	165	0	0	1	2	2022-11-10	0	2022-11-10
2112	1015	3		165	1	8.87	1.463,55	1.463,55	165	0	0	1	2	2022-11-10	0	2022-11-10
2113	1136	3		165	1	8.87	1.463,55	1.463,55	165	0	0	1	2	2022-11-10	0	2022-11-10
2114	1222	3		165	1	8.87	1.463,55	1.463,55	165	0	0	1	2	2022-11-10	0	2022-11-10
2115	27	3		55	1	8.87	487,85	487,85	55	0	0	1	2	2022-11-10	0	2022-11-10
2116	147	3		55	1	8.87	487,85	487,85	55	0	0	1	2	2022-11-10	0	2022-11-10
2117	267	3		275	1	8.87	2.439,25	2.439,25	275	0	0	1	2	2022-11-10	0	2022-11-10
2118	387	3		275	1	8.87	2.439,25	2.439,25	275	0	0	1	2	2022-11-10	0	2022-11-10
2119	507	3		275	1	8.87	2.439,25	2.439,25	275	0	0	1	2	2022-11-10	0	2022-11-10
2120	627	3		275	1	8.87	2.439,25	2.439,25	275	0	0	1	2	2022-11-10	0	2022-11-10
2121	747	3		275	1	8.87	2.439,25	2.439,25	275	0	0	1	2	2022-11-10	0	2022-11-10
2122	870	3		275	1	8.87	2.439,25	2.439,25	275	0	0	1	2	2022-11-10	0	2022-11-10
2123	1005	3		275	1	8.87	2.439,25	2.439,25	275	0	0	1	2	2022-11-10	0	2022-11-10
2124	1126	3		275	1	8.87	2.439,25	2.439,25	275	0	0	1	2	2022-11-10	0	2022-11-10
2125	938	3		170	1	8.87	1.507,9	1.507,9	170	0	0	1	2	2022-11-11	0	2022-11-11
2126	1070	3		165	1	10	1.650	1.650	165	0	0	1	2	2022-11-11	0	2022-11-11
2127	872	3		185	1	10	1.850	1.850	185	0	0	1	2	2022-11-11	0	2022-11-11
2128	777	3		180	1	8.87	1.596,6	1.596,6	180	0	0	1	2	2022-11-12	0	2022-11-12
2129	1086	3		70	1	9	630	630	70	0	0	1	2	2022-11-12	0	2022-11-12
2130	1019	3		400	1	9	3.600	3.600	400	0	0	1	2	2022-11-12	0	2022-11-12
2131	1063	3		170	1	9	1.530	1.530	170	0	0	1	2	2022-11-14	0	2022-11-14
2132	1118	3		110	1	9	990	990	110	0	0	1	2	2022-11-14	0	2022-11-14
2133	1145	3		120	1	9	1.080	1.080	120	0	0	1	2	2022-11-15	0	2022-11-15
1705	991	0		0	1	5.77	0	0	0	10.4	55	1	0	2022-10-01	\N	\N
1939	1112	0		0	1	5.77	0	0	0	10.4	55	1	0	2022-11-01	\N	\N
2136	1143	6		175	1	9.20	1.610	1.009,75	175	0	0	1	2	2022-11-16	0	2022-11-16
2137	493	3		55	1	9.88	543,4	543,4	55	-0	0	1	2	2022-11-19	0	2022-11-19
2138	613	3		55	1	9.88	543,4	543,4	55	-0	0	1	2	2022-11-19	0	2022-11-19
2139	733	3		55	1	9.88	543,4	543,4	55	-0	0	1	2	2022-11-19	0	2022-11-19
2140	856	3		55	1	9.88	543,4	543,4	55	-0	0	1	2	2022-11-19	0	2022-11-19
2141	784	3		210	1	9.88	2.074,8	2.074,8	210	0	0	1	2	2022-11-19	0	2022-11-19
2142	907	3		210	1	9.88	2.074,8	2.074,8	210	0	0	1	2	2022-11-19	0	2022-11-19
2143	1040	3		210	1	9.88	2.074,8	2.074,8	210	0	0	1	2	2022-11-19	0	2022-11-19
2144	1068	3		175	1	9.88	1.729	1.729	175	-0	0	1	2	2022-11-19	0	2022-11-19
2145	1034	3		315	1	9.88	3.112,2	3.112,2	315	-0	0	1	2	2022-11-19	0	2022-11-19
2146	1192	3		215	1	9.88	2.124,2	2.124,2	215	-0	0	1	2	2022-11-19	0	2022-11-19
2147	1102	3		225	1	9.88	2.223	2.223	225	0	0	1	2	2022-11-19	0	2022-11-19
2148	1223	3		225	1	9.88	2.223	2.223	225	0	0	1	2	2022-11-19	0	2022-11-19
2149	996	3		165	1	9.88	1.630,2	1.630,2	165	0	0	1	2	2022-11-19	0	2022-11-19
2150	1117	3		165	1	9.88	1.630,2	1.630,2	165	0	0	1	2	2022-11-19	0	2022-11-19
2151	1224	3		165	1	9.88	1.630,2	1.630,2	165	0	0	1	2	2022-11-19	0	2022-11-19
2152	1096	3		315	1	5.77	1.817,55	1.817,55	315	0	0	5	2	2022-11-19	0	2022-11-19
2153	1014	3		225	1	9.88	2.223	2.223	225	0	0	5	2	2022-11-21	0	2022-11-21
2154	1135	3		225	1	9.88	2.223	2.223	225	0	0	5	2	2022-11-21	0	2022-11-21
2155	1225	3		225	1	9.88	2.223	2.223	225	0	0	5	2	2022-11-21	0	2022-11-21
2157	1116	0		0	1	5.77	0	0	0	28.6	165	5	0	2022-11-21	\N	\N
2158	1116	2	103028651	165	1	9.88	1.630,2	1.630,2	165	0	0	5	2	2022-11-21	28	2022-11-16
2159	1080	0		0	1	5.77	0	0	0	54.59	315	5	0	2022-11-22	\N	\N
2160	1201	0		0	1	5.77	0	0	0	54.59	315	5	0	2022-11-22	\N	\N
2161	826	0		0	1	5.77	0	0	0	54.59	315	5	0	2022-11-22	\N	\N
2162	945	0		0	1	5.77	0	0	0	54.59	315	5	0	2022-11-22	\N	\N
2163	826	3		315	1	9.88	3.112,2	3.112,2	315	-0	0	5	2	2022-11-22	0	2022-11-22
2164	945	3		315	1	5.77	1.817,55	1.817,55	315	0	0	5	2	2022-11-22	0	2022-11-22
2165	991	3		55	1	9.88	543,4	543,4	55	-0	0	5	2	2022-11-22	0	2022-11-22
2166	1112	3		55	1	9.88	543,4	543,4	55	-0	0	5	2	2022-11-22	0	2022-11-22
2167	1049	3		425	1	9.88	4.199	4.199	425	0	0	5	2	2022-11-22	0	2022-11-22
2168	1170	3		425	1	9.88	4.199	4.199	425	0	0	5	2	2022-11-22	0	2022-11-22
2172	999	3		165	1	9.88	1.630,2	1.630,2	165	0	0	5	2	2022-11-22	0	2022-11-22
2173	1120	3		165	1	9.88	1.630,2	1.630,2	165	0	0	5	2	2022-11-22	0	2022-11-22
2178	982	2	135642963	165	1	9.88	1.630,2	1.630,2	165	0	0	5	2	2022-11-22	28	2022-11-07
2174	1085	3		265	1	9.88	2.618,2	2.618,2	265	0	0	5	2	2022-11-22	0	2022-11-22
2175	1206	3		265	1	9.88	2.618,2	2.618,2	265	0	0	5	2	2022-11-22	0	2022-11-22
2176	992	3		290	1	9.88	2.865,2	2.865,2	290	0	0	5	2	2022-11-22	0	2022-11-22
2179	1066	3		290	1	9.88	2.865,2	2.865,2	290	0	0	5	2	2022-11-22	0	2022-11-22
2185	1231	0	\N	0	1	9.88	0	0	0	0	370	1	0	2022-11-22	\N	\N
2186	1232	0	\N	0	1	9.88	0	0	0	0	370	1	0	2022-11-22	\N	\N
2187	1233	0	\N	0	1	9.88	0	0	0	0	370	1	0	2022-11-22	\N	\N
2177	1113	3		290	1	9.88	2.865,2	2.865,2	290	0	0	5	2	2022-11-22	0	2022-11-22
2180	1226	0		0	1	9.88	0	0	0	64.12	370	1	0	2022-11-22	\N	\N
2181	1227	0		0	1	9.88	0	0	0	36.4	210	1	0	2022-11-22	\N	\N
2182	1228	0	\N	0	1	9.88	0	0	0	0	210	1	0	2022-11-22	\N	\N
2183	1229	0	\N	0	1	9.88	0	0	0	0	210	1	0	2022-11-22	\N	\N
2184	1230	0	\N	0	1	9.88	0	0	0	0	210	1	0	2022-11-22	\N	\N
2188	1231	3		370	1	9.88	3.655,6	3.655,6	370	-0	0	5	2	2022-11-23	0	2022-11-23
2189	1232	3		370	1	9.88	3.655,6	3.655,6	370	-0	0	5	2	2022-11-23	0	2022-11-23
2190	1233	3		370	1	9.88	3.655,6	3.655,6	370	-0	0	5	2	2022-11-23	0	2022-11-23
2191	1236	3		370	1	9.88	3.655,6	3.655,6	370	-0	0	5	2	2022-11-23	0	2022-11-23
2192	1035	3		165	1	9.98	1.646,7	1.646,7	165	0	0	5	2	2022-11-23	0	2022-11-23
2193	1156	3		165	1	9.98	1.646,7	1.646,7	165	0	0	5	2	2022-11-23	0	2022-11-23
2194	1026	3		165	1	9.98	1.646,7	1.646,7	165	0	0	5	2	2022-11-23	0	2022-11-23
2195	1121	0		0	1	5.77	0	0	0	36.4	210	5	0	2022-11-23	\N	\N
2196	1000	0		0	1	5.77	0	0	0	36.4	210	5	0	2022-11-23	\N	\N
2197	865	0		0	1	5.77	0	0	0	36.4	210	5	0	2022-11-23	\N	\N
2200	1228	3		210	1	9.88	2.074,8	2.074,8	210	0	0	5	2	2022-11-23	0	2022-11-23
2201	1229	3		210	1	9.88	2.074,8	2.074,8	210	0	0	5	2	2022-11-23	0	2022-11-23
2202	1230	3		210	1	9.88	2.074,8	2.074,8	210	0	0	5	2	2022-11-23	0	2022-11-23
2203	1238	3		210	1	9.98	2.095,8	2.095,8	210	0	0	5	2	2022-11-23	0	2022-11-23
2206	998	3		165	1	9.98	1.646,7	1.646,7	165	0	0	5	2	2022-11-23	0	2022-11-23
2205	1097	0		0	1	9.98	0	0	0	37.07	315	5	0	2022-11-23	\N	\N
2207	928	3		240	1	10	2.400	2.400	240	0	0	5	2	2022-11-26	0	2022-11-26
2208	1062	3		240	1	10	2.400	2.400	240	0	0	5	2	2022-11-26	0	2022-11-26
2209	984	3		210	1	10	2.100	2.100	210	0	0	5	2	2022-11-28	0	2022-11-28
2210	1122	3		360	1	10	3.600	3.600	360	0	0	5	2	2022-11-29	0	2022-11-29
2211	1240	0		0	1	5.77	0	0	0	43.33	250	5	0	2022-12-01	\N	\N
2212	1241	0		0	1	5.77	0	0	0	28.6	165	5	0	2022-12-01	\N	\N
2213	1242	0		0	1	5.77	0	0	0	40.73	235	5	0	2022-12-01	\N	\N
2214	1243	0		0	1	5.77	0	0	0	36.4	210	5	0	2022-12-01	\N	\N
2215	1244	0		0	1	5.77	0	0	0	28.6	165	5	0	2022-12-01	\N	\N
2216	1245	0		0	1	5.77	0	0	0	38.13	220	5	0	2022-12-01	\N	\N
2217	1246	0		0	1	5.77	0	0	0	28.6	165	5	0	2022-12-01	\N	\N
2218	1247	0		0	1	5.77	0	0	0	38.13	220	5	0	2022-12-01	\N	\N
2219	1248	0		0	1	5.77	0	0	0	9.53	55	5	0	2022-12-01	\N	\N
2220	1249	0		0	1	5.77	0	0	0	10.4	60	5	0	2022-12-01	\N	\N
2221	1250	0		0	1	5.77	0	0	0	12.13	70	5	0	2022-12-01	\N	\N
2222	1251	0		0	1	5.77	0	0	0	9.53	55	5	0	2022-12-01	\N	\N
2223	1252	0		0	1	5.77	0	0	0	50.26	290	5	0	2022-12-01	\N	\N
2224	1253	0		0	1	5.77	0	0	0	28.6	165	5	0	2022-12-01	\N	\N
2225	1254	0		0	1	5.77	0	0	0	19.93	115	5	0	2022-12-01	\N	\N
2226	1255	0		0	1	5.77	0	0	0	28.6	165	5	0	2022-12-01	\N	\N
2227	1256	0		0	1	5.77	0	0	0	19.06	110	5	0	2022-12-01	\N	\N
2228	1257	0		0	1	5.77	0	0	0	28.6	165	5	0	2022-12-01	\N	\N
2229	1258	0		0	1	5.77	0	0	0	28.6	165	5	0	2022-12-01	\N	\N
2230	1259	0		0	1	5.77	0	0	0	36.4	210	5	0	2022-12-01	\N	\N
2231	1260	0		0	1	5.77	0	0	0	62.39	360	5	0	2022-12-01	\N	\N
2232	1261	0		0	1	5.77	0	0	0	24.26	140	5	0	2022-12-01	\N	\N
2234	1263	0		0	1	5.77	0	0	0	37.26	215	5	0	2022-12-01	\N	\N
2236	1265	0		0	1	5.77	0	0	0	63.26	365	5	0	2022-12-01	\N	\N
2237	1266	0		0	1	5.77	0	0	0	32.06	185	5	0	2022-12-01	\N	\N
2238	1267	0		0	1	5.77	0	0	0	37.26	215	5	0	2022-12-01	\N	\N
2239	1268	0		0	1	5.77	0	0	0	28.6	165	5	0	2022-12-01	\N	\N
2240	1269	0		0	1	5.77	0	0	0	28.6	165	5	0	2022-12-01	\N	\N
2242	1271	0		0	1	5.77	0	0	0	62.39	360	5	0	2022-12-01	\N	\N
2243	1272	0		0	1	5.77	0	0	0	30.33	175	5	0	2022-12-01	\N	\N
2244	1273	0		0	1	5.77	0	0	0	99.65	575	5	0	2022-12-01	\N	\N
2245	1274	0		0	1	5.77	0	0	0	34.66	200	5	0	2022-12-01	\N	\N
2246	1275	0		0	1	5.77	0	0	0	17.33	100	5	0	2022-12-01	\N	\N
2247	1276	0		0	1	5.77	0	0	0	69.32	400	5	0	2022-12-01	\N	\N
2249	1278	0		0	1	5.77	0	0	0	35.53	205	5	0	2022-12-01	\N	\N
2251	1280	0		0	1	5.77	0	0	0	17.33	100	5	0	2022-12-01	\N	\N
2252	1281	0		0	1	5.77	0	0	0	20.8	120	5	0	2022-12-01	\N	\N
2253	1282	0		0	1	5.77	0	0	0	28.6	165	5	0	2022-12-01	\N	\N
2254	1283	0		0	1	5.77	0	0	0	28.6	165	5	0	2022-12-01	\N	\N
2255	1284	0		0	1	5.77	0	0	0	28.6	165	5	0	2022-12-01	\N	\N
2256	1285	0		0	1	5.77	0	0	0	21.66	125	5	0	2022-12-01	\N	\N
2258	1287	0		0	1	5.77	0	0	0	51.99	300	5	0	2022-12-01	\N	\N
2259	1288	0		0	1	5.77	0	0	0	28.6	165	5	0	2022-12-01	\N	\N
2260	1289	0		0	1	5.77	0	0	0	60.66	350	5	0	2022-12-01	\N	\N
2261	1290	0		0	1	5.77	0	0	0	31.2	180	5	0	2022-12-01	\N	\N
2262	1291	0		0	1	5.77	0	0	0	54.59	315	5	0	2022-12-01	\N	\N
2263	1292	0		0	1	5.77	0	0	0	28.6	165	5	0	2022-12-01	\N	\N
2264	1293	0		0	1	5.77	0	0	0	45.06	260	5	0	2022-12-01	\N	\N
2265	1294	0		0	1	5.77	0	0	0	40.73	235	5	0	2022-12-01	\N	\N
2266	1295	0		0	1	5.77	0	0	0	41.59	240	5	0	2022-12-01	\N	\N
2267	1296	0		0	1	5.77	0	0	0	36.4	210	5	0	2022-12-01	\N	\N
2268	1297	0		0	1	5.77	0	0	0	36.4	210	5	0	2022-12-01	\N	\N
2269	1298	0		0	1	5.77	0	0	0	40.73	235	5	0	2022-12-01	\N	\N
2270	1299	0		0	1	5.77	0	0	0	31.2	180	5	0	2022-12-01	\N	\N
2271	1300	0		0	1	5.77	0	0	0	28.6	165	5	0	2022-12-01	\N	\N
2272	1301	0		0	1	5.77	0	0	0	40.73	235	5	0	2022-12-01	\N	\N
2274	1303	0		0	1	5.77	0	0	0	47.66	275	5	0	2022-12-01	\N	\N
2275	1304	0		0	1	5.77	0	0	0	38.13	220	5	0	2022-12-01	\N	\N
2277	1306	0		0	1	5.77	0	0	0	73.66	425	5	0	2022-12-01	\N	\N
2278	1307	0		0	1	5.77	0	0	0	53.73	310	5	0	2022-12-01	\N	\N
2279	1308	0		0	1	5.77	0	0	0	70.19	405	5	0	2022-12-01	\N	\N
2280	1309	0		0	1	5.77	0	0	0	31.2	180	5	0	2022-12-01	\N	\N
2282	1311	0		0	1	5.77	0	0	0	51.99	300	5	0	2022-12-01	\N	\N
2284	1313	0		0	1	5.77	0	0	0	28.6	165	5	0	2022-12-01	\N	\N
2285	1314	0		0	1	5.77	0	0	0	28.6	165	5	0	2022-12-01	\N	\N
2286	1315	0		0	1	5.77	0	0	0	50.26	290	5	0	2022-12-01	\N	\N
2287	1316	0		0	1	5.77	0	0	0	28.6	165	5	0	2022-12-01	\N	\N
2288	1317	0		0	1	5.77	0	0	0	76.26	440	5	0	2022-12-01	\N	\N
2289	1318	0		0	1	5.77	0	0	0	20.8	120	5	0	2022-12-01	\N	\N
2290	1319	0		0	1	5.77	0	0	0	41.59	240	5	0	2022-12-01	\N	\N
2291	1320	0		0	1	5.77	0	0	0	29.46	170	5	0	2022-12-01	\N	\N
2292	1321	0		0	1	5.77	0	0	0	28.6	165	5	0	2022-12-01	\N	\N
2293	1322	0		0	1	5.77	0	0	0	40.73	235	5	0	2022-12-01	\N	\N
2294	1323	0		0	1	5.77	0	0	0	50.26	290	5	0	2022-12-01	\N	\N
2295	1324	0		0	1	5.77	0	0	0	28.6	165	5	0	2022-12-01	\N	\N
2296	1325	0		0	1	5.77	0	0	0	30.33	175	5	0	2022-12-01	\N	\N
2297	1326	0		0	1	5.77	0	0	0	28.6	165	5	0	2022-12-01	\N	\N
2298	1327	0		0	1	5.77	0	0	0	20.8	120	5	0	2022-12-01	\N	\N
2299	1328	0		0	1	5.77	0	0	0	28.6	165	5	0	2022-12-01	\N	\N
2300	1329	0		0	1	5.77	0	0	0	37.26	215	5	0	2022-12-01	\N	\N
2301	1330	0		0	1	5.77	0	0	0	29.46	170	5	0	2022-12-01	\N	\N
2302	1331	0		0	1	5.77	0	0	0	54.59	315	5	0	2022-12-01	\N	\N
2303	1332	0		0	1	5.77	0	0	0	31.2	180	5	0	2022-12-01	\N	\N
2305	1334	0		0	1	5.77	0	0	0	46.79	270	5	0	2022-12-01	\N	\N
2306	1335	0		0	1	5.77	0	0	0	19.93	115	5	0	2022-12-01	\N	\N
2307	1336	0		0	1	5.77	0	0	0	54.59	315	5	0	2022-12-01	\N	\N
2308	1337	0		0	1	5.77	0	0	0	28.6	165	5	0	2022-12-01	\N	\N
2309	1338	0		0	1	5.77	0	0	0	51.99	300	5	0	2022-12-01	\N	\N
2310	1339	0		0	1	5.77	0	0	0	39.86	230	5	0	2022-12-01	\N	\N
2311	1340	0		0	1	5.77	0	0	0	45.93	265	5	0	2022-12-01	\N	\N
2312	1341	0		0	1	5.77	0	0	0	12.13	70	5	0	2022-12-01	\N	\N
2313	1342	0		0	1	5.77	0	0	0	34.66	200	5	0	2022-12-01	\N	\N
2314	1343	0		0	1	5.77	0	0	0	43.33	250	5	0	2022-12-01	\N	\N
2315	1344	0		0	1	5.77	0	0	0	26	150	5	0	2022-12-01	\N	\N
2316	1345	0		0	1	5.77	0	0	0	30.33	175	5	0	2022-12-01	\N	\N
2317	1346	0		0	1	5.77	0	0	0	28.6	165	5	0	2022-12-01	\N	\N
2318	1347	0		0	1	5.77	0	0	0	28.6	165	5	0	2022-12-01	\N	\N
2319	1348	0		0	1	5.77	0	0	0	13	75	5	0	2022-12-01	\N	\N
2320	1349	0		0	1	5.77	0	0	0	54.59	315	5	0	2022-12-01	\N	\N
2321	1350	0		0	1	5.77	0	0	0	21.66	125	5	0	2022-12-01	\N	\N
2322	1351	0		0	1	5.77	0	0	0	28.6	165	5	0	2022-12-01	\N	\N
2323	1352	0		0	1	5.77	0	0	0	43.33	250	5	0	2022-12-01	\N	\N
2324	1077	2	92200426	270	1	10	2.700	2.700	270	0	0	5	2	2022-12-02	28	2022-12-02
2325	1198	2	92200426	270	1	10	2.700	2.700	270	0	0	5	2	2022-12-02	28	2022-12-02
2326	1186	3		235	1	10	2.350	2.350	235	0	0	5	2	2022-12-02	0	2022-12-02
2327	1322	3		235	1	10	2.350	2.350	235	0	0	5	2	2022-12-02	0	2022-12-02
2328	303	3		210	1	10	2.100	2.100	210	0	0	5	2	2022-12-02	0	2022-12-02
2329	423	3		210	1	10	2.100	2.100	210	0	0	5	2	2022-12-02	0	2022-12-02
2330	543	3		210	1	10	2.100	2.100	210	0	0	5	2	2022-12-02	0	2022-12-02
2331	663	3		210	1	10	2.100	2.100	210	0	0	5	2	2022-12-02	0	2022-12-02
2332	783	3		210	1	10	2.100	2.100	210	0	0	5	2	2022-12-02	0	2022-12-02
2333	906	3		210	1	10	2.100	2.100	210	0	0	5	2	2022-12-02	0	2022-12-02
2334	1039	3		210	1	10	2.100	2.100	210	0	0	5	2	2022-12-02	0	2022-12-02
2335	1160	3		210	1	10	2.100	2.100	210	0	0	5	2	2022-12-02	0	2022-12-02
2336	1088	3		250	1	10	2.500	2.500	250	0	0	5	2	2022-12-02	0	2022-12-02
2337	1209	3		250	1	10	2.500	2.500	250	0	0	5	2	2022-12-02	0	2022-12-02
2338	1107	3		220	1	10	2.200	2.200	220	0	0	5	2	2022-12-02	0	2022-12-02
2339	1158	3		235	1	10	2.350	2.350	235	0	0	5	2	2022-12-02	0	2022-12-02
2340	1296	6		210	1	5.77	1.211,7	1.211,7	210	0	0	5	2	2022-12-02	0	2022-12-02
2341	1298	3		235	1	10	2.350	2.350	235	0	0	5	2	2022-12-03	0	2022-12-03
2342	1072	3		170	1	10	1.700	1.700	170	0	0	5	2	2022-12-03	0	2022-12-03
2343	1267	3		215	1	11	2.365	2.365	215	0	0	5	2	2022-12-05	0	2022-12-05
2344	1042	3		180	1	13	2.340	2.340	180	0	0	5	2	2022-12-06	0	2022-12-06
2345	1163	3		180	1	13	2.340	2.340	180	0	0	5	2	2022-12-06	0	2022-12-06
2346	1074	3		180	1	13	2.340	2.340	180	0	0	5	2	2022-12-06	0	2022-12-06
2347	1195	3		180	1	13	2.340	2.340	180	0	0	5	2	2022-12-06	0	2022-12-06
2348	983	3		235	1	13	3.055	3.055	235	0	0	5	2	2022-12-06	0	2022-12-06
2349	1104	3		235	1	13	3.055	3.055	235	0	0	5	2	2022-12-06	0	2022-12-06
2350	989	3		55	1	13	715	715	55	0	0	5	2	2022-12-06	0	2022-12-06
2351	1110	3		55	1	13	715	715	55	0	0	5	2	2022-12-06	0	2022-12-06
2352	1213	3		165	1	13	2.145	2.145	165	0	0	5	2	2022-12-06	0	2022-12-06
2353	1352	3		250	1	13	3.250	3.250	250	0	0	5	2	2022-12-06	0	2022-12-06
2354	1151	3		300	1	13	3.900	3.900	300	0	0	5	2	2022-12-07	0	2022-12-07
2355	1287	3		300	1	13	3.900	3.900	300	0	0	5	2	2022-12-07	0	2022-12-07
2356	1249	2	131358779	60	1	13	780	780	60	0	0	5	2	2022-12-07	28	2022-12-05
2357	1274	2	131451517	200	1	13	2.600	2.600	200	0	0	5	2	2022-12-07	28	2022-12-05
2358	1124	3		165	1	13	2.145	2.145	165	0	0	5	2	2022-12-07	0	2022-12-07
2360	1304	3		220	1	13	2.860	2.860	220	0	0	5	2	2022-12-07	0	2022-12-07
2361	1348	3		75	1	13	975	975	75	0	0	5	2	2022-12-07	0	2022-12-07
2362	1353	3		75	1	13	975	975	75	0	0	5	2	2022-12-07	0	2022-12-07
2363	1354	3		75	1	13	975	975	75	0	0	5	2	2022-12-07	0	2022-12-07
2364	1355	3		75	1	13	975	975	75	0	0	5	2	2022-12-07	0	2022-12-07
2365	1356	3		220	1	13	2.860	2.860	220	0	0	5	2	2022-12-07	0	2022-12-07
2366	1357	3		220	1	13	2.860	2.860	220	0	0	5	2	2022-12-07	0	2022-12-07
2367	1358	3		220	1	13	2.860	2.860	220	0	0	5	2	2022-12-07	0	2022-12-07
2368	1007	3		185	1	13	2.405	2.405	185	0	0	5	2	2022-12-07	0	2022-12-07
2369	1246	3		165	1	13	2.145	2.145	165	0	0	5	2	2022-12-07	0	2022-12-07
2370	1326	3		165	1	13	2.145	2.145	165	0	0	5	2	2022-12-09	0	2022-12-09
2371	1359	3		165	1	13	2.145	2.145	165	0	0	5	2	2022-12-09	0	2022-12-09
2372	1064	3		165	1	13	2.145	2.145	165	0	0	5	2	2022-12-09	0	2022-12-09
2373	1256	3		110	1	13	1.430	1.430	110	0	0	5	2	2022-12-09	0	2022-12-09
2374	886	3		205	1	13	2.665	2.665	205	0	0	5	2	2022-12-10	0	2022-12-10
2376	1021	0		0	1	5.77	0	0	0	35.53	205	5	0	2022-12-10	\N	\N
2377	1021	3		205	1	13	2.665	2.665	205	0	0	5	2	2022-12-10	0	2022-12-10
2378	1142	3		205	1	13	2.665	2.665	205	0	0	5	2	2022-12-10	0	2022-12-10
2379	1290	3		180	1	13	2.340	2.340	180	0	0	5	2	2022-12-11	0	2022-12-11
2380	1196	3		315	1	13	4.095	4.095	315	0	0	5	2	2022-12-12	0	2022-12-12
2382	1333	0		0	1	5.77	0	0	0	54.59	315	5	0	2022-12-12	\N	\N
2383	1333	3		315	1	13	4.095	4.095	315	0	0	5	2	2022-12-12	0	2022-12-12
2384	1281	3		120	1	13	1.560	1.560	120	0	0	5	2	2022-12-12	0	2022-12-12
2385	1207	3		70	1	13	910	910	70	0	0	5	2	2022-12-12	0	2022-12-12
2386	1012	3		360	1	14	5.040	5.040	360	0	0	5	2	2022-12-13	0	2022-12-13
2387	1133	3		360	1	14	5.040	5.040	360	0	0	5	2	2022-12-13	0	2022-12-13
2388	1271	3		360	1	14	5.040	5.040	360	0	0	5	2	2022-12-13	0	2022-12-13
2390	914	0		0	1	5.77	0	0	0	40.73	235	5	0	2022-12-13	\N	\N
2391	914	2	145810542	235	1	14	3.290	3.290	235	0	0	5	2	2022-12-13	28	2022-12-07
2392	1048	2	145810542	235	1	14	3.290	3.290	235	0	0	5	2	2022-12-13	28	2022-12-07
2393	1169	2	145810542	235	1	14	3.290	3.290	235	0	0	5	2	2022-12-13	28	2022-12-07
2395	1305	0		0	1	5.77	0	0	0	40.73	235	5	0	2022-12-13	\N	\N
2396	1305	2	145810542	235	1	14	3.290	3.290	235	0	0	5	2	2022-12-13	28	2022-12-07
2397	1205	3		230	1	14	3.220	3.220	230	0	0	5	2	2022-12-13	0	2022-12-13
2398	1339	3		230	1	14	3.220	3.220	230	0	0	5	2	2022-12-13	0	2022-12-13
2399	1139	3		100	1	14	1.400	1.400	100	0	0	5	2	2022-12-13	0	2022-12-13
2400	1275	3		100	1	14	1.400	1.400	100	0	0	5	2	2022-12-13	0	2022-12-13
2401	1240	3		250	1	14	3.500	3.500	250	0	0	5	2	2022-12-13	0	2022-12-13
2402	1292	3		165	1	14	2.310	2.310	165	0	0	5	2	2022-12-14	0	2022-12-14
2403	1082	3		165	1	14	2.310	2.310	165	0	0	5	2	2022-12-14	0	2022-12-14
2404	1123	3		140	1	14	1.960	1.960	140	0	0	5	2	2022-12-14	0	2022-12-14
2405	1152	3		165	1	14	2.310	2.310	165	0	0	5	2	2022-12-14	0	2022-12-14
2406	1204	2	133919972	300	1	14	4.200	4.200	300	0	0	5	2	2022-12-14	28	2022-12-13
2407	1338	2	133919972	300	1	14	4.200	4.200	300	0	0	5	2	2022-12-14	28	2022-12-13
2408	1188	2	133919972	165	1	14	2.310	2.310	165	0	0	5	2	2022-12-14	28	2022-12-13
2409	1324	2	133919972	165	1	14	2.310	2.310	165	0	0	5	2	2022-12-14	28	2022-12-13
2410	1144	2	133919972	100	1	14	1.400	1.400	100	0	0	5	2	2022-12-14	28	2022-12-13
2411	1280	2	133919972	100	1	14	1.400	1.400	100	0	0	5	2	2022-12-14	28	2022-12-13
2412	1184	3		170	1	14	2.380	2.380	170	0	0	5	2	2022-12-15	0	2022-12-15
2413	1193	3		170	1	14	2.380	2.380	170	0	0	5	2	2022-12-15	0	2022-12-15
2414	1140	3		400	1	14	5.600	5.600	400	0	0	5	2	2022-12-15	0	2022-12-15
2415	1276	3		400	1	14	5.600	5.600	400	0	0	5	2	2022-12-15	0	2022-12-15
2416	1311	3		300	1	14	4.200	4.200	300	0	0	5	2	2022-12-15	0	2022-12-15
2417	1114	3		165	1	15.57	2.569,05	2.569,05	165	0	0	5	2	2022-12-15	0	2022-12-15
2418	1253	3		165	1	15.57	2.569,05	2.569,05	165	0	0	5	2	2022-12-15	0	2022-12-15
2419	1191	3		165	1	15	2.475	2.475	165	0	0	5	2	2022-12-16	0	2022-12-16
2420	1058	3		290	1	15	4.350	4.350	290	0	0	5	2	2022-12-17	0	2022-12-17
2421	1179	3		290	1	15	4.350	4.350	290	0	0	5	2	2022-12-17	0	2022-12-17
2422	1315	3		290	1	15	4.350	4.350	290	0	0	5	2	2022-12-17	0	2022-12-17
2423	752	3		165	1	15	2.475	2.475	165	0	0	5	2	2022-12-18	0	2022-12-18
2424	875	3		165	1	15	2.475	2.475	165	0	0	5	2	2022-12-18	0	2022-12-18
2425	1010	3		165	1	15	2.475	2.475	165	0	0	5	2	2022-12-18	0	2022-12-18
2426	1131	3		165	1	15	2.475	2.475	165	0	0	5	2	2022-12-18	0	2022-12-18
2427	1269	3		165	1	15	2.475	2.475	165	0	0	5	2	2022-12-18	0	2022-12-18
2428	1260	3		360	1	15	5.400	5.400	360	0	0	5	2	2022-12-19	0	2022-12-19
2429	1109	3		220	1	15	3.300	3.300	220	0	0	5	2	2022-12-21	0	2022-12-21
2430	1247	3		220	1	15	3.300	3.300	220	0	0	5	2	2022-12-21	0	2022-12-21
2431	1153	3		350	1	15	5.250	5.250	350	0	0	5	2	2022-12-21	0	2022-12-21
2432	1289	3		350	1	15	5.250	5.250	350	0	0	5	2	2022-12-21	0	2022-12-21
2433	1155	3		315	1	15	4.725	4.725	315	0	0	5	2	2022-12-21	0	2022-12-21
2434	1291	3		315	1	15	4.725	4.725	315	0	0	5	2	2022-12-21	0	2022-12-21
2435	1189	3		175	1	15	2.625	2.625	175	0	0	5	2	2022-12-21	0	2022-12-21
2436	1325	3		175	1	15	2.625	2.625	175	0	0	5	2	2022-12-21	0	2022-12-21
2437	1251	3		55	1	16	880	880	55	0	0	5	2	2022-12-22	0	2022-12-22
2439	1302	0		0	1	5.77	0	0	0	30.33	175	5	0	2022-12-22	\N	\N
2440	1302	3		175	1	16	2.800	2.800	175	0	0	5	2	2022-12-22	0	2022-12-22
2441	1255	2	100218798	165	1	16	2.640	2.640	165	0	0	5	2	2022-12-22	28	2022-12-22
2442	1036	3	100218798	260	1	16	4.160	4.160	260	0	0	5	2	2022-12-22	28	2022-12-22
2443	628	3		365	1	15	5.475	5.475	365	0	0	5	2	2022-12-23	0	2022-12-23
2444	748	3		365	1	15	5.475	5.475	365	0	0	5	2	2022-12-23	0	2022-12-23
2445	871	3		365	1	15	5.475	5.475	365	0	0	5	2	2022-12-23	0	2022-12-23
2446	1006	3		365	1	15	5.475	5.475	365	0	0	5	2	2022-12-23	0	2022-12-23
2447	1127	3		365	1	15	5.475	5.475	365	0	0	5	2	2022-12-23	0	2022-12-23
2448	1265	3		365	1	15	5.475	5.475	365	0	0	5	2	2022-12-23	0	2022-12-23
2449	1360	3		365	1	15	5.475	5.475	365	0	0	5	2	2022-12-23	0	2022-12-23
2450	1361	3		365	1	15	5.475	5.475	365	0	0	5	2	2022-12-23	0	2022-12-23
2451	1306	3		425	1	15	6.375	6.375	425	0	0	5	2	2022-12-23	0	2022-12-23
2452	1051	3		405	1	16	6.480	6.480	405	0	0	5	2	2022-12-26	0	2022-12-26
2453	1172	3		405	1	16	6.480	6.480	405	0	0	5	2	2022-12-26	0	2022-12-26
2454	1161	3		210	1	16	3.360	3.360	210	0	0	5	2	2022-12-27	0	2022-12-27
2455	1362	3		165	1	16	2.640	2.640	165	0	0	5	2	2022-12-27	0	2022-12-27
2456	1341	3		70	1	17	1.190	1.190	70	0	0	5	2	2023-01-02	0	2023-01-02
2457	895	6		165	1	5.77	952,05	952,05	165	0	0	5	2	2023-01-02	0	2023-01-02
2458	1095	6		165	1	5.77	952,05	952,05	165	0	0	5	2	2023-01-02	0	2023-01-02
2459	1216	6		165	1	5.77	952,05	952,05	165	0	0	5	2	2023-01-02	0	2023-01-02
2460	1351	6		165	1	5.77	952,05	952,05	165	0	0	5	2	2023-01-02	0	2023-01-02
2461	81	6		33	1	5.77	190,41	190,41	33	0	0	5	2	2023-01-02	0	2023-01-02
2462	201	6		33	1	5.77	190,41	190,41	33	0	0	5	2	2023-01-02	0	2023-01-02
2463	321	6		165	1	5.77	952,05	952,05	165	0	0	5	2	2023-01-02	0	2023-01-02
2464	441	6		165	1	5.77	952,05	952,05	165	0	0	5	2	2023-01-02	0	2023-01-02
2465	561	6		165	1	5.77	952,05	952,05	165	0	0	5	2	2023-01-02	0	2023-01-02
2466	681	6		165	1	5.77	952,05	952,05	165	0	0	5	2	2023-01-02	0	2023-01-02
2467	801	6		165	1	5.77	952,05	952,05	165	0	0	5	2	2023-01-02	0	2023-01-02
2468	923	6		165	1	5.77	952,05	952,05	165	0	0	5	2	2023-01-02	0	2023-01-02
2469	1057	6		165	1	5.77	952,05	952,05	165	0	0	5	2	2023-01-02	0	2023-01-02
2470	1178	6		165	1	5.77	952,05	952,05	165	0	0	5	2	2023-01-02	0	2023-01-02
2471	1314	6		165	1	5.77	952,05	952,05	165	0	0	5	2	2023-01-02	0	2023-01-02
2472	16	6		23	1	5.77	132,71	132,71	23	0	0	5	2	2023-01-02	0	2023-01-02
2473	136	6		23	1	5.77	132,71	132,71	23	0	0	5	2	2023-01-02	0	2023-01-02
2475	256	0		0	1	5.77	0	0	0	19.93	115	5	0	2023-01-02	\N	\N
2476	256	6		115	1	5.77	663,55	663,55	115	0	0	5	2	2023-01-02	0	2023-01-02
2477	376	6		115	1	5.77	663,55	663,55	115	0	0	5	2	2023-01-02	0	2023-01-02
2478	496	6		115	1	5.77	663,55	663,55	115	0	0	5	2	2023-01-02	0	2023-01-02
2479	616	6		115	1	5.77	663,55	663,55	115	0	0	5	2	2023-01-02	0	2023-01-02
2480	736	6		115	1	5.77	663,55	663,55	115	0	0	5	2	2023-01-02	0	2023-01-02
2481	859	6		115	1	5.77	663,55	663,55	115	0	0	5	2	2023-01-02	0	2023-01-02
2482	994	6		115	1	5.77	663,55	663,55	115	0	0	5	2	2023-01-02	0	2023-01-02
2483	1115	6		115	1	5.77	663,55	663,55	115	0	0	5	2	2023-01-02	0	2023-01-02
2484	1254	6		115	1	5.77	663,55	663,55	115	0	0	5	2	2023-01-02	0	2023-01-02
2485	1334	2	140243653	270	1	17	4.590	4.590	270	0	0	5	2	2023-01-02	28	2022-12-27
2486	1101	2	145211937	165	1	5.77	952,05	952,05	165	0	0	5	2	2023-01-02	28	2022-12-26
2487	1363	2	90032949	235	1	17	3.995	3.995	235	0	0	5	2	2023-01-02	28	2023-01-02
2488	1215	3		125	1	17	2.125	2.125	125	0	0	5	2	2023-01-02	0	2023-01-02
2489	1350	3		125	1	17	2.125	2.125	125	0	0	5	2	2023-01-02	0	2023-01-02
2490	1177	3		165	1	17	2.805	2.805	165	0	0	5	2	2023-01-02	0	2023-01-02
2491	1313	3		165	1	17	2.805	2.805	165	0	0	5	2	2023-01-02	0	2023-01-02
2492	1330	3		170	1	17	2.890	2.890	170	0	0	5	2	2023-01-04	0	2023-01-04
2493	1347	3		165	1	17	2.805	2.805	165	0	0	5	2	2023-01-04	0	2023-01-04
2494	1128	3		185	1	17	3.145	3.145	185	0	0	5	2	2023-01-04	0	2023-01-04
2495	1266	3		185	1	17	3.145	3.145	185	0	0	5	2	2023-01-04	0	2023-01-04
2496	1364	3		215	1	20	4.300	4.300	215	0	0	5	2	2023-01-05	0	2023-01-05
2498	1366	0		0	1	5.77	0	0	0	28.6	165	1	0	2023-01-01	\N	\N
2499	1367	0		0	1	5.77	0	0	0	38.99	225	1	0	2023-01-01	\N	\N
2500	1368	0		0	1	5.77	0	0	0	40.73	235	1	0	2023-01-01	\N	\N
2501	1369	0		0	1	5.77	0	0	0	36.4	210	1	0	2023-01-01	\N	\N
2502	1370	0		0	1	5.77	0	0	0	28.6	165	1	0	2023-01-01	\N	\N
2503	1371	0		0	1	5.77	0	0	0	76.26	440	1	0	2023-01-01	\N	\N
2504	1372	0		0	1	5.77	0	0	0	38.13	220	1	0	2023-01-01	\N	\N
2505	1373	0		0	1	5.77	0	0	0	28.6	165	1	0	2023-01-01	\N	\N
2506	1374	0		0	1	5.77	0	0	0	38.13	220	1	0	2023-01-01	\N	\N
2507	1375	0		0	1	5.77	0	0	0	9.53	55	1	0	2023-01-01	\N	\N
2508	1376	0		0	1	5.77	0	0	0	10.4	60	1	0	2023-01-01	\N	\N
2509	1377	0		0	1	5.77	0	0	0	12.13	70	1	0	2023-01-01	\N	\N
2510	1378	0		0	1	5.77	0	0	0	9.53	55	1	0	2023-01-01	\N	\N
2511	1379	0		0	1	5.77	0	0	0	50.26	290	1	0	2023-01-01	\N	\N
2512	1380	0		0	1	5.77	0	0	0	28.6	165	1	0	2023-01-01	\N	\N
2513	1381	0		0	1	5.77	0	0	0	28.6	165	1	0	2023-01-01	\N	\N
2514	1382	0		0	1	5.77	0	0	0	28.6	165	1	0	2023-01-01	\N	\N
2515	1383	0		0	1	5.77	0	0	0	19.06	110	1	0	2023-01-01	\N	\N
2516	1384	0		0	1	5.77	0	0	0	28.6	165	1	0	2023-01-01	\N	\N
2517	1385	0		0	1	5.77	0	0	0	28.6	165	1	0	2023-01-01	\N	\N
2518	1386	0		0	1	5.77	0	0	0	36.4	210	1	0	2023-01-01	\N	\N
2519	1387	0		0	1	5.77	0	0	0	62.39	360	1	0	2023-01-01	\N	\N
2520	1388	0		0	1	5.77	0	0	0	24.26	140	1	0	2023-01-01	\N	\N
2521	1389	0		0	1	5.77	0	0	0	28.6	165	1	0	2023-01-01	\N	\N
2522	1390	0		0	1	5.77	0	0	0	37.26	215	1	0	2023-01-01	\N	\N
2523	1391	0		0	1	5.77	0	0	0	32.06	185	1	0	2023-01-01	\N	\N
2524	1392	0		0	1	5.77	0	0	0	28.6	165	1	0	2023-01-01	\N	\N
2525	1393	0		0	1	5.77	0	0	0	62.39	360	1	0	2023-01-01	\N	\N
2526	1394	0		0	1	5.77	0	0	0	30.33	175	1	0	2023-01-01	\N	\N
2527	1395	0		0	1	5.77	0	0	0	38.99	225	1	0	2023-01-01	\N	\N
2528	1396	0		0	1	5.77	0	0	0	28.6	165	1	0	2023-01-01	\N	\N
2529	1397	0		0	1	5.77	0	0	0	99.65	575	1	0	2023-01-01	\N	\N
2530	1398	0		0	1	5.77	0	0	0	34.66	200	1	0	2023-01-01	\N	\N
2531	1399	0		0	1	5.77	0	0	0	17.33	100	1	0	2023-01-01	\N	\N
2532	1400	0		0	1	5.77	0	0	0	69.32	400	1	0	2023-01-01	\N	\N
2533	1401	0		0	1	5.77	0	0	0	38.99	225	1	0	2023-01-01	\N	\N
2534	1402	0		0	1	5.77	0	0	0	35.53	205	1	0	2023-01-01	\N	\N
2535	1403	0		0	1	5.77	0	0	0	17.33	100	1	0	2023-01-01	\N	\N
2536	1404	0		0	1	5.77	0	0	0	20.8	120	1	0	2023-01-01	\N	\N
2537	1405	0		0	1	5.77	0	0	0	28.6	165	1	0	2023-01-01	\N	\N
2538	1406	0		0	1	5.77	0	0	0	28.6	165	1	0	2023-01-01	\N	\N
2539	1407	0		0	1	5.77	0	0	0	28.6	165	1	0	2023-01-01	\N	\N
2540	1408	0		0	1	5.77	0	0	0	21.66	125	1	0	2023-01-01	\N	\N
2541	1409	0		0	1	5.77	0	0	0	51.99	300	1	0	2023-01-01	\N	\N
2542	1410	0		0	1	5.77	0	0	0	28.6	165	1	0	2023-01-01	\N	\N
2543	1411	0		0	1	5.77	0	0	0	60.66	350	1	0	2023-01-01	\N	\N
2544	1412	0		0	1	5.77	0	0	0	31.2	180	1	0	2023-01-01	\N	\N
2545	1413	0		0	1	5.77	0	0	0	54.59	315	1	0	2023-01-01	\N	\N
2546	1414	0		0	1	5.77	0	0	0	28.6	165	1	0	2023-01-01	\N	\N
2547	1415	0		0	1	5.77	0	0	0	45.06	260	1	0	2023-01-01	\N	\N
2548	1416	0		0	1	5.77	0	0	0	40.73	235	1	0	2023-01-01	\N	\N
2549	1417	0		0	1	5.77	0	0	0	41.59	240	1	0	2023-01-01	\N	\N
2550	1418	0		0	1	5.77	0	0	0	36.4	210	1	0	2023-01-01	\N	\N
2551	1419	0		0	1	5.77	0	0	0	31.2	180	1	0	2023-01-01	\N	\N
2552	1420	0		0	1	5.77	0	0	0	28.6	165	1	0	2023-01-01	\N	\N
2553	1421	0		0	1	5.77	0	0	0	40.73	235	1	0	2023-01-01	\N	\N
2554	1422	0		0	1	5.77	0	0	0	30.33	175	1	0	2023-01-01	\N	\N
2555	1423	0		0	1	5.77	0	0	0	47.66	275	1	0	2023-01-01	\N	\N
2556	1424	0		0	1	5.77	0	0	0	40.73	235	1	0	2023-01-01	\N	\N
2557	1425	0		0	1	5.77	0	0	0	73.66	425	1	0	2023-01-01	\N	\N
2558	1426	0		0	1	5.77	0	0	0	53.73	310	1	0	2023-01-01	\N	\N
2559	1427	0		0	1	5.77	0	0	0	70.19	405	1	0	2023-01-01	\N	\N
2560	1428	0		0	1	5.77	0	0	0	31.2	180	1	0	2023-01-01	\N	\N
2561	1429	0		0	1	5.77	0	0	0	64.12	370	1	0	2023-01-01	\N	\N
2562	1430	0		0	1	5.77	0	0	0	51.99	300	1	0	2023-01-01	\N	\N
2563	1431	0		0	1	5.77	0	0	0	28.6	165	1	0	2023-01-01	\N	\N
2564	1432	0		0	1	5.77	0	0	0	50.26	290	1	0	2023-01-01	\N	\N
2565	1433	0		0	1	5.77	0	0	0	28.6	165	1	0	2023-01-01	\N	\N
2566	1434	0		0	1	5.77	0	0	0	76.26	440	1	0	2023-01-01	\N	\N
2567	1435	0		0	1	5.77	0	0	0	20.8	120	1	0	2023-01-01	\N	\N
2568	1436	0		0	1	5.77	0	0	0	41.59	240	1	0	2023-01-01	\N	\N
2569	1437	0		0	1	5.77	0	0	0	29.46	170	1	0	2023-01-01	\N	\N
2570	1438	0		0	1	5.77	0	0	0	28.6	165	1	0	2023-01-01	\N	\N
2571	1439	0		0	1	5.77	0	0	0	40.73	235	1	0	2023-01-01	\N	\N
2572	1440	0		0	1	5.77	0	0	0	50.26	290	1	0	2023-01-01	\N	\N
2573	1441	0		0	1	5.77	0	0	0	28.6	165	1	0	2023-01-01	\N	\N
2574	1442	0		0	1	5.77	0	0	0	30.33	175	1	0	2023-01-01	\N	\N
2575	1443	0		0	1	5.77	0	0	0	20.8	120	1	0	2023-01-01	\N	\N
2576	1444	0		0	1	5.77	0	0	0	28.6	165	1	0	2023-01-01	\N	\N
2577	1445	0		0	1	5.77	0	0	0	37.26	215	1	0	2023-01-01	\N	\N
2578	1446	0		0	1	5.77	0	0	0	29.46	170	1	0	2023-01-01	\N	\N
2579	1447	0		0	1	5.77	0	0	0	54.59	315	1	0	2023-01-01	\N	\N
2580	1448	0		0	1	5.77	0	0	0	31.2	180	1	0	2023-01-01	\N	\N
2581	1449	0		0	1	5.77	0	0	0	54.59	315	1	0	2023-01-01	\N	\N
2582	1450	0		0	1	5.77	0	0	0	53.73	310	1	0	2023-01-01	\N	\N
2583	1451	0		0	1	5.77	0	0	0	46.79	270	1	0	2023-01-01	\N	\N
2584	1452	0		0	1	5.77	0	0	0	34.66	200	1	0	2023-01-01	\N	\N
2585	1453	0		0	1	5.77	0	0	0	19.93	115	1	0	2023-01-01	\N	\N
2586	1454	0		0	1	5.77	0	0	0	54.59	315	1	0	2023-01-01	\N	\N
2587	1455	0		0	1	5.77	0	0	0	41.59	240	1	0	2023-01-01	\N	\N
2588	1456	0		0	1	5.77	0	0	0	28.6	165	1	0	2023-01-01	\N	\N
2589	1457	0		0	1	5.77	0	0	0	51.99	300	1	0	2023-01-01	\N	\N
2590	1458	0		0	1	5.77	0	0	0	39.86	230	1	0	2023-01-01	\N	\N
2591	1459	0		0	1	5.77	0	0	0	45.93	265	1	0	2023-01-01	\N	\N
2592	1460	0		0	1	5.77	0	0	0	12.13	70	1	0	2023-01-01	\N	\N
2593	1461	0		0	1	5.77	0	0	0	34.66	200	1	0	2023-01-01	\N	\N
2594	1462	0		0	1	5.77	0	0	0	43.33	250	1	0	2023-01-01	\N	\N
2595	1463	0		0	1	5.77	0	0	0	36.4	210	1	0	2023-01-01	\N	\N
2596	1464	0		0	1	5.77	0	0	0	26	150	1	0	2023-01-01	\N	\N
2597	1465	0		0	1	5.77	0	0	0	30.33	175	1	0	2023-01-01	\N	\N
2598	1466	0		0	1	5.77	0	0	0	28.6	165	1	0	2023-01-01	\N	\N
2599	1467	0		0	1	5.77	0	0	0	28.6	165	1	0	2023-01-01	\N	\N
2600	1468	0		0	1	5.77	0	0	0	54.59	315	1	0	2023-01-01	\N	\N
2601	1469	0		0	1	5.77	0	0	0	21.66	125	1	0	2023-01-01	\N	\N
2603	1119	3		165	1	18	2.970	2.970	165	0	0	5	2	2023-01-09	0	2023-01-09
2604	1257	3		165	1	18	2.970	2.970	165	0	0	5	2	2023-01-09	0	2023-01-09
2605	1245	3		220	1	18	3.960	3.960	220	0	0	5	2	2023-01-09	0	2023-01-09
2606	1294	3		235	1	18	4.230	4.230	235	0	0	5	2	2023-01-09	0	2023-01-09
2607	1278	3		205	1	18	3.690	3.690	205	0	0	5	2	2023-01-10	0	2023-01-10
2608	1402	3		205	1	18	3.690	3.690	205	0	0	5	2	2023-01-10	0	2023-01-10
2609	1371	3		440	1	18	7.920	7.920	440	0	0	5	2	2023-01-10	0	2023-01-11
2610	1105	3		210	1	18	3.780	3.780	210	0	0	5	2	2023-01-10	0	2023-01-11
2611	1243	3		210	1	18	3.780	3.780	210	0	0	5	2	2023-01-10	0	2023-01-11
2612	1455	2	102555482	240	1	18	4.320	4.320	240	0	0	5	2	2023-01-10	28	2023-01-10
2613	1376	2	95948569	60	1	18	1.080	1.080	60	0	0	5	2	2023-01-10	28	2023-01-10
2614	1398	2	95842397	200	1	18	3.600	3.600	200	0	0	5	2	2023-01-10	28	2023-01-10
2615	1343	3		250	1	18	4.500	4.500	250	0	0	5	2	2023-01-11	0	2023-01-11
2616	1462	3		250	1	18	4.500	4.500	250	0	0	5	2	2023-01-11	0	2023-01-11
2617	1367	3		225	1	18	4.050	4.050	225	0	0	5	2	2023-01-11	0	2023-01-11
2618	1471	3		225	1	18	4.050	4.050	225	0	0	5	2	2023-01-11	0	2023-01-11
2619	1472	3		225	1	18	4.050	4.050	225	0	0	5	2	2023-01-11	0	2023-01-11
2620	1288	3		165	1	18	2.970	2.970	165	0	0	5	2	2023-01-11	0	2023-01-11
2621	1261	3		140	1	18	2.520	2.520	140	0	0	5	2	2023-01-11	0	2023-01-11
2622	1382	3		165	1	18	2.970	2.970	165	0	0	5	2	2023-01-11	0	2023-01-11
2623	1473	3		165	1	18	2.970	2.970	165	0	0	5	2	2023-01-11	0	2023-01-11
2624	1474	3		165	1	18	2.970	2.970	165	0	0	5	2	2023-01-11	0	2023-01-11
2625	1173	3		180	1	18	3.240	3.240	180	0	0	5	2	2023-01-12	0	2023-01-12
2626	1309	3		180	1	18	3.240	3.240	180	0	0	5	2	2023-01-12	0	2023-01-12
2627	1428	3		180	1	18	3.240	3.240	180	0	0	5	2	2023-01-12	0	2023-01-12
2628	1439	3		235	1	19	4.465	4.465	235	0	0	5	2	2023-01-13	0	2023-01-13
2629	1297	3		210	1	20	4.200	4.200	210	0	0	5	2	2023-01-17	0	2023-01-17
2631	1470	0		0	1	5.77	0	0	0	43.33	250	5	0	2023-01-17	\N	\N
2632	1470	3		250	1	20	5.000	5.000	250	0	0	5	2	2023-01-17	0	2023-01-17
2633	1320	3		170	1	20	3.400	3.400	170	0	0	5	2	2023-01-17	0	2023-01-17
2634	1369	3		210	1	20	4.200	4.200	210	0	0	5	2	2023-01-17	0	2023-01-17
2635	1460	3		70	1	20	1.400	1.400	70	0	0	5	2	2023-01-19	0	2023-01-19
2636	1147	3		165	1	20	3.300	3.300	165	0	0	5	2	2023-01-20	0	2023-01-20
2637	1125	3		215	1	20	4.300	4.300	215	0	0	5	2	2023-01-20	0	2023-01-20
2638	1475	0		0	1	5.77	0	0	0	31.2	180	5	0	2023-01-20	\N	\N
2639	1328	3		165	1	20	3.300	3.300	165	0	0	5	2	2023-01-20	0	2023-01-20
2640	1111	3		70	1	20	1.400	1.400	70	0	0	5	2	2023-01-20	0	2023-01-20
2641	1165	3		235	1	20	4.700	4.700	235	0	0	5	2	2023-01-20	0	2023-01-20
2642	1210	3		150	1	20	3.000	3.000	150	0	0	5	2	2023-01-20	0	2023-01-20
2643	1164	3		165	1	20	3.300	3.300	165	0	0	5	2	2023-01-20	0	2023-01-20
2644	1344	3		150	1	20	3.000	3.000	150	0	0	5	2	2023-01-20	0	2023-01-20
2645	1250	3		70	1	20	1.400	1.400	70	0	0	5	2	2023-01-20	0	2023-01-20
2646	1300	3		165	1	20	3.300	3.300	165	0	0	5	2	2023-01-20	0	2023-01-20
2647	1301	3		235	1	20	4.700	4.700	235	0	0	5	2	2023-01-20	0	2023-01-20
2648	1404	3		120	1	20	2.400	2.400	120	0	0	5	2	2023-01-20	0	2023-01-20
2649	1097	3		315	1	20	6.300	6.300	315	0	0	5	2	2023-01-21	0	2023-01-21
2650	1349	3		315	1	20	6.300	6.300	315	0	0	5	2	2023-01-21	0	2023-01-21
2651	1468	3		315	1	20	6.300	6.300	315	0	0	5	2	2023-01-21	0	2023-01-21
2652	1383	3		110	1	20	2.200	2.200	110	0	0	5	2	2023-01-23	0	2023-01-23
2653	1442	3		175	1	21	3.675	3.675	175	0	0	5	2	2023-01-25	0	2023-01-25
2654	1413	3		315	1	21	6.615	6.615	315	0	0	5	2	2023-01-25	0	2023-01-25
2655	1203	3		165	1	21	3.465	3.465	165	0	0	5	2	2023-01-25	0	2023-01-25
2656	1337	3		165	1	21	3.465	3.465	165	0	0	5	2	2023-01-25	0	2023-01-25
2657	1157	3		260	1	21	5.460	5.460	260	0	0	5	2	2023-01-27	0	2023-01-27
2658	1430	3		300	1	21	6.300	6.300	300	0	0	5	2	2023-01-31	0	2023-01-31
2659	1476	3		300	1	21	6.300	6.300	300	0	0	5	2	2023-01-31	0	2023-01-31
2660	1400	3		400	1	21	8.400	8.400	400	0	0	5	2	2023-01-31	0	2023-01-31
2661	1194	3		315	1	21	6.615	6.615	315	0	0	5	2	2023-01-31	0	2023-01-31
2662	1331	3		315	1	21	6.615	6.615	315	0	0	5	2	2023-01-31	0	2023-01-31
2663	1447	3		315	1	21	6.615	6.615	315	0	0	5	2	2023-01-31	0	2023-01-31
2664	1200	3		115	1	21	2.415	2.415	115	0	0	5	2	2023-01-31	0	2023-01-31
2665	1335	3		115	1	21	2.415	2.415	115	0	0	5	2	2023-01-31	0	2023-01-31
2666	1453	3		115	1	21	2.415	2.415	115	0	0	5	2	2023-01-31	0	2023-01-31
2667	1373	3		165	1	21	3.465	3.465	165	0	0	5	2	2023-01-31	0	2023-01-31
2668	1477	0		0	1	5.77	0	0	0	43.33	250	5	0	2023-02-01	\N	\N
2669	1478	0		0	1	5.77	0	0	0	28.6	165	5	0	2023-02-01	\N	\N
2670	1479	0		0	1	5.77	0	0	0	28.6	165	5	0	2023-02-01	\N	\N
2671	1480	0		0	1	5.77	0	0	0	40.73	235	5	0	2023-02-01	\N	\N
2672	1481	0		0	1	5.77	0	0	0	36.4	210	5	0	2023-02-01	\N	\N
2673	1482	0		0	1	5.77	0	0	0	28.6	165	5	0	2023-02-01	\N	\N
2674	1483	0		0	1	5.77	0	0	0	76.26	440	5	0	2023-02-01	\N	\N
2675	1484	0		0	1	5.77	0	0	0	38.13	220	5	0	2023-02-01	\N	\N
2676	1485	0		0	1	5.77	0	0	0	28.6	165	5	0	2023-02-01	\N	\N
2677	1486	0		0	1	5.77	0	0	0	38.13	220	5	0	2023-02-01	\N	\N
2678	1487	0		0	1	5.77	0	0	0	9.53	55	5	0	2023-02-01	\N	\N
2679	1488	0		0	1	5.77	0	0	0	10.4	60	5	0	2023-02-01	\N	\N
2680	1489	0		0	1	5.77	0	0	0	12.13	70	5	0	2023-02-01	\N	\N
2681	1490	0		0	1	5.77	0	0	0	9.53	55	5	0	2023-02-01	\N	\N
2682	1491	0		0	1	5.77	0	0	0	50.26	290	5	0	2023-02-01	\N	\N
2683	1492	0		0	1	5.77	0	0	0	28.6	165	5	0	2023-02-01	\N	\N
2684	1493	0		0	1	5.77	0	0	0	28.6	165	5	0	2023-02-01	\N	\N
2685	1494	0		0	1	5.77	0	0	0	19.06	110	5	0	2023-02-01	\N	\N
2686	1495	0		0	1	5.77	0	0	0	28.6	165	5	0	2023-02-01	\N	\N
2687	1496	0		0	1	5.77	0	0	0	28.6	165	5	0	2023-02-01	\N	\N
2688	1497	0		0	1	5.77	0	0	0	36.4	210	5	0	2023-02-01	\N	\N
2689	1498	0		0	1	5.77	0	0	0	62.39	360	5	0	2023-02-01	\N	\N
2690	1499	0		0	1	5.77	0	0	0	24.26	140	5	0	2023-02-01	\N	\N
2691	1500	0		0	1	5.77	0	0	0	28.6	165	5	0	2023-02-01	\N	\N
2692	1501	0		0	1	5.77	0	0	0	37.26	215	5	0	2023-02-01	\N	\N
2693	1502	0		0	1	5.77	0	0	0	32.06	185	5	0	2023-02-01	\N	\N
2694	1503	0		0	1	5.77	0	0	0	37.26	215	5	0	2023-02-01	\N	\N
2695	1504	0		0	1	5.77	0	0	0	28.6	165	5	0	2023-02-01	\N	\N
2696	1505	0		0	1	5.77	0	0	0	62.39	360	5	0	2023-02-01	\N	\N
2697	1506	0		0	1	5.77	0	0	0	30.33	175	5	0	2023-02-01	\N	\N
2698	1507	0		0	1	5.77	0	0	0	38.99	225	5	0	2023-02-01	\N	\N
2699	1508	0		0	1	5.77	0	0	0	28.6	165	5	0	2023-02-01	\N	\N
2700	1509	0		0	1	5.77	0	0	0	99.65	575	5	0	2023-02-01	\N	\N
2701	1510	0		0	1	5.77	0	0	0	34.66	200	5	0	2023-02-01	\N	\N
2702	1511	0		0	1	5.77	0	0	0	17.33	100	5	0	2023-02-01	\N	\N
2703	1512	0		0	1	5.77	0	0	0	69.32	400	5	0	2023-02-01	\N	\N
2704	1513	0		0	1	5.77	0	0	0	38.99	225	5	0	2023-02-01	\N	\N
2705	1514	0		0	1	5.77	0	0	0	35.53	205	5	0	2023-02-01	\N	\N
2706	1515	0		0	1	5.77	0	0	0	17.33	100	5	0	2023-02-01	\N	\N
2707	1516	0		0	1	5.77	0	0	0	20.8	120	5	0	2023-02-01	\N	\N
2708	1517	0		0	1	5.77	0	0	0	28.6	165	5	0	2023-02-01	\N	\N
2709	1518	0		0	1	5.77	0	0	0	28.6	165	5	0	2023-02-01	\N	\N
2710	1519	0		0	1	5.77	0	0	0	28.6	165	5	0	2023-02-01	\N	\N
2711	1520	0		0	1	5.77	0	0	0	21.66	125	5	0	2023-02-01	\N	\N
2712	1521	0		0	1	5.77	0	0	0	51.99	300	5	0	2023-02-01	\N	\N
2713	1522	0		0	1	5.77	0	0	0	28.6	165	5	0	2023-02-01	\N	\N
2714	1523	0		0	1	5.77	0	0	0	60.66	350	5	0	2023-02-01	\N	\N
2715	1524	0		0	1	5.77	0	0	0	31.2	180	5	0	2023-02-01	\N	\N
2716	1525	0		0	1	5.77	0	0	0	54.59	315	5	0	2023-02-01	\N	\N
2717	1526	0		0	1	5.77	0	0	0	28.6	165	5	0	2023-02-01	\N	\N
2718	1527	0		0	1	5.77	0	0	0	45.06	260	5	0	2023-02-01	\N	\N
2719	1528	0		0	1	5.77	0	0	0	40.73	235	5	0	2023-02-01	\N	\N
2720	1529	0		0	1	5.77	0	0	0	41.59	240	5	0	2023-02-01	\N	\N
2721	1530	0		0	1	5.77	0	0	0	36.4	210	5	0	2023-02-01	\N	\N
2722	1531	0		0	1	5.77	0	0	0	40.73	235	5	0	2023-02-01	\N	\N
2723	1532	0		0	1	5.77	0	0	0	31.2	180	5	0	2023-02-01	\N	\N
2724	1533	0		0	1	5.77	0	0	0	28.6	165	5	0	2023-02-01	\N	\N
2725	1534	0		0	1	5.77	0	0	0	40.73	235	5	0	2023-02-01	\N	\N
2726	1535	0		0	1	5.77	0	0	0	30.33	175	5	0	2023-02-01	\N	\N
2727	1536	0		0	1	5.77	0	0	0	47.66	275	5	0	2023-02-01	\N	\N
2728	1537	0		0	1	5.77	0	0	0	40.73	235	5	0	2023-02-01	\N	\N
2729	1538	0		0	1	5.77	0	0	0	73.66	425	5	0	2023-02-01	\N	\N
2730	1539	0		0	1	5.77	0	0	0	53.73	310	5	0	2023-02-01	\N	\N
2731	1540	0		0	1	5.77	0	0	0	70.19	405	5	0	2023-02-01	\N	\N
2732	1541	0		0	1	5.77	0	0	0	31.2	180	5	0	2023-02-01	\N	\N
2733	1542	0		0	1	5.77	0	0	0	64.12	370	5	0	2023-02-01	\N	\N
2734	1543	0		0	1	5.77	0	0	0	28.6	165	5	0	2023-02-01	\N	\N
2735	1544	0		0	1	5.77	0	0	0	50.26	290	5	0	2023-02-01	\N	\N
2736	1545	0		0	1	5.77	0	0	0	28.6	165	5	0	2023-02-01	\N	\N
2737	1546	0		0	1	5.77	0	0	0	76.26	440	5	0	2023-02-01	\N	\N
2738	1547	0		0	1	5.77	0	0	0	20.8	120	5	0	2023-02-01	\N	\N
2739	1548	0		0	1	5.77	0	0	0	41.59	240	5	0	2023-02-01	\N	\N
2740	1549	0		0	1	5.77	0	0	0	29.46	170	5	0	2023-02-01	\N	\N
2741	1550	0		0	1	5.77	0	0	0	28.6	165	5	0	2023-02-01	\N	\N
2742	1551	0		0	1	5.77	0	0	0	40.73	235	5	0	2023-02-01	\N	\N
2743	1552	0		0	1	5.77	0	0	0	50.26	290	5	0	2023-02-01	\N	\N
2744	1553	0		0	1	5.77	0	0	0	28.6	165	5	0	2023-02-01	\N	\N
2745	1554	0		0	1	5.77	0	0	0	30.33	175	5	0	2023-02-01	\N	\N
2746	1555	0		0	1	5.77	0	0	0	28.6	165	5	0	2023-02-01	\N	\N
2747	1556	0		0	1	5.77	0	0	0	20.8	120	5	0	2023-02-01	\N	\N
2748	1557	0		0	1	5.77	0	0	0	28.6	165	5	0	2023-02-01	\N	\N
2749	1558	0		0	1	5.77	0	0	0	37.26	215	5	0	2023-02-01	\N	\N
2750	1559	0		0	1	5.77	0	0	0	29.46	170	5	0	2023-02-01	\N	\N
2752	1561	0		0	1	5.77	0	0	0	31.2	180	5	0	2023-02-01	\N	\N
2753	1562	0		0	1	5.77	0	0	0	54.59	315	5	0	2023-02-01	\N	\N
2754	1563	0		0	1	5.77	0	0	0	53.73	310	5	0	2023-02-01	\N	\N
2756	1565	0		0	1	5.77	0	0	0	34.66	200	5	0	2023-02-01	\N	\N
2758	1567	0		0	1	5.77	0	0	0	54.59	315	5	0	2023-02-01	\N	\N
2759	1568	0		0	1	5.77	0	0	0	41.59	240	5	0	2023-02-01	\N	\N
2760	1569	0		0	1	5.77	0	0	0	28.6	165	5	0	2023-02-01	\N	\N
2761	1570	0		0	1	5.77	0	0	0	51.99	300	5	0	2023-02-01	\N	\N
2762	1571	0		0	1	5.77	0	0	0	39.86	230	5	0	2023-02-01	\N	\N
2763	1572	0		0	1	5.77	0	0	0	45.93	265	5	0	2023-02-01	\N	\N
2764	1573	0		0	1	5.77	0	0	0	12.13	70	5	0	2023-02-01	\N	\N
2765	1574	0		0	1	5.77	0	0	0	34.66	200	5	0	2023-02-01	\N	\N
2766	1575	0		0	1	5.77	0	0	0	43.33	250	5	0	2023-02-01	\N	\N
2767	1576	0		0	1	5.77	0	0	0	36.4	210	5	0	2023-02-01	\N	\N
2768	1577	0		0	1	5.77	0	0	0	26	150	5	0	2023-02-01	\N	\N
2769	1578	0		0	1	5.77	0	0	0	30.33	175	5	0	2023-02-01	\N	\N
2770	1579	0		0	1	5.77	0	0	0	28.6	165	5	0	2023-02-01	\N	\N
2771	1580	0		0	1	5.77	0	0	0	28.6	165	5	0	2023-02-01	\N	\N
2772	1581	0		0	1	5.77	0	0	0	54.59	315	5	0	2023-02-01	\N	\N
2773	1582	0		0	1	5.77	0	0	0	21.66	125	5	0	2023-02-01	\N	\N
2774	1583	0		0	1	5.77	0	0	0	43.33	250	5	0	2023-02-01	\N	\N
2775	1551	3		235	1	22	5.170	5.170	235	0	0	5	2	2023-02-01	0	2023-02-01
2776	1020	6		225	1	5.77	1.298,25	1.298,25	225	0	0	5	2	2023-02-01	0	2023-02-01
2777	1141	6		225	1	5.77	1.298,25	1.298,25	225	0	0	5	2	2023-02-01	0	2023-02-01
2779	1277	0		0	1	5.77	0	0	0	38.99	225	5	0	2023-02-01	\N	\N
2780	1277	6		225	1	5.77	1.298,25	1.298,25	225	0	0	5	2	2023-02-01	0	2023-02-01
2781	1401	6		225	1	5.77	1.298,25	1.298,25	225	0	0	5	2	2023-02-01	0	2023-02-01
2782	1513	6		225	1	5.77	1.298,25	1.298,25	225	0	0	5	2	2023-02-01	0	2023-02-01
2783	727	6		165	1	5.77	952,05	952,05	165	0	0	5	2	2023-02-01	0	2023-02-01
2784	850	6		165	1	5.77	952,05	952,05	165	0	0	5	2	2023-02-01	0	2023-02-01
2785	985	6		165	1	5.77	952,05	952,05	165	0	0	5	2	2023-02-01	0	2023-02-01
2786	1106	6		165	1	5.77	952,05	952,05	165	0	0	5	2	2023-02-01	0	2023-02-01
2787	1244	6		165	1	5.77	952,05	952,05	165	0	0	5	2	2023-02-01	0	2023-02-01
2788	1370	6		165	1	5.77	952,05	952,05	165	0	0	5	2	2023-02-01	0	2023-02-01
2789	1482	6		165	1	5.77	952,05	952,05	165	0	0	5	2	2023-02-01	0	2023-02-01
2790	1329	3		215	1	21	4.515	4.515	215	0	0	5	2	2023-02-02	0	2023-02-02
2791	1445	6		215	1	5.77	1.240,55	1.240,55	215	0	0	5	2	2023-02-02	0	2023-02-02
2792	1558	6		215	1	5.77	1.240,55	1.240,55	215	0	0	5	2	2023-02-02	0	2023-02-02
2793	1412	3		180	1	21	3.780	3.780	180	0	0	5	2	2023-02-02	0	2023-02-02
2794	1241	2	110706125	165	1	21	3.465	3.465	165	0	0	5	2	2023-02-02	28	2023-02-01
2795	1531	2	12301082	235	1	21	4.935	4.935	235	0	0	5	2	2023-02-02	28	2023-02-02
2796	565	6		120	1	5.77	692,4	692,4	120	0	0	5	2	2023-02-02	0	2023-02-02
2797	685	6		120	1	5.77	692,4	692,4	120	0	0	5	2	2023-02-02	0	2023-02-02
2798	805	6		120	1	5.77	692,4	692,4	120	0	0	5	2	2023-02-02	0	2023-02-02
2799	927	6		120	1	5.77	692,4	692,4	120	0	0	5	2	2023-02-02	0	2023-02-02
2800	1061	6		120	1	5.77	692,4	692,4	120	0	0	5	2	2023-02-02	0	2023-02-02
2801	1182	6		120	1	5.77	692,4	692,4	120	0	0	5	2	2023-02-02	0	2023-02-02
2802	1318	6		120	1	5.77	692,4	692,4	120	0	0	5	2	2023-02-02	0	2023-02-02
2803	1435	6		120	1	5.77	692,4	692,4	120	0	0	5	2	2023-02-02	0	2023-02-02
2804	1547	6		120	1	5.77	692,4	692,4	120	0	0	5	2	2023-02-02	0	2023-02-02
2805	1387	3		360	1	22	7.920	7.920	360	0	0	5	2	2023-02-03	0	2023-02-03
2806	865	3		210	1	22	4.620	4.620	210	0	0	5	2	2023-02-03	0	2023-02-03
2807	1000	3		210	1	21	4.410	4.410	210	0	0	5	2	2023-02-03	0	2023-02-03
2808	1121	3		210	1	22	4.620	4.620	210	0	0	5	2	2023-02-03	0	2023-02-03
2809	1259	3		210	1	21	4.410	1.211,7	210	0	0	5	2	2023-02-03	0	2023-02-03
2810	1386	3		210	1	21	4.410	4.410	210	0	0	5	2	2023-02-03	0	2023-02-03
2811	1497	3		210	1	21	4.410	4.410	210	0	0	5	2	2023-02-03	0	2023-02-03
2812	1584	3		210	1	21	4.410	4.410	210	0	0	5	2	2023-02-03	0	2023-02-03
2813	1585	3		210	1	21	4.410	4.410	210	0	0	5	2	2023-02-03	0	2023-02-03
2815	1586	0		0	1	21	0	0	0	10	210	5	0	2023-02-03	\N	\N
2816	1587	3		210	1	21	4.410	4.410	210	0	0	5	2	2023-02-03	0	2023-02-03
2817	1586	3		210	1	21	4.410	4.410	210	0	0	5	2	2023-02-03	0	2023-02-03
2818	1187	3		290	1	21	6.090	6.090	290	0	0	5	2	2023-02-03	0	2023-02-03
2819	1323	3		290	1	21	6.090	6.090	290	0	0	5	2	2023-02-03	0	2023-02-03
2820	1258	3		165	1	21	3.465	3.465	165	0	0	5	2	2023-02-03	0	2023-02-03
2821	1252	3		290	1	21	6.090	6.090	290	0	0	5	2	2023-02-03	0	2023-02-03
2822	1340	3		265	1	21	5.565	5.565	265	0	0	5	2	2023-02-03	0	2023-02-03
2823	1385	3		165	1	21	3.465	3.465	165	0	0	5	2	2023-02-03	0	2023-02-03
2824	1496	3		165	1	21	3.465	3.465	165	0	0	5	2	2023-02-03	0	2023-02-03
2825	1479	3		165	1	22	3.630	3.630	165	0	0	5	2	2023-02-06	0	2023-02-06
2826	1503	3		215	1	22	4.730	4.730	215	0	0	5	2	2023-02-06	0	2023-02-06
2827	1488	2	152338074	60	1	22	1.320	1.320	60	0	0	5	2	2023-02-06	28	2023-02-03
2828	1510	2	151714729	200	1	22	4.400	4.400	200	0	0	5	2	2023-02-06	28	2023-02-03
2829	1446	3		170	1	22	3.740	3.740	170	0	0	5	2	2023-02-06	0	2023-02-06
2830	1458	3		230	1	22	5.060	5.060	230	0	0	5	2	2023-02-07	0	2023-02-07
2831	1571	3		230	1	22	5.060	5.060	230	0	0	5	2	2023-02-07	0	2023-02-07
2832	1409	3		300	1	22	6.600	6.600	300	0	0	5	2	2023-02-07	0	2023-02-07
2833	1262	0		0	1	5.77	0	0	0	28.6	165	5	0	2023-02-07	\N	\N
2834	1262	3		165	1	24	3.960	3.630	165	0	0	5	2	2023-02-07	0	2023-02-07
2835	1389	3		165	1	24	3.960	3.960	165	0	0	5	2	2023-02-07	0	2023-02-07
2836	1388	3		140	1	24	3.360	3.360	140	0	0	5	2	2023-02-08	0	2023-02-08
2837	1410	3		165	1	24	3.960	3.960	165	0	0	5	2	2023-02-08	0	2023-02-08
2838	1422	3		175	1	24	4.200	4.200	175	0	0	5	2	2023-02-08	0	2023-02-08
2839	1456	3		165	1	24	3.960	3.960	165	0	0	5	2	2023-02-08	0	2023-02-08
2840	1569	3		165	1	24	3.960	3.960	165	0	0	5	2	2023-02-08	0	2023-02-08
2841	1431	3		165	1	24	3.960	3.960	165	0	0	5	2	2023-02-08	0	2023-02-08
2842	1146	3		165	1	24	3.960	3.960	165	0	0	5	2	2023-02-09	0	2023-02-09
2843	1282	3		165	1	24	3.960	3.960	165	0	0	5	2	2023-02-09	0	2023-02-09
2844	1467	3		165	1	24	3.960	3.960	165	0	0	5	2	2023-02-10	0	2023-02-10
2845	1183	3		240	1	24	5.760	5.760	240	0	0	5	2	2023-02-11	0	2023-02-11
2846	1319	3		240	1	24	5.760	5.760	240	0	0	5	2	2023-02-11	0	2023-02-11
2847	1436	3		240	1	24	5.760	5.760	240	0	0	5	2	2023-02-11	0	2023-02-11
2848	1548	3		240	1	24	5.760	5.760	240	0	0	5	2	2023-02-11	0	2023-02-11
2849	1372	3		220	1	24	5.280	5.280	220	0	0	5	2	2023-02-12	0	2023-02-12
2850	1384	3		165	1	24	3.960	3.960	165	0	0	5	2	2023-02-12	0	2023-02-12
2851	1495	3		165	1	24	3.960	3.960	165	0	0	5	2	2023-02-12	0	2023-02-12
2852	1588	3		165	1	24	3.960	3.960	165	0	0	5	2	2023-02-13	0	2023-02-13
2853	1589	3		165	1	24	3.960	3.960	165	0	0	5	2	2023-02-13	0	2023-02-13
2854	1590	3		165	1	24	3.960	3.960	165	0	0	5	2	2023-02-13	0	2023-02-13
2855	1272	3		175	1	24	4.200	4.200	175	0	0	5	2	2023-02-14	0	2023-02-14
2856	1394	3		175	1	24	4.200	4.200	175	0	0	5	2	2023-02-14	0	2023-02-14
2857	1449	3		315	1	24	7.560	7.560	315	0	0	5	2	2023-02-14	0	2023-02-14
2858	1562	3		315	1	24	7.560	7.560	315	0	0	5	2	2023-02-14	0	2023-02-14
2859	1374	3		220	1	24	5.280	5.280	220	0	0	5	2	2023-02-14	0	2023-02-14
2860	1486	3		220	1	24	5.280	5.280	220	0	0	5	2	2023-02-14	0	2023-02-14
2861	1411	3		350	1	24	8.400	8.400	350	0	0	5	2	2023-02-14	0	2023-02-14
2862	1523	3		350	1	24	8.400	8.400	350	0	0	5	2	2023-02-14	0	2023-02-14
2863	1457	3		300	1	24	7.200	7.200	300	0	0	5	2	2023-02-16	0	2023-02-16
2864	1570	3		300	1	24	7.200	7.200	300	0	0	5	2	2023-02-16	0	2023-02-16
2865	1403	3		100	1	24	2.400	2.400	100	0	0	5	2	2023-02-16	0	2023-02-16
2866	1515	3		100	1	24	2.400	2.400	100	0	0	5	2	2023-02-16	0	2023-02-16
2867	1441	3		165	1	24	3.960	3.960	165	0	0	5	2	2023-02-16	0	2023-02-16
2868	1553	3		165	1	24	3.960	3.960	165	0	0	5	2	2023-02-16	0	2023-02-16
2869	1393	3		360	1	24	8.640	8.640	360	0	0	5	2	2023-02-17	0	2023-02-17
2870	1444	3		165	1	24	3.960	3.960	165	0	0	5	2	2023-02-17	0	2023-02-17
2871	1391	3		185	1	24	4.440	4.440	185	0	0	5	2	2023-02-19	0	2023-02-19
2872	1502	3		185	1	24	4.440	4.440	185	0	0	5	2	2023-02-19	0	2023-02-19
2873	1591	0		0	1	5.77	0	0	0	31.2	180	5	0	2023-02-20	\N	\N
2874	1416	3		235	1	24	5.640	5.640	235	0	0	5	2	2023-02-22	0	2023-02-22
2875	1283	3		165	1	24	3.960	3.960	165	0	0	5	2	2023-02-22	0	2023-02-22
2876	1406	3		165	1	24	3.960	3.960	165	0	0	5	2	2023-02-22	0	2023-02-22
2877	1518	3		165	1	24	3.960	3.960	165	0	0	5	2	2023-02-22	0	2023-02-22
2878	1481	3		210	1	24	5.040	5.040	210	0	0	5	2	2023-02-22	0	2023-02-22
2879	1450	3		310	1	24	7.440	7.440	310	0	0	5	2	2023-02-22	0	2023-02-22
2880	1563	3		310	1	24	7.440	7.440	310	0	0	5	2	2023-02-22	0	2023-02-22
2881	1452	3		200	1	24	4.800	4.800	200	0	0	5	2	2023-02-22	0	2023-02-22
2882	1565	3		200	1	24	4.800	4.800	200	0	0	5	2	2023-02-22	0	2023-02-22
2883	1308	3		405	1	24	9.720	9.720	405	0	0	5	2	2023-02-22	0	2023-02-22
2884	1242	3		235	1	24	5.640	5.640	235	0	0	5	2	2023-02-22	0	2023-02-22
2885	1368	3		235	1	24	5.640	5.640	235	0	0	5	2	2023-02-22	0	2023-02-22
2886	1480	3		235	1	24	5.640	5.640	235	0	0	5	2	2023-02-22	0	2023-02-22
2887	1299	3		180	1	24	4.320	4.320	180	0	0	5	2	2023-02-22	0	2023-02-22
2888	1419	3		180	1	24	4.320	4.320	180	0	0	5	2	2023-02-22	0	2023-02-22
2889	1532	3		180	1	24	4.320	4.320	180	0	0	5	2	2023-02-22	0	2023-02-22
2890	1332	3		180	1	24	4.320	4.320	180	0	0	5	2	2023-02-22	0	2023-02-22
2891	1448	3		180	1	24	4.320	4.320	180	0	0	5	2	2023-02-22	0	2023-02-22
2892	1561	3		180	1	24	4.320	4.320	180	0	0	5	2	2023-02-22	0	2023-02-22
2893	1248	3		55	1	24	1.320	1.320	55	0	0	5	2	2023-02-22	0	2023-02-22
2894	1375	3		55	1	24	1.320	1.320	55	0	0	5	2	2023-02-22	0	2023-02-22
2895	1573	3		70	1	24	1.680	1.680	70	0	0	5	2	2023-02-23	0	2023-02-23
2896	1429	6		370	1	5.77	2.134,9	2.134,9	370	0	0	5	2	2023-02-23	0	2023-02-23
2897	1542	6		370	1	5.77	2.134,9	2.134,9	370	0	0	5	2	2023-02-23	0	2023-02-23
2898	1463	6		210	1	5.77	1.211,7	1.211,7	210	0	0	5	2	2023-02-23	0	2023-02-23
2899	1576	6		210	1	5.77	1.211,7	1.211,7	210	0	0	5	2	2023-02-23	0	2023-02-23
2900	1437	3		170	1	24	4.080	4.080	170	0	0	5	2	2023-02-23	0	2023-02-23
2901	1592	0		0	1	5.77	0	0	0	55.46	320	5	0	2023-02-24	\N	\N
2902	1555	3		165	1	25	4.125	4.125	165	0	0	5	2	2023-02-24	0	2023-02-24
2903	1593	3		165	1	25	4.125	4.125	165	0	0	5	2	2023-02-24	0	2023-02-24
2904	1594	3		235	1	24	5.640	5.640	235	0	0	5	2	2023-02-27	0	2023-02-27
2905	1521	3		300	1	24	7.200	7.200	300	0	0	5	2	2023-02-27	0	2023-02-27
2906	1366	2	101159879	165	1	25	4.125	4.125	165	0	0	5	2	2023-02-27	28	2023-02-27
2907	1475	3		180	1	5.77	1.038,6	1.038,6	180	0	0	5	2	2023-02-27	0	2023-02-27
2908	1381	2	112450021	165	1	25	4.125	4.125	165	0	0	5	2	2023-02-27	28	2023-02-27
2909	1493	2	112450021	165	1	25	4.125	4.125	165	0	0	5	2	2023-02-27	28	2023-02-27
2910	1424	2	123141957	235	1	25	5.875	5.875	235	0	0	5	2	2023-02-27	28	2023-02-09
2911	1537	2	123141957	235	1	25	5.875	5.875	235	0	0	5	2	2023-02-27	28	2023-02-09
2912	1293	3		260	1	25	6.500	6.500	260	0	0	5	2	2023-02-28	0	2023-02-28
2913	1415	3		260	1	24	6.240	6.240	260	0	0	5	2	2023-02-28	0	2023-02-28
2914	1595	0		0	1	5.77	0	0	0	43.33	250	5	0	2023-03-01	\N	\N
2915	1596	0		0	1	5.77	0	0	0	28.6	165	5	0	2023-03-01	\N	\N
2916	1597	0		0	1	5.77	0	0	0	28.6	165	5	0	2023-03-01	\N	\N
2917	1598	0		0	1	5.77	0	0	0	40.73	235	5	0	2023-03-01	\N	\N
2918	1599	0		0	1	5.77	0	0	0	36.4	210	5	0	2023-03-01	\N	\N
2919	1600	0		0	1	5.77	0	0	0	76.26	440	5	0	2023-03-01	\N	\N
2920	1601	0		0	1	5.77	0	0	0	38.13	220	5	0	2023-03-01	\N	\N
2921	1602	0		0	1	5.77	0	0	0	28.6	165	5	0	2023-03-01	\N	\N
2922	1603	0		0	1	5.77	0	0	0	38.13	220	5	0	2023-03-01	\N	\N
2923	1604	0		0	1	5.77	0	0	0	9.53	55	5	0	2023-03-01	\N	\N
2924	1605	0		0	1	5.77	0	0	0	10.4	60	5	0	2023-03-01	\N	\N
2925	1606	0		0	1	5.77	0	0	0	12.13	70	5	0	2023-03-01	\N	\N
2926	1607	0		0	1	5.77	0	0	0	9.53	55	5	0	2023-03-01	\N	\N
2927	1608	0		0	1	5.77	0	0	0	50.26	290	5	0	2023-03-01	\N	\N
2928	1609	0		0	1	5.77	0	0	0	28.6	165	5	0	2023-03-01	\N	\N
2929	1610	0		0	1	5.77	0	0	0	28.6	165	5	0	2023-03-01	\N	\N
2930	1611	0		0	1	5.77	0	0	0	19.06	110	5	0	2023-03-01	\N	\N
2931	1612	0		0	1	5.77	0	0	0	28.6	165	5	0	2023-03-01	\N	\N
2932	1613	0		0	1	5.77	0	0	0	28.6	165	5	0	2023-03-01	\N	\N
2933	1614	0		0	1	5.77	0	0	0	62.39	360	5	0	2023-03-01	\N	\N
2934	1615	0		0	1	5.77	0	0	0	24.26	140	5	0	2023-03-01	\N	\N
2936	1617	0		0	1	5.77	0	0	0	37.26	215	5	0	2023-03-01	\N	\N
2937	1618	0		0	1	5.77	0	0	0	63.26	365	5	0	2023-03-01	\N	\N
2938	1619	0		0	1	5.77	0	0	0	32.06	185	5	0	2023-03-01	\N	\N
2939	1620	0		0	1	5.77	0	0	0	37.26	215	5	0	2023-03-01	\N	\N
2940	1621	0		0	1	5.77	0	0	0	28.6	165	5	0	2023-03-01	\N	\N
2941	1622	0		0	1	5.77	0	0	0	62.39	360	5	0	2023-03-01	\N	\N
2942	1623	0		0	1	5.77	0	0	0	30.33	175	5	0	2023-03-01	\N	\N
2943	1624	0		0	1	5.77	0	0	0	38.99	225	5	0	2023-03-01	\N	\N
2944	1625	0		0	1	5.77	0	0	0	28.6	165	5	0	2023-03-01	\N	\N
2945	1626	0		0	1	5.77	0	0	0	99.65	575	5	0	2023-03-01	\N	\N
2946	1627	0		0	1	5.77	0	0	0	34.66	200	5	0	2023-03-01	\N	\N
2947	1628	0		0	1	5.77	0	0	0	17.33	100	5	0	2023-03-01	\N	\N
2948	1629	0		0	1	5.77	0	0	0	69.32	400	5	0	2023-03-01	\N	\N
2949	1630	0		0	1	5.77	0	0	0	35.53	205	5	0	2023-03-01	\N	\N
2950	1631	0		0	1	5.77	0	0	0	17.33	100	5	0	2023-03-01	\N	\N
2951	1632	0		0	1	5.77	0	0	0	20.8	120	5	0	2023-03-01	\N	\N
2952	1633	0		0	1	5.77	0	0	0	28.6	165	5	0	2023-03-01	\N	\N
2953	1634	0		0	1	5.77	0	0	0	28.6	165	5	0	2023-03-01	\N	\N
2954	1635	0		0	1	5.77	0	0	0	28.6	165	5	0	2023-03-01	\N	\N
2955	1636	0		0	1	5.77	0	0	0	21.66	125	5	0	2023-03-01	\N	\N
2956	1637	0		0	1	5.77	0	0	0	51.99	300	5	0	2023-03-01	\N	\N
2957	1638	0		0	1	5.77	0	0	0	28.6	165	5	0	2023-03-01	\N	\N
2958	1639	0		0	1	5.77	0	0	0	60.66	350	5	0	2023-03-01	\N	\N
2959	1640	0		0	1	5.77	0	0	0	31.2	180	5	0	2023-03-01	\N	\N
2960	1641	0		0	1	5.77	0	0	0	54.59	315	5	0	2023-03-01	\N	\N
2961	1642	0		0	1	5.77	0	0	0	28.6	165	5	0	2023-03-01	\N	\N
2962	1643	0		0	1	5.77	0	0	0	45.06	260	5	0	2023-03-01	\N	\N
2963	1644	0		0	1	5.77	0	0	0	40.73	235	5	0	2023-03-01	\N	\N
2964	1645	0		0	1	5.77	0	0	0	41.59	240	5	0	2023-03-01	\N	\N
2965	1646	0		0	1	5.77	0	0	0	36.4	210	5	0	2023-03-01	\N	\N
2966	1647	0		0	1	5.77	0	0	0	31.2	180	5	0	2023-03-01	\N	\N
2967	1648	0		0	1	5.77	0	0	0	28.6	165	5	0	2023-03-01	\N	\N
2968	1649	0		0	1	5.77	0	0	0	40.73	235	5	0	2023-03-01	\N	\N
2969	1650	0		0	1	5.77	0	0	0	30.33	175	5	0	2023-03-01	\N	\N
2970	1651	0		0	1	5.77	0	0	0	47.66	275	5	0	2023-03-01	\N	\N
2971	1652	0		0	1	5.77	0	0	0	40.73	235	5	0	2023-03-01	\N	\N
2972	1653	0		0	1	5.77	0	0	0	73.66	425	5	0	2023-03-01	\N	\N
2973	1654	0		0	1	5.77	0	0	0	53.73	310	5	0	2023-03-01	\N	\N
2974	1655	0		0	1	5.77	0	0	0	70.19	405	5	0	2023-03-01	\N	\N
2975	1656	0		0	1	5.77	0	0	0	31.2	180	5	0	2023-03-01	\N	\N
2976	1657	0		0	1	5.77	0	0	0	51.99	300	5	0	2023-03-01	\N	\N
2977	1658	0		0	1	5.77	0	0	0	28.6	165	5	0	2023-03-01	\N	\N
2978	1659	0		0	1	5.77	0	0	0	50.26	290	5	0	2023-03-01	\N	\N
2979	1660	0		0	1	5.77	0	0	0	28.6	165	5	0	2023-03-01	\N	\N
2980	1661	0		0	1	5.77	0	0	0	76.26	440	5	0	2023-03-01	\N	\N
2981	1662	0		0	1	5.77	0	0	0	28.6	165	5	0	2023-03-01	\N	\N
2982	1663	0		0	1	5.77	0	0	0	41.59	240	5	0	2023-03-01	\N	\N
2983	1664	0		0	1	5.77	0	0	0	29.46	170	5	0	2023-03-01	\N	\N
2984	1665	0		0	1	5.77	0	0	0	28.6	165	5	0	2023-03-01	\N	\N
2985	1666	0		0	1	5.77	0	0	0	40.73	235	5	0	2023-03-01	\N	\N
2986	1667	0		0	1	5.77	0	0	0	50.26	290	5	0	2023-03-01	\N	\N
2987	1668	0		0	1	5.77	0	0	0	28.6	165	5	0	2023-03-01	\N	\N
2988	1669	0		0	1	5.77	0	0	0	30.33	175	5	0	2023-03-01	\N	\N
2989	1670	0		0	1	5.77	0	0	0	20.8	120	5	0	2023-03-01	\N	\N
2990	1671	0		0	1	5.77	0	0	0	28.6	165	5	0	2023-03-01	\N	\N
2991	1672	0		0	1	5.77	0	0	0	29.46	170	5	0	2023-03-01	\N	\N
2993	1674	0		0	1	5.77	0	0	0	31.2	180	5	0	2023-03-01	\N	\N
2994	1675	0		0	1	5.77	0	0	0	54.59	315	5	0	2023-03-01	\N	\N
2995	1676	0		0	1	5.77	0	0	0	53.73	310	5	0	2023-03-01	\N	\N
2996	1677	0		0	1	5.77	0	0	0	46.79	270	5	0	2023-03-01	\N	\N
2997	1678	0		0	1	5.77	0	0	0	34.66	200	5	0	2023-03-01	\N	\N
2999	1680	0		0	1	5.77	0	0	0	54.59	315	5	0	2023-03-01	\N	\N
3000	1681	0		0	1	5.77	0	0	0	41.59	240	5	0	2023-03-01	\N	\N
3001	1682	0		0	1	5.77	0	0	0	28.6	165	5	0	2023-03-01	\N	\N
3002	1683	0		0	1	5.77	0	0	0	51.99	300	5	0	2023-03-01	\N	\N
3003	1684	0		0	1	5.77	0	0	0	39.86	230	5	0	2023-03-01	\N	\N
3004	1685	0		0	1	5.77	0	0	0	45.93	265	5	0	2023-03-01	\N	\N
3005	1686	0		0	1	5.77	0	0	0	12.13	70	5	0	2023-03-01	\N	\N
3006	1687	0		0	1	5.77	0	0	0	34.66	200	5	0	2023-03-01	\N	\N
3007	1688	0		0	1	5.77	0	0	0	43.33	250	5	0	2023-03-01	\N	\N
3008	1689	0		0	1	5.77	0	0	0	26	150	5	0	2023-03-01	\N	\N
3009	1690	0		0	1	5.77	0	0	0	30.33	175	5	0	2023-03-01	\N	\N
3010	1691	0		0	1	5.77	0	0	0	28.6	165	5	0	2023-03-01	\N	\N
3011	1692	0		0	1	5.77	0	0	0	28.6	165	5	0	2023-03-01	\N	\N
3012	1693	0		0	1	5.77	0	0	0	54.59	315	5	0	2023-03-01	\N	\N
3013	1694	0		0	1	5.77	0	0	0	21.66	125	5	0	2023-03-01	\N	\N
3014	1695	0		0	1	5.77	0	0	0	43.33	250	5	0	2023-03-01	\N	\N
3015	1666	3		235	1	24	5.640	5.640	235	0	0	5	2	2023-03-01	0	2023-03-01
3016	1451	2	142406324	270	1	24	6.480	6.480	270	0	0	5	2	2023-03-01	28	2023-02-28
3018	1440	3		290	1	24	6.960	6.960	290	0	0	5	2	2023-03-02	0	2023-03-02
3019	1620	3		215	1	24	5.160	5.160	215	0	0	5	2	2023-03-02	0	2023-03-02
3020	1365	0		0	1	5.77	0	0	0	43.33	250	5	0	2023-03-02	\N	\N
3021	1365	3		250	1	24	6.000	6.000	250	0	0	5	2	2023-03-02	0	2023-03-02
3022	1395	3		225	1	24	5.400	5.400	225	0	0	5	2	2023-03-02	0	2023-03-02
3023	1507	3		225	1	24	5.400	5.400	225	0	0	5	2	2023-03-02	0	2023-03-02
3024	1624	3		225	1	24	5.400	5.400	225	0	0	5	2	2023-03-02	0	2023-03-02
3025	1427	3		405	1	24	9.720	9.720	405	0	0	5	2	2023-03-03	0	2023-03-03
3026	1540	3		405	1	24	9.720	9.720	405	0	0	5	2	2023-03-03	0	2023-03-03
3027	1522	3		165	1	24	3.960	3.960	165	0	0	5	2	2023-03-03	0	2023-03-03
3028	1552	3		290	1	24	6.960	6.960	290	0	0	5	2	2023-03-04	0	2023-03-04
3029	1379	3		290	1	24	6.960	6.960	290	0	0	5	2	2023-03-04	0	2023-03-04
3030	1491	3		290	1	24	6.960	6.960	290	0	0	5	2	2023-03-04	0	2023-03-04
3031	1459	3		265	1	24	6.360	6.360	265	0	0	5	2	2023-03-04	0	2023-03-04
3032	1572	3		265	1	24	6.360	6.360	265	0	0	5	2	2023-03-04	0	2023-03-04
3033	1390	3		215	1	24	5.160	5.160	215	0	0	5	2	2023-03-04	0	2023-03-04
3034	1263	3		215	1	24	5.160	5.160	215	0	0	5	2	2023-03-04	0	2023-03-04
3035	1501	3		215	1	24	5.160	5.160	215	0	0	5	2	2023-03-04	0	2023-03-04
3036	1425	3		425	1	24	10.200	10.200	425	0	0	1	2	2023-03-06	0	2023-03-06
3037	1538	3		425	1	24	10.200	10.200	425	0	0	1	2	2023-03-06	0	2023-03-06
3038	1653	3		425	1	24	10.200	10.200	425	0	0	1	2	2023-03-06	0	2023-03-06
3039	1494	3		110	1	24	2.640	2.640	110	0	0	1	2	2023-03-06	0	2023-03-06
3040	1500	3		165	1	24	3.960	3.960	165	0	0	1	2	2023-03-06	0	2023-03-06
3041	1477	3		250	1	24	6.000	6.000	250	0	0	1	2	2023-03-06	0	2023-03-06
3042	1595	3		250	1	24	6.000	6.000	250	0	0	1	2	2023-03-06	0	2023-03-06
3043	1568	2	122145721	240	1	24	5.760	5.760	240	0	0	1	2	2023-03-06	28	2023-03-03
3044	1606	3		70	1	24	1.680	1.680	70	0	0	1	2	2023-03-09	0	2023-03-09
3045	1489	3		70	1	24	1.680	1.680	70	0	0	1	2	2023-03-09	0	2023-03-09
3046	1377	3		70	1	24	1.680	1.680	70	0	0	1	2	2023-03-09	0	2023-03-09
3047	1649	3		235	1	24	5.640	5.640	235	0	0	1	2	2023-03-09	0	2023-03-09
3048	1534	3		235	1	24	5.640	5.640	235	0	0	1	2	2023-03-09	0	2023-03-09
3049	1421	3		235	1	24	5.640	5.640	235	0	0	1	2	2023-03-09	0	2023-03-09
3050	1559	3		170	1	24	4.080	4.080	170	0	0	1	2	2023-03-09	0	2023-03-09
3051	1557	3		165	1	24	3.960	3.960	165	0	0	1	2	2023-03-11	0	2023-03-11
3052	1597	3		165	1	24	3.960	3.960	165	0	0	1	2	2023-03-11	0	2023-03-11
3053	1498	3		360	1	24	8.640	8.640	360	0	0	1	2	2023-03-11	0	2023-03-11
3054	1660	6		165	1	5.77	952,05	952,05	165	0	0	1	2	2023-03-14	0	2023-03-14
3055	1545	6		165	1	5.77	952,05	952,05	165	0	0	1	2	2023-03-14	0	2023-03-14
3056	1433	6		165	1	5.77	952,05	952,05	165	0	0	1	2	2023-03-14	0	2023-03-14
3057	1316	6		165	1	5.77	952,05	952,05	165	0	0	1	2	2023-03-14	0	2023-03-14
3058	1180	6		165	1	5.77	952,05	952,05	165	0	0	1	2	2023-03-14	0	2023-03-14
3059	1059	6		165	1	5.77	952,05	952,05	165	0	0	1	2	2023-03-14	0	2023-03-14
3060	925	6		165	1	5.77	952,05	952,05	165	0	0	1	2	2023-03-14	0	2023-03-14
3061	803	6		165	1	5.77	952,05	952,05	165	0	0	1	2	2023-03-14	0	2023-03-14
3062	683	6		165	1	5.77	952,05	952,05	165	0	0	1	2	2023-03-14	0	2023-03-14
3063	563	6		165	1	5.77	952,05	952,05	165	0	0	1	2	2023-03-14	0	2023-03-14
3064	1469	3		125	1	24	3.000	3.000	125	0	0	1	2	2023-03-15	0	2023-03-15
3065	1582	3		125	1	24	3.000	3.000	125	0	0	1	2	2023-03-15	0	2023-03-15
3066	1380	3		165	1	24	3.960	3.960	165	0	0	1	2	2023-03-15	0	2023-03-15
3067	1492	3		165	1	24	3.960	3.960	165	0	0	1	2	2023-03-15	0	2023-03-15
3068	1609	3		165	1	24	3.960	3.960	165	0	0	1	2	2023-03-15	0	2023-03-15
3069	1485	3		165	1	24	3.960	3.960	165	0	0	1	2	2023-03-16	0	2023-03-16
3070	1484	3		220	1	24	5.280	5.280	220	0	0	1	2	2023-03-16	0	2023-03-16
3071	1528	3		235	1	24	5.640	5.640	235	0	0	1	2	2023-03-16	0	2023-03-16
3072	1506	3		175	1	24	4.200	4.200	175	0	0	1	2	2023-03-16	0	2023-03-16
3073	1623	3		175	1	24	4.200	4.200	175	0	0	1	2	2023-03-16	0	2023-03-16
3074	1399	3		100	1	24	2.400	2.400	100	0	0	1	2	2023-03-16	0	2023-03-16
3075	1511	3		100	1	24	2.400	2.400	100	0	0	1	2	2023-03-16	0	2023-03-16
3076	1628	3		100	1	24	2.400	2.400	100	0	0	1	2	2023-03-16	0	2023-03-16
3077	1696	3		100	1	24	2.400	2.400	100	0	0	1	2	2023-03-16	0	2023-03-16
3078	1583	2	112325277	250	1	24	6.000	6.000	250	0	0	1	2	2023-03-16	28	2023-03-15
3079	1695	2	112325277	250	1	24	6.000	6.000	250	0	0	1	2	2023-03-16	28	2023-03-15
3080	1605	2	151625966	60	1	24	1.440	1.440	60	0	0	1	2	2023-03-16	28	2023-03-03
3081	1627	2	151748153	200	1	24	4.800	4.800	200	0	0	1	2	2023-03-16	28	2023-03-03
3082	1405	3		165	1	24	3.960	3.960	165	0	0	1	2	2023-03-17	0	2023-03-17
3083	1517	3		165	1	24	3.960	3.960	165	0	0	1	2	2023-03-17	0	2023-03-17
3084	1694	3		125	1	24	3.000	3.000	125	0	0	1	2	2023-03-17	0	2023-03-17
3085	1525	3		315	1	24	7.560	7.560	315	0	0	1	2	2023-03-17	0	2023-03-17
3086	1554	3		175	1	24	4.200	4.200	175	0	0	1	2	2023-03-17	0	2023-03-17
3087	1512	3		400	1	24	9.600	9.600	400	0	0	1	2	2023-03-17	0	2023-03-17
3088	1632	3		120	1	24	2.880	2.880	120	0	0	1	2	2023-03-19	0	2023-03-19
3089	1516	3		120	1	24	2.880	2.880	120	0	0	1	2	2023-03-19	0	2023-03-19
3090	1612	3		165	1	24	3.960	3.960	165	0	0	1	2	2023-03-19	0	2023-03-19
3091	1535	3		175	1	24	4.200	4.200	175	0	0	1	2	2023-03-19	0	2023-03-19
3092	1650	3		175	1	24	4.200	4.200	175	0	0	1	2	2023-03-19	0	2023-03-19
3093	1697	0		0	1	5.77	0	0	0	31.2	180	1	0	2023-03-20	\N	\N
3094	1698	0		0	1	5.77	0	0	0	31.2	180	1	0	2023-03-20	\N	\N
3095	1654	6		310	1	5.77	1.788,7	1.788,7	310	0	0	1	2	2023-03-20	0	2023-03-20
3096	1539	6		310	1	5.77	1.788,7	1.788,7	310	0	0	1	2	2023-03-20	0	2023-03-20
3097	1426	6		310	1	5.77	1.788,7	1.788,7	310	0	0	1	2	2023-03-20	0	2023-03-20
3098	1307	6		310	1	5.77	1.788,7	1.788,7	310	0	0	1	2	2023-03-20	0	2023-03-20
3099	1171	6		310	1	5.77	1.788,7	1.788,7	310	0	0	1	2	2023-03-20	0	2023-03-20
3100	1050	6		310	1	5.77	1.788,7	1.788,7	310	0	0	1	2	2023-03-20	0	2023-03-20
3101	916	6		310	1	5.77	1.788,7	1.788,7	310	0	0	1	2	2023-03-20	0	2023-03-20
3102	794	6		310	1	5.77	1.788,7	1.788,7	310	0	0	1	2	2023-03-20	0	2023-03-20
3103	674	6		310	1	5.77	1.788,7	1.788,7	310	0	0	1	2	2023-03-20	0	2023-03-20
3104	554	6		310	1	5.77	1.788,7	1.788,7	310	0	0	1	2	2023-03-20	0	2023-03-20
3105	434	6		310	1	5.77	1.788,7	1.788,7	310	0	0	1	2	2023-03-20	0	2023-03-20
3106	1652	2	130822469	235	1	24	5.640	5.640	235	0	0	1	2	2023-03-20	28	2023-03-16
3107	1580	3		165	1	24	3.960	3.960	165	0	0	1	2	2023-03-22	0	2023-03-22
3108	1692	3		165	1	24	3.960	3.960	165	0	0	1	2	2023-03-22	0	2023-03-22
3109	1414	3		165	1	24	3.960	3.960	165	0	0	1	2	2023-03-22	0	2023-03-22
3110	1499	3		140	1	24	3.360	3.360	140	0	0	1	2	2023-03-22	0	2023-03-22
3111	1549	3		170	1	24	4.080	4.080	170	0	0	1	2	2023-03-22	0	2023-03-22
3112	1697	3		180	1	24	4.320	4.320	180	0	0	1	2	2023-03-23	0	2023-03-23
3113	1681	2	131344766	240	1	24	5.760	5.760	240	0	0	1	2	2023-03-23	28	2023-03-21
3114	1478	2	144322176	165	1	24	3.960	3.960	165	0	0	1	2	2023-03-23	28	2023-03-21
3115	1699	0		0	1	5.77	0	0	0	55.46	320	1	0	2023-03-24	\N	\N
3116	1603	3		220	1	24	5.280	5.280	220	0	0	1	2	2023-03-24	0	2023-03-24
3117	1639	3		350	1	24	8.400	8.400	350	0	0	1	2	2023-03-24	0	2023-03-24
3118	1686	3		70	1	24	1.680	1.680	70	0	0	1	2	2023-03-24	0	2023-03-24
3119	1615	6		140	1	5.77	807,8	807,8	140	0	0	1	2	2023-03-27	0	2023-03-27
3120	1080	3		315	1	24	7.560	7.560	315	0	0	1	2	2023-03-27	0	2023-03-27
3121	1201	3		315	1	24	7.560	7.560	315	0	0	1	2	2023-03-27	0	2023-03-27
3122	1336	3		315	1	24	7.560	7.560	315	0	0	1	2	2023-03-27	0	2023-03-27
3123	1454	3		315	1	24	7.560	7.560	315	0	0	1	2	2023-03-27	0	2023-03-27
3124	1567	3		315	1	24	7.560	7.560	315	0	0	1	2	2023-03-27	0	2023-03-27
3125	1680	3		315	1	24	7.560	7.560	315	0	0	1	2	2023-03-27	0	2023-03-27
3126	1655	3		405	1	24	9.720	9.720	405	0	0	1	2	2023-03-28	0	2023-03-28
3127	1602	3		165	1	24	3.960	3.960	165	0	0	1	2	2023-03-29	0	2023-03-29
3128	1527	3		260	1	5.77	1.500,2	6.240	260	0	0	1	2	2023-03-30	0	2023-03-30
3129	1526	3		165	1	24	3.960	3.960	165	0	0	1	2	2023-03-30	0	2023-03-30
3130	1611	3		110	1	24	2.640	2.640	110	0	0	1	2	2023-03-31	0	2023-03-31
3131	1432	3		290	1	24	6.960	6.960	290	0	0	1	2	2023-03-31	0	2023-03-31
3132	1544	3		290	1	24	6.960	6.960	290	0	0	1	2	2023-03-31	0	2023-03-31
3133	1659	3		290	1	24	6.960	6.960	290	0	0	1	2	2023-03-31	0	2023-03-31
3134	476	6		175	1	5.77	1.009,75	1.009,75	175	0	0	1	2	2023-03-31	0	2023-03-31
3135	1578	6		175	1	5.77	1.009,75	1.009,75	175	0	0	1	2	2023-03-31	0	2023-03-31
3136	1690	6		175	1	5.77	1.009,75	1.009,75	175	0	0	1	2	2023-03-31	0	2023-03-31
3137	1465	6		175	1	5.77	1.009,75	1.009,75	175	0	0	1	2	2023-03-31	0	2023-03-31
3138	1345	6		175	1	5.77	1.009,75	1.009,75	175	0	0	1	2	2023-03-31	0	2023-03-31
3139	1211	6		175	1	5.77	1.009,75	1.009,75	175	0	0	1	2	2023-03-31	0	2023-03-31
3140	1090	6		175	1	5.77	1.009,75	1.009,75	175	0	0	1	2	2023-03-31	0	2023-03-31
3141	955	6		175	1	5.77	1.009,75	1.009,75	175	0	0	1	2	2023-03-31	0	2023-03-31
3142	836	6		175	1	5.77	1.009,75	1.009,75	175	0	0	1	2	2023-03-31	0	2023-03-31
3143	716	6		175	1	5.77	1.009,75	1.009,75	175	0	0	1	2	2023-03-31	0	2023-03-31
3144	596	6		175	1	5.77	1.009,75	1.009,75	175	0	0	1	2	2023-03-31	0	2023-03-31
3145	1543	3		165	1	5.77	952,05	952,05	165	0	0	1	2	2023-03-31	0	2023-03-31
3146	1614	3		360	1	5.77	2.077,2	2.077,2	360	0	0	1	2	2023-03-31	0	2023-03-31
3147	1638	6		165	1	7	1.155	1.155	165	0	0	1	2	2023-03-31	0	2023-03-31
3148	1700	0		0	1	5.77	0	0	0	43.33	250	1	0	2023-04-01	\N	\N
3149	1701	0		0	1	5.77	0	0	0	28.6	165	1	0	2023-04-01	\N	\N
3150	1702	0		0	1	5.77	0	0	0	38.99	225	1	0	2023-04-01	\N	\N
3151	1703	0		0	1	5.77	0	0	0	28.6	165	1	0	2023-04-01	\N	\N
3152	1704	0		0	1	5.77	0	0	0	40.73	235	1	0	2023-04-01	\N	\N
3153	1705	0		0	1	5.77	0	0	0	36.4	210	1	0	2023-04-01	\N	\N
3154	1706	0		0	1	5.77	0	0	0	76.26	440	1	0	2023-04-01	\N	\N
3155	1707	0		0	1	5.77	0	0	0	38.13	220	1	0	2023-04-01	\N	\N
3156	1708	0		0	1	5.77	0	0	0	28.6	165	1	0	2023-04-01	\N	\N
3157	1709	0		0	1	5.77	0	0	0	38.13	220	1	0	2023-04-01	\N	\N
3158	1710	0		0	1	5.77	0	0	0	9.53	55	1	0	2023-04-01	\N	\N
3159	1711	0		0	1	5.77	0	0	0	10.4	60	1	0	2023-04-01	\N	\N
3160	1712	0		0	1	5.77	0	0	0	12.13	70	1	0	2023-04-01	\N	\N
3161	1713	0		0	1	5.77	0	0	0	9.53	55	1	0	2023-04-01	\N	\N
3162	1714	0		0	1	5.77	0	0	0	50.26	290	1	0	2023-04-01	\N	\N
3163	1715	0		0	1	5.77	0	0	0	28.6	165	1	0	2023-04-01	\N	\N
3164	1716	0		0	1	5.77	0	0	0	28.6	165	1	0	2023-04-01	\N	\N
3165	1717	0		0	1	5.77	0	0	0	28.6	165	1	0	2023-04-01	\N	\N
3166	1718	0		0	1	5.77	0	0	0	19.06	110	1	0	2023-04-01	\N	\N
3167	1719	0		0	1	5.77	0	0	0	28.6	165	1	0	2023-04-01	\N	\N
3168	1720	0		0	1	5.77	0	0	0	62.39	360	1	0	2023-04-01	\N	\N
3169	1721	0		0	1	5.77	0	0	0	28.6	165	1	0	2023-04-01	\N	\N
3170	1722	0		0	1	5.77	0	0	0	37.26	215	1	0	2023-04-01	\N	\N
3171	1723	0		0	1	5.77	0	0	0	63.26	365	1	0	2023-04-01	\N	\N
3172	1724	0		0	1	5.77	0	0	0	32.06	185	1	0	2023-04-01	\N	\N
3173	1725	0		0	1	5.77	0	0	0	37.26	215	1	0	2023-04-01	\N	\N
3174	1726	0		0	1	5.77	0	0	0	28.6	165	1	0	2023-04-01	\N	\N
3175	1727	0		0	1	5.77	0	0	0	62.39	360	1	0	2023-04-01	\N	\N
3176	1728	0		0	1	5.77	0	0	0	30.33	175	1	0	2023-04-01	\N	\N
3177	1729	0		0	1	5.77	0	0	0	38.99	225	1	0	2023-04-01	\N	\N
3179	1731	0		0	1	5.77	0	0	0	99.65	575	1	0	2023-04-01	\N	\N
3180	1732	0		0	1	5.77	0	0	0	34.66	200	1	0	2023-04-01	\N	\N
3181	1733	0		0	1	5.77	0	0	0	69.32	400	1	0	2023-04-01	\N	\N
3182	1734	0		0	1	5.77	0	0	0	35.53	205	1	0	2023-04-01	\N	\N
3183	1735	0		0	1	5.77	0	0	0	17.33	100	1	0	2023-04-01	\N	\N
3184	1736	0		0	1	5.77	0	0	0	20.8	120	1	0	2023-04-01	\N	\N
3185	1737	0		0	1	5.77	0	0	0	28.6	165	1	0	2023-04-01	\N	\N
3186	1738	0		0	1	5.77	0	0	0	28.6	165	1	0	2023-04-01	\N	\N
3187	1739	0		0	1	5.77	0	0	0	28.6	165	1	0	2023-04-01	\N	\N
3188	1740	0		0	1	5.77	0	0	0	21.66	125	1	0	2023-04-01	\N	\N
3189	1741	0		0	1	5.77	0	0	0	51.99	300	1	0	2023-04-01	\N	\N
3191	1743	0		0	1	5.77	0	0	0	60.66	350	1	0	2023-04-01	\N	\N
3192	1744	0		0	1	5.77	0	0	0	31.2	180	1	0	2023-04-01	\N	\N
3193	1745	0		0	1	5.77	0	0	0	54.59	315	1	0	2023-04-01	\N	\N
3194	1746	0		0	1	5.77	0	0	0	28.6	165	1	0	2023-04-01	\N	\N
3195	1747	0		0	1	5.77	0	0	0	45.06	260	1	0	2023-04-01	\N	\N
3196	1748	0		0	1	5.77	0	0	0	40.73	235	1	0	2023-04-01	\N	\N
3197	1749	0		0	1	5.77	0	0	0	41.59	240	1	0	2023-04-01	\N	\N
3198	1750	0		0	1	5.77	0	0	0	36.4	210	1	0	2023-04-01	\N	\N
3199	1751	0		0	1	5.77	0	0	0	40.73	235	1	0	2023-04-01	\N	\N
3200	1752	0		0	1	5.77	0	0	0	31.2	180	1	0	2023-04-01	\N	\N
3201	1753	0		0	1	5.77	0	0	0	28.6	165	1	0	2023-04-01	\N	\N
3202	1754	0		0	1	5.77	0	0	0	40.73	235	1	0	2023-04-01	\N	\N
3203	1755	0		0	1	5.77	0	0	0	47.66	275	1	0	2023-04-01	\N	\N
3204	1756	0		0	1	5.77	0	0	0	38.13	220	1	0	2023-04-01	\N	\N
3206	1758	0		0	1	5.77	0	0	0	73.66	425	1	0	2023-04-01	\N	\N
3207	1759	0		0	1	5.77	0	0	0	70.19	405	1	0	2023-04-01	\N	\N
3208	1760	0		0	1	5.77	0	0	0	31.2	180	1	0	2023-04-01	\N	\N
3209	1761	0		0	1	5.77	0	0	0	51.99	300	1	0	2023-04-01	\N	\N
3210	1762	0		0	1	5.77	0	0	0	28.6	165	1	0	2023-04-01	\N	\N
3211	1763	0		0	1	5.77	0	0	0	50.26	290	1	0	2023-04-01	\N	\N
3212	1764	0		0	1	5.77	0	0	0	76.26	440	1	0	2023-04-01	\N	\N
3213	1765	0		0	1	5.77	0	0	0	28.6	165	1	0	2023-04-01	\N	\N
3214	1766	0		0	1	5.77	0	0	0	41.59	240	1	0	2023-04-01	\N	\N
3215	1767	0		0	1	5.77	0	0	0	29.46	170	1	0	2023-04-01	\N	\N
3216	1768	0		0	1	5.77	0	0	0	28.6	165	1	0	2023-04-01	\N	\N
3217	1769	0		0	1	5.77	0	0	0	40.73	235	1	0	2023-04-01	\N	\N
3218	1770	0		0	1	5.77	0	0	0	50.26	290	1	0	2023-04-01	\N	\N
3219	1771	0		0	1	5.77	0	0	0	28.6	165	1	0	2023-04-01	\N	\N
3220	1772	0		0	1	5.77	0	0	0	30.33	175	1	0	2023-04-01	\N	\N
3221	1773	0		0	1	5.77	0	0	0	28.6	165	1	0	2023-04-01	\N	\N
3222	1774	0		0	1	5.77	0	0	0	20.8	120	1	0	2023-04-01	\N	\N
3223	1775	0		0	1	5.77	0	0	0	28.6	165	1	0	2023-04-01	\N	\N
3224	1776	0		0	1	5.77	0	0	0	29.46	170	1	0	2023-04-01	\N	\N
3225	1777	0		0	1	5.77	0	0	0	54.59	315	1	0	2023-04-01	\N	\N
3226	1778	0		0	1	5.77	0	0	0	31.2	180	1	0	2023-04-01	\N	\N
3227	1779	0		0	1	5.77	0	0	0	54.59	315	1	0	2023-04-01	\N	\N
3228	1780	0		0	1	5.77	0	0	0	53.73	310	1	0	2023-04-01	\N	\N
3230	1782	0		0	1	5.77	0	0	0	34.66	200	1	0	2023-04-01	\N	\N
3232	1784	0		0	1	5.77	0	0	0	41.59	240	1	0	2023-04-01	\N	\N
3233	1785	0		0	1	5.77	0	0	0	28.6	165	1	0	2023-04-01	\N	\N
3234	1786	0		0	1	5.77	0	0	0	51.99	300	1	0	2023-04-01	\N	\N
3235	1787	0		0	1	5.77	0	0	0	39.86	230	1	0	2023-04-01	\N	\N
3236	1788	0		0	1	5.77	0	0	0	45.93	265	1	0	2023-04-01	\N	\N
3237	1789	0		0	1	5.77	0	0	0	12.13	70	1	0	2023-04-01	\N	\N
3238	1790	0		0	1	5.77	0	0	0	34.66	200	1	0	2023-04-01	\N	\N
3239	1791	0		0	1	5.77	0	0	0	43.33	250	1	0	2023-04-01	\N	\N
3240	1792	0		0	1	5.77	0	0	0	26	150	1	0	2023-04-01	\N	\N
3242	1794	0		0	1	5.77	0	0	0	28.6	165	1	0	2023-04-01	\N	\N
3243	1795	0		0	1	5.77	0	0	0	13	75	1	0	2023-04-01	\N	\N
3244	1796	0		0	1	5.77	0	0	0	54.59	315	1	0	2023-04-01	\N	\N
3245	1797	0		0	1	5.77	0	0	0	21.66	125	1	0	2023-04-01	\N	\N
3246	1798	0		0	1	5.77	0	0	0	43.33	250	1	0	2023-04-01	\N	\N
3247	346	0		0	1	5.77	0	0	0	54.59	315	1	0	2023-04-01	\N	\N
3248	346	2	110604996	315	1	5.77	1.817,55	1.817,55	315	0	0	1	2	2023-04-01	28	2023-04-30
3250	1691	6		165	1	5.77	952,05	952,05	165	0	0	1	2	2023-04-01	0	2023-04-01
3251	1579	6		165	1	5.77	952,05	952,05	165	0	0	1	2	2023-04-01	0	2023-04-01
3252	1466	6		165	1	5.77	952,05	952,05	165	0	0	1	2	2023-04-01	0	2023-04-01
3253	1346	6		165	1	5.77	952,05	952,05	165	0	0	1	2	2023-04-01	0	2023-04-01
3254	1212	6		165	1	5.77	952,05	952,05	165	0	0	1	2	2023-04-01	0	2023-04-01
3255	1091	6		165	1	5.77	952,05	952,05	165	0	0	1	2	2023-04-01	0	2023-04-01
3257	837	6		165	1	5.77	952,05	952,05	165	0	0	1	2	2023-04-01	0	2023-04-01
3258	717	6		165	1	5.77	952,05	952,05	165	0	0	1	2	2023-04-01	0	2023-04-01
3259	1793	0		0	1	5.77	0	0	0	28.6	165	1	0	2023-04-01	\N	\N
3260	1793	6		165	1	5.77	952,05	952,05	165	0	0	1	2	2023-04-01	0	2023-04-01
3261	956	0		0	1	5.77	0	0	0	28.6	165	1	0	2023-04-01	\N	\N
3262	956	6		165	1	5.77	952,05	952,05	165	0	0	1	2	2023-04-01	0	2023-04-01
3263	597	6		165	1	5.77	952,05	952,05	165	0	0	1	2	2023-04-01	0	2023-04-01
3264	477	6		165	1	5.77	952,05	952,05	165	0	0	1	2	2023-04-01	0	2023-04-01
3265	357	6		165	1	5.77	952,05	952,05	165	0	0	1	2	2023-04-01	0	2023-04-01
3266	237	6		33	1	5.77	190,41	190,41	33	0	0	1	2	2023-04-01	0	2023-04-01
3267	117	6		33	1	5.77	190,41	190,41	33	0	0	1	2	2023-04-01	0	2023-04-01
3269	1677	3		270	1	24	6.480	6.480	270	0	0	1	2	2023-04-01	0	2023-04-01
3271	1564	0		0	1	5.77	0	0	0	46.79	270	1	0	2023-04-01	\N	\N
3272	1564	3		270	1	24	6.480	6.480	270	0	0	1	2	2023-04-01	28	2023-04-01
3273	1781	0		0	1	5.77	0	0	0	46.79	270	1	0	2023-04-01	\N	\N
3274	1702	3		225	1	24	5.400	5.400	225	0	0	1	2	2023-04-01	0	2023-04-01
3275	1799	3		225	1	24	5.400	5.400	225	0	0	1	2	2023-04-01	0	2023-04-01
3276	1800	3		225	1	24	5.400	5.400	225	0	0	1	2	2023-04-01	0	2023-04-01
3277	1717	3		165	1	24	3.960	3.960	165	0	0	1	2	2023-04-01	0	2023-04-01
3278	1801	3		165	1	24	3.960	3.960	165	0	0	1	2	2023-04-01	0	2023-04-01
3279	1802	3		165	1	24	3.960	3.960	165	0	0	1	2	2023-04-01	0	2023-04-01
3280	1524	3		180	1	24	4.320	4.320	180	0	0	1	2	2023-04-01	0	2023-04-01
3281	1640	3		180	1	24	4.320	4.320	180	0	0	1	2	2023-04-01	0	2023-04-01
3282	1629	3		400	1	24	9.600	9.600	400	0	0	1	2	2023-04-01	0	2023-04-01
3284	1742	0		0	1	5.77	0	0	0	28.6	165	1	0	2023-04-01	\N	\N
3285	1742	6		165	1	5.77	952,05	952,05	165	0	0	1	2	2023-04-01	0	2023-04-01
3286	1769	3		235	1	24	5.640	5.640	235	0	0	1	2	2023-04-01	0	2023-04-01
3287	1751	3		235	1	24	5.640	5.640	235	0	0	1	2	2023-04-03	0	2023-04-03
3288	1684	3		230	1	24	5.520	5.520	230	0	0	1	2	2023-04-03	0	2023-04-03
3289	1787	3		230	1	24	5.520	5.520	230	0	0	1	2	2023-04-03	0	2023-04-03
3290	1725	3		215	1	24	5.160	5.160	215	0	0	1	2	2023-04-03	0	2023-04-03
3291	1505	3		360	1	24	8.640	8.640	360	0	0	1	2	2023-04-04	0	2023-04-04
3292	1622	3		360	1	24	8.640	8.640	360	0	0	1	2	2023-04-04	0	2023-04-04
3293	1703	3		165	1	24	3.960	3.960	165	0	0	1	2	2023-04-04	0	2023-04-04
3294	1396	3		165	1	24	3.960	3.960	165	0	0	1	2	2023-04-04	0	2023-04-04
3295	1508	3		165	1	24	3.960	3.960	165	0	0	1	2	2023-04-04	0	2023-04-04
3296	1625	3		165	1	24	3.960	3.960	165	0	0	1	2	2023-04-04	0	2023-04-04
3298	1730	0		0	1	5.77	0	0	0	28.6	165	1	0	2023-04-05	\N	\N
3299	1601	3		220	1	24	5.280	5.280	220	0	0	1	2	2023-04-05	0	2023-04-05
3300	1644	3		235	1	24	5.640	5.640	235	0	0	1	2	2023-04-05	0	2023-04-05
3301	1619	3		185	1	24	4.440	4.440	185	0	0	1	2	2023-04-05	0	2023-04-05
3302	1599	3		210	1	24	5.040	5.040	210	0	0	1	2	2023-04-06	0	2023-04-06
3303	1642	3		165	1	24	3.960	3.960	165	0	0	1	2	2023-04-08	0	2023-04-08
3305	1773	3		165	1	24.77	4.087,05	4.087,05	165	0	0	1	2	2023-04-09	0	2023-04-09
3306	1634	3		165	1	24	3.960	3.960	165	0	0	1	2	2023-04-11	0	2023-04-11
3307	1672	3		170	1	24	4.080	4.080	170	0	0	1	2	2023-04-11	0	2023-04-11
3308	1069	6		120	1	5.77	692,4	692,4	120	0	0	1	2	2023-04-11	0	2023-04-11
3310	1190	0		0	1	5.77	0	0	0	20.8	120	1	0	2023-04-11	\N	\N
3311	1190	6		120	1	5.77	692,4	692,4	120	0	0	1	2	2023-04-11	0	2023-04-11
3312	1327	6		120	1	5.77	692,4	692,4	120	0	0	1	2	2023-04-11	0	2023-04-11
3313	1443	6		120	1	5.77	692,4	692,4	120	0	0	1	2	2023-04-11	0	2023-04-11
3314	1556	6		120	1	5.77	692,4	692,4	120	0	0	1	2	2023-04-11	0	2023-04-11
3315	1670	6		120	1	5.77	692,4	692,4	120	0	0	1	2	2023-04-11	0	2023-04-11
3316	1774	6		120	1	5.77	692,4	692,4	120	0	0	1	2	2023-04-11	0	2023-04-11
3317	1709	3		220	1	24	5.280	5.280	220	0	0	1	2	2023-04-11	0	2023-04-11
3318	1743	3		350	1	24	8.400	8.400	350	0	0	1	2	2023-04-11	0	2023-04-11
3319	1637	3		300	1	24	7.200	7.200	300	0	0	1	2	2023-04-11	0	2023-04-11
3320	1741	3		300	1	24	7.200	7.200	300	0	0	1	2	2023-04-11	0	2023-04-11
3321	1682	6		165	1	5.77	952,05	952,05	165	0	0	1	2	2023-04-12	0	2023-04-12
3322	1785	6		165	1	5.77	952,05	952,05	165	0	0	1	2	2023-04-12	0	2023-04-12
3323	291	6		125	1	5.77	721,25	721,25	125	0	0	1	2	2023-04-12	0	2023-04-12
3324	411	6		125	1	5.77	721,25	721,25	125	0	0	1	2	2023-04-12	0	2023-04-12
3325	531	6		125	1	5.77	721,25	721,25	125	0	0	1	2	2023-04-12	0	2023-04-12
3326	651	6		125	1	5.77	721,25	721,25	125	0	0	1	2	2023-04-12	0	2023-04-12
3327	771	6		125	1	5.77	721,25	721,25	125	0	0	1	2	2023-04-12	0	2023-04-12
3328	894	6		125	1	5.77	721,25	721,25	125	0	0	1	2	2023-04-12	0	2023-04-12
3329	1028	6		125	1	5.77	721,25	721,25	125	0	0	1	2	2023-04-12	0	2023-04-12
3331	1149	0		0	1	5.77	0	0	0	21.66	125	1	0	2023-04-12	\N	\N
3332	1149	6		125	1	5.77	721,25	721,25	125	0	0	1	2	2023-04-12	0	2023-04-12
3333	1285	6		125	1	5.77	721,25	721,25	125	0	0	1	2	2023-04-12	0	2023-04-12
3334	1408	6		125	1	5.77	721,25	721,25	125	0	0	1	2	2023-04-12	0	2023-04-12
3335	1520	6		125	1	5.77	721,25	721,25	125	0	0	1	2	2023-04-12	0	2023-04-12
3336	1636	6		125	1	5.77	721,25	721,25	125	0	0	1	2	2023-04-12	0	2023-04-12
3337	1740	6		125	1	5.77	721,25	721,25	125	0	0	1	2	2023-04-12	0	2023-04-12
3338	1581	3		315	1	24	7.560	7.560	315	0	0	1	2	2023-04-12	0	2023-04-12
3339	1693	3		315	1	24	7.560	7.560	315	0	0	1	2	2023-04-12	0	2023-04-12
3340	1796	3		315	1	24	7.560	7.560	315	0	0	1	2	2023-04-12	0	2023-04-12
3341	1675	3		315	1	24	7.560	1.817,55	315	0	0	1	2	2023-04-13	0	2023-04-13
3342	1779	3		315	1	24	7.560	7.560	315	0	0	1	2	2023-04-13	0	2023-04-13
3343	1641	3		315	1	24	7.560	7.560	315	0	0	1	2	2023-04-14	0	2023-04-14
3344	1745	3		315	1	24	7.560	7.560	315	0	0	1	2	2023-04-14	0	2023-04-14
3345	1669	3		175	1	24	4.200	4.200	175	0	0	1	2	2023-04-14	0	2023-04-14
3346	1772	3		175	1	24	4.200	4.200	175	0	0	1	2	2023-04-14	0	2023-04-14
3347	1658	3		165	1	24	3.960	3.960	165	0	0	1	2	2023-04-15	0	2023-04-15
3348	1671	3		165	1	24	3.960	3.960	165	0	0	1	2	2023-04-15	0	2023-04-15
3354	1566	0		0	1	5.77	0	0	0	19.93	115	1	0	2023-04-15	\N	\N
3355	1679	0		0	1	5.77	0	0	0	19.93	115	1	0	2023-04-15	\N	\N
3356	1783	0		0	1	5.77	0	0	0	19.93	115	1	0	2023-04-15	\N	\N
3357	1566	3		115	1	24.58	2.826,7	2.826,7	115	0	0	1	2	2023-04-15	0	2023-04-15
3358	1679	3		115	1	24.58	2.826,7	2.826,7	115	0	0	1	2	2023-04-15	0	2023-04-15
3359	1783	3		115	1	24.58	2.826,7	2.826,7	115	0	0	1	2	2023-04-15	0	2023-04-15
3360	1560	0		0	1	5.77	0	0	0	54.59	315	1	0	2023-04-15	\N	\N
3361	1673	0		0	1	5.77	0	0	0	54.59	315	1	0	2023-04-15	\N	\N
3362	1560	3		315	1	24.58	7.742,7	7.742,7	315	0	0	1	2	2023-04-15	0	2023-04-15
3363	1673	3		315	1	24.58	7.742,7	7.742,7	315	0	0	1	2	2023-04-15	0	2023-04-15
3364	1683	3		300	1	300	90.000	90.000	300	0	0	1	2	2023-04-17	0	2023-04-17
3365	1786	3		300	1	24	7.200	7.200	300	0	0	1	2	2023-04-17	0	2023-04-17
3366	1631	3		100	1	24	2.400	2.400	100	0	0	1	2	2023-04-17	0	2023-04-17
3367	1735	3		100	1	24	2.400	2.400	100	0	0	1	2	2023-04-17	0	2023-04-17
3368	1668	3		165	1	24	3.960	3.960	165	0	0	1	2	2023-04-17	0	2023-04-17
3369	1771	3		165	1	24	3.960	3.960	165	0	0	1	2	2023-04-17	0	2023-04-17
3370	1736	3		120	1	24	2.880	2.880	120	0	0	1	2	2023-04-18	0	2023-04-18
3371	1616	0		0	1	5.77	0	0	0	28.6	165	1	0	2023-04-18	\N	\N
3372	1616	3		165	1	24	3.960	3.960	165	0	0	1	2	2023-04-18	0	2023-04-18
3373	1721	6		165	1	5.77	952,05	952,05	165	0	0	1	2	2023-04-18	0	2023-04-18
3374	1803	0		0	1	5.77	0	0	0	31.2	180	1	0	2023-04-20	\N	\N
3375	1804	0		0	1	5.77	0	0	0	31.2	180	1	0	2023-04-20	\N	\N
3376	1803	3		180	1	24	4.320	4.320	180	0	0	1	2	2023-04-20	0	2023-04-20
3377	1732	2	1102322423	200	1	24	4.800	4.800	200	0	0	1	2	2023-04-21	28	2023-04-04
3378	1711	2	110414541	60	1	24	1.440	1.440	60	0	0	1	2	2023-04-21	28	2023-04-04
3379	1784	2	142430861	240	1	24	5.760	1.384,8	240	0	0	1	2	2023-04-21	28	2023-04-11
3380	50	6		33	1	5.77	190,41	190,41	33	0	0	1	2	2023-04-21	0	2023-04-21
3382	290	6		165	1	5.77	952,05	952,05	165	0	0	1	2	2023-04-21	0	2023-04-21
3383	170	0		0	1	5.77	0	0	0	28.6	165	1	0	2023-04-21	\N	\N
3384	170	6		165	1	5.77	952,05	952,05	165	0	0	1	2	2023-04-21	0	2023-04-21
3385	410	6		165	1	5.77	952,05	952,05	165	0	0	1	2	2023-04-21	0	2023-04-21
3386	530	6		165	1	5.77	952,05	952,05	165	0	0	1	2	2023-04-21	0	2023-04-21
3387	650	6		165	1	5.77	952,05	952,05	165	0	0	1	2	2023-04-21	0	2023-04-21
3388	770	6		165	1	5.77	952,05	952,05	165	0	0	1	2	2023-04-21	0	2023-04-21
3389	893	6		165	1	5.77	952,05	952,05	165	0	0	1	2	2023-04-21	0	2023-04-21
3390	1027	6		165	1	5.77	952,05	952,05	165	0	0	1	2	2023-04-21	0	2023-04-21
3391	1148	6		165	1	5.77	952,05	952,05	165	0	0	1	2	2023-04-21	0	2023-04-21
3392	1284	6		165	1	5.77	952,05	952,05	165	0	0	1	2	2023-04-21	0	2023-04-21
3393	1407	6		165	1	5.77	952,05	952,05	165	0	0	1	2	2023-04-21	0	2023-04-21
3394	1519	6		165	1	5.77	952,05	952,05	165	0	0	1	2	2023-04-21	0	2023-04-21
3395	1635	6		165	1	5.77	952,05	952,05	165	0	0	1	2	2023-04-21	0	2023-04-21
3396	1739	6		165	1	5.77	952,05	952,05	165	0	0	1	2	2023-04-21	0	2023-04-21
3397	1657	3		300	1	24	7.200	7.200	300	0	0	1	2	2023-04-21	0	2023-04-21
3398	1761	3		300	1	24	7.200	7.200	300	0	0	1	2	2023-04-21	0	2023-04-21
3399	1805	0		0	1	5.77	0	0	0	55.46	320	1	0	2023-04-24	\N	\N
3400	1776	3		170	1	24.56	4.175,2	4.175,2	170	0	0	1	2	2023-04-24	0	2023-04-24
3401	1781	3		270	1	24.56	6.631,2	6.631,2	270	0	0	1	2	2023-04-24	0	2023-04-24
3402	1700	6		250	1	5.77	1.442,5	1.442,5	250	0	0	1	2	2023-04-24	0	2023-04-24
3403	1777	3		315	1	24.56	7.736,4	7.736,4	315	0	0	1	2	2023-04-24	0	2023-04-24
3404	1797	3		125	1	24.65	3.081,25	3.081,25	125	0	0	1	2	2023-04-25	0	2023-04-25
3405	1591	2	125340696	180	1	24	4.320	4.320	180	0	0	1	2	2023-04-25	28	2023-04-21
3406	1698	2	125340696	180	1	24	4.320	4.320	180	0	0	1	2	2023-04-25	28	2023-04-21
3407	1804	2	125340696	180	1	5.77	1.038,6	1.038,6	180	0	0	1	2	2023-04-25	28	2023-04-21
3408	1806	2	125340696	180	1	24	4.320	4.320	180	0	0	1	2	2023-04-25	28	2023-04-21
3410	1808	3		160	1	24.56	3.929,6	0	160	0	0	1	2	2023-04-27	0	2023-04-27
3411	1758	3		425	1	24.63	10.467,75	10.467,75	425	0	0	1	2	2023-04-27	0	2023-04-27
3412	1718	6		110	1	5	550	550	110	0	0	1	2	2023-04-29	0	2023-04-29
3413	1789	6		70	1	5.77	403,9	403,9	70	0	0	1	2	2023-04-29	0	2023-04-29
3414	1809	0		0	1	5.77	0	0	0	30.33	175	1	0	2023-04-29	\N	\N
3415	1810	0		0	1	5.77	0	0	0	76.26	440	1	0	2023-04-29	\N	\N
3416	1733	3		400	1	24.56	9.824	9.824	400	0	0	1	2	2023-04-29	0	2023-04-29
3417	1759	3		405	1	24	9.720	9.720	405	0	0	1	2	2023-04-30	0	2023-04-30
3418	1728	3		175	1	24	4.200	4.200	175	0	0	1	2	2023-04-30	0	2023-04-30
3419	1378	3		55	1	24	1.320	1.320	55	0	0	1	2	2023-04-30	0	2023-04-30
3420	1490	3		55	1	24	1.320	1.320	55	0	0	1	2	2023-04-30	0	2023-04-30
3421	1541	3		180	1	24.56	4.420,8	4.420,8	180	0	0	1	2	2023-05-02	0	2023-05-02
3422	1656	3		180	1	24.56	4.420,8	4.420,8	180	0	0	1	2	2023-05-02	0	2023-05-02
3423	1760	3		180	1	24	4.320	4.320	180	0	0	1	2	2023-05-02	0	2023-05-02
3424	1607	3		55	1	24	1.320	1.320	55	0	0	1	2	2023-05-02	0	2023-05-02
3425	1811	3		165	1	24.56	4.052,4	4.052,4	165	0	0	1	2	2023-05-02	0	2023-05-02
3427	353	6		200	1	5.77	1.154	1.154	200	0	0	1	2	2023-05-02	0	2023-05-02
3428	473	6		200	1	5.77	1.154	1.154	200	0	0	1	2	2023-05-02	0	2023-05-02
3429	593	6		200	1	5.77	1.154	1.154	200	0	0	1	2	2023-05-02	0	2023-05-02
3430	713	6		200	1	5.77	1.154	1.154	200	0	0	1	2	2023-05-02	0	2023-05-02
3432	952	6		200	1	5.77	1.154	1.154	200	0	0	1	2	2023-05-02	0	2023-05-02
3433	833	0		0	1	5.77	0	0	0	34.66	200	1	0	2023-05-02	\N	\N
3434	833	6		200	1	5.77	1.154	1.154	200	0	0	1	2	2023-05-02	0	2023-05-02
3435	1087	6		200	1	5.77	1.154	1.154	200	0	0	1	2	2023-05-02	0	2023-05-02
3436	1208	6		200	1	5.77	1.154	1.154	200	0	0	1	2	2023-05-02	0	2023-05-02
3437	1342	6		200	1	5.77	1.154	1.154	200	0	0	1	2	2023-05-02	0	2023-05-02
3438	1813	3		215	1	24.65	5.299,75	5.299,75	215	0	0	1	2	2023-05-02	0	2023-05-02
3439	1461	6		200	1	5.77	1.154	1.154	200	0	0	1	2	2023-05-02	0	2023-05-02
3440	1574	6		200	1	5.77	1.154	1.154	200	0	0	1	2	2023-05-02	0	2023-05-02
3441	1687	6		200	1	5.77	1.154	1.154	200	0	0	1	2	2023-05-02	0	2023-05-02
3442	1790	6		200	1	5.77	1.154	1.154	200	0	0	1	2	2023-05-02	0	2023-05-02
3445	1464	3		150	1	24	3.600	3.600	150	0	0	1	2	2023-05-02	0	2023-05-02
3446	1577	3		150	1	24.56	3.684	3.684	150	0	0	1	2	2023-05-02	0	2023-05-02
3447	1689	3		150	1	24	3.600	3.600	150	0	0	1	2	2023-05-02	0	2023-05-02
3448	1792	3		150	1	24	3.600	3.600	150	0	0	1	2	2023-05-02	0	2023-05-02
3449	1816	3		405	1	24	9.720	9.720	405	0	0	1	2	2023-05-03	0	2023-05-03
3450	1817	3		300	1	24	7.200	7.200	300	0	0	1	2	2023-05-03	0	2023-05-03
3451	1818	2	95537071	235	1	24	5.640	5.640	235	0	0	1	2	2023-05-03	28	2023-05-03
3452	1819	3		235	1	24.76	5.818,6	5.818,6	235	0	0	1	2	2023-05-03	0	2023-05-03
3453	1820	2	143109537	240	1	24.75	5.940	5.940	240	0	0	1	2	2023-05-04	28	2023-05-03
3454	1676	3		310	1	24	7.440	7.440	310	0	0	1	2	2023-05-05	0	2023-05-05
3455	1780	3		310	1	24	7.440	7.440	310	0	0	1	2	2023-05-05	0	2023-05-05
3456	1678	3		200	1	24	4.800	4.800	200	0	0	1	2	2023-05-05	0	2023-05-05
3457	1782	3		200	1	24	4.800	4.800	200	0	0	1	2	2023-05-05	0	2023-05-05
3458	1775	3		165	1	24	3.960	3.960	165	0	0	1	2	2023-05-06	0	2023-05-06
3459	1821	3		120	1	24	2.880	2.880	120	0	0	1	2	2023-05-06	0	2023-05-06
3460	1708	3		165	1	24	3.960	3.960	165	0	0	1	2	2023-05-06	0	2023-05-06
3461	1596	2	152555290	165	1	25	4.125	4.125	165	0	0	1	2	2023-05-06	28	2023-05-05
3462	1822	0		0	1	5.77	0	0	0	28.6	165	2	0	2023-05-01	\N	\N
3463	1823	0		0	1	5.77	0	0	0	40.73	235	2	0	2023-05-01	\N	\N
3464	1824	0		0	1	5.77	0	0	0	36.4	210	2	0	2023-05-01	\N	\N
3465	1825	0		0	1	5.77	0	0	0	76.26	440	2	0	2023-05-01	\N	\N
3466	1826	0		0	1	5.77	0	0	0	38.13	220	2	0	2023-05-01	\N	\N
3467	1827	0		0	1	5.77	0	0	0	28.6	165	2	0	2023-05-01	\N	\N
3468	1828	0		0	1	5.77	0	0	0	38.13	220	2	0	2023-05-01	\N	\N
3469	1829	0		0	1	5.77	0	0	0	9.53	55	2	0	2023-05-01	\N	\N
3470	1830	0		0	1	5.77	0	0	0	30.33	175	2	0	2023-05-01	\N	\N
3471	1831	0		0	1	5.77	0	0	0	24.26	140	2	0	2023-05-01	\N	\N
3472	1832	0		0	1	5.77	0	0	0	10.4	60	2	0	2023-05-01	\N	\N
3473	1833	0		0	1	5.77	0	0	0	12.13	70	2	0	2023-05-01	\N	\N
3474	1834	0		0	1	5.77	0	0	0	9.53	55	2	0	2023-05-01	\N	\N
3475	1835	0		0	1	5.77	0	0	0	50.26	290	2	0	2023-05-01	\N	\N
3476	1836	0		0	1	5.77	0	0	0	28.6	165	2	0	2023-05-01	\N	\N
3477	1837	0		0	1	5.77	0	0	0	28.6	165	2	0	2023-05-01	\N	\N
3478	1838	0		0	1	5.77	0	0	0	28.6	165	2	0	2023-05-01	\N	\N
3479	1839	0		0	1	5.77	0	0	0	28.6	165	2	0	2023-05-01	\N	\N
3480	1840	0		0	1	5.77	0	0	0	62.39	360	2	0	2023-05-01	\N	\N
3481	1841	0		0	1	5.77	0	0	0	37.26	215	2	0	2023-05-01	\N	\N
3482	1842	0		0	1	5.77	0	0	0	31.2	180	2	0	2023-05-01	\N	\N
3483	1843	0		0	1	5.77	0	0	0	63.26	365	2	0	2023-05-01	\N	\N
3484	1844	0		0	1	5.77	0	0	0	32.06	185	2	0	2023-05-01	\N	\N
3485	1845	0		0	1	5.77	0	0	0	28.6	165	2	0	2023-05-01	\N	\N
3486	1846	0		0	1	5.77	0	0	0	62.39	360	2	0	2023-05-01	\N	\N
3487	1847	0		0	1	5.77	0	0	0	30.33	175	2	0	2023-05-01	\N	\N
3488	1848	0		0	1	5.77	0	0	0	38.99	225	2	0	2023-05-01	\N	\N
3489	1849	0		0	1	5.77	0	0	0	28.6	165	2	0	2023-05-01	\N	\N
3490	1850	0		0	1	5.77	0	0	0	71.06	410	2	0	2023-05-01	\N	\N
3491	1851	0		0	1	5.77	0	0	0	99.65	575	2	0	2023-05-01	\N	\N
3492	1852	0		0	1	5.77	0	0	0	34.66	200	2	0	2023-05-01	\N	\N
3493	1853	0		0	1	5.77	0	0	0	69.32	400	2	0	2023-05-01	\N	\N
3494	1854	0		0	1	5.77	0	0	0	35.53	205	2	0	2023-05-01	\N	\N
3495	1855	0		0	1	5.77	0	0	0	28.6	165	2	0	2023-05-01	\N	\N
3496	1856	0		0	1	5.77	0	0	0	28.6	165	2	0	2023-05-01	\N	\N
3497	1857	0		0	1	5.77	0	0	0	60.66	350	2	0	2023-05-01	\N	\N
3498	1858	0		0	1	5.77	0	0	0	31.2	180	2	0	2023-05-01	\N	\N
3499	1859	0		0	1	5.77	0	0	0	54.59	315	2	0	2023-05-01	\N	\N
3500	1860	0		0	1	5.77	0	0	0	28.6	165	2	0	2023-05-01	\N	\N
3501	1861	0		0	1	5.77	0	0	0	45.06	260	2	0	2023-05-01	\N	\N
3502	1862	0		0	1	5.77	0	0	0	40.73	235	2	0	2023-05-01	\N	\N
3503	1863	0		0	1	5.77	0	0	0	41.59	240	2	0	2023-05-01	\N	\N
3504	1864	0		0	1	5.77	0	0	0	36.4	210	2	0	2023-05-01	\N	\N
3505	1865	0		0	1	5.77	0	0	0	31.2	180	2	0	2023-05-01	\N	\N
3506	1866	0		0	1	5.77	0	0	0	28.6	165	2	0	2023-05-01	\N	\N
3507	1867	0		0	1	5.77	0	0	0	40.73	235	2	0	2023-05-01	\N	\N
3508	1868	0		0	1	5.77	0	0	0	47.66	275	2	0	2023-05-01	\N	\N
3509	1869	0		0	1	5.77	0	0	0	38.13	220	2	0	2023-05-01	\N	\N
3510	1870	0		0	1	5.77	0	0	0	40.73	235	2	0	2023-05-01	\N	\N
3511	1871	0		0	1	5.77	0	0	0	73.66	425	2	0	2023-05-01	\N	\N
3512	1872	0		0	1	5.77	0	0	0	31.2	180	2	0	2023-05-01	\N	\N
3513	1873	0		0	1	5.77	0	0	0	51.99	300	2	0	2023-05-01	\N	\N
3514	1874	0		0	1	5.77	0	0	0	28.6	165	2	0	2023-05-01	\N	\N
3515	1875	0		0	1	5.77	0	0	0	55.46	320	2	0	2023-05-01	\N	\N
3516	1876	0		0	1	5.77	0	0	0	50.26	290	2	0	2023-05-01	\N	\N
3517	1877	0		0	1	5.77	0	0	0	76.26	440	2	0	2023-05-01	\N	\N
3519	1879	0		0	1	5.77	0	0	0	28.6	165	2	0	2023-05-01	\N	\N
3520	1880	0		0	1	5.77	0	0	0	41.59	240	2	0	2023-05-01	\N	\N
3521	1881	0		0	1	5.77	0	0	0	29.46	170	2	0	2023-05-01	\N	\N
3522	1882	0		0	1	5.77	0	0	0	28.6	165	2	0	2023-05-01	\N	\N
3523	1883	0		0	1	5.77	0	0	0	50.26	290	2	0	2023-05-01	\N	\N
3524	1884	0		0	1	5.77	0	0	0	30.33	175	2	0	2023-05-01	\N	\N
3525	1885	0		0	1	5.77	0	0	0	28.6	165	2	0	2023-05-01	\N	\N
3526	1886	0		0	1	5.77	0	0	0	28.6	165	2	0	2023-05-01	\N	\N
3527	1887	0		0	1	5.77	0	0	0	29.46	170	2	0	2023-05-01	\N	\N
3528	1888	0		0	1	5.77	0	0	0	54.59	315	2	0	2023-05-01	\N	\N
3529	1889	0		0	1	5.77	0	0	0	31.2	180	2	0	2023-05-01	\N	\N
3530	1890	0		0	1	5.77	0	0	0	54.59	315	2	0	2023-05-01	\N	\N
3531	1891	0		0	1	5.77	0	0	0	53.73	310	2	0	2023-05-01	\N	\N
3532	1892	0		0	1	5.77	0	0	0	46.79	270	2	0	2023-05-01	\N	\N
3533	1893	0		0	1	5.77	0	0	0	34.66	200	2	0	2023-05-01	\N	\N
3534	1894	0		0	1	5.77	0	0	0	19.93	115	2	0	2023-05-01	\N	\N
3535	1895	0		0	1	5.77	0	0	0	51.99	300	2	0	2023-05-01	\N	\N
3536	1896	0		0	1	5.77	0	0	0	39.86	230	2	0	2023-05-01	\N	\N
3537	1897	0		0	1	5.77	0	0	0	45.93	265	2	0	2023-05-01	\N	\N
3538	1898	0		0	1	5.77	0	0	0	43.33	250	2	0	2023-05-01	\N	\N
3539	1899	0		0	1	5.77	0	0	0	76.26	440	2	0	2023-05-01	\N	\N
3541	1901	0		0	1	5.77	0	0	0	28.6	165	2	0	2023-05-01	\N	\N
3542	1902	0		0	1	5.77	0	0	0	13	75	2	0	2023-05-01	\N	\N
3543	1903	0		0	1	5.77	0	0	0	54.59	315	2	0	2023-05-01	\N	\N
3544	1904	0		0	1	5.77	0	0	0	21.66	125	2	0	2023-05-01	\N	\N
3546	1906	0		0	1	5.77	0	0	0	43.33	250	2	0	2023-05-01	\N	\N
3548	1746	3		165	1	25	4.125	4.125	165	0	0	1	2	2023-05-07	0	2023-05-07
3549	1798	3		250	1	25	6.250	6.250	250	0	0	1	2	2023-05-08	0	2023-05-08
3550	1906	3		250	1	25	6.250	6.250	250	0	0	1	2	2023-05-08	0	2023-05-08
3551	1729	3		225	1	25	5.625	5.625	225	0	0	1	2	2023-05-08	0	2023-05-09
3552	1848	3		225	1	25	5.625	5.625	225	0	0	1	2	2023-05-08	0	2023-05-09
3553	1664	6		170	1	25	4.250	4.250	170	0	0	1	2	2023-05-09	0	2023-05-09
3554	1767	6		170	1	25	4.250	4.250	170	0	0	1	2	2023-05-09	0	2023-05-09
3555	1881	6		170	1	25	4.250	4.250	170	0	0	1	2	2023-05-09	0	2023-05-09
3556	1794	3		165	1	25	4.125	4.125	165	0	0	1	2	2023-05-09	0	2023-05-09
3557	1810	3		440	1	25	11.000	11.000	440	0	0	1	2	2023-05-11	0	2023-05-11
3558	1809	3		175	1	25	4.375	4.375	175	0	0	1	2	2023-05-11	0	2023-05-11
3559	1610	2	124045320	165	1	25	4.125	4.125	165	0	0	1	2	2023-05-11	28	2023-04-12
3560	1716	2	120844147	165	1	25	4.125	4.125	165	0	0	1	2	2023-05-11	28	2023-05-11
3561	1727	3		360	1	25	9.000	9.000	360	0	0	1	2	2023-05-12	0	2023-05-12
3562	1724	3		185	1	25.34	4.687,9	4.687,9	185	0	0	5	2	2023-05-12	0	2023-05-12
3563	1762	3		165	1	25.34	4.181,1	4.181,1	165	0	0	5	2	2023-05-12	0	2023-05-12
3564	1874	3		165	1	25.34	4.181,1	4.181,1	165	0	0	5	2	2023-05-12	0	2023-05-12
3565	1744	3		180	1	25.34	4.561,2	4.561,2	180	0	0	5	2	2023-05-12	0	2023-05-12
3566	1858	3		180	1	25.34	4.561,2	4.561,2	180	0	0	5	2	2023-05-12	0	2023-05-12
3570	1757	0		0	1	5.77	0	0	0	40.73	235	5	0	2023-05-12	\N	\N
3571	1757	2	105438867	235	1	25	5.875	5.875	235	0	0	1	2	2023-05-12	28	2023-04-24
3572	1870	2	94612620	235	1	25	5.875	5.875	235	0	0	1	2	2023-05-13	28	2023-05-12
3573	1842	3		180	1	24.34	4.381,2	4.381,2	180	0	0	5	2	2023-05-13	0	2023-05-13
3574	1844	3		185	1	24.60	4.551	4.551	185	0	0	5	2	2023-05-17	0	2023-05-17
3575	1643	3		260	1	25.48	6.624,8	6.624,8	260	0	0	5	2	2023-05-17	0	2023-05-17
3576	1832	2	102414375	60	1	25	1.500	1.500	60	0	0	1	2	2023-05-18	28	2023-05-04
3577	1852	2	102228264	200	1	25	5.000	5.000	200	0	0	1	2	2023-05-18	28	2023-05-04
3578	1662	3		165	1	5.77	952,05	952,05	165	0	0	1	2	2023-05-18	0	2023-05-18
3579	1765	3		165	1	5.77	952,05	952,05	165	0	0	1	2	2023-05-18	0	2023-05-18
3580	1879	3		165	1	5.77	952,05	952,05	165	0	0	1	2	2023-05-18	0	2023-05-18
3581	1908	3		165	1	25	4.125	4.125	165	0	0	1	2	2023-05-18	0	2023-05-18
3582	1663	3		240	1	25.90	6.216	6.216	240	0	0	5	2	2023-05-19	0	2023-05-19
3583	1766	3		240	1	25.90	6.216		240			5	3	2023-05-19	0	2023-05-19
3584	1514	3		205	1	25.90	5.309,5	5.309,5	205	0	0	5	2	2023-05-19	0	2023-05-19
3585	1630	3		205	1	25.90	5.309,5	5.309,5	205	0	0	5	2	2023-05-19	0	2023-05-19
3586	1847	3		175	1	25.90	4.532,5	1.009,75	175	0	0	5	2	2023-05-21	0	2023-05-21
3587	1701	2	152207960	165	1	27	4.455	4.455	165	0	0	5	2	2023-05-23	28	2023-05-23
3588	1598	3		235	1	25	5.875	5.875	235	0	0	1	2	2023-05-24	0	2023-05-24
3589	1647	3		180	1	25	4.500	4.500	180	0	0	1	2	2023-05-24	0	2023-05-24
3590	1752	3		180	1	25	4.500	4.500	180	0	0	1	2	2023-05-24	0	2023-05-24
3591	1633	3		165	1	25	4.125	4.125	165	0	0	1	2	2023-05-24	0	2023-05-24
3592	1737	3		165	1	25	4.125	4.125	165	0	0	1	2	2023-05-24	0	2023-05-24
3593	1738	3		165	1	25	4.125	4.125	165	0	0	1	2	2023-05-24	0	2023-05-24
3594	1748	3		235	1	27	6.345	6.345	235	0	0	5	2	2023-05-24	0	2023-05-24
3595	1707	3		220	1	27	5.940	5.940	220	0	0	5	2	2023-05-24	0	2023-05-24
3596	1826	3		220	1	27	5.940	5.940	220	0	0	5	2	2023-05-24	0	2023-05-24
3597	1871	3		425	1	26	11.050	11.050	425	0	0	5	2	2023-05-26	0	2023-05-26
3598	1887	3		170	1	26.25	4.462,5	4.462,5	170	0	0	1	2	2023-05-31	0	2023-05-31
3599	1575	6		250	1	5.77	1.442,5	1.442,5	250	0	0	1	2	2023-05-31	0	2023-05-31
3600	1688	6		250	1	5.77	1.442,5	1.442,5	250	0	0	1	2	2023-05-31	0	2023-05-31
3601	1791	6		250	1	5.77	1.442,5	1.442,5	250	0	0	1	2	2023-05-31	0	2023-05-31
3602	1898	6		250	1	5.77	1.442,5	1.442,5	250	0	0	1	2	2023-05-31	0	2023-05-31
3603	1886	6		165	1	5.77	952,05	952,05	165	0	0	1	2	2023-05-31	0	2023-05-31
3604	1830	3		175	1	26.25	4.593,75	4.593,75	175	0	0	1	2	2023-05-31	0	2023-05-31
3605	1899	3		440	1	26.25	11.550	11.550	440	0	0	1	2	2023-05-31	0	2023-05-31
3606	1720	3		360	1	25.26	9.093,6	9.093,6	360	0	0	5	2	2023-05-31	0	2023-05-31
3607	1838	2	105334860	165	1	25	4.125	4.125	165	0	0	1	2	2023-05-31	28	2023-05-29
3608	1840	3		360	1	26.25	9.450	9.450	360	0	0	5	2	2023-05-31	0	2023-05-31
3609	1909	3		165	1	25	4.125	4.125	165	0	0	1	2	2023-05-31	0	2023-05-31
3611	1911	0		0	1	5.77	0	0	0	28.6	165	1	0	2023-06-01	\N	\N
3612	1912	0		0	1	5.77	0	0	0	28.6	165	1	0	2023-06-01	\N	\N
3613	1913	0		0	1	5.77	0	0	0	40.73	235	1	0	2023-06-01	\N	\N
3614	1914	0		0	1	5.77	0	0	0	36.4	210	1	0	2023-06-01	\N	\N
3615	1915	0		0	1	5.77	0	0	0	76.26	440	1	0	2023-06-01	\N	\N
3616	1916	0		0	1	5.77	0	0	0	38.13	220	1	0	2023-06-01	\N	\N
3617	1917	0		0	1	5.77	0	0	0	28.6	165	1	0	2023-06-01	\N	\N
3618	1918	0		0	1	5.77	0	0	0	38.13	220	1	0	2023-06-01	\N	\N
3619	1919	0		0	1	5.77	0	0	0	9.53	55	1	0	2023-06-01	\N	\N
3620	1920	0		0	1	5.77	0	0	0	30.33	175	1	0	2023-06-01	\N	\N
3621	1921	0		0	1	5.77	0	0	0	24.26	140	1	0	2023-06-01	\N	\N
3622	1922	0		0	1	5.77	0	0	0	10.4	60	1	0	2023-06-01	\N	\N
3623	1923	0		0	1	5.77	0	0	0	12.13	70	1	0	2023-06-01	\N	\N
3624	1924	0		0	1	5.77	0	0	0	9.53	55	1	0	2023-06-01	\N	\N
3625	1925	0		0	1	5.77	0	0	0	50.26	290	1	0	2023-06-01	\N	\N
3626	1926	0		0	1	5.77	0	0	0	28.6	165	1	0	2023-06-01	\N	\N
3627	1927	0		0	1	5.77	0	0	0	28.6	165	1	0	2023-06-01	\N	\N
3628	1928	0		0	1	5.77	0	0	0	27.73	160	1	0	2023-06-01	\N	\N
3629	1929	0		0	1	5.77	0	0	0	28.6	165	1	0	2023-06-01	\N	\N
3630	1930	0		0	1	5.77	0	0	0	62.39	360	1	0	2023-06-01	\N	\N
3631	1931	0		0	1	5.77	0	0	0	37.26	215	1	0	2023-06-01	\N	\N
3632	1932	0		0	1	5.77	0	0	0	31.2	180	1	0	2023-06-01	\N	\N
3633	1933	0		0	1	5.77	0	0	0	63.26	365	1	0	2023-06-01	\N	\N
3634	1934	0		0	1	5.77	0	0	0	32.06	185	1	0	2023-06-01	\N	\N
3635	1935	0		0	1	5.77	0	0	0	37.26	215	1	0	2023-06-01	\N	\N
3636	1936	0		0	1	5.77	0	0	0	28.6	165	1	0	2023-06-01	\N	\N
3637	1937	0		0	1	5.77	0	0	0	62.39	360	1	0	2023-06-01	\N	\N
3638	1938	0		0	1	5.77	0	0	0	30.33	175	1	0	2023-06-01	\N	\N
3639	1939	0		0	1	5.77	0	0	0	38.99	225	1	0	2023-06-01	\N	\N
3640	1940	0		0	1	5.77	0	0	0	28.6	165	1	0	2023-06-01	\N	\N
3641	1941	0		0	1	5.77	0	0	0	71.06	410	1	0	2023-06-01	\N	\N
3642	1942	0		0	1	5.77	0	0	0	99.65	575	1	0	2023-06-01	\N	\N
3643	1943	0		0	1	5.77	0	0	0	34.66	200	1	0	2023-06-01	\N	\N
3644	1944	0		0	1	5.77	0	0	0	69.32	400	1	0	2023-06-01	\N	\N
3645	1945	0		0	1	5.77	0	0	0	35.53	205	1	0	2023-06-01	\N	\N
3646	1946	0		0	1	5.77	0	0	0	20.8	120	1	0	2023-06-01	\N	\N
3647	1947	0		0	1	5.77	0	0	0	28.6	165	1	0	2023-06-01	\N	\N
3648	1948	0		0	1	5.77	0	0	0	28.6	165	1	0	2023-06-01	\N	\N
3649	1949	0		0	1	5.77	0	0	0	51.99	300	1	0	2023-06-01	\N	\N
3650	1950	0		0	1	5.77	0	0	0	60.66	350	1	0	2023-06-01	\N	\N
3651	1951	0		0	1	5.77	0	0	0	31.2	180	1	0	2023-06-01	\N	\N
3652	1952	0		0	1	5.77	0	0	0	54.59	315	1	0	2023-06-01	\N	\N
3653	1953	0		0	1	5.77	0	0	0	28.6	165	1	0	2023-06-01	\N	\N
3654	1954	0		0	1	5.77	0	0	0	45.06	260	1	0	2023-06-01	\N	\N
3655	1955	0		0	1	5.77	0	0	0	40.73	235	1	0	2023-06-01	\N	\N
3656	1956	0		0	1	5.77	0	0	0	41.59	240	1	0	2023-06-01	\N	\N
3657	1957	0		0	1	5.77	0	0	0	36.4	210	1	0	2023-06-01	\N	\N
3658	1958	0		0	1	5.77	0	0	0	31.2	180	1	0	2023-06-01	\N	\N
3659	1959	0		0	1	5.77	0	0	0	28.6	165	1	0	2023-06-01	\N	\N
3660	1960	0		0	1	5.77	0	0	0	40.73	235	1	0	2023-06-01	\N	\N
3661	1961	0		0	1	5.77	0	0	0	47.66	275	1	0	2023-06-01	\N	\N
3662	1962	0		0	1	5.77	0	0	0	38.13	220	1	0	2023-06-01	\N	\N
3663	1963	0		0	1	5.77	0	0	0	40.73	235	1	0	2023-06-01	\N	\N
3664	1964	0		0	1	5.77	0	0	0	73.66	425	1	0	2023-06-01	\N	\N
3665	1965	0		0	1	5.77	0	0	0	70.19	405	1	0	2023-06-01	\N	\N
3666	1966	0		0	1	5.77	0	0	0	31.2	180	1	0	2023-06-01	\N	\N
3667	1967	0		0	1	5.77	0	0	0	51.99	300	1	0	2023-06-01	\N	\N
3668	1968	0		0	1	5.77	0	0	0	28.6	165	1	0	2023-06-01	\N	\N
3669	1969	0		0	1	5.77	0	0	0	55.46	320	1	0	2023-06-01	\N	\N
3670	1970	0		0	1	5.77	0	0	0	50.26	290	1	0	2023-06-01	\N	\N
3671	1971	0		0	1	5.77	0	0	0	26	150	1	0	2023-06-01	\N	\N
3672	1972	0		0	1	5.77	0	0	0	76.26	440	1	0	2023-06-01	\N	\N
3673	1973	0		0	1	5.77	0	0	0	27.73	160	1	0	2023-06-01	\N	\N
3674	1974	0		0	1	5.77	0	0	0	41.59	240	1	0	2023-06-01	\N	\N
3675	1975	0		0	1	5.77	0	0	0	28.6	165	1	0	2023-06-01	\N	\N
3676	1976	0		0	1	5.77	0	0	0	40.73	235	1	0	2023-06-01	\N	\N
3677	1977	0		0	1	5.77	0	0	0	50.26	290	1	0	2023-06-01	\N	\N
3678	1978	0		0	1	5.77	0	0	0	30.33	175	1	0	2023-06-01	\N	\N
3679	1979	0		0	1	5.77	0	0	0	28.6	165	1	0	2023-06-01	\N	\N
3680	1980	0		0	1	5.77	0	0	0	28.6	165	1	0	2023-06-01	\N	\N
3682	1982	0		0	1	5.77	0	0	0	54.59	315	1	0	2023-06-01	\N	\N
3683	1983	0		0	1	5.77	0	0	0	31.2	180	1	0	2023-06-01	\N	\N
3684	1984	0		0	1	5.77	0	0	0	54.59	315	1	0	2023-06-01	\N	\N
3685	1985	0		0	1	5.77	0	0	0	53.73	310	1	0	2023-06-01	\N	\N
3687	1987	0		0	1	5.77	0	0	0	34.66	200	1	0	2023-06-01	\N	\N
3688	1988	0		0	1	5.77	0	0	0	29.46	170	1	0	2023-06-01	\N	\N
3689	1989	0		0	1	5.77	0	0	0	19.93	115	1	0	2023-06-01	\N	\N
3690	1990	0		0	1	5.77	0	0	0	41.59	240	1	0	2023-06-01	\N	\N
3691	1991	0		0	1	5.77	0	0	0	51.99	300	1	0	2023-06-01	\N	\N
3692	1992	0		0	1	5.77	0	0	0	39.86	230	1	0	2023-06-01	\N	\N
3693	1993	0		0	1	5.77	0	0	0	45.93	265	1	0	2023-06-01	\N	\N
3694	1994	0		0	1	5.77	0	0	0	76.26	440	1	0	2023-06-01	\N	\N
3695	1995	0		0	1	5.77	0	0	0	26	150	1	0	2023-06-01	\N	\N
3696	1996	0		0	1	5.77	0	0	0	28.6	165	1	0	2023-06-01	\N	\N
3697	1997	0		0	1	5.77	0	0	0	13	75	1	0	2023-06-01	\N	\N
3698	1998	0		0	1	5.77	0	0	0	54.59	315	1	0	2023-06-01	\N	\N
3699	1999	0		0	1	5.77	0	0	0	21.66	125	1	0	2023-06-01	\N	\N
3700	2000	0		0	1	5.77	0	0	0	31.2	180	1	0	2023-06-01	\N	\N
3701	2001	0		0	1	5.77	0	0	0	43.33	250	1	0	2023-06-01	\N	\N
3702	1928	3		160	1	25	4.000	4.000	160	0	0	1	2	2023-06-01	0	2023-06-01
3703	1487	6		55	1	5.77	317,35	317,35	55	0	0	1	2	2023-06-01	0	2023-06-01
3704	1919	6		55	1	5.77	317,35	317,35	55	0	0	1	2	2023-06-01	0	2023-06-01
3705	1829	6		55	1	5.77	317,35	317,35	55	0	0	1	2	2023-06-01	0	2023-06-01
3706	1710	6		55	1	5.77	317,35	317,35	55	0	0	1	2	2023-06-01	0	2023-06-01
3707	1604	6		55	1	5.77	317,35	317,35	55	0	0	1	2	2023-06-01	0	2023-06-01
3708	1901	3		165	1	26.25	4.331,25	4.331,25	165	0	0	1	2	2023-06-01	0	2023-06-01
3709	1892	2	142919287	270	1	25	6.750	6.750	270	0	0	1	2	2023-06-01	28	2023-05-31
3710	1963	2	104903736	235	1	26.25	6.168,75	1.355,95	235	0	0	1	2	2023-06-01	28	2023-05-29
3711	1855	3		165	1	26.25	4.331,25	4.331,25	165	0	0	1	2	2023-06-01	0	2023-06-01
3712	1935	3		215	1	26.25	5.643,75	5.643,75	215	0	0	1	2	2023-06-02	0	2023-06-02
3713	1747	3		260	1	26.25	6.825	6.825	260	0	0	1	2	2023-06-02	0	2023-06-02
3714	1846	3		360	1	26.25	9.450	9.450	360	0	0	1	2	2023-06-02	0	2023-06-02
3715	1885	2	134076791	165	1	26.46	4.365,9	4.365,9	165	-0	0	5	2	2023-06-02	28	2023-06-02
3716	1912	3		165	1	26.59	4.387,35	4.387,35	165	0	0	5	2	2023-06-05	0	2023-06-05
3717	874	6		165	1	5.77	952,05	952,05	165	0	0	1	2	2023-06-05	0	2023-06-05
3718	1009	6		165	1	5.77	952,05	952,05	165	0	0	1	2	2023-06-05	0	2023-06-05
3719	1130	6		165	1	5.77	952,05	952,05	165	0	0	1	2	2023-06-05	0	2023-06-05
3720	1268	6		165	1	5.77	952,05	952,05	165	0	0	1	2	2023-06-05	0	2023-06-05
3721	1392	6		165	1	5.77	952,05	952,05	165	0	0	1	2	2023-06-05	0	2023-06-05
3722	1504	6		165	1	5.77	952,05	952,05	165	0	0	1	2	2023-06-05	0	2023-06-05
3723	1621	6		165	1	5.77	952,05	952,05	165	0	0	1	2	2023-06-05	0	2023-06-05
3724	1726	6		165	1	5.77	952,05	952,05	165	0	0	1	2	2023-06-05	0	2023-06-05
3725	1845	6		165	1	5.77	952,05	952,05	165	0	0	1	2	2023-06-05	0	2023-06-05
3726	1936	6		165	1	5.77	952,05	952,05	165	0	0	1	2	2023-06-05	0	2023-06-05
3727	1763	2	142736262	290	1	26.25	7.612,5	7.612,5	290	0	0	1	2	2023-06-06	28	2023-06-05
3728	1876	2	142736262	290	1	26.52	7.690,8	7.690,8	290	0	0	1	2	2023-06-06	28	2023-06-05
3729	1859	3		315	1	26.59	8.375,85	8.375,85	315	0	0	5	2	2023-06-06	0	2023-06-06
3730	1952	3		315	1	26.59	8.375,85	8.375,85	315	0	0	5	2	2023-06-06	0	2023-06-06
3731	1884	3		175	1	26.59	4.653,25	4.653,25	175	0	0	5	2	2023-06-06	0	2023-06-06
3732	1978	3		175	1	26.59	4.653,25	4.653,25	175	0	0	5	2	2023-06-06	0	2023-06-06
3733	1970	6		290	1	26	7.540	7.540	290	0	0	1	2	2023-06-06	0	2023-06-06
3734	1965	6		405	1	1	405	10.768,95	405	0	0	1	2	2023-06-06	0	2023-06-06
3735	1990	2	95147327	240	1	26.63	6.391,2	6.391,2	240	0	0	5	2	2023-06-07	28	2023-06-07
3736	1896	3		230	1	26.59	6.115,7	6.115,7	230	0	0	1	2	2023-06-07	0	2023-06-07
3737	1904	3		125	1	26.59	3.323,75	3.323,75	125	0	0	5	2	2023-06-07	0	2023-06-07
3738	1999	3		125	1	26.59	3.323,75	3.323,75	125	0	0	5	2	2023-06-07	0	2023-06-07
3739	1932	3		180	1	26.70	4.806	4.806	180	0	0	5	2	2023-06-08	0	2023-06-08
3740	1891	3		310	1	26.70	8.277	8.277	310	0	0	5	2	2023-06-08	0	2023-06-08
3741	1985	3		310	1	26.70	8.277	8.277	310	0	0	5	2	2023-06-08	0	2023-06-08
3742	1893	3		200	1	26.70	5.340	5.340	200	0	0	5	2	2023-06-08	0	2023-06-08
3743	1987	3		200	1	26.70	5.340	5.340	200	0	0	5	2	2023-06-08	0	2023-06-08
3744	1988	3		170	1	26.70	4.539	4.539	170	0	0	5	2	2023-06-08	0	2023-06-08
3746	1900	0		0	1	5.77	0	0	0	26	150	5	0	2023-06-08	\N	\N
3747	1900	3		150	1	26.59	3.988,5	3.988,5	150	0	0	5	2	2023-06-08	0	2023-06-08
3748	1995	3		150	1	26.59	3.988,5	3.988,5	150	0	0	5	2	2023-06-08	0	2023-06-08
3749	1753	3		165	1	25.59	4.222,35	4.222,35	165	0	0	5	2	2023-06-08	0	2023-06-08
3750	1866	3		165	1	26.59	4.387,35	4.387,35	165	0	0	5	2	2023-06-08	0	2023-06-08
3751	1959	3		165	1	26.59	4.387,35	4.387,35	165	0	0	5	2	2023-06-08	0	2023-06-08
3752	1648	3		165	1	26.59	4.387,35	4.387,35	165	0	0	5	2	2023-06-08	0	2023-06-08
3753	1533	3		165	1	5.77	952,05	952,05	165	0	0	5	2	2023-06-08	0	2023-06-08
3754	1420	3		165	1	26.59	4.387,35	4.387,35	165	0	0	5	2	2023-06-08	0	2023-06-08
3755	1872	3		180	1	26.59	4.786,2	4.786,2	180	0	0	1	2	2023-06-09	0	2023-06-09
3756	1617	3		215	1	26.59	5.716,85	5.716,85	215	0	0	1	2	2023-06-09	0	2023-06-09
3757	1722	3		215	1	26.95	5.794,25	5.794,25	215	0	0	1	2	2023-06-09	0	2023-06-09
3758	1861	3		260	1	26.83	6.975,8	6.975,8	260	0	0	5	2	2023-06-11	0	2023-06-11
3759	1705	3		210	1	26.83	5.634,3	1.211,7	210	0	0	5	2	2023-06-11	0	2023-06-11
3760	1938	3		175	1	26.65	4.663,75	4.663,75	175	0	0	1	2	2023-06-13	0	2023-06-13
3761	1853	3		400	1	26.83	10.732	10.732	400	0	0	5	2	2023-06-13	0	2023-06-13
3762	1824	3		210	1	27.01	5.672,1	1.211,7	210	0	0	5	2	2023-06-14	0	2023-06-14
3763	1828	3		220	1	27.25	5.995	5.995	220	0	0	5	2	2023-06-14	0	2023-06-14
3764	1857	3		350	1	27.52	9.632	9.632	350	0	0	5	2	2023-06-14	0	2023-06-14
3765	1831	2	94933980	140	1	27.01	3.781,4	3.781,4	140	0	0	5	2	2023-06-15	28	2023-06-15
3766	1850	2	94933980	410	1	27.01	11.074,1	11.074,1	410	0	0	5	2	2023-06-15	28	2023-06-15
3767	1921	2	94933980	140	1	27.01	3.781,4	3.781,4	140	0	0	5	2	2023-06-15	28	2023-06-15
3768	1941	2	94933980	410	1	27.01	11.074,1	11.074,1	410	0	0	5	2	2023-06-15	28	2023-06-15
3769	1922	2	115231510	60	1	27.17	1.630,2	1.630,2	60	0	0	5	2	2023-06-16	28	2023-06-16
3770	1943	2	115047098	200	1	27.17	5.434	5.434	200	0	0	5	2	2023-06-16	28	2023-06-16
3771	1860	3		165	1	27	4.455	4.455	165	0	0	1	2	2023-06-20	0	2023-06-20
3772	1674	3		180	1	27	4.860	4.860	180	0	0	1	2	2023-06-20	0	2023-06-20
3773	1865	3		180	1	27	4.860	4.860	180	0	0	1	2	2023-06-20	0	2023-06-20
3774	1958	3		180	1	27	4.860	4.860	180	0	0	1	2	2023-06-20	0	2023-06-20
3775	1778	3		180	1	27	4.860	4.860	180	0	0	1	2	2023-06-20	0	2023-06-20
3776	1889	3		180	1	27	4.860	4.860	180	0	0	1	2	2023-06-20	0	2023-06-20
3777	1983	3		180	1	27	4.860	4.860	180	0	0	1	2	2023-06-20	0	2023-06-20
3778	1704	3		235	1	27	6.345	1.355,95	235	0	0	1	2	2023-06-20	0	2023-06-20
3779	1823	3		235	1	27	6.345	6.345	235	0	0	1	2	2023-06-20	0	2023-06-20
3780	1913	3		235	1	27	6.345	6.345	235	0	0	1	2	2023-06-20	0	2023-06-20
3781	1960	3		235	1	27	6.345	6.345	235	0	0	1	2	2023-06-20	0	2023-06-20
3782	1867	3		235	1	27	6.345	6.345	235	0	0	1	2	2023-06-20	0	2023-06-20
3783	1754	3		235	1	27	6.345	6.345	235	0	0	1	2	2023-06-20	0	2023-06-20
3784	1712	3		70	1	27	1.890	403,9	70	0	0	1	2	2023-06-20	0	2023-06-20
3785	1833	3		70	1	27	1.890	1.890	70	0	0	1	2	2023-06-20	0	2023-06-20
3786	1923	3		70	1	27	1.890	1.890	70	0	0	1	2	2023-06-20	0	2023-06-20
3787	1934	3		185	1	27.17	5.026,45	5.026,45	185	-0	0	5	2	2023-06-20	0	2023-06-20
3788	1873	3		300	1	27	8.100	8.100	300	0	0	5	2	2023-06-20	0	2023-06-20
3789	1967	3		300	1	27	8.100	8.100	300	0	0	5	2	2023-06-20	0	2023-06-20
3791	1910	0		0	1	5.77	0	0	0	43.33	250	1	0	2023-06-21	\N	\N
3792	1910	3		250	1	27	6.750	6.750	250	0	0	1	2	2023-06-21	0	2023-06-21
3793	1964	3		425	1	27	11.475	11.475	425	0	0	5	2	2023-06-21	0	2023-06-21
3794	1980	6		165	1	5.77	952,05	952,05	165	0	0	1	2	2023-06-21	0	2023-06-21
3795	1895	3		300	1	27.54	8.262	8.262	300	0	0	5	2	2023-06-23	0	2023-06-23
3796	1991	3		300	1	27.54	8.262	8.262	300	0	0	5	2	2023-06-23	0	2023-06-23
3797	1946	3		120	1	27.54	3.304,8	3.304,8	120	0	0	5	2	2023-06-24	0	2023-06-24
3798	2002	0		0	1	5.77	0	0	0	8400	300	1	0	2023-04-01	\N	\N
3799	2003	0		0	1	5.77	0	0	0	8400	300	1	0	2023-05-01	\N	\N
3800	2004	0		0	1	5.77	0	0	0	8400	300	1	0	2023-06-01	\N	\N
3801	1795	3		75	1	27	2.025	2.025	75	0	0	1	2	2023-06-27	0	2023-06-27
3802	1902	3		75	1	27	2.025	2.025	75	0	0	1	2	2023-06-27	0	2023-06-27
3803	1997	3		75	1	27	2.025	2.025	75	0	0	1	2	2023-06-27	0	2023-06-27
3804	1756	3		220	1	27	5.940	5.940	220	0	0	1	2	2023-06-27	0	2023-06-27
3805	1869	3		220	1	27	5.940	5.940	220	0	0	1	2	2023-06-27	0	2023-06-27
3806	1962	3		220	1	27	5.940	5.940	220	0	0	1	2	2023-06-27	0	2023-06-27
3807	1920	2		175	1	27.61	4.831,75	4.831,75	175	0	0	5	2	2023-06-27	0	2023-06-27
3808	1994	3		440	1	27.61	12.148,4	12.148,4	440	0	0	5	2	2023-06-27	0	2023-06-27
3809	1939	3		225	1	27.71	6.234,75	6.234,75	225	0	0	5	2	2023-06-28	0	2023-06-28
3810	1890	3		315	1	27.85	8.772,75	8.772,75	315	0	0	5	2	2023-06-30	0	2023-06-30
3811	1984	3		315	1	27.85	8.772,75	8.772,75	315	0	0	5	2	2023-06-30	0	2023-06-30
3812	2005	0		0	1	5.77	0	0	0	64.99	375	2	0	2023-07-01	\N	\N
3813	2006	0		0	1	5.77	0	0	0	428.94	247.5	2	0	2023-07-01	\N	\N
3814	2007	0		0	1	5.77	0	0	0	584.92	337.5	2	0	2023-07-01	\N	\N
3815	2008	0		0	1	5.77	0	0	0	428.94	247.5	2	0	2023-07-01	\N	\N
3816	2009	0		0	1	5.77	0	0	0	610.92	352.5	2	0	2023-07-01	\N	\N
3817	2010	0		0	1	5.77	0	0	0	54.59	315	2	0	2023-07-01	\N	\N
3818	2011	0		0	1	5.77	0	0	0	114.38	660	2	0	2023-07-01	\N	\N
3819	2012	0		0	1	5.77	0	0	0	57.19	330	2	0	2023-07-01	\N	\N
3820	2013	0		0	1	5.77	0	0	0	103.99	600	2	0	2023-07-01	\N	\N
3821	2014	0		0	1	5.77	0	0	0	428.94	247.5	2	0	2023-07-01	\N	\N
3822	2015	0		0	1	5.77	0	0	0	57.19	330	2	0	2023-07-01	\N	\N
3824	2017	0		0	1	5.77	0	0	0	15.6	90	2	0	2023-07-01	\N	\N
3826	2019	0		0	1	5.77	0	0	0	18.2	105	2	0	2023-07-01	\N	\N
3827	2020	0		0	1	5.77	0	0	0	142.98	82.5	2	0	2023-07-01	\N	\N
3828	2021	0		0	1	5.77	0	0	0	75.39	435	2	0	2023-07-01	\N	\N
3829	2022	0		0	1	5.77	0	0	0	428.94	247.5	2	0	2023-07-01	\N	\N
3830	2023	0		0	1	5.77	0	0	0	428.94	247.5	2	0	2023-07-01	\N	\N
3831	2024	0		0	1	5.77	0	0	0	41.59	240	2	0	2023-07-01	\N	\N
3832	2025	0		0	1	5.77	0	0	0	428.94	247.5	2	0	2023-07-01	\N	\N
3833	2026	0		0	1	5.77	0	0	0	428.94	247.5	2	0	2023-07-01	\N	\N
3834	2027	0		0	1	5.77	0	0	0	155.98	900	2	0	2023-07-01	\N	\N
3835	2028	0		0	1	5.77	0	0	0	428.94	247.5	2	0	2023-07-01	\N	\N
3836	2029	0		0	1	5.77	0	0	0	54.59	315	2	0	2023-07-01	\N	\N
3837	2030	0		0	1	5.77	0	0	0	93.59	540	2	0	2023-07-01	\N	\N
3838	2031	0		0	1	5.77	0	0	0	558.93	322.5	2	0	2023-07-01	\N	\N
3839	2032	0		0	1	5.77	0	0	0	46.79	270	2	0	2023-07-01	\N	\N
3840	2033	0		0	1	5.77	0	0	0	948.87	547.5	2	0	2023-07-01	\N	\N
3842	2035	0		0	1	5.77	0	0	0	111.79	645	2	0	2023-07-01	\N	\N
3843	2036	0		0	1	5.77	0	0	0	93.59	540	2	0	2023-07-01	\N	\N
3844	2037	0		0	1	5.77	0	0	0	454.94	262.5	2	0	2023-07-01	\N	\N
3845	2038	0		0	1	5.77	0	0	0	31.2	180	2	0	2023-07-01	\N	\N
3846	2039	0		0	1	5.77	0	0	0	584.92	337.5	2	0	2023-07-01	\N	\N
3847	2040	0		0	1	5.77	0	0	0	428.94	247.5	2	0	2023-07-01	\N	\N
3849	2042	0		0	1	5.77	0	0	0	1494.8	862.5	2	0	2023-07-01	\N	\N
3850	2043	0		0	1	5.77	0	0	0	51.99	300	2	0	2023-07-01	\N	\N
3851	2044	0		0	1	5.77	0	0	0	103.99	600	2	0	2023-07-01	\N	\N
3852	2045	0		0	1	5.77	0	0	0	532.93	307.5	2	0	2023-07-01	\N	\N
3853	2046	0		0	1	5.77	0	0	0	31.2	180	2	0	2023-07-01	\N	\N
3854	2047	0		0	1	5.77	0	0	0	428.94	247.5	2	0	2023-07-01	\N	\N
3855	2048	0		0	1	5.77	0	0	0	428.94	247.5	2	0	2023-07-01	\N	\N
3856	2049	0		0	1	5.77	0	0	0	77.99	450	2	0	2023-07-01	\N	\N
3857	2050	0		0	1	5.77	0	0	0	90.99	525	2	0	2023-07-01	\N	\N
3858	2051	0		0	1	5.77	0	0	0	46.79	270	2	0	2023-07-01	\N	\N
3859	2052	0		0	1	5.77	0	0	0	818.89	472.5	2	0	2023-07-01	\N	\N
3860	2053	0		0	1	5.77	0	0	0	428.94	247.5	2	0	2023-07-01	\N	\N
3861	2054	0		0	1	5.77	0	0	0	67.59	390	2	0	2023-07-01	\N	\N
3862	2055	0		0	1	5.77	0	0	0	610.92	352.5	2	0	2023-07-01	\N	\N
3863	2056	0		0	1	5.77	0	0	0	62.39	360	2	0	2023-07-01	\N	\N
3864	2057	0		0	1	5.77	0	0	0	54.59	315	2	0	2023-07-01	\N	\N
3865	2058	0		0	1	5.77	0	0	0	46.79	270	2	0	2023-07-01	\N	\N
3866	2059	0		0	1	5.77	0	0	0	428.94	247.5	2	0	2023-07-01	\N	\N
3867	2060	0		0	1	5.77	0	0	0	122.18	705	2	0	2023-07-01	\N	\N
3868	2061	0		0	1	5.77	0	0	0	77.99	450	2	0	2023-07-01	\N	\N
3869	2062	0		0	1	5.77	0	0	0	428.94	247.5	2	0	2023-07-01	\N	\N
3870	2063	0		0	1	5.77	0	0	0	714.9	412.5	2	0	2023-07-01	\N	\N
3871	2064	0		0	1	5.77	0	0	0	57.19	330	2	0	2023-07-01	\N	\N
3872	2065	0		0	1	5.77	0	0	0	610.92	352.5	2	0	2023-07-01	\N	\N
3873	2066	0		0	1	5.77	0	0	0	1104.85	637.5	2	0	2023-07-01	\N	\N
3874	2067	0		0	1	5.77	0	0	0	46.79	270	2	0	2023-07-01	\N	\N
3875	2068	0		0	1	5.77	0	0	0	77.99	450	2	0	2023-07-01	\N	\N
3876	2069	0		0	1	5.77	0	0	0	428.94	247.5	2	0	2023-07-01	\N	\N
3877	2070	0		0	1	5.77	0	0	0	83.19	480	2	0	2023-07-01	\N	\N
3878	2071	0		0	1	5.77	0	0	0	38.99	225	2	0	2023-07-01	\N	\N
3879	2072	0		0	1	5.77	0	0	0	114.38	660	2	0	2023-07-01	\N	\N
3880	2073	0		0	1	5.77	0	0	0	41.59	240	2	0	2023-07-01	\N	\N
3881	2074	0		0	1	5.77	0	0	0	166.38	960	2	0	2023-07-01	\N	\N
3882	2075	0		0	1	5.77	0	0	0	428.94	247.5	2	0	2023-07-01	\N	\N
3883	2076	0		0	1	5.77	0	0	0	62.39	360	2	0	2023-07-01	\N	\N
3884	2077	0		0	1	5.77	0	0	0	428.94	247.5	2	0	2023-07-01	\N	\N
3885	2078	0		0	1	5.77	0	0	0	610.92	352.5	2	0	2023-07-01	\N	\N
3886	2079	0		0	1	5.77	0	0	0	75.39	435	2	0	2023-07-01	\N	\N
3887	2080	0		0	1	5.77	0	0	0	454.94	262.5	2	0	2023-07-01	\N	\N
3888	2081	0		0	1	5.77	0	0	0	428.94	247.5	2	0	2023-07-01	\N	\N
3889	2082	0		0	1	5.77	0	0	0	44.19	255	2	0	2023-07-01	\N	\N
3890	2083	0		0	1	5.77	0	0	0	818.89	472.5	2	0	2023-07-01	\N	\N
3891	2084	0		0	1	5.77	0	0	0	46.79	270	2	0	2023-07-01	\N	\N
3892	2085	0		0	1	5.77	0	0	0	818.89	472.5	2	0	2023-07-01	\N	\N
3893	2086	0		0	1	5.77	0	0	0	80.59	465	2	0	2023-07-01	\N	\N
3894	2087	0		0	1	5.77	0	0	0	70.19	405	2	0	2023-07-01	\N	\N
3895	2088	0		0	1	5.77	0	0	0	51.99	300	2	0	2023-07-01	\N	\N
3896	2089	0		0	1	5.77	0	0	0	44.19	255	2	0	2023-07-01	\N	\N
3897	2090	0		0	1	5.77	0	0	0	298.96	172.5	2	0	2023-07-01	\N	\N
3898	2091	0		0	1	5.77	0	0	0	62.39	360	2	0	2023-07-01	\N	\N
3899	2092	0		0	1	5.77	0	0	0	77.99	450	2	0	2023-07-01	\N	\N
3900	2093	0		0	1	5.77	0	0	0	119.58	690	2	0	2023-07-01	\N	\N
3901	2094	0		0	1	5.77	0	0	0	688.91	397.5	2	0	2023-07-01	\N	\N
3902	2095	0		0	1	5.77	0	0	0	18.2	105	2	0	2023-07-01	\N	\N
3903	2096	0		0	1	5.77	0	0	0	114.38	660	2	0	2023-07-01	\N	\N
3904	2097	0		0	1	5.77	0	0	0	38.99	225	2	0	2023-07-01	\N	\N
3905	2098	0		0	1	5.77	0	0	0	428.94	247.5	2	0	2023-07-01	\N	\N
3906	2099	0		0	1	5.77	0	0	0	194.97	112.5	2	0	2023-07-01	\N	\N
3907	2100	0		0	1	5.77	0	0	0	818.89	472.5	2	0	2023-07-01	\N	\N
3908	2101	0		0	1	5.77	0	0	0	324.96	187.5	2	0	2023-07-01	\N	\N
3909	2102	0		0	1	5.77	0	0	0	46.79	270	2	0	2023-07-01	\N	\N
3910	2103	0		0	1	5.77	0	0	0	64.99	375	2	0	2023-07-01	\N	\N
3911	2024	3		240	1	27.85	6.684	6.684	240	0	0	5	2	2023-07-01	0	2023-07-01
3912	1951	2		180	1	28.01	5.041,8	5.041,8	180	0	0	5	2	2023-07-02	0	2023-07-02
3913	1953	3		165	1	28	4.620	4.620	165	0	0	5	2	2023-07-03	0	2023-07-03
3918	1930	3		360	1	28.01	10.083,6	10.083,6	360	0	0	5	2	2023-07-04	0	2023-07-04
3919	1996	3		165	1	28.01	4.621,65	4.621,65	165	-0	0	5	2	2023-07-04	0	2023-07-04
3920	1856	3		165	1	28.01	4.621,65	4.621,65	165	-0	0	5	2	2023-07-04	0	2023-07-04
3921	1948	3		165	1	28.01	4.621,65	4.621,65	165	-0	0	5	2	2023-07-04	0	2023-07-04
3922	2017	2	141752978	90	1	28.01	2.520,9	2.520,9	90	0	0	5	2	2023-07-04	28	2023-07-04
3923	2043	2	141617179	300	1	28.01	8.403	8.403	300	0	0	5	2	2023-07-04	28	2023-07-04
3917	1981	0		0	1	5.77	0	0	0	44.19	170	5	0	2023-07-03	\N	\N
3924	1981	3		170	1	28	4.760	4.760	170	0	0	1	2	2023-07-04	0	2023-07-04
3925	1862	3		235	1	28.01	6.582,35	6.582,35	235	0	0	5	2	2023-07-05	0	2023-07-05
3926	1955	3		235	1	28.01	6.582,35	6.582,35	235	0	0	5	2	2023-07-05	0	2023-07-05
3927	1916	3		220	1	28.01	6.162,2	6.162,2	220	-0	0	5	2	2023-07-05	0	2023-07-05
3928	1976	3		235	1	28.01	6.582,35	6.582,35	235	0	0	5	2	2023-07-05	0	2023-07-05
3929	2086	3		465	1	28	13.020	13.020	465	0	0	5	2	2023-07-05	0	2023-07-05
3930	2088	3		300	1	28	8.400	8.400	300	0	0	5	2	2023-07-05	0	2023-07-05
3931	2089	3		255	1	28	7.140	7.140	255	0	0	5	2	2023-07-05	0	2023-07-05
3932	1954	3		260	1	28	7.280	7.280	260	0	0	5	2	2023-07-06	0	2023-07-06
3933	2095	3		105	1	28.16	2.956,8	2.956,8	105	0	0	5	2	2023-07-06	0	2023-07-06
3934	1734	3		205	1	28.18	5.776,9	5.776,9	205	0	0	5	2	2023-07-06	0	2023-07-06
3935	1880	3		240	1	28.18	6.763,2	6.763,2	240	0	0	5	2	2023-07-06	0	2023-07-06
3936	1918	3		220	1	28.27	6.219,4	6.219,4	220	0	0	5	2	2023-07-07	0	2023-07-07
3937	2015	3		330	1	28.27	9.329,1	9.329,1	330	0	0	5	2	2023-07-07	0	2023-07-07
3938	1950	3		350	1	28.27	9.894,5	9.894,5	350	0	0	5	2	2023-07-07	0	2023-07-07
3939	2050	3		525	1	28.27	14.841,75	14.841,75	525	0	0	5	2	2023-07-07	0	2023-07-07
3940	1992	3		230	1	28.27	6.502,1	6.502,1	230	0	0	5	2	2023-07-07	0	2023-07-07
3941	2032	3		270	1	28.30	7.641	7.641	270	0	0	5	2	2023-07-08	0	2023-07-08
3942	2051	3		270	1	28.30	7.641	7.641	270	0	0	5	2	2023-07-08	0	2023-07-08
3943	2046	3		180	1	28	5.040	5.040	180	0	0	5	2	2023-07-09	0	2023-07-09
3944	1822	2	104718148	165	1	28.31	4.671,15	4.671,15	165	0	0	5	2	2023-07-11	28	2023-07-10
3945	2092	3		450	1	28.20	12.690	12.690	450	0	0	5	2	2023-07-11	0	2023-07-11
3947	2096	3		660	1	28.20	18.612	18.612	660	0	0	5	2	2023-07-11	0	2023-07-11
3948	2018	0		0	1	5.77	0	0	0	454.94	262.5	5	0	2023-07-11	\N	\N
3949	2018	3		262.5	1	28.20	7.402,5	7.402,5	262,50	0	2.362,5	5	2	2023-07-11	0	2023-07-11
3955	2001	3		250	1	28.35	7.087,5	7.087,5	250	0	0	5	2	2023-07-13	0	2023-07-13
3956	2103	3		375	1	28.35	10.631,25	10.631,25	375	0	0	5	2	2023-07-13	0	2023-07-13
3957	2013	3		600	1	28.35	17.010	17.010	600	0	0	5	2	2023-07-13	0	2023-07-13
3958	1968	3		165	1	28	4.620	4.620	165	0	0	5	2	2023-07-13	0	2023-07-13
3959	2069	3		247.5	1	28	6.930	6.930	247,5	0	2.227,5	5	2	2023-07-13	0	2023-07-13
3960	1894	3		115	1	28.35	3.260,25	3.260,25	115	0	0	5	2	2023-07-13	0	2023-07-13
3961	1989	3		115	1	28.35	3.260,25	3.260,25	115	0	0	5	2	2023-07-13	0	2023-07-13
3962	1888	3		315	1	28.35	8.930,25	8.930,25	315	0	0	5	2	2023-07-13	0	2023-07-13
3963	1982	3		315	1	28.35	8.930,25	8.930,25	315	0	0	5	2	2023-07-13	0	2023-07-13
3964	1903	3		315	1	28.45	8.961,75	8.961,75	315	0	0	5	2	2023-07-14	0	2023-07-14
3965	1998	3		315	1	28.45	8.961,75	8.961,75	315	0	0	5	2	2023-07-14	0	2023-07-14
3966	2100	3		472.5	1	28.45	13.442,63	13.442,63	472,50	0	4.252,5	5	2	2023-07-14	0	2023-07-14
3967	2007	3		337.5	1	28.45	9.601,88	9.601,88	337,50	0	3.037,5	5	2	2023-07-14	0	2023-07-14
3968	2104	3		337.5	1	28.45	9.601,88	9.601,88	337,5	0	3.037,5	5	2	2023-07-14	0	2023-07-14
3969	2105	3		337.5	1	28.45	9.601,88	9.601,88	337,5	0	3.037,5	5	2	2023-07-14	0	2023-07-14
3974	2034	0		0	1	5.77	0	0	0	480.94	277.5	1	0	2023-07-16	\N	\N
3976	2026	3		247.5	1	28	6.930	6.930	247,50	0	2.227,5	1	2	2023-07-16	0	2023-07-16
3977	2108	3		247.5	1	28	6.930	6.930	247,50	0	2.227,5	1	2	2023-07-16	0	2023-07-16
3978	2109	3		247.5	1	28	6.930	6.930	247,50	0	2.227,5	1	2	2023-07-16	0	2023-07-16
3979	1971	3		150	1	28	4.200	4.200	150	0	0	5	2	2023-07-16	0	2023-07-16
3980	2071	3		225	1	28	6.300	6.300	225	0	0	5	2	2023-07-16	0	2023-07-16
3981	2000	3		180	1	28.60	5.148	5.148	180	0	0	5	2	2023-07-18	0	2023-07-18
3982	1937	3		360	1	28.81	10.371,6	10.371,6	360	0	0	5	2	2023-07-19	0	2023-07-19
3983	2036	3		540	1	28.81	15.557,4	15.557,4	540	0	0	5	2	2023-07-19	0	2023-07-19
3984	2110	3		240	1	28.81	6.914,4	6.914,4	240	0	0	5	2	2023-07-19	0	2023-07-19
3985	2066	3		637.5	1	28.81	18.366,38	18.366,38	637,50	0	0	5	2	2023-07-19	0	2023-07-19
3986	2065	2	94527353	352.5	1	28.30	9.975,75	9.975,75	352,50	0	0	5	2	2023-07-19	28	2023-07-10
3987	2064	3		330	1	28.87	9.527,1	9.527,1	330	0	0	5	2	2023-07-20	0	2023-07-20
3988	2099	3		112.5	1	28.87	3.247,88	3.247,88	112,50	0	0	5	2	2023-07-20	0	2023-07-20
3989	2074	3		960	1	28.87	27.715,2	27.715,2	960	0	0	5	2	2023-07-20	0	2023-07-20
3990	2102	3		270	1	28.99	7.827,3	7.827,3	270	0	0	5	2	2023-07-21	0	2023-07-21
3991	2068	3		450	1	28.99	13.045,5	13.045,5	450	0	0	5	2	2023-07-21	0	2023-07-21
3992	1914	3		210	1	29.08	6.106,8	6.106,8	210	0	0	5	2	2023-07-25	0	2023-07-25
3993	2037	3		262.5	1	29.10	7.638,75	7.638,75	262.50	0	0	5	2	2023-07-26	0	2023-07-26
3994	1944	3		400	1	28	11.200	11.200	400	0	0	5	2	2023-07-26	0	2023-07-26
3995	1060	3		440	1	29.31	12.896,4	12.896,4	440	0	0	5	2	2023-07-27	0	2023-07-27
3996	1181	3		440	1	29.31	12.896,4	12.896,4	440	0	0	5	2	2023-07-27	0	2023-07-27
3997	1317	3		440	1	29.31	12.896,4	12.896,4	440	0	0	5	2	2023-07-27	0	2023-07-27
3998	1434	3		440	1	29.31	12.896,4	12.896,4	440	0	0	5	2	2023-07-27	0	2023-07-27
3999	1038	3		240	1	29.31	7.034,4	7.034,4	240	0	0	5	2	2023-07-27	0	2023-07-27
4000	1159	3		240	1	29.31	7.034,4	7.034,4	240	0	0	5	2	2023-07-27	0	2023-07-27
4001	1295	3		240	1	29.31	7.034,4	7.034,4	240	0	0	5	2	2023-07-27	0	2023-07-27
4002	1417	3		240	1	29.31	7.034,4	7.034,4	240	0	0	5	2	2023-07-27	0	2023-07-27
4003	1529	3		240	1	29.31	7.034,4	7.034,4	240	0	0	5	2	2023-07-27	0	2023-07-27
4004	1911	2	111659103	165	1	29.31	4.836,15	4.836,15	165	0	0	5	2	2023-07-27	28	2023-07-27
4005	1592	3	111659103	320	1	29.31	9.379,2	9.379,2	320	0	0	5	2	2023-07-27	28	2023-07-27
4006	1699	3	111659103	320	1	29.31	9.379,2	1.846,4	320	0	0	5	2	2023-07-27	28	2023-07-27
4007	1805	3	111659103	320	1	29.31	9.379,2	9.379,2	320	0	0	5	2	2023-07-27	28	2023-07-27
4008	1875	3	111659103	320	1	29.31	9.379,2	9.379,2	320	0	0	5	2	2023-07-27	28	2023-07-27
4009	1969	3	111659103	320	1	29.31	9.379,2	9.379,2	320	0	0	5	2	2023-07-27	28	2023-07-27
4010	2070	3	111659103	480	1	29.31	14.068,8	14.068,8	480	0	0	5	2	2023-07-27	28	2023-07-27
4011	2111	3		480	1	29.31	14.068,8	11.137,8	380	2.931	100	5	3	2023-07-27	0	2023-07-27
4012	2075	3		247.5	1	29.31	7.254,22	7.251,75	247.50	0	0	5	2	2023-07-28	0	2023-07-28
4013	2112	3		247.5	1	29.30	7.251,75	7.251,75	247,50	0	2.227,5	5	2	2023-07-28	0	2023-07-28
4014	2113	3		247.5	1	29.31	7.254,22	7.254,22	247,50	-0	2.227,5	5	2	2023-07-28	0	2023-07-28
4015	2114	3		247.5	1	29.31	7.254,22	7.254,22	247,50	-0	2.227,5	5	2	2023-07-28	0	2023-07-28
4016	2115	3		247.5	1	29.31	7.254,22	7.254,22	247,50	-0	2.227,5	5	2	2023-07-28	0	2023-07-28
4017	2116	3		247.5	1	29.30	7.251,75	7.251,75	247,50	0	2.227,5	5	2	2023-07-28	0	2023-07-28
4018	1949	3		300	1	29.30	8.790	8.790	300	0	0	5	2	2023-07-28	0	2023-07-28
4019	2049	3		450	1	29.30	13.185	13.185	450	0	0	5	2	2023-07-28	0	2023-07-28
4020	2035	3		645	1	29.51	19.033,95	19.033,95	645	0	0	5	2	2023-07-30	0	2023-07-30
4021	2020	3		82.5	1	28	2.310	2.310	82.50	0	0	5	2	2023-07-30	0	2023-07-30
4022	1924	3		55	1	28	1.540	1.540	55	0	0	5	2	2023-07-30	0	2023-07-30
4023	1834	3		55	1	28	1.540	1.540	55	0	0	5	2	2023-07-30	0	2023-07-30
4024	1713	3		55	1	28	1.540	1.540	55	0	0	5	2	2023-07-30	0	2023-07-30
4025	2008	3		247.5	1	28	6.930	6.930	247.50	0	0	5	2	2023-07-31	0	2023-07-31
4026	2117	0		0	1	5.77	0	0	0	64.99	375	1	0	2023-08-01	\N	\N
4027	2118	0		0	1	5.77	0	0	0	428.94	247.5	1	0	2023-08-01	\N	\N
4028	2119	0		0	1	5.77	0	0	0	428.94	247.5	1	0	2023-08-01	\N	\N
4029	2120	0		0	1	5.77	0	0	0	610.92	352.5	1	0	2023-08-01	\N	\N
4030	2121	0		0	1	5.77	0	0	0	54.59	315	1	0	2023-08-01	\N	\N
4031	2122	0		0	1	5.77	0	0	0	114.38	660	1	0	2023-08-01	\N	\N
4032	2123	0		0	1	5.77	0	0	0	57.19	330	1	0	2023-08-01	\N	\N
4033	2124	0		0	1	5.77	0	0	0	103.99	600	1	0	2023-08-01	\N	\N
4034	2125	0		0	1	5.77	0	0	0	428.94	247.5	1	0	2023-08-01	\N	\N
4035	2126	0		0	1	5.77	0	0	0	57.19	330	1	0	2023-08-01	\N	\N
4036	2127	0		0	1	5.77	0	0	0	454.94	262.5	1	0	2023-08-01	\N	\N
4038	2129	0		0	1	5.77	0	0	0	15.6	90	1	0	2023-08-01	\N	\N
4039	2130	0		0	1	5.77	0	0	0	18.2	105	1	0	2023-08-01	\N	\N
4040	2131	0		0	1	5.77	0	0	0	142.98	82.5	1	0	2023-08-01	\N	\N
4041	2132	0		0	1	5.77	0	0	0	75.39	435	1	0	2023-08-01	\N	\N
4042	2133	0		0	1	5.77	0	0	0	428.94	247.5	1	0	2023-08-01	\N	\N
4043	2134	0		0	1	5.77	0	0	0	428.94	247.5	1	0	2023-08-01	\N	\N
4044	2135	0		0	1	5.77	0	0	0	428.94	247.5	1	0	2023-08-01	\N	\N
4045	2136	0		0	1	5.77	0	0	0	155.98	900	1	0	2023-08-01	\N	\N
4046	2137	0		0	1	5.77	0	0	0	428.94	247.5	1	0	2023-08-01	\N	\N
4047	2138	0		0	1	5.77	0	0	0	54.59	315	1	0	2023-08-01	\N	\N
4048	2139	0		0	1	5.77	0	0	0	93.59	540	1	0	2023-08-01	\N	\N
4049	2140	0		0	1	5.77	0	0	0	558.93	322.5	1	0	2023-08-01	\N	\N
4050	2141	0		0	1	5.77	0	0	0	46.79	270	1	0	2023-08-01	\N	\N
4051	2142	0		0	1	5.77	0	0	0	948.87	547.5	1	0	2023-08-01	\N	\N
4052	2143	0		0	1	5.77	0	0	0	480.94	277.5	1	0	2023-08-01	\N	\N
4053	2144	0		0	1	5.77	0	0	0	93.59	540	1	0	2023-08-01	\N	\N
4054	2145	0		0	1	5.77	0	0	0	454.94	262.5	1	0	2023-08-01	\N	\N
4055	2146	0		0	1	5.77	0	0	0	31.2	180	1	0	2023-08-01	\N	\N
4056	2147	0		0	1	5.77	0	0	0	584.92	337.5	1	0	2023-08-01	\N	\N
4057	2148	0		0	1	5.77	0	0	0	428.94	247.5	1	0	2023-08-01	\N	\N
4059	2150	0		0	1	5.77	0	0	0	1494.8	862.5	1	0	2023-08-01	\N	\N
4060	2151	0		0	1	5.77	0	0	0	51.99	300	1	0	2023-08-01	\N	\N
4061	2152	0		0	1	5.77	0	0	0	103.99	600	1	0	2023-08-01	\N	\N
4062	2153	0		0	1	5.77	0	0	0	532.93	307.5	1	0	2023-08-01	\N	\N
4063	2154	0		0	1	5.77	0	0	0	33.8	195	1	0	2023-08-01	\N	\N
4064	2155	0		0	1	5.77	0	0	0	31.2	180	1	0	2023-08-01	\N	\N
4065	2156	0		0	1	5.77	0	0	0	428.94	247.5	1	0	2023-08-01	\N	\N
4066	2157	0		0	1	5.77	0	0	0	428.94	247.5	1	0	2023-08-01	\N	\N
4067	2158	0		0	1	5.77	0	0	0	77.99	450	1	0	2023-08-01	\N	\N
4068	2159	0		0	1	5.77	0	0	0	90.99	525	1	0	2023-08-01	\N	\N
4069	2160	0		0	1	5.77	0	0	0	46.79	270	1	0	2023-08-01	\N	\N
4070	2161	0		0	1	5.77	0	0	0	818.89	472.5	1	0	2023-08-01	\N	\N
4071	2162	0		0	1	5.77	0	0	0	428.94	247.5	1	0	2023-08-01	\N	\N
4072	2163	0		0	1	5.77	0	0	0	67.59	390	1	0	2023-08-01	\N	\N
4073	2164	0		0	1	5.77	0	0	0	610.92	352.5	1	0	2023-08-01	\N	\N
4074	2165	0		0	1	5.77	0	0	0	62.39	360	1	0	2023-08-01	\N	\N
4075	2166	0		0	1	5.77	0	0	0	54.59	315	1	0	2023-08-01	\N	\N
4076	2167	0		0	1	5.77	0	0	0	46.79	270	1	0	2023-08-01	\N	\N
4077	2168	0		0	1	5.77	0	0	0	428.94	247.5	1	0	2023-08-01	\N	\N
4078	2169	0		0	1	5.77	0	0	0	122.18	705	1	0	2023-08-01	\N	\N
4079	2170	0		0	1	5.77	0	0	0	77.99	450	1	0	2023-08-01	\N	\N
4080	2171	0		0	1	5.77	0	0	0	428.94	247.5	1	0	2023-08-01	\N	\N
4081	2172	0		0	1	5.77	0	0	0	714.9	412.5	1	0	2023-08-01	\N	\N
4082	2173	0		0	1	5.77	0	0	0	57.19	330	1	0	2023-08-01	\N	\N
4083	2174	0		0	1	5.77	0	0	0	610.92	352.5	1	0	2023-08-01	\N	\N
4084	2175	0		0	1	5.77	0	0	0	1104.85	637.5	1	0	2023-08-01	\N	\N
4085	2176	0		0	1	5.77	0	0	0	46.79	270	1	0	2023-08-01	\N	\N
4086	2177	0		0	1	5.77	0	0	0	77.99	450	1	0	2023-08-01	\N	\N
4087	2178	0		0	1	5.77	0	0	0	428.94	247.5	1	0	2023-08-01	\N	\N
4088	2179	0		0	1	5.77	0	0	0	38.99	225	1	0	2023-08-01	\N	\N
4089	2180	0		0	1	5.77	0	0	0	114.38	660	1	0	2023-08-01	\N	\N
4090	2181	0		0	1	5.77	0	0	0	41.59	240	1	0	2023-08-01	\N	\N
4091	2182	0		0	1	5.77	0	0	0	166.38	960	1	0	2023-08-01	\N	\N
4092	2183	0		0	1	5.77	0	0	0	62.39	360	1	0	2023-08-01	\N	\N
4093	2184	0		0	1	5.77	0	0	0	428.94	247.5	1	0	2023-08-01	\N	\N
4094	2185	0		0	1	5.77	0	0	0	610.92	352.5	1	0	2023-08-01	\N	\N
4095	2186	0		0	1	5.77	0	0	0	75.39	435	1	0	2023-08-01	\N	\N
4096	2187	0		0	1	5.77	0	0	0	454.94	262.5	1	0	2023-08-01	\N	\N
4097	2188	0		0	1	5.77	0	0	0	428.94	247.5	1	0	2023-08-01	\N	\N
4098	2189	0		0	1	5.77	0	0	0	44.19	255	1	0	2023-08-01	\N	\N
4099	2190	0		0	1	5.77	0	0	0	818.89	472.5	1	0	2023-08-01	\N	\N
4100	2191	0		0	1	5.77	0	0	0	46.79	270	1	0	2023-08-01	\N	\N
4101	2192	0		0	1	5.77	0	0	0	818.89	472.5	1	0	2023-08-01	\N	\N
4102	2193	0		0	1	5.77	0	0	0	80.59	465	1	0	2023-08-01	\N	\N
4103	2194	0		0	1	5.77	0	0	0	70.19	405	1	0	2023-08-01	\N	\N
4104	2195	0		0	1	5.77	0	0	0	51.99	300	1	0	2023-08-01	\N	\N
4105	2196	0		0	1	5.77	0	0	0	44.19	255	1	0	2023-08-01	\N	\N
4106	2197	0		0	1	5.77	0	0	0	298.96	172.5	1	0	2023-08-01	\N	\N
4107	2198	0		0	1	5.77	0	0	0	62.39	360	1	0	2023-08-01	\N	\N
4108	2199	0		0	1	5.77	0	0	0	77.99	450	1	0	2023-08-01	\N	\N
4109	2200	0		0	1	5.77	0	0	0	119.58	690	1	0	2023-08-01	\N	\N
4110	2201	0		0	1	5.77	0	0	0	688.91	397.5	1	0	2023-08-01	\N	\N
4111	2202	0		0	1	5.77	0	0	0	18.2	105	1	0	2023-08-01	\N	\N
4112	2203	0		0	1	5.77	0	0	0	114.38	660	1	0	2023-08-01	\N	\N
4113	2204	0		0	1	5.77	0	0	0	38.99	225	1	0	2023-08-01	\N	\N
4114	2205	0		0	1	5.77	0	0	0	428.94	247.5	1	0	2023-08-01	\N	\N
4115	2206	0		0	1	5.77	0	0	0	194.97	112.5	1	0	2023-08-01	\N	\N
4116	2207	0		0	1	5.77	0	0	0	818.89	472.5	1	0	2023-08-01	\N	\N
4117	2208	0		0	1	5.77	0	0	0	324.96	187.5	1	0	2023-08-01	\N	\N
4118	2209	0		0	1	5.77	0	0	0	46.79	270	1	0	2023-08-01	\N	\N
4119	2210	0		0	1	5.77	0	0	0	64.99	375	1	0	2023-08-01	\N	\N
4120	2174	2	122444651	352.5	1	29.61	10.437,52	10.437,52	352,50	0	0	5	2	2023-08-02	28	2023-08-02
4121	2006	2	134600037	247.5	1	29.61	7.328,47	7.328,47	247,5	0	0	5	2	2023-08-02	28	2023-08-02
4122	2127	3		262.5	1	29.75	7.809,38	7.809,38	262.50	0	0	5	2	2023-08-03	0	2023-08-03
4123	2203	3		660	1	29.75	19.635	19.635	660	0	0	5	2	2023-08-03	0	2023-08-03
4124	2054	3		390	1	29.75	11.602,5	11.602,5	390	0	0	5	2	2023-08-03	0	2023-08-03
4126	2078	3		352.5	1	29.75	10.486,88	10.486,88	352,50	0	0	5	2	2023-08-03	0	2023-08-03
4127	2185	3		352.5	1	29.75	10.486,88	10.486,88	352,50	0	0	5	2	2023-08-03	0	2023-08-03
4129	1841	3		215	1	29.75	6.396,25	6.396,25	215	0	0	5	2	2023-08-03	0	2023-08-03
4130	1931	3		215	1	29.75	6.396,25	6.396,25	215	0	0	5	2	2023-08-03	0	2023-08-03
4131	2031	3		322.5	1	29.75	9.594,38	9.594,38	322.50	0	0	5	2	2023-08-03	0	2023-08-03
4128	1986	0		0	1	5.77	0	0	0	70.19	270	5	0	2023-08-03	\N	\N
4132	2012	3	151646979	330	1	30.10	9.933	9.933	330	0	0	5	2	2023-08-04	28	2023-08-02
4133	2055	3	151646979	352.5	1	30.10	10.610,25	10.610,25	352.50	0	0	5	2	2023-08-04	28	2023-08-02
4134	1986	2	151646979	270	1	29.44	7.948,8	7.948,8	270	0	0	5	2	2023-08-04	28	2023-07-28
4135	1966	3		180	1	30.10	5.418	5.418	180	0	0	5	2	2023-08-04	0	2023-08-04
4136	1927	3		165	1	30.10	4.966,5	4.966,5	165	0	0	5	2	2023-08-04	0	2023-08-04
4137	2023	3		247.5	1	30.10	7.449,75	7.449,75	247.50	0	0	5	2	2023-08-04	0	2023-08-04
4138	2134	3		247.5	1	30.10	7.449,75	7.449,75	247.50	0	0	5	2	2023-08-04	0	2023-08-04
4139	1837	3		165	1	30.10	4.966,5	4.966,5	165	0	0	5	2	2023-08-04	0	2023-08-04
4140	1973	3		160	1	30	4.800	4.800	160	0	0	5	2	2023-08-05	0	2023-08-05
4141	2202	3		105	1	30.98	3.252,9	3.160,5	105	0	0	5	2	2023-08-05	0	2023-08-05
4142	2082	3		255	1	30.98	7.899,9	7.899,9	255	0	0	5	2	2023-08-06	0	2023-08-06
4143	2129	3		90	1	30.98	2.788,2	2.788,2	90	0	0	5	2	2023-08-07	0	2023-08-07
4144	2151	3		300	1	30.98	9.294	9.294	300	0	0	5	2	2023-08-07	0	2023-08-07
4145	2091	2	85237901 Y 175642485	360	1	30.98	11.152,8	11.152,8	360	0	0	5	2	2023-08-07	28	2023-07-04
4146	2198	2	175642485	360	1	29.98	10.792,8	10.792,8	360	0	0	5	2	2023-08-07	28	2023-08-04
4147	2029	3		315	1	30	9.450	9.450	315	0	0	5	2	2023-08-08	0	2023-08-08
4148	2053	3		247.5	1	30.97	7.665,07	7.665,07	247.50	0	0	5	2	2023-08-08	0	2023-08-08
4149	2118	6		247.5	1	5.77	1.428,07	1.428,07	247.50	0	0	5	2	2023-08-10	0	2023-08-10
4150	2118	6		247.5	1	5.77	1.428,07	1.428,07	247.50	0	0	5	2	2023-08-10	0	2023-08-10
4151	2098	3		247.5	1	31.23	7.729,43	7.729,43	247.50	0	0	5	2	2023-08-10	0	2023-08-10
4152	2030	3		540	1	31.35	16.929	16.929	540	0	0	5	2	2023-08-11	0	2023-08-11
4153	2141	3		270	1	31.35	8.464,5	8.464,5	270	0	0	5	2	2023-08-11	0	2023-08-11
4158	2149	0		0	1	5.77	0	0	0	106.59	615	5	0	2023-08-15	\N	\N
4159	2041	0		0	1	5.77	0	0	0	106.59	615	5	0	2023-08-15	\N	\N
4160	2128	0		0	1	5.77	0	0	0	36.4	210	5	0	2023-08-15	\N	\N
4161	2016	0		0	1	5.77	0	0	0	36.4	210	5	0	2023-08-15	\N	\N
4162	2016	2	144449905	210	1	31.52	6.619,2	6.619,2	210	0	0	5	2	2023-08-15	28	2023-08-08
4163	2128	2	144449905	210	1	31.52	6.619,2	6.619,2	210	0	0	5	2	2023-08-15	28	2023-08-08
4164	2041	2	144449905	615	1	31.52	19.384,8	19.384,8	615	0	0	5	2	2023-08-15	28	2023-08-08
4165	2149	2	144449905	615	1	31.52	19.384,8	19.384,8	615	0	0	5	2	2023-08-15	28	2023-08-08
4166	2177	3	144449905	450	1	31.52	14.184	14.184	450	0	0	5	2	2023-08-15	28	2023-08-08
4167	2061	3		450	1	31.50	14.175	14.175	450	0	0	5	2	2023-08-16	0	2023-08-16
4168	2170	3		450	1	31.50	14.175	14.175	450	0	0	5	2	2023-08-16	0	2023-08-16
4169	2073	3		240	1	31.50	7.560	7.560	240	0	0	5	2	2023-08-16	0	2023-08-16
4170	2181	3		240	1	31.50	7.560	7.560	240	0	0	5	2	2023-08-16	0	2023-08-16
4171	2211	3		240	1	31.50	7.560	7.560	240	0	0	5	2	2023-08-16	0	2023-08-16
4172	2212	3		240	1	31.50	7.560	7.560	240	0	0	5	2	2023-08-16	0	2023-08-16
4173	2173	3		330	1	31.61	10.431,3	10.431,3	330	0	0	5	2	2023-08-17	0	2023-08-17
4174	2052	3		472.5	1	31.61	14.935,73	14.935,73	472,50	0	0	5	2	2023-08-17	0	2023-08-17
4175	2080	3		262.5	1	31.61	8.297,63	8.297,63	262.50	0	0	5	2	2023-08-17	0	2023-08-17
4176	2038	3		180	1	31.61	5.689,8	5.689,8	180	0	0	5	2	2023-08-17	0	2023-08-17
4177	2039	3		337.5	1	31.75	10.715,63	10.620,38	334.50	0	3	5	2	2023-08-18	0	2023-08-18
3975	2034	3		277.5	1	28	7.770	7770	277,5	0	0	1	2	2023-07-16	0	2023-07-16
\.


--
-- TOC entry 3279 (class 0 OID 132144)
-- Dependencies: 261
-- Data for Name: mov_prod; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mov_prod (id_mov, id_producto, quantity, id_usuario, fecha_creacion, quantity_ant, total_stock) FROM stdin;
0	1	0	0	2024-02-21	0	\N
1	10	10	2	2024-02-22	12	\N
2	10	10	2	2024-02-22	22	32
3	10	10	2	2024-02-22	32	42
\.


--
-- TOC entry 3271 (class 0 OID 123869)
-- Dependencies: 253
-- Data for Name: producto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.producto (id_producto, code_p, descripcion, id_und, id_marca, quantity, price_purchase, price_sale, status, id_usuario, fecha_creacion) FROM stdin;
1	222	Coca-Cola Orig. Sabores Sin azúcar PET 2 Litros	3	1	36	6,26	9,63	1	1	2024-02-06
2	288	Coca-Cola - Frescolita®RET 1.25 Litros	3	1	288	2,95	4,73	1	1	2024-02-06
3	223	Coca-Cola® Original y Sin Azúcar PET 1 Litro	3	1	75	3,47	5,30	1	1	2024-02-06
6	5670	Frescolita RGBRET 350 mL	7	1	16	6,55	10,50	1	1	2024-02-06
7	5671	Hit Naranja  RGBRET 350 mL	7	1	16	6,55	10,50	1	1	2024-02-06
8	5672	Hit Uva RGBRET 350 mL	7	1	16	6,55	10,50	1	1	2024-02-06
9	105	Frescolita RGB RET 1.25 Litros	3	1	48	2,95	4,73	1	1	2024-02-06
5	331086	Cerveza Zulia®RET 222 mL	8	9	80	12,93	17,50	1	1	2024-02-06
4	101	Coca-Cola y SaboresRET 350 mL	7	1	40	6,55	10,50	1	1	2024-02-06
10	1234	3344	4	5	42	22,22	33,33	1	2	2024-02-06
\.


--
-- TOC entry 3248 (class 0 OID 84686)
-- Dependencies: 225
-- Data for Name: propiet; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.propiet (id_propiet, cedula, tipo_ced, nombrecom, tele_1, email, tipo, matricula, id_buque) FROM stdin;
44	15.182.206	V	MARLONG SANCHEZ	04148400858	sincopa2@gmail.com	principal	AGSI-D-5426	44
333	81990822	E	JUAN RAMIRO	04141349504	jrcastrillo61@gmail.com	principal	AGSI-RE-1243	38
336	296167478	J	TORONTOURS C.A	NO	NO	principal	AGSP-D-2875	84
60	11234237	V	ANTONIO GUZZO	04142597288	guzzoa1@gmail.com	principal	AGSI-TU-0131	28
61	4565637	V	ELY PLAZA	04141804123	ELYPLAZA7@GMAIL.COM	principal	ARSH-RE-0356	47
339	000011112223	V	TOURYMAR MANZO LEYBA FEDERICO ALBERTO	02123376692	operacionesgrupoml1@gmail.com	principal	ADKN-RE-0740	126
342	5434010	V	JUAN COTS CAVALLES	04143216890	JCOTSNOPAL@GMAIL.COM	socio	AGSI-RE-1604	131
343	6558490	V	EDUARDO VALLES	04143333343	EDUJVALLES@GMAIL.COM	principal	AGSI-RE-1604	131
68	81139161	E	MARCIAL TORRES	0424-2896914	NO	principal	AGSI-D-22487	19
74	4565637	V	ELY PLAZA	04141804123	NO	principal	AGSI-D-10408	18
76	15779926	V	FRANKILN MILLAN	04149014395	NO	principal	AGS-PE-0879	45
77	3485429	V	CARMELO ABREU	04141871187	CARMELOABREUH@HOTMAIL.COM	principal	AGSI-RE-1072	7
78	10335859	V	MICHELANGELO TEPEDINO	04143299999	mtepedino@gmail.com	principal	AGSI-D-6150	29
81	25175373	V	GREGORI SOUSA	04120118427	Greegs95@gmail.com	principal	AGSI-RE-1472	41
83	23411926	V	CESAR SAA	04244688225	NO	principal	AGSI-D-22966	21
91	4765494	V	FRANCISCO ZULUAGA	04126081104	franzulo@gmail.com	principal	AGSI-D-5926	11
100	312722282	J	LUMATOURS INVERSIONES TURISTICA C.A	02125626200	NO	principal	AGSI-RE-1176	17
102	81056832	E	JORGE ELLIOT	04242653012	dcosta@semillasmagna.com	principal	AGSP-PJ-0066	49
110	6217542	V	VICENTE RODRIGUEZ	02122676690	TRIACS44@HOTMAIL.COM	principal	AGSI-D-23325	46
115	14567844	V	SAMUEL CASTRO	04143709322	NO	principal	AGSI-RE-1354	62
116	81056832	E	JORGE ELLIOT 	NO	NO	principal	ADKN-D-7303	63
117	8666604	V	FELIX ALVARADO 	04241574571	NO	principal	AGSI-RE-1362	64
122	13671124	V	JOSE LUIS RODRIGUEZ	04241368081	Jose.luisrodriguez1973@hotmail.com	principal	AGSP-RE-0963	67
123	11644856	V	JUAN ROJAS 	04264841637	NO	principal	AGSI-D-2494	68
103	16105412	V	NELSON PASTOR	NO	carlos.borrero30@gmail.com	principal	AGSI-TU-0161	50
128	12164617	V	DENIS LUGO	04241595502	NO	principal	AGSI-RE-TRAMI01	73
133	5833841	V	LEONARDO ALBORNOZ	04122129770	NO	principal	AGSP-1992	78
135	12165764	V	ROMER BUSTAMANTE 	04242236837	NO	principal	AGSI-D-6032	80
138	17429001	V	JENIFER LUGO	+17874008882	NO	principal	AGSI-RE-0169	83
144	NJI	V	CARLOS ECHARRY	04143905625	NO	principal	AGSI-D-20765	89
328	13713315	V	MIGUEL BALLESTEROS	0414-1011740	no	principal	AGSI-RE-1573	143
146	5833841	V	LEONARDO ALBORNOZ	04122129770	aleonar2@hotmail.com	principal	AGSI-PE-0288	91
148	15457381	V	ALBERTO COLUCHI	04143216872	no	principal	AGSI-RE-TRAMITE87	93
149	12163594	V	JINNY VILLERROEL	04241702217	NO	principal	AGSI-RE-0989	94
153	13101664	V	ENRRIQUES VILLEGAS 	04241558489	NO	principal	AGSI-D-1648	98
154	16381633	V	JOSE BARRETO	+593969213788	ALVARADOYENDER33@GMAIL.COM	principal	AGSI-D-11629	24
334	13298988	V	ANGEL PERALTA 	04142842899	Atitania3384@gmail.com	principal	AGSI-TU-0072	40
337	5094808	V	HERNAN VASQUEZ	04143279260	hernanvasquez245@gmail.com	principal	AGSI-RE-0606	27
340	20120087	V	JOSE DIAZ 	04242252548	NO	principal	AGSP-RE-0587	82
168	12164617	V	DENIS LUGO	04241595502	NO	principal	ARSK-D-1085	108
169	17711037	V	ANTONY BRACAMONTE 	04241702217	NO	principal	AGSI-PE -TRAMITE3232	109
170	18442961	V	TONY TORRES	04242432571	NO	principal	AGSI-D-9606	110
171	16309668	V	DONNY TOVAR 	04148595459	NO	principal	AGSI-RE-TRAMITE 000123	111
173	0000000	V	DUGLAS	NO	NO	principal	AGSI-RE- TRAMITE96589	113
174	00000025555	V	MARCO	NO	NO	principal	AGSI-RE TRAMITE00332211	114
181	NO	V	RODRIGO	NO	NO	principal	AGSI-D-21173	116
182	XXXXXXXX	V	XXXX	XXXXXX	XXXXXX	principal	AGSI-D-15916	117
185	NO	V	RAMON FEO	NO	NO	principal	AGSI-D-16610	120
189	NO	E	ALEZANDRE	NO	NO	principal	AGSI-RE-1587	124
190	6906422	V	RAUL ABREU	04142912362	NO	principal	AGSI-D- 2796	125
191	2942118	V	ANTONIO RASPA	04242842613	NO	principal	AGSI-RE-0601	43
192	11644856	V	JUAN ROJAS 	04264841637	jjrojas32@gmail.com	principal	AGSI-PE-0892	68
194	19981350	V	EDUARDO GERMAN	04244596459	EDUARDGERMM@GMAIL.COM	principal	AGSI-D-4396	122
195	26057945	V	EDUARD GERMAN	04244596459	EDUARDGERMM@GMAIL.COM	socio	AGSI-D-4396	122
197	18088509	V	LUIS  PEPE 	04143264208	nicoloso_13@hotmail.com	principal	AGSI-RE-0655	16
205	000	V	000	0000	0000	principal	AGSI-1444	129
206	412958917	V	CORPORACION MRS TEPE C.A	NO	NO	0	AGSI-RE-1444	129
207	224625	V	RICARDO DANTAS 	NO	NO	principal	CA224625	128
216	13042532	V	JAIME BERTOLO	+17868000019	NO	principal	AGSI-PE-1602	4
242	3243976	V	FREDDY ARABIA	04142308892	freddyarabia10@hotmail.com	principal	AGSI-D-9005	25
245	16309668	V	DONNY TOVAR 	4148595459	NO	principal	AGSI-RE-TRAMITE789	105
247	14486440	V	GUSTAVO PETRICCA	04148069900	NO	principal	ENTRAMITE001	130
248	9416398	V	SAUL CUEVA	04141386349	NO 	principal	AGSI-2927	12
249	13042532	V	JAIME BERTOLO	+17868000019	NO	principal	AGSI-PE-0830	23
251	123456	J	TROPICAL PARADISE CHARTERS	04143236141	no	principal	AGSI TRAMITE 14521452	138
252	410642777	J	INVERCIONES EQUILIBRIUM C.A	NO	NO	principal	AGSI-RE-0009	141
253	17642538	V	ANTONIO FERNANDEZ	NO	NO	principal	AGSI-AUXILIAR	127
256	313137456	J	FISHING THE PARADISE C.A	NO	NO	principal	AGSI-RE-0268	57
259	6332590	V	FRANCO CINCOTTI 	04142540980	no	principal	AGSI-RE-0692	144
260	NO	V	JORGE SAINT	NO	NO	principal	ARSH-D-957	88
262	NO	G	MARINA GAVIOTA S.A	04123632740	NO	principal	ADKN-D-57476	146
266	5307357	V	JUAN VIEIRA 	04122283852	juanvieirarey@hotmail.com	principal	AGSM-D-1776	90
268	14486440	V	GUSTAVO PETRICCA	04148069900	NO	principal	DL1324AC	75
269	10332489	V	VICTOR MEDINA 	04142440738	vmedina@nauticaevc.com	principal	AGSI-D-5814	3
270	9487054	V	BEATRIZ ESCARRA	NO	NO	principal	ARSH-PJ-0034	58
274	17492298	V	BERIUSKA BARRIENTOS	04166212743	NO	principal	AGSI-RE-0661	10
276	410642777	J	INVERCIONES EQUILIBRIUM C.A	NO	no	principal	AGSI-RE-0008	140
280	9.487054	V	BEATRIZ ESCALLA	04166323369	NO	principal	AGSI-RE-TRAMITE 741	104
283	13865221	V	ARTUROS SALAS	04142337852	NO	principal	AGSI-PE-0887	26
290	14.951.124	V	JESUS ARIAS	04148400858	sincopa2@gmail.com	principal	ARSH-RE-0016	13
291	9416398	V	SAUL CUEVA	04141386349	NO	principal	AGSI-2720	4
294	16.309.668	V	DONNYS TOVAR 	04148400858	sincopa2@gmail.com	principal	ADKN-D-3015	15
295	NO	V	DUGLA MARCANO	NO	NO	principal	ADKN-D-3015	15
296	296167478	V	TORONTOUR C.A	NO	rgallo@torondoy.com.ve	principal	AGSI-PJ-0070	69
297	296167478	J	TORONTOURS C.A	NO	NO	principal	AGSI-RE-1339	121
298	15662112	V	DANIEL DIAZ	04141202750	NO	principal	AGSI-RE-0940	147
299	16619324	V	VICENTE INGOGLIA DI PRIMA	04143385495	NO	principal	ARSH-RE-0255	148
301	6012795	V	SANDRO ZANETTI	NO	NO	principal	ADKN-2106	66
303	21016044	V	DIEGO GARCIA	NO	NO	principal	ARSH-D-1850	14
307	18296550	V	BENJAMIN MEDINA	04147927912	NO	principal	AGSI-RE-0346	133
308	294353592	J	GRUPO CARACOL CA	04143130101	no	principal	AGSI-TU-0203	142
309	14970528	V	DANIEL RODRIGUEZ	04143467080	NO	principal	AGSI-RE-0202	35
310	19692100	V	ANGELO FONTANA	04142229156	no	principal	AGSI-RE-1346	136
312	295980469	J	INVERCIONES BARI RC, C.A	04142329477	no	principal	AGSI-RE-0544	134
313	9.487054	V	BEATRIZ ESCALLA	0416-632.33.69	NO	principal	AGSI-RE-TRAMITE 456	103
316	313320013	J	CATCH AND RELEASE C.A	NO	NO	principal	AGSI-RE-0205	56
317	3814478	V	ELIAS JOSE MARTINES	04242721277	NO	principal	APNN-D-675	42
318	0847626M	E	ARIEL BERTOTTO	NO	NO	principal	AGSI-RE-0891	74
320	40122079-7	J	CREATIVE MANAGEMENT SOLUTIONS 2000 C.A	NO	NO	principal	AGSI-D-23005	1
321	16309668	V	DONNY TOVAR 	04148595459	NO	principal	AGSI-D-23647	86
325	18088484	V	JUAN MANZO	04166382940	juancmanzog@gmail.com	principal	AGSI-RE-1001	8
329	401220797	J	CREATIVE MANAGEMENT SOLUTIONS 2000 C.A	04166212743	NO	principal	AGSI-RE-1593	77
332	82147306	E	HANS POLLOSCH	04143249210	NO	principal	AGSI-RE-0886	2
335	123654789	J	TROPICAL PARADISE CHARTERS	04143236141	no	principal	JMP-22159	137
338	16359522	V	SANDRO ZANETTI	04142328566	NO	principal	AGSI-D-TRAMI 023	81
341	19806520	V	CARLOS MARTING	04147934779	NO	principal	AGSI-RE-1264	132
344	50044515-6	J	CORPORACION NAUTICA AMALFI, C.A.	0424-8072629	NO	principal	AGSI-RE-1673	150
347	18941701	V	PEDRO ELIAS	04242721277	pedroeantoni@gmail.com	principal	AGSP-RE-0514	36
348	19583074	V	ALEJANDRO SANTAROMITA	04142526484	NO	principal	AGSI-TU-0058	37
349	299517089	J	IMPORTADORA CORILEI C.A	04242319777	NO	principal	AGSI-RE-0753	59
351	1215213454	V	EDUARDO CAPRILES 	04241345811	NO	principal	AGSI-RE-TRAMITE7458	112
352	7996274	V	ALEXANDER SANTOS	04148400858	nualejandro@yahoo.com	principal	AGSI-RE-1011	33
353	5568073	V	ANTONIO FERNANDEZ	NO	yesicacastro21@gmail.com	principal	AGSI-RE-0575	31
356	16724478	V	ARGENIS MORENO	04129727199	ARGENIS1402@GMAIL.COM	principal	AGSI-PE-0829	22
357	18025909	V	AGATHA DELGADO	NO	NO	socio	AGSI-PE-0829	22
363	16619324	V	VICENTE INGOGLIA	04143385495	NO	principal	AGSI-RE-1303	60
364	17429001	V	JENIFER LUGO	+1787400882	NO	principal	AGSI-RE-1420	76
365	8666604	V	JOSE FELIX ALVARADO	04241574571	no	principal	AGSI-RE-1687	139
366	12.459.231	V	FELIX MENESEZ	04148400858	sincopa2@gmail.com	principal	AGSI-RE-22326	34
367	13727447	V	MARCOS OLIVEIRA	04143354740	NO	principal	Agsi-re-0678	95
371	306656472	J	MAGNA CHARTERS, CA	04242653012	dcosta@semillasmagna.com	principal	AGSI-RE-1349	6
373	12161760	V	ALFREDO VIVAS	04122144441	VIVASALFREDO@YAHOO.COM	principal	AGSI-TU-0182	30
374	6473645	V	EMILIA CURVELO	04142445560	NO	principal	AGSI-PE-0842	70
375	13615824	V	MIGUEL ROTUNDO	04142513010	NO	principal	AGSI-RE-1239	55
376	000000000	V	IRRAEL GOMEZ	04241037814	NO	socio	AGSI-RE-1239	55
377	13615824	V	MIGUEL ROTUNDO	04142513010	miguel_rotundo@hotmail.com	principal	AGSI-RE-GTRAMITE52	92
378	000000000	V	IRRAEL GOMEZ	NO	NO	socio	AGSI-RE-GTRAMITE52	92
379	12970361	V	SANDRA CAYCEDO	04242799051	NO	principal	ARSH-D-2077	115
380	311629068	J	REPRESENTACIONES OUT DUPONT 235 C.A	NO	NO	principal	AGSP-RE-1071	54
381	408766124	J	PROYECTOS ONE MORE TOY C.A	04241832528	NO	principal	AGSM-RE-0620	61
382	11430690	V	ARLOW AREVALO	04142304821	NO	principal	AGSM-RE-0897	53
383	19555109	V	YEINS CARVAJAL\tV\t19555109\t	04242391392	NO	socio	AGSM-RE-0897	53
384	81675602	E	JUDITH OROZCO	04141469195	NO 	principal	AGSI-PE-0816	48
385	10825818	V	CRISTIAN MARTIN	04242706413	sincopa2@gmail.com	principal	AGSI-D-5535	32
386	296167478	J	TORONTOURS C.A	NO	NO	principal	AGSI-re-tramite-098	100
387	10335859	V	MICHELANGELO TEPEDINO	04143299999	mtepedino@gmail.com	principal	Agsi-re-tramite-3344	96
388	81990822	V	JUAN RAMIRO 	04141349504	jrcastrillo61@gmail.com	principal	AGSI-RE-0437	39
389	16526703	V	JOSE LUIS BRICEÑO	04120207502	NO	principal	AGSI-RE-1674	135
390	311045228	J	ADMINISTRADORA DESTINY 3 C.A 	NO	NO	principal	AGSI-RE-0805	107
391	403363145	J	TENEDORA B-GP630 CA	04242721277	NO	principal	AGSP-RE.0016	145
392	18677950	V	YIMI QUEVEDO	04242821306	NO	principal	ARSH-D-1448	71
393	10528720	V	JOSE PEREIRA 	04142233510	NO	principal	AGSI-RE-1404	65
394	10338987	V	JONAS LOPEZ 	04166078572	NO	principal	AGSI-PE-0532	20
395	11234237	V	ANTONIO GUZZO	04142597288	guzzoa1@gmail.com	principal	AGSI-D-5124	28
396	17779926	V	FRANKLIN MILLAN 	04149014395	NO	principal	AGSI-PE-0879	45
397	14970528	V	DANIEL RODRIGUEZ	04143467080	NO	principal	Agsi-re-tramite-224466	106
398	15182206	V	MARLONG OCHOA	04149199163	longocho@hotmail.com	principal	AGSI-2221	99
399	6198923	V	MANUEL MONTEROLA 	04241413757	NO	principal	AGSI-D-5810	79
400	002223510	J	KING OCEAN SERVICE DE VENEZUELA SA 	NO	NO	principal	AQYM-D-050	101
401	165359522	V	SANDRO ZANETTI 	04142328566	NO	principal	AGSP-2214	72
402	7325961	V	YOVANNY BELLIO	+34665181931	NO	principal	AGSI-RE-1098	9
403	720198	V	JAIME GONZALES 	NO	NO	socio	AGSI-RE-TREMITE1258	149
404	8390540	V	MILTON MARTINEZ	NO	NO	principal	AGSI-RE-TREMITE1258	149
405	5887527	V	MANUEL PARGA	04141813904	aguaji55@gmail.com	principal	AGSI-D-11413	5
406	305631512	J	PROMOTORA DARA C.A	NO	NO	principal	AMSH-RE 0323	97
407	10780039	V	EDUARDO VARGAS 	04142668281	EVARGAS777@GMAIL.COM	socio	AMSH-RE 0323	97
408	294971466	J	GRUPO TECNIMONTAJE 7 C.A.	NO	NO	principal	AGSI-RE-1324	102
409	10780039	V	EDUARDO VARGAAS 	04142668281	EVARGAS777@GMAIL.COM	socio	AGSI-RE-1324	102
410	4087382	V	PORFILIO TAMAYO	04166248076	porfiliotamayo@gmail.com	principal	AGSI-RE-1473	151
411	503736097	J	CARIBBEAN LUXURY CRUICE, C.A.	04122160238	fishjavier@gmail.com	principal	AGSI-RE-TRAMITE	152
412	12399361	V	ANTONIO GEBRAN	04143149363		principal	AGSI-D-22141	153
\.


--
-- TOC entry 3277 (class 0 OID 123939)
-- Dependencies: 259
-- Data for Name: recibo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.recibo (id, nombre, cedula, tele_1, fecha_crear, nro_factura, total_iva, total_mas_iva, total_bs, id_status, fecha_update, tipo_pago) FROM stdin;
1	\N	\N	\N	\N	0000000001	\N	\N	\N	\N	\N	\N
2	Siled Delgado	V21151374	04123934242	2024-02-17	0000000002	0	91,48	0	0	2024-02-17	\N
3	Comercio AMD	J000000	041400000	2024-02-17	0000000003	0	446,3	0	0	2024-02-17	\N
5	Comercio AMD	J000000	041400000	2024-02-18	0000000005	0	280	0	0	2024-02-18	\N
6	Comercio AMD	J000000	041400000	2024-02-18	0000000006	0	47,3	0	0	2024-02-18	\N
7	Comercio Orinoco	J55555	3333	2024-02-18	0000000007	0	280	0	0	2024-02-18	\N
8	Comercio Orinoco	J55555	3333	2024-02-18	0000000008	0	84	0	0	2024-02-18	4
4	Comercio Orinoco	J55555	3333	2024-02-17	0000000004	0	395,72	0	0	2024-02-17	4
\.


--
-- TOC entry 3250 (class 0 OID 84691)
-- Dependencies: 227
-- Data for Name: recibo1; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.recibo1 (id, nombre, matricula, tele_1, fechaingreso, nro_factura, total_iva, total_mas_iva, total_bs, id_status, fecha_update, valor_iva, cedula, efectivo, transferencia, banco, trnas, fechatrnas, id_fact, nro_referencia, id_tipo_pago, id_banco, nombrep) FROM stdin;
1	Siled Delgado	2	04123934242	2024-02-17	0000000002	0		\N	0	2024-02-17		V21151374	\N	\N	\N	\N		1		0	0	\N
148	Comercio AMD	1	041400000	2024-02-17	0000000002	0		\N	0	2024-02-17		J000000	\N	\N	\N	\N		\N		0	0	\N
\.


--
-- TOC entry 3252 (class 0 OID 84708)
-- Dependencies: 231
-- Data for Name: tarifa; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tarifa (id_tarifa, desc_concepto, desc_condicion, desc_tarifa, des_unidad, fecha) FROM stdin;
3	Uso Rampa	Unico	100	DIA	2022-08-10
4	Uso Rampa Moto Agua	Unico	100	DIA	2022-08-10
5	Servicio de Atraque En Muelle o Patio Lanchas en Transito	Diario	3.75	PIE	2022-08-10
6	Trabajos en Patio	Diario	15	DIA	2022-08-10
7	Embarcaciones Por Ingreso de Empergencia	Exonerado 48 horas	0	DIA	2022-08-10
8	Inscripción	Unico	3000	DIA	2022-08-10
9	INGRESO EN TIERRA	PATIO	750	DIA	2023-01-20
1	Puesto Fijo en Agua	Mensual	7.50	PIE	2023-06-24
2	Puesto en Tierra	Mensual	7.50	PIE	2023-06-24
10	ingreso de moto agua	fijo	500	DIA	2023-08-15
\.


--
-- TOC entry 3254 (class 0 OID 84713)
-- Dependencies: 233
-- Data for Name: tipobarco; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tipobarco (id_tipobarco, desc_tipobarco) FROM stdin;
1	YATE
3	VELERO
4	LANCHA
5	PEÑERO
6	CASA BOTE
7	DINGUI 
8	PESQUERO
2	CATAMARAN
\.


--
-- TOC entry 3256 (class 0 OID 84718)
-- Dependencies: 235
-- Data for Name: tipocliente; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tipocliente (id_tipocliente, desc_tipocliente) FROM stdin;
1	Puesto Fijo
2	Puesto Transitorio
3	Exonerado
\.


--
-- TOC entry 3258 (class 0 OID 84723)
-- Dependencies: 237
-- Data for Name: tipoestac; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tipoestac (id_tipoestac, desc_tipoestac) FROM stdin;
2	Muelle
1	Patio
\.


--
-- TOC entry 3260 (class 0 OID 84728)
-- Dependencies: 239
-- Data for Name: tipopago; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tipopago (id_tipo_pago, descripcion) FROM stdin;
2	Deposito en Dolares
1	Trasferencia en Bolivares
3	Efectivo en Dolares $
4	Crédito
\.


--
-- TOC entry 3262 (class 0 OID 84741)
-- Dependencies: 243
-- Data for Name: tripulacion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tripulacion (id_tripulacion, cedulat, tipo_cedt, nombrecomt, tele_1t, cargot, matricula, id_buque, autor) FROM stdin;
657	gh	V	no	ghjj	gh	AGSI-RE-1473	151	CON ACOMPAÑANTES
44	15.182.206	V	MARLONG SANCHEZ		M	AGSI-D-5426	44	CON ACOMPAÑANTES
472	266255557	V	jesus barreto	04120479843	capitan 	AGSI-RE-1346	136	SIN ACOMPAÑANTES
473	31955221	V	yoel narvaes	04122177786	marino	AGSI-RE-1346	136	SIN ACOMPAÑANTES
481	NO	V	NO	NO	NO	AGSI-RE-0891	74	CON ACOMPAÑANTES
498	1955255	V	gledys salazar	04141011740	capitan	AGSI-RE-1573	143	SIN ACOMPAÑANTES
505	11635785	V	NELSON APONTE 	04141245572	MARINO	AGSI-RE-0886	2	SIN ACOMPAÑANTES
506	29911489	V	DEISON APONTE 	NO	MARINO	AGSI-RE-0886	2	SIN ACOMPAÑANTES
73	26180209	V	JESUS MATOS	NO	MARINO	AGSI-TU-0131	28	SIN ACOMPAÑANTES
74	8334026	V	JULIO MARTINEZ	NO	MAQUINISTA	AGSI-TU-0131	28	CON ACOMPAÑANTES
75	4565637	V	ELY PLAZA	04141804123	ENCARGADO	ARSH-RE-0356	47	CON ACOMPAÑANTES
512	NO	V	NO	NO	NO	AGSP-D-2875	84	CON ACOMPAÑANTES
517	NO	V	NO	NO	NO	AGSP-RE-0587	82	CON ACOMPAÑANTES
84	2828985	V	MARIO MILLAN	04143311726	ENCARGADO	AGSI-D-22487	19	CON ACOMPAÑANTES
85	20327222	V	LUIGI MARTERELI	04129737832	MECANICO	AGSI-D-22487	19	CON ACOMPAÑANTES
86	9993175	V	CAROLINA AROCHA	NO	MARINO	AGSI-D-22487	19	CON ACOMPAÑANTES
87	10110814	V	MARIAN VIELMA	NO	MARINO	AGSI-D-22487	19	CON ACOMPAÑANTES
99	4,565,637	V	ELY PLAZA		M	AGSI-D-10408	18	CON ACOMPAÑANTES
105	15.779.926	V	FRANKILN MILLAN	0414-901.43.95	Capitan	AGS-PE-0879	45	CON ACOMPAÑANTES
106	5576793	V	ANDRES CADI	04241631728	CAPITAN	AGSI-RE-1072	7	CON ACOMPAÑANTES
107	15457441	V	JOSE VALERIO	04242144076	CAPITAN	AGSI-D-6150	29	SIN ACOMPAÑANTES
113	14768978	V	JOSE DE SOUSA	NO	MARINO	AGSI-RE-1472	41	CON ACOMPAÑANTES
114	24179804	V	ALEJANDRO FERNANDEZ	NO	MARINO	AGSI-RE-1472	41	CON ACOMPAÑANTES
115	6478537	V	GILBERTO MANZO	04242892658	MARINO	AGSI-RE-1472	41	CON ACOMPAÑANTES
118	9999184	V	CARLOS GARCIA 	NO	MARINO	AGSI-D-22966	21	SIN ACOMPAÑANTES
119	15873370	V	ANDERSON LUNAR 	NO	MARINO	AGSI-D-22966	21	SIN ACOMPAÑANTES
120	21388849	V	CARLOS LOPEZ	NO	MARINO	AGSI-D-22966	21	SIN ACOMPAÑANTES
136	13668246	V	MANUEL NARVAEZ 	04140382556	MARINERO	AGSI-D-5926	11	CON ACOMPAÑANTES
151	19273248	V	ERIK LIENDO	04122146072	MARINO	AGSI-RE-1176	17	CON ACOMPAÑANTES
152	6866458	V	ROBERTO RIVERO 	NO	ENCARGADO	AGSI-RE-1176	17	CON ACOMPAÑANTES
155	3888492	V	ERNESTO MILLAN	NO	CAPITAN	AGSP-PJ-0066	49	CON ACOMPAÑANTES
499	NO	V	NO	NO	NO	AGSI-RE-1593	77	CON ACOMPAÑANTES
507	15508877	V	OSCAR ZAMBRANO	NO	MARINO	AGSI-RE-1243	38	SIN ACOMPAÑANTES
180	6.080446	V	ELBA GALARRAGA 	04142325272	ENCARGADA	AGSI-D-23325	46	CON ACOMPAÑANTES
513	10247698	V	HERNAN MANZO 	04149028403	ENCARGADO	AGSI-RE-0606	27	CON ACOMPAÑANTES
185	NO	V	NO	NO	NO	AGSI-RE-1354	62	CON ACOMPAÑANTES
186	3888492	0	ERNESTO MILLAN 	NO	CAPITAN	ADKN-D-7303	63	CON ACOMPAÑANTES
187	27160438	V	DAISON CARPIO	NO	MARINO	AGSI-RE-1362	64	SIN ACOMPAÑANTES
514	13827723	V	JOSE SALAZAR	NO	MARINO	AGSI-RE-0606	27	CON ACOMPAÑANTES
518	14055095	V	CARLOS ESTREDO	04241754850	CAPITAN	AGSI-RE-1264	132	CON ACOMPAÑANTES
196	NO	V	NO	NO	NO	AGSP-RE-0963	67	SIN ACOMPAÑANTES
197	NO	V	NO	NO	NO	AGSI-D-2494	68	SIN ACOMPAÑANTES
160	7602129	E	ARISTIDES HERRERA	NO	ENCARGADO	AGSI-TU-0161	50	CON ACOMPAÑANTES
161	30002641	V	ALEXANDER ACEVEDO	NO	PINTOR	AGSI-TU-0161	50	CON ACOMPAÑANTES
162	20174261	V	MARIA PEPPER	NO	MARINERA	AGSI-TU-0161	50	CON ACOMPAÑANTES
163	7991683	V	SIMON GOMEZ	NO	MARINO	AGSI-TU-0161	50	CON ACOMPAÑANTES
164	10583229	V	RAFAEL GOMEZ	NO	CAPITAN	AGSI-TU-0161	50	CON ACOMPAÑANTES
203	NO	V	NO	NO	NO	AGSI-RE-TRAMI01	73	CON ACOMPAÑANTES
208	NO	V	NO	NO	NO	AGSP-1992	78	SIN ACOMPAÑANTES
210	NO	V	NO	NO	NO	AGSI-D-6032	80	CON ACOMPAÑANTES
213	no	V	no	no	no	AGSI-RE-0169	83	CON ACOMPAÑANTES
219	NO	P	NO	NO	NO	AGSI-D-20765	89	CON ACOMPAÑANTES
221	no	V	no	no	no	AGSI-PE-0288	91	CON ACOMPAÑANTES
223	no	V	no	no	no	AGSI-RE-TRAMITE87	93	SIN ACOMPAÑANTES
224	no	V	no	no	no	AGSI-RE-0989	94	CON ACOMPAÑANTES
228	NO	E	NO	NO	NO	AGSI-D-1648	98	SIN ACOMPAÑANTES
229	20782500	V	YENDER ALVARADO	NO	MARINO	AGSI-D-11629	24	CON ACOMPAÑANTES
250	NO	P	NO	NO	NO	ARSK-D-1085	108	SIN ACOMPAÑANTES
251	NO	V	NO	NO	NO	AGSI-PE -TRAMITE3232	109	CON ACOMPAÑANTES
252	NO	V	NO	NO	NO	AGSI-D-9606	110	CON ACOMPAÑANTES
253	NO	0	NO	NO	NO	AGSI-RE-TRAMITE 000123	111	CON ACOMPAÑANTES
466	9304546	V	PEDRO ROMERO	NO	CAPITAN	AGSI-RE-0346	133	CON ACOMPAÑANTES
255	NO	V	NO	NO	NO	AGSI-RE- TRAMITE96589	113	SIN ACOMPAÑANTES
256	NO	V	NO	NO	NO	AGSI-RE TRAMITE00332211	114	SIN ACOMPAÑANTES
475	1236547	V	felipe	no	capitan	AGSI-RE-0544	134	SIN ACOMPAÑANTES
268	NO	V	NO	NON	NO	AGSI-D-21173	116	CON ACOMPAÑANTES
269	NO	V	NO	NO	NO	AGSI-D-15916	117	SIN ACOMPAÑANTES
272	NO	V	NO	NO	NO	AGSI-D-16610	120	CON ACOMPAÑANTES
479	11680622	V	CLIFF ENDERS	NO	CAPITAN	AGSI-RE-0205	56	CON ACOMPAÑANTES
276	NO	V	NO	NO	NO	AGSI-RE-1587	124	CON ACOMPAÑANTES
277	12059428	V	GERARDO SIMONELLO	04242263064	MARINO	AGSI-D- 2796	125	CON ACOMPAÑANTES
278	19998500	V	RAUL ISSAC ABREU	04241624670	MARINO	AGSI-D- 2796	125	CON ACOMPAÑANTES
279		0				AGSI-RE-0601	43	0
280	24179797	V	ELIESE PEREZ	NO	MARINO	AGSI-PE-0892	68	SIN ACOMPAÑANTES
281	12657052	V	JOSE BARCENA	04145313076	MARINO	AGSI-PE-0892	68	SIN ACOMPAÑANTES
282	30859920	V	JOSE ROJAS 	04140253001	MARINO	AGSI-PE-0892	68	CON ACOMPAÑANTES
485	11639136	V	JUAN BLANCO	04143705056	ENCARGADO	AGSI-D-23005	1	CON ACOMPAÑANTES
284	4565637	V	ELY PLAZA	04141804123	MARINO	AGSI-D-4396	122	CON ACOMPAÑANTES
486	13671124	V	JOSE LUIS RODRIGUEZ	04241368081	CAPITAN	AGSI-D-23005	1	CON ACOMPAÑANTES
487	17959798	V	CARLOS MENDOSA 	NO	MARINERO	AGSI-D-23005	1	SIN ACOMPAÑANTES
488	11565670	V	ALEJANDRO HERNANDEZ	NO	MARINO	AGSI-D-23005	1	SIN ACOMPAÑANTES
288		0				AGSI-RE-0655	16	0
494	18.088.484	V	JUAN MANZO	3	M	AGSI-RE-1001	8	CON ACOMPAÑANTES
658	11308945	V	JAVIER ALEJANDRO RODRIGUEZ GONZALEZ	04122160238	CAPITAN -ENCRAGADO	AGSI-RE-TRAMITE	152	CON ACOMPAÑANTES
298	0000	V	0000	000	0000	AGSI-1444	129	CON ACOMPAÑANTES
299	19891708	V	REINALDO SANCHEZ	04165809577	CAPITAN	AGSI-RE-1444	129	SIN ACOMPAÑANTES
300	30241567	V	STEVEN PIÑA	NO	MARINO	AGSI-RE-1444	129	SIN ACOMPAÑANTES
301	18563778	V	ALI ACEITUNO	NO	MARINO	AGSI-RE-1444	129	SIN ACOMPAÑANTES
302	19891708	V	REINALDO SANCHEZ	04165809577	CAPITAN	CA224625	128	SIN ACOMPAÑANTES
303	15457416	V	PEDRO LARES	NO	MARINO	CA224625	128	SIN ACOMPAÑANTES
304	25428192	V	JOSE TERAN	NO	MARINO	CA224625	128	SIN ACOMPAÑANTES
508	13613003	V	YEHIKELLY NIÑO	04141176333	MARINO	AGSI-TU-0072	40	CON ACOMPAÑANTES
325	13945150	V	ALBERTO PARRA	04142573428	CAPITAN	AGSI-PE-1602	4	CON ACOMPAÑANTES
326	15831415	V	ALEJANDRO	04141840076	MARINO	AGSI-PE-1602	4	CON ACOMPAÑANTES
515	NO	E	NO	NO	NO	AGSI-D-TRAMI 023	81	CON ACOMPAÑANTES
519	26064693	V	MAURICIO VALLES 	04241930125	CO PROPIETARIO 	AGSI-RE-1604	131	CON ACOMPAÑANTES
520	26064694	V	EDUARDO VALLES 	04242765012	CO PROPIETARIO	AGSI-RE-1604	131	CON ACOMPAÑANTES
521	6915313	V	CORINA VALLES AZAR	04142494538	CO PROPIETARIO	AGSI-RE-1604	131	CON ACOMPAÑANTES
522	6466616	V	CESAR DOMINGUEZ	04241633765	MARINO	AGSI-RE-1604	131	SIN ACOMPAÑANTES
362	12989900	V	FREDDY ARABIA 	NO	MARINO	AGSI-D-9005	25	CON ACOMPAÑANTES
363	5499765	V	NERIO RAMIREZ	NO	MARINO	AGSI-D-9005	25	CON ACOMPAÑANTES
364	5097051	V	EFRAIN DIAZ	04129013569	MARINO	AGSI-D-9005	25	CON ACOMPAÑANTES
369	no	E	no	no	no	AGSI-RE-TRAMITE789	105	SIN ACOMPAÑANTES
371	7997763	V	jesusu villaruel	no	capitan	ENTRAMITE001	130	SIN ACOMPAÑANTES
372	13374147	V	nixzo navas	no	marino	ENTRAMITE001	130	SIN ACOMPAÑANTES
373	5801553	V	JOSE VILLAR	04122988898	MARINO	AGSI-2927	12	CON ACOMPAÑANTES
374	13945150	V	ALBERTO PARRA	04142573428	CAPITAN	AGSI-PE-0830	23	CON ACOMPAÑANTES
375	15831415	V	ALEJANDRO	04141840076	MARINO	AGSI-PE-0830	23	CON ACOMPAÑANTES
378	6977785	V	carlos presencia 	04143236141	capitan	AGSI TRAMITE 14521452	138	SIN ACOMPAÑANTES
379	18563435	V	miguel hernandez	no	marino	AGSI TRAMITE 14521452	138	SIN ACOMPAÑANTES
380	18755483	V	jesus elias	no	marino	AGSI TRAMITE 14521452	138	SIN ACOMPAÑANTES
381	KIUH6552	V	YF	02	ÑMJ	AGSI-RE-0009	141	SIN ACOMPAÑANTES
382	no	V	no	no	no	AGSI-AUXILIAR	127	SIN ACOMPAÑANTES
385	11680622	V	CLIFF ENDERS 	NO	CAPITAN	AGSI-RE-0268	57	CON ACOMPAÑANTES
386	13223517	V	CARMEN GONZALES	NO	MARINO	AGSI-RE-0268	57	CON ACOMPAÑANTES
390	sdsd	V	jgjhg	swdd	wd	AGSI-RE-0692	144	CON ACOMPAÑANTES
391	NO	P	NO	NO	NO	ARSH-D-957	88	CON ACOMPAÑANTES
393	19011745	V	PEDRO SANDOVAL	NO	MARINO	ADKN-D-57476	146	SIN ACOMPAÑANTES
394	26546826	V	WILKERMAN DUARTE	NO	MARINO	ADKN-D-57476	146	SIN ACOMPAÑANTES
395	21191056	V	JOSE CASTILLO	NO	MAQUINISTA	ADKN-D-57476	146	SIN ACOMPAÑANTES
659	N/A	V	N/A	N/A	N/A	AGSI-D-22141	153	SIN ACOMPAÑANTES
404	no	V	no	no	no	AGSM-D-1776	90	CON ACOMPAÑANTES
406	NO	V	NO	NO	NO	DL1324AC	75	CON ACOMPAÑANTES
407	21192516	V	EDINSON WALTER	NO	MARINO	AGSI-D-5814	3	SIN ACOMPAÑANTES
408	20558512	V	LUIS MESA	NO	ENCARGADO	ARSH-PJ-0034	58	CON ACOMPAÑANTES
416	11538409	V	VICENTE CARRERA	NO	ENCARGADO	AGSI-RE-0661	10	CON ACOMPAÑANTES
417	10583149	V	JUAN CARLOS CASTILLO	04122804407	CAPITAN	AGSI-RE-0661	10	SIN ACOMPAÑANTES
418	19914017	V	CARLOS CARRERA	NO	ADMIISTRACION	AGSI-RE-0661	10	CON ACOMPAÑANTES
419	6481893	V	JORGE VENALES	NO	MARINO	AGSI-RE-0661	10	SIN ACOMPAÑANTES
421	UHGU	E	NER	1454	MAR	AGSI-RE-0008	140	CON ACOMPAÑANTES
428	no	V	no	no	no	AGSI-RE-TRAMITE 741	104	CON ACOMPAÑANTES
431	18359239	V	JOSE SALAZAR	NO	MARINO	AGSI-PE-0887	26	CON ACOMPAÑANTES
467	23465	V	daniel	23434	capitan	AGSI-TU-0203	142	CON ACOMPAÑANTES
468	26327355	V	OSCAR ALVARES 	04140221405	ENCARGADO	AGSI-RE-0202	35	CON ACOMPAÑANTES
443	14.951.124	V	JESUS ARIAS	4444	M	ARSH-RE-0016	13	CON ACOMPAÑANTES
444	6801553	V	JOSE VILLAR	04122988898	CAPITAN	AGSI-2720	4	CON ACOMPAÑANTES
445	12689093	V	NYLIAN MENDEZ	NO	ENCARGADO	AGSI-2720	4	CON ACOMPAÑANTES
448	16.309.668	0	DONNYS TOVAR 	444	M	ADKN-D-3015	15	CON ACOMPAÑANTES
449	NO	V	NO	NO	NO	ADKN-D-3015	15	CON ACOMPAÑANTES
450	NO	V	NO	NO	NO	AGSI-PJ-0070	69	SIN ACOMPAÑANTES
451	20190405	V	LUIS ROBRIGUEZ 	04142233210	MARINO	AGSI-RE-1339	121	SIN ACOMPAÑANTES
452	11854155	V	JOSE NARVAEZ	04161992189	CAPITAN	AGSI-RE-1339	121	SIN ACOMPAÑANTES
453	20784897	V	JORDAN BRITO	04125712260	MARINO 	AGSI-RE-1339	121	SIN ACOMPAÑANTES
454	17960798	V	JESUS NAREA	NO	CAPITAN	AGSI-RE-0940	147	SIN ACOMPAÑANTES
455	11057093	V	FELIX SOJO	04125714143	CAPITAN	ARSH-RE-0255	148	SIN ACOMPAÑANTES
457	NO	V	NO	NO	NO	ADKN-2106	66	SIN ACOMPAÑANTES
459	14992455	V	RICHAR MORENO	04142534990	ENCARGADO	ARSH-D-1850	14	CON ACOMPAÑANTES
460	24181035	V	YENDERSONHS GONZALEZ	NO	MARINO	ARSH-D-1850	14	SIN ACOMPAÑANTES
461	26478384	V	EVELIO ROJAS	04241770011	MARINO	ARSH-D-1850	14	SIN ACOMPAÑANTES
469	6470808	V	LUIS SALAZAR	NO	MARINERO	AGSI-RE-0202	35	CON ACOMPAÑANTES
470	14568107	V	JEAN HERNANDEZ	NO	MARINERO	AGSI-RE-0202	35	CON ACOMPAÑANTES
471	22278769	V	MARCEL OJEDA	NO	MARINERO	AGSI-RE-0202	35	CON ACOMPAÑANTES
476	no	E	no	no	no	AGSI-RE-TRAMITE 456	103	CON ACOMPAÑANTES
480	18.941.701	V	PEDRO ELIAS 		M	APNN-D-675	42	CON ACOMPAÑANTES
489	NO	V	NO	NO	NO	AGSI-D-23647	86	CON ACOMPAÑANTES
509	6977785	V	Carlos presencia	04143236141	capitan	JMP-22159	137	SIN ACOMPAÑANTES
510	18563435	V	miguel hernandez	no	marino	JMP-22159	137	SIN ACOMPAÑANTES
511	18755483	V	jesus elias	no	marino	JMP-22159	137	SIN ACOMPAÑANTES
516	11.063.884	V	ABRAHAN JOSE NARVAEZ MARIN	0414-3065784	capitan	ADKN-RE-0740	126	CON ACOMPAÑANTES
523	8598773	V	DAGER JESUS AMPIEZ BRACHO	0424-8601627	CAPITAN	AGSI-RE-1673	150	SIN ACOMPAÑANTES
524	8273374	V	RAFAEL URBANO	NO	MARINO	AGSI-RE-1673	150	SIN ACOMPAÑANTES
525	16852765	V	ANDRES VASQUEZ	NO	MARINO	AGSI-RE-1673	150	SIN ACOMPAÑANTES
531	15035060	V	FREDDY CABELLO	04248160925	ENCARGADO	AGSP-RE-0514	36	CON ACOMPAÑANTES
532	17484872	V	SAMUEL CANTILLO	04242352017	MARINO	AGSP-RE-0514	36	CON ACOMPAÑANTES
533	14072283	V	MEDARDO GARCIA	04128787432	MARINO	AGSP-RE-0514	36	CON ACOMPAÑANTES
534	26725273	V	KELVIN LOZADA	04123358984	MARINO	AGSI-TU-0058	37	SIN ACOMPAÑANTES
535	11854155	V	JOSE NARVAEZ	04161992189	CAPITAN	AGSI-TU-0058	37	SIN ACOMPAÑANTES
536	15544286	V	ENDRINA LOPEZ	04122881322	MARINO	AGSI-RE-0753	59	CON ACOMPAÑANTES
537	26038329	V	ALEXANDER MARIN 	NO	MARINO 	AGSI-RE-0753	59	SIN ACOMPAÑANTES
538	28184414	V	CESAR CASTRO 	NO	MARINO	AGSI-RE-0753	59	SIN ACOMPAÑANTES
539	10583828	V	JESUS NARVAEZ	04128629167	CAPITAN	AGSI-RE-0753	59	SIN ACOMPAÑANTES
546	18141529	V	ROSEMI CASTRO	NO	MARINO CHEFF	AGSI-RE-TRAMITE7458	112	SIN ACOMPAÑANTES
547	13784273	V	ADAM PEROMO	04120126319	MARINO	AGSI-RE-TRAMITE7458	112	SIN ACOMPAÑANTES
548	14072929	V	JOAN MARVAL	04241406112	MARINO	AGSI-RE-TRAMITE7458	112	SIN ACOMPAÑANTES
549	30375783	V	DEIVIS VILLALOBOS	04149125203	MARINO	AGSI-RE-TRAMITE7458	112	SIN ACOMPAÑANTES
550	13128770	V	LUIS VILLALOBOS	04149234464	CAPITAN	AGSI-RE-TRAMITE7458	112	SIN ACOMPAÑANTES
551	12164168	V	JOEL RODRIGUEZ	NO	MARINO	AGSI-RE-TRAMITE7458	112	SIN ACOMPAÑANTES
552	14314130	V	ALEJANDRO RINCON	04143328646	ENCARGADO	AGSI-RE-1011	33	CON ACOMPAÑANTES
553	14542189	V	AYERMIS SALAZAR	04241122998	CAPITAN	AGSI-RE-1011	33	SIN ACOMPAÑANTES
554	22278500	V	ELYBERT RODIL	04129993354	MARINO	AGSI-RE-1011	33	SIN ACOMPAÑANTES
555	17153188	V	PATRICIA PICHARDO	NO	ENCARGADO	AGSI-RE-1011	33	SIN ACOMPAÑANTES
556	18324427	V	JASCKSON BLANCO	NO	ESCOLTA	AGSI-RE-1011	33	SIN ACOMPAÑANTES
557	11967481	V	JOSE GONZALEZ	NO	ESCOLTA	AGSI-RE-1011	33	SIN ACOMPAÑANTES
558	19627946	V	DANIEL PEREZ	NO	ESCOLTA	AGSI-RE-1011	33	SIN ACOMPAÑANTES
559	18140657	V	JOSE HERNANDEZ	NO	ESCOLTA	AGSI-RE-1011	33	SIN ACOMPAÑANTES
560	21192434	V	LUIS GOMEZ	NO	ESCOLTA	AGSI-RE-1011	33	SIN ACOMPAÑANTES
561	28184914	V	CESAR CASTRO 	NO	MARINO	AGSI-RE-0575	31	SIN ACOMPAÑANTES
562	10577881	V	FREDDY BENITEZ	04142438320	ENCARGADO	AGSI-RE-0575	31	SIN ACOMPAÑANTES
563	17642538	V	CESAR BURAGLIA	NO	MARINO	AGSI-RE-0575	31	SIN ACOMPAÑANTES
566	6075180	V	ANTONIO MARCANO	NO	MARINO	AGSI-PE-0829	22	CON ACOMPAÑANTES
567	6075181	V	LUIS CORONEL 	NO	MARINO	AGSI-PE-0829	22	CON ACOMPAÑANTES
568	12717837	V	GREGORI0 BLASSIS	NO	MARINO	AGSI-PE-0829	22	CON ACOMPAÑANTES
569	HGVBBGH	V	JOSE GUALIPA		MARINO	AGSI-PE-0829	22	CON ACOMPAÑANTES
582	11057093	V	FELIX SOJO 	04125714143	CAPITAN	AGSI-RE-1303	60	CON ACOMPAÑANTES
583	19443227	V	FRANKLIN GIL	04241928160	MARINO	AGSI-RE-1303	60	SIN ACOMPAÑANTES
584	27904025	V	ANGEL DIAZ	04241798069	MARINO	AGSI-RE-1303	60	SIN ACOMPAÑANTES
585	26953999	V	CESAR GIL	04241837930	MARINO	AGSI-RE-1303	60	SIN ACOMPAÑANTES
586	12461551	V	RICHAR PIÑERO	04143025940	MARINO	AGSI-RE-1420	76	SIN ACOMPAÑANTES
587	15544444	V	ALVARO MARIN	04129196376	CAPITAN	AGSI-RE-1420	76	SIN ACOMPAÑANTES
588	19584502	V	CARLOS SALAZAR	NO	MARINO	AGSI-RE-1420	76	SIN ACOMPAÑANTES
589	27160438	V	DAISON CARPIO	04241453085	MARINO	AGSI-RE-1687	139	SIN ACOMPAÑANTES
590	24178022	V	RUBEN DIAZ 	04241453085	MARINO	AGSI-RE-1687	139	SIN ACOMPAÑANTES
591	14314130	V	ALEJANDRO RINCON	04143328646	ENCARGADO	AGSI-RE-22326	34	CON ACOMPAÑANTES
592	9999073	V	HECTOR ORAMA	04120106466	CAPITAN	Agsi-re-0678	95	SIN ACOMPAÑANTES
593	6482339	V	OSCAR TERAN	04129805238	MARINO	Agsi-re-0678	95	SIN ACOMPAÑANTES
597	3888492	V	ERNESTO MILLAN 	NO	CAPITAN	AGSI-RE-1349	6	CON ACOMPAÑANTES
598	13032832	V	YESIKA DORANTE 	04123908974	ENCARGADO	AGSI-RE-1349	6	CON ACOMPAÑANTES
599	31201913	V	JULIO PEREIRA	04241939227	MARINO	AGSI-RE-1349	6	SIN ACOMPAÑANTES
603	26180209	V	JESUS MATOS 	NO	MARINO	AGSI-TU-0182	30	SIN ACOMPAÑANTES
604	23644326	V	YENDER MOYA 	04142141451	MOTORISTA	AGSI-TU-0182	30	SIN ACOMPAÑANTES
605	10335859	V	MICHELANGELO TEPEDINO 		CO PROPIETARIO	AGSI-TU-0182	30	SIN ACOMPAÑANTES
606	13572675	V	JULIO GARCIA	04142445560	MARINO	AGSI-PE-0842	70	CON ACOMPAÑANTES
607	14312106	V	DANIEL VASQUEZ	04143157450	CAPITAN	AGSI-PE-0842	70	CON ACOMPAÑANTES
608	18323587	V	LUIS ZAMORA 	04141539597	CAPITAN	AGSI-RE-1239	55	SIN ACOMPAÑANTES
609	18323587	V	LUIS ZAMORA	04141539597	ENCARGADO	AGSI-RE-GTRAMITE52	92	SIN ACOMPAÑANTES
610	6801553	V	JOSE VILLAR	04122988898	ENCARGADO	ARSH-D-2077	115	SIN ACOMPAÑANTES
611	14428119	V	ELAINE BRAVO	04241720343	ENCARGADO	AGSP-RE-1071	54	CON ACOMPAÑANTES
612	10286100	V	GREGORIO SALAZAR	NO	CAPITAN	AGSP-RE-1071	54	CON ACOMPAÑANTES
613	28302959	V	PEDRO MONTILLA	NO	MARINO	AGSP-RE-1071	54	SIN ACOMPAÑANTES
614	20538515	V	MERLY HERNANDEZ	NO	MARINO	AGSP-RE-1071	54	SIN ACOMPAÑANTES
615	13479165	V	RICHARD QUINTERO 	NO	MARINO	AGSP-RE-1071	54	SIN ACOMPAÑANTES
616	18141009	V	CARLOS PEREZ	04122849894	CAPITAN	AGSM-RE-0620	61	CON ACOMPAÑANTES
617	28184348	V	EDWAR GONZALEZ	NO	MARINO	AGSM-RE-0620	61	SIN ACOMPAÑANTES
618	11637779	V	mario moreno	04120202330	marino	AGSM-RE-0897	53	SIN ACOMPAÑANTES
619	21632142	V	ALDRIN FLORES	NO	MARINO	AGSI-PE-0816	48	SIN ACOMPAÑANTES
620		0				AGSI-D-5535	32	0
621	no	V	no	no	no	AGSI-re-tramite-098	100	CON ACOMPAÑANTES
622	NO	V	NO	NO	NO	Agsi-re-tramite-3344	96	CON ACOMPAÑANTES
623	22526021	V	FRANKIN RONDON	NO	MARINO	AGSI-RE-0437	39	SIN ACOMPAÑANTES
624	12138770	V	franklin rivas	no	capitan	AGSI-RE-1674	135	SIN ACOMPAÑANTES
625	12164550	V	LUIS FELIPE HERNANDEZ	2700492	CAPITAN	AGSI-RE-0805	107	CON ACOMPAÑANTES
626	19584502	V	CARLOS SALAZAR 	NO	MARINO	AGSI-RE-0805	107	SIN ACOMPAÑANTES
627	4563905	V	ARMANDO MESA 	NO	MARINO	AGSI-RE-0805	107	SIN ACOMPAÑANTES
628	15457416	V	PEDRO LARES	NO	MARINO	AGSI-RE-0805	107	SIN ACOMPAÑANTES
629	15035060	V	FREDDY CABELLO 	04248160925	ENCARGADO	AGSP-RE.0016	145	SIN ACOMPAÑANTES
630	17484872	V	SAMUEL CANTILLO	04242352017	MARINO	AGSP-RE.0016	145	SIN ACOMPAÑANTES
631	NO	V	NO	NO	MAREI	ARSH-D-1448	71	SIN ACOMPAÑANTES
632	0	V	ANTONIO PEREIRA 	04142868263	ENCARGADO	AGSI-RE-1404	65	CON ACOMPAÑANTES
633	5576793	V	ANDRES CADIZ	04241631728	CAPITAN	AGSI-PE-0532	20	SIN ACOMPAÑANTES
634	26180209	V	JESUS MATOS	NO	MARINO	AGSI-D-5124	28	SIN ACOMPAÑANTES
635	23644326	V	YENDER MOLLA	04142141451	MOTORISTA	AGSI-D-5124	28	SIN ACOMPAÑANTES
636	7991699	V	MARTIN MATOS	04122893490	MARINO	AGSI-D-5124	28	SIN ACOMPAÑANTES
637	5576793	V	ANDRES CADIZ	04241631728	MARINO	AGSI-PE-0879	45	SIN ACOMPAÑANTES
638	no	V	 no	no	no	Agsi-re-tramite-224466	106	CON ACOMPAÑANTES
639	no	E	no	no	no	AGSI-2221	99	CON ACOMPAÑANTES
640	NO	V	NO	NO	NO	AGSI-D-5810	79	CON ACOMPAÑANTES
641	no	V	no	no	no	AQYM-D-050	101	CON ACOMPAÑANTES
642	NO	V	NO	NO	NO	AGSP-2214	72	CON ACOMPAÑANTES
643	3366143	V	FLORENCIO SUAREZ	NO	CAPITAN	AGSI-RE-1098	9	SIN ACOMPAÑANTES
644	12335482	V	WALTER SANCHEZ	04242750710	ENCARGADO	AGSI-RE-1098	9	CON ACOMPAÑANTES
645	15457416	V	PEDRO LAREZ	04244513228	CAPITAN	AGSI-RE-TREMITE1258	149	SIN ACOMPAÑANTES
646	25675969	V	JEISSON JIMENEZ 	NO	MARINO	AGSI-RE-TREMITE1258	149	SIN ACOMPAÑANTES
647	19876830	V	DAYANA QUINTERO	NO	MARINO CHEFF	AGSI-RE-TREMITE1258	149	SIN ACOMPAÑANTES
648	381797	E	TATIANA RAMOS 	NO	MARINO CHEFF	AGSI-RE-TREMITE1258	149	SIN ACOMPAÑANTES
649	15675253	V	LEONARDO ESTREDO	NO	MARINO	AGSI-RE-TREMITE1258	149	SIN ACOMPAÑANTES
650	5423492	V	LETIZIA INFANTES	NO	ENCARDADA	AGSI-D-11413	5	CON ACOMPAÑANTES
651	14055510	V	FRANCISCO MARIN	04241655632	CAPITAN	AMSH-RE 0323	97	CON ACOMPAÑANTES
652	29672046	V	ELIEZER MENDES 	04141730255	MARINO	AMSH-RE 0323	97	CON ACOMPAÑANTES
653	30737888	V	YENDRINSON MENDES	04122212739	MARINO	AMSH-RE 0323	97	CON ACOMPAÑANTES
654	18359240	V	GLEIVIS SALAZAR 	04141011740	CAPITAN 	AGSI-RE-1324	102	CON ACOMPAÑANTES
655	18359246	V	OSCAR SALAZAR	04248596735	MARINO	AGSI-RE-1324	102	0
656	4559318	V	MODESTO ZALAZAR 	04142464626	MARINO	AGSI-RE-1324	102	0
\.


--
-- TOC entry 3264 (class 0 OID 84746)
-- Dependencies: 245
-- Data for Name: ubicacion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ubicacion (id, descripcion, maximo) FROM stdin;
1	MUELLE 1A	20
2	MUELLE 2A	20
3	MUELLE B	20
4	MUELLE C	20
5	MUELLE D	20
6	PATIO 1	20
7	PATIO 2	20
8	PATIO 3	20
9	PATIO 4	20
\.


--
-- TOC entry 3269 (class 0 OID 123828)
-- Dependencies: 251
-- Data for Name: und; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.und (id_und, desc_und, id_usuario, fecha) FROM stdin;
4	12 Uds.	1	2024-02-06
8	36 Uds.	1	2024-02-06
1	1 Uds.	1	2024-02-06
2	2 Uds.	1	2024-02-06
3	6 Uds.	1	2024-02-06
7	24 Uds.	1	2024-02-06
5	15 Uds.	1	2024-02-06
6	16 Uds.	1	2024-02-06
\.


--
-- TOC entry 3273 (class 0 OID 123914)
-- Dependencies: 255
-- Data for Name: vendedor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vendedor (id_vendedor, nombre_vendedor, rif_vendedor, direccion, telefono, status, id_usuario, fecha_creacion) FROM stdin;
1	Rober Torres	V21151374	S	4143322413	1	1	2024-02-12
2	retro	V1542222	S	4143322413	1	1	2024-02-12
\.


--
-- TOC entry 3266 (class 0 OID 84751)
-- Dependencies: 247
-- Data for Name: usuarios; Type: TABLE DATA; Schema: seguridad; Owner: postgres
--

COPY seguridad.usuarios (id, cedula, email, nombre, apellido, password, rif, tele_1, perfil, foto, intentos, id_estatus, fecha, fecha_update) FROM stdin;
1	\N	luis.molero80@gmail.com	luis.molero80@gmail.com	\N	$2y$10$.Xif7vd9D9pRPkv.grUxtuG8N..Lk48VWg4v78AIqfqH4r8bxWRS.	J413233010	\N	1	\N	\N	1	\N	\N
4	44444	luis.moler44o80@gmail.com	luis.moler44o80@gmail.com	MOLERO	$2y$10$a74yBYPIIaQ3LB1ZQE.DiesSxndeRY/3EyqAdTBdnkZI8MV9jAtr.	J413233010	44444	3	2	1	1	2023-05-09 05:05:59	2023-05-09 00:00:00
5	11064803	veroestilita@gmail.com	veroestilita@gmail.com	PLANAS	$2y$10$/3Sd2pWtTJLorhp5.00cR.xYzrCr0xS7F4nZ1VKx5.1IbgwCJcwne	J413233010	04127338739	1	2	1	1	2023-05-09 05:05:47	2023-05-09 00:00:00
6	20689638	1004.osman@gmail.com	1004.osman@gmail.com	HERNANDEZ	$2y$10$HvFKI0m6jBZ9By41W0O4A.peZrP1DJffhIg4O0hvFtJiuJAfqk3Yu	J413233010	04126656227	1	2	1	1	2023-06-24 04:06:52	2023-06-24 00:00:00
2	\N	admin@gmail.com	siled	\N	$2y$10$HvFKI0m6jBZ9By41W0O4A.peZrP1DJffhIg4O0hvFtJiuJAfqk3Yu	J501228442	\N	1	\N	2	1	\N	\N
\.


--
-- TOC entry 3309 (class 0 OID 0)
-- Dependencies: 204
-- Name: alicuota_iva_id_alicuota_iva_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.alicuota_iva_id_alicuota_iva_seq', 9, true);


--
-- TOC entry 3310 (class 0 OID 0)
-- Dependencies: 206
-- Name: banco_id_banco_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.banco_id_banco_seq', 3, true);


--
-- TOC entry 3311 (class 0 OID 0)
-- Dependencies: 208
-- Name: buque_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.buque_id_seq', 7, true);


--
-- TOC entry 3312 (class 0 OID 0)
-- Dependencies: 256
-- Name: cliente_id_cliente_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cliente_id_cliente_seq', 2, true);


--
-- TOC entry 3313 (class 0 OID 0)
-- Dependencies: 210
-- Name: deta_factura_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.deta_factura_id_seq', 38, true);


--
-- TOC entry 3314 (class 0 OID 0)
-- Dependencies: 212
-- Name: deta_recibo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.deta_recibo_id_seq', 189, true);


--
-- TOC entry 3315 (class 0 OID 0)
-- Dependencies: 214
-- Name: dolar_id_dolar_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dolar_id_dolar_seq', 3, true);


--
-- TOC entry 3316 (class 0 OID 0)
-- Dependencies: 218
-- Name: factura_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.factura_id_seq', 28, true);


--
-- TOC entry 3317 (class 0 OID 0)
-- Dependencies: 220
-- Name: mensualidad_id_mensualidad_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.mensualidad_id_mensualidad_seq', 2212, true);


--
-- TOC entry 3318 (class 0 OID 0)
-- Dependencies: 223
-- Name: mov_consig_id_mov_consig_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.mov_consig_id_mov_consig_seq', 4177, true);


--
-- TOC entry 3319 (class 0 OID 0)
-- Dependencies: 252
-- Name: producto_id_producto_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.producto_id_producto_seq', 1, false);


--
-- TOC entry 3320 (class 0 OID 0)
-- Dependencies: 226
-- Name: propiet_id_propiet_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.propiet_id_propiet_seq', 412, true);


--
-- TOC entry 3321 (class 0 OID 0)
-- Dependencies: 228
-- Name: recibo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.recibo_id_seq', 148, true);


--
-- TOC entry 3322 (class 0 OID 0)
-- Dependencies: 232
-- Name: tarifa_id_tarifa_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tarifa_id_tarifa_seq', 1, true);


--
-- TOC entry 3323 (class 0 OID 0)
-- Dependencies: 234
-- Name: tipobarco_id_tipobarco_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tipobarco_id_tipobarco_seq', 8, true);


--
-- TOC entry 3324 (class 0 OID 0)
-- Dependencies: 236
-- Name: tipocliente_id_tipocliente_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tipocliente_id_tipocliente_seq', 3, true);


--
-- TOC entry 3325 (class 0 OID 0)
-- Dependencies: 238
-- Name: tipoestac_id_tipoestac_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tipoestac_id_tipoestac_seq', 2, true);


--
-- TOC entry 3326 (class 0 OID 0)
-- Dependencies: 240
-- Name: tipopago_id_tipo_pago_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tipopago_id_tipo_pago_seq', 1, true);


--
-- TOC entry 3327 (class 0 OID 0)
-- Dependencies: 244
-- Name: tripulacion_id_tripulacion_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tripulacion_id_tripulacion_seq', 659, true);


--
-- TOC entry 3328 (class 0 OID 0)
-- Dependencies: 246
-- Name: ubicacion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ubicacion_id_seq', 2, true);


--
-- TOC entry 3329 (class 0 OID 0)
-- Dependencies: 254
-- Name: vendedor_id_vendedor_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vendedor_id_vendedor_seq', 2, true);


--
-- TOC entry 3330 (class 0 OID 0)
-- Dependencies: 248
-- Name: usuarios_id_seq; Type: SEQUENCE SET; Schema: seguridad; Owner: postgres
--

SELECT pg_catalog.setval('seguridad.usuarios_id_seq', 7, true);


--
-- TOC entry 3059 (class 2606 OID 84779)
-- Name: alicuota_iva alicuota_iva_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alicuota_iva
    ADD CONSTRAINT alicuota_iva_pkey PRIMARY KEY (id_alicuota_iva);


--
-- TOC entry 3087 (class 2606 OID 123930)
-- Name: cliente cliente_id_cliente_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_id_cliente_key UNIQUE (id_cliente);


--
-- TOC entry 3061 (class 2606 OID 84781)
-- Name: dolar dolar_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dolar
    ADD CONSTRAINT dolar_pkey PRIMARY KEY (id_dolar);


--
-- TOC entry 3063 (class 2606 OID 84783)
-- Name: estatus estatus_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estatus
    ADD CONSTRAINT estatus_pkey PRIMARY KEY (id_status);


--
-- TOC entry 3067 (class 2606 OID 84785)
-- Name: mov_consig id_mov_consig_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mov_consig
    ADD CONSTRAINT id_mov_consig_pkey PRIMARY KEY (id_mov_consig);


--
-- TOC entry 3079 (class 2606 OID 123827)
-- Name: marca marca_id_marca_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.marca
    ADD CONSTRAINT marca_id_marca_key UNIQUE (id_marca);


--
-- TOC entry 3065 (class 2606 OID 84787)
-- Name: mensualidad mensualidad_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mensualidad
    ADD CONSTRAINT mensualidad_pkey PRIMARY KEY (id_mensualidad);


--
-- TOC entry 3089 (class 2606 OID 132148)
-- Name: mov_prod producto_id_mov_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mov_prod
    ADD CONSTRAINT producto_id_mov_key UNIQUE (id_mov);


--
-- TOC entry 3083 (class 2606 OID 123877)
-- Name: producto producto_id_producto_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.producto
    ADD CONSTRAINT producto_id_producto_key UNIQUE (id_producto);


--
-- TOC entry 3075 (class 2606 OID 84789)
-- Name: tipopago tipo_pago_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipopago
    ADD CONSTRAINT tipo_pago_pkey PRIMARY KEY (id_tipo_pago);


--
-- TOC entry 3069 (class 2606 OID 84791)
-- Name: tipobarco tipobarco_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipobarco
    ADD CONSTRAINT tipobarco_pkey PRIMARY KEY (id_tipobarco);


--
-- TOC entry 3071 (class 2606 OID 84793)
-- Name: tipocliente tipocliente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipocliente
    ADD CONSTRAINT tipocliente_pkey PRIMARY KEY (id_tipocliente);


--
-- TOC entry 3073 (class 2606 OID 84795)
-- Name: tipoestac tipoestac_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipoestac
    ADD CONSTRAINT tipoestac_pkey PRIMARY KEY (id_tipoestac);


--
-- TOC entry 3081 (class 2606 OID 123832)
-- Name: und und_id_und_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.und
    ADD CONSTRAINT und_id_und_key UNIQUE (id_und);


--
-- TOC entry 3085 (class 2606 OID 123919)
-- Name: vendedor vendedor_id_vendedor_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendedor
    ADD CONSTRAINT vendedor_id_vendedor_key UNIQUE (id_vendedor);


--
-- TOC entry 3077 (class 2606 OID 84797)
-- Name: usuarios usuarios_pkey; Type: CONSTRAINT; Schema: seguridad; Owner: postgres
--

ALTER TABLE ONLY seguridad.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id);


--
-- TOC entry 3094 (class 2620 OID 132143)
-- Name: deta_recibo update_quantity; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_quantity AFTER INSERT ON public.deta_recibo FOR EACH ROW EXECUTE FUNCTION public.update_product_quantity();


--
-- TOC entry 3092 (class 2606 OID 123931)
-- Name: cliente cliente_id_vendedor_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_id_vendedor_fk FOREIGN KEY (id_vendedor) REFERENCES public.vendedor(id_vendedor);


--
-- TOC entry 3090 (class 2606 OID 123883)
-- Name: producto producto_id_marca_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.producto
    ADD CONSTRAINT producto_id_marca_fk FOREIGN KEY (id_marca) REFERENCES public.marca(id_marca);


--
-- TOC entry 3093 (class 2606 OID 132149)
-- Name: mov_prod producto_id_producto_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mov_prod
    ADD CONSTRAINT producto_id_producto_fk FOREIGN KEY (id_producto) REFERENCES public.producto(id_producto);


--
-- TOC entry 3091 (class 2606 OID 123878)
-- Name: producto producto_id_und_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.producto
    ADD CONSTRAINT producto_id_und_fk FOREIGN KEY (id_und) REFERENCES public.und(id_und);


--
-- TOC entry 3286 (class 0 OID 0)
-- Dependencies: 6
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2024-02-25 21:12:30 -04

--
-- PostgreSQL database dump complete
--

