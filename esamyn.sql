--
-- PostgreSQL database dump
--

-- Dumped from database version 9.2.18
-- Dumped by pg_dump version 9.5.4

-- Started on 2017-08-28 22:19:52

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 11 (class 2615 OID 16787)
-- Name: esamyn; Type: SCHEMA; Schema: -; Owner: esamyn_user
--

CREATE SCHEMA esamyn;


ALTER SCHEMA esamyn OWNER TO esamyn_user;

SET search_path = esamyn, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 214 (class 1259 OID 16788)
-- Name: esa_canton; Type: TABLE; Schema: esamyn; Owner: esamyn_user
--

CREATE TABLE esa_canton (
    can_id bigint NOT NULL,
    can_provincia bigint,
    can_nombre text,
    can_codigo text
);


ALTER TABLE esa_canton OWNER TO esamyn_user;

--
-- TOC entry 215 (class 1259 OID 16794)
-- Name: esa_canton_can_id_seq; Type: SEQUENCE; Schema: esamyn; Owner: esamyn_user
--

CREATE SEQUENCE esa_canton_can_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE esa_canton_can_id_seq OWNER TO esamyn_user;

--
-- TOC entry 3255 (class 0 OID 0)
-- Dependencies: 215
-- Name: esa_canton_can_id_seq; Type: SEQUENCE OWNED BY; Schema: esamyn; Owner: esamyn_user
--

ALTER SEQUENCE esa_canton_can_id_seq OWNED BY esa_canton.can_id;


--
-- TOC entry 253 (class 1259 OID 17506)
-- Name: esa_catalogo; Type: TABLE; Schema: esamyn; Owner: esamyn_user
--

CREATE TABLE esa_catalogo (
    cat_id bigint NOT NULL,
    cat_creado timestamp with time zone DEFAULT now() NOT NULL,
    cat_modificado timestamp with time zone DEFAULT now() NOT NULL,
    cat_codigo text NOT NULL,
    cat_valor text NOT NULL
);


ALTER TABLE esa_catalogo OWNER TO esamyn_user;

--
-- TOC entry 252 (class 1259 OID 17504)
-- Name: esa_catalogo_cat_id_seq; Type: SEQUENCE; Schema: esamyn; Owner: esamyn_user
--

CREATE SEQUENCE esa_catalogo_cat_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE esa_catalogo_cat_id_seq OWNER TO esamyn_user;

--
-- TOC entry 3256 (class 0 OID 0)
-- Dependencies: 252
-- Name: esa_catalogo_cat_id_seq; Type: SEQUENCE OWNED BY; Schema: esamyn; Owner: esamyn_user
--

ALTER SEQUENCE esa_catalogo_cat_id_seq OWNED BY esa_catalogo.cat_id;


--
-- TOC entry 216 (class 1259 OID 16796)
-- Name: esa_condicion_no_aplica; Type: TABLE; Schema: esamyn; Owner: esamyn_user
--

CREATE TABLE esa_condicion_no_aplica (
    cna_id bigint NOT NULL,
    cna_texto text
);


ALTER TABLE esa_condicion_no_aplica OWNER TO esamyn_user;

--
-- TOC entry 217 (class 1259 OID 16802)
-- Name: esa_condicion_con_id_seq; Type: SEQUENCE; Schema: esamyn; Owner: esamyn_user
--

CREATE SEQUENCE esa_condicion_con_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE esa_condicion_con_id_seq OWNER TO esamyn_user;

--
-- TOC entry 3257 (class 0 OID 0)
-- Dependencies: 217
-- Name: esa_condicion_con_id_seq; Type: SEQUENCE OWNED BY; Schema: esamyn; Owner: esamyn_user
--

ALTER SEQUENCE esa_condicion_con_id_seq OWNED BY esa_condicion_no_aplica.cna_id;


--
-- TOC entry 251 (class 1259 OID 17136)
-- Name: esa_cumple_condicion_no_aplica; Type: TABLE; Schema: esamyn; Owner: esamyn_user
--

CREATE TABLE esa_cumple_condicion_no_aplica (
    ccn_id bigint NOT NULL,
    ccn_creado timestamp with time zone DEFAULT now() NOT NULL,
    ccn_modificado timestamp with time zone DEFAULT now() NOT NULL,
    ccn_evaluacion bigint NOT NULL,
    ccn_condicion_no_aplica bigint NOT NULL,
    ccn_cumple integer DEFAULT 1 NOT NULL
);


ALTER TABLE esa_cumple_condicion_no_aplica OWNER TO esamyn_user;

--
-- TOC entry 250 (class 1259 OID 17134)
-- Name: esa_cumple_condicion_na_ccn_id_seq; Type: SEQUENCE; Schema: esamyn; Owner: esamyn_user
--

CREATE SEQUENCE esa_cumple_condicion_na_ccn_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE esa_cumple_condicion_na_ccn_id_seq OWNER TO esamyn_user;

--
-- TOC entry 3258 (class 0 OID 0)
-- Dependencies: 250
-- Name: esa_cumple_condicion_na_ccn_id_seq; Type: SEQUENCE OWNED BY; Schema: esamyn; Owner: esamyn_user
--

ALTER SEQUENCE esa_cumple_condicion_na_ccn_id_seq OWNED BY esa_cumple_condicion_no_aplica.ccn_id;


--
-- TOC entry 218 (class 1259 OID 16804)
-- Name: esa_encuesta; Type: TABLE; Schema: esamyn; Owner: esamyn_user
--

CREATE TABLE esa_encuesta (
    enc_id bigint NOT NULL,
    enc_creado timestamp with time zone DEFAULT '2017-07-20 14:36:22.557893+00'::timestamp with time zone NOT NULL,
    enc_modificado timestamp with time zone DEFAULT '2017-07-20 14:36:22.557893+00'::timestamp with time zone NOT NULL,
    enc_creado_por text,
    enc_modificado_por text,
    enc_formulario bigint,
    enc_usuario bigint,
    enc_evaluacion bigint,
    enc_finalizada integer DEFAULT 0 NOT NULL,
    enc_fecha_inicial timestamp with time zone DEFAULT '2017-07-20 14:36:22.557893+00'::timestamp with time zone NOT NULL,
    enc_fecha_final timestamp without time zone,
    enc_establecimiento_salud bigint,
    enc_responsable text,
    enc_cargo text,
    enc_extra text
);


ALTER TABLE esa_encuesta OWNER TO esamyn_user;

--
-- TOC entry 219 (class 1259 OID 16814)
-- Name: esa_encuesta_enc_id_seq; Type: SEQUENCE; Schema: esamyn; Owner: esamyn_user
--

CREATE SEQUENCE esa_encuesta_enc_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE esa_encuesta_enc_id_seq OWNER TO esamyn_user;

--
-- TOC entry 3259 (class 0 OID 0)
-- Dependencies: 219
-- Name: esa_encuesta_enc_id_seq; Type: SEQUENCE OWNED BY; Schema: esamyn; Owner: esamyn_user
--

ALTER SEQUENCE esa_encuesta_enc_id_seq OWNED BY esa_encuesta.enc_id;


--
-- TOC entry 220 (class 1259 OID 16816)
-- Name: esa_establecimiento_salud; Type: TABLE; Schema: esamyn; Owner: esamyn_user
--

CREATE TABLE esa_establecimiento_salud (
    ess_id bigint NOT NULL,
    ess_creado timestamp with time zone DEFAULT '2017-07-20 14:36:22.557893+00'::timestamp with time zone NOT NULL,
    ess_modificado timestamp with time zone DEFAULT '2017-07-20 14:36:22.557893+00'::timestamp with time zone NOT NULL,
    ess_canton bigint,
    ess_persona_juridica bigint,
    ess_nombre text,
    ess_unicodigo text,
    ess_direccion text,
    ess_latitud text,
    ess_longitud text,
    ess_telefono text,
    ess_correo_electronico text,
    ess_nombre_responsable text,
    ess_zona text,
    ess_distrito text
);


ALTER TABLE esa_establecimiento_salud OWNER TO esamyn_user;

--
-- TOC entry 221 (class 1259 OID 16824)
-- Name: esa_establecimiento_salud_ess_id_seq; Type: SEQUENCE; Schema: esamyn; Owner: esamyn_user
--

CREATE SEQUENCE esa_establecimiento_salud_ess_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE esa_establecimiento_salud_ess_id_seq OWNER TO esamyn_user;

--
-- TOC entry 3260 (class 0 OID 0)
-- Dependencies: 221
-- Name: esa_establecimiento_salud_ess_id_seq; Type: SEQUENCE OWNED BY; Schema: esamyn; Owner: esamyn_user
--

ALTER SEQUENCE esa_establecimiento_salud_ess_id_seq OWNED BY esa_establecimiento_salud.ess_id;


--
-- TOC entry 222 (class 1259 OID 16826)
-- Name: esa_evaluacion; Type: TABLE; Schema: esamyn; Owner: esamyn_user
--

CREATE TABLE esa_evaluacion (
    eva_id bigint NOT NULL,
    eva_creado timestamp with time zone DEFAULT '2017-07-20 14:36:22.557893+00'::timestamp with time zone NOT NULL,
    eva_modificado timestamp with time zone DEFAULT '2017-07-20 14:36:22.557893+00'::timestamp with time zone NOT NULL,
    eva_creado_por text,
    eva_modificado_por text,
    eva_usuario bigint,
    eva_establecimiento_salud bigint,
    eva_numero integer,
    eva_calificacion numeric,
    eva_fecha_inicio timestamp with time zone DEFAULT '2017-07-20 14:36:22.557893+00'::timestamp with time zone NOT NULL,
    eva_fecha_calificacion timestamp with time zone,
    eva_cantidad_encuestas integer DEFAULT 0 NOT NULL
);


ALTER TABLE esa_evaluacion OWNER TO esamyn_user;

--
-- TOC entry 223 (class 1259 OID 16836)
-- Name: esa_evaluacion_eva_id_seq; Type: SEQUENCE; Schema: esamyn; Owner: esamyn_user
--

CREATE SEQUENCE esa_evaluacion_eva_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE esa_evaluacion_eva_id_seq OWNER TO esamyn_user;

--
-- TOC entry 3261 (class 0 OID 0)
-- Dependencies: 223
-- Name: esa_evaluacion_eva_id_seq; Type: SEQUENCE OWNED BY; Schema: esamyn; Owner: esamyn_user
--

ALTER SEQUENCE esa_evaluacion_eva_id_seq OWNED BY esa_evaluacion.eva_id;


--
-- TOC entry 224 (class 1259 OID 16838)
-- Name: esa_formulario; Type: TABLE; Schema: esamyn; Owner: esamyn_user
--

CREATE TABLE esa_formulario (
    frm_id bigint NOT NULL,
    frm_creado timestamp with time zone DEFAULT '2017-07-20 14:36:22.557893+00'::timestamp with time zone NOT NULL,
    frm_modificado timestamp with time zone DEFAULT '2017-07-20 14:36:22.557893+00'::timestamp with time zone NOT NULL,
    frm_nombre text,
    frm_titulo text,
    frm_subtitulo text,
    frm_ayuda text,
    frm_clave text
);


ALTER TABLE esa_formulario OWNER TO esamyn_user;

--
-- TOC entry 225 (class 1259 OID 16846)
-- Name: esa_formulario_frm_id_seq; Type: SEQUENCE; Schema: esamyn; Owner: esamyn_user
--

CREATE SEQUENCE esa_formulario_frm_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE esa_formulario_frm_id_seq OWNER TO esamyn_user;

--
-- TOC entry 3262 (class 0 OID 0)
-- Dependencies: 225
-- Name: esa_formulario_frm_id_seq; Type: SEQUENCE OWNED BY; Schema: esamyn; Owner: esamyn_user
--

ALTER SEQUENCE esa_formulario_frm_id_seq OWNED BY esa_formulario.frm_id;


--
-- TOC entry 226 (class 1259 OID 16848)
-- Name: esa_grupo_parametro; Type: TABLE; Schema: esamyn; Owner: esamyn_user
--

CREATE TABLE esa_grupo_parametro (
    gpa_id bigint NOT NULL,
    gpa_padre bigint,
    gpa_tipo_grupo_parametro bigint,
    gpa_texto text,
    gpa_clave text
);


ALTER TABLE esa_grupo_parametro OWNER TO esamyn_user;

--
-- TOC entry 227 (class 1259 OID 16854)
-- Name: esa_grupo_parametro_gpa_id_seq; Type: SEQUENCE; Schema: esamyn; Owner: esamyn_user
--

CREATE SEQUENCE esa_grupo_parametro_gpa_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE esa_grupo_parametro_gpa_id_seq OWNER TO esamyn_user;

--
-- TOC entry 3263 (class 0 OID 0)
-- Dependencies: 227
-- Name: esa_grupo_parametro_gpa_id_seq; Type: SEQUENCE OWNED BY; Schema: esamyn; Owner: esamyn_user
--

ALTER SEQUENCE esa_grupo_parametro_gpa_id_seq OWNED BY esa_grupo_parametro.gpa_id;


--
-- TOC entry 228 (class 1259 OID 16856)
-- Name: esa_parametro; Type: TABLE; Schema: esamyn; Owner: esamyn_user
--

CREATE TABLE esa_parametro (
    par_id bigint NOT NULL,
    par_grupo_parametro bigint,
    par_condicion_no_aplica bigint,
    par_puntaje integer,
    par_texto text,
    par_obligatorio integer DEFAULT 0 NOT NULL,
    par_umbral integer DEFAULT 100 NOT NULL,
    par_cantidad_minima integer DEFAULT 10 NOT NULL
);


ALTER TABLE esa_parametro OWNER TO esamyn_user;

--
-- TOC entry 229 (class 1259 OID 16865)
-- Name: esa_parametro_par_id_seq; Type: SEQUENCE; Schema: esamyn; Owner: esamyn_user
--

CREATE SEQUENCE esa_parametro_par_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE esa_parametro_par_id_seq OWNER TO esamyn_user;

--
-- TOC entry 3264 (class 0 OID 0)
-- Dependencies: 229
-- Name: esa_parametro_par_id_seq; Type: SEQUENCE OWNED BY; Schema: esamyn; Owner: esamyn_user
--

ALTER SEQUENCE esa_parametro_par_id_seq OWNED BY esa_parametro.par_id;


--
-- TOC entry 249 (class 1259 OID 17110)
-- Name: esa_parametro_pregunta; Type: TABLE; Schema: esamyn; Owner: esamyn_user
--

CREATE TABLE esa_parametro_pregunta (
    ppr_id bigint NOT NULL,
    ppr_creado timestamp with time zone DEFAULT now() NOT NULL,
    ppr_modificado timestamp with time zone DEFAULT now() NOT NULL,
    ppr_pregunta bigint NOT NULL,
    ppr_parametro bigint NOT NULL
);


ALTER TABLE esa_parametro_pregunta OWNER TO esamyn_user;

--
-- TOC entry 248 (class 1259 OID 17108)
-- Name: esa_parametro_pregunta_ppr_id_seq; Type: SEQUENCE; Schema: esamyn; Owner: esamyn_user
--

CREATE SEQUENCE esa_parametro_pregunta_ppr_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE esa_parametro_pregunta_ppr_id_seq OWNER TO esamyn_user;

--
-- TOC entry 3265 (class 0 OID 0)
-- Dependencies: 248
-- Name: esa_parametro_pregunta_ppr_id_seq; Type: SEQUENCE OWNED BY; Schema: esamyn; Owner: esamyn_user
--

ALTER SEQUENCE esa_parametro_pregunta_ppr_id_seq OWNED BY esa_parametro_pregunta.ppr_id;


--
-- TOC entry 230 (class 1259 OID 16867)
-- Name: esa_persona_juridica; Type: TABLE; Schema: esamyn; Owner: esamyn_user
--

CREATE TABLE esa_persona_juridica (
    pju_id bigint NOT NULL,
    pju_creado timestamp with time zone DEFAULT '2017-07-20 14:36:22.557893+00'::timestamp with time zone NOT NULL,
    pju_modificado timestamp with time zone DEFAULT '2017-07-20 14:36:22.557893+00'::timestamp with time zone NOT NULL,
    pju_razon_social text,
    pju_ruc text
);


ALTER TABLE esa_persona_juridica OWNER TO esamyn_user;

--
-- TOC entry 231 (class 1259 OID 16875)
-- Name: esa_persona_juridica_pju_id_seq; Type: SEQUENCE; Schema: esamyn; Owner: esamyn_user
--

CREATE SEQUENCE esa_persona_juridica_pju_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE esa_persona_juridica_pju_id_seq OWNER TO esamyn_user;

--
-- TOC entry 3266 (class 0 OID 0)
-- Dependencies: 231
-- Name: esa_persona_juridica_pju_id_seq; Type: SEQUENCE OWNED BY; Schema: esamyn; Owner: esamyn_user
--

ALTER SEQUENCE esa_persona_juridica_pju_id_seq OWNED BY esa_persona_juridica.pju_id;


--
-- TOC entry 232 (class 1259 OID 16877)
-- Name: esa_pregunta; Type: TABLE; Schema: esamyn; Owner: esamyn_user
--

CREATE TABLE esa_pregunta (
    prg_id bigint NOT NULL,
    prg_creado timestamp with time zone DEFAULT '2017-07-20 14:36:22.557893+00'::timestamp with time zone NOT NULL,
    prg_modificado timestamp with time zone DEFAULT '2017-07-20 14:36:22.557893+00'::timestamp with time zone NOT NULL,
    prg_padre bigint,
    prg_tipo_pregunta bigint,
    prg_formulario bigint,
    prg_texto text,
    prg_codigo_verificacion text,
    prg_ayuda text,
    prg_prefijo text,
    prg_subfijo text,
    prg_validacion text,
    prg_orden integer
);


ALTER TABLE esa_pregunta OWNER TO esamyn_user;

--
-- TOC entry 233 (class 1259 OID 16885)
-- Name: esa_pregunta_prg_id_seq; Type: SEQUENCE; Schema: esamyn; Owner: esamyn_user
--

CREATE SEQUENCE esa_pregunta_prg_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE esa_pregunta_prg_id_seq OWNER TO esamyn_user;

--
-- TOC entry 3267 (class 0 OID 0)
-- Dependencies: 233
-- Name: esa_pregunta_prg_id_seq; Type: SEQUENCE OWNED BY; Schema: esamyn; Owner: esamyn_user
--

ALTER SEQUENCE esa_pregunta_prg_id_seq OWNED BY esa_pregunta.prg_id;


--
-- TOC entry 234 (class 1259 OID 16887)
-- Name: esa_provincia; Type: TABLE; Schema: esamyn; Owner: esamyn_user
--

CREATE TABLE esa_provincia (
    pro_id bigint NOT NULL,
    pro_nombre text,
    pro_codigo text
);


ALTER TABLE esa_provincia OWNER TO esamyn_user;

--
-- TOC entry 235 (class 1259 OID 16893)
-- Name: esa_provincia_pro_id_seq; Type: SEQUENCE; Schema: esamyn; Owner: esamyn_user
--

CREATE SEQUENCE esa_provincia_pro_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE esa_provincia_pro_id_seq OWNER TO esamyn_user;

--
-- TOC entry 3268 (class 0 OID 0)
-- Dependencies: 235
-- Name: esa_provincia_pro_id_seq; Type: SEQUENCE OWNED BY; Schema: esamyn; Owner: esamyn_user
--

ALTER SEQUENCE esa_provincia_pro_id_seq OWNED BY esa_provincia.pro_id;


--
-- TOC entry 236 (class 1259 OID 16895)
-- Name: esa_respuesta; Type: TABLE; Schema: esamyn; Owner: esamyn_user
--

CREATE TABLE esa_respuesta (
    res_id bigint NOT NULL,
    res_creado timestamp with time zone DEFAULT '2017-07-20 14:36:22.557893+00'::timestamp with time zone NOT NULL,
    res_modificado timestamp with time zone DEFAULT '2017-07-20 14:36:22.557893+00'::timestamp with time zone NOT NULL,
    res_creado_por text,
    res_modificado_por text,
    res_pregunta bigint,
    res_encuesta bigint,
    res_valor_numero numeric,
    res_valor_texto text,
    res_valor_fecha timestamp with time zone,
    res_valor_booleano boolean
);


ALTER TABLE esa_respuesta OWNER TO esamyn_user;

--
-- TOC entry 237 (class 1259 OID 16903)
-- Name: esa_respuesta_res_id_seq; Type: SEQUENCE; Schema: esamyn; Owner: esamyn_user
--

CREATE SEQUENCE esa_respuesta_res_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE esa_respuesta_res_id_seq OWNER TO esamyn_user;

--
-- TOC entry 3269 (class 0 OID 0)
-- Dependencies: 237
-- Name: esa_respuesta_res_id_seq; Type: SEQUENCE OWNED BY; Schema: esamyn; Owner: esamyn_user
--

ALTER SEQUENCE esa_respuesta_res_id_seq OWNED BY esa_respuesta.res_id;


--
-- TOC entry 238 (class 1259 OID 16905)
-- Name: esa_rol; Type: TABLE; Schema: esamyn; Owner: esamyn_user
--

CREATE TABLE esa_rol (
    rol_id bigint NOT NULL,
    rol_nombre text
);


ALTER TABLE esa_rol OWNER TO esamyn_user;

--
-- TOC entry 239 (class 1259 OID 16911)
-- Name: esa_rol_rol_id_seq; Type: SEQUENCE; Schema: esamyn; Owner: esamyn_user
--

CREATE SEQUENCE esa_rol_rol_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE esa_rol_rol_id_seq OWNER TO esamyn_user;

--
-- TOC entry 3270 (class 0 OID 0)
-- Dependencies: 239
-- Name: esa_rol_rol_id_seq; Type: SEQUENCE OWNED BY; Schema: esamyn; Owner: esamyn_user
--

ALTER SEQUENCE esa_rol_rol_id_seq OWNED BY esa_rol.rol_id;


--
-- TOC entry 240 (class 1259 OID 16913)
-- Name: esa_tipo_grupo_parametro; Type: TABLE; Schema: esamyn; Owner: esamyn_user
--

CREATE TABLE esa_tipo_grupo_parametro (
    tgp_id bigint NOT NULL,
    tgp_texto text
);


ALTER TABLE esa_tipo_grupo_parametro OWNER TO esamyn_user;

--
-- TOC entry 241 (class 1259 OID 16919)
-- Name: esa_tipo_grupo_parametro_tgp_id_seq; Type: SEQUENCE; Schema: esamyn; Owner: esamyn_user
--

CREATE SEQUENCE esa_tipo_grupo_parametro_tgp_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE esa_tipo_grupo_parametro_tgp_id_seq OWNER TO esamyn_user;

--
-- TOC entry 3271 (class 0 OID 0)
-- Dependencies: 241
-- Name: esa_tipo_grupo_parametro_tgp_id_seq; Type: SEQUENCE OWNED BY; Schema: esamyn; Owner: esamyn_user
--

ALTER SEQUENCE esa_tipo_grupo_parametro_tgp_id_seq OWNED BY esa_tipo_grupo_parametro.tgp_id;


--
-- TOC entry 242 (class 1259 OID 16922)
-- Name: esa_tipo_pregunta; Type: TABLE; Schema: esamyn; Owner: esamyn_user
--

CREATE TABLE esa_tipo_pregunta (
    tpp_id bigint NOT NULL,
    tpp_clave text,
    tpp_etiqueta text
);


ALTER TABLE esa_tipo_pregunta OWNER TO esamyn_user;

--
-- TOC entry 243 (class 1259 OID 16928)
-- Name: esa_tipo_pregunta_tpp_id_seq; Type: SEQUENCE; Schema: esamyn; Owner: esamyn_user
--

CREATE SEQUENCE esa_tipo_pregunta_tpp_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE esa_tipo_pregunta_tpp_id_seq OWNER TO esamyn_user;

--
-- TOC entry 3272 (class 0 OID 0)
-- Dependencies: 243
-- Name: esa_tipo_pregunta_tpp_id_seq; Type: SEQUENCE OWNED BY; Schema: esamyn; Owner: esamyn_user
--

ALTER SEQUENCE esa_tipo_pregunta_tpp_id_seq OWNED BY esa_tipo_pregunta.tpp_id;


--
-- TOC entry 244 (class 1259 OID 16930)
-- Name: esa_usuario; Type: TABLE; Schema: esamyn; Owner: esamyn_user
--

CREATE TABLE esa_usuario (
    usu_id bigint NOT NULL,
    usu_creado timestamp with time zone DEFAULT '2017-07-20 14:36:22.557893+00'::timestamp with time zone NOT NULL,
    usu_modificado timestamp with time zone DEFAULT '2017-07-20 14:36:22.557893+00'::timestamp with time zone NOT NULL,
    usu_rol bigint,
    usu_nombres text,
    usu_apellidos text,
    usu_username text,
    usu_password text,
    usu_bloqueado integer DEFAULT 0 NOT NULL,
    usu_cedula text,
    usu_telefono text,
    usu_correo_eletronico text,
    usu_fecha_ingreso timestamp with time zone DEFAULT now() NOT NULL,
    usu_sesion text
);


ALTER TABLE esa_usuario OWNER TO esamyn_user;

--
-- TOC entry 245 (class 1259 OID 16939)
-- Name: esa_usuario_usu_id_seq; Type: SEQUENCE; Schema: esamyn; Owner: esamyn_user
--

CREATE SEQUENCE esa_usuario_usu_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE esa_usuario_usu_id_seq OWNER TO esamyn_user;

--
-- TOC entry 3273 (class 0 OID 0)
-- Dependencies: 245
-- Name: esa_usuario_usu_id_seq; Type: SEQUENCE OWNED BY; Schema: esamyn; Owner: esamyn_user
--

ALTER SEQUENCE esa_usuario_usu_id_seq OWNED BY esa_usuario.usu_id;


--
-- TOC entry 246 (class 1259 OID 16941)
-- Name: esa_verificador; Type: TABLE; Schema: esamyn; Owner: esamyn_user
--

CREATE TABLE esa_verificador (
    ver_id bigint NOT NULL,
    ver_creado timestamp with time zone DEFAULT '2017-07-20 14:36:22.557893+00'::timestamp with time zone NOT NULL,
    ver_modificado timestamp with time zone DEFAULT '2017-07-20 14:36:22.557893+00'::timestamp with time zone NOT NULL,
    ver_evaluacion bigint,
    ver_parametro bigint,
    ver_cumple integer DEFAULT 0 NOT NULL,
    ver_no_aplica integer DEFAULT 0 NOT NULL,
    ver_cantidad_medidas integer DEFAULT 0 NOT NULL,
    ver_cumple_condicion_no_aplica bigint
);


ALTER TABLE esa_verificador OWNER TO esamyn_user;

--
-- TOC entry 247 (class 1259 OID 16949)
-- Name: esa_verificador_ver_id_seq; Type: SEQUENCE; Schema: esamyn; Owner: esamyn_user
--

CREATE SEQUENCE esa_verificador_ver_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE esa_verificador_ver_id_seq OWNER TO esamyn_user;

--
-- TOC entry 3274 (class 0 OID 0)
-- Dependencies: 247
-- Name: esa_verificador_ver_id_seq; Type: SEQUENCE OWNED BY; Schema: esamyn; Owner: esamyn_user
--

ALTER SEQUENCE esa_verificador_ver_id_seq OWNED BY esa_verificador.ver_id;


--
-- TOC entry 2976 (class 2604 OID 16951)
-- Name: can_id; Type: DEFAULT; Schema: esamyn; Owner: esamyn_user
--

ALTER TABLE ONLY esa_canton ALTER COLUMN can_id SET DEFAULT nextval('esa_canton_can_id_seq'::regclass);


--
-- TOC entry 3030 (class 2604 OID 17509)
-- Name: cat_id; Type: DEFAULT; Schema: esamyn; Owner: esamyn_user
--

ALTER TABLE ONLY esa_catalogo ALTER COLUMN cat_id SET DEFAULT nextval('esa_catalogo_cat_id_seq'::regclass);


--
-- TOC entry 2977 (class 2604 OID 16952)
-- Name: cna_id; Type: DEFAULT; Schema: esamyn; Owner: esamyn_user
--

ALTER TABLE ONLY esa_condicion_no_aplica ALTER COLUMN cna_id SET DEFAULT nextval('esa_condicion_con_id_seq'::regclass);


--
-- TOC entry 3029 (class 2604 OID 17214)
-- Name: ccn_id; Type: DEFAULT; Schema: esamyn; Owner: esamyn_user
--

ALTER TABLE ONLY esa_cumple_condicion_no_aplica ALTER COLUMN ccn_id SET DEFAULT nextval('esa_cumple_condicion_na_ccn_id_seq'::regclass);


--
-- TOC entry 2982 (class 2604 OID 16953)
-- Name: enc_id; Type: DEFAULT; Schema: esamyn; Owner: esamyn_user
--

ALTER TABLE ONLY esa_encuesta ALTER COLUMN enc_id SET DEFAULT nextval('esa_encuesta_enc_id_seq'::regclass);


--
-- TOC entry 2985 (class 2604 OID 16954)
-- Name: ess_id; Type: DEFAULT; Schema: esamyn; Owner: esamyn_user
--

ALTER TABLE ONLY esa_establecimiento_salud ALTER COLUMN ess_id SET DEFAULT nextval('esa_establecimiento_salud_ess_id_seq'::regclass);


--
-- TOC entry 2990 (class 2604 OID 16955)
-- Name: eva_id; Type: DEFAULT; Schema: esamyn; Owner: esamyn_user
--

ALTER TABLE ONLY esa_evaluacion ALTER COLUMN eva_id SET DEFAULT nextval('esa_evaluacion_eva_id_seq'::regclass);


--
-- TOC entry 2993 (class 2604 OID 16956)
-- Name: frm_id; Type: DEFAULT; Schema: esamyn; Owner: esamyn_user
--

ALTER TABLE ONLY esa_formulario ALTER COLUMN frm_id SET DEFAULT nextval('esa_formulario_frm_id_seq'::regclass);


--
-- TOC entry 2994 (class 2604 OID 16957)
-- Name: gpa_id; Type: DEFAULT; Schema: esamyn; Owner: esamyn_user
--

ALTER TABLE ONLY esa_grupo_parametro ALTER COLUMN gpa_id SET DEFAULT nextval('esa_grupo_parametro_gpa_id_seq'::regclass);


--
-- TOC entry 2998 (class 2604 OID 16958)
-- Name: par_id; Type: DEFAULT; Schema: esamyn; Owner: esamyn_user
--

ALTER TABLE ONLY esa_parametro ALTER COLUMN par_id SET DEFAULT nextval('esa_parametro_par_id_seq'::regclass);


--
-- TOC entry 3025 (class 2604 OID 17229)
-- Name: ppr_id; Type: DEFAULT; Schema: esamyn; Owner: esamyn_user
--

ALTER TABLE ONLY esa_parametro_pregunta ALTER COLUMN ppr_id SET DEFAULT nextval('esa_parametro_pregunta_ppr_id_seq'::regclass);


--
-- TOC entry 3001 (class 2604 OID 16959)
-- Name: pju_id; Type: DEFAULT; Schema: esamyn; Owner: esamyn_user
--

ALTER TABLE ONLY esa_persona_juridica ALTER COLUMN pju_id SET DEFAULT nextval('esa_persona_juridica_pju_id_seq'::regclass);


--
-- TOC entry 3004 (class 2604 OID 16960)
-- Name: prg_id; Type: DEFAULT; Schema: esamyn; Owner: esamyn_user
--

ALTER TABLE ONLY esa_pregunta ALTER COLUMN prg_id SET DEFAULT nextval('esa_pregunta_prg_id_seq'::regclass);


--
-- TOC entry 3005 (class 2604 OID 16961)
-- Name: pro_id; Type: DEFAULT; Schema: esamyn; Owner: esamyn_user
--

ALTER TABLE ONLY esa_provincia ALTER COLUMN pro_id SET DEFAULT nextval('esa_provincia_pro_id_seq'::regclass);


--
-- TOC entry 3008 (class 2604 OID 16962)
-- Name: res_id; Type: DEFAULT; Schema: esamyn; Owner: esamyn_user
--

ALTER TABLE ONLY esa_respuesta ALTER COLUMN res_id SET DEFAULT nextval('esa_respuesta_res_id_seq'::regclass);


--
-- TOC entry 3009 (class 2604 OID 16963)
-- Name: rol_id; Type: DEFAULT; Schema: esamyn; Owner: esamyn_user
--

ALTER TABLE ONLY esa_rol ALTER COLUMN rol_id SET DEFAULT nextval('esa_rol_rol_id_seq'::regclass);


--
-- TOC entry 3010 (class 2604 OID 16964)
-- Name: tgp_id; Type: DEFAULT; Schema: esamyn; Owner: esamyn_user
--

ALTER TABLE ONLY esa_tipo_grupo_parametro ALTER COLUMN tgp_id SET DEFAULT nextval('esa_tipo_grupo_parametro_tgp_id_seq'::regclass);


--
-- TOC entry 3011 (class 2604 OID 16965)
-- Name: tpp_id; Type: DEFAULT; Schema: esamyn; Owner: esamyn_user
--

ALTER TABLE ONLY esa_tipo_pregunta ALTER COLUMN tpp_id SET DEFAULT nextval('esa_tipo_pregunta_tpp_id_seq'::regclass);


--
-- TOC entry 3015 (class 2604 OID 16966)
-- Name: usu_id; Type: DEFAULT; Schema: esamyn; Owner: esamyn_user
--

ALTER TABLE ONLY esa_usuario ALTER COLUMN usu_id SET DEFAULT nextval('esa_usuario_usu_id_seq'::regclass);


--
-- TOC entry 3022 (class 2604 OID 16967)
-- Name: ver_id; Type: DEFAULT; Schema: esamyn; Owner: esamyn_user
--

ALTER TABLE ONLY esa_verificador ALTER COLUMN ver_id SET DEFAULT nextval('esa_verificador_ver_id_seq'::regclass);


--
-- TOC entry 3211 (class 0 OID 16788)
-- Dependencies: 214
-- Data for Name: esa_canton; Type: TABLE DATA; Schema: esamyn; Owner: esamyn_user
--

COPY esa_canton (can_id, can_provincia, can_nombre, can_codigo) FROM stdin;
\.


--
-- TOC entry 3275 (class 0 OID 0)
-- Dependencies: 215
-- Name: esa_canton_can_id_seq; Type: SEQUENCE SET; Schema: esamyn; Owner: esamyn_user
--

SELECT pg_catalog.setval('esa_canton_can_id_seq', 1, false);


--
-- TOC entry 3250 (class 0 OID 17506)
-- Dependencies: 253
-- Data for Name: esa_catalogo; Type: TABLE DATA; Schema: esamyn; Owner: esamyn_user
--

COPY esa_catalogo (cat_id, cat_creado, cat_modificado, cat_codigo, cat_valor) FROM stdin;
\.


--
-- TOC entry 3276 (class 0 OID 0)
-- Dependencies: 252
-- Name: esa_catalogo_cat_id_seq; Type: SEQUENCE SET; Schema: esamyn; Owner: esamyn_user
--

SELECT pg_catalog.setval('esa_catalogo_cat_id_seq', 1, false);


--
-- TOC entry 3277 (class 0 OID 0)
-- Dependencies: 217
-- Name: esa_condicion_con_id_seq; Type: SEQUENCE SET; Schema: esamyn; Owner: esamyn_user
--

SELECT pg_catalog.setval('esa_condicion_con_id_seq', 1, false);


--
-- TOC entry 3213 (class 0 OID 16796)
-- Dependencies: 216
-- Data for Name: esa_condicion_no_aplica; Type: TABLE DATA; Schema: esamyn; Owner: esamyn_user
--

COPY esa_condicion_no_aplica (cna_id, cna_texto) FROM stdin;
\.


--
-- TOC entry 3278 (class 0 OID 0)
-- Dependencies: 250
-- Name: esa_cumple_condicion_na_ccn_id_seq; Type: SEQUENCE SET; Schema: esamyn; Owner: esamyn_user
--

SELECT pg_catalog.setval('esa_cumple_condicion_na_ccn_id_seq', 1, false);


--
-- TOC entry 3248 (class 0 OID 17136)
-- Dependencies: 251
-- Data for Name: esa_cumple_condicion_no_aplica; Type: TABLE DATA; Schema: esamyn; Owner: esamyn_user
--

COPY esa_cumple_condicion_no_aplica (ccn_id, ccn_creado, ccn_modificado, ccn_evaluacion, ccn_condicion_no_aplica, ccn_cumple) FROM stdin;
\.


--
-- TOC entry 3215 (class 0 OID 16804)
-- Dependencies: 218
-- Data for Name: esa_encuesta; Type: TABLE DATA; Schema: esamyn; Owner: esamyn_user
--

COPY esa_encuesta (enc_id, enc_creado, enc_modificado, enc_creado_por, enc_modificado_por, enc_formulario, enc_usuario, enc_evaluacion, enc_finalizada, enc_fecha_inicial, enc_fecha_final, enc_establecimiento_salud, enc_responsable, enc_cargo, enc_extra) FROM stdin;
9	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	1	\N	\N	0	2017-07-20 14:36:22.557893+00	\N	\N	\N	\N	\N
10	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	1	\N	\N	0	2017-07-20 14:36:22.557893+00	\N	\N	\N	\N	\N
12	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	2	\N	\N	0	2017-07-20 14:36:22.557893+00	\N	\N	\N	\N	\N
13	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	3	\N	\N	0	2017-07-20 14:36:22.557893+00	\N	\N	\N	\N	\N
11	2017-07-20 14:36:22.557893+00	2017-08-21 20:16:34.448096+00	\N	\N	2	\N	\N	0	2017-07-20 14:36:22.557893+00	2017-08-21 20:16:34.448096	\N	\N	\N	\N
14	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	4	\N	\N	0	2017-07-20 14:36:22.557893+00	\N	\N	\N	\N	\N
16	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6	\N	\N	0	2017-07-20 14:36:22.557893+00	\N	\N	\N	\N	\N
17	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7	\N	\N	0	2017-07-20 14:36:22.557893+00	\N	\N	\N	\N	\N
20	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:17.082761+00	\N	\N	7	\N	\N	0	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:17.082761	\N	\N	\N	\N
18	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:36.999944+00	\N	\N	7	\N	\N	0	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:36.999944	\N	\N	\N	\N
19	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:47.916275+00	\N	\N	7	\N	\N	0	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:47.916275	\N	\N	\N	\N
21	2017-07-20 14:36:22.557893+00	2017-08-21 20:19:17.965572+00	\N	\N	7	\N	\N	0	2017-07-20 14:36:22.557893+00	2017-08-21 20:19:17.965572	\N	\N	\N	\N
22	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6	\N	\N	0	2017-07-20 14:36:22.557893+00	\N	\N	\N	\N	\N
15	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.741737+00	\N	\N	5	\N	\N	0	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.741737	\N	\N	\N	\N
23	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:19.168363+00	\N	\N	6	\N	\N	0	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:19.168363	\N	\N	\N	\N
24	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:31.133914+00	\N	\N	6	\N	\N	0	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:31.133914	\N	\N	\N	\N
\.


--
-- TOC entry 3279 (class 0 OID 0)
-- Dependencies: 219
-- Name: esa_encuesta_enc_id_seq; Type: SEQUENCE SET; Schema: esamyn; Owner: esamyn_user
--

SELECT pg_catalog.setval('esa_encuesta_enc_id_seq', 24, true);


--
-- TOC entry 3217 (class 0 OID 16816)
-- Dependencies: 220
-- Data for Name: esa_establecimiento_salud; Type: TABLE DATA; Schema: esamyn; Owner: esamyn_user
--

COPY esa_establecimiento_salud (ess_id, ess_creado, ess_modificado, ess_canton, ess_persona_juridica, ess_nombre, ess_unicodigo, ess_direccion, ess_latitud, ess_longitud, ess_telefono, ess_correo_electronico, ess_nombre_responsable, ess_zona, ess_distrito) FROM stdin;
\.


--
-- TOC entry 3280 (class 0 OID 0)
-- Dependencies: 221
-- Name: esa_establecimiento_salud_ess_id_seq; Type: SEQUENCE SET; Schema: esamyn; Owner: esamyn_user
--

SELECT pg_catalog.setval('esa_establecimiento_salud_ess_id_seq', 1, false);


--
-- TOC entry 3219 (class 0 OID 16826)
-- Dependencies: 222
-- Data for Name: esa_evaluacion; Type: TABLE DATA; Schema: esamyn; Owner: esamyn_user
--

COPY esa_evaluacion (eva_id, eva_creado, eva_modificado, eva_creado_por, eva_modificado_por, eva_usuario, eva_establecimiento_salud, eva_numero, eva_calificacion, eva_fecha_inicio, eva_fecha_calificacion, eva_cantidad_encuestas) FROM stdin;
\.


--
-- TOC entry 3281 (class 0 OID 0)
-- Dependencies: 223
-- Name: esa_evaluacion_eva_id_seq; Type: SEQUENCE SET; Schema: esamyn; Owner: esamyn_user
--

SELECT pg_catalog.setval('esa_evaluacion_eva_id_seq', 1, false);


--
-- TOC entry 3221 (class 0 OID 16838)
-- Dependencies: 224
-- Data for Name: esa_formulario; Type: TABLE DATA; Schema: esamyn; Owner: esamyn_user
--

COPY esa_formulario (frm_id, frm_creado, frm_modificado, frm_nombre, frm_titulo, frm_subtitulo, frm_ayuda, frm_clave) FROM stdin;
2	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	Formulario de Observación	Formulario de Observación	\N	\N	2
1	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	Formulario de Información del Establecimiento	Formulario de Información del Establecimiento	\N	\N	1
4	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	Formulario de Encuesta para Madres Puérperas	Formulario de Encuesta para Madres Puérperas	\N	\N	4
3	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	Formulario de Encuesta para Madres Gestantes	Formulario de Encuesta para Madres Gestantes	\N	\N	3
6	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	Formulario de Encuesta para Personal de Salud sin contacto directo con madres	Formulario de Encuesta para Personal de Salud sin contacto directo con madres	\N	\N	5b
5	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	Formulario de Encuesta para Personal de Salud en Contacto con la Madre	Formulario de Encuesta para Personal de Salud en Contacto con la Madre	\N	\N	5a
8	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	Formulario de Evaluación	Formulario de Evaluación	\N	\N	eva
7	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	Formulario de Revisión de Historias Clínicas	Formulario de Revisión de Historias Clínicas	\N	\N	6
\.


--
-- TOC entry 3282 (class 0 OID 0)
-- Dependencies: 225
-- Name: esa_formulario_frm_id_seq; Type: SEQUENCE SET; Schema: esamyn; Owner: esamyn_user
--

SELECT pg_catalog.setval('esa_formulario_frm_id_seq', 7, true);


--
-- TOC entry 3223 (class 0 OID 16848)
-- Dependencies: 226
-- Data for Name: esa_grupo_parametro; Type: TABLE DATA; Schema: esamyn; Owner: esamyn_user
--

COPY esa_grupo_parametro (gpa_id, gpa_padre, gpa_tipo_grupo_parametro, gpa_texto, gpa_clave) FROM stdin;
\.


--
-- TOC entry 3283 (class 0 OID 0)
-- Dependencies: 227
-- Name: esa_grupo_parametro_gpa_id_seq; Type: SEQUENCE SET; Schema: esamyn; Owner: esamyn_user
--

SELECT pg_catalog.setval('esa_grupo_parametro_gpa_id_seq', 1, false);


--
-- TOC entry 3225 (class 0 OID 16856)
-- Dependencies: 228
-- Data for Name: esa_parametro; Type: TABLE DATA; Schema: esamyn; Owner: esamyn_user
--

COPY esa_parametro (par_id, par_grupo_parametro, par_condicion_no_aplica, par_puntaje, par_texto, par_obligatorio, par_umbral, par_cantidad_minima) FROM stdin;
\.


--
-- TOC entry 3284 (class 0 OID 0)
-- Dependencies: 229
-- Name: esa_parametro_par_id_seq; Type: SEQUENCE SET; Schema: esamyn; Owner: esamyn_user
--

SELECT pg_catalog.setval('esa_parametro_par_id_seq', 1, false);


--
-- TOC entry 3246 (class 0 OID 17110)
-- Dependencies: 249
-- Data for Name: esa_parametro_pregunta; Type: TABLE DATA; Schema: esamyn; Owner: esamyn_user
--

COPY esa_parametro_pregunta (ppr_id, ppr_creado, ppr_modificado, ppr_pregunta, ppr_parametro) FROM stdin;
\.


--
-- TOC entry 3285 (class 0 OID 0)
-- Dependencies: 248
-- Name: esa_parametro_pregunta_ppr_id_seq; Type: SEQUENCE SET; Schema: esamyn; Owner: esamyn_user
--

SELECT pg_catalog.setval('esa_parametro_pregunta_ppr_id_seq', 1, false);


--
-- TOC entry 3227 (class 0 OID 16867)
-- Dependencies: 230
-- Data for Name: esa_persona_juridica; Type: TABLE DATA; Schema: esamyn; Owner: esamyn_user
--

COPY esa_persona_juridica (pju_id, pju_creado, pju_modificado, pju_razon_social, pju_ruc) FROM stdin;
\.


--
-- TOC entry 3286 (class 0 OID 0)
-- Dependencies: 231
-- Name: esa_persona_juridica_pju_id_seq; Type: SEQUENCE SET; Schema: esamyn; Owner: esamyn_user
--

SELECT pg_catalog.setval('esa_persona_juridica_pju_id_seq', 1, false);


--
-- TOC entry 3229 (class 0 OID 16877)
-- Dependencies: 232
-- Data for Name: esa_pregunta; Type: TABLE DATA; Schema: esamyn; Owner: esamyn_user
--

COPY esa_pregunta (prg_id, prg_creado, prg_modificado, prg_padre, prg_tipo_pregunta, prg_formulario, prg_texto, prg_codigo_verificacion, prg_ayuda, prg_prefijo, prg_subfijo, prg_validacion, prg_orden) FROM stdin;
2090	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	8	Datos del Establecimiento de Salud	\N	\N	\N	\N	\N	100
2091	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2090	\N	8	1	\N	\N	\N	\N	\N	100
2092	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2091	\N	8	principal	\N	\N	\N	\N	\N	100
2093	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2092	\N	8	INSTITUCIONES DEL SISTEMA DE SALUD  	\N	\N	\N	\N	\N	100
2094	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2093	\N	8	MSP	\N	\N	\N	\N	\N	100
2095	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2094	\N	8	Sí	\N	\N	\N	\N	\N	100
2096	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2094	\N	8	No	\N	\N	\N	\N	\N	200
2097	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2093	\N	8	IESS	\N	\N	\N	\N	\N	200
2098	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2097	\N	8	Sí	\N	\N	\N	\N	\N	100
2099	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2097	\N	8	No	\N	\N	\N	\N	\N	200
2100	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2093	\N	8	ISSFA	\N	\N	\N	\N	\N	300
2101	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2100	\N	8	Sí	\N	\N	\N	\N	\N	100
2102	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2100	\N	8	No	\N	\N	\N	\N	\N	200
2103	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2093	\N	8	ISPOL	\N	\N	\N	\N	\N	400
2104	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2103	\N	8	Sí	\N	\N	\N	\N	\N	100
2105	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2103	\N	8	No	\N	\N	\N	\N	\N	200
2106	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2093	\N	8	Establecimientos de salud Privados 	\N	\N	\N	\N	\N	500
2107	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2106	\N	8	Sí	\N	\N	\N	\N	\N	100
2108	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2106	\N	8	No	\N	\N	\N	\N	\N	200
2109	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2093	\N	8	Otros	\N	\N	\N	\N	\N	600
2110	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2109	\N	8	Sí	\N	\N	\N	\N	\N	100
2111	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2109	\N	8	No	\N	\N	\N	\N	\N	200
2112	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2091	\N	8	secundario	\N	\N	\N	\N	\N	200
2113	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2112	\N	8	Tipo de establecimientos del MSP 	\N	\N	\N	\N	\N	100
2114	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2113	\N	8	7.   Establecimiento de Salud Tipo C –Materno Infantil.  	\N	\N	\N	\N	\N	100
2115	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2114	\N	8	Sí	\N	\N	\N	\N	\N	100
2116	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2114	\N	8	No	\N	\N	\N	\N	\N	200
2117	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2113	\N	8	11. Hospital Básico 	\N	\N	\N	\N	\N	200
2118	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2117	\N	8	Sí	\N	\N	\N	\N	\N	100
2119	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2117	\N	8	No	\N	\N	\N	\N	\N	200
2120	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2113	\N	8	12. Hospital General 	\N	\N	\N	\N	\N	300
2121	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2120	\N	8	Sí	\N	\N	\N	\N	\N	100
2122	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2120	\N	8	No	\N	\N	\N	\N	\N	200
2123	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2113	\N	8	13. Hospital  Especializado en Gineco-Obstetricia  	\N	\N	\N	\N	\N	400
2124	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2123	\N	8	Sí	\N	\N	\N	\N	\N	100
2125	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2123	\N	8	No	\N	\N	\N	\N	\N	200
2126	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2112	\N	8	Nivel de complejidad   	\N	\N	\N	\N	\N	200
2127	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2090	\N	8	2	\N	\N	\N	\N	\N	200
2128	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2127	\N	8	principal	\N	\N	\N	\N	\N	100
2129	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2128	\N	8	Número total de personal administrativo que trabaja en el ES:  	\N	\N	\N	\N	\N	100
2130	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2128	\N	8	Número total de personal  de salud que trabaja en el ES:  	\N	\N	\N	\N	\N	200
2131	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2127	\N	8	secundario	\N	\N	\N	\N	\N	200
2132	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2131	\N	8	Número total de camas en el ES	\N	\N	\N	\N	\N	100
2133	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2131	\N	8	Número de camas para gineco-obstetricia	\N	\N	\N	\N	\N	200
2134	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2131	\N	8	Número de puestos de recuperación post parto inmediato	\N	\N	\N	\N	\N	300
2135	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2131	\N	8	Número de camillas de recuperación	\N	\N	\N	\N	\N	400
2136	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2131	\N	8	Número de Unidades de Trabajo de Parto y Recuperación (UTPR)	\N	\N	\N	\N	\N	500
2137	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2131	\N	8	Número de salas de parto	\N	\N	\N	\N	\N	600
2138	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2131	\N	8	Número de quirófanos destinados a cesáreas	\N	\N	\N	\N	\N	700
2139	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2090	\N	8	3	\N	\N	\N	\N	\N	300
2140	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2139	\N	8	principal	\N	\N	\N	\N	\N	100
2141	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2140	\N	8	Nombre y apellido del responsable de la internación gineco-obstétrica, centro obstétrico o sala de parto:  	\N	\N	\N	\N	\N	100
2142	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2141	\N	8	nombres	\N	\N	\N	\N	\N	100
2143	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2141	\N	8	apellidos	\N	\N	\N	\N	\N	200
2144	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2139	\N	8	secundario	\N	\N	\N	\N	\N	200
2145	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2144	\N	8	Título profesional	\N	\N	\N	\N	\N	100
2146	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2144	\N	8	Teléfono y/o extensión	\N	\N	\N	\N	\N	200
2147	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2144	\N	8	Correo electrónico	\N	\N	\N	\N	\N	300
2148	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2090	\N	8	4	\N	\N	\N	\N	\N	400
2149	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2148	\N	8	¿Tiene el establecimiento servicio de neonatología? 	\N	\N	\N	\N	\N	100
2150	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2149	\N	8	Si	\N	\N	\N	\N	\N	100
2151	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2150	\N	8	Promedio de ingreso diario	\N	\N	\N	\N	\N	100
2152	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2150	\N	8	Número de cunas/ camas totales para el servicio	\N	\N	\N	\N	\N	200
2153	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2150	\N	8	Nombre del jefe o responsable del servicio	\N	\N	\N	\N	\N	300
2154	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2150	\N	8	Tiene cuidados del recién nacido	\N	\N	\N	\N	\N	400
2155	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2154	\N	8	Inmediatos	\N	\N	\N	\N	\N	100
2156	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2155	\N	8	Sí	\N	\N	\N	\N	\N	100
2157	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2156	\N	8	Número de cunas	\N	\N	\N	\N	\N	100
2158	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2155	\N	8	No	\N	\N	\N	\N	\N	200
2159	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2154	\N	8	Básicos	\N	\N	\N	\N	\N	200
2160	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2159	\N	8	Sí	\N	\N	\N	\N	\N	100
2161	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2160	\N	8	Número de cunas	\N	\N	\N	\N	\N	100
2162	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2159	\N	8	No	\N	\N	\N	\N	\N	200
2163	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2154	\N	8	Intermedios	\N	\N	\N	\N	\N	300
2164	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2163	\N	8	Sí	\N	\N	\N	\N	\N	100
2165	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2164	\N	8	Número de cunas	\N	\N	\N	\N	\N	100
2166	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2163	\N	8	No	\N	\N	\N	\N	\N	200
2167	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2154	\N	8	Intensivos	\N	\N	\N	\N	\N	400
2168	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2167	\N	8	Sí	\N	\N	\N	\N	\N	100
2169	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2168	\N	8	Número de cunas	\N	\N	\N	\N	\N	100
2170	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2167	\N	8	No	\N	\N	\N	\N	\N	200
2171	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2149	\N	8	No	\N	\N	\N	\N	\N	200
2172	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2090	\N	8	5	\N	\N	\N	\N	\N	500
2173	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2172	\N	8	El siguiente personal de salud tiene responsabilidad directa para atender a madres con temas de: lactancia materna (LM), alimentación con sucedáneos de la leche materna (SLM), brindar consejería en VIH y alimentación infantil (VIH), educación prenatal (EP)	\N	\N	\N	\N	\N	100
2174	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2173	\N	8	PROFESIONAL	\N	\N	\N	\N	\N	100
2175	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2174	\N	8	Enfermera/o 	\N	\N	\N	\N	\N	100
2176	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2175	\N	8	LM	\N	\N	\N	\N	\N	100
2177	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2176	\N	8	Sí	\N	\N	\N	\N	\N	100
2178	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2176	\N	8	No	\N	\N	\N	\N	\N	200
2179	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2175	\N	8	SLM	\N	\N	\N	\N	\N	200
2180	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2179	\N	8	Sí	\N	\N	\N	\N	\N	100
2181	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2179	\N	8	No	\N	\N	\N	\N	\N	200
2182	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2175	\N	8	VIH	\N	\N	\N	\N	\N	300
2183	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2182	\N	8	Sí	\N	\N	\N	\N	\N	100
2184	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2182	\N	8	No	\N	\N	\N	\N	\N	200
2185	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2175	\N	8	EP	\N	\N	\N	\N	\N	400
2186	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2185	\N	8	Sí	\N	\N	\N	\N	\N	100
2187	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2185	\N	8	No	\N	\N	\N	\N	\N	200
2188	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2174	\N	8	Especialista en gineco-obstetricia	\N	\N	\N	\N	\N	200
2189	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2188	\N	8	LM	\N	\N	\N	\N	\N	100
2190	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2189	\N	8	Sí	\N	\N	\N	\N	\N	100
2191	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2189	\N	8	No	\N	\N	\N	\N	\N	200
2192	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2188	\N	8	SLM	\N	\N	\N	\N	\N	200
2193	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2192	\N	8	Sí	\N	\N	\N	\N	\N	100
2194	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2192	\N	8	No	\N	\N	\N	\N	\N	200
2195	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2188	\N	8	VIH	\N	\N	\N	\N	\N	300
2196	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2195	\N	8	Sí	\N	\N	\N	\N	\N	100
2197	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2195	\N	8	No	\N	\N	\N	\N	\N	200
2198	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2188	\N	8	EP	\N	\N	\N	\N	\N	400
2199	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2198	\N	8	Sí	\N	\N	\N	\N	\N	100
2200	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2198	\N	8	No	\N	\N	\N	\N	\N	200
2201	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2174	\N	8	Obstetras - obstetrices	\N	\N	\N	\N	\N	300
2202	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2201	\N	8	LM	\N	\N	\N	\N	\N	100
2203	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2202	\N	8	Sí	\N	\N	\N	\N	\N	100
2204	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2202	\N	8	No	\N	\N	\N	\N	\N	200
2205	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2201	\N	8	SLM	\N	\N	\N	\N	\N	200
2206	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2205	\N	8	Sí	\N	\N	\N	\N	\N	100
2207	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2205	\N	8	No	\N	\N	\N	\N	\N	200
2208	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2201	\N	8	VIH	\N	\N	\N	\N	\N	300
2209	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2208	\N	8	Sí	\N	\N	\N	\N	\N	100
2210	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2208	\N	8	No	\N	\N	\N	\N	\N	200
2211	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2201	\N	8	EP	\N	\N	\N	\N	\N	400
2212	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2211	\N	8	Sí	\N	\N	\N	\N	\N	100
2213	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2211	\N	8	No	\N	\N	\N	\N	\N	200
2214	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2174	\N	8	Enfermeras neonatología	\N	\N	\N	\N	\N	400
2215	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2214	\N	8	LM	\N	\N	\N	\N	\N	100
2216	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2215	\N	8	Sí	\N	\N	\N	\N	\N	100
2217	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2215	\N	8	No	\N	\N	\N	\N	\N	200
2218	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2214	\N	8	SLM	\N	\N	\N	\N	\N	200
2219	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2218	\N	8	Sí	\N	\N	\N	\N	\N	100
2220	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2218	\N	8	No	\N	\N	\N	\N	\N	200
2221	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2214	\N	8	VIH	\N	\N	\N	\N	\N	300
2222	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2221	\N	8	Sí	\N	\N	\N	\N	\N	100
2223	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2221	\N	8	No	\N	\N	\N	\N	\N	200
2224	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2214	\N	8	EP	\N	\N	\N	\N	\N	400
2225	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2224	\N	8	Sí	\N	\N	\N	\N	\N	100
2226	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2224	\N	8	No	\N	\N	\N	\N	\N	200
2227	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2174	\N	8	Pediatra / Neonatólogo	\N	\N	\N	\N	\N	500
2228	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2227	\N	8	LM	\N	\N	\N	\N	\N	100
2229	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2228	\N	8	Sí	\N	\N	\N	\N	\N	100
2230	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2228	\N	8	No	\N	\N	\N	\N	\N	200
2231	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2227	\N	8	SLM	\N	\N	\N	\N	\N	200
2232	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2231	\N	8	Sí	\N	\N	\N	\N	\N	100
2233	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2231	\N	8	No	\N	\N	\N	\N	\N	200
2234	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2227	\N	8	VIH	\N	\N	\N	\N	\N	300
2235	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2234	\N	8	Sí	\N	\N	\N	\N	\N	100
2236	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2234	\N	8	No	\N	\N	\N	\N	\N	200
2237	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2227	\N	8	EP	\N	\N	\N	\N	\N	400
2238	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2237	\N	8	Sí	\N	\N	\N	\N	\N	100
2239	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2237	\N	8	No	\N	\N	\N	\N	\N	200
2240	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2174	\N	8	Dietistas o nutricionistas	\N	\N	\N	\N	\N	600
2241	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2240	\N	8	LM	\N	\N	\N	\N	\N	100
2242	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2241	\N	8	Sí	\N	\N	\N	\N	\N	100
2243	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2241	\N	8	No	\N	\N	\N	\N	\N	200
2244	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2240	\N	8	SLM	\N	\N	\N	\N	\N	200
2245	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2244	\N	8	Sí	\N	\N	\N	\N	\N	100
2246	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2244	\N	8	No	\N	\N	\N	\N	\N	200
2247	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2240	\N	8	VIH	\N	\N	\N	\N	\N	300
2248	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2247	\N	8	Sí	\N	\N	\N	\N	\N	100
2249	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2247	\N	8	No	\N	\N	\N	\N	\N	200
2250	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2240	\N	8	EP	\N	\N	\N	\N	\N	400
2251	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2250	\N	8	Sí	\N	\N	\N	\N	\N	100
2252	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2250	\N	8	No	\N	\N	\N	\N	\N	200
2253	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2174	\N	8	Médicos generales	\N	\N	\N	\N	\N	700
2254	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2253	\N	8	LM	\N	\N	\N	\N	\N	100
2255	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2254	\N	8	Sí	\N	\N	\N	\N	\N	100
2256	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2254	\N	8	No	\N	\N	\N	\N	\N	200
2257	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2253	\N	8	SLM	\N	\N	\N	\N	\N	200
2258	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2257	\N	8	Sí	\N	\N	\N	\N	\N	100
2259	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2257	\N	8	No	\N	\N	\N	\N	\N	200
2260	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2253	\N	8	VIH	\N	\N	\N	\N	\N	300
2261	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2260	\N	8	Sí	\N	\N	\N	\N	\N	100
2262	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2260	\N	8	No	\N	\N	\N	\N	\N	200
2263	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2253	\N	8	EP	\N	\N	\N	\N	\N	400
2264	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2263	\N	8	Sí	\N	\N	\N	\N	\N	100
2265	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2263	\N	8	No	\N	\N	\N	\N	\N	200
2266	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2174	\N	8	Auxiliares enfermería	\N	\N	\N	\N	\N	800
2267	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2266	\N	8	LM	\N	\N	\N	\N	\N	100
2268	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2267	\N	8	Sí	\N	\N	\N	\N	\N	100
2269	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2267	\N	8	No	\N	\N	\N	\N	\N	200
2270	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2266	\N	8	SLM	\N	\N	\N	\N	\N	200
2271	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2270	\N	8	Sí	\N	\N	\N	\N	\N	100
2272	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2270	\N	8	No	\N	\N	\N	\N	\N	200
2273	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2266	\N	8	VIH	\N	\N	\N	\N	\N	300
2274	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2273	\N	8	Sí	\N	\N	\N	\N	\N	100
2275	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2273	\N	8	No	\N	\N	\N	\N	\N	200
2276	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2266	\N	8	EP	\N	\N	\N	\N	\N	400
2277	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2276	\N	8	Sí	\N	\N	\N	\N	\N	100
2278	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2276	\N	8	No	\N	\N	\N	\N	\N	200
2279	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2174	\N	8	Otro personal 	\N	\N	\N	\N	\N	900
2280	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2279	\N	8	LM	\N	\N	\N	\N	\N	100
2281	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2280	\N	8	Sí	\N	\N	\N	\N	\N	100
2282	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2280	\N	8	No	\N	\N	\N	\N	\N	200
2283	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2279	\N	8	SLM	\N	\N	\N	\N	\N	200
2284	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2283	\N	8	Sí	\N	\N	\N	\N	\N	100
2285	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2283	\N	8	No	\N	\N	\N	\N	\N	200
2286	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2279	\N	8	VIH	\N	\N	\N	\N	\N	300
2287	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2286	\N	8	Sí	\N	\N	\N	\N	\N	100
2288	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2286	\N	8	No	\N	\N	\N	\N	\N	200
2289	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2279	\N	8	EP	\N	\N	\N	\N	\N	400
2290	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2289	\N	8	Sí	\N	\N	\N	\N	\N	100
2291	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2289	\N	8	No	\N	\N	\N	\N	\N	200
2292	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2279	\N	8	especificar	\N	\N	\N	\N	\N	500
2293	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2174	\N	8	Otro personal 	\N	\N	\N	\N	\N	1000
2294	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2293	\N	8	LM	\N	\N	\N	\N	\N	100
2295	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2294	\N	8	Sí	\N	\N	\N	\N	\N	100
2296	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2294	\N	8	No	\N	\N	\N	\N	\N	200
2297	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2293	\N	8	SLM	\N	\N	\N	\N	\N	200
2298	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2297	\N	8	Sí	\N	\N	\N	\N	\N	100
2299	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2297	\N	8	No	\N	\N	\N	\N	\N	200
2300	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2293	\N	8	VIH	\N	\N	\N	\N	\N	300
2301	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2300	\N	8	Sí	\N	\N	\N	\N	\N	100
2302	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2300	\N	8	No	\N	\N	\N	\N	\N	200
2303	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2293	\N	8	EP	\N	\N	\N	\N	\N	400
2304	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2303	\N	8	Sí	\N	\N	\N	\N	\N	100
2305	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2303	\N	8	No	\N	\N	\N	\N	\N	200
2306	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2293	\N	8	especificar	\N	\N	\N	\N	\N	500
2307	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2174	\N	8	Otro personal 	\N	\N	\N	\N	\N	1100
2308	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2307	\N	8	LM	\N	\N	\N	\N	\N	100
2309	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2308	\N	8	Sí	\N	\N	\N	\N	\N	100
2310	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2308	\N	8	No	\N	\N	\N	\N	\N	200
2311	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2307	\N	8	SLM	\N	\N	\N	\N	\N	200
2312	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2311	\N	8	Sí	\N	\N	\N	\N	\N	100
2313	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2311	\N	8	No	\N	\N	\N	\N	\N	200
2314	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2307	\N	8	VIH	\N	\N	\N	\N	\N	300
2315	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2314	\N	8	Sí	\N	\N	\N	\N	\N	100
2316	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2314	\N	8	No	\N	\N	\N	\N	\N	200
2317	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2307	\N	8	EP	\N	\N	\N	\N	\N	400
2318	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2317	\N	8	Sí	\N	\N	\N	\N	\N	100
2319	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2317	\N	8	No	\N	\N	\N	\N	\N	200
2320	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2307	\N	8	especificar	\N	\N	\N	\N	\N	500
2321	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2090	\N	8	6	\N	\N	\N	\N	\N	600
2322	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2321	\N	8	¿Existe una Comisión Amigo de la Madre y del Niño en el establecimiento de salud?  	\N	\N	\N	\N	\N	100
2323	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2322	\N	8	Sí	\N	\N	\N	\N	\N	100
2324	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2323	\N	8	Cuándo se conformó	\N	\N	\N	\N	\N	100
2325	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2322	\N	8	No	\N	\N	\N	\N	\N	200
2326	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2090	\N	8	7. Estadísticas en nacimientos	\N	\N	\N	\N	\N	700
2327	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2326	\N	8	Total de nacimientos en el último año	\N	\N	\N	\N	\N	100
2328	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2326	\N	8	De los nacimientos: 	\N	\N	\N	\N	\N	200
2329	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2328	\N	8	Número de partos normales	\N	\N	\N	\N	\N	100
2330	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2329	\N	8	no litotómicos	\N	\N	\N	\N	\N	100
2331	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2328	\N	8	Número de partos por cesárea 	\N	\N	\N	\N	\N	200
2332	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2331	\N	8	con anestesia general	\N	\N	\N	\N	\N	100
2333	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2328	\N	8	Número de nacidos vivos totales	\N	\N	\N	\N	\N	300
2334	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2328	\N	8	Número de neonatos ingresados en el servicio de neonatología	\N	\N	\N	\N	\N	400
2335	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2328	\N	8	Número de partos atendidos a madres VIH positivo	\N	\N	\N	\N	\N	500
2336	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2335	\N	8	partos expulsivos 	\N	\N	\N	\N	\N	100
2337	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2090	\N	8	8. Información en VIH/Sida	\N	\N	\N	\N	\N	800
2338	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2337	\N	8	Número de embarazadas que  fueron asesoradas para VIH	\N	\N	\N	\N	\N	100
2339	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2337	\N	8	Número de embarazadas que  fueron tamizadas para VIH	\N	\N	\N	\N	\N	200
2340	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2090	\N	8	9. Información para Sífilis	\N	\N	\N	\N	\N	900
2341	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2340	\N	8	Número de embarazadas que fueron tamizadas para sífilis	\N	\N	\N	\N	\N	100
2342	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2090	\N	8	10. Fuentes de esta información	\N	\N	\N	\N	\N	1000
2343	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2342	\N	8	Nombre y apellido	\N	\N	\N	\N	\N	100
2344	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	8	Información sobre el componente general	\N	\N	\N	\N	\N	200
2345	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2344	\N	8	Implementar y asegurar el efectivo cumplimiento de la norma ESAMyN	\N	\N	\N	\N	\N	100
2346	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2345	\N	8	a) Difundir la Norma ESAMyN	\N	\N	\N	\N	\N	100
2347	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2346	\N	8	Al menos una actividad de difusión de la norma ESAMyN	\N	\N	\N	\N	\N	100
2348	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2347	\N	8	metadata	\N	\N	\N	\N	\N	100
2349	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2348	\N	8	Puntaje	\N	\N	\N	\N	\N	100
2350	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2349	\N	8	3	\N	\N	\N	\N	\N	100
2351	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2348	\N	8	Verificador	\N	\N	\N	\N	\N	200
2352	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2351	\N	8	G.1.a informe	\N	\N	\N	\N	\N	100
2353	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2348	\N	8	Obligatorio	\N	\N	\N	\N	\N	300
2354	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2353	\N	8	1	\N	\N	\N	\N	\N	100
2355	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2348	\N	8	NA	\N	\N	\N	\N	\N	400
2356	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2355	\N	8	0	\N	\N	\N	\N	\N	100
2357	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2348	\N	8	Condición NA	\N	\N	\N	\N	\N	500
2358	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2346	\N	8	80% del personal conoce de la norma ESAMyN	\N	\N	\N	\N	\N	200
2359	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2358	\N	8	metadata	\N	\N	\N	\N	\N	100
2360	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2359	\N	8	Puntaje	\N	\N	\N	\N	\N	100
2361	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2360	\N	8	2	\N	\N	\N	\N	\N	100
2362	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2359	\N	8	Verificador	\N	\N	\N	\N	\N	200
2363	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2362	\N	8	G.1.a EP	\N	\N	\N	\N	\N	100
2364	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2359	\N	8	Obligatorio	\N	\N	\N	\N	\N	300
2365	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2364	\N	8	0	\N	\N	\N	\N	\N	100
2366	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2359	\N	8	NA	\N	\N	\N	\N	\N	400
2367	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2366	\N	8	0	\N	\N	\N	\N	\N	100
2368	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2359	\N	8	Condición NA	\N	\N	\N	\N	\N	500
2369	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2345	\N	8	b) Contar con material edu-comunicacional en áreas visibles	\N	\N	\N	\N	\N	200
2370	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2369	\N	8	Al menos una pieza edu-comunicacional sobre la norma ESAMyN disponible y visible	\N	\N	\N	\N	\N	100
2371	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2370	\N	8	metadata	\N	\N	\N	\N	\N	100
2372	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2371	\N	8	Puntaje	\N	\N	\N	\N	\N	100
2373	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2372	\N	8	2	\N	\N	\N	\N	\N	100
2374	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2371	\N	8	Verificador	\N	\N	\N	\N	\N	200
2375	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2374	\N	8	G.1.b Ob	\N	\N	\N	\N	\N	100
2376	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2371	\N	8	Obligatorio	\N	\N	\N	\N	\N	300
2377	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2376	\N	8	0	\N	\N	\N	\N	\N	100
2378	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2371	\N	8	NA	\N	\N	\N	\N	\N	400
2379	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2378	\N	8	0	\N	\N	\N	\N	\N	100
2380	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2371	\N	8	Condición NA	\N	\N	\N	\N	\N	500
2381	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2345	\N	8	c) Capacitar al personal en calidad de atención durante el embarazo, parto, puerperio, lactancia, alimentación infantil y otros	\N	\N	\N	\N	\N	300
2382	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2381	\N	8	80% del personal ha cumplido satisfactoriamente con el programa de capacitación	\N	\N	\N	\N	\N	100
2383	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2382	\N	8	metadata	\N	\N	\N	\N	\N	100
2384	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2383	\N	8	Puntaje	\N	\N	\N	\N	\N	100
2385	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2384	\N	8	3	\N	\N	\N	\N	\N	100
2386	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2383	\N	8	Verificador	\N	\N	\N	\N	\N	200
2387	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2386	\N	8	G.1.c Informe	\N	\N	\N	\N	\N	100
2388	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2383	\N	8	Obligatorio	\N	\N	\N	\N	\N	300
2389	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2388	\N	8	1	\N	\N	\N	\N	\N	100
2390	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2383	\N	8	NA	\N	\N	\N	\N	\N	400
2391	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2390	\N	8	0	\N	\N	\N	\N	\N	100
2392	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2383	\N	8	Condición NA	\N	\N	\N	\N	\N	500
2393	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	8	Información sobre servicios prenatales	\N	\N	\N	\N	\N	300
2394	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2393	\N	8	Cumplir con la Norma de Educación Prenatal (NEP)	\N	\N	\N	\N	\N	100
2395	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2394	\N	8	a) Capacitación del personal en la NEP	\N	\N	\N	\N	\N	100
2396	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2395	\N	8	80% del personal de atención perinatal capacitado en  la norma de Educación Prenatal	\N	\N	\N	\N	\N	100
2397	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2396	\N	8	metadata	\N	\N	\N	\N	\N	100
2398	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2397	\N	8	Puntaje	\N	\N	\N	\N	\N	100
2399	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2398	\N	8	3	\N	\N	\N	\N	\N	100
2400	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2397	\N	8	Verificador	\N	\N	\N	\N	\N	200
2401	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2400	\N	8	R.1.a Informe	\N	\N	\N	\N	\N	100
2402	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2397	\N	8	Obligatorio	\N	\N	\N	\N	\N	300
2403	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2402	\N	8	1	\N	\N	\N	\N	\N	100
2404	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2397	\N	8	NA	\N	\N	\N	\N	\N	400
2405	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2404	\N	8	0	\N	\N	\N	\N	\N	100
2406	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2397	\N	8	Condición NA	\N	\N	\N	\N	\N	500
2407	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2394	\N	8	b) Aplicación de la norma	\N	\N	\N	\N	\N	200
2408	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2407	\N	8	80% de puérperas asistieron al programa completo de educación prenatal	\N	\N	\N	\N	\N	100
2409	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2408	\N	8	metadata	\N	\N	\N	\N	\N	100
2410	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2409	\N	8	Puntaje	\N	\N	\N	\N	\N	100
2411	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2410	\N	8	1	\N	\N	\N	\N	\N	100
2412	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2409	\N	8	Verificador	\N	\N	\N	\N	\N	200
2413	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2412	\N	8	R.1.b 051	\N	\N	\N	\N	\N	100
2414	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2409	\N	8	Obligatorio	\N	\N	\N	\N	\N	300
2415	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2414	\N	8	0	\N	\N	\N	\N	\N	100
2416	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2409	\N	8	NA	\N	\N	\N	\N	\N	400
2417	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2416	\N	8	1	\N	\N	\N	\N	\N	100
2418	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2409	\N	8	Condición NA	\N	\N	\N	\N	\N	500
2419	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2418	\N	8	establecimiento no atiende controles prenatales	\N	\N	\N	\N	\N	100
2420	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2394	\N	8	c) Garantizar asesoría e información sobre métodos anticonceptivos a la madre y pareja	\N	\N	\N	\N	\N	300
2421	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2420	\N	8	80% de gestantes de 34 semanas o más recibió asesoría sobre planificación familiar	\N	\N	\N	\N	\N	100
2422	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2421	\N	8	metadata	\N	\N	\N	\N	\N	100
2423	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2422	\N	8	Puntaje	\N	\N	\N	\N	\N	100
2424	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2423	\N	8	1	\N	\N	\N	\N	\N	100
2425	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2422	\N	8	Verificador	\N	\N	\N	\N	\N	200
2426	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2425	\N	8	R.1.c EM	\N	\N	\N	\N	\N	100
2427	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2422	\N	8	Obligatorio	\N	\N	\N	\N	\N	300
2428	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2427	\N	8	0	\N	\N	\N	\N	\N	100
2429	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2422	\N	8	NA	\N	\N	\N	\N	\N	400
2430	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2429	\N	8	0	\N	\N	\N	\N	\N	100
2431	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2422	\N	8	Condición NA	\N	\N	\N	\N	\N	500
2432	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2393	\N	8	Garantizar la cobertura, concentración, calidad y oportunidad de controles prenatales en su ámbito y nivel de responsabilidad	\N	\N	\N	\N	\N	200
2433	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2432	\N	8	a) Implementar adecuadamente los instrumentos de registro estandarizados (Formulario 051)	\N	\N	\N	\N	\N	100
2434	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2433	\N	8	80% de formularios 051 llenos adecuadamente	\N	\N	\N	\N	\N	100
2435	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2434	\N	8	metadata	\N	\N	\N	\N	\N	100
2436	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2435	\N	8	Puntaje	\N	\N	\N	\N	\N	100
2437	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2436	\N	8	2	\N	\N	\N	\N	\N	100
2438	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2435	\N	8	Verificador	\N	\N	\N	\N	\N	200
2439	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2438	\N	8	R.2.a 051	\N	\N	\N	\N	\N	100
2440	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2435	\N	8	Obligatorio	\N	\N	\N	\N	\N	300
2441	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2440	\N	8	0	\N	\N	\N	\N	\N	100
2442	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2435	\N	8	NA	\N	\N	\N	\N	\N	400
2443	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2442	\N	8	0	\N	\N	\N	\N	\N	100
2444	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2435	\N	8	Condición NA	\N	\N	\N	\N	\N	500
2445	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2432	\N	8	b) Asegurar la captación oportuna en el primer nivel de atención de salud	\N	\N	\N	\N	\N	200
2446	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2445	\N	8	80% de madres asistieron a al menos un control en el primer trimestre	\N	\N	\N	\N	\N	100
2447	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2446	\N	8	metadata	\N	\N	\N	\N	\N	100
2448	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2447	\N	8	Puntaje	\N	\N	\N	\N	\N	100
2449	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2448	\N	8	3	\N	\N	\N	\N	\N	100
2450	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2447	\N	8	Verificador	\N	\N	\N	\N	\N	200
2451	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2450	\N	8	R.2.b 051  	\N	\N	\N	\N	\N	100
2452	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2447	\N	8	Obligatorio	\N	\N	\N	\N	\N	300
2453	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2452	\N	8	0	\N	\N	\N	\N	\N	100
2454	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2447	\N	8	NA	\N	\N	\N	\N	\N	400
2455	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2454	\N	8	1	\N	\N	\N	\N	\N	100
2456	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2447	\N	8	Condición NA	\N	\N	\N	\N	\N	500
2457	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2456	\N	8	si el establecimiento no atiende controles prenatales	\N	\N	\N	\N	\N	100
2458	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2432	\N	8	c) Las gestantes recibirán controles prenatales según los documentos normativos del MSP vigentes	\N	\N	\N	\N	\N	300
2459	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2458	\N	8	80% de gestantes asisten a 5 controles	\N	\N	\N	\N	\N	100
2460	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2459	\N	8	metadata	\N	\N	\N	\N	\N	100
2461	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2460	\N	8	Puntaje	\N	\N	\N	\N	\N	100
2462	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2461	\N	8	1	\N	\N	\N	\N	\N	100
2463	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2460	\N	8	Verificador	\N	\N	\N	\N	\N	200
2464	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2463	\N	8	R.2.c1 EM	\N	\N	\N	\N	\N	100
2465	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2460	\N	8	Obligatorio	\N	\N	\N	\N	\N	300
2466	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2465	\N	8	0	\N	\N	\N	\N	\N	100
2467	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2460	\N	8	NA	\N	\N	\N	\N	\N	400
2468	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2467	\N	8	1	\N	\N	\N	\N	\N	100
2469	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2460	\N	8	Condición NA	\N	\N	\N	\N	\N	500
2470	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2469	\N	8	si el establecimiento no atiende controles prenatales	\N	\N	\N	\N	\N	100
2471	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2458	\N	8	80% de gestantes son asistidas en el plan de parto y de transporte	\N	\N	\N	\N	\N	200
2472	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2471	\N	8	metadata	\N	\N	\N	\N	\N	100
2473	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2472	\N	8	Puntaje	\N	\N	\N	\N	\N	100
2474	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2473	\N	8	1	\N	\N	\N	\N	\N	100
2475	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2472	\N	8	Verificador	\N	\N	\N	\N	\N	200
2476	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2475	\N	8	R.2.c2 EM	\N	\N	\N	\N	\N	100
2477	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2472	\N	8	Obligatorio	\N	\N	\N	\N	\N	300
2478	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2477	\N	8	0	\N	\N	\N	\N	\N	100
2479	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2472	\N	8	NA	\N	\N	\N	\N	\N	400
2480	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2479	\N	8	1	\N	\N	\N	\N	\N	100
2481	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2472	\N	8	Condición NA	\N	\N	\N	\N	\N	500
2482	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2481	\N	8	si el establecimiento no atiende controles prenatales	\N	\N	\N	\N	\N	100
2483	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2458	\N	8	80% ha sido informada y conoce los signos de alarma durante el embarazo	\N	\N	\N	\N	\N	300
2484	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2483	\N	8	metadata	\N	\N	\N	\N	\N	100
2485	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2484	\N	8	Puntaje	\N	\N	\N	\N	\N	100
2486	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2485	\N	8	1	\N	\N	\N	\N	\N	100
2487	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2484	\N	8	Verificador	\N	\N	\N	\N	\N	200
2488	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2487	\N	8	R.2.c3 EM	\N	\N	\N	\N	\N	100
2489	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2484	\N	8	Obligatorio	\N	\N	\N	\N	\N	300
2490	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2489	\N	8	0	\N	\N	\N	\N	\N	100
2491	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2484	\N	8	NA	\N	\N	\N	\N	\N	400
2492	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2491	\N	8	1	\N	\N	\N	\N	\N	100
2493	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2484	\N	8	Condición NA	\N	\N	\N	\N	\N	500
2494	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2493	\N	8	si el establecimiento no atiende controles prenatales	\N	\N	\N	\N	\N	100
2495	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2458	\N	8	80% de gestantes manifiestan haber sido vacunadas durante la gestación	\N	\N	\N	\N	\N	400
2496	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2495	\N	8	metadata	\N	\N	\N	\N	\N	100
2497	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2496	\N	8	Puntaje	\N	\N	\N	\N	\N	100
2498	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2497	\N	8	1	\N	\N	\N	\N	\N	100
2499	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2496	\N	8	Verificador	\N	\N	\N	\N	\N	200
2500	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2499	\N	8	R.2.c4 EM	\N	\N	\N	\N	\N	100
2501	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2496	\N	8	Obligatorio	\N	\N	\N	\N	\N	300
2502	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2501	\N	8	0	\N	\N	\N	\N	\N	100
2503	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2496	\N	8	NA	\N	\N	\N	\N	\N	400
2504	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2503	\N	8	1	\N	\N	\N	\N	\N	100
2505	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2496	\N	8	Condición NA	\N	\N	\N	\N	\N	500
2506	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2505	\N	8	si el establecimiento no atiende controles prenatales	\N	\N	\N	\N	\N	100
2507	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2432	\N	8	g) Garantizar la detección y tratamiento de las gestantes en riesgo aplicando herramientas estandarizadas del MSP de acuerdo a su nivel de complejidad	\N	\N	\N	\N	\N	400
2508	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2507	\N	8	80% de gestantes bajo responsabilidad de establecimiento son controladas según norma con variables completas del formulario 051	\N	\N	\N	\N	\N	100
2509	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2508	\N	8	metadata	\N	\N	\N	\N	\N	100
2510	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2509	\N	8	Puntaje	\N	\N	\N	\N	\N	100
2511	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2510	\N	8	2	\N	\N	\N	\N	\N	100
2512	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2509	\N	8	Verificador	\N	\N	\N	\N	\N	200
2513	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2512	\N	8	R.2.d 051	\N	\N	\N	\N	\N	100
2514	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2509	\N	8	Obligatorio	\N	\N	\N	\N	\N	300
2515	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2514	\N	8	0	\N	\N	\N	\N	\N	100
2516	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2509	\N	8	NA	\N	\N	\N	\N	\N	400
2517	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2516	\N	8	0	\N	\N	\N	\N	\N	100
2518	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2509	\N	8	Condición NA	\N	\N	\N	\N	\N	500
2519	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2507	\N	8	100% de historias clínicas de embarazadas con diagnóstico de riesgo tienen un tratamiento según normas del MSP.	\N	\N	\N	\N	\N	200
2520	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2519	\N	8	metadata	\N	\N	\N	\N	\N	100
2521	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2520	\N	8	Puntaje	\N	\N	\N	\N	\N	100
2522	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2521	\N	8	3	\N	\N	\N	\N	\N	100
2523	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2520	\N	8	Verificador	\N	\N	\N	\N	\N	200
2524	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2523	\N	8	R.2.d HC	\N	\N	\N	\N	\N	100
2525	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2520	\N	8	Obligatorio	\N	\N	\N	\N	\N	300
2526	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2525	\N	8	1	\N	\N	\N	\N	\N	100
2527	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2520	\N	8	NA	\N	\N	\N	\N	\N	400
2528	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2527	\N	8	0	\N	\N	\N	\N	\N	100
2529	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2520	\N	8	Condición NA	\N	\N	\N	\N	\N	500
2530	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2393	\N	8	Garantizar la cobertura del tamizaje y tratamiento de VIH y sífilis a todas las gestantes 	\N	\N	\N	\N	\N	300
2531	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2530	\N	8	a) Ofrecer asesoría sobre riesgos  de ITS y VIH durante el embarazo;	\N	\N	\N	\N	\N	100
2532	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2531	\N	8	90% de embarazadas asesoradas en prevención de ITS durante el embarazo y se les dio una charla específica sobre VIH/Sida.	\N	\N	\N	\N	\N	100
2533	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2532	\N	8	metadata	\N	\N	\N	\N	\N	100
2534	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2533	\N	8	Puntaje	\N	\N	\N	\N	\N	100
2535	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2534	\N	8	3	\N	\N	\N	\N	\N	100
2536	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2533	\N	8	Verificador	\N	\N	\N	\N	\N	200
2537	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2536	\N	8	R.3.a EM	\N	\N	\N	\N	\N	100
2538	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2533	\N	8	Obligatorio	\N	\N	\N	\N	\N	300
2539	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2538	\N	8	1	\N	\N	\N	\N	\N	100
2540	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2533	\N	8	NA	\N	\N	\N	\N	\N	400
2541	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2540	\N	8	0	\N	\N	\N	\N	\N	100
2542	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2533	\N	8	Condición NA	\N	\N	\N	\N	\N	500
2543	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2530	\N	8	b) Tamizar para sífilis y VIH según la normativa vigente del MSP al menos en el primer control;	\N	\N	\N	\N	\N	200
2544	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2543	\N	8	90% de las gestantes que acudieron al primer control pre natal y fueron tamizadas para sífilis y VIH.	\N	\N	\N	\N	\N	100
2545	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2544	\N	8	metadata	\N	\N	\N	\N	\N	100
2546	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2545	\N	8	Puntaje	\N	\N	\N	\N	\N	100
2547	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2546	\N	8	2	\N	\N	\N	\N	\N	100
2548	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2545	\N	8	Verificador	\N	\N	\N	\N	\N	200
2549	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2548	\N	8	R.3.b 051	\N	\N	\N	\N	\N	100
2550	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2545	\N	8	Obligatorio	\N	\N	\N	\N	\N	300
2551	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2550	\N	8	0	\N	\N	\N	\N	\N	100
2552	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2545	\N	8	NA	\N	\N	\N	\N	\N	400
2553	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2552	\N	8	1	\N	\N	\N	\N	\N	100
2554	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2545	\N	8	Condición NA	\N	\N	\N	\N	\N	500
2555	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2554	\N	8	si el establecimiento no atiende controles prenatales	\N	\N	\N	\N	\N	100
2556	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2543	\N	8	90% de las gestantes manifiestan que se les realizó la prueba para VIH.	\N	\N	\N	\N	\N	200
2557	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2556	\N	8	metadata	\N	\N	\N	\N	\N	100
2558	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2557	\N	8	Puntaje	\N	\N	\N	\N	\N	100
2559	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2558	\N	8	1	\N	\N	\N	\N	\N	100
2560	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2557	\N	8	Verificador	\N	\N	\N	\N	\N	200
2561	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2560	\N	8	R.3.b EM	\N	\N	\N	\N	\N	100
2562	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2557	\N	8	Obligatorio	\N	\N	\N	\N	\N	300
2563	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2562	\N	8	0	\N	\N	\N	\N	\N	100
2564	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2557	\N	8	NA	\N	\N	\N	\N	\N	400
2565	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2564	\N	8	0	\N	\N	\N	\N	\N	100
2566	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2557	\N	8	Condición NA	\N	\N	\N	\N	\N	500
2567	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2530	\N	8	d) Toda mujer tamizada VIH y/o sífilis positivo recibe el tratamiento correspondiente.	\N	\N	\N	\N	\N	300
2568	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2567	\N	8	100% de madres VIH y/o sífilis positivo reciben tratamiento	\N	\N	\N	\N	\N	100
2569	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2568	\N	8	metadata	\N	\N	\N	\N	\N	100
2570	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2569	\N	8	Puntaje	\N	\N	\N	\N	\N	100
2571	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2570	\N	8	3	\N	\N	\N	\N	\N	100
2572	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2569	\N	8	Verificador	\N	\N	\N	\N	\N	200
2573	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2572	\N	8	R.3.c 051	\N	\N	\N	\N	\N	100
2574	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2569	\N	8	Obligatorio	\N	\N	\N	\N	\N	300
2575	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2574	\N	8	0	\N	\N	\N	\N	\N	100
2576	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2569	\N	8	NA	\N	\N	\N	\N	\N	400
2577	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2576	\N	8	1	\N	\N	\N	\N	\N	100
2578	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2569	\N	8	Condición NA	\N	\N	\N	\N	\N	500
2579	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2578	\N	8	si el establecimiento no ha atendido madres VIH positivo	\N	\N	\N	\N	\N	100
2580	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2393	\N	8	Fomentar la articulación con agentes de la medicina tradicional para el cuidado del embarazo, parto y puerperio.	\N	\N	\N	\N	\N	400
2581	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2580	\N	8	a) Disponer de un mapeo de actores y agentes de medicina  ancestral	\N	\N	\N	\N	\N	100
2582	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2581	\N	8	Mapeo de agentes de la medicina ancestral legitimados por la comunidad en el Análisis Situacional Integral de Salud (ASIS). En el caso de no contar con un ASIS, los establecimientos incluirán dicho mapeo en un informe.	\N	\N	\N	\N	\N	100
2583	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2582	\N	8	metadata	\N	\N	\N	\N	\N	100
2584	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2583	\N	8	Puntaje	\N	\N	\N	\N	\N	100
2585	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2584	\N	8	1	\N	\N	\N	\N	\N	100
2586	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2583	\N	8	Verificador	\N	\N	\N	\N	\N	200
2587	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2586	\N	8	R.4.a ASIS	\N	\N	\N	\N	\N	100
2588	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2583	\N	8	Obligatorio	\N	\N	\N	\N	\N	300
2589	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2588	\N	8	0	\N	\N	\N	\N	\N	100
2590	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2583	\N	8	NA	\N	\N	\N	\N	\N	400
2591	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2590	\N	8	0	\N	\N	\N	\N	\N	100
2592	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2583	\N	8	Condición NA	\N	\N	\N	\N	\N	500
2593	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2580	\N	8	b) Establecer mecanismos de articulación entre agentes de medicina  ancestral y los ES.	\N	\N	\N	\N	\N	200
2594	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2593	\N	8	Cada establecimiento de salud deberá contar con un mecanismo de articulación acordado entre las partes.	\N	\N	\N	\N	\N	100
2595	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2594	\N	8	metadata	\N	\N	\N	\N	\N	100
2596	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2595	\N	8	Puntaje	\N	\N	\N	\N	\N	100
2597	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2596	\N	8	1	\N	\N	\N	\N	\N	100
2598	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2595	\N	8	Verificador	\N	\N	\N	\N	\N	200
2599	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2598	\N	8	R.4.b informe	\N	\N	\N	\N	\N	100
2600	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2595	\N	8	Obligatorio	\N	\N	\N	\N	\N	300
2601	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2600	\N	8	0	\N	\N	\N	\N	\N	100
2602	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2595	\N	8	NA	\N	\N	\N	\N	\N	400
2603	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2602	\N	8	1	\N	\N	\N	\N	\N	100
2604	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2595	\N	8	Condición NA	\N	\N	\N	\N	\N	500
2605	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2604	\N	8	si el establecimiento no identifica agentes de la medicina ancestral	\N	\N	\N	\N	\N	100
2606	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	8	Componente Parto y Puerperio	\N	\N	\N	\N	\N	400
2607	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2606	\N	8	Promover y garantizar el acompañamiento de la gestante durante la labor del parto, parto  y puerperio por la  persona de su elección	\N	\N	\N	\N	\N	100
2608	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2607	\N	8	a) Permitir el acompañamiento a la madre, por una persona de su elección, en el  trabajo de parto a menos de que esté clínicamente justificado y sea informado;	\N	\N	\N	\N	\N	100
2609	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2608	\N	8	80% de madres informan que el personal de salud les dijo que pueden tener acompañantes de su elección durante el trabajo de parto y les informaron por qué es beneficioso.	\N	\N	\N	\N	\N	100
2610	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2609	\N	8	metadata	\N	\N	\N	\N	\N	100
2611	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2610	\N	8	Puntaje	\N	\N	\N	\N	\N	100
2612	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2611	\N	8	1	\N	\N	\N	\N	\N	100
2613	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2610	\N	8	Verificador	\N	\N	\N	\N	\N	200
2614	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2613	\N	8	P.1.a EM	\N	\N	\N	\N	\N	100
2615	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2610	\N	8	Obligatorio	\N	\N	\N	\N	\N	300
2616	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2615	\N	8	0	\N	\N	\N	\N	\N	100
2617	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2610	\N	8	NA	\N	\N	\N	\N	\N	400
2618	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2617	\N	8	0	\N	\N	\N	\N	\N	100
2619	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2610	\N	8	Condición NA	\N	\N	\N	\N	\N	500
2702	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2693	\N	8	Condición NA	\N	\N	\N	\N	\N	500
2620	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2607	\N	8	b) Permitir el acompañamiento a la madre, por una persona de su elección, durante el  parto a menos de que esté clínicamente justificado y sea informado;	\N	\N	\N	\N	\N	200
2621	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2620	\N	8	80% de partos atendidos en el establecimiento registran acompañamiento durante el parto.	\N	\N	\N	\N	\N	100
2622	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2621	\N	8	metadata	\N	\N	\N	\N	\N	100
2623	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2622	\N	8	Puntaje	\N	\N	\N	\N	\N	100
2624	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2623	\N	8	3	\N	\N	\N	\N	\N	100
2625	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2622	\N	8	Verificador	\N	\N	\N	\N	\N	200
2626	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2625	\N	8	P.1.b EM	\N	\N	\N	\N	\N	100
2627	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2622	\N	8	Obligatorio	\N	\N	\N	\N	\N	300
2628	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2627	\N	8	1	\N	\N	\N	\N	\N	100
2629	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2622	\N	8	NA	\N	\N	\N	\N	\N	400
2630	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2629	\N	8	0	\N	\N	\N	\N	\N	100
2631	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2622	\N	8	Condición NA	\N	\N	\N	\N	\N	500
2632	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2620	\N	8	80% de madres informan que el personal les dijo que pueden tener acompañantes de su elección durante el parto e informaron su beneficio.	\N	\N	\N	\N	\N	200
2633	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2632	\N	8	metadata	\N	\N	\N	\N	\N	100
2634	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2633	\N	8	Puntaje	\N	\N	\N	\N	\N	100
2635	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2634	\N	8	2	\N	\N	\N	\N	\N	100
2636	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2633	\N	8	Verificador	\N	\N	\N	\N	\N	200
2637	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2636	\N	8	P.1.b 051	\N	\N	\N	\N	\N	100
2638	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2633	\N	8	Obligatorio	\N	\N	\N	\N	\N	300
2639	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2638	\N	8	0	\N	\N	\N	\N	\N	100
2640	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2633	\N	8	NA	\N	\N	\N	\N	\N	400
2641	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2640	\N	8	0	\N	\N	\N	\N	\N	100
2642	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2633	\N	8	Condición NA	\N	\N	\N	\N	\N	500
2643	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2607	\N	8	c) Permitir el acompañamiento a la madre, por una persona de su elección, en el puerperio, a menos de que esté justificado.	\N	\N	\N	\N	\N	300
2644	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2643	\N	8	80% de madres encuestadas  informan que le personal de salud le permitió estar acompañada por la persona de su elección durante el post parto	\N	\N	\N	\N	\N	100
2645	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2644	\N	8	metadata	\N	\N	\N	\N	\N	100
2646	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2645	\N	8	Puntaje	\N	\N	\N	\N	\N	100
2647	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2646	\N	8	1	\N	\N	\N	\N	\N	100
2648	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2645	\N	8	Verificador	\N	\N	\N	\N	\N	200
2649	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2648	\N	8	P.1.c EM	\N	\N	\N	\N	\N	100
2650	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2645	\N	8	Obligatorio	\N	\N	\N	\N	\N	300
2651	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2650	\N	8	0	\N	\N	\N	\N	\N	100
2652	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2645	\N	8	NA	\N	\N	\N	\N	\N	400
2653	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2652	\N	8	0	\N	\N	\N	\N	\N	100
2654	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2645	\N	8	Condición NA	\N	\N	\N	\N	\N	500
2655	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2606	\N	8	Garantizar un ambiente acogedor y el respeto del prácticas interculturales	\N	\N	\N	\N	\N	200
2656	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2655	\N	8	a) Sensibilizar al personal de salud en interculturalidad y  prácticas culturalmente adecuadas.	\N	\N	\N	\N	\N	100
2657	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2656	\N	8	80% del personal de salud del ES deberá estar  sensibilizado en interculturalidad y prácticas culturales.	\N	\N	\N	\N	\N	100
2658	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2657	\N	8	metadata	\N	\N	\N	\N	\N	100
2659	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2658	\N	8	Puntaje	\N	\N	\N	\N	\N	100
2660	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2659	\N	8	1	\N	\N	\N	\N	\N	100
2661	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2658	\N	8	Verificador	\N	\N	\N	\N	\N	200
2662	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2661	\N	8	P.2.a informe	\N	\N	\N	\N	\N	100
2663	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2658	\N	8	Obligatorio	\N	\N	\N	\N	\N	300
2664	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2663	\N	8	0	\N	\N	\N	\N	\N	100
2665	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2658	\N	8	NA	\N	\N	\N	\N	\N	400
2666	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2665	\N	8	0	\N	\N	\N	\N	\N	100
2667	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2658	\N	8	Condición NA	\N	\N	\N	\N	\N	500
2668	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2655	\N	8	b) Las madres pueden usar la vestimenta que deseen, permitir la ingesta de líquidos o alimentos  ligeros a menos de que esté clínicamente justificado y sea informado;	\N	\N	\N	\N	\N	200
2669	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2668	\N	8	80% de madres encuestadas se le consultó sobre el uso de vestimenta deseada, la ingesta de líquidos y/o alimentos ligeros.	\N	\N	\N	\N	\N	100
2670	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2669	\N	8	metadata	\N	\N	\N	\N	\N	100
2671	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2670	\N	8	Puntaje	\N	\N	\N	\N	\N	100
2672	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2671	\N	8	1	\N	\N	\N	\N	\N	100
2673	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2670	\N	8	Verificador	\N	\N	\N	\N	\N	200
2674	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2673	\N	8	P.2.b EM	\N	\N	\N	\N	\N	100
2675	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2670	\N	8	Obligatorio	\N	\N	\N	\N	\N	300
2676	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2675	\N	8	0	\N	\N	\N	\N	\N	100
2677	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2670	\N	8	NA	\N	\N	\N	\N	\N	400
2678	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2677	\N	8	0	\N	\N	\N	\N	\N	100
2679	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2670	\N	8	Condición NA	\N	\N	\N	\N	\N	500
2680	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2668	\N	8	80% de madres registradas en vestimenta de su elección.	\N	\N	\N	\N	\N	200
2681	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2680	\N	8	metadata	\N	\N	\N	\N	\N	100
2682	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2681	\N	8	Puntaje	\N	\N	\N	\N	\N	100
2683	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2682	\N	8	1	\N	\N	\N	\N	\N	100
2684	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2681	\N	8	Verificador	\N	\N	\N	\N	\N	200
2685	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2684	\N	8	P.2.b O51	\N	\N	\N	\N	\N	100
2686	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2681	\N	8	Obligatorio	\N	\N	\N	\N	\N	300
2687	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2686	\N	8	0	\N	\N	\N	\N	\N	100
2688	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2681	\N	8	NA	\N	\N	\N	\N	\N	400
2689	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2688	\N	8	0	\N	\N	\N	\N	\N	100
2690	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2681	\N	8	Condición NA	\N	\N	\N	\N	\N	500
2691	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2655	\N	8	d) Ofrecer a la madre la opción de disponer de la placenta a menos de que esté clínicamente justificado y sea informado;	\N	\N	\N	\N	\N	300
2692	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2691	\N	8	80% de madres se les ofreció disponer de la placenta	\N	\N	\N	\N	\N	100
2693	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2692	\N	8	metadata	\N	\N	\N	\N	\N	100
2694	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2693	\N	8	Puntaje	\N	\N	\N	\N	\N	100
2695	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2694	\N	8	1	\N	\N	\N	\N	\N	100
2696	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2693	\N	8	Verificador	\N	\N	\N	\N	\N	200
2697	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2696	\N	8	P.2.c EM	\N	\N	\N	\N	\N	100
2698	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2693	\N	8	Obligatorio	\N	\N	\N	\N	\N	300
2699	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2698	\N	8	0	\N	\N	\N	\N	\N	100
2700	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2693	\N	8	NA	\N	\N	\N	\N	\N	400
2701	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2700	\N	8	0	\N	\N	\N	\N	\N	100
2703	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2691	\N	8	80% de madres se les registró en disposición de placenta.	\N	\N	\N	\N	\N	200
2704	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2703	\N	8	metadata	\N	\N	\N	\N	\N	100
2705	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2704	\N	8	Puntaje	\N	\N	\N	\N	\N	100
2706	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2705	\N	8	1	\N	\N	\N	\N	\N	100
2707	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2704	\N	8	Verificador	\N	\N	\N	\N	\N	200
2708	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2707	\N	8	P.2.c 051	\N	\N	\N	\N	\N	100
2709	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2704	\N	8	Obligatorio	\N	\N	\N	\N	\N	300
2710	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2709	\N	8	0	\N	\N	\N	\N	\N	100
2711	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2704	\N	8	NA	\N	\N	\N	\N	\N	400
2712	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2711	\N	8	0	\N	\N	\N	\N	\N	100
2713	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2704	\N	8	Condición NA	\N	\N	\N	\N	\N	500
2714	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2606	\N	8	Alentar a las mujeres a caminar y movilizarse durante el trabajo de parto y asistirla para que asuma posición a su elección	\N	\N	\N	\N	\N	300
2715	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2714	\N	8	a) Garantizar espacios adecuados y equipamiento de acuerdo al licenciamiento del MSP	\N	\N	\N	\N	\N	100
2716	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2715	\N	8	Disponibilidad de al menos un espacio adecuado con equipamiento según licenciamiento del MSP para el trabajo de parto	\N	\N	\N	\N	\N	100
2717	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2716	\N	8	metadata	\N	\N	\N	\N	\N	100
2718	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2717	\N	8	Puntaje	\N	\N	\N	\N	\N	100
2719	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2717	\N	8	Verificador	\N	\N	\N	\N	\N	200
2720	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2719	\N	8	P.3.a1 Ob	\N	\N	\N	\N	\N	100
2721	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2717	\N	8	Obligatorio	\N	\N	\N	\N	\N	300
2722	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2721	\N	8	0	\N	\N	\N	\N	\N	100
2723	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2717	\N	8	NA	\N	\N	\N	\N	\N	400
2724	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2723	\N	8	0	\N	\N	\N	\N	\N	100
2725	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2717	\N	8	Condición NA	\N	\N	\N	\N	\N	500
2726	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2715	\N	8	Disponibilidad de al menos un espacio adecuado con equipamiento según licenciamiento del MSP para el parto	\N	\N	\N	\N	\N	200
2727	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2726	\N	8	metadata	\N	\N	\N	\N	\N	100
2728	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2727	\N	8	Puntaje	\N	\N	\N	\N	\N	100
2729	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2727	\N	8	Verificador	\N	\N	\N	\N	\N	200
2730	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2729	\N	8	P.3.a2 Ob	\N	\N	\N	\N	\N	100
2731	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2727	\N	8	Obligatorio	\N	\N	\N	\N	\N	300
2732	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2731	\N	8	0	\N	\N	\N	\N	\N	100
2733	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2727	\N	8	NA	\N	\N	\N	\N	\N	400
2734	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2733	\N	8	0	\N	\N	\N	\N	\N	100
2735	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2727	\N	8	Condición NA	\N	\N	\N	\N	\N	500
2736	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2714	\N	8	c) Socializar los beneficios y permitir  la movilización  durante la labor de parto, a no ser que exista una restricción especifica.	\N	\N	\N	\N	\N	200
2737	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2736	\N	8	80% de madres informan que personal les alentó  la movilizarse durante la labor de parto.	\N	\N	\N	\N	\N	100
2738	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2737	\N	8	metadata	\N	\N	\N	\N	\N	100
2739	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2738	\N	8	Puntaje	\N	\N	\N	\N	\N	100
2740	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2739	\N	8	1	\N	\N	\N	\N	\N	100
2741	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2738	\N	8	Verificador	\N	\N	\N	\N	\N	200
2742	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2741	\N	8	P.3.b1 EM	\N	\N	\N	\N	\N	100
2743	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2738	\N	8	Obligatorio	\N	\N	\N	\N	\N	300
2744	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2743	\N	8	0	\N	\N	\N	\N	\N	100
2745	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2738	\N	8	NA	\N	\N	\N	\N	\N	400
2746	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2745	\N	8	0	\N	\N	\N	\N	\N	100
2747	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2738	\N	8	Condición NA	\N	\N	\N	\N	\N	500
2748	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2736	\N	8	80% de madres pueden explicar al menos 2 beneficios de la movilización durante la labor de parto.	\N	\N	\N	\N	\N	200
2749	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2748	\N	8	metadata	\N	\N	\N	\N	\N	100
2750	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2749	\N	8	Puntaje	\N	\N	\N	\N	\N	100
2751	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2750	\N	8	1	\N	\N	\N	\N	\N	100
2752	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2749	\N	8	Verificador	\N	\N	\N	\N	\N	200
2753	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2752	\N	8	P.3.b2 EM	\N	\N	\N	\N	\N	100
2754	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2749	\N	8	Obligatorio	\N	\N	\N	\N	\N	300
2755	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2754	\N	8	0	\N	\N	\N	\N	\N	100
2756	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2749	\N	8	NA	\N	\N	\N	\N	\N	400
2757	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2756	\N	8	0	\N	\N	\N	\N	\N	100
2758	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2749	\N	8	Condición NA	\N	\N	\N	\N	\N	500
2759	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2714	\N	8	e) Ofrecer y permitir que las mujeres asuman la posición de su elección para dar a luz a no ser que exista una restricción específica y se le explique la razón.	\N	\N	\N	\N	\N	300
2760	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2759	\N	8	80% de madres a quienes se les ofreció elegir la posición de su elección durante el parto.	\N	\N	\N	\N	\N	100
2761	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2760	\N	8	metadata	\N	\N	\N	\N	\N	100
2762	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2761	\N	8	Puntaje	\N	\N	\N	\N	\N	100
2763	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2762	\N	8	1	\N	\N	\N	\N	\N	100
2764	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2761	\N	8	Verificador	\N	\N	\N	\N	\N	200
2765	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2764	\N	8	P.3.c1 EM	\N	\N	\N	\N	\N	100
2766	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2761	\N	8	Obligatorio	\N	\N	\N	\N	\N	300
2767	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2766	\N	8	0	\N	\N	\N	\N	\N	100
2768	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2761	\N	8	NA	\N	\N	\N	\N	\N	400
2769	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2768	\N	8	0	\N	\N	\N	\N	\N	100
2770	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2761	\N	8	Condición NA	\N	\N	\N	\N	\N	500
2771	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2759	\N	8	80% de madres a quienes se les ofreció y manifestaron su deseo de elegir la posición de su elección durante el parto manifiestan que se les permitió adoptar dicha posición.	\N	\N	\N	\N	\N	200
2772	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2771	\N	8	metadata	\N	\N	\N	\N	\N	100
2773	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2772	\N	8	Puntaje	\N	\N	\N	\N	\N	100
2774	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2773	\N	8	1	\N	\N	\N	\N	\N	100
2775	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2772	\N	8	Verificador	\N	\N	\N	\N	\N	200
2776	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2775	\N	8	P.3.c2 EM	\N	\N	\N	\N	\N	100
2777	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2772	\N	8	Obligatorio	\N	\N	\N	\N	\N	300
2778	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2777	\N	8	0	\N	\N	\N	\N	\N	100
2779	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2772	\N	8	NA	\N	\N	\N	\N	\N	400
2780	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2779	\N	8	0	\N	\N	\N	\N	\N	100
2781	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2772	\N	8	Condición NA	\N	\N	\N	\N	\N	500
2782	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2714	\N	8	g) Capacitar al personal de salud para que atienda partos en libre posición.	\N	\N	\N	\N	\N	400
2783	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2782	\N	8	80% del personal que atiende partos ha sido capacitados para atender partos en libre posición	\N	\N	\N	\N	\N	100
2784	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2783	\N	8	metadata	\N	\N	\N	\N	\N	100
2785	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2784	\N	8	Puntaje	\N	\N	\N	\N	\N	100
2786	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2785	\N	8	2	\N	\N	\N	\N	\N	100
2787	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2784	\N	8	Verificador	\N	\N	\N	\N	\N	200
2788	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2787	\N	8	P.3.d EP	\N	\N	\N	\N	\N	100
2789	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2784	\N	8	Obligatorio	\N	\N	\N	\N	\N	300
2790	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2789	\N	8	0	\N	\N	\N	\N	\N	100
2791	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2784	\N	8	NA	\N	\N	\N	\N	\N	400
2792	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2791	\N	8	0	\N	\N	\N	\N	\N	100
2793	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2784	\N	8	Condición NA	\N	\N	\N	\N	\N	500
2794	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2606	\N	8	Proporcionar métodos para la comodidad de la gestante y alivio del dolor durante el trabajo de parto considerando el uso de métodos no farmacológicos	\N	\N	\N	\N	\N	400
2795	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2794	\N	8	a) Ofrecer métodos no farmacológicos para el manejo del dolor según la normativa vigente de educación prenatal;	\N	\N	\N	\N	\N	100
2796	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2795	\N	8	80% de las madres informan que el personal les mencionó al menos una forma de calmar el dolor y estar más cómodas durante el trabajo de parto y se respetó su decisión.	\N	\N	\N	\N	\N	100
2797	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2796	\N	8	metadata	\N	\N	\N	\N	\N	100
2798	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2797	\N	8	Puntaje	\N	\N	\N	\N	\N	100
2799	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2798	\N	8	1	\N	\N	\N	\N	\N	100
2800	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2797	\N	8	Verificador	\N	\N	\N	\N	\N	200
2801	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2800	\N	8	P.4.a EM	\N	\N	\N	\N	\N	100
2802	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2797	\N	8	Obligatorio	\N	\N	\N	\N	\N	300
2803	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2802	\N	8	0	\N	\N	\N	\N	\N	100
2804	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2797	\N	8	NA	\N	\N	\N	\N	\N	400
2805	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2804	\N	8	0	\N	\N	\N	\N	\N	100
2806	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2797	\N	8	Condición NA	\N	\N	\N	\N	\N	500
2807	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2794	\N	8	b) Garantizar que el personal que atiende partos debe estar capacitado en manejo del dolor con métodos no farmacológicos	\N	\N	\N	\N	\N	200
2808	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2807	\N	8	80% del personal de salud del área obstétrica describe dos métodos no farmacológicos para manejo del dolor.	\N	\N	\N	\N	\N	100
2809	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2808	\N	8	metadata	\N	\N	\N	\N	\N	100
2810	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2809	\N	8	Puntaje	\N	\N	\N	\N	\N	100
2811	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2810	\N	8	1	\N	\N	\N	\N	\N	100
2812	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2809	\N	8	Verificador	\N	\N	\N	\N	\N	200
2813	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2812	\N	8	P.4.b EP	\N	\N	\N	\N	\N	100
2814	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2809	\N	8	Obligatorio	\N	\N	\N	\N	\N	300
2815	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2814	\N	8	0	\N	\N	\N	\N	\N	100
2816	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2809	\N	8	NA	\N	\N	\N	\N	\N	400
2817	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2816	\N	8	0	\N	\N	\N	\N	\N	100
2818	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2809	\N	8	Condición NA	\N	\N	\N	\N	\N	500
2819	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2807	\N	8	80% del personal de salud sensibilizado en manejo del dolor con métodos no farmacológicos.	\N	\N	\N	\N	\N	200
2820	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2819	\N	8	metadata	\N	\N	\N	\N	\N	100
2821	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2820	\N	8	Puntaje	\N	\N	\N	\N	\N	100
2822	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2821	\N	8	1	\N	\N	\N	\N	\N	100
2823	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2820	\N	8	Verificador	\N	\N	\N	\N	\N	200
2824	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2823	\N	8	P.4.b informe	\N	\N	\N	\N	\N	100
2825	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2820	\N	8	Obligatorio	\N	\N	\N	\N	\N	300
2826	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2825	\N	8	0	\N	\N	\N	\N	\N	100
2827	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2820	\N	8	NA	\N	\N	\N	\N	\N	400
2828	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2827	\N	8	0	\N	\N	\N	\N	\N	100
2829	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2820	\N	8	Condición NA	\N	\N	\N	\N	\N	500
2830	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2606	\N	8	Evitar procedimientos invasivos y cesáreas	\N	\N	\N	\N	\N	500
2831	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2830	\N	8	a) Evitar procedimientos invasivos a no ser que estén clínicamente indicadas por la complicación de la madre y/o del niño y se le explique la razón.	\N	\N	\N	\N	\N	100
2832	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2831	\N	8	80% del personal de salud cita 3 procedimientos que no deben utilizarse en el parto a menos que se requiera debido a complicaciones.	\N	\N	\N	\N	\N	100
2833	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2832	\N	8	metadata	\N	\N	\N	\N	\N	100
2834	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2833	\N	8	Puntaje	\N	\N	\N	\N	\N	100
2835	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2834	\N	8	2	\N	\N	\N	\N	\N	100
2836	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2833	\N	8	Verificador	\N	\N	\N	\N	\N	200
2837	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2836	\N	8	P.5.a	\N	\N	\N	\N	\N	100
2838	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2833	\N	8	Obligatorio	\N	\N	\N	\N	\N	300
2839	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2838	\N	8	0	\N	\N	\N	\N	\N	100
2840	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2833	\N	8	NA	\N	\N	\N	\N	\N	400
2841	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2840	\N	8	0	\N	\N	\N	\N	\N	100
2842	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2833	\N	8	Condición NA	\N	\N	\N	\N	\N	500
2843	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2831	\N	8	100% de los procedimientos invasivos tienen justificación médica.	\N	\N	\N	\N	\N	200
2844	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2843	\N	8	metadata	\N	\N	\N	\N	\N	100
2845	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2844	\N	8	Puntaje	\N	\N	\N	\N	\N	100
2846	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2845	\N	8	3	\N	\N	\N	\N	\N	100
2847	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2844	\N	8	Verificador	\N	\N	\N	\N	\N	200
2848	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2847	\N	8	P.5.a HC	\N	\N	\N	\N	\N	100
2849	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2844	\N	8	Obligatorio	\N	\N	\N	\N	\N	300
2850	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2849	\N	8	1	\N	\N	\N	\N	\N	100
2851	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2844	\N	8	NA	\N	\N	\N	\N	\N	400
2852	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2851	\N	8	0	\N	\N	\N	\N	\N	100
2853	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2844	\N	8	Condición NA	\N	\N	\N	\N	\N	500
2854	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2831	\N	8	80% de madres manifiesta que no se les realizó procedimientos invasivos innecesarios a menos de que haya existido una justificación clínica.	\N	\N	\N	\N	\N	300
2855	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2854	\N	8	metadata	\N	\N	\N	\N	\N	100
2856	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2855	\N	8	Puntaje	\N	\N	\N	\N	\N	100
2857	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2856	\N	8	2	\N	\N	\N	\N	\N	100
2858	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2855	\N	8	Verificador	\N	\N	\N	\N	\N	200
2859	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2858	\N	8	P.5.a EM	\N	\N	\N	\N	\N	100
2860	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2855	\N	8	Obligatorio	\N	\N	\N	\N	\N	300
2861	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2860	\N	8	0	\N	\N	\N	\N	\N	100
2862	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2855	\N	8	NA	\N	\N	\N	\N	\N	400
2863	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2862	\N	8	0	\N	\N	\N	\N	\N	100
2864	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2855	\N	8	Condición NA	\N	\N	\N	\N	\N	500
2865	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2830	\N	8	b) Asegurar el cumplimiento de los lineamientos para la racionalización de cesáreas	\N	\N	\N	\N	\N	200
2866	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2865	\N	8	100% de cesáreas son realizadas con pertinencia.	\N	\N	\N	\N	\N	100
2867	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2866	\N	8	metadata	\N	\N	\N	\N	\N	100
2868	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2867	\N	8	Puntaje	\N	\N	\N	\N	\N	100
2869	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2868	\N	8	3	\N	\N	\N	\N	\N	100
2870	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2867	\N	8	Verificador	\N	\N	\N	\N	\N	200
2871	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2870	\N	8	P.5.b HC 	\N	\N	\N	\N	\N	100
2872	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2867	\N	8	Obligatorio	\N	\N	\N	\N	\N	300
2873	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2872	\N	8	0	\N	\N	\N	\N	\N	100
2874	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2867	\N	8	NA	\N	\N	\N	\N	\N	400
2875	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2874	\N	8	1	\N	\N	\N	\N	\N	100
2876	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2867	\N	8	Condición NA	\N	\N	\N	\N	\N	500
2877	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2876	\N	8	si el establecimiento no atiende cesáreas	\N	\N	\N	\N	\N	100
2878	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2830	\N	8	c) En caso de gestante VIH positiva, garantizar el parto por cesárea según norma	\N	\N	\N	\N	\N	300
2879	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2878	\N	8	100% de madres VIH positivo con parto por cesárea a excepción de las madres que lleguen en fase expulsiva.	\N	\N	\N	\N	\N	100
2880	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2879	\N	8	metadata	\N	\N	\N	\N	\N	100
2881	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2880	\N	8	Puntaje	\N	\N	\N	\N	\N	100
2882	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2881	\N	8	3	\N	\N	\N	\N	\N	100
2883	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2880	\N	8	Verificador	\N	\N	\N	\N	\N	200
2884	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2883	\N	8	P.5.c HC 	\N	\N	\N	\N	\N	100
2885	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2880	\N	8	Obligatorio	\N	\N	\N	\N	\N	300
2886	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2885	\N	8	0	\N	\N	\N	\N	\N	100
2887	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2880	\N	8	NA	\N	\N	\N	\N	\N	400
2888	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2887	\N	8	1	\N	\N	\N	\N	\N	100
2889	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2880	\N	8	Condición NA	\N	\N	\N	\N	\N	500
2890	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2889	\N	8	si el establecimiento no ha atendido madres VIH positivo	\N	\N	\N	\N	\N	100
2891	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2606	\N	8	Garantizar las prácticas integradas a la atención del parto	\N	\N	\N	\N	\N	600
2892	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2891	\N	8	a) Garantizar el contacto piel a piel inmediato de las madres con sus hijos  para proporcionar abrigo y apego, salvo restricción especifica por el estado de salud de la madre y/o el recién nacido. Los partos por cesárea con anestesia local o general no son una restricción para esta práctica.	\N	\N	\N	\N	\N	100
2893	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2892	\N	8	80% de madres con parto vaginal informa que colocaron a su bebé en contacto hasta en los cinco minutos después del nacimiento por al menos una hora salvo que la madre no lo desee.	\N	\N	\N	\N	\N	100
2894	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2893	\N	8	metadata	\N	\N	\N	\N	\N	100
2895	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2894	\N	8	Puntaje	\N	\N	\N	\N	\N	100
2896	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2895	\N	8	3	\N	\N	\N	\N	\N	100
2897	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2894	\N	8	Verificador	\N	\N	\N	\N	\N	200
2898	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2897	\N	8	P.6.a EM	\N	\N	\N	\N	\N	100
2899	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2894	\N	8	Obligatorio	\N	\N	\N	\N	\N	300
2900	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2899	\N	8	0	\N	\N	\N	\N	\N	100
2901	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2894	\N	8	NA	\N	\N	\N	\N	\N	400
2902	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2901	\N	8	0	\N	\N	\N	\N	\N	100
2903	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2894	\N	8	Condición NA	\N	\N	\N	\N	\N	500
2904	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2892	\N	8	80% de partos vaginales, se observa  que los bebés son colocados en contacto piel a piel con las madres  en los 5 minutos después del nacimiento salvo que la madre no lo desee.	\N	\N	\N	\N	\N	200
2905	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2904	\N	8	metadata	\N	\N	\N	\N	\N	100
2906	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2905	\N	8	Puntaje	\N	\N	\N	\N	\N	100
2907	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2906	\N	8	3	\N	\N	\N	\N	\N	100
2908	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2905	\N	8	Verificador	\N	\N	\N	\N	\N	200
2909	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2908	\N	8	P.6.a Ob	\N	\N	\N	\N	\N	100
2910	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2905	\N	8	Obligatorio	\N	\N	\N	\N	\N	300
2911	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2910	\N	8	1	\N	\N	\N	\N	\N	100
2912	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2905	\N	8	NA	\N	\N	\N	\N	\N	400
2913	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2912	\N	8	0	\N	\N	\N	\N	\N	100
2914	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2905	\N	8	Condición NA	\N	\N	\N	\N	\N	500
2915	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2892	\N	8	80% de madres con cesárea sin anestesia general,   informa que colocaron a su bebé en contacto piel a piel, hasta 5 minutos después del parto y por lo menos una hora salvo razones médicamente justificadas para retrasar el contacto o la madre no lo desee.	\N	\N	\N	\N	\N	300
2916	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2915	\N	8	metadata	\N	\N	\N	\N	\N	100
2917	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2916	\N	8	Puntaje	\N	\N	\N	\N	\N	100
2918	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2917	\N	8	3	\N	\N	\N	\N	\N	100
2919	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2916	\N	8	Verificador	\N	\N	\N	\N	\N	200
2920	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2919	\N	8	P.6.a1 EM	\N	\N	\N	\N	\N	100
2921	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2916	\N	8	Obligatorio	\N	\N	\N	\N	\N	300
2922	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2921	\N	8	0	\N	\N	\N	\N	\N	100
2923	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2916	\N	8	NA	\N	\N	\N	\N	\N	400
2924	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2923	\N	8	1	\N	\N	\N	\N	\N	100
2925	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2916	\N	8	Condición NA	\N	\N	\N	\N	\N	500
2926	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2925	\N	8	si no se atienden cesáreas en el establecimiento	\N	\N	\N	\N	\N	100
3080	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3079	\N	8	2	\N	\N	\N	\N	\N	100
3081	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3078	\N	8	Verificador	\N	\N	\N	\N	\N	200
2927	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2892	\N	8	80% de madres con parto por cesárea con anestesia general informa que colocaron a su bebé en contacto piel a piel tan pronto las madres despertaron y estuvieron alertas, salvo razones médicamente justificadas para retrasar el contacto o la madre no lo desee.	\N	\N	\N	\N	\N	400
2928	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2927	\N	8	metadata	\N	\N	\N	\N	\N	100
2929	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2928	\N	8	Puntaje	\N	\N	\N	\N	\N	100
2930	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2929	\N	8	3	\N	\N	\N	\N	\N	100
2931	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2928	\N	8	Verificador	\N	\N	\N	\N	\N	200
2932	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2931	\N	8	P.6.a2 EM	\N	\N	\N	\N	\N	100
2933	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2928	\N	8	Obligatorio	\N	\N	\N	\N	\N	300
2934	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2933	\N	8	0	\N	\N	\N	\N	\N	100
2935	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2928	\N	8	NA	\N	\N	\N	\N	\N	400
2936	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2935	\N	8	1	\N	\N	\N	\N	\N	100
2937	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2928	\N	8	Condición NA	\N	\N	\N	\N	\N	500
2938	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2937	\N	8	si no se atienden cesáreas con anestesia general en el establecimiento	\N	\N	\N	\N	\N	100
2939	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2891	\N	8	b) Garantizar la puesta al pecho en la primera media hora a no ser que exista una restricción por el estado de salud de la madre y/o el recién nacido;	\N	\N	\N	\N	\N	200
2940	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2939	\N	8	80% madres informan que iniciaron la lactancia materna en la primera hora posterior al nacimiento, salvo que exista contraindicación para la lactancia o la madre no lo desee	\N	\N	\N	\N	\N	100
2941	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2940	\N	8	metadata	\N	\N	\N	\N	\N	100
2942	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2941	\N	8	Puntaje	\N	\N	\N	\N	\N	100
2943	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2942	\N	8	3	\N	\N	\N	\N	\N	100
2944	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2941	\N	8	Verificador	\N	\N	\N	\N	\N	200
2945	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2944	\N	8	P.6.b EM	\N	\N	\N	\N	\N	100
2946	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2941	\N	8	Obligatorio	\N	\N	\N	\N	\N	300
2947	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2946	\N	8	1	\N	\N	\N	\N	\N	100
2948	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2941	\N	8	NA	\N	\N	\N	\N	\N	400
2949	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2948	\N	8	0	\N	\N	\N	\N	\N	100
2950	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2941	\N	8	Condición NA	\N	\N	\N	\N	\N	500
2951	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2891	\N	8	c) Garantizar el pinzamiento y corte oportuno del cordón umbilical, a no ser que exista una restricción especifica por el estado de salud de la madre y/o el recién nacido y se informen las razones	\N	\N	\N	\N	\N	300
2952	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2951	\N	8	100% de partos que registran pinzamiento oportuno del cordón umbilical a no ser que exista una restricción específica.	\N	\N	\N	\N	\N	100
2953	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2952	\N	8	metadata	\N	\N	\N	\N	\N	100
2954	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2953	\N	8	Puntaje	\N	\N	\N	\N	\N	100
2955	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2954	\N	8	3	\N	\N	\N	\N	\N	100
2956	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2953	\N	8	Verificador	\N	\N	\N	\N	\N	200
2957	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2956	\N	8	P.6.c 051	\N	\N	\N	\N	\N	100
2958	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2953	\N	8	Obligatorio	\N	\N	\N	\N	\N	300
2959	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2958	\N	8	1	\N	\N	\N	\N	\N	100
2960	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2953	\N	8	NA	\N	\N	\N	\N	\N	400
2961	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2960	\N	8	0	\N	\N	\N	\N	\N	100
2962	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2953	\N	8	Condición NA	\N	\N	\N	\N	\N	500
2963	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2951	\N	8	100% del personal de salud del área obstétrica describe los fundamentos y el procedimiento del pinzamiento oportuno del cordón umbilical.	\N	\N	\N	\N	\N	200
2964	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2963	\N	8	metadata	\N	\N	\N	\N	\N	100
2965	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2964	\N	8	Puntaje	\N	\N	\N	\N	\N	100
2966	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2965	\N	8	1	\N	\N	\N	\N	\N	100
2967	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2964	\N	8	Verificador	\N	\N	\N	\N	\N	200
2968	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2967	\N	8	P.6.c EP	\N	\N	\N	\N	\N	100
2969	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2964	\N	8	Obligatorio	\N	\N	\N	\N	\N	300
2970	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2969	\N	8	0	\N	\N	\N	\N	\N	100
2971	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2964	\N	8	NA	\N	\N	\N	\N	\N	400
2972	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2971	\N	8	0	\N	\N	\N	\N	\N	100
2973	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2964	\N	8	Condición NA	\N	\N	\N	\N	\N	500
2974	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2606	\N	8	Realizar los procedimientos habituales del recién nacido frente a la madre	\N	\N	\N	\N	\N	700
2975	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2974	\N	8	a) Informar a la madre sobre los procedimientos a realizar al recién nacido;	\N	\N	\N	\N	\N	100
2976	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2975	\N	8	80% de las madres  informan que el personal de salud le explicó sobre los procedimientos que le realizaron al recién nacido.	\N	\N	\N	\N	\N	100
2977	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2976	\N	8	metadata	\N	\N	\N	\N	\N	100
2978	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2977	\N	8	Puntaje	\N	\N	\N	\N	\N	100
2979	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2978	\N	8	1	\N	\N	\N	\N	\N	100
2980	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2977	\N	8	Verificador	\N	\N	\N	\N	\N	200
2981	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2980	\N	8	P.7.a EM	\N	\N	\N	\N	\N	100
2982	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2977	\N	8	Obligatorio	\N	\N	\N	\N	\N	300
2983	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2982	\N	8	0	\N	\N	\N	\N	\N	100
2984	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2977	\N	8	NA	\N	\N	\N	\N	\N	400
2985	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2984	\N	8	0	\N	\N	\N	\N	\N	100
2986	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2977	\N	8	Condición NA	\N	\N	\N	\N	\N	500
2987	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2974	\N	8	b) Realizar procedimientos como antropometría, profilaxis ocular y administración de vitamina K frente a la madre.	\N	\N	\N	\N	\N	200
2988	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2987	\N	8	80% de las madres informan que el personal realizó la antropometría, profilaxis ocular, y administración de vitamina K, después de la primera hora y frente a ella madre.	\N	\N	\N	\N	\N	100
2989	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2988	\N	8	metadata	\N	\N	\N	\N	\N	100
2990	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2989	\N	8	Puntaje	\N	\N	\N	\N	\N	100
2991	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2990	\N	8	1	\N	\N	\N	\N	\N	100
2992	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2989	\N	8	Verificador	\N	\N	\N	\N	\N	200
2993	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2992	\N	8	P.7.b EM	\N	\N	\N	\N	\N	100
2994	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2989	\N	8	Obligatorio	\N	\N	\N	\N	\N	300
2995	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2994	\N	8	0	\N	\N	\N	\N	\N	100
2996	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2989	\N	8	NA	\N	\N	\N	\N	\N	400
2997	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2996	\N	8	0	\N	\N	\N	\N	\N	100
2998	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2989	\N	8	Condición NA	\N	\N	\N	\N	\N	500
2999	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2606	\N	8	Aplicar los instrumentos estandarizados para la estratificación de riesgos y cumplir con el manejo estandarizado de complicaciones que amenazan la vida de la madre y del recién nacido	\N	\N	\N	\N	\N	800
3000	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2999	\N	8	a) Capacitar e implementar los instrumentos estandarizados para la estratificación de riesgos y de complicaciones que amenazan la vida de la madre y del recién nacido;	\N	\N	\N	\N	\N	100
3082	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3081	\N	8	P.10.a EM	\N	\N	\N	\N	\N	100
3001	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3000	\N	8	80% del personal de salud del área obstétrica capacitado en el manejo estandarizado de complicaciones que amenazan la vida de la madre y del recién nacido.	\N	\N	\N	\N	\N	100
3002	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3001	\N	8	metadata	\N	\N	\N	\N	\N	100
3003	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3002	\N	8	Puntaje	\N	\N	\N	\N	\N	100
3004	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3003	\N	8	3	\N	\N	\N	\N	\N	100
3005	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3002	\N	8	Verificador	\N	\N	\N	\N	\N	200
3006	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3005	\N	8	P.8.a informe	\N	\N	\N	\N	\N	100
3007	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3002	\N	8	Obligatorio	\N	\N	\N	\N	\N	300
3008	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3007	\N	8	0	\N	\N	\N	\N	\N	100
3009	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3002	\N	8	NA	\N	\N	\N	\N	\N	400
3010	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3009	\N	8	0	\N	\N	\N	\N	\N	100
3011	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3002	\N	8	Condición NA	\N	\N	\N	\N	\N	500
3012	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2999	\N	8	b) Asegurar que el personal tenga el entrenamiento adecuado y continuo en destrezas de emergencias obstétricas y neonatales.	\N	\N	\N	\N	\N	200
3013	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3012	\N	8	80% del personal de salud del área obstétrica conoce el manejo estandarizado de complicaciones que amenazan la vida de la madre y del recién nacido.	\N	\N	\N	\N	\N	100
3014	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3013	\N	8	metadata	\N	\N	\N	\N	\N	100
3015	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3014	\N	8	Puntaje	\N	\N	\N	\N	\N	100
3016	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3015	\N	8	3	\N	\N	\N	\N	\N	100
3017	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3014	\N	8	Verificador	\N	\N	\N	\N	\N	200
3018	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3017	\N	8	P.8.b EP	\N	\N	\N	\N	\N	100
3019	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3014	\N	8	Obligatorio	\N	\N	\N	\N	\N	300
3020	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3019	\N	8	1	\N	\N	\N	\N	\N	100
3021	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3014	\N	8	NA	\N	\N	\N	\N	\N	400
3022	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3021	\N	8	0	\N	\N	\N	\N	\N	100
3023	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3014	\N	8	Condición NA	\N	\N	\N	\N	\N	500
3024	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2606	\N	8	Permitir y promover el contacto de la madre y padre con el recién nacido, así como proveer la información sobre la evolución de recién nacidos que requieran internación	\N	\N	\N	\N	\N	900
3025	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3024	\N	8	a) Garantizar el libre acceso de la madre y/o padre a neonatología a excepción de que se realicen procedimientos médicos;	\N	\N	\N	\N	\N	100
3026	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3025	\N	8	80% de las madres refieren tener libre acceso al servicio de neonatología.	\N	\N	\N	\N	\N	100
3027	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3026	\N	8	metadata	\N	\N	\N	\N	\N	100
3028	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3027	\N	8	Puntaje	\N	\N	\N	\N	\N	100
3029	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3028	\N	8	2	\N	\N	\N	\N	\N	100
3030	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3027	\N	8	Verificador	\N	\N	\N	\N	\N	200
3031	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3030	\N	8	P.9.a EM	\N	\N	\N	\N	\N	100
3032	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3027	\N	8	Obligatorio	\N	\N	\N	\N	\N	300
3033	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3032	\N	8	0	\N	\N	\N	\N	\N	100
3034	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3027	\N	8	NA	\N	\N	\N	\N	\N	400
3035	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3034	\N	8	1	\N	\N	\N	\N	\N	100
3036	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3027	\N	8	Condición NA	\N	\N	\N	\N	\N	500
3037	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3036	\N	8	si el establecimiento no tiene servicio de neonatología	\N	\N	\N	\N	\N	100
3038	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3024	\N	8	b) Promover y facilitar la alimentación del recién nacido con leche materna;	\N	\N	\N	\N	\N	200
3039	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3038	\N	8	80% de recién nacidos hospitalizados son alimentados exclusivamente con leche materna.	\N	\N	\N	\N	\N	100
3040	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3039	\N	8	metadata	\N	\N	\N	\N	\N	100
3041	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3040	\N	8	Puntaje	\N	\N	\N	\N	\N	100
3042	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3041	\N	8	2	\N	\N	\N	\N	\N	100
3043	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3040	\N	8	Verificador	\N	\N	\N	\N	\N	200
3044	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3043	\N	8	P.9.b HC	\N	\N	\N	\N	\N	100
3045	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3040	\N	8	Obligatorio	\N	\N	\N	\N	\N	300
3046	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3045	\N	8	0	\N	\N	\N	\N	\N	100
3047	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3040	\N	8	NA	\N	\N	\N	\N	\N	400
3048	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3047	\N	8	1	\N	\N	\N	\N	\N	100
3049	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3040	\N	8	Condición NA	\N	\N	\N	\N	\N	500
3050	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3049	\N	8	si el establecimiento no tiene servicio de neonatología	\N	\N	\N	\N	\N	100
3051	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3024	\N	8	c) Brindar información sobre la evolución del recién nacido toda vez que padre o madre lo requieran.	\N	\N	\N	\N	\N	300
3052	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3051	\N	8	El 100% de madres refieren haber sido informadas sobre la evolución del recién nacido toda vez que el padre o la madre así lo requieran.	\N	\N	\N	\N	\N	100
3053	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3052	\N	8	metadata	\N	\N	\N	\N	\N	100
3054	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3053	\N	8	Puntaje	\N	\N	\N	\N	\N	100
3055	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3054	\N	8	2	\N	\N	\N	\N	\N	100
3056	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3053	\N	8	Verificador	\N	\N	\N	\N	\N	200
3057	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3056	\N	8	P.9.c EM	\N	\N	\N	\N	\N	100
3058	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3053	\N	8	Obligatorio	\N	\N	\N	\N	\N	300
3059	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3058	\N	8	0	\N	\N	\N	\N	\N	100
3060	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3053	\N	8	NA	\N	\N	\N	\N	\N	400
3061	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3060	\N	8	1	\N	\N	\N	\N	\N	100
3062	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3053	\N	8	Condición NA	\N	\N	\N	\N	\N	500
3063	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3062	\N	8	si el establecimiento no tiene servicio de neonatología	\N	\N	\N	\N	\N	100
3064	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2606	\N	8	Garantizar el alta de calidad y culturalmente pertinente conforme al estado de salud de la madre y el recién nacido 	\N	\N	\N	\N	\N	1000
3065	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3064	\N	8	a) Asesorar sobre métodos de planificación familiar, y proveer o garantizar el acceso de acuerdo a la solicitud de la madre.	\N	\N	\N	\N	\N	100
3066	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3065	\N	8	100% de madres informadas sobre métodos anticonceptivos.	\N	\N	\N	\N	\N	100
3067	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3066	\N	8	metadata	\N	\N	\N	\N	\N	100
3068	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3067	\N	8	Puntaje	\N	\N	\N	\N	\N	100
3069	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3068	\N	8	3	\N	\N	\N	\N	\N	100
3070	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3067	\N	8	Verificador	\N	\N	\N	\N	\N	200
3071	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3070	\N	8	P.10.a 051	\N	\N	\N	\N	\N	100
3072	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3067	\N	8	Obligatorio	\N	\N	\N	\N	\N	300
3073	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3072	\N	8	1	\N	\N	\N	\N	\N	100
3074	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3067	\N	8	NA	\N	\N	\N	\N	\N	400
3075	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3074	\N	8	0	\N	\N	\N	\N	\N	100
3076	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3067	\N	8	Condición NA	\N	\N	\N	\N	\N	500
3077	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3065	\N	8	80% de madres que optan por un método anticonceptivo acceden a él.	\N	\N	\N	\N	\N	200
3078	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3077	\N	8	metadata	\N	\N	\N	\N	\N	100
3079	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3078	\N	8	Puntaje	\N	\N	\N	\N	\N	100
3083	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3078	\N	8	Obligatorio	\N	\N	\N	\N	\N	300
3084	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3083	\N	8	0	\N	\N	\N	\N	\N	100
3085	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3078	\N	8	NA	\N	\N	\N	\N	\N	400
3086	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3085	\N	8	0	\N	\N	\N	\N	\N	100
3087	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3078	\N	8	Condición NA	\N	\N	\N	\N	\N	500
3088	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3064	\N	8	b) Informar sobre cuidados y signos de alarma de la madre y del recién nacido;	\N	\N	\N	\N	\N	200
3089	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3088	\N	8	80% de madres reciben información y mencionan al menos dos signos de alarma para ella y su hijo.	\N	\N	\N	\N	\N	100
3090	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3089	\N	8	metadata	\N	\N	\N	\N	\N	100
3091	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3090	\N	8	Puntaje	\N	\N	\N	\N	\N	100
3092	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3091	\N	8	2	\N	\N	\N	\N	\N	100
3093	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3090	\N	8	Verificador	\N	\N	\N	\N	\N	200
3094	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3093	\N	8	P.10.b.1 EM	\N	\N	\N	\N	\N	100
3095	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3090	\N	8	Obligatorio	\N	\N	\N	\N	\N	300
3096	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3095	\N	8	1	\N	\N	\N	\N	\N	100
3097	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3090	\N	8	NA	\N	\N	\N	\N	\N	400
3098	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3097	\N	8	0	\N	\N	\N	\N	\N	100
3099	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3090	\N	8	Condición NA	\N	\N	\N	\N	\N	500
3100	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3088	\N	8	80% del personal de salud mencionan al menos dos signos de alarma para madre e hijo.	\N	\N	\N	\N	\N	200
3101	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3100	\N	8	metadata	\N	\N	\N	\N	\N	100
3102	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3101	\N	8	Puntaje	\N	\N	\N	\N	\N	100
3103	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3102	\N	8	2	\N	\N	\N	\N	\N	100
3104	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3101	\N	8	Verificador	\N	\N	\N	\N	\N	200
3105	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3104	\N	8	P.10.b.2 EP	\N	\N	\N	\N	\N	100
3106	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3101	\N	8	Obligatorio	\N	\N	\N	\N	\N	300
3107	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3106	\N	8	1	\N	\N	\N	\N	\N	100
3108	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3101	\N	8	NA	\N	\N	\N	\N	\N	400
3109	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3108	\N	8	0	\N	\N	\N	\N	\N	100
3110	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3101	\N	8	Condición NA	\N	\N	\N	\N	\N	500
3111	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3088	\N	8	100% de recién nacidos están correctamente identificados por manilla o brazalete	\N	\N	\N	\N	\N	300
3112	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3111	\N	8	metadata	\N	\N	\N	\N	\N	100
3113	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3112	\N	8	Puntaje	\N	\N	\N	\N	\N	100
3114	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3113	\N	8	1	\N	\N	\N	\N	\N	100
3115	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3112	\N	8	Verificador	\N	\N	\N	\N	\N	200
3116	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3115	\N	8	P.10.b.3 EM	\N	\N	\N	\N	\N	100
3117	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3112	\N	8	Obligatorio	\N	\N	\N	\N	\N	300
3118	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3117	\N	8	0	\N	\N	\N	\N	\N	100
3119	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3112	\N	8	NA	\N	\N	\N	\N	\N	400
3120	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3119	\N	8	0	\N	\N	\N	\N	\N	100
3121	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3112	\N	8	Condición NA	\N	\N	\N	\N	\N	500
3122	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3064	\N	8	d) Concertar fecha y hora del primer control de la madre y del recién nacido.	\N	\N	\N	\N	\N	300
3123	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3122	\N	8	80% de las madres que egresan del establecimiento de salud cuentan con una cita en la primera semana del alta para ella y su bebé.	\N	\N	\N	\N	\N	100
3124	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3123	\N	8	metadata	\N	\N	\N	\N	\N	100
3125	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3124	\N	8	Puntaje	\N	\N	\N	\N	\N	100
3126	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3125	\N	8	1	\N	\N	\N	\N	\N	100
3127	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3124	\N	8	Verificador	\N	\N	\N	\N	\N	200
3128	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3127	\N	8	P.10.c EM	\N	\N	\N	\N	\N	100
3129	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3124	\N	8	Obligatorio	\N	\N	\N	\N	\N	300
3130	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3129	\N	8	0	\N	\N	\N	\N	\N	100
3131	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3124	\N	8	NA	\N	\N	\N	\N	\N	400
3132	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3131	\N	8	0	\N	\N	\N	\N	\N	100
3133	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3124	\N	8	Condición NA	\N	\N	\N	\N	\N	500
3134	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	8	Componente Lactancia Materna	\N	\N	\N	\N	\N	500
3135	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3134	\N	8	Informar a todas las embarazadas de los beneficios y manejo de la lactancia	\N	\N	\N	\N	\N	100
3136	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3135	\N	8	a) Brindar asesoría a las madres durante el período prenatal, parto y  postparto sobre: lactancia materna y prácticas que la favorecen, apego precoz; alojamiento conjunto, alimentación en caso de VIH, etc.	\N	\N	\N	\N	\N	100
3137	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3136	\N	8	80% de embarazadas en su tercer trimestre o al alta hospitalaria confirma que algún miembro del personal del establecimiento conversó con ellas acerca de los beneficios de la lactancia, y les ofreció una charla con información.	\N	\N	\N	\N	\N	100
3138	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3137	\N	8	metadata	\N	\N	\N	\N	\N	100
3139	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3138	\N	8	Puntaje	\N	\N	\N	\N	\N	100
3140	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3139	\N	8	3	\N	\N	\N	\N	\N	100
3141	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3138	\N	8	Verificador	\N	\N	\N	\N	\N	200
3142	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3141	\N	8	L.1.a EM	\N	\N	\N	\N	\N	100
3143	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3138	\N	8	Obligatorio	\N	\N	\N	\N	\N	300
3144	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3143	\N	8	0	\N	\N	\N	\N	\N	100
3145	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3138	\N	8	NA	\N	\N	\N	\N	\N	400
3146	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3145	\N	8	0	\N	\N	\N	\N	\N	100
3147	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3138	\N	8	Condición NA	\N	\N	\N	\N	\N	500
3148	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3134	\N	8	Ayudar a las madres a iniciar la lactancia durante la hora siguiente al parto	\N	\N	\N	\N	\N	200
3149	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3148	\N	8	a) El equipo de salud debe promover el amamantamiento en la sala de parto	\N	\N	\N	\N	\N	100
3150	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3149	\N	8	80% de madres manifiestan que le dio el seno por primera vez en la primera hora después del parto.	\N	\N	\N	\N	\N	100
3151	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3150	\N	8	metadata	\N	\N	\N	\N	\N	100
3152	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3151	\N	8	Puntaje	\N	\N	\N	\N	\N	100
3153	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3152	\N	8	3	\N	\N	\N	\N	\N	100
3154	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3151	\N	8	Verificador	\N	\N	\N	\N	\N	200
3155	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3154	\N	8	L.2.a EM	\N	\N	\N	\N	\N	100
3156	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3151	\N	8	Obligatorio	\N	\N	\N	\N	\N	300
3157	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3156	\N	8	1	\N	\N	\N	\N	\N	100
3158	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3151	\N	8	NA	\N	\N	\N	\N	\N	400
3159	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3158	\N	8	0	\N	\N	\N	\N	\N	100
3160	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3151	\N	8	Condición NA	\N	\N	\N	\N	\N	500
3161	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3134	\N	8	Mostrar a las madres cómo amamantar y cómo mantener la lactancia incluso en caso de separación de sus bebés	\N	\N	\N	\N	\N	300
3162	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3161	\N	8	a) El personal de salud debe mostrar a las madres cómo amamantar;	\N	\N	\N	\N	\N	100
3240	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3239	\N	8	L.4.a EM	\N	\N	\N	\N	\N	100
3241	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3236	\N	8	Obligatorio	\N	\N	\N	\N	\N	300
3163	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3162	\N	8	80% del personal clínico, informa que ha enseñado a la madre la manera correcta para colocar al recién nacido al pecho y la técnica de agarre.	\N	\N	\N	\N	\N	100
3164	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3163	\N	8	metadata	\N	\N	\N	\N	\N	100
3165	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3164	\N	8	Puntaje	\N	\N	\N	\N	\N	100
3166	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3165	\N	8	3	\N	\N	\N	\N	\N	100
3167	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3164	\N	8	Verificador	\N	\N	\N	\N	\N	200
3168	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3167	\N	8	L.3.a EP	\N	\N	\N	\N	\N	100
3169	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3164	\N	8	Obligatorio	\N	\N	\N	\N	\N	300
3170	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3169	\N	8	0	\N	\N	\N	\N	\N	100
3171	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3164	\N	8	NA	\N	\N	\N	\N	\N	400
3172	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3171	\N	8	0	\N	\N	\N	\N	\N	100
3173	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3164	\N	8	Condición NA	\N	\N	\N	\N	\N	500
3174	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3162	\N	8	80% de madres observadas amamantan según la técnica adecuada.	\N	\N	\N	\N	\N	200
3175	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3174	\N	8	metadata	\N	\N	\N	\N	\N	100
3176	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3175	\N	8	Puntaje	\N	\N	\N	\N	\N	100
3177	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3176	\N	8	2	\N	\N	\N	\N	\N	100
3178	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3175	\N	8	Verificador	\N	\N	\N	\N	\N	200
3179	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3178	\N	8	L.3.a Ob	\N	\N	\N	\N	\N	100
3180	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3175	\N	8	Obligatorio	\N	\N	\N	\N	\N	300
3181	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3180	\N	8	0	\N	\N	\N	\N	\N	100
3182	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3175	\N	8	NA	\N	\N	\N	\N	\N	400
3183	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3182	\N	8	0	\N	\N	\N	\N	\N	100
3184	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3175	\N	8	Condición NA	\N	\N	\N	\N	\N	500
3185	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3161	\N	8	b) En caso de separación obligatoria del recién nacido/a, se debe mostrar cómo mantener la lactancia enseñando la técnica adecuada de extracción de leche, informar sobre la posibilidad de donar leche humana y los beneficios para incrementar su producción;	\N	\N	\N	\N	\N	200
3186	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3185	\N	8	80% del personal encuestado conoce cómo mantener la lactancia enseñando la técnica adecuada de extracción de leche, informar sobre la posibilidad de donar leche humana y los beneficios para incrementar su producción	\N	\N	\N	\N	\N	100
3187	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3186	\N	8	metadata	\N	\N	\N	\N	\N	100
3188	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3187	\N	8	Puntaje	\N	\N	\N	\N	\N	100
3189	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3188	\N	8	3	\N	\N	\N	\N	\N	100
3190	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3187	\N	8	Verificador	\N	\N	\N	\N	\N	200
3191	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3190	\N	8	L.3.b EP	\N	\N	\N	\N	\N	100
3192	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3187	\N	8	Obligatorio	\N	\N	\N	\N	\N	300
3193	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3192	\N	8	1	\N	\N	\N	\N	\N	100
3194	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3187	\N	8	NA	\N	\N	\N	\N	\N	400
3195	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3194	\N	8	0	\N	\N	\N	\N	\N	100
3196	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3187	\N	8	Condición NA	\N	\N	\N	\N	\N	500
3197	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3185	\N	8	80% de madres que amamantan informa que el personal le brindó apoyo y capacitación en lactancia materna, y las técnicas correctas para una adecuada lactancia.	\N	\N	\N	\N	\N	200
3198	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3197	\N	8	metadata	\N	\N	\N	\N	\N	100
3199	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3198	\N	8	Puntaje	\N	\N	\N	\N	\N	100
3200	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3199	\N	8	3	\N	\N	\N	\N	\N	100
3201	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3198	\N	8	Verificador	\N	\N	\N	\N	\N	200
3202	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3201	\N	8	L.3.b Ob	\N	\N	\N	\N	\N	100
3203	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3198	\N	8	Obligatorio	\N	\N	\N	\N	\N	300
3204	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3203	\N	8	0	\N	\N	\N	\N	\N	100
3205	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3198	\N	8	NA	\N	\N	\N	\N	\N	400
3206	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3205	\N	8	0	\N	\N	\N	\N	\N	100
3207	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3198	\N	8	Condición NA	\N	\N	\N	\N	\N	500
3208	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3161	\N	8	c) Si la madre decide no amamantar, enseñarle cómo preparar y alimentar correctamente al bebé con sucedáneos de la leche materna;	\N	\N	\N	\N	\N	300
3209	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3208	\N	8	80% de las madres afirma que recibió una demonstración de la preparación de sucedáneos de la leche materna realizada por el personal del establecimiento de salud.	\N	\N	\N	\N	\N	100
3210	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3209	\N	8	metadata	\N	\N	\N	\N	\N	100
3211	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3210	\N	8	Puntaje	\N	\N	\N	\N	\N	100
3212	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3211	\N	8	2	\N	\N	\N	\N	\N	100
3213	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3210	\N	8	Verificador	\N	\N	\N	\N	\N	200
3214	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3213	\N	8	L.3.c EM	\N	\N	\N	\N	\N	100
3215	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3210	\N	8	Obligatorio	\N	\N	\N	\N	\N	300
3216	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3215	\N	8	0	\N	\N	\N	\N	\N	100
3217	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3210	\N	8	NA	\N	\N	\N	\N	\N	400
3218	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3217	\N	8	0	\N	\N	\N	\N	\N	100
3219	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3210	\N	8	Condición NA	\N	\N	\N	\N	\N	500
3220	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3161	\N	8	d) Mostrar a las madres VIH-positivas cómo preparar y dar el alimento, y cesar la producción de leche.	\N	\N	\N	\N	\N	400
3221	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3220	\N	8	80% de madres VIH positivo recibió información o demostración acerca de la correcta preparación de los sucedáneos de la leche materna y afirma ser capaz de preparar el alimento ella misma.	\N	\N	\N	\N	\N	100
3222	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3221	\N	8	metadata	\N	\N	\N	\N	\N	100
3223	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3222	\N	8	Puntaje	\N	\N	\N	\N	\N	100
3224	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3223	\N	8	3	\N	\N	\N	\N	\N	100
3225	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3222	\N	8	Verificador	\N	\N	\N	\N	\N	200
3226	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3225	\N	8	L.3.d EM	\N	\N	\N	\N	\N	100
3227	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3222	\N	8	Obligatorio	\N	\N	\N	\N	\N	300
3228	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3227	\N	8	0	\N	\N	\N	\N	\N	100
3229	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3222	\N	8	NA	\N	\N	\N	\N	\N	400
3230	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3229	\N	8	1	\N	\N	\N	\N	\N	100
3231	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3222	\N	8	Condición NA	\N	\N	\N	\N	\N	500
3232	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3231	\N	8	si el establecimiento marca 0 partos atendidos a madres VIH, Formulario de información del ES pegrunta 7	\N	\N	\N	\N	\N	100
3233	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3134	\N	8	No dar al recién nacido/a alimento o líquido que no sea leche materna a no ser que estén médicamente indicados	\N	\N	\N	\N	\N	400
3234	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3233	\N	8	a) Promover la lactancia materna como único alimento para el recién nacido.	\N	\N	\N	\N	\N	100
3235	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3234	\N	8	80% de las madres informa que el personal de salud no le ha recomendado la alimentación con sucedáneos de la leche para su bebé.	\N	\N	\N	\N	\N	100
3236	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3235	\N	8	metadata	\N	\N	\N	\N	\N	100
3237	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3236	\N	8	Puntaje	\N	\N	\N	\N	\N	100
3238	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3237	\N	8	3	\N	\N	\N	\N	\N	100
3239	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3236	\N	8	Verificador	\N	\N	\N	\N	\N	200
3242	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3241	\N	8	1	\N	\N	\N	\N	\N	100
3243	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3236	\N	8	NA	\N	\N	\N	\N	\N	400
3244	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3243	\N	8	0	\N	\N	\N	\N	\N	100
3245	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3236	\N	8	Condición NA	\N	\N	\N	\N	\N	500
3246	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3233	\N	8	b) En caso de que la madre decida no amamantar, analizar con la madre las alternativas de alimentación para ayudar a decidir lo más adecuado a su situación.	\N	\N	\N	\N	\N	200
3247	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3246	\N	8	80% de las madres que decidió no amamantar debe informar que el personal analizó con ellas las distintas alternativas de alimentación y les ayudó a decidir la más adecuada de  acuerdo a su situación.	\N	\N	\N	\N	\N	100
3248	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3247	\N	8	metadata	\N	\N	\N	\N	\N	100
3249	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3248	\N	8	Puntaje	\N	\N	\N	\N	\N	100
3250	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3249	\N	8	2	\N	\N	\N	\N	\N	100
3251	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3248	\N	8	Verificador	\N	\N	\N	\N	\N	200
3252	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3251	\N	8	L.4.b EM	\N	\N	\N	\N	\N	100
3253	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3248	\N	8	Obligatorio	\N	\N	\N	\N	\N	300
3254	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3253	\N	8	0	\N	\N	\N	\N	\N	100
3255	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3248	\N	8	NA	\N	\N	\N	\N	\N	400
3256	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3255	\N	8	0	\N	\N	\N	\N	\N	100
3257	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3248	\N	8	Condición NA	\N	\N	\N	\N	\N	500
3258	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3233	\N	8	c) Prohibir el uso de agua glucosada, suero oral y sucedáneos de leche materna para probar tolerancia.	\N	\N	\N	\N	\N	300
3338	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3337	\N	8	L.7.a EM	\N	\N	\N	\N	\N	100
3259	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3258	\N	8	80% de madres seleccionadas al azar, informa que sus bebés han recibido solamente leche materna. De haber recibido otro tipo de alimento, debe indicarse la razón médica prescrita.	\N	\N	\N	\N	\N	100
3260	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3259	\N	8	metadata	\N	\N	\N	\N	\N	100
3261	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3260	\N	8	Puntaje	\N	\N	\N	\N	\N	100
3262	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3261	\N	8	3	\N	\N	\N	\N	\N	100
3263	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3260	\N	8	Verificador	\N	\N	\N	\N	\N	200
3264	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3263	\N	8	L.4.c EM	\N	\N	\N	\N	\N	100
3265	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3260	\N	8	Obligatorio	\N	\N	\N	\N	\N	300
3266	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3265	\N	8	1	\N	\N	\N	\N	\N	100
3267	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3260	\N	8	NA	\N	\N	\N	\N	\N	400
3268	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3267	\N	8	0	\N	\N	\N	\N	\N	100
3269	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3260	\N	8	Condición NA	\N	\N	\N	\N	\N	500
3270	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3134	\N	8	Practicar alojamiento conjunto, permitiendo a las madres y recién nacidos permanecer juntos las 24 horas de día.	\N	\N	\N	\N	\N	500
3271	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3270	\N	8	a) Favorecer la práctica de alojamiento conjunto las 24 horas del día a menos de que existan razones clínicamente justificadas.	\N	\N	\N	\N	\N	100
3272	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3271	\N	8	80% de madres seleccionadas al azar permaneció con su bebé en la habitación desde el nacimiento.	\N	\N	\N	\N	\N	100
3273	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3272	\N	8	metadata	\N	\N	\N	\N	\N	100
3274	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3273	\N	8	Puntaje	\N	\N	\N	\N	\N	100
3275	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3274	\N	8	3	\N	\N	\N	\N	\N	100
3276	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3273	\N	8	Verificador	\N	\N	\N	\N	\N	200
3277	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3276	\N	8	L.5.a EM	\N	\N	\N	\N	\N	100
3278	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3273	\N	8	Obligatorio	\N	\N	\N	\N	\N	300
3279	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3278	\N	8	0	\N	\N	\N	\N	\N	100
3280	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3273	\N	8	NA	\N	\N	\N	\N	\N	400
3281	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3280	\N	8	0	\N	\N	\N	\N	\N	100
3282	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3273	\N	8	Condición NA	\N	\N	\N	\N	\N	500
3283	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3270	\N	8	b) Colocar al niño inmediatamente después del nacimiento con su madre en la misma habitación, incluido madres VIH positivo;	\N	\N	\N	\N	\N	200
3284	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3283	\N	8	90% de madres y bebés practican el alojamiento conjunto, de no hacerlo, deben existir razones justificadas.	\N	\N	\N	\N	\N	100
3285	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3284	\N	8	metadata	\N	\N	\N	\N	\N	100
3286	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3285	\N	8	Puntaje	\N	\N	\N	\N	\N	100
3287	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3286	\N	8	3	\N	\N	\N	\N	\N	100
3288	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3285	\N	8	Verificador	\N	\N	\N	\N	\N	200
3289	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3288	\N	8	L.5.b Ob	\N	\N	\N	\N	\N	100
3290	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3285	\N	8	Obligatorio	\N	\N	\N	\N	\N	300
3291	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3290	\N	8	1	\N	\N	\N	\N	\N	100
3292	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3285	\N	8	NA	\N	\N	\N	\N	\N	400
3293	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3292	\N	8	0	\N	\N	\N	\N	\N	100
3294	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3285	\N	8	Condición NA	\N	\N	\N	\N	\N	500
3295	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3134	\N	8	Fomentar la lactancia a demanda	\N	\N	\N	\N	\N	600
3296	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3295	\N	8	a) No poner horarios de lactancia, ni restricciones en la duración o frecuencia de succión;	\N	\N	\N	\N	\N	100
3297	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3296	\N	8	90% confirma que se les aconsejó respecto al amamantamiento a libre demanda.	\N	\N	\N	\N	\N	100
3298	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3297	\N	8	metadata	\N	\N	\N	\N	\N	100
3299	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3298	\N	8	Puntaje	\N	\N	\N	\N	\N	100
3300	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3299	\N	8	3	\N	\N	\N	\N	\N	100
3301	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3298	\N	8	Verificador	\N	\N	\N	\N	\N	200
3302	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3301	\N	8	L.6.a EM	\N	\N	\N	\N	\N	100
3303	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3298	\N	8	Obligatorio	\N	\N	\N	\N	\N	300
3304	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3303	\N	8	0	\N	\N	\N	\N	\N	100
3305	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3298	\N	8	NA	\N	\N	\N	\N	\N	400
3306	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3305	\N	8	0	\N	\N	\N	\N	\N	100
3307	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3298	\N	8	Condición NA	\N	\N	\N	\N	\N	500
3308	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3295	\N	8	b) Enseñar a las madres a reconocer las señales para amamantar y de saciedad del niño/a;	\N	\N	\N	\N	\N	200
3309	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3308	\N	8	90% de madres informa que se les enseñó a  reconocer el momento en que sus bebés están hambrientos, y puede describir por lo menos dos señales para amamantar	\N	\N	\N	\N	\N	100
3310	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3309	\N	8	metadata	\N	\N	\N	\N	\N	100
3311	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3310	\N	8	Puntaje	\N	\N	\N	\N	\N	100
3312	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3311	\N	8	3	\N	\N	\N	\N	\N	100
3313	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3310	\N	8	Verificador	\N	\N	\N	\N	\N	200
3314	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3313	\N	8	L.6.b EM	\N	\N	\N	\N	\N	100
3315	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3310	\N	8	Obligatorio	\N	\N	\N	\N	\N	300
3316	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3315	\N	8	0	\N	\N	\N	\N	\N	100
3317	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3310	\N	8	NA	\N	\N	\N	\N	\N	400
3318	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3317	\N	8	0	\N	\N	\N	\N	\N	100
3319	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3310	\N	8	Condición NA	\N	\N	\N	\N	\N	500
3320	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3134	\N	8	No dar biberones ni chupones a los bebés que amamantan	\N	\N	\N	\N	\N	700
3321	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3320	\N	8	a) Aplicar este paso tanto para los bebés amamantados como a los alimentados con sucedáneos de leche materna;	\N	\N	\N	\N	\N	100
3322	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3321	\N	8	Mediante observación en salas, al menos el 90% de bebés amamantados no deben recibir ningún tipo de biberón y/o chupón.	\N	\N	\N	\N	\N	100
3323	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3322	\N	8	metadata	\N	\N	\N	\N	\N	100
3324	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3323	\N	8	Puntaje	\N	\N	\N	\N	\N	100
3325	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3324	\N	8	2	\N	\N	\N	\N	\N	100
3326	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3323	\N	8	Verificador	\N	\N	\N	\N	\N	200
3327	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3326	\N	8	L.7.a Ob	\N	\N	\N	\N	\N	100
3328	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3323	\N	8	Obligatorio	\N	\N	\N	\N	\N	300
3329	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3328	\N	8	0	\N	\N	\N	\N	\N	100
3330	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3323	\N	8	NA	\N	\N	\N	\N	\N	400
3331	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3330	\N	8	0	\N	\N	\N	\N	\N	100
3332	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3323	\N	8	Condición NA	\N	\N	\N	\N	\N	500
3333	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3321	\N	8	En las salas de maternidad, el 90% de las madres que están amamantando, elegidas al azar, informa que de su conocimiento sus bebés no han sido alimentados con biberón ni se les ha ofrecido chupones ni chupones.	\N	\N	\N	\N	\N	200
3334	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3333	\N	8	metadata	\N	\N	\N	\N	\N	100
3335	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3334	\N	8	Puntaje	\N	\N	\N	\N	\N	100
3336	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3335	\N	8	2	\N	\N	\N	\N	\N	100
3337	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3334	\N	8	Verificador	\N	\N	\N	\N	\N	200
3339	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3334	\N	8	Obligatorio	\N	\N	\N	\N	\N	300
3340	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3339	\N	8	0	\N	\N	\N	\N	\N	100
3341	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3334	\N	8	NA	\N	\N	\N	\N	\N	400
3342	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3341	\N	8	0	\N	\N	\N	\N	\N	100
3343	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3334	\N	8	Condición NA	\N	\N	\N	\N	\N	500
3344	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3320	\N	8	b) En el caso de que las madres decidan utilizar biberones o chupones, brindar consejería e informar los riesgos de su utilización.	\N	\N	\N	\N	\N	200
3345	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3344	\N	8	90% de madres que alimentan con biberón manifiestan que se les ha informado sobre los riesgos de su utilización y pueden mencionar al menos un riesgo de alimentar con biberón.	\N	\N	\N	\N	\N	100
3346	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3345	\N	8	metadata	\N	\N	\N	\N	\N	100
3347	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3346	\N	8	Puntaje	\N	\N	\N	\N	\N	100
3348	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3347	\N	8	2	\N	\N	\N	\N	\N	100
3349	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3346	\N	8	Verificador	\N	\N	\N	\N	\N	200
3350	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3349	\N	8	L.7.b EM	\N	\N	\N	\N	\N	100
3351	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3346	\N	8	Obligatorio	\N	\N	\N	\N	\N	300
3352	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3351	\N	8	0	\N	\N	\N	\N	\N	100
3353	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3346	\N	8	NA	\N	\N	\N	\N	\N	400
3354	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3353	\N	8	0	\N	\N	\N	\N	\N	100
3355	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3346	\N	8	Condición NA	\N	\N	\N	\N	\N	500
3356	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3134	\N	8	Fomentar grupos de apoyo a la lactancia materna, referir a las madres a estos grupos al momento del alta del hospital o centro de salud	\N	\N	\N	\N	\N	800
3357	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3356	\N	8	a) Formar grupos de apoyo a la lactancia materna y/o referir a las madres a estos grupos en el momento del alta.	\N	\N	\N	\N	\N	100
3358	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3357	\N	8	90% de las madres comunica haber recibido información acerca de cómo obtener ayuda del hospital o cómo contactar grupos de apoyo, asesoría, línea de asesoría en lactancia materna (línea 171) u otro servicio de salud comunitario en caso de tener dudas sobre amamantamiento.	\N	\N	\N	\N	\N	100
3359	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3358	\N	8	metadata	\N	\N	\N	\N	\N	100
3360	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3359	\N	8	Puntaje	\N	\N	\N	\N	\N	100
3361	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3360	\N	8	2	\N	\N	\N	\N	\N	100
3362	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3359	\N	8	Verificador	\N	\N	\N	\N	\N	200
3363	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3362	\N	8	L.8.a EM	\N	\N	\N	\N	\N	100
3364	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3359	\N	8	Obligatorio	\N	\N	\N	\N	\N	300
3365	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3364	\N	8	0	\N	\N	\N	\N	\N	100
3366	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3359	\N	8	NA	\N	\N	\N	\N	\N	400
3367	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3366	\N	8	0	\N	\N	\N	\N	\N	100
3368	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3359	\N	8	Condición NA	\N	\N	\N	\N	\N	500
3369	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3356	\N	8	b) Formar grupos de apoyo exclusivamente para madres que viven con VIH y/o referir a grupos ya existentes.	\N	\N	\N	\N	\N	200
3370	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3369	\N	8	90% de las madres VIH positivo comunica haber recibido información acerca de cómo obtener ayuda del hospital, o cómo contactar grupos de apoyo, asesoría o algún otro servicio de salud comunitario.	\N	\N	\N	\N	\N	100
3371	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3370	\N	8	metadata	\N	\N	\N	\N	\N	100
3372	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3371	\N	8	Puntaje	\N	\N	\N	\N	\N	100
3373	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3372	\N	8	2	\N	\N	\N	\N	\N	100
3374	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3371	\N	8	Verificador	\N	\N	\N	\N	\N	200
3375	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3374	\N	8	L.8.b EM	\N	\N	\N	\N	\N	100
3376	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3371	\N	8	Obligatorio	\N	\N	\N	\N	\N	300
3377	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3376	\N	8	0	\N	\N	\N	\N	\N	100
3378	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3371	\N	8	NA	\N	\N	\N	\N	\N	400
3379	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3378	\N	8	1	\N	\N	\N	\N	\N	100
3380	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3371	\N	8	Condición NA	\N	\N	\N	\N	\N	500
3381	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3380	\N	8	 si el establecimiento marca 0 partos atendidos a madres VIH	\N	\N	\N	\N	\N	100
3382	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3134	\N	8	Cumplir con el Código Internacional de Comercialización Sucedáneos de la Leche Materna	\N	\N	\N	\N	\N	900
3383	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3382	\N	8	a) No permitir el contacto directo de representantes de la industria de sucedáneos de leche materna, biberones y chupones (SLM,B,CH), con embarazadas o madres;	\N	\N	\N	\N	\N	100
3384	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3383	\N	8	90% de las madres informan no haber sido contactadas con representantes de la industria de SLM, B, CH.	\N	\N	\N	\N	\N	100
3385	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3384	\N	8	metadata	\N	\N	\N	\N	\N	100
3386	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3385	\N	8	Puntaje	\N	\N	\N	\N	\N	100
3387	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3386	\N	8	3	\N	\N	\N	\N	\N	100
3388	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3385	\N	8	Verificador	\N	\N	\N	\N	\N	200
3389	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3388	\N	8	L.9.a EM	\N	\N	\N	\N	\N	100
3390	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3385	\N	8	Obligatorio	\N	\N	\N	\N	\N	300
3391	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3390	\N	8	1	\N	\N	\N	\N	\N	100
3392	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3385	\N	8	NA	\N	\N	\N	\N	\N	400
3393	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3392	\N	8	0	\N	\N	\N	\N	\N	100
3394	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3385	\N	8	Condición NA	\N	\N	\N	\N	\N	500
7491	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7	A. Formulario 051	\N	\N	\N	\N	\N	100
3395	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3382	\N	8	b) No entregar a ninguna embarazada, madre o familiares material de propaganda, muestras gratis o paquetes de regalo que incluyan SLM,B,CH o cupones;	\N	\N	\N	\N	\N	200
3396	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3395	\N	8	90% de las madres encuestadas informa que no ha recibido material de propaganda, muestras gratis o paquetes de regalo que incluyan SLM, B, CH o cupones.	\N	\N	\N	\N	\N	100
3397	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3396	\N	8	metadata	\N	\N	\N	\N	\N	100
3398	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3397	\N	8	Puntaje	\N	\N	\N	\N	\N	100
3399	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3398	\N	8	3	\N	\N	\N	\N	\N	100
3400	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3397	\N	8	Verificador	\N	\N	\N	\N	\N	200
3401	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3400	\N	8	L.9.b EM	\N	\N	\N	\N	\N	100
3402	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3397	\N	8	Obligatorio	\N	\N	\N	\N	\N	300
3403	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3402	\N	8	1	\N	\N	\N	\N	\N	100
3404	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3397	\N	8	NA	\N	\N	\N	\N	\N	400
3405	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3404	\N	8	0	\N	\N	\N	\N	\N	100
3406	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3397	\N	8	Condición NA	\N	\N	\N	\N	\N	500
3407	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3382	\N	8	c) Prohibir en el establecimiento- toda publicidad, patrocinio o promoción de la industria de SLM,B,CH;	\N	\N	\N	\N	\N	300
3408	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3407	\N	8	Por observación, constatar que no existe patrocinio, o promoción de la industria de SLM, B, CH en el establecimiento de salud.	\N	\N	\N	\N	\N	100
3409	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3408	\N	8	metadata	\N	\N	\N	\N	\N	100
3410	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3409	\N	8	Puntaje	\N	\N	\N	\N	\N	100
3411	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3410	\N	8	3	\N	\N	\N	\N	\N	100
3412	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3409	\N	8	Verificador	\N	\N	\N	\N	\N	200
3413	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3412	\N	8	L.9.c Ob	\N	\N	\N	\N	\N	100
3414	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3409	\N	8	Obligatorio	\N	\N	\N	\N	\N	300
3415	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3414	\N	8	1	\N	\N	\N	\N	\N	100
3416	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3409	\N	8	NA	\N	\N	\N	\N	\N	400
3417	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3416	\N	8	0	\N	\N	\N	\N	\N	100
3418	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3409	\N	8	Condición NA	\N	\N	\N	\N	\N	500
3419	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3382	\N	8	d) En caso de alimentación con sucedáneo justificado por razones clínicas, los envases de fórmula y biberones se mantienen fuera de la vista.	\N	\N	\N	\N	\N	400
3420	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3419	\N	8	Por observación, indicar que el establecimiento de salud mantiene fuera de vista envases de fórmula y biberones.	\N	\N	\N	\N	\N	100
3421	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3420	\N	8	metadata	\N	\N	\N	\N	\N	100
3422	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3421	\N	8	Puntaje	\N	\N	\N	\N	\N	100
3423	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3422	\N	8	3	\N	\N	\N	\N	\N	100
3424	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3421	\N	8	Verificador	\N	\N	\N	\N	\N	200
3425	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3424	\N	8	L.9.d Ob	\N	\N	\N	\N	\N	100
3426	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3421	\N	8	Obligatorio	\N	\N	\N	\N	\N	300
3427	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3426	\N	8	0	\N	\N	\N	\N	\N	100
3428	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3421	\N	8	NA	\N	\N	\N	\N	\N	400
3429	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3428	\N	8	0	\N	\N	\N	\N	\N	100
3430	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3421	\N	8	Condición NA	\N	\N	\N	\N	\N	500
7492	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7491	\N	7	1. En la sección “Gestación actual”, página 1 del formulario 051, verificar que estén llenas adecuadamente: vacunas “antirubeola” y “antitetánica”, “toxoplasmosis”, “hemoglobina”, “bacteriuria”, “glucemia en ayunas”, “prevención preeclampsia”.   En el caso de establecimientos que no usen el formulario 051, se revisará este seguimiento en las historias clínicas.	\N	\N	\N	\N	\N	100
7493	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7492	\N	7	respuesta	\N	\N	\N	\N	\N	100
7494	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7493	\N	7	Nº de formularios revisados	\N	\N	\N	\N	\N	100
7495	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7493	\N	7	Nº de formularios que cumplen	\N	\N	\N	\N	\N	200
7496	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7493	\N	7	Nº de formularios que no cumplen	\N	\N	\N	\N	\N	300
7497	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7493	\N	7	observaciones	\N	\N	\N	\N	\N	400
7498	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7497	\N	7	En el caso de establecimientos que no corresponden al primer nivel, se debe aclarar las acciones de seguimiento hechas por el establecimiento	\N	\N	\N	\N	\N	100
7499	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7492	\N	7	verificador	\N	\N	\N	\N	\N	200
7500	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7499	\N	7	R.2.a 051	\N	\N	\N	\N	\N	100
7501	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7491	\N	7	2. Seis (6) sesiones marcadas de “Educación Prenatal-Sesiones”, página 1 del formulario 051. En el caso de establecimientos que no usen el formulario 051, se revisará este seguimiento en las historias clínicas.	\N	\N	\N	\N	\N	200
7502	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7501	\N	7	respuesta	\N	\N	\N	\N	\N	100
7503	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7502	\N	7	Nº de formularios revisados	\N	\N	\N	\N	\N	100
7504	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7502	\N	7	Nº de formularios que cumplen	\N	\N	\N	\N	\N	200
7505	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7502	\N	7	Nº de formularios que no cumplen	\N	\N	\N	\N	\N	300
7506	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7502	\N	7	observaciones	\N	\N	\N	\N	\N	400
7507	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7506	\N	7	En el caso de establecimientos que no corresponden al primer nivel, se debe aclarar las acciones de seguimiento hechas por el establecimiento	\N	\N	\N	\N	\N	100
7508	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7501	\N	7	verificador	\N	\N	\N	\N	\N	200
7509	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7508	\N	7	R.1.b 051	\N	\N	\N	\N	\N	100
7510	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7491	\N	7	3. Al menos una asistencia al control  prenatal en el primer trimestre, página 1 del formulario 051. En el caso de establecimientos que no usen el formulario 051, se revisará este seguimiento en las historias clínicas.	\N	\N	\N	\N	\N	300
7511	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7510	\N	7	respuesta	\N	\N	\N	\N	\N	100
7512	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7511	\N	7	Nº de formularios revisados	\N	\N	\N	\N	\N	100
7513	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7511	\N	7	Nº de formularios que cumplen	\N	\N	\N	\N	\N	200
7514	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7511	\N	7	Nº de formularios que no cumplen	\N	\N	\N	\N	\N	300
7515	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7511	\N	7	observaciones	\N	\N	\N	\N	\N	400
7516	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7515	\N	7	En el caso de establecimientos que no corresponden al primer nivel, se debe aclarar las acciones de seguimiento hechas por el establecimiento	\N	\N	\N	\N	\N	100
7517	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7510	\N	7	verificador	\N	\N	\N	\N	\N	200
7518	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7517	\N	7	R.2.b 051	\N	\N	\N	\N	\N	100
7519	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7491	\N	7	4. Las siguientes variables en la página 1 del formulario 051 deben estar completas en la sección “controles prenatales”: “ganancia adecuada de peso”, “sangrado vaginal” debe tener las filas llenas de acuerdo al control alcanzado por la madre. En caso de existir riesgo, se debe verificar tratamiento en “Exámenes, tratamientos SCORE MAMÁ” y/o historia clínica. En el caso de establecimientos que no usen el formulario 051, se revisará este seguimiento en las historias clínicas.	\N	\N	\N	\N	\N	400
7520	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7519	\N	7	respuesta	\N	\N	\N	\N	\N	100
7521	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7520	\N	7	Nº de formularios revisados	\N	\N	\N	\N	\N	100
7522	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7520	\N	7	Nº de formularios que cumplen	\N	\N	\N	\N	\N	200
7523	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7520	\N	7	Nº de formularios que no cumplen	\N	\N	\N	\N	\N	300
7524	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7520	\N	7	observaciones	\N	\N	\N	\N	\N	400
7525	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7524	\N	7	En el caso de establecimientos que no corresponden al primer nivel, se debe aclarar las acciones de seguimiento hechas por el establecimiento para prevenir complicaciones obstétricas.	\N	\N	\N	\N	\N	100
7526	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7519	\N	7	verificador	\N	\N	\N	\N	\N	200
7527	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7526	\N	7	R.2.d 051	\N	\N	\N	\N	\N	100
7528	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7491	\N	7	5. Se realizó al menos un examen para  detección de VIH en los controles prenatales. Ver sección “VIH- Diag. Tratamiento”, en página 1 del formulario 051. En el caso de establecimientos que no usen el formulario 051, se revisará este seguimiento en las historias clínicas.	\N	\N	\N	\N	\N	500
7529	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7528	\N	7	respuesta	\N	\N	\N	\N	\N	100
7530	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7529	\N	7	Nº de formularios revisados	\N	\N	\N	\N	\N	100
7531	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7529	\N	7	Nº de formularios que cumplen	\N	\N	\N	\N	\N	200
7532	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7529	\N	7	Nº de formularios que no cumplen	\N	\N	\N	\N	\N	300
7533	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7529	\N	7	observaciones	\N	\N	\N	\N	\N	400
7534	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7533	\N	7	Si no se realizó el tamizaje para VIH, confirmar si este se hizo en el establecimiento antes o después del parto. Esto se puede revisar en las Historias Clínicas.	\N	\N	\N	\N	\N	100
7535	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7534	\N	7	(Vale 1 punto)	\N	\N	\N	\N	\N	100
7536	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7528	\N	7	verificador	\N	\N	\N	\N	\N	200
7537	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7536	\N	7	R.3.b 051	\N	\N	\N	\N	\N	100
7538	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7491	\N	7	6. Se realizó al menos un examen para detección de sífilis en los controles prenatales. Ver sección “Sífilis – Diagnóstico y Tratamiento”, en página 1 del formulario 051.	\N	\N	\N	\N	\N	600
7539	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7538	\N	7	respuesta	\N	\N	\N	\N	\N	100
7540	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7539	\N	7	Nº de formularios revisados	\N	\N	\N	\N	\N	100
7541	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7540	\N	7	(Vale 1 punto)	\N	\N	\N	\N	\N	100
7542	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7539	\N	7	Nº de formularios que cumplen	\N	\N	\N	\N	\N	200
7543	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7539	\N	7	Nº de formularios que no cumplen	\N	\N	\N	\N	\N	300
7544	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7538	\N	7	verificador	\N	\N	\N	\N	\N	200
7545	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7544	\N	7	R.3.b 051	\N	\N	\N	\N	\N	100
7546	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7491	\N	7	7. Se registra tratamiento en diagnósticos positivos para VIH, en página 1 del formulario 051.	\N	\N	\N	\N	\N	700
7547	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7546	\N	7	respuesta	\N	\N	\N	\N	\N	100
7548	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7547	\N	7	Nº de formularios revisados	\N	\N	\N	\N	\N	100
7549	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7548	\N	7	(Vale 1,5 punto)	\N	\N	\N	\N	\N	100
7550	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7547	\N	7	Nº de formularios que cumplen	\N	\N	\N	\N	\N	200
7551	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7547	\N	7	Nº de formularios que no cumplen	\N	\N	\N	\N	\N	300
7552	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7546	\N	7	verificador	\N	\N	\N	\N	\N	200
7553	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7552	\N	7	R.3.c 051	\N	\N	\N	\N	\N	100
7554	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7491	\N	7	8. Se registra tratamiento en diagnósticos positivos para sífilis, en página 1 del formulario 051.	\N	\N	\N	\N	\N	800
7555	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7554	\N	7	respuesta	\N	\N	\N	\N	\N	100
7556	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7555	\N	7	Nº de formularios revisados	\N	\N	\N	\N	\N	100
7557	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7556	\N	7	(Vale 1,5 punto)	\N	\N	\N	\N	\N	100
7558	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7555	\N	7	Nº de formularios que cumplen	\N	\N	\N	\N	\N	200
7559	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7555	\N	7	Nº de formularios que no cumplen	\N	\N	\N	\N	\N	300
7560	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7554	\N	7	verificador	\N	\N	\N	\N	\N	200
7561	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7491	\N	7	9. Sección “acompañante”, en página 1 del formulario 051,  llena. Si se marca “ninguno”, el formulario “no cumple”. (El acompañamiento puede ser de la pareja, familiar, partera/o, u otro.) En el caso de establecimientos que no usen el formulario 051, se revisará este seguimiento en las historias clínicas.\n	\N	\N	\N	\N	\N	900
7562	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7561	\N	7	respuesta	\N	\N	\N	\N	\N	100
7563	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7562	\N	7	Nº de formularios revisados	\N	\N	\N	\N	\N	100
7564	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7562	\N	7	Nº de formularios que cumplen	\N	\N	\N	\N	\N	200
7565	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7562	\N	7	Nº de formularios que no cumplen	\N	\N	\N	\N	\N	300
7566	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7565	\N	7	((si se sustenta médicamente, se marca “cumple”))	\N	\N	\N	\N	\N	100
7567	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7561	\N	7	verificador	\N	\N	\N	\N	\N	200
7568	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7567	\N	7	P.1.b 051	\N	\N	\N	\N	\N	100
7569	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7491	\N	7	10. Variable “vestimenta”  en sección “Prácticas interculturales”, página 1 del formulario 051,  llena. En el caso de establecimientos que no usen el formulario 051, se revisará este seguimiento en las historias clínicas.	\N	\N	\N	\N	\N	1000
7570	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7569	\N	7	respuesta	\N	\N	\N	\N	\N	100
7571	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7570	\N	7	Nº de formularios revisados	\N	\N	\N	\N	\N	100
7572	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7570	\N	7	Nº de formularios que cumplen	\N	\N	\N	\N	\N	200
7573	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7570	\N	7	Nº de formularios que no cumplen	\N	\N	\N	\N	\N	300
7574	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7573	\N	7	(si se sustenta médicamente, se marca “cumple”)	\N	\N	\N	\N	\N	100
7575	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7569	\N	7	verificador	\N	\N	\N	\N	\N	200
7576	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7575	\N	7	P.2.b 051	\N	\N	\N	\N	\N	100
7577	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7491	\N	7	11. Variable “entrega placenta”  en sección “Prácticas interculturales”, página 1 del formulario 051,  llena. En el caso de establecimientos que no usen el formulario 051, se revisará este seguimiento en las historias clínicas.	\N	\N	\N	\N	\N	1100
7578	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7577	\N	7	respuesta	\N	\N	\N	\N	\N	100
7579	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7578	\N	7	Nº de formularios revisados	\N	\N	\N	\N	\N	100
7580	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7578	\N	7	Nº de formularios que cumplen	\N	\N	\N	\N	\N	200
7581	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7578	\N	7	Nº de formularios que no cumplen	\N	\N	\N	\N	\N	300
7582	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7581	\N	7	(si se sustenta médicamente, se marca “cumple”)	\N	\N	\N	\N	\N	100
7583	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7577	\N	7	verificador	\N	\N	\N	\N	\N	200
7584	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7583	\N	7	P.2.c 051	\N	\N	\N	\N	\N	100
7585	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7491	\N	7	12. Sección “Ligadura cordón al cesar pulsaciones”, en página 1, marcada “sí”. En caso de marcarse “no”, revisar justificación en historia clínica. Si no existe, se marca “no cumple”. En el caso de establecimientos que no usen el formulario 051, se revisará este seguimiento en las historias clínicas.	\N	\N	\N	\N	\N	1200
7586	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7585	\N	7	respuesta	\N	\N	\N	\N	\N	100
7587	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7586	\N	7	Nº de formularios revisados	\N	\N	\N	\N	\N	100
7588	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7586	\N	7	Nº de formularios que cumplen	\N	\N	\N	\N	\N	200
7589	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7586	\N	7	Nº de formularios que no cumplen	\N	\N	\N	\N	\N	300
7590	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7589	\N	7	(si se sustenta médicamente, se marca “cumple”)	\N	\N	\N	\N	\N	100
7591	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7585	\N	7	verificador	\N	\N	\N	\N	\N	200
7592	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7591	\N	7	P.6.c 051	\N	\N	\N	\N	\N	100
7593	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7491	\N	7	13. Sección “Anticoncepción”, en la página 2 del formulario 051, lleno. En el caso de establecimientos que no usen el formulario 051, se revisará este seguimiento en las historias clínicas.	\N	\N	\N	\N	\N	1300
7594	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7593	\N	7	respuesta	\N	\N	\N	\N	\N	100
7595	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7594	\N	7	Nº de formularios revisados	\N	\N	\N	\N	\N	100
7596	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7594	\N	7	Nº de formularios que cumplen	\N	\N	\N	\N	\N	200
7597	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7594	\N	7	Nº de formularios que no cumplen	\N	\N	\N	\N	\N	300
7598	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7593	\N	7	verificador	\N	\N	\N	\N	\N	200
7599	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7598	\N	7	P.10.a 051	\N	\N	\N	\N	\N	100
7600	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7	B, Historias Clínicas	\N	\N	\N	\N	\N	200
7601	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7600	\N	7	14. Se registra tratamiento en casos de diagnóstico de riesgo 	\N	\N	\N	\N	\N	100
7602	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7601	\N	7	respuesta	\N	\N	\N	\N	\N	100
7603	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7602	\N	7	NºHCL revisados	\N	\N	\N	\N	\N	100
7604	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7602	\N	7	Nº de formularios que cumplen	\N	\N	\N	\N	\N	200
7605	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7602	\N	7	Nº de formularios que no cumplen	\N	\N	\N	\N	\N	300
7606	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7601	\N	7	verificador	\N	\N	\N	\N	\N	200
7607	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7606	\N	7	R.2.d HC	\N	\N	\N	\N	\N	100
7608	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7600	\N	7	15. Los siguientes procedimientos cuentan con justificación médica en la historia clínica:  1. canalización intravenosa de rutina;   2. episiotomías;   3. parto instrumentado;   4. enema;  5. separación,  ruptura artificial, o decolamiento de membranas;  6. inducción médica y/o aceleramiento del trabajo de parto;   7. exámenes vaginales repetidos;  (La realización de tactos vaginales de acuerdo a lo establecido en la norma: Máximo 1 tacto cada cuatro horas.) 8. fluidos intravenosos;  9. monitoreo electrónico fetal continuo (cardiotocografía);   10. control farmacológico del dolor;   11. colocación de catéter  urinario;   12. posición supina o de litotomía (piernas en estribos);   13. pujos dirigidos por el personal de salud;   14. presión del fondo uterino (Kristeller);   15. fórceps y extracción por vacío;   16. exploración manual del útero o aspiración del recién nacido.  17. El rasurado perineal es una práctica que no debe realizarse Se verifica  en la historia clínica o en Matriz de estándares e indicadores para el monitoreo de la atención del parto normal de bajo riesgo, en libre posición y con pertinencia intercultural, deberá contar con el informe de retroalimentación al monitoreo realizado por cada zona, 	\N	\N	\N	\N	\N	200
7609	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7608	\N	7	respuesta	\N	\N	\N	\N	\N	100
7610	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7609	\N	7	NºHCL revisados	\N	\N	\N	\N	\N	100
7611	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7609	\N	7	Nº de formularios que cumplen	\N	\N	\N	\N	\N	200
7612	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7609	\N	7	Nº de formularios que no cumplen	\N	\N	\N	\N	\N	300
7613	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7608	\N	7	verificador	\N	\N	\N	\N	\N	200
7614	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7613	\N	7	P.5.a HC	\N	\N	\N	\N	\N	100
7615	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7600	\N	7	16. Porcentaje de cesáreas con pertinencia médica. (Solicitar informe de auditoría de pertinencia médica de cesáreas al  líder del establecimiento de salud) 	\N	\N	\N	\N	\N	300
7616	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7615	\N	7	respuesta	\N	\N	\N	\N	\N	100
7617	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7616	\N	7	NºHCL revisados	\N	\N	\N	\N	\N	100
7618	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7616	\N	7	Nº de formularios que cumplen	\N	\N	\N	\N	\N	200
7619	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7616	\N	7	Nº de formularios que no cumplen	\N	\N	\N	\N	\N	300
7620	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7615	\N	7	verificador	\N	\N	\N	\N	\N	200
7621	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7620	\N	7	P.5.b HC	\N	\N	\N	\N	\N	100
7622	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7600	\N	7	17. Historias clínicas de madres VIH positivo registradas en cesárea. Se exceptúan los nacimientos atendidos en fase expulsiva.	\N	\N	\N	\N	\N	400
7623	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7622	\N	7	respuesta	\N	\N	\N	\N	\N	100
7624	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7623	\N	7	NºHCL revisados	\N	\N	\N	\N	\N	100
7625	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7623	\N	7	Nº de formularios que cumplen	\N	\N	\N	\N	\N	200
7626	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7623	\N	7	Nº de formularios que no cumplen	\N	\N	\N	\N	\N	300
7627	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7622	\N	7	verificador	\N	\N	\N	\N	\N	200
7628	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7627	\N	7	P.5.c HC	\N	\N	\N	\N	\N	100
7629	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7600	\N	7	18. Historias clínicas muestran que no se encuentran prescripciones de sucedáneos de la leche materna a menos de que existan contraindicaciones justificadas de lactancia materna.	\N	\N	\N	\N	\N	500
7630	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7629	\N	7	respuesta	\N	\N	\N	\N	\N	100
7631	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7630	\N	7	NºHCL revisados	\N	\N	\N	\N	\N	100
7632	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7630	\N	7	Nº de formularios que cumplen	\N	\N	\N	\N	\N	200
7633	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7630	\N	7	Nº de formularios que no cumplen	\N	\N	\N	\N	\N	300
7634	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7629	\N	7	verificador	\N	\N	\N	\N	\N	200
7635	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7634	\N	7	P.9.b HC	\N	\N	\N	\N	\N	100
7636	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7600	\N	7	OBSERVACIONES	\N	\N	\N	\N	\N	600
5577	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5576	\N	1	Sí	\N	\N	\N	\N	\N	100
5578	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5576	\N	1	No	\N	\N	\N	\N	\N	200
5579	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5565	\N	1	Nivel de complejidad   	\N	\N	\N	\N	\N	200
5580	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5534	\N	1	2	\N	\N	\N	\N	\N	300
5534	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	1	DATOS  DEL ESTABLECIMIENTO DE SALUD	\N	\N	\N	\N	\N	100
5535	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5534	\N	1	cabecera	\N	\N	\N	\N	\N	100
5536	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5535	\N	1	No.	\N	\N	\N	\N	\N	100
5537	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5535	\N	1	Zona	\N	\N	\N	\N	\N	200
5538	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5535	\N	1	Distrito	\N	\N	\N	\N	\N	300
5539	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5535	\N	1	Nombre del establecimiento de salud (ES)	\N	\N	\N	\N	\N	400
5540	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5535	\N	1	Nombre del responsable del ES	\N	\N	\N	\N	\N	500
5541	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5535	\N	1	UNICÓDIGO	\N	\N	\N	\N	\N	600
5542	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5535	\N	1	Fecha	\N	\N	\N	\N	\N	700
5543	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5535	\N	1	Nombre del evaluador/a	\N	\N	\N	\N	\N	800
5544	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5534	\N	1	1	\N	\N	\N	\N	\N	200
5545	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5544	\N	1	principal	\N	\N	\N	\N	\N	100
5546	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5545	\N	1	Instituciones del sistema de salud	\N	\N	\N	\N	\N	100
5547	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5546	\N	1	MSP	\N	\N	\N	\N	\N	100
5548	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5547	\N	1	Sí	\N	\N	\N	\N	\N	100
5549	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5547	\N	1	No	\N	\N	\N	\N	\N	200
5550	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5546	\N	1	IESS	\N	\N	\N	\N	\N	200
5551	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5550	\N	1	Sí	\N	\N	\N	\N	\N	100
5552	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5550	\N	1	No	\N	\N	\N	\N	\N	200
5553	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5546	\N	1	ISSFA	\N	\N	\N	\N	\N	300
5554	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5553	\N	1	Sí	\N	\N	\N	\N	\N	100
5555	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5553	\N	1	No	\N	\N	\N	\N	\N	200
5556	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5546	\N	1	ISPOL	\N	\N	\N	\N	\N	400
5557	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5556	\N	1	Sí	\N	\N	\N	\N	\N	100
5558	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5556	\N	1	No	\N	\N	\N	\N	\N	200
5559	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5546	\N	1	Establecimientos de salud Privados 	\N	\N	\N	\N	\N	500
5560	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5559	\N	1	Sí	\N	\N	\N	\N	\N	100
5561	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5559	\N	1	No	\N	\N	\N	\N	\N	200
5562	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5546	\N	1	Otros	\N	\N	\N	\N	\N	600
5563	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5562	\N	1	Sí	\N	\N	\N	\N	\N	100
5564	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5562	\N	1	No	\N	\N	\N	\N	\N	200
5565	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5544	\N	1	secundario	\N	\N	\N	\N	\N	200
5566	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5565	\N	1	Tipo de establecimientos del MSP 	\N	\N	\N	\N	\N	100
5567	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5566	\N	1	7.   Establecimiento de Salud Tipo C –Materno Infantil.  	\N	\N	\N	\N	\N	100
5568	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5567	\N	1	Sí	\N	\N	\N	\N	\N	100
5569	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5567	\N	1	No	\N	\N	\N	\N	\N	200
5570	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5566	\N	1	11. Hospital Básico 	\N	\N	\N	\N	\N	200
5571	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5570	\N	1	Sí	\N	\N	\N	\N	\N	100
5572	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5570	\N	1	No	\N	\N	\N	\N	\N	200
5573	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5566	\N	1	12. Hospital General 	\N	\N	\N	\N	\N	300
5574	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5573	\N	1	Sí	\N	\N	\N	\N	\N	100
5575	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5573	\N	1	No	\N	\N	\N	\N	\N	200
5576	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5566	\N	1	13. Hospital Especializado en Gineco-Obstetricia	\N	\N	\N	\N	\N	400
5581	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5580	\N	1	principal	\N	\N	\N	\N	\N	100
5582	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5581	\N	1	El ES : 	\N	\N	\N	\N	\N	100
5583	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5582	\N	1	Atiende controles prenatales 	\N	\N	\N	\N	\N	100
5584	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5583	\N	1	Sí	\N	\N	\N	\N	\N	100
5585	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5583	\N	1	No	\N	\N	\N	\N	\N	200
5586	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5582	\N	1	Realiza cesáreas  	\N	\N	\N	\N	\N	200
5587	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5586	\N	1	Sí	\N	\N	\N	\N	\N	100
5588	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5586	\N	1	No	\N	\N	\N	\N	\N	200
5589	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5582	\N	1	Realiza cesáreas  con anestesia general 	\N	\N	\N	\N	\N	300
5590	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5589	\N	1	Sí	\N	\N	\N	\N	\N	100
5591	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5589	\N	1	No	\N	\N	\N	\N	\N	200
5592	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5534	\N	1	3	\N	\N	\N	\N	\N	400
5593	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5592	\N	1	principal	\N	\N	\N	\N	\N	100
5594	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5593	\N	1	Número total de personal administrativo que trabaja en el ES:  	\N	\N	\N	\N	\N	100
5595	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5593	\N	1	Número total de personal de salud que trabaja en el ES:	\N	\N	\N	\N	\N	200
5596	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5592	\N	1	secundario	\N	\N	\N	\N	\N	200
5597	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5596	\N	1	Número total de camas en el ES	\N	\N	\N	\N	\N	100
5598	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5596	\N	1	Número de camas para gineco-obstetricia	\N	\N	\N	\N	\N	200
5599	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5596	\N	1	Número de puestos de recuperación post parto inmediato	\N	\N	\N	\N	\N	300
5600	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5596	\N	1	Número de camillas de recuperación	\N	\N	\N	\N	\N	400
5601	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5596	\N	1	Número de Unidades de Trabajo de Parto y Recuperación (UTPR)	\N	\N	\N	\N	\N	500
5602	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5596	\N	1	Número de salas de parto	\N	\N	\N	\N	\N	600
5603	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5596	\N	1	Número de quirófanos destinados a cesáreas	\N	\N	\N	\N	\N	700
5604	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5534	\N	1	4	\N	\N	\N	\N	\N	500
5605	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5604	\N	1	principal	\N	\N	\N	\N	\N	100
5606	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5605	\N	1	Nombre y apellido del responsable de la internación gineco-obstétrica, centro obstétrico o sala de parto:  	\N	\N	\N	\N	\N	100
5607	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5606	\N	1	nombres	\N	\N	\N	\N	\N	100
5608	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5606	\N	1	apellidos	\N	\N	\N	\N	\N	200
5609	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5604	\N	1	secundario	\N	\N	\N	\N	\N	200
5610	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5609	\N	1	Título profesional	\N	\N	\N	\N	\N	100
5611	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5609	\N	1	Teléfono celular y/o convencional (ext):	\N	\N	\N	\N	\N	200
5612	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5609	\N	1	Correo electrónico	\N	\N	\N	\N	\N	300
5613	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5534	\N	1	5	\N	\N	\N	\N	\N	600
5614	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5613	\N	1	¿Tiene el establecimiento de salud servicio de neonatología? 	\N	\N	\N	\N	\N	100
5615	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5614	\N	1	Si	\N	\N	\N	\N	\N	100
5616	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5615	\N	1	Promedio de ingreso diario	\N	\N	\N	\N	\N	100
5617	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5615	\N	1	Número de cunas/ totales para el servicio	\N	\N	\N	\N	\N	200
5618	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5615	\N	1	Nombre del jefe o responsable del servicio	\N	\N	\N	\N	\N	300
5619	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5615	\N	1	Tiene cuidados del recién nacido	\N	\N	\N	\N	\N	400
5620	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5619	\N	1	Inmediatos	\N	\N	\N	\N	\N	100
5621	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5620	\N	1	Sí	\N	\N	\N	\N	\N	100
5622	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5621	\N	1	Número de cunas	\N	\N	\N	\N	\N	100
5623	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5620	\N	1	No	\N	\N	\N	\N	\N	200
5624	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5619	\N	1	Básicos	\N	\N	\N	\N	\N	200
5625	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5624	\N	1	Sí	\N	\N	\N	\N	\N	100
5626	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5625	\N	1	Número de cunas	\N	\N	\N	\N	\N	100
5627	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5624	\N	1	No	\N	\N	\N	\N	\N	200
5628	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5619	\N	1	Intermedios	\N	\N	\N	\N	\N	300
5629	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5628	\N	1	Sí	\N	\N	\N	\N	\N	100
5630	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5629	\N	1	Número de cunas	\N	\N	\N	\N	\N	100
5631	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5628	\N	1	No	\N	\N	\N	\N	\N	200
5632	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5619	\N	1	Intensivos	\N	\N	\N	\N	\N	400
5633	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5632	\N	1	Sí	\N	\N	\N	\N	\N	100
5634	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5633	\N	1	Número de cunas	\N	\N	\N	\N	\N	100
5635	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5632	\N	1	No	\N	\N	\N	\N	\N	200
5636	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5614	\N	1	No	\N	\N	\N	\N	\N	200
5637	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5534	\N	1	6	\N	\N	\N	\N	\N	700
5638	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5637	\N	1	El siguiente personal de salud tiene responsabilidad directa para atender a madres con temas de: lactancia materna (LM), alimentación con sucedáneos de la leche materna (SLM), brindar consejería en VIH y alimentación infantil (VIH), educación prenatal (EP)	\N	\N	\N	\N	\N	100
5639	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5638	\N	1	PROFESIONAL	\N	\N	\N	\N	\N	100
5640	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5639	\N	1	Enfermera/o 	\N	\N	\N	\N	\N	100
5641	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5640	\N	1	LM	\N	\N	\N	\N	\N	100
5642	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5641	\N	1	Sí	\N	\N	\N	\N	\N	100
5643	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5641	\N	1	No	\N	\N	\N	\N	\N	200
5644	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5640	\N	1	SLM	\N	\N	\N	\N	\N	200
5645	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5644	\N	1	Sí	\N	\N	\N	\N	\N	100
5646	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5644	\N	1	No	\N	\N	\N	\N	\N	200
5647	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5640	\N	1	VIH	\N	\N	\N	\N	\N	300
5648	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5647	\N	1	Sí	\N	\N	\N	\N	\N	100
5649	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5647	\N	1	No	\N	\N	\N	\N	\N	200
5650	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5640	\N	1	EP	\N	\N	\N	\N	\N	400
5651	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5650	\N	1	Sí	\N	\N	\N	\N	\N	100
5652	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5650	\N	1	No	\N	\N	\N	\N	\N	200
5653	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5639	\N	1	Especialista en gineco-obstetricia	\N	\N	\N	\N	\N	200
5654	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5653	\N	1	LM	\N	\N	\N	\N	\N	100
5655	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5654	\N	1	Sí	\N	\N	\N	\N	\N	100
5656	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5654	\N	1	No	\N	\N	\N	\N	\N	200
5657	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5653	\N	1	SLM	\N	\N	\N	\N	\N	200
5658	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5657	\N	1	Sí	\N	\N	\N	\N	\N	100
5659	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5657	\N	1	No	\N	\N	\N	\N	\N	200
5660	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5653	\N	1	VIH	\N	\N	\N	\N	\N	300
5661	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5660	\N	1	Sí	\N	\N	\N	\N	\N	100
5662	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5660	\N	1	No	\N	\N	\N	\N	\N	200
5663	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5653	\N	1	EP	\N	\N	\N	\N	\N	400
5664	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5663	\N	1	Sí	\N	\N	\N	\N	\N	100
5665	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5663	\N	1	No	\N	\N	\N	\N	\N	200
5666	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5639	\N	1	Obstetras - obstetrices	\N	\N	\N	\N	\N	300
5667	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5666	\N	1	LM	\N	\N	\N	\N	\N	100
5668	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5667	\N	1	Sí	\N	\N	\N	\N	\N	100
5669	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5667	\N	1	No	\N	\N	\N	\N	\N	200
5670	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5666	\N	1	SLM	\N	\N	\N	\N	\N	200
5671	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5670	\N	1	Sí	\N	\N	\N	\N	\N	100
5672	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5670	\N	1	No	\N	\N	\N	\N	\N	200
5673	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5666	\N	1	VIH	\N	\N	\N	\N	\N	300
5674	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5673	\N	1	Sí	\N	\N	\N	\N	\N	100
5675	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5673	\N	1	No	\N	\N	\N	\N	\N	200
5676	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5666	\N	1	EP	\N	\N	\N	\N	\N	400
5677	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5676	\N	1	Sí	\N	\N	\N	\N	\N	100
5678	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5676	\N	1	No	\N	\N	\N	\N	\N	200
5679	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5639	\N	1	Enfermeras neonatología	\N	\N	\N	\N	\N	400
5680	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5679	\N	1	LM	\N	\N	\N	\N	\N	100
5681	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5680	\N	1	Sí	\N	\N	\N	\N	\N	100
5682	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5680	\N	1	No	\N	\N	\N	\N	\N	200
5683	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5679	\N	1	SLM	\N	\N	\N	\N	\N	200
5684	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5683	\N	1	Sí	\N	\N	\N	\N	\N	100
5685	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5683	\N	1	No	\N	\N	\N	\N	\N	200
5686	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5679	\N	1	VIH	\N	\N	\N	\N	\N	300
5687	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5686	\N	1	Sí	\N	\N	\N	\N	\N	100
5688	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5686	\N	1	No	\N	\N	\N	\N	\N	200
5689	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5679	\N	1	EP	\N	\N	\N	\N	\N	400
5690	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5689	\N	1	Sí	\N	\N	\N	\N	\N	100
5691	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5689	\N	1	No	\N	\N	\N	\N	\N	200
5692	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5639	\N	1	Pediatra / Neonatólogo	\N	\N	\N	\N	\N	500
5693	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5692	\N	1	LM	\N	\N	\N	\N	\N	100
5694	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5693	\N	1	Sí	\N	\N	\N	\N	\N	100
5695	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5693	\N	1	No	\N	\N	\N	\N	\N	200
5696	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5692	\N	1	SLM	\N	\N	\N	\N	\N	200
5697	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5696	\N	1	Sí	\N	\N	\N	\N	\N	100
5698	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5696	\N	1	No	\N	\N	\N	\N	\N	200
5699	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5692	\N	1	VIH	\N	\N	\N	\N	\N	300
5700	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5699	\N	1	Sí	\N	\N	\N	\N	\N	100
5701	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5699	\N	1	No	\N	\N	\N	\N	\N	200
5702	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5692	\N	1	EP	\N	\N	\N	\N	\N	400
5703	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5702	\N	1	Sí	\N	\N	\N	\N	\N	100
5704	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5702	\N	1	No	\N	\N	\N	\N	\N	200
5705	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5639	\N	1	Dietistas o nutricionistas	\N	\N	\N	\N	\N	600
5706	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5705	\N	1	LM	\N	\N	\N	\N	\N	100
5707	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5706	\N	1	Sí	\N	\N	\N	\N	\N	100
5708	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5706	\N	1	No	\N	\N	\N	\N	\N	200
5709	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5705	\N	1	SLM	\N	\N	\N	\N	\N	200
5710	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5709	\N	1	Sí	\N	\N	\N	\N	\N	100
5711	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5709	\N	1	No	\N	\N	\N	\N	\N	200
5712	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5705	\N	1	VIH	\N	\N	\N	\N	\N	300
5713	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5712	\N	1	Sí	\N	\N	\N	\N	\N	100
5714	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5712	\N	1	No	\N	\N	\N	\N	\N	200
5715	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5705	\N	1	EP	\N	\N	\N	\N	\N	400
5716	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5715	\N	1	Sí	\N	\N	\N	\N	\N	100
5717	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5715	\N	1	No	\N	\N	\N	\N	\N	200
5718	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5639	\N	1	Médicos generales	\N	\N	\N	\N	\N	700
5719	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5718	\N	1	LM	\N	\N	\N	\N	\N	100
5720	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5719	\N	1	Sí	\N	\N	\N	\N	\N	100
5721	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5719	\N	1	No	\N	\N	\N	\N	\N	200
5722	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5718	\N	1	SLM	\N	\N	\N	\N	\N	200
5723	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5722	\N	1	Sí	\N	\N	\N	\N	\N	100
5724	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5722	\N	1	No	\N	\N	\N	\N	\N	200
5725	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5718	\N	1	VIH	\N	\N	\N	\N	\N	300
5726	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5725	\N	1	Sí	\N	\N	\N	\N	\N	100
5727	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5725	\N	1	No	\N	\N	\N	\N	\N	200
5728	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5718	\N	1	EP	\N	\N	\N	\N	\N	400
5729	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5728	\N	1	Sí	\N	\N	\N	\N	\N	100
5730	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5728	\N	1	No	\N	\N	\N	\N	\N	200
5731	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5639	\N	1	Auxiliares enfermería	\N	\N	\N	\N	\N	800
5732	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5731	\N	1	LM	\N	\N	\N	\N	\N	100
5733	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5732	\N	1	Sí	\N	\N	\N	\N	\N	100
5734	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5732	\N	1	No	\N	\N	\N	\N	\N	200
5735	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5731	\N	1	SLM	\N	\N	\N	\N	\N	200
5736	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5735	\N	1	Sí	\N	\N	\N	\N	\N	100
5737	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5735	\N	1	No	\N	\N	\N	\N	\N	200
5738	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5731	\N	1	VIH	\N	\N	\N	\N	\N	300
5739	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5738	\N	1	Sí	\N	\N	\N	\N	\N	100
5740	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5738	\N	1	No	\N	\N	\N	\N	\N	200
5741	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5731	\N	1	EP	\N	\N	\N	\N	\N	400
5742	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5741	\N	1	Sí	\N	\N	\N	\N	\N	100
5743	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5741	\N	1	No	\N	\N	\N	\N	\N	200
5744	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5639	\N	1	Otro personal 	\N	\N	\N	\N	\N	900
5745	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5744	\N	1	LM	\N	\N	\N	\N	\N	100
5746	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5745	\N	1	Sí	\N	\N	\N	\N	\N	100
5747	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5745	\N	1	No	\N	\N	\N	\N	\N	200
5748	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5744	\N	1	SLM	\N	\N	\N	\N	\N	200
5749	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5748	\N	1	Sí	\N	\N	\N	\N	\N	100
5750	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5748	\N	1	No	\N	\N	\N	\N	\N	200
5751	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5744	\N	1	VIH	\N	\N	\N	\N	\N	300
5752	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5751	\N	1	Sí	\N	\N	\N	\N	\N	100
5753	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5751	\N	1	No	\N	\N	\N	\N	\N	200
5754	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5744	\N	1	EP	\N	\N	\N	\N	\N	400
5755	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5754	\N	1	Sí	\N	\N	\N	\N	\N	100
5756	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5754	\N	1	No	\N	\N	\N	\N	\N	200
5757	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5744	\N	1	especificar	\N	\N	\N	\N	\N	500
5758	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5639	\N	1	Otro personal 	\N	\N	\N	\N	\N	1000
5759	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5758	\N	1	LM	\N	\N	\N	\N	\N	100
5760	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5759	\N	1	Sí	\N	\N	\N	\N	\N	100
5761	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5759	\N	1	No	\N	\N	\N	\N	\N	200
5762	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5758	\N	1	SLM	\N	\N	\N	\N	\N	200
5763	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5762	\N	1	Sí	\N	\N	\N	\N	\N	100
5764	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5762	\N	1	No	\N	\N	\N	\N	\N	200
5765	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5758	\N	1	VIH	\N	\N	\N	\N	\N	300
5766	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5765	\N	1	Sí	\N	\N	\N	\N	\N	100
5767	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5765	\N	1	No	\N	\N	\N	\N	\N	200
5768	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5758	\N	1	EP	\N	\N	\N	\N	\N	400
5769	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5768	\N	1	Sí	\N	\N	\N	\N	\N	100
5770	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5768	\N	1	No	\N	\N	\N	\N	\N	200
5771	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5758	\N	1	especificar	\N	\N	\N	\N	\N	500
5772	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5639	\N	1	Otro personal 	\N	\N	\N	\N	\N	1100
5773	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5772	\N	1	LM	\N	\N	\N	\N	\N	100
5774	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5773	\N	1	Sí	\N	\N	\N	\N	\N	100
5775	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5773	\N	1	No	\N	\N	\N	\N	\N	200
5776	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5772	\N	1	SLM	\N	\N	\N	\N	\N	200
5777	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5776	\N	1	Sí	\N	\N	\N	\N	\N	100
5778	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5776	\N	1	No	\N	\N	\N	\N	\N	200
5779	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5772	\N	1	VIH	\N	\N	\N	\N	\N	300
5780	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5779	\N	1	Sí	\N	\N	\N	\N	\N	100
5781	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5779	\N	1	No	\N	\N	\N	\N	\N	200
5782	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5772	\N	1	EP	\N	\N	\N	\N	\N	400
5783	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5782	\N	1	Sí	\N	\N	\N	\N	\N	100
5784	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5782	\N	1	No	\N	\N	\N	\N	\N	200
5785	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5772	\N	1	especificar	\N	\N	\N	\N	\N	500
5786	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5534	\N	1	7	\N	\N	\N	\N	\N	800
5787	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5786	\N	1	¿Existe una Comisión Amigo de la Madre y del Niño en el establecimiento de salud?  	\N	\N	\N	\N	\N	100
5788	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5787	\N	1	Sí	\N	\N	\N	\N	\N	100
5789	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5788	\N	1	Cuándo se conformó	\N	\N	\N	\N	\N	100
5790	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5787	\N	1	No	\N	\N	\N	\N	\N	200
5791	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5534	\N	1	8	\N	\N	\N	\N	\N	900
5792	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5791	\N	1	Estadísticas en nacimientos 	\N	\N	\N	\N	\N	100
5793	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5792	\N	1	Total de nacimientos en el último año: 	\N	\N	\N	\N	\N	100
5794	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5792	\N	1	De los nacimientos: 	\N	\N	\N	\N	\N	200
5795	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5794	\N	1	Número de partos normales	\N	\N	\N	\N	\N	100
5796	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5795	\N	1	no litotómicos	\N	\N	\N	\N	\N	100
5797	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5794	\N	1	Número de partos por cesárea 	\N	\N	\N	\N	\N	200
5798	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5797	\N	1	con anestesia general	\N	\N	\N	\N	\N	100
5799	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5794	\N	1	Número de nacidos vivos totales	\N	\N	\N	\N	\N	300
5800	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5794	\N	1	Número de neonatos ingresados en el servicio de neonatología	\N	\N	\N	\N	\N	400
5801	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5794	\N	1	Número de partos atendidos a madres VIH positivo	\N	\N	\N	\N	\N	500
5802	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5801	\N	1	partos expulsivos 	\N	\N	\N	\N	\N	100
5803	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5534	\N	1	9	\N	\N	\N	\N	\N	1000
5804	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5803	\N	1	Información en VIH/Sida	\N	\N	\N	\N	\N	100
5805	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5804	\N	1	Número de embarazadas que  fueron asesoradas  o recibieron pre consejería para VIH en el último año	\N	\N	\N	\N	\N	100
5806	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5804	\N	1	Número de embarazadas que  fueron tamizadas para VIH	\N	\N	\N	\N	\N	200
5807	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5534	\N	1	10	\N	\N	\N	\N	\N	1100
5808	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5807	\N	1	Información para Sífilis	\N	\N	\N	\N	\N	100
5809	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5808	\N	1	Número de embarazadas que fueron tamizadas para sífilis	\N	\N	\N	\N	\N	100
5810	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5534	\N	1	11	\N	\N	\N	\N	\N	1200
5811	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5810	\N	1	Fuentes de esta información	\N	\N	\N	\N	\N	100
5812	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5811	\N	1	Nombre y apellido	\N	\N	\N	\N	\N	100
5813	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	2	cabecera	\N	\N	\N	\N	\N	100
5814	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5813	\N	2	No.	\N	\N	\N	\N	\N	100
5815	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5813	\N	2	Zona	\N	\N	\N	\N	\N	200
5816	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5813	\N	2	Distrito	\N	\N	\N	\N	\N	300
5817	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5813	\N	2	Nombre del establecimiento de salud (ES)	\N	\N	\N	\N	\N	400
5818	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5813	\N	2	Nombre del responsable del ES	\N	\N	\N	\N	\N	500
5819	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5813	\N	2	Cargo	\N	\N	\N	\N	\N	600
5820	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5813	\N	2	UNICÓDIGO	\N	\N	\N	\N	\N	700
5821	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5813	\N	2	Nombre del evaluador/a	\N	\N	\N	\N	\N	800
5822	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5813	\N	2	Fecha	\N	\N	\N	\N	\N	900
5823	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5813	\N	2	Número de personal que trabaja en el ES	\N	\N	\N	\N	\N	1000
5824	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	2	A. Datos del Establecimiento de Salud	\N	\N	\N	\N	\N	200
5825	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5824	\N	2	Tipo de establecimiento	\N	\N	\N	\N	\N	100
5826	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	2	B. Observaciones	\N	\N	\N	\N	\N	300
5827	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5826	\N	2	1. ¿El establecimiento cuenta con material edu-comunicacional exhibido en áreas visibles relacionado a la norma ESAMyN?	\N	\N	\N	\N	\N	100
5828	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5827	\N	2	verificador	\N	\N	\N	\N	\N	100
5829	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5828	\N	2	G.1.b Ob	\N	\N	\N	\N	\N	100
5830	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5827	\N	2	respuestas	\N	\N	\N	\N	\N	200
5831	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5830	\N	2	Sí	\N	\N	\N	\N	\N	100
5832	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5831	\N	2	¿Cuántos elementos observó?	\N	\N	\N	\N	\N	100
5833	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5830	\N	2	No	\N	\N	\N	\N	\N	200
5834	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5827	\N	2	nota	\N	\N	\N	\N	\N	300
5835	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5826	\N	2	2. El ES cuenta con espacio adecuado y equipamiento para permitir a las mujeres caminar y movilizarse durante el trabajo de parto. \nEl espacio adecuado será el siguiente:\n1. Paredes pintadas con colores cálidos (claros del rojo, naranja o amarillo), sin azulejo.\n2.Iluminación indirecta (luz cálida  \naplique en las paredes) \n3. Climatización automatizado o portátil  que permita ajustar la temperatura en 25° \n4. Debe permitir el libre movimiento  de la embarazada \nEl equipamiento mínimo será el siguiente:\n1. Pelota de dilatación  \n2. Cobija\nSi deberá cumplir con todas las características indicadas para marcar “sí”.\n	\N	\N	\N	\N	\N	200
5836	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5835	\N	2	verificador	\N	\N	\N	\N	\N	100
5837	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5836	\N	2	P.3.a1 Ob	\N	\N	\N	\N	\N	100
5838	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5835	\N	2	respuestas	\N	\N	\N	\N	\N	200
5839	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5838	\N	2	Sí	\N	\N	\N	\N	\N	100
5840	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5838	\N	2	No	\N	\N	\N	\N	\N	200
5841	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5838	\N	2	Observaciones	\N	\N	\N	\N	\N	300
5842	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5835	\N	2	nota	\N	\N	\N	\N	\N	300
5843	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5826	\N	2	3. El ES cuenta con el equipamiento para permitir a las mujeres asumir la posición de su elección durante el parto\nEl equipamiento mínimo será el siguiente:\n1. Tela suspendida en el techo \n2. Taburete para atención del parto en cuclillas \n3. Colchoneta  \n4. Mesa baja auxiliar \n5. Lámpara de suelo cuello de ganso \n6. Dispensador de agua \n7. Cobija\n8. Barra de sujeción para parto vertical  \n9. Taburete de parto (silla holandesa) 10. Silla para acompañante \n11. Sistema de climatización temperatura 25° (SATISFACTORIO)	\N	\N	\N	\N	\N	300
5844	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5843	\N	2	verificador	\N	\N	\N	\N	\N	100
5845	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5844	\N	2	P.3.a2 Ob	\N	\N	\N	\N	\N	100
5846	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5843	\N	2	respuestas	\N	\N	\N	\N	\N	200
5847	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5846	\N	2	Sí	\N	\N	\N	\N	\N	100
5848	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5846	\N	2	No	\N	\N	\N	\N	\N	200
5849	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5846	\N	2	Observaciones	\N	\N	\N	\N	\N	300
5850	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5843	\N	2	nota	\N	\N	\N	\N	\N	300
5851	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5850	\N	2	(Si cumple con los primeros ocho se debe marcar sí.  Esta pregunta vale 0.5 puntos en el formulario de evaluación)	\N	\N	\N	\N	\N	100
5852	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5826	\N	2	4. El ES cuenta con espacios adecuados para garantizar el parto en libre posición y con acompañamiento de acuerdo a las siguientes características: \n1. Paredes pintadas con colores cálidos (claros del rojo, naranja o amarillo), sin azulejo.\n2.Iluminación indirecta (luz cálida  \naplique en las paredes).\n3. Climatización automatizado o portátil  que permita ajustar la temperatura en 25°.\n4. Debe permitir el libre movimiento  de la embarazada.	\N	\N	\N	\N	\N	400
5853	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5852	\N	2	verificador	\N	\N	\N	\N	\N	100
5854	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5853	\N	2	P.3.a2 Ob	\N	\N	\N	\N	\N	100
5855	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5852	\N	2	respuestas	\N	\N	\N	\N	\N	200
5856	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5855	\N	2	Sí	\N	\N	\N	\N	\N	100
5857	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5855	\N	2	No	\N	\N	\N	\N	\N	200
5858	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5855	\N	2	Observaciones	\N	\N	\N	\N	\N	300
5859	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5852	\N	2	nota	\N	\N	\N	\N	\N	300
5860	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5859	\N	2	Si cumple con todas las características.  Esta pregunta vale 0.5 puntos en el formulario de evaluación)	\N	\N	\N	\N	\N	100
5861	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5826	\N	2	5. Después de observar el parto vaginal, ¿el bebé fue colocado en contacto piel a piel con la madre en los 5 minutos después del nacimiento?	\N	\N	\N	\N	\N	500
5862	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5861	\N	2	verificador	\N	\N	\N	\N	\N	100
5863	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5862	\N	2	P.6.a Ob	\N	\N	\N	\N	\N	100
5864	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5861	\N	2	respuestas	\N	\N	\N	\N	\N	200
5865	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5864	\N	2	Sí	\N	\N	\N	\N	\N	100
5866	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5865	\N	2	(Cumplió con la normativa de apego precoz)	\N	\N	\N	\N	\N	100
5867	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5864	\N	2	No	\N	\N	\N	\N	\N	200
5868	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5867	\N	2	¿se explicó una razón?	\N	\N	\N	\N	\N	100
5869	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5868	\N	2	Sí	\N	\N	\N	\N	\N	100
5870	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5868	\N	2	No	\N	\N	\N	\N	\N	200
5871	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5861	\N	2	nota	\N	\N	\N	\N	\N	300
5872	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5826	\N	2	6. Después de ser colocado piel con piel, ¿el personal de salud mostró a la madre cómo amamantar?	\N	\N	\N	\N	\N	600
5873	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5872	\N	2	verificador	\N	\N	\N	\N	\N	100
5874	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5873	\N	2	P.6.a Ob	\N	\N	\N	\N	\N	100
5875	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5872	\N	2	respuestas	\N	\N	\N	\N	\N	200
5876	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5875	\N	2	Sí	\N	\N	\N	\N	\N	100
5877	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5875	\N	2	No	\N	\N	\N	\N	\N	200
5878	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5877	\N	2	¿se explicó una razón?	\N	\N	\N	\N	\N	100
5879	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5878	\N	2	Sí	\N	\N	\N	\N	\N	100
5880	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5878	\N	2	No	\N	\N	\N	\N	\N	200
5881	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5875	\N	2	Observaciones	\N	\N	\N	\N	\N	300
5882	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5872	\N	2	nota	\N	\N	\N	\N	\N	300
5883	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5826	\N	2	7. De las madres observadas que amamantan. ¿Cuántas amamantan con la técnica adecuada?	\N	\N	\N	\N	\N	700
5884	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5883	\N	2	verificador	\N	\N	\N	\N	\N	100
5885	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5884	\N	2	L.3.a Ob	\N	\N	\N	\N	\N	100
5886	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5883	\N	2	respuestas	\N	\N	\N	\N	\N	200
5887	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5886	\N	2	a) Nº de madres observadas	\N	\N	\N	\N	\N	100
5888	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5886	\N	2	b) Nº de madres que amamantan con técnica adecuada	\N	\N	\N	\N	\N	200
5889	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5886	\N	2	c) %  de madres que  amamantan según  técnica adecuada	\N	\N	\N	\N	\N	300
5890	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5886	\N	2	Observaciones	\N	\N	\N	\N	\N	400
5891	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5883	\N	2	nota	\N	\N	\N	\N	\N	300
5892	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5826	\N	2	8. De las madres observadas ¿Cuántas practican el alojamiento conjunto?	\N	\N	\N	\N	\N	800
5893	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5892	\N	2	verificador	\N	\N	\N	\N	\N	100
5894	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5893	\N	2	L.5.b Ob	\N	\N	\N	\N	\N	100
5895	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5892	\N	2	respuestas	\N	\N	\N	\N	\N	200
5896	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5895	\N	2	a) Nº de madres observadas	\N	\N	\N	\N	\N	100
5897	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5895	\N	2	b) Nº de madres que comparten habitación con sus bebés:	\N	\N	\N	\N	\N	200
5898	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5895	\N	2	c) Nº de madres que no comparten habitación con sus bebés  y explican una razón:	\N	\N	\N	\N	\N	300
5899	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5895	\N	2	d) % de madres que comparten  cama con sus bebés :	\N	\N	\N	\N	\N	400
5900	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5895	\N	2	Observaciones	\N	\N	\N	\N	\N	500
5901	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5892	\N	2	nota	\N	\N	\N	\N	\N	300
5902	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5826	\N	2	9. De los bebés observados ¿Cuántos fueron alimentados con biberón o usaron chupón?	\N	\N	\N	\N	\N	900
5903	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5902	\N	2	verificador	\N	\N	\N	\N	\N	100
5904	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5903	\N	2	L.7.a Ob	\N	\N	\N	\N	\N	100
5905	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5902	\N	2	respuestas	\N	\N	\N	\N	\N	200
5906	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5905	\N	2	a) Nº de bebés observados:	\N	\N	\N	\N	\N	100
5907	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5905	\N	2	b) Nº de bebés con biberón o usando chupón	\N	\N	\N	\N	\N	200
5908	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5905	\N	2	c) % de bebés que no usan biberones  ni chupones:	\N	\N	\N	\N	\N	300
5909	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5905	\N	2	Observaciones a las causas de uso de biberón:	\N	\N	\N	\N	\N	400
5910	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5902	\N	2	nota	\N	\N	\N	\N	\N	300
5911	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5826	\N	2	10. Existe patrocinio o promoción de la industria de sucedáneos de la leche materna, biberones y/o chupones en el ES	\N	\N	\N	\N	\N	1000
5912	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5911	\N	2	verificador	\N	\N	\N	\N	\N	100
5913	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5912	\N	2	L.9.c Ob	\N	\N	\N	\N	\N	100
5914	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5911	\N	2	respuestas	\N	\N	\N	\N	\N	200
5915	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5914	\N	2	Sí	\N	\N	\N	\N	\N	100
5916	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5915	\N	2	¿Qué tipo de material?	\N	\N	\N	\N	\N	100
5917	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5915	\N	2	Nombre de empresa/s:	\N	\N	\N	\N	\N	200
5918	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5914	\N	2	No	\N	\N	\N	\N	\N	200
5919	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5911	\N	2	nota	\N	\N	\N	\N	\N	300
5920	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5826	\N	2	11. ¿El ES tiene a  la vista envases de leche de fórmula o biberones?	\N	\N	\N	\N	\N	1100
5921	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5920	\N	2	verificador	\N	\N	\N	\N	\N	100
5922	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5921	\N	2	L.9.d Ob	\N	\N	\N	\N	\N	100
5923	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5920	\N	2	respuestas	\N	\N	\N	\N	\N	200
5924	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5923	\N	2	Sí	\N	\N	\N	\N	\N	100
5925	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5924	\N	2	¿Dónde se ubican?	\N	\N	\N	\N	\N	100
5926	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5923	\N	2	No	\N	\N	\N	\N	\N	200
5927	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5920	\N	2	nota	\N	\N	\N	\N	\N	300
5928	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5826	\N	2	12. OBSERVACIONES	\N	\N	\N	\N	\N	1200
5929	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	2	C. Documentos a revisar	\N	\N	\N	\N	\N	400
5930	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5929	\N	2	13. ¿Se realizaron actividades para la difusión de la Normativa ESAMyN?	\N	\N	\N	\N	\N	100
5931	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5930	\N	2	verificador	\N	\N	\N	\N	\N	100
5932	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5931	\N	2	G.1.a Informe	\N	\N	\N	\N	\N	100
5933	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5930	\N	2	respuesta	\N	\N	\N	\N	\N	200
5934	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5933	\N	2	Sí	\N	\N	\N	\N	\N	100
5935	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5934	\N	2	¿Cuántas actividades?	\N	\N	\N	\N	\N	100
5936	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5934	\N	2	¿Existe informe de actividades con nombres de asistentes?	\N	\N	\N	\N	\N	200
5937	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5936	\N	2	Sí	\N	\N	\N	\N	\N	100
5938	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5936	\N	2	No	\N	\N	\N	\N	\N	200
5939	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5938	\N	2	(Si es que no existe, se marca “No”)	\N	\N	\N	\N	\N	100
5940	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5933	\N	2	No	\N	\N	\N	\N	\N	200
5941	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5930	\N	2	nota	\N	\N	\N	\N	\N	300
5942	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5929	\N	2	14. ¿El personal de salud cumplió con el programa de capacitación para atención materno infantil?	\N	\N	\N	\N	\N	200
5943	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5942	\N	2	verificador	\N	\N	\N	\N	\N	100
5944	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5943	\N	2	G.1.a Informe	\N	\N	\N	\N	\N	100
5945	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5942	\N	2	respuesta	\N	\N	\N	\N	\N	200
5946	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5945	\N	2	Sí	\N	\N	\N	\N	\N	100
5947	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5946	\N	2	¿Existen informes de capacitación con nombres de asistentes en los siguientes temas?	\N	\N	\N	\N	\N	100
5948	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5947	\N	2	a) Norma de educación prenatal	\N	\N	\N	\N	\N	100
5949	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5947	\N	2	b) Lactancia materna	\N	\N	\N	\N	\N	200
5950	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5947	\N	2	c) Asesoría en planificación familiar	\N	\N	\N	\N	\N	300
5951	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5947	\N	2	d) Asesoría en VIH	\N	\N	\N	\N	\N	400
5952	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5947	\N	2	e) Enfoque en salud intercultural	\N	\N	\N	\N	\N	500
5953	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5947	\N	2	f) Manejo estandarizado de complicaciones que amenazan la vida de la madre y recién nacido	\N	\N	\N	\N	\N	600
5954	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5947	\N	2	g) Manejo del dolor con métodos no farmacológicos	\N	\N	\N	\N	\N	700
5955	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5947	\N	2	h) Otros:	\N	\N	\N	\N	\N	800
5956	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5947	\N	2	¿Cuál? Detalle:	\N	\N	\N	\N	\N	900
5957	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5947	\N	2	(Si no se marcan al menos 3 casilleros, se responde “No” en el casillero siguiente)	\N	\N	\N	\N	\N	1000
5958	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5945	\N	2	No	\N	\N	\N	\N	\N	200
5959	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5942	\N	2	nota	\N	\N	\N	\N	\N	300
5960	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5929	\N	2	15. Si existe informe de capacitación para la norma de educación prenatal, este apartado se marca “Si”, de lo contrario, “No”	\N	\N	\N	\N	\N	300
5961	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5960	\N	2	verificador	\N	\N	\N	\N	\N	100
5962	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5961	\N	2	R.1.a Informe	\N	\N	\N	\N	\N	100
5963	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5960	\N	2	respuesta	\N	\N	\N	\N	\N	200
5964	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5963	\N	2	Sí	\N	\N	\N	\N	\N	100
5965	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5963	\N	2	No	\N	\N	\N	\N	\N	200
5966	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5960	\N	2	nota	\N	\N	\N	\N	\N	300
5967	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5929	\N	2	16. Si existe informe de capacitación en enfoque en salud intercultural, este apartado se marca “Si”, de lo contrario, “No”	\N	\N	\N	\N	\N	400
5968	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5967	\N	2	verificador	\N	\N	\N	\N	\N	100
5969	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5968	\N	2	P.2.a Informe	\N	\N	\N	\N	\N	100
5970	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5967	\N	2	respuesta	\N	\N	\N	\N	\N	200
5971	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5970	\N	2	Sí	\N	\N	\N	\N	\N	100
5972	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5970	\N	2	No	\N	\N	\N	\N	\N	200
5973	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5967	\N	2	nota	\N	\N	\N	\N	\N	300
5974	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5929	\N	2	17. Si existe informe de capacitación enmanejo del dolor con métodos no farmacológicos (en norma de educación prenatal), este apartado se marca “Si”, de lo contrario, “No”	\N	\N	\N	\N	\N	500
5975	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5974	\N	2	verificador	\N	\N	\N	\N	\N	100
5976	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5975	\N	2	P.4.b Informe	\N	\N	\N	\N	\N	100
5977	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5974	\N	2	respuesta	\N	\N	\N	\N	\N	200
5978	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5977	\N	2	Sí	\N	\N	\N	\N	\N	100
5979	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5977	\N	2	No	\N	\N	\N	\N	\N	200
5980	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5974	\N	2	nota	\N	\N	\N	\N	\N	300
5981	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5929	\N	2	18. Si existe informe de capacitación en Manejo estandarizado de complicaciones que amenazan la vida de la madre y recién nacido, este apartado se marca “Si”, de lo contrario, “No”	\N	\N	\N	\N	\N	600
5982	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5981	\N	2	verificador	\N	\N	\N	\N	\N	100
5983	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5982	\N	2	P.8.a Informe	\N	\N	\N	\N	\N	100
5984	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5981	\N	2	respuesta	\N	\N	\N	\N	\N	200
5985	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5984	\N	2	Sí	\N	\N	\N	\N	\N	100
5986	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5984	\N	2	No	\N	\N	\N	\N	\N	200
5987	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5981	\N	2	nota	\N	\N	\N	\N	\N	300
5988	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5929	\N	2	19. ¿Existe un documento donde se incluya un mapeo de agentes de la medicina ancestral?\n\n(En el caso de Primer Nivel, revisar en el ASIS. En este caso, el establecimiento de salud cuenta con parteras legitimadas por la comunidad y cuentan con la certificación institucional. Verificadas con la certificación y copia del documento de legitimación de la comunidad.\nPara hospitales y otros establecimientos, confirmar en informes)	\N	\N	\N	\N	\N	700
5989	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5988	\N	2	verificador	\N	\N	\N	\N	\N	100
5990	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5989	\N	2	R.4.a ASIS	\N	\N	\N	\N	\N	100
5991	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5988	\N	2	respuesta	\N	\N	\N	\N	\N	200
5992	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5991	\N	2	Sí	\N	\N	\N	\N	\N	100
5993	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5991	\N	2	No	\N	\N	\N	\N	\N	200
5994	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5988	\N	2	nota	\N	\N	\N	\N	\N	300
5995	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5929	\N	2	20. ¿El establecimiento cuenta con un documento que establezca mecanismos de articulación con agentes de la medicina ancestral, y ha sido firmado por ambas partes?	\N	\N	\N	\N	\N	800
5996	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5995	\N	2	verificador	\N	\N	\N	\N	\N	100
5997	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5996	\N	2	R.4.b Informe	\N	\N	\N	\N	\N	100
5998	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5995	\N	2	respuesta	\N	\N	\N	\N	\N	200
5999	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5998	\N	2	Sí	\N	\N	\N	\N	\N	100
6000	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5998	\N	2	No	\N	\N	\N	\N	\N	200
6001	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6000	\N	2	El establecimiento encontró agentes de la medicina ancestral?	\N	\N	\N	\N	\N	100
6002	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6001	\N	2	Sí	\N	\N	\N	\N	\N	100
6003	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6001	\N	2	No	\N	\N	\N	\N	\N	200
6004	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6003	\N	2	(Si es que marca No marca no aplica en el formulario de evaluacion)	\N	\N	\N	\N	\N	100
6005	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5995	\N	2	nota	\N	\N	\N	\N	\N	300
6006	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5929	\N	2	21. El Establecimiento se relaciona con agentes ancestrales mediante la capacitación y diálogo de saberes	\N	\N	\N	\N	\N	900
6007	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6006	\N	2	verificador	\N	\N	\N	\N	\N	100
6008	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6007	\N	2	R.4.b Informe	\N	\N	\N	\N	\N	100
6009	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6006	\N	2	respuesta	\N	\N	\N	\N	\N	200
6010	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6009	\N	2	Sí	\N	\N	\N	\N	\N	100
6011	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6009	\N	2	No	\N	\N	\N	\N	\N	200
6012	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6006	\N	2	nota	\N	\N	\N	\N	\N	300
6013	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	5929	\N	2	22. Observaciones	\N	\N	\N	\N	\N	1000
6014	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	3	cabecera	\N	\N	\N	\N	\N	100
6015	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6014	\N	3	No.	\N	\N	\N	\N	\N	100
6016	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6014	\N	3	Zona	\N	\N	\N	\N	\N	200
6017	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6014	\N	3	Distrito	\N	\N	\N	\N	\N	300
6018	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6014	\N	3	Nombre del establecimiento de salud (ES)	\N	\N	\N	\N	\N	400
6019	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6014	\N	3	Nombre del responsable del ES	\N	\N	\N	\N	\N	500
6020	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6014	\N	3	UNICÓDIGO	\N	\N	\N	\N	\N	600
6021	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6014	\N	3	Fecha	\N	\N	\N	\N	\N	700
6022	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6014	\N	3	Nombre del evaluador/a	\N	\N	\N	\N	\N	800
6023	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	3	A. Datos de la madre y bebé	\N	\N	\N	\N	\N	200
6024	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6023	\N	3	1. Semanas de gestación	\N	\N	\N	\N	\N	100
6025	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6023	\N	3	2. Fecha probable del parto	\N	\N	\N	\N	\N	200
6026	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6023	\N	3	3. ¿Dará a luz en el establecimiento de salud donde se realiza los controles?	\N	\N	\N	\N	\N	300
6027	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6026	\N	3	Sí	\N	\N	\N	\N	\N	100
6028	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6026	\N	3	No	\N	\N	\N	\N	\N	200
6029	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6028	\N	3	explique dónde será y la razón	\N	\N	\N	\N	\N	100
6030	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	3	B. Atención prenatal	\N	\N	\N	\N	\N	300
6031	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6030	\N	3	4. ¿Le han informado cuántos  controles prenatales debería realizarse?	\N	\N	\N	\N	\N	100
6032	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6031	\N	3	respuesta	\N	\N	\N	\N	\N	100
6033	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6032	\N	3	Sí	\N	\N	\N	\N	\N	100
6034	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6033	\N	3	¿A cuántos controles debería asistir?	\N	\N	\N	\N	\N	100
6035	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6034	\N	3	(Esperar explicación de la madre. Seleccionar una opción)	\N	\N	\N	\N	\N	100
6036	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6034	\N	3	1-2	\N	\N	\N	\N	\N	200
6037	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6036	\N	3	Sí	\N	\N	\N	\N	\N	100
6038	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6036	\N	3	No	\N	\N	\N	\N	\N	200
6039	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6034	\N	3	3-4	\N	\N	\N	\N	\N	300
6040	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6039	\N	3	Sí	\N	\N	\N	\N	\N	100
6041	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6039	\N	3	No	\N	\N	\N	\N	\N	200
6042	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6034	\N	3	5	\N	\N	\N	\N	\N	400
6043	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6042	\N	3	Sí	\N	\N	\N	\N	\N	100
6044	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6042	\N	3	No	\N	\N	\N	\N	\N	200
6045	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6034	\N	3	Más	\N	\N	\N	\N	\N	500
6046	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6045	\N	3	Sí	\N	\N	\N	\N	\N	100
6047	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6045	\N	3	No	\N	\N	\N	\N	\N	200
6048	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6034	\N	3	(No se refiere a un verificador pero la información servirá al establecimiento en su plan de acción)	\N	\N	\N	\N	\N	600
6049	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6032	\N	3	No	\N	\N	\N	\N	\N	200
6050	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6032	\N	3	No sabe/no contesta	\N	\N	\N	\N	\N	300
6051	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6031	\N	3	verificador	\N	\N	\N	\N	\N	200
6052	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6031	\N	3	nota	\N	\N	\N	\N	\N	300
6053	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6030	\N	3	5. ¿La vacunaron durante los controles?	\N	\N	\N	\N	\N	200
6054	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6053	\N	3	respuesta	\N	\N	\N	\N	\N	100
6055	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6054	\N	3	Sí	\N	\N	\N	\N	\N	100
6056	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6054	\N	3	No	\N	\N	\N	\N	\N	200
6057	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6054	\N	3	No sabe/no contesta	\N	\N	\N	\N	\N	300
6058	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6053	\N	3	verificador	\N	\N	\N	\N	\N	200
6059	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6058	\N	3	R.2.c4 EM	\N	\N	\N	\N	\N	100
6060	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6053	\N	3	nota	\N	\N	\N	\N	\N	300
6061	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6030	\N	3	6. ¿Piensa darle el seno a su bebé?	\N	\N	\N	\N	\N	300
6062	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6061	\N	3	respuesta	\N	\N	\N	\N	\N	100
6063	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6062	\N	3	Sí	\N	\N	\N	\N	\N	100
6064	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6063	\N	3	¿Por cuántos meses?	\N	\N	\N	\N	\N	100
6065	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6062	\N	3	No	\N	\N	\N	\N	\N	200
6066	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6065	\N	3	(Si no, llenar inclusive la sección C)	\N	\N	\N	\N	\N	100
6067	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6062	\N	3	No sabe/no contesta	\N	\N	\N	\N	\N	300
6068	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6061	\N	3	verificador	\N	\N	\N	\N	\N	200
6069	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6061	\N	3	nota	\N	\N	\N	\N	\N	300
6070	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6030	\N	3	7. ¿Le han brindado asesoría sobre los beneficios de la lactancia materna?	\N	\N	\N	\N	\N	400
6071	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6070	\N	3	respuesta	\N	\N	\N	\N	\N	100
6072	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6071	\N	3	Sí	\N	\N	\N	\N	\N	100
6073	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6072	\N	3	¿Qué beneficios le explicaron sobre la leche materna?	\N	\N	\N	\N	\N	100
6074	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6073	\N	3	(Esperar explicación de la madre. Se puede seleccionar más de uno)	\N	\N	\N	\N	\N	100
6075	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6073	\N	3	a) Beneficios para el bebé	\N	\N	\N	\N	\N	200
6076	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6075	\N	3	Sí	\N	\N	\N	\N	\N	100
6077	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6075	\N	3	No	\N	\N	\N	\N	\N	200
6078	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6073	\N	3	b) Beneficios para la madre	\N	\N	\N	\N	\N	300
6079	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6078	\N	3	Sí	\N	\N	\N	\N	\N	100
6080	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6078	\N	3	No	\N	\N	\N	\N	\N	200
6081	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6073	\N	3	c) Beneficios económicos	\N	\N	\N	\N	\N	400
6082	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6081	\N	3	Sí	\N	\N	\N	\N	\N	100
6083	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6081	\N	3	No	\N	\N	\N	\N	\N	200
6084	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6073	\N	3	d) Vínculo madre-hijo	\N	\N	\N	\N	\N	500
6085	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6084	\N	3	Sí	\N	\N	\N	\N	\N	100
6086	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6084	\N	3	No	\N	\N	\N	\N	\N	200
6087	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6073	\N	3	e) Otros beneficios	\N	\N	\N	\N	\N	600
6088	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6087	\N	3	Sí	\N	\N	\N	\N	\N	100
6089	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6087	\N	3	No	\N	\N	\N	\N	\N	200
6090	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6073	\N	3	f) Ninguno	\N	\N	\N	\N	\N	700
6091	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6090	\N	3	Sí	\N	\N	\N	\N	\N	100
6092	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6090	\N	3	No	\N	\N	\N	\N	\N	200
6093	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6073	\N	3	(Debe mencionar al menos 1, si no menciona ninguno, se marca no en la Evaluación)	\N	\N	\N	\N	\N	800
6094	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6071	\N	3	No	\N	\N	\N	\N	\N	200
6095	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6071	\N	3	No sabe/no contesta	\N	\N	\N	\N	\N	300
6096	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6070	\N	3	verificador	\N	\N	\N	\N	\N	200
6097	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6096	\N	3	L.1.a EM	\N	\N	\N	\N	\N	100
6098	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6070	\N	3	nota	\N	\N	\N	\N	\N	300
6099	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6030	\N	3	8. ¿Le han informado sobre métodos anticonceptivos?	\N	\N	\N	\N	\N	500
6100	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6099	\N	3	respuesta	\N	\N	\N	\N	\N	100
6101	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6100	\N	3	Sí	\N	\N	\N	\N	\N	100
6102	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6101	\N	3	¿Qué métodos le han ofrecido?	\N	\N	\N	\N	\N	100
6103	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6102	\N	3	(Mencionar y marcar las opciones. Se puede seleccionar más de uno)	\N	\N	\N	\N	\N	100
6104	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6102	\N	3	a) Barrera (preservativos femeninos o masculinos)	\N	\N	\N	\N	\N	200
6105	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6104	\N	3	Sí	\N	\N	\N	\N	\N	100
6106	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6104	\N	3	No	\N	\N	\N	\N	\N	200
6107	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6102	\N	3	b) Hormonales (implantes o vía oral)	\N	\N	\N	\N	\N	300
6108	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6107	\N	3	Sí	\N	\N	\N	\N	\N	100
6109	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6107	\N	3	No	\N	\N	\N	\N	\N	200
6110	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6102	\N	3	c) DIU – T de cobre	\N	\N	\N	\N	\N	400
6111	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6110	\N	3	Sí	\N	\N	\N	\N	\N	100
6112	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6110	\N	3	No	\N	\N	\N	\N	\N	200
6113	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6102	\N	3	d) Definitivos (vasectomía o ligadura)	\N	\N	\N	\N	\N	500
6114	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6113	\N	3	Sí	\N	\N	\N	\N	\N	100
6115	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6113	\N	3	No	\N	\N	\N	\N	\N	200
6116	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6102	\N	3	e) Ninguno	\N	\N	\N	\N	\N	600
6117	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6116	\N	3	Sí	\N	\N	\N	\N	\N	100
6118	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6116	\N	3	No	\N	\N	\N	\N	\N	200
6119	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6102	\N	3	(Si no menciona ninguno, se marca no)	\N	\N	\N	\N	\N	700
6120	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6100	\N	3	No	\N	\N	\N	\N	\N	200
6121	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6100	\N	3	No sabe/no contesta	\N	\N	\N	\N	\N	300
6122	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6099	\N	3	verificador	\N	\N	\N	\N	\N	200
6123	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6122	\N	3	R.1.c EM	\N	\N	\N	\N	\N	100
6124	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6099	\N	3	nota	\N	\N	\N	\N	\N	300
6125	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6030	\N	3	9. ¿Ha recibido asesoría para prevenir Infecciones de transmisión sexual (ITS) entre ellas VIH y sífilis?	\N	\N	\N	\N	\N	600
6126	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6125	\N	3	respuesta	\N	\N	\N	\N	\N	100
6127	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6126	\N	3	Sí	\N	\N	\N	\N	\N	100
6128	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6126	\N	3	No	\N	\N	\N	\N	\N	200
6129	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6126	\N	3	No sabe/no contesta	\N	\N	\N	\N	\N	300
6130	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6125	\N	3	verificador	\N	\N	\N	\N	\N	200
6131	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6130	\N	3	R.3.a EM	\N	\N	\N	\N	\N	100
6132	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6125	\N	3	nota	\N	\N	\N	\N	\N	300
6133	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6030	\N	3	10. ¿Recibió información sobre el test de VIH?	\N	\N	\N	\N	\N	700
6134	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6133	\N	3	respuesta	\N	\N	\N	\N	\N	100
6135	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6134	\N	3	Sí	\N	\N	\N	\N	\N	100
6136	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6135	\N	3	¿Cuál es la importancia de realizarse el test?	\N	\N	\N	\N	\N	100
6137	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6136	\N	3	(Esperar explicación de la madre y marcar según la categoría. Se puede seleccionar más de uno)	\N	\N	\N	\N	\N	100
6138	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6136	\N	3	a) Prevención de transmisión vertical	\N	\N	\N	\N	\N	200
6139	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6138	\N	3	Sí	\N	\N	\N	\N	\N	100
6140	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6138	\N	3	No	\N	\N	\N	\N	\N	200
6141	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6136	\N	3	b) Prevención de transmisión sexual del virus	\N	\N	\N	\N	\N	300
6142	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6141	\N	3	Sí	\N	\N	\N	\N	\N	100
6143	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6141	\N	3	No	\N	\N	\N	\N	\N	200
6144	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6136	\N	3	c) Acceder a tratamiento	\N	\N	\N	\N	\N	400
6145	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6144	\N	3	Sí	\N	\N	\N	\N	\N	100
6146	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6144	\N	3	No	\N	\N	\N	\N	\N	200
6147	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6136	\N	3	d) Ninguno	\N	\N	\N	\N	\N	500
6148	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6147	\N	3	Sí	\N	\N	\N	\N	\N	100
6149	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6147	\N	3	No	\N	\N	\N	\N	\N	200
6150	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6136	\N	3	(Si no menciona la importancia, se marca “No”)	\N	\N	\N	\N	\N	600
6151	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6134	\N	3	No	\N	\N	\N	\N	\N	200
6152	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6134	\N	3	No sabe/no contesta	\N	\N	\N	\N	\N	300
6153	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6133	\N	3	verificador	\N	\N	\N	\N	\N	200
6154	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6153	\N	3	R.3.a EM	\N	\N	\N	\N	\N	100
6155	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6133	\N	3	nota	\N	\N	\N	\N	\N	300
6156	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6030	\N	3	11. ¿Se realizó el test de VIH?	\N	\N	\N	\N	\N	800
6157	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6156	\N	3	respuesta	\N	\N	\N	\N	\N	100
6158	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6157	\N	3	Sí	\N	\N	\N	\N	\N	100
6159	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6158	\N	3	¿Solicitaron su autorización para la prueba?	\N	\N	\N	\N	\N	100
6160	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6159	\N	3	Sí	\N	\N	\N	\N	\N	100
6161	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6159	\N	3	No	\N	\N	\N	\N	\N	200
6162	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6157	\N	3	No	\N	\N	\N	\N	\N	200
6163	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6157	\N	3	No sabe/no contesta	\N	\N	\N	\N	\N	300
6164	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6156	\N	3	verificador	\N	\N	\N	\N	\N	200
6165	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6164	\N	3	R.3.b EM	\N	\N	\N	\N	\N	100
6166	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6156	\N	3	nota	\N	\N	\N	\N	\N	300
6167	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6030	\N	3	12. ¿Le informaron sobre los signos de peligro durante el embarazo?	\N	\N	\N	\N	\N	900
6168	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6167	\N	3	respuesta	\N	\N	\N	\N	\N	100
6169	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6168	\N	3	Sí	\N	\N	\N	\N	\N	100
6170	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6169	\N	3	¿Puede mencionar los que recuerde?	\N	\N	\N	\N	\N	100
6171	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6170	\N	3	(Esperar explicación de la madre. Se puede seleccionar más de uno)	\N	\N	\N	\N	\N	100
6172	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6170	\N	3	a) Dolor de cabeza y visión borrosa	\N	\N	\N	\N	\N	200
6173	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6172	\N	3	Sí	\N	\N	\N	\N	\N	100
6174	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6172	\N	3	No	\N	\N	\N	\N	\N	200
6175	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6170	\N	3	b) Fuerte dolor de barriga	\N	\N	\N	\N	\N	300
6176	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6175	\N	3	Sí	\N	\N	\N	\N	\N	100
6177	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6175	\N	3	No	\N	\N	\N	\N	\N	200
6178	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6170	\N	3	c) Hemorragia vaginal	\N	\N	\N	\N	\N	400
6179	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6178	\N	3	Sí	\N	\N	\N	\N	\N	100
6180	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6178	\N	3	No	\N	\N	\N	\N	\N	200
6181	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6170	\N	3	d) Salida de agua de fuente	\N	\N	\N	\N	\N	500
6182	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6181	\N	3	Sí	\N	\N	\N	\N	\N	100
6183	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6181	\N	3	No	\N	\N	\N	\N	\N	200
6184	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6170	\N	3	e) Fiebre alta	\N	\N	\N	\N	\N	600
6185	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6184	\N	3	Sí	\N	\N	\N	\N	\N	100
6186	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6184	\N	3	No	\N	\N	\N	\N	\N	200
6187	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6170	\N	3	f) Falta de movimiento del bebe	\N	\N	\N	\N	\N	700
6188	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6187	\N	3	Sí	\N	\N	\N	\N	\N	100
6189	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6187	\N	3	No	\N	\N	\N	\N	\N	200
6190	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6170	\N	3	g) Ninguno	\N	\N	\N	\N	\N	800
6191	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6190	\N	3	Sí	\N	\N	\N	\N	\N	100
6192	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6190	\N	3	No	\N	\N	\N	\N	\N	200
6193	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6168	\N	3	No	\N	\N	\N	\N	\N	200
6194	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6168	\N	3	No sabe/no contesta	\N	\N	\N	\N	\N	300
6195	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6167	\N	3	verificador	\N	\N	\N	\N	\N	200
6196	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6195	\N	3	R.2.c3 EM	\N	\N	\N	\N	\N	100
6197	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6167	\N	3	nota	\N	\N	\N	\N	\N	300
6198	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6030	\N	3	13. ¿Le asesoraron para realizar el plan de parto y plan de transporte?	\N	\N	\N	\N	\N	1000
6199	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6198	\N	3	respuesta	\N	\N	\N	\N	\N	100
6200	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6199	\N	3	Sí	\N	\N	\N	\N	\N	100
6201	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6199	\N	3	No	\N	\N	\N	\N	\N	200
6202	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6199	\N	3	No sabe/no contesta	\N	\N	\N	\N	\N	300
6203	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6198	\N	3	verificador	\N	\N	\N	\N	\N	200
6204	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6203	\N	3	R.2.c2 EM	\N	\N	\N	\N	\N	100
6205	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6198	\N	3	nota	\N	\N	\N	\N	\N	300
6206	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6030	\N	3	14. ¿El personal de salud le ha informado sobre su derecho de estar acompañada por la persona que usted elija durante el trabajo de parto, parto y post parto?	\N	\N	\N	\N	\N	1100
6207	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6206	\N	3	respuesta	\N	\N	\N	\N	\N	100
6208	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6207	\N	3	Sí	\N	\N	\N	\N	\N	100
6209	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6207	\N	3	No	\N	\N	\N	\N	\N	200
6210	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6207	\N	3	No sabe/no contesta	\N	\N	\N	\N	\N	300
6211	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6206	\N	3	verificador	\N	\N	\N	\N	\N	200
6212	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6211	\N	3	P.1.a EM	\N	\N	\N	\N	\N	100
6213	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6211	\N	3	P.1.b EM	\N	\N	\N	\N	\N	200
6214	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6211	\N	3	P.1.c EM	\N	\N	\N	\N	\N	300
6215	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6206	\N	3	nota	\N	\N	\N	\N	\N	300
6216	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6030	\N	3	15. ¿El personal de salud le ha informado sobre su derecho al parto en libre posición?	\N	\N	\N	\N	\N	1200
6217	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6216	\N	3	respuesta	\N	\N	\N	\N	\N	100
6218	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6217	\N	3	Sí	\N	\N	\N	\N	\N	100
6219	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6217	\N	3	No	\N	\N	\N	\N	\N	200
6220	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6217	\N	3	No sabe/no contesta	\N	\N	\N	\N	\N	300
6221	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6216	\N	3	verificador	\N	\N	\N	\N	\N	200
6222	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6221	\N	3	P.3.c1 EM	\N	\N	\N	\N	\N	100
6223	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6216	\N	3	nota	\N	\N	\N	\N	\N	300
6224	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6030	\N	3	16. ¿Le han informado sobre su derecho de usar la vestimenta de su elección durante el parto? 	\N	\N	\N	\N	\N	1300
6225	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6224	\N	3	respuesta	\N	\N	\N	\N	\N	100
6226	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6225	\N	3	Sí	\N	\N	\N	\N	\N	100
6227	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6225	\N	3	No	\N	\N	\N	\N	\N	200
6228	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6225	\N	3	No sabe/no contesta	\N	\N	\N	\N	\N	300
6229	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6224	\N	3	verificador	\N	\N	\N	\N	\N	200
6230	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6229	\N	3	P.2.b EM	\N	\N	\N	\N	\N	100
6231	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6224	\N	3	nota	\N	\N	\N	\N	\N	300
6232	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6030	\N	3	17. ¿Alguien en el ES le ha ofrecido leche de fórmula, biberones o chupones?	\N	\N	\N	\N	\N	1400
6233	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6232	\N	3	respuesta	\N	\N	\N	\N	\N	100
6234	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6233	\N	3	Sí	\N	\N	\N	\N	\N	100
6235	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6233	\N	3	No	\N	\N	\N	\N	\N	200
6236	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6233	\N	3	No sabe/no contesta	\N	\N	\N	\N	\N	300
6237	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6232	\N	3	verificador	\N	\N	\N	\N	\N	200
6238	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6237	\N	3	L.9.a EM	\N	\N	\N	\N	\N	100
6239	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6232	\N	3	nota	\N	\N	\N	\N	\N	300
6240	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6030	\N	3	18. ¿Le han informado sobre grupos de apoyo a la lactancia o la línea de asesoría materna 171?	\N	\N	\N	\N	\N	1500
6241	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6240	\N	3	respuesta	\N	\N	\N	\N	\N	100
6242	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6241	\N	3	Sí	\N	\N	\N	\N	\N	100
6243	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6241	\N	3	No	\N	\N	\N	\N	\N	200
6244	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6241	\N	3	No sabe/no contesta	\N	\N	\N	\N	\N	300
6245	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6240	\N	3	verificador	\N	\N	\N	\N	\N	200
6246	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6245	\N	3	L.8.a EM	\N	\N	\N	\N	\N	100
6247	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6240	\N	3	nota	\N	\N	\N	\N	\N	300
6248	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	3	C. Para madres que no amamantan	\N	\N	\N	\N	\N	400
6249	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6248	\N	3	19. ¿Por qué motivo o razón usted no desea dar de lactar a su bebé? 	\N	\N	\N	\N	\N	100
6250	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6249	\N	3	(Esperar explicación de la madre. Se puede seleccionar más de uno)	\N	\N	\N	\N	\N	100
6251	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6249	\N	3	a) Por recomendación médica	\N	\N	\N	\N	\N	200
6252	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6251	\N	3	Sí	\N	\N	\N	\N	\N	100
6253	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6251	\N	3	No	\N	\N	\N	\N	\N	200
6254	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6249	\N	3	b) Por decisión propia	\N	\N	\N	\N	\N	300
6255	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6254	\N	3	Sí	\N	\N	\N	\N	\N	100
6256	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6254	\N	3	No	\N	\N	\N	\N	\N	200
6257	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6249	\N	3	c) Por enfermedad de la madre	\N	\N	\N	\N	\N	400
6258	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6257	\N	3	Sí	\N	\N	\N	\N	\N	100
6259	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6257	\N	3	No	\N	\N	\N	\N	\N	200
6260	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6249	\N	3	d) Por enfermedad del bebé	\N	\N	\N	\N	\N	500
6261	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6260	\N	3	Sí	\N	\N	\N	\N	\N	100
6262	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6260	\N	3	No	\N	\N	\N	\N	\N	200
6263	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6249	\N	3	Otros	\N	\N	\N	\N	\N	600
6351	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6340	\N	4	No sabe, no contesta	\N	\N	\N	\N	\N	300
6264	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6248	\N	3	20. Durante los controles, ¿ha recibido  información sobre los siguientes temas?	\N	\N	\N	\N	\N	200
6265	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6264	\N	3	(Mencionar las opciones y marcar según proceda. Se puede seleccionar más de uno)	\N	\N	\N	\N	\N	100
6266	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6264	\N	3	a) Importancia de estar con el bebé piel a piel inmediatamente después del parto.	\N	\N	\N	\N	\N	200
6267	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6266	\N	3	Sí	\N	\N	\N	\N	\N	100
6268	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6266	\N	3	No	\N	\N	\N	\N	\N	200
6269	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6264	\N	3	b) Importancia de tener a su bebé en la misma habitación las 24 horas del día.	\N	\N	\N	\N	\N	300
6270	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6269	\N	3	Sí	\N	\N	\N	\N	\N	100
6271	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6269	\N	3	No	\N	\N	\N	\N	\N	200
6272	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6264	\N	3	c) Riesgos de transmisión de VIH de la madre a su bebé.	\N	\N	\N	\N	\N	400
6273	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6272	\N	3	Sí	\N	\N	\N	\N	\N	100
6274	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6272	\N	3	No	\N	\N	\N	\N	\N	200
6275	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6264	\N	3	d) Las consecuencias de utilizar leche de fórmula, biberones y chupones.	\N	\N	\N	\N	\N	500
6276	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6275	\N	3	Sí	\N	\N	\N	\N	\N	100
6277	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6275	\N	3	No	\N	\N	\N	\N	\N	200
6278	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6248	\N	3	21. OBSERVACIONES	\N	\N	\N	\N	\N	300
6279	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	4	cabecera	\N	\N	\N	\N	\N	100
6280	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6279	\N	4	No.	\N	\N	\N	\N	\N	100
6281	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6279	\N	4	Zona	\N	\N	\N	\N	\N	200
6282	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6279	\N	4	Distrito	\N	\N	\N	\N	\N	300
6283	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6279	\N	4	Nombre del establecimiento de salud (ES)	\N	\N	\N	\N	\N	400
6284	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6279	\N	4	Nombre del responsable del ES	\N	\N	\N	\N	\N	500
6285	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6279	\N	4	UNICÓDIGO	\N	\N	\N	\N	\N	600
6286	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6279	\N	4	Fecha	\N	\N	\N	\N	\N	700
6287	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6279	\N	4	Nombre del evaluador/a	\N	\N	\N	\N	\N	800
6288	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	4	A. Datos de la madre, bebé y parto	\N	\N	\N	\N	\N	200
6289	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6288	\N	4	1. El parto fue	\N	\N	\N	\N	\N	100
6290	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6289	\N	4	Vaginal	\N	\N	\N	\N	\N	100
6291	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6290	\N	4	Sí	\N	\N	\N	\N	\N	100
6292	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6290	\N	4	No	\N	\N	\N	\N	\N	200
6293	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6289	\N	4	Cesárea	\N	\N	\N	\N	\N	200
6294	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6293	\N	4	Sí	\N	\N	\N	\N	\N	100
6295	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6293	\N	4	No	\N	\N	\N	\N	\N	200
6296	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6288	\N	4	2. Su bebé nació	\N	\N	\N	\N	\N	200
6297	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6296	\N	4	A término	\N	\N	\N	\N	\N	100
6298	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6297	\N	4	Sí	\N	\N	\N	\N	\N	100
6299	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6297	\N	4	No	\N	\N	\N	\N	\N	200
6300	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6296	\N	4	Prematuro	\N	\N	\N	\N	\N	200
6301	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6300	\N	4	Sí	\N	\N	\N	\N	\N	100
6302	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6300	\N	4	No	\N	\N	\N	\N	\N	200
6303	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6288	\N	4	3. ¿El bebé se encuentra en cuidados especiales?	\N	\N	\N	\N	\N	300
6304	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6303	\N	4	Sí	\N	\N	\N	\N	\N	100
6305	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6304	\N	4	(Si es que sí, llenar incluso la sección D)	\N	\N	\N	\N	\N	100
6306	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6303	\N	4	No	\N	\N	\N	\N	\N	200
6307	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6288	\N	4	4. ¿En qué fecha y hora nació su bebé?	\N	\N	\N	\N	\N	400
6308	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6288	\N	4	5. Edad del bebé (en horas) al momento de la entrevista	\N	\N	\N	\N	\N	500
6309	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6288	\N	4	6. Lugar donde se realiza la entrevista	\N	\N	\N	\N	\N	600
6310	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6309	\N	4	a) Consulta externa	\N	\N	\N	\N	\N	100
6311	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6310	\N	4	Sí	\N	\N	\N	\N	\N	100
6312	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6310	\N	4	No	\N	\N	\N	\N	\N	200
6313	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6309	\N	4	b) Neonatología	\N	\N	\N	\N	\N	200
6314	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6313	\N	4	Sí	\N	\N	\N	\N	\N	100
6315	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6313	\N	4	No	\N	\N	\N	\N	\N	200
6316	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6309	\N	4	c) Sala de parto o Recuperación	\N	\N	\N	\N	\N	300
6317	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6316	\N	4	Sí	\N	\N	\N	\N	\N	100
6318	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6316	\N	4	No	\N	\N	\N	\N	\N	200
6319	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6309	\N	4	d) Hospitalización	\N	\N	\N	\N	\N	400
6320	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6319	\N	4	Sí	\N	\N	\N	\N	\N	100
6321	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6319	\N	4	No	\N	\N	\N	\N	\N	200
6322	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	4	B. Asesoría	\N	\N	\N	\N	\N	300
6323	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6322	\N	4	7. ¿Asistió a los controles prenatales?	\N	\N	\N	\N	\N	100
6324	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6323	\N	4	respuesta	\N	\N	\N	\N	\N	100
6325	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6324	\N	4	Sí	\N	\N	\N	\N	\N	100
6326	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6325	\N	4	¿A cuántos controles?	\N	\N	\N	\N	\N	100
6327	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6326	\N	4	(Esperar explicación de la madre. Seleccionar una opción)	\N	\N	\N	\N	\N	100
6328	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6326	\N	4	1-2	\N	\N	\N	\N	\N	200
6329	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6326	\N	4	3-4	\N	\N	\N	\N	\N	300
6330	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6326	\N	4	5	\N	\N	\N	\N	\N	400
6331	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6326	\N	4	más de 5	\N	\N	\N	\N	\N	500
6332	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6324	\N	4	No	\N	\N	\N	\N	\N	200
6333	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6332	\N	4	¿Se comunicaron o le realizaron una visita domiciliaria cuando no asistió a los controles?	\N	\N	\N	\N	\N	100
6334	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6333	\N	4	Sí	\N	\N	\N	\N	\N	100
6335	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6333	\N	4	No	\N	\N	\N	\N	\N	200
6336	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6324	\N	4	No sabe, no contesta	\N	\N	\N	\N	\N	300
6337	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6323	\N	4	verificador	\N	\N	\N	\N	\N	200
6338	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6337	\N	4	R2.c1 EM	\N	\N	\N	\N	\N	100
6339	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6322	\N	4	8. ¿Fue referida a este establecimiento de salud?	\N	\N	\N	\N	\N	200
6340	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6339	\N	4	respuesta	\N	\N	\N	\N	\N	100
6341	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6340	\N	4	Sí	\N	\N	\N	\N	\N	100
6342	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6341	\N	4	¿Quién le refirió?	\N	\N	\N	\N	\N	100
6343	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6342	\N	4	(Esperar explicación de la madre. Puede seleccionar más de una opción)	\N	\N	\N	\N	\N	100
6344	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6342	\N	4	a) Centro de salud	\N	\N	\N	\N	\N	200
6345	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6342	\N	4	b) Hospital	\N	\N	\N	\N	\N	300
6346	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6342	\N	4	c) Una partera	\N	\N	\N	\N	\N	400
6347	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6342	\N	4	d) Persona particular	\N	\N	\N	\N	\N	500
6348	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6342	\N	4	e) Decisión propia	\N	\N	\N	\N	\N	600
6349	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6342	\N	4	f) Ninguno	\N	\N	\N	\N	\N	700
6350	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6340	\N	4	No	\N	\N	\N	\N	\N	200
6352	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6339	\N	4	verificador	\N	\N	\N	\N	\N	200
6353	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6322	\N	4	9. ¿Le brindaron asesoría sobre los beneficios de la lactancia materna?	\N	\N	\N	\N	\N	300
6354	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6353	\N	4	respuesta	\N	\N	\N	\N	\N	100
6355	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6354	\N	4	Sí	\N	\N	\N	\N	\N	100
6356	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6355	\N	4	¿Qué beneficios le explicaron sobre la leche materna?	\N	\N	\N	\N	\N	100
6357	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6356	\N	4	(Esperar explicación de la madre. Se puede seleccionar más de uno)	\N	\N	\N	\N	\N	100
6358	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6356	\N	4	a) Beneficios para el bebé	\N	\N	\N	\N	\N	200
6359	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6356	\N	4	b) Beneficios para la madre	\N	\N	\N	\N	\N	300
6360	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6356	\N	4	c) Beneficios económicos	\N	\N	\N	\N	\N	400
6361	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6356	\N	4	d) Vínculo madre-hijo	\N	\N	\N	\N	\N	500
6362	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6356	\N	4	e) Otros beneficios	\N	\N	\N	\N	\N	600
6363	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6356	\N	4	f) Ninguno	\N	\N	\N	\N	\N	700
6364	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6356	\N	4	(Si es que no menciona, se marca “no” en Evaluación)	\N	\N	\N	\N	\N	800
6365	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6354	\N	4	No	\N	\N	\N	\N	\N	200
6366	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6354	\N	4	No sabe, no contesta	\N	\N	\N	\N	\N	300
6367	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6353	\N	4	verificador	\N	\N	\N	\N	\N	200
6368	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6367	\N	4	L.1.a EM	\N	\N	\N	\N	\N	100
6369	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6322	\N	4	10. ¿Le han informado sobre métodos anticonceptivos?	\N	\N	\N	\N	\N	400
6370	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6369	\N	4	respuesta	\N	\N	\N	\N	\N	100
6371	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6370	\N	4	Sí	\N	\N	\N	\N	\N	100
6372	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6371	\N	4	Esto sucedió durante:	\N	\N	\N	\N	\N	100
6373	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6372	\N	4	(Mencionar las opciones a la madre y marcar. Puede mencionar más de uno)	\N	\N	\N	\N	\N	100
6374	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6372	\N	4	a) Los controles prenatales	\N	\N	\N	\N	\N	200
6375	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6372	\N	4	b) Después de dar a luz	\N	\N	\N	\N	\N	300
6376	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6371	\N	4	¿Qué métodos le han ofrecido?	\N	\N	\N	\N	\N	200
6377	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6376	\N	4	(Mencionar y marcar las opciones)	\N	\N	\N	\N	\N	100
6378	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6376	\N	4	a) Barrera (preservativos femeninos o masculinos)	\N	\N	\N	\N	\N	200
6379	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6376	\N	4	b) Hormonales (implantes o vía oral)	\N	\N	\N	\N	\N	300
6380	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6376	\N	4	c) DIU – T de cobre	\N	\N	\N	\N	\N	400
6381	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6376	\N	4	d) Definitivos (vasectomía o ligadura)	\N	\N	\N	\N	\N	500
6382	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6376	\N	4	e) Ninguno	\N	\N	\N	\N	\N	600
6383	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6376	\N	4	(Si no menciona alguno, se marca no)	\N	\N	\N	\N	\N	700
6384	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6370	\N	4	No	\N	\N	\N	\N	\N	200
6385	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6370	\N	4	No sabe, no contesta	\N	\N	\N	\N	\N	300
6386	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6369	\N	4	verificador	\N	\N	\N	\N	\N	200
6387	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6386	\N	4	P.10.a EM	\N	\N	\N	\N	\N	100
6388	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6322	\N	4	11. ¿Se realizó el test de VIH?	\N	\N	\N	\N	\N	500
6389	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6388	\N	4	respuesta	\N	\N	\N	\N	\N	100
6390	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6389	\N	4	Sí	\N	\N	\N	\N	\N	100
6391	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6390	\N	4	¿Solicitaron su autorización para la prueba?	\N	\N	\N	\N	\N	100
6392	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6391	\N	4	Sí	\N	\N	\N	\N	\N	100
6393	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6391	\N	4	No	\N	\N	\N	\N	\N	200
6394	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6389	\N	4	No	\N	\N	\N	\N	\N	200
6395	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6389	\N	4	No sabe, no contesta	\N	\N	\N	\N	\N	300
6396	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6388	\N	4	verificador	\N	\N	\N	\N	\N	200
6397	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6396	\N	4	R.3.b EM	\N	\N	\N	\N	\N	100
6398	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	4	C. Parto y puerperio	\N	\N	\N	\N	\N	400
6399	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6398	\N	4	12. ¿El personal de salud le informó sobre el derecho de estar acompañada durante el trabajo de parto, parto y post parto?	\N	\N	\N	\N	\N	100
6400	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6399	\N	4	respuesta	\N	\N	\N	\N	\N	100
6401	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6400	\N	4	Sí	\N	\N	\N	\N	\N	100
6402	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6400	\N	4	No	\N	\N	\N	\N	\N	200
6403	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6400	\N	4	No sabe, no contesta	\N	\N	\N	\N	\N	300
6404	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6399	\N	4	verificador	\N	\N	\N	\N	\N	200
6405	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6404	\N	4	P.1.a EM	\N	\N	\N	\N	\N	100
6406	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6404	\N	4	P.1.b EM	\N	\N	\N	\N	\N	200
6407	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6404	\N	4	P.1.c EM	\N	\N	\N	\N	\N	300
6408	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6398	\N	4	13. ¿Decidió estar acompañada por una persona de su elección durante el trabajo de parto? (El acompañamiento puede ser de la pareja, familiar, partera/o, u otro.) 	\N	\N	\N	\N	\N	200
6409	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6408	\N	4	respuesta	\N	\N	\N	\N	\N	100
6410	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6409	\N	4	Sí	\N	\N	\N	\N	\N	100
6411	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6410	\N	4	¿Estuvo acompañada durante el trabajo de parto?	\N	\N	\N	\N	\N	100
6412	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6411	\N	4	Sí	\N	\N	\N	\N	\N	100
6413	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6411	\N	4	No	\N	\N	\N	\N	\N	200
6414	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6411	\N	4	(Si no se lo permitieron, en la evaluación se marca “No”)	\N	\N	\N	\N	\N	300
6415	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6409	\N	4	No	\N	\N	\N	\N	\N	200
6416	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6409	\N	4	No sabe, no contesta	\N	\N	\N	\N	\N	300
6417	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6408	\N	4	verificador	\N	\N	\N	\N	\N	200
6418	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6417	\N	4	P.1.a EM	\N	\N	\N	\N	\N	100
6419	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6398	\N	4	14. ¿Decidió estar acompañada por una persona de su elección durante el parto? (El acompañamiento puede ser de la pareja, familiar, partera/o, u otro.)	\N	\N	\N	\N	\N	300
6420	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6419	\N	4	respuesta	\N	\N	\N	\N	\N	100
6421	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6420	\N	4	Sí	\N	\N	\N	\N	\N	100
6422	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6421	\N	4	¿Estuvo acompañada durante el parto?	\N	\N	\N	\N	\N	100
6423	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6422	\N	4	Sí	\N	\N	\N	\N	\N	100
6424	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6422	\N	4	No	\N	\N	\N	\N	\N	200
6425	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6422	\N	4	(Si no se lo permitieron, en la evaluación se marca “No”)	\N	\N	\N	\N	\N	300
6426	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6420	\N	4	No	\N	\N	\N	\N	\N	200
6427	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6420	\N	4	No sabe, no contesta	\N	\N	\N	\N	\N	300
6428	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6419	\N	4	verificador	\N	\N	\N	\N	\N	200
6429	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6428	\N	4	P.1.b EM	\N	\N	\N	\N	\N	100
6430	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6398	\N	4	15. ¿Estuvo acompañada después del parto por una persona de su elección? (El acompañamiento puede ser de la pareja, familiar, partera/o, u otro.)	\N	\N	\N	\N	\N	400
6431	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6430	\N	4	respuesta	\N	\N	\N	\N	\N	100
6432	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6431	\N	4	Sí	\N	\N	\N	\N	\N	100
6433	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6431	\N	4	No	\N	\N	\N	\N	\N	200
6434	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6431	\N	4	No sabe, no contesta	\N	\N	\N	\N	\N	300
6435	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6430	\N	4	verificador	\N	\N	\N	\N	\N	200
6436	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6435	\N	4	P.1.c EM	\N	\N	\N	\N	\N	100
6437	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6398	\N	4	16. ¿Le informaron sobre su derecho de usar la vestimenta a su elección durante el parto? 	\N	\N	\N	\N	\N	500
6438	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6437	\N	4	respuesta	\N	\N	\N	\N	\N	100
6439	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6438	\N	4	Sí	\N	\N	\N	\N	\N	100
6440	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6439	\N	4	¿Usted quiso usar su vestimenta durante el parto?	\N	\N	\N	\N	\N	100
6441	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6440	\N	4	Sí	\N	\N	\N	\N	\N	100
6442	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6441	\N	4	¿se lo permitieron?	\N	\N	\N	\N	\N	100
6443	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6442	\N	4	Sí	\N	\N	\N	\N	\N	100
6444	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6442	\N	4	No	\N	\N	\N	\N	\N	200
6445	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6442	\N	4	(Si no se lo permitieron, en la evaluación se marca “No”)	\N	\N	\N	\N	\N	300
6446	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6440	\N	4	No	\N	\N	\N	\N	\N	200
6447	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6446	\N	4	¿le explicaron la razón?	\N	\N	\N	\N	\N	100
6448	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6447	\N	4	Sí	\N	\N	\N	\N	\N	100
6449	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6447	\N	4	No	\N	\N	\N	\N	\N	200
6450	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6438	\N	4	No	\N	\N	\N	\N	\N	200
6451	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6438	\N	4	No sabe, no contesta	\N	\N	\N	\N	\N	300
6452	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6437	\N	4	verificador	\N	\N	\N	\N	\N	200
6453	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6452	\N	4	P.2.b EM	\N	\N	\N	\N	\N	100
6454	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6398	\N	4	17. ¿Le informaron sobre su derecho de consumir alimentos o líquidos durante el labor de parto?	\N	\N	\N	\N	\N	600
6455	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6454	\N	4	respuesta	\N	\N	\N	\N	\N	100
6456	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6455	\N	4	Sí	\N	\N	\N	\N	\N	100
6457	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6456	\N	4	¿se lo permitieron?	\N	\N	\N	\N	\N	100
6458	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6457	\N	4	Sí	\N	\N	\N	\N	\N	100
6459	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6457	\N	4	No	\N	\N	\N	\N	\N	200
6460	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6455	\N	4	No	\N	\N	\N	\N	\N	200
6461	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6460	\N	4	¿le explicaron la razón?	\N	\N	\N	\N	\N	100
6462	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6461	\N	4	Sí	\N	\N	\N	\N	\N	100
6463	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6461	\N	4	No	\N	\N	\N	\N	\N	200
6464	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6461	\N	4	(Si no le explicaron, en la evaluación se marca “No”)	\N	\N	\N	\N	\N	300
6465	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6455	\N	4	No sabe, no contesta	\N	\N	\N	\N	\N	300
6466	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6454	\N	4	verificador	\N	\N	\N	\N	\N	200
6467	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6466	\N	4	P.2.b EM	\N	\N	\N	\N	\N	100
6468	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6398	\N	4	18. ¿Le consultaron sobre qué hacer con su placenta?	\N	\N	\N	\N	\N	700
6469	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6468	\N	4	respuesta	\N	\N	\N	\N	\N	100
6470	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6469	\N	4	Sí	\N	\N	\N	\N	\N	100
6471	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6469	\N	4	No	\N	\N	\N	\N	\N	200
6472	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6469	\N	4	No sabe, no contesta	\N	\N	\N	\N	\N	300
6473	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6468	\N	4	verificador	\N	\N	\N	\N	\N	200
6474	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6473	\N	4	P.2.c EM	\N	\N	\N	\N	\N	100
6475	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6398	\N	4	19. ¿Le alentaron a moverse o caminar durante la labor de parto?	\N	\N	\N	\N	\N	800
6476	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6475	\N	4	respuesta	\N	\N	\N	\N	\N	100
6477	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6476	\N	4	Sí	\N	\N	\N	\N	\N	100
6478	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6477	\N	4	(Pase a pregunta 20)	\N	\N	\N	\N	\N	100
6479	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6476	\N	4	No	\N	\N	\N	\N	\N	200
6480	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6479	\N	4	¿Le explicaron la razón?	\N	\N	\N	\N	\N	100
6481	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6480	\N	4	Sí	\N	\N	\N	\N	\N	100
6482	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6480	\N	4	No	\N	\N	\N	\N	\N	200
6483	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6480	\N	4	(Si le explicaron la razón, se marca no sabe no contesta, y no se toma en cuenta para la evaluación)	\N	\N	\N	\N	\N	300
6484	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6476	\N	4	No sabe, no contesta	\N	\N	\N	\N	\N	300
6485	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6475	\N	4	verificador	\N	\N	\N	\N	\N	200
6486	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6485	\N	4	P.3.b1 EM	\N	\N	\N	\N	\N	100
6487	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6398	\N	4	20. ¿Puede mencionar 2 beneficios de moverse o caminar durante la labor de parto? (Esperar explicación de la madre. Marcar “sí”, si los beneficios se pueden relacionar a: ayudar al descenso del bebé, alivio del dolor, comodidad, colocar al bebé)	\N	\N	\N	\N	\N	900
6488	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6487	\N	4	respuesta	\N	\N	\N	\N	\N	100
6489	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6488	\N	4	Sí	\N	\N	\N	\N	\N	100
6490	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6489	\N	4	1.	\N	\N	\N	\N	\N	100
6491	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6489	\N	4	2.	\N	\N	\N	\N	\N	200
6492	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6488	\N	4	No	\N	\N	\N	\N	\N	200
6493	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6492	\N	4	(Si no se llena los 2 beneficios, marcar “No”, de lo contrario, “Sí”)	\N	\N	\N	\N	\N	100
6494	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6488	\N	4	No sabe, no contesta	\N	\N	\N	\N	\N	300
6495	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6487	\N	4	verificador	\N	\N	\N	\N	\N	200
6496	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6495	\N	4	P.3.b2 EM	\N	\N	\N	\N	\N	100
6497	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6398	\N	4	21. ¿Le informaron que puede elegir la posición del parto?	\N	\N	\N	\N	\N	1000
6498	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6497	\N	4	respuesta	\N	\N	\N	\N	\N	100
6499	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6498	\N	4	Sí	\N	\N	\N	\N	\N	100
6500	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6498	\N	4	No	\N	\N	\N	\N	\N	200
6501	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6498	\N	4	No sabe, no contesta	\N	\N	\N	\N	\N	300
6502	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6497	\N	4	verificador	\N	\N	\N	\N	\N	200
6503	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6502	\N	4	P.3.c1 EM	\N	\N	\N	\N	\N	100
6504	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6398	\N	4	22. ¿Ha podido elegir la posición para el parto?	\N	\N	\N	\N	\N	1100
6505	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6504	\N	4	respuesta	\N	\N	\N	\N	\N	100
6506	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6505	\N	4	Sí	\N	\N	\N	\N	\N	100
6507	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6505	\N	4	No	\N	\N	\N	\N	\N	200
6508	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6507	\N	4	¿Le explicaron la razón?	\N	\N	\N	\N	\N	100
6509	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6508	\N	4	Sí	\N	\N	\N	\N	\N	100
6510	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6508	\N	4	No	\N	\N	\N	\N	\N	200
6511	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6508	\N	4	(Si le explicaron la razón, se marca no sabe no contesta, y no se toma en cuenta para la evaluación)	\N	\N	\N	\N	\N	300
6512	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6505	\N	4	No sabe, no contesta	\N	\N	\N	\N	\N	300
6513	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6504	\N	4	verificador	\N	\N	\N	\N	\N	200
6514	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6513	\N	4	P.3.c2 EM	\N	\N	\N	\N	\N	100
6515	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6398	\N	4	23. ¿Le informaron sobre métodos para aliviar el dolor que no involucren medicamentos?	\N	\N	\N	\N	\N	1200
6516	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6515	\N	4	respuesta	\N	\N	\N	\N	\N	100
6517	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6516	\N	4	Sí	\N	\N	\N	\N	\N	100
6518	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6517	\N	4	¿Puede mencionar un método?	\N	\N	\N	\N	\N	100
6519	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6518	\N	4	(Esperar explicación de la madre. Se puede seleccionar más de uno)	\N	\N	\N	\N	\N	100
6520	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6518	\N	4	a) Masaje	\N	\N	\N	\N	\N	200
6521	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6520	\N	4	Sí	\N	\N	\N	\N	\N	100
6522	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6520	\N	4	No	\N	\N	\N	\N	\N	200
6523	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6518	\N	4	b) Calor local	\N	\N	\N	\N	\N	300
6524	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6523	\N	4	Sí	\N	\N	\N	\N	\N	100
6525	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6523	\N	4	No	\N	\N	\N	\N	\N	200
6526	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6518	\N	4	c) Deambulación	\N	\N	\N	\N	\N	400
6527	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6526	\N	4	Sí	\N	\N	\N	\N	\N	100
6528	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6526	\N	4	No	\N	\N	\N	\N	\N	200
6529	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6518	\N	4	d) Baños de agua	\N	\N	\N	\N	\N	500
6530	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6529	\N	4	Sí	\N	\N	\N	\N	\N	100
6531	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6529	\N	4	No	\N	\N	\N	\N	\N	200
6532	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6518	\N	4	e) Relajación	\N	\N	\N	\N	\N	600
6533	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6532	\N	4	Sí	\N	\N	\N	\N	\N	100
6534	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6532	\N	4	No	\N	\N	\N	\N	\N	200
6535	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6518	\N	4	f) Musicoterapia	\N	\N	\N	\N	\N	700
6536	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6535	\N	4	Sí	\N	\N	\N	\N	\N	100
6537	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6535	\N	4	No	\N	\N	\N	\N	\N	200
6538	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6518	\N	4	g) Aromaterapia	\N	\N	\N	\N	\N	800
6539	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6538	\N	4	Sí	\N	\N	\N	\N	\N	100
6540	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6538	\N	4	No	\N	\N	\N	\N	\N	200
6541	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6518	\N	4	h) Visualización	\N	\N	\N	\N	\N	900
6542	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6541	\N	4	Sí	\N	\N	\N	\N	\N	100
6543	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6541	\N	4	No	\N	\N	\N	\N	\N	200
6544	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6518	\N	4	i) Otros	\N	\N	\N	\N	\N	1000
6545	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6544	\N	4	Sí	\N	\N	\N	\N	\N	100
6546	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6544	\N	4	No	\N	\N	\N	\N	\N	200
6547	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6518	\N	4	j) Ninguno	\N	\N	\N	\N	\N	1100
6548	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6547	\N	4	Sí	\N	\N	\N	\N	\N	100
6549	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6547	\N	4	No	\N	\N	\N	\N	\N	200
6550	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6518	\N	4	(Si no menciona alguno o marca ninguno, se marca “No” en EVALUACIÓN)	\N	\N	\N	\N	\N	1200
6551	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6516	\N	4	No	\N	\N	\N	\N	\N	200
6552	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6516	\N	4	No sabe, no contesta	\N	\N	\N	\N	\N	300
6553	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6515	\N	4	verificador	\N	\N	\N	\N	\N	200
6554	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6553	\N	4	P.4.a EM	\N	\N	\N	\N	\N	100
6555	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6398	\N	4	24. ¿Le pusieron a su bebé en su pecho inmediatamente después del nacimiento?	\N	\N	\N	\N	\N	1300
6556	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6555	\N	4	respuesta	\N	\N	\N	\N	\N	100
6557	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6556	\N	4	Sí	\N	\N	\N	\N	\N	100
6558	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6557	\N	4	¿Lactó?	\N	\N	\N	\N	\N	100
6559	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6558	\N	4	Sí	\N	\N	\N	\N	\N	100
6560	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6558	\N	4	No	\N	\N	\N	\N	\N	200
6561	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6558	\N	4	(Si no lactó en P.6.b EM marcar NO)	\N	\N	\N	\N	\N	300
6562	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6556	\N	4	No	\N	\N	\N	\N	\N	200
6563	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6562	\N	4	¿Le explicaron la razón?	\N	\N	\N	\N	\N	100
6564	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6563	\N	4	Sí	\N	\N	\N	\N	\N	100
6565	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6563	\N	4	No	\N	\N	\N	\N	\N	200
6566	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6563	\N	4	(Si le explicaron la razón, se marca no sabe no contesta y no aplica en la evaluación) 	\N	\N	\N	\N	\N	300
6567	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6556	\N	4	No sabe, no contesta	\N	\N	\N	\N	\N	300
6568	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6555	\N	4	verificador	\N	\N	\N	\N	\N	200
6569	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6568	\N	4	P.6.a1 EM	\N	\N	\N	\N	\N	100
6570	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6568	\N	4	P.6.a2 EM	\N	\N	\N	\N	\N	200
6571	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6568	\N	4	P.6.b EM	\N	\N	\N	\N	\N	300
6572	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6398	\N	4	25. ¿El personal de salud le informó de los procedimientos de rutina que se realizan a los recién nacidos como medir, pesar, revisión ocular e inyección de vitamina K?	\N	\N	\N	\N	\N	1400
6573	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6572	\N	4	respuesta	\N	\N	\N	\N	\N	100
6574	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6573	\N	4	Sí	\N	\N	\N	\N	\N	100
6575	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6573	\N	4	No	\N	\N	\N	\N	\N	200
6576	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6573	\N	4	No sabe, no contesta	\N	\N	\N	\N	\N	300
6577	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6572	\N	4	verificador	\N	\N	\N	\N	\N	200
6578	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6577	\N	4	P.7.a EM	\N	\N	\N	\N	\N	100
6579	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6398	\N	4	26. ¿Estuvo usted presente cuando midieron, pesaron y revisaron al bebé después de nacer?	\N	\N	\N	\N	\N	1500
6580	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6579	\N	4	respuesta	\N	\N	\N	\N	\N	100
6581	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6580	\N	4	Sí	\N	\N	\N	\N	\N	100
6582	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6580	\N	4	No	\N	\N	\N	\N	\N	200
6583	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6580	\N	4	No sabe, no contesta	\N	\N	\N	\N	\N	300
6584	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6579	\N	4	verificador	\N	\N	\N	\N	\N	200
6585	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6584	\N	4	P.7.b EM	\N	\N	\N	\N	\N	100
6586	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6398	\N	4	27. ¿Le informaron  sobre los signos de peligro  del bebé, por los cuales debe consultar al establecimiento de salud más cercano?	\N	\N	\N	\N	\N	1600
6587	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6586	\N	4	respuesta	\N	\N	\N	\N	\N	100
6588	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6587	\N	4	Sí	\N	\N	\N	\N	\N	100
6589	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6588	\N	4	¿Puede mencionar 2 signos de peligro?	\N	\N	\N	\N	\N	100
6590	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6589	\N	4	(Esperar explicación de la madre. Se puede seleccionar más de uno)	\N	\N	\N	\N	\N	100
6591	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6589	\N	4	a) Cambio de coloración	\N	\N	\N	\N	\N	200
6592	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6591	\N	4	Sí	\N	\N	\N	\N	\N	100
6593	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6591	\N	4	No	\N	\N	\N	\N	\N	200
6594	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6589	\N	4	b) Dificultad para alimentarse	\N	\N	\N	\N	\N	300
6595	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6594	\N	4	Sí	\N	\N	\N	\N	\N	100
6596	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6594	\N	4	No	\N	\N	\N	\N	\N	200
6597	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6589	\N	4	c) Fiebre	\N	\N	\N	\N	\N	400
6598	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6597	\N	4	Sí	\N	\N	\N	\N	\N	100
6599	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6597	\N	4	No	\N	\N	\N	\N	\N	200
6600	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6589	\N	4	d) Dificultad para respirar	\N	\N	\N	\N	\N	500
6601	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6600	\N	4	Sí	\N	\N	\N	\N	\N	100
6602	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6600	\N	4	No	\N	\N	\N	\N	\N	200
6603	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6589	\N	4	e) Tieso o ataques	\N	\N	\N	\N	\N	600
6604	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6603	\N	4	Sí	\N	\N	\N	\N	\N	100
6605	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6603	\N	4	No	\N	\N	\N	\N	\N	200
6606	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6589	\N	4	f) Debilidad	\N	\N	\N	\N	\N	700
6607	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6606	\N	4	Sí	\N	\N	\N	\N	\N	100
6608	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6606	\N	4	No	\N	\N	\N	\N	\N	200
6609	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6589	\N	4	g) Ninguno	\N	\N	\N	\N	\N	800
6610	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6609	\N	4	Sí	\N	\N	\N	\N	\N	100
6611	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6609	\N	4	No	\N	\N	\N	\N	\N	200
6612	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6589	\N	4	(Si no menciona 2 signos se marca “No”)	\N	\N	\N	\N	\N	900
6613	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6587	\N	4	No	\N	\N	\N	\N	\N	200
6614	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6587	\N	4	No sabe, no contesta	\N	\N	\N	\N	\N	300
6615	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6586	\N	4	verificador	\N	\N	\N	\N	\N	200
6616	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6615	\N	4	P.10.b EM	\N	\N	\N	\N	\N	100
6617	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6398	\N	4	28. ¿Le informaron sobre los signos de peligro para usted  después del parto?	\N	\N	\N	\N	\N	1700
6618	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6617	\N	4	respuesta	\N	\N	\N	\N	\N	100
6619	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6618	\N	4	Sí	\N	\N	\N	\N	\N	100
6620	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6619	\N	4	¿Puede mencionar 2  signos de peligro?	\N	\N	\N	\N	\N	100
6621	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6620	\N	4	(Esperar explicación de la madre. Se puede seleccionar más de uno)	\N	\N	\N	\N	\N	100
6622	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6620	\N	4	a) Sangrado o secreción	\N	\N	\N	\N	\N	200
6623	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6622	\N	4	Sí	\N	\N	\N	\N	\N	100
6624	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6622	\N	4	No	\N	\N	\N	\N	\N	200
6625	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6620	\N	4	b) Fiebre	\N	\N	\N	\N	\N	300
6626	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6625	\N	4	Sí	\N	\N	\N	\N	\N	100
6627	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6625	\N	4	No	\N	\N	\N	\N	\N	200
6628	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6620	\N	4	c) Dolor de barriga	\N	\N	\N	\N	\N	400
6629	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6628	\N	4	Sí	\N	\N	\N	\N	\N	100
6630	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6628	\N	4	No	\N	\N	\N	\N	\N	200
6631	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6620	\N	4	d) Visión borrosa	\N	\N	\N	\N	\N	500
6632	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6631	\N	4	Sí	\N	\N	\N	\N	\N	100
6633	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6631	\N	4	No	\N	\N	\N	\N	\N	200
6634	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6620	\N	4	e) Ninguno	\N	\N	\N	\N	\N	600
6635	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6634	\N	4	Sí	\N	\N	\N	\N	\N	100
6636	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6634	\N	4	No	\N	\N	\N	\N	\N	200
6637	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6620	\N	4	(Si no menciona 2 signos se marca “No”)	\N	\N	\N	\N	\N	700
6638	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6618	\N	4	No	\N	\N	\N	\N	\N	200
6639	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6618	\N	4	No sabe, no contesta	\N	\N	\N	\N	\N	300
6640	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6617	\N	4	verificador	\N	\N	\N	\N	\N	200
6641	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6640	\N	4	P.10.b EM	\N	\N	\N	\N	\N	100
6642	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6398	\N	4	29. ¿Su bebé fue identificado mediante una manilla o brazalete al momento de su nacimiento?	\N	\N	\N	\N	\N	1800
6643	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6642	\N	4	respuesta	\N	\N	\N	\N	\N	100
6644	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6643	\N	4	Sí	\N	\N	\N	\N	\N	100
6645	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6643	\N	4	No	\N	\N	\N	\N	\N	200
6646	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6643	\N	4	No sabe, no contesta	\N	\N	\N	\N	\N	300
6647	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6642	\N	4	verificador	\N	\N	\N	\N	\N	200
6648	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6647	\N	4	P.10.b.3 EM	\N	\N	\N	\N	\N	100
6649	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6398	\N	4	30. ¿Le dieron cita para el primer control suyo y de su bebé?	\N	\N	\N	\N	\N	1900
6650	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6649	\N	4	respuesta	\N	\N	\N	\N	\N	100
6651	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6650	\N	4	Sí	\N	\N	\N	\N	\N	100
6652	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6651	\N	4	Si es que sí, ¿Cuándo y dónde será?	\N	\N	\N	\N	\N	100
6653	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6652	\N	4	respuesta	\N	\N	\N	\N	\N	100
6654	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6652	\N	4	(Si no sabe día y lugar, o si es posterior a la semana del parto, marcar “No”, de lo contrario, “Sí”)	\N	\N	\N	\N	\N	200
6655	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6650	\N	4	No	\N	\N	\N	\N	\N	200
6656	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6650	\N	4	No sabe, no contesta	\N	\N	\N	\N	\N	300
6657	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6649	\N	4	verificador	\N	\N	\N	\N	\N	200
6658	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6657	\N	4	P.10.c EM	\N	\N	\N	\N	\N	100
6659	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6398	\N	4	31. OBSERVACIONES	\N	\N	\N	\N	\N	2000
6660	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	4	D. En caso de hospitalización del neonato	\N	\N	\N	\N	\N	500
6661	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6660	\N	4	32. En caso de hospitalización del neonato: ¿Tiene libre acceso usted y/o su pareja durante las 24h del día al servicio de neonatología? No existen restricciones de acceso justificado a la madre a excepción de los momentos en los cuales se realizan procedimientos médicos al neonato.  La unidad debe tomar en cuenta las prevenciones de acceso necesarias.	\N	\N	\N	\N	\N	100
6662	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6661	\N	4	respuesta	\N	\N	\N	\N	\N	100
6663	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6662	\N	4	Sí	\N	\N	\N	\N	\N	100
6664	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6662	\N	4	No	\N	\N	\N	\N	\N	200
6665	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6662	\N	4	No sabe, no contesta	\N	\N	\N	\N	\N	300
6666	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6661	\N	4	verificador	\N	\N	\N	\N	\N	200
6667	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6666	\N	4	P.9.a EM	\N	\N	\N	\N	\N	100
6668	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6660	\N	4	33. Transfirieron a su bebé de otro establecimiento de salud	\N	\N	\N	\N	\N	200
6669	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6668	\N	4	respuesta	\N	\N	\N	\N	\N	100
6670	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6669	\N	4	Sí	\N	\N	\N	\N	\N	100
6671	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6670	\N	4	¿Permitieron el acompañamiento de familiares y explicaron las causas de la transferencia?	\N	\N	\N	\N	\N	100
6672	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6671	\N	4	Sí	\N	\N	\N	\N	\N	100
6673	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6671	\N	4	No	\N	\N	\N	\N	\N	200
6674	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6669	\N	4	No	\N	\N	\N	\N	\N	200
6675	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6669	\N	4	No sabe, no contesta	\N	\N	\N	\N	\N	300
6676	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6668	\N	4	verificador	\N	\N	\N	\N	\N	200
6677	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6676	\N	4	P.9.a EM	\N	\N	\N	\N	\N	100
6678	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6660	\N	4	34. ¿Recibe información sobre la evolución de su bebé cada vez que lo solicita?	\N	\N	\N	\N	\N	300
6679	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6678	\N	4	respuesta	\N	\N	\N	\N	\N	100
6680	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6679	\N	4	Sí	\N	\N	\N	\N	\N	100
6681	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6679	\N	4	No	\N	\N	\N	\N	\N	200
6682	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6679	\N	4	No sabe, no contesta	\N	\N	\N	\N	\N	300
6683	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6678	\N	4	verificador	\N	\N	\N	\N	\N	200
6684	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6683	\N	4	P.9.c EM	\N	\N	\N	\N	\N	100
6685	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6660	\N	4	35. OBSERVACIONES – Informar sobre las condiciones del sitio de espera para padres	\N	\N	\N	\N	\N	400
6686	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	4	E. Lactancia materna	\N	\N	\N	\N	\N	600
6687	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6686	\N	4	36.  ¿Piensa darle el seno a su bebé, o continuar dándoselo?	\N	\N	\N	\N	\N	100
6688	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6687	\N	4	respuesta	\N	\N	\N	\N	\N	100
6689	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6688	\N	4	Sí	\N	\N	\N	\N	\N	100
6690	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6689	\N	4	¿Por cuánto tiempo?	\N	\N	\N	\N	\N	100
6691	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6689	\N	4	(en meses)	\N	\N	\N	\N	\N	200
6692	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6688	\N	4	No	\N	\N	\N	\N	\N	200
6693	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6692	\N	4	(Pasar a la sección para madres que no amamantan (Sección F).	\N	\N	\N	\N	\N	100
6694	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6688	\N	4	No sabe, no contesta	\N	\N	\N	\N	\N	300
6695	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6687	\N	4	verificador	\N	\N	\N	\N	\N	200
6696	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6686	\N	4	37. ¿Alguien en el establecimiento de salud le enseñó cómo dar de lactar?	\N	\N	\N	\N	\N	200
6697	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6696	\N	4	respuesta	\N	\N	\N	\N	\N	100
6698	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6697	\N	4	Sí	\N	\N	\N	\N	\N	100
6699	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6698	\N	4	¿Puede mostrarme y contar cómo se acomoda al bebé para amamantar?	\N	\N	\N	\N	\N	100
6700	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6699	\N	4	(La madre puede hablar de la postura correcta o el agarre  para dar de lactar, espere a que la madre comente y marque los puntos según los mencione)	\N	\N	\N	\N	\N	100
6701	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6699	\N	4	a) Bebé cerca y frente al pecho	\N	\N	\N	\N	\N	200
6702	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6701	\N	4	Sí	\N	\N	\N	\N	\N	100
6703	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6701	\N	4	No	\N	\N	\N	\N	\N	200
6704	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6699	\N	4	b) Cabeza y cuerpo en línea recta	\N	\N	\N	\N	\N	300
6705	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6704	\N	4	Sí	\N	\N	\N	\N	\N	100
6706	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6704	\N	4	No	\N	\N	\N	\N	\N	200
6707	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6699	\N	4	c) Sostiene cabeza y hombros	\N	\N	\N	\N	\N	400
6708	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6707	\N	4	Sí	\N	\N	\N	\N	\N	100
6709	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6707	\N	4	No	\N	\N	\N	\N	\N	200
6710	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6699	\N	4	d) Boca del bebé bien abierta	\N	\N	\N	\N	\N	500
6711	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6710	\N	4	Sí	\N	\N	\N	\N	\N	100
6712	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6710	\N	4	No	\N	\N	\N	\N	\N	200
6713	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6699	\N	4	e) Labio inferior hacia afuera	\N	\N	\N	\N	\N	600
6714	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6713	\N	4	Sí	\N	\N	\N	\N	\N	100
6715	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6713	\N	4	No	\N	\N	\N	\N	\N	200
6716	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6699	\N	4	f) Mentón de bebé toca el pecho	\N	\N	\N	\N	\N	700
6717	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6716	\N	4	Sí	\N	\N	\N	\N	\N	100
6718	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6716	\N	4	No	\N	\N	\N	\N	\N	200
6719	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6699	\N	4	g) Más areola visible arriba que abajo	\N	\N	\N	\N	\N	800
6720	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6719	\N	4	Sí	\N	\N	\N	\N	\N	100
6721	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6719	\N	4	No	\N	\N	\N	\N	\N	200
6722	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6699	\N	4	h) Mejillas de bebé llenas	\N	\N	\N	\N	\N	900
6723	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6722	\N	4	Sí	\N	\N	\N	\N	\N	100
6724	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6722	\N	4	No	\N	\N	\N	\N	\N	200
6725	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6699	\N	4	i) Succión lenta y sonidos de deglución	\N	\N	\N	\N	\N	1000
6726	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6725	\N	4	Sí	\N	\N	\N	\N	\N	100
6727	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6725	\N	4	No	\N	\N	\N	\N	\N	200
6728	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6699	\N	4	j) Ninguno	\N	\N	\N	\N	\N	1100
6729	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6728	\N	4	Sí	\N	\N	\N	\N	\N	100
6730	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6728	\N	4	No	\N	\N	\N	\N	\N	200
6731	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6699	\N	4	(Si no menciona al menos  3, se marca “No”)	\N	\N	\N	\N	\N	1200
6732	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6697	\N	4	No	\N	\N	\N	\N	\N	200
6733	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6697	\N	4	No sabe, no contesta	\N	\N	\N	\N	\N	300
6734	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6696	\N	4	verificador	\N	\N	\N	\N	\N	200
6735	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6734	\N	4	L.2.a EM	\N	\N	\N	\N	\N	100
6736	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6686	\N	4	38. ¿Alguien en el establecimiento le enseñó cómo extraerse su leche y darle de comer a su bebe sin biberón?	\N	\N	\N	\N	\N	300
6737	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6736	\N	4	respuesta	\N	\N	\N	\N	\N	100
6738	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6737	\N	4	Sí	\N	\N	\N	\N	\N	100
6739	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6738	\N	4	¿Qué puede usar en vez de biberón?	\N	\N	\N	\N	\N	100
6740	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6739	\N	4	(Marque según corresponda si la madre menciona alguna de las siguientes. Puede marcar más de una)	\N	\N	\N	\N	\N	100
6741	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6739	\N	4	a) Taza	\N	\N	\N	\N	\N	200
6742	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6741	\N	4	Sí	\N	\N	\N	\N	\N	100
6743	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6741	\N	4	No	\N	\N	\N	\N	\N	200
6744	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6739	\N	4	b) Cuchara	\N	\N	\N	\N	\N	300
6745	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6744	\N	4	Sí	\N	\N	\N	\N	\N	100
6746	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6744	\N	4	No	\N	\N	\N	\N	\N	200
6747	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6739	\N	4	c) Jeringuilla	\N	\N	\N	\N	\N	400
6748	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6747	\N	4	Sí	\N	\N	\N	\N	\N	100
6749	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6747	\N	4	No	\N	\N	\N	\N	\N	200
6750	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6739	\N	4	d) Otras	\N	\N	\N	\N	\N	500
6751	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6750	\N	4	Sí	\N	\N	\N	\N	\N	100
6752	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6750	\N	4	No	\N	\N	\N	\N	\N	200
6753	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6739	\N	4	e) Ninguno	\N	\N	\N	\N	\N	600
6754	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6753	\N	4	Sí	\N	\N	\N	\N	\N	100
6755	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6753	\N	4	No	\N	\N	\N	\N	\N	200
6756	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6739	\N	4	(Si no menciona al menos  1, se marca “No”)	\N	\N	\N	\N	\N	700
6757	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6737	\N	4	No	\N	\N	\N	\N	\N	200
6758	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6737	\N	4	No sabe, no contesta	\N	\N	\N	\N	\N	300
6759	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6736	\N	4	verificador	\N	\N	\N	\N	\N	200
6760	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6759	\N	4	L.3.c EM	\N	\N	\N	\N	\N	100
6761	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6686	\N	4	39. ¿Sabe si su bebé fue alimentado con biberón en su estadía en el ES?	\N	\N	\N	\N	\N	400
6762	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6761	\N	4	respuesta	\N	\N	\N	\N	\N	100
6763	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6762	\N	4	Sí	\N	\N	\N	\N	\N	100
6764	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6762	\N	4	No	\N	\N	\N	\N	\N	200
6765	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6762	\N	4	No sabe, no contesta	\N	\N	\N	\N	\N	300
6766	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6761	\N	4	verificador	\N	\N	\N	\N	\N	200
6767	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6766	\N	4	L.7.a EM 	\N	\N	\N	\N	\N	100
6768	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6686	\N	4	40. ¿Le informaron sobre los riesgos del uso de biberones o chupones?	\N	\N	\N	\N	\N	500
6769	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6768	\N	4	respuesta	\N	\N	\N	\N	\N	100
6770	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6769	\N	4	Sí	\N	\N	\N	\N	\N	100
6771	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6769	\N	4	No	\N	\N	\N	\N	\N	200
6772	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6769	\N	4	No sabe, no contesta	\N	\N	\N	\N	\N	300
6773	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6768	\N	4	verificador	\N	\N	\N	\N	\N	200
6774	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6773	\N	4	L.7.b EM	\N	\N	\N	\N	\N	100
6775	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6686	\N	4	41. ¿Alguien en el ES le ha ofrecido o regalado leche de fórmula, biberones o chupones?	\N	\N	\N	\N	\N	600
6776	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6775	\N	4	respuesta	\N	\N	\N	\N	\N	100
6777	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6776	\N	4	Sí	\N	\N	\N	\N	\N	100
6778	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6776	\N	4	No	\N	\N	\N	\N	\N	200
6779	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6776	\N	4	No sabe, no contesta	\N	\N	\N	\N	\N	300
6780	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6775	\N	4	verificador	\N	\N	\N	\N	\N	200
6781	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6780	\N	4	L.9.a EM	\N	\N	\N	\N	\N	100
6782	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6686	\N	4	42. ¿Alguien del personal de salud le ha recomendado alimentar a su bebé con leche de fórmula?	\N	\N	\N	\N	\N	700
6783	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6782	\N	4	respuesta	\N	\N	\N	\N	\N	100
6784	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6783	\N	4	Sí	\N	\N	\N	\N	\N	100
6785	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6784	\N	4	¿Le explicaron alguna razón por la cual hacerlo?	\N	\N	\N	\N	\N	100
6786	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6785	\N	4	Sí	\N	\N	\N	\N	\N	100
6787	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6786	\N	4	¿cuál?	\N	\N	\N	\N	\N	100
6788	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6787	\N	4	respuesta	\N	\N	\N	\N	\N	100
6789	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6787	\N	4	(si existe explicación médica justificada, marca “No” en autoevaluación)	\N	\N	\N	\N	\N	200
6790	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6785	\N	4	No	\N	\N	\N	\N	\N	200
6791	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6783	\N	4	No	\N	\N	\N	\N	\N	200
6792	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6783	\N	4	No sabe, no contesta	\N	\N	\N	\N	\N	300
6793	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6782	\N	4	verificador	\N	\N	\N	\N	\N	200
6794	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6793	\N	4	L.4.a EM	\N	\N	\N	\N	\N	100
6795	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6686	\N	4	43. ¿Podría indicarme qué ha recibido su bebé desde que nació?	\N	\N	\N	\N	\N	800
6796	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6795	\N	4	respuesta	\N	\N	\N	\N	\N	100
6797	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6796	\N	4	Sí	\N	\N	\N	\N	\N	100
6798	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6797	\N	4	respuesta	\N	\N	\N	\N	\N	100
6799	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6798	\N	4	( Mencionar las opciones y marcar “x” en los casilleros que indique la madre. Se puede marcar más de uno)	\N	\N	\N	\N	\N	100
6800	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6798	\N	4	a) Leche materna	\N	\N	\N	\N	\N	200
6801	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6800	\N	4	Sí	\N	\N	\N	\N	\N	100
6802	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6800	\N	4	No	\N	\N	\N	\N	\N	200
6803	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6798	\N	4	b) Agua	\N	\N	\N	\N	\N	300
6804	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6803	\N	4	Sí	\N	\N	\N	\N	\N	100
6805	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6804	\N	4	¿Le explicaron por qué le dieron otra alimentación?	\N	\N	\N	\N	\N	100
6806	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6805	\N	4	Sí	\N	\N	\N	\N	\N	100
6807	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6806	\N	4	Si es que sí, ¿cuál? Y por qué?	\N	\N	\N	\N	\N	100
6808	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6807	\N	4	(si existe explicación médica justificada, marca “Si” u obtiene el puntaje total)	\N	\N	\N	\N	\N	100
6809	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6807	\N	4	respuesta	\N	\N	\N	\N	\N	200
6810	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6807	\N	4	Explcación médica justificada	\N	\N	\N	\N	\N	300
6811	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6810	\N	4	Sí	\N	\N	\N	\N	\N	100
6812	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6810	\N	4	No	\N	\N	\N	\N	\N	200
6813	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6805	\N	4	No	\N	\N	\N	\N	\N	200
6814	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6803	\N	4	No	\N	\N	\N	\N	\N	200
6815	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6798	\N	4	c) Agua aromática	\N	\N	\N	\N	\N	400
6816	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6815	\N	4	Sí	\N	\N	\N	\N	\N	100
6817	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6816	\N	4	¿Le explicaron por qué le dieron otra alimentación?	\N	\N	\N	\N	\N	100
6818	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6817	\N	4	Sí	\N	\N	\N	\N	\N	100
6819	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6818	\N	4	Si es que sí, ¿cuál? Y por qué?	\N	\N	\N	\N	\N	100
6820	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6819	\N	4	(si existe explicación médica justificada, marca “Si” u obtiene el puntaje total)	\N	\N	\N	\N	\N	100
6821	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6819	\N	4	respuesta	\N	\N	\N	\N	\N	200
6822	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6819	\N	4	Explcación médica justificada	\N	\N	\N	\N	\N	300
6823	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6822	\N	4	Sí	\N	\N	\N	\N	\N	100
6824	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6822	\N	4	No	\N	\N	\N	\N	\N	200
6825	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6817	\N	4	No	\N	\N	\N	\N	\N	200
6826	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6815	\N	4	No	\N	\N	\N	\N	\N	200
6827	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6798	\N	4	d) Leche de tarro	\N	\N	\N	\N	\N	500
6828	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6827	\N	4	Sí	\N	\N	\N	\N	\N	100
6829	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6828	\N	4	¿Le explicaron por qué le dieron otra alimentación?	\N	\N	\N	\N	\N	100
6830	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6829	\N	4	Sí	\N	\N	\N	\N	\N	100
6831	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6830	\N	4	Si es que sí, ¿cuál? Y por qué?	\N	\N	\N	\N	\N	100
6832	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6831	\N	4	(si existe explicación médica justificada, marca “Si” u obtiene el puntaje total)	\N	\N	\N	\N	\N	100
6833	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6831	\N	4	respuesta	\N	\N	\N	\N	\N	200
6834	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6831	\N	4	Explcación médica justificada	\N	\N	\N	\N	\N	300
6835	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6834	\N	4	Sí	\N	\N	\N	\N	\N	100
6836	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6834	\N	4	No	\N	\N	\N	\N	\N	200
6837	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6829	\N	4	No	\N	\N	\N	\N	\N	200
6838	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6827	\N	4	No	\N	\N	\N	\N	\N	200
6839	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6798	\N	4	e) Leche de vaca	\N	\N	\N	\N	\N	600
6840	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6839	\N	4	Sí	\N	\N	\N	\N	\N	100
6841	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6840	\N	4	¿Le explicaron por qué le dieron otra alimentación?	\N	\N	\N	\N	\N	100
6842	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6841	\N	4	Sí	\N	\N	\N	\N	\N	100
6843	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6842	\N	4	Si es que sí, ¿cuál? Y por qué?	\N	\N	\N	\N	\N	100
6844	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6843	\N	4	(si existe explicación médica justificada, marca “Si” u obtiene el puntaje total)	\N	\N	\N	\N	\N	100
6845	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6843	\N	4	respuesta	\N	\N	\N	\N	\N	200
6846	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6843	\N	4	Explcación médica justificada	\N	\N	\N	\N	\N	300
6847	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6846	\N	4	Sí	\N	\N	\N	\N	\N	100
6848	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6846	\N	4	No	\N	\N	\N	\N	\N	200
6849	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6841	\N	4	No	\N	\N	\N	\N	\N	200
6850	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6839	\N	4	No	\N	\N	\N	\N	\N	200
6851	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6798	\N	4	f) Caldo o sopa	\N	\N	\N	\N	\N	700
6852	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6851	\N	4	Sí	\N	\N	\N	\N	\N	100
6853	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6852	\N	4	¿Le explicaron por qué le dieron otra alimentación?	\N	\N	\N	\N	\N	100
6854	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6853	\N	4	Sí	\N	\N	\N	\N	\N	100
6855	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6854	\N	4	Si es que sí, ¿cuál? Y por qué?	\N	\N	\N	\N	\N	100
6856	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6855	\N	4	(si existe explicación médica justificada, marca “Si” u obtiene el puntaje total)	\N	\N	\N	\N	\N	100
6857	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6855	\N	4	respuesta	\N	\N	\N	\N	\N	200
6858	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6855	\N	4	Explcación médica justificada	\N	\N	\N	\N	\N	300
6859	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6858	\N	4	Sí	\N	\N	\N	\N	\N	100
6860	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6858	\N	4	No	\N	\N	\N	\N	\N	200
6861	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6853	\N	4	No	\N	\N	\N	\N	\N	200
6862	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6851	\N	4	No	\N	\N	\N	\N	\N	200
6863	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6798	\N	4	g) ¿Algo más?(Describa)	\N	\N	\N	\N	\N	800
6864	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6863	\N	4	Sí	\N	\N	\N	\N	\N	100
6865	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6864	\N	4	respuesta	\N	\N	\N	\N	\N	100
6866	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6864	\N	4	¿Le explicaron por qué le dieron otra alimentación?	\N	\N	\N	\N	\N	200
6867	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6866	\N	4	Sí	\N	\N	\N	\N	\N	100
6868	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6867	\N	4	Si es que sí, ¿cuál? Y por qué?	\N	\N	\N	\N	\N	100
6869	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6868	\N	4	(si existe explicación médica justificada, marca “Si” u obtiene el puntaje total)	\N	\N	\N	\N	\N	100
6870	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6868	\N	4	respuesta	\N	\N	\N	\N	\N	200
6871	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6868	\N	4	Explcación médica justificada	\N	\N	\N	\N	\N	300
6872	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6871	\N	4	Sí	\N	\N	\N	\N	\N	100
6873	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6871	\N	4	No	\N	\N	\N	\N	\N	200
6874	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6866	\N	4	No	\N	\N	\N	\N	\N	200
6875	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6863	\N	4	No	\N	\N	\N	\N	\N	200
6876	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6798	\N	4	(Si marca leche materna únicamente, se califica “Sí”)	\N	\N	\N	\N	\N	900
6877	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6796	\N	4	No	\N	\N	\N	\N	\N	200
6878	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6796	\N	4	No sabe, no contesta	\N	\N	\N	\N	\N	300
6879	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6795	\N	4	verificador	\N	\N	\N	\N	\N	200
6880	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6879	\N	4	L.4.c EM	\N	\N	\N	\N	\N	100
6881	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6686	\N	4	44. ¿Permaneció su bebé en la misma habitación durante la internación?	\N	\N	\N	\N	\N	900
6882	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6881	\N	4	respuesta	\N	\N	\N	\N	\N	100
6883	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6882	\N	4	Sí	\N	\N	\N	\N	\N	100
6884	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6882	\N	4	No	\N	\N	\N	\N	\N	200
6885	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6882	\N	4	No sabe, no contesta	\N	\N	\N	\N	\N	300
6886	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6881	\N	4	verificador	\N	\N	\N	\N	\N	200
6887	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6886	\N	4	L.5.a EM	\N	\N	\N	\N	\N	100
6888	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6686	\N	4	45. ¿Le informaron en el establecimiento lo que es la lactancia a libre demanda?	\N	\N	\N	\N	\N	1000
6889	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6888	\N	4	respuesta	\N	\N	\N	\N	\N	100
6890	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6889	\N	4	Sí	\N	\N	\N	\N	\N	100
6891	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6889	\N	4	No	\N	\N	\N	\N	\N	200
6892	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6891	\N	4	¿Tiene el bebé horarios para amamantar o tiempo para lactar?	\N	\N	\N	\N	\N	100
6893	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6892	\N	4	Sí	\N	\N	\N	\N	\N	100
6894	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6892	\N	4	No	\N	\N	\N	\N	\N	200
6895	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6889	\N	4	No sabe, no contesta	\N	\N	\N	\N	\N	300
6896	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6888	\N	4	verificador	\N	\N	\N	\N	\N	200
6897	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6896	\N	4	L.6.a EM	\N	\N	\N	\N	\N	100
6898	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6686	\N	4	46. ¿Puede reconocer cuándo su bebé está con hambre?	\N	\N	\N	\N	\N	1100
6899	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6898	\N	4	respuesta	\N	\N	\N	\N	\N	100
6900	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6899	\N	4	Sí	\N	\N	\N	\N	\N	100
6901	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6900	\N	4	(vale por 1,5 puntos)	\N	\N	\N	\N	\N	100
6902	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6899	\N	4	No	\N	\N	\N	\N	\N	200
6903	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6899	\N	4	No sabe, no contesta	\N	\N	\N	\N	\N	300
6904	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6898	\N	4	verificador	\N	\N	\N	\N	\N	200
6905	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6904	\N	4	L.6.b EM	\N	\N	\N	\N	\N	100
6906	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6686	\N	4	47. ¿Puede reconocer cuándo su bebé está lleno/a?	\N	\N	\N	\N	\N	1200
6907	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6906	\N	4	respuesta	\N	\N	\N	\N	\N	100
6908	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6907	\N	4	Sí	\N	\N	\N	\N	\N	100
6909	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6908	\N	4	(vale por 1,5 puntos)	\N	\N	\N	\N	\N	100
6910	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6907	\N	4	No	\N	\N	\N	\N	\N	200
6911	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6907	\N	4	No sabe, no contesta	\N	\N	\N	\N	\N	300
6912	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6906	\N	4	verificador	\N	\N	\N	\N	\N	200
6913	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6912	\N	4	L.6.b EM	\N	\N	\N	\N	\N	100
6914	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6686	\N	4	48. ¿En el establecimiento le dijeron dónde o quién le puede ayudar si usted tiene problemas para dar el seno?	\N	\N	\N	\N	\N	1300
6915	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6914	\N	4	respuesta	\N	\N	\N	\N	\N	100
6916	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6915	\N	4	Sí	\N	\N	\N	\N	\N	100
6917	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6916	\N	4	¿Dónde o quién?	\N	\N	\N	\N	\N	100
6918	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6917	\N	4	(Marque “x” en las opciones que apliquen)	\N	\N	\N	\N	\N	100
6919	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6917	\N	4	1. Directo en el establecimiento	\N	\N	\N	\N	\N	200
6920	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6919	\N	4	Sí	\N	\N	\N	\N	\N	100
6921	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6919	\N	4	No	\N	\N	\N	\N	\N	200
6922	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6917	\N	4	2. Algún profesional de salud	\N	\N	\N	\N	\N	300
6923	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6922	\N	4	Sí	\N	\N	\N	\N	\N	100
6924	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6922	\N	4	No	\N	\N	\N	\N	\N	200
6925	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6917	\N	4	3. Línea 171	\N	\N	\N	\N	\N	400
6926	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6925	\N	4	Sí	\N	\N	\N	\N	\N	100
6927	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6925	\N	4	No	\N	\N	\N	\N	\N	200
6928	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6917	\N	4	4. Grupo de apoyo a la lactancia	\N	\N	\N	\N	\N	500
6929	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6928	\N	4	Sí	\N	\N	\N	\N	\N	100
6930	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6928	\N	4	No	\N	\N	\N	\N	\N	200
6931	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6917	\N	4	5. Otro servicio comunitario	\N	\N	\N	\N	\N	600
6932	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6931	\N	4	Sí	\N	\N	\N	\N	\N	100
6933	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6931	\N	4	No	\N	\N	\N	\N	\N	200
6934	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6917	\N	4	6. Ninguno	\N	\N	\N	\N	\N	700
6935	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6934	\N	4	Sí	\N	\N	\N	\N	\N	100
6936	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6934	\N	4	No	\N	\N	\N	\N	\N	200
6937	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6917	\N	4	(Si no menciona alguno de estos, o si marca ninguno es “No”)	\N	\N	\N	\N	\N	800
6938	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6915	\N	4	No	\N	\N	\N	\N	\N	200
6939	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6915	\N	4	No sabe, no contesta	\N	\N	\N	\N	\N	300
6940	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6914	\N	4	verificador	\N	\N	\N	\N	\N	200
6941	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6940	\N	4	L.8.a EM	\N	\N	\N	\N	\N	100
6942	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6686	\N	4	49. OBSERVACIONES	\N	\N	\N	\N	\N	1400
6943	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	4	F. Para madres que no amamantan	\N	\N	\N	\N	\N	700
6944	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6943	\N	4	50. ¿Por qué motivo o razón usted no dará de lactar a su bebé?	\N	\N	\N	\N	\N	100
6945	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6944	\N	4	respuesta	\N	\N	\N	\N	\N	100
6946	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6945	\N	4	a) Por recomendación médica	\N	\N	\N	\N	\N	100
6947	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6946	\N	4	Sí	\N	\N	\N	\N	\N	100
6948	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6946	\N	4	No	\N	\N	\N	\N	\N	200
6949	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6945	\N	4	b) Por decisión propia	\N	\N	\N	\N	\N	200
6950	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6949	\N	4	Sí	\N	\N	\N	\N	\N	100
6951	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6949	\N	4	No	\N	\N	\N	\N	\N	200
6952	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6945	\N	4	c) Por enfermedad de la madre	\N	\N	\N	\N	\N	300
6953	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6952	\N	4	Sí	\N	\N	\N	\N	\N	100
6954	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6952	\N	4	No	\N	\N	\N	\N	\N	200
6955	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6945	\N	4	d) Por enfermedad del bebé	\N	\N	\N	\N	\N	400
6956	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6955	\N	4	Sí	\N	\N	\N	\N	\N	100
6957	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6955	\N	4	No	\N	\N	\N	\N	\N	200
6958	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6945	\N	4	Otros	\N	\N	\N	\N	\N	500
6959	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6944	\N	4	verificador	\N	\N	\N	\N	\N	200
6960	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6943	\N	4	51. Durante el embarazo, ¿recibió información sobre los siguientes temas?	\N	\N	\N	\N	\N	200
6961	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6960	\N	4	respuesta	\N	\N	\N	\N	\N	100
6962	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6961	\N	4	(Mencionar las opciones y marcar los casilleros que indique la madre. Se puede marcar más de uno)	\N	\N	\N	\N	\N	100
6963	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6961	\N	4	a) Importancia de estar con el bebé piel a piel inmediatamente después del parto	\N	\N	\N	\N	\N	200
6964	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6963	\N	4	Sí	\N	\N	\N	\N	\N	100
6965	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6963	\N	4	No	\N	\N	\N	\N	\N	200
6966	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6961	\N	4	b) Importancia de tener a su bebé en la misma habitación/cama las 24 horas del día	\N	\N	\N	\N	\N	300
6967	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6966	\N	4	Sí	\N	\N	\N	\N	\N	100
6968	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6966	\N	4	No	\N	\N	\N	\N	\N	200
6969	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6961	\N	4	c) Riesgos de infección de una madre VIH positivo a su bebé	\N	\N	\N	\N	\N	400
6970	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6969	\N	4	Sí	\N	\N	\N	\N	\N	100
6971	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6969	\N	4	No	\N	\N	\N	\N	\N	200
6972	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6961	\N	4	d) Las consecuencias de utilizar leche de fórmula, biberones y chupones	\N	\N	\N	\N	\N	500
6973	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6972	\N	4	Sí	\N	\N	\N	\N	\N	100
6974	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6972	\N	4	No	\N	\N	\N	\N	\N	200
6975	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6961	\N	4	e) Ninguno	\N	\N	\N	\N	\N	600
6976	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6975	\N	4	Sí	\N	\N	\N	\N	\N	100
6977	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6975	\N	4	No	\N	\N	\N	\N	\N	200
6978	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6960	\N	4	verificador	\N	\N	\N	\N	\N	200
6979	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6943	\N	4	52. ¿Cómo está alimentando a su bebé?	\N	\N	\N	\N	\N	300
6980	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6979	\N	4	respuesta	\N	\N	\N	\N	\N	100
6981	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6980	\N	4	(Mencionar las opciones y marcar en los casilleros que indique la madre. Se puede marcar más de uno)	\N	\N	\N	\N	\N	100
6982	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6980	\N	4	a) Agua	\N	\N	\N	\N	\N	200
6983	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6982	\N	4	Sí	\N	\N	\N	\N	\N	100
6984	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6982	\N	4	No	\N	\N	\N	\N	\N	200
6985	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6980	\N	4	b) Fórmula	\N	\N	\N	\N	\N	300
6986	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6985	\N	4	Sí	\N	\N	\N	\N	\N	100
6987	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6985	\N	4	No	\N	\N	\N	\N	\N	200
6988	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6980	\N	4	c) Leche materna	\N	\N	\N	\N	\N	400
6989	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6988	\N	4	Sí	\N	\N	\N	\N	\N	100
6990	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6988	\N	4	No	\N	\N	\N	\N	\N	200
6991	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6980	\N	4	Otras preparaciones	\N	\N	\N	\N	\N	500
6992	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6979	\N	4	verificador	\N	\N	\N	\N	\N	200
6993	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6943	\N	4	53. ¿Alguien en el hospital le indicó cómo preparar la leche de fórmula para su bebé y la higiene que debe mantenerse?	\N	\N	\N	\N	\N	400
6994	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6993	\N	4	respuesta	\N	\N	\N	\N	\N	100
6995	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6994	\N	4	Sí	\N	\N	\N	\N	\N	100
6996	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6994	\N	4	No	\N	\N	\N	\N	\N	200
6997	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6994	\N	4	No sabe, no contesta	\N	\N	\N	\N	\N	300
6998	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6993	\N	4	verificador	\N	\N	\N	\N	\N	200
6999	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6998	\N	4	L.3.c EM	\N	\N	\N	\N	\N	100
7000	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6943	\N	4	54. ¿En el hospital le dijeron cuál es la mejor forma de aumentar la producción de leche materna?	\N	\N	\N	\N	\N	500
7001	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7000	\N	4	respuesta	\N	\N	\N	\N	\N	100
7002	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7001	\N	4	Sí	\N	\N	\N	\N	\N	100
7003	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7001	\N	4	No	\N	\N	\N	\N	\N	200
7004	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7001	\N	4	No sabe, no contesta	\N	\N	\N	\N	\N	300
7005	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7000	\N	4	verificador	\N	\N	\N	\N	\N	200
7006	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7005	\N	4	L.3.b EM	\N	\N	\N	\N	\N	100
7007	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6943	\N	4	55. ¿Permaneció su hijo con usted en la misma cama, mientras estuvo en el hospital?	\N	\N	\N	\N	\N	600
7008	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7007	\N	4	respuesta	\N	\N	\N	\N	\N	100
7009	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7008	\N	4	Sí	\N	\N	\N	\N	\N	100
7010	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7008	\N	4	No	\N	\N	\N	\N	\N	200
7011	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7008	\N	4	No sabe, no contesta	\N	\N	\N	\N	\N	300
7012	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7007	\N	4	verificador	\N	\N	\N	\N	\N	200
7013	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6943	\N	4	56. ¿En el hospital le dijeron dónde o quién le puede ayudar si usted tiene problemas para dar el seno?	\N	\N	\N	\N	\N	700
7014	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7013	\N	4	respuesta	\N	\N	\N	\N	\N	100
7015	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7014	\N	4	Sí	\N	\N	\N	\N	\N	100
7016	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7015	\N	4	¿Dónde o quién?	\N	\N	\N	\N	\N	100
7017	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7014	\N	4	No	\N	\N	\N	\N	\N	200
7018	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7014	\N	4	No sabe, no contesta	\N	\N	\N	\N	\N	300
7019	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7013	\N	4	verificador	\N	\N	\N	\N	\N	200
7020	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6943	\N	4	57. ¿Alguien en el ES le explicó sobre la importancia de la leche materna?	\N	\N	\N	\N	\N	800
7021	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7020	\N	4	respuesta	\N	\N	\N	\N	\N	100
7022	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7021	\N	4	Sí	\N	\N	\N	\N	\N	100
7023	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7021	\N	4	No	\N	\N	\N	\N	\N	200
7024	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7021	\N	4	No sabe, no contesta	\N	\N	\N	\N	\N	300
7025	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7020	\N	4	verificador	\N	\N	\N	\N	\N	200
7026	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7025	\N	4	L.4.b EM	\N	\N	\N	\N	\N	100
7027	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	6943	\N	4	58. OBSERVACIONES	\N	\N	\N	\N	\N	900
7028	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5	a. Datos del empleado en el ES	\N	\N	\N	\N	\N	100
7029	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7028	\N	5	1. Área de trabajo en el establecimiento:	\N	\N	\N	\N	\N	100
7030	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7028	\N	5	2. Personal en contacto con la madre:	\N	\N	\N	\N	\N	200
7031	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7030	\N	5	respuesta	\N	\N	\N	\N	\N	100
7032	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7030	\N	5	¿En qué momento?	\N	\N	\N	\N	\N	200
7033	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7032	\N	5	a) Prenatal	\N	\N	\N	\N	\N	100
7034	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7032	\N	5	b) Durante el parto	\N	\N	\N	\N	\N	200
7035	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7032	\N	5	c) Puerperio	\N	\N	\N	\N	\N	300
7036	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5	b. Evaluación al personal	\N	\N	\N	\N	\N	200
7037	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7036	\N	5	3. ¿Conoce usted la Norma de Establecimientos de Salud Amigos de la Madre y del Niño?	\N	\N	\N	\N	\N	100
7038	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7037	\N	5	respuesta	\N	\N	\N	\N	\N	100
7039	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7038	\N	5	Sí	\N	\N	\N	\N	\N	100
7040	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7038	\N	5	No	\N	\N	\N	\N	\N	200
7041	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7037	\N	5	verificador	\N	\N	\N	\N	\N	200
7042	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7041	\N	5	G.1.a EP	\N	\N	\N	\N	\N	100
7043	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7036	\N	5	4. ¿Ha sido capacitado para atender partos en libre posición?	\N	\N	\N	\N	\N	200
7044	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7043	\N	5	respuesta	\N	\N	\N	\N	\N	100
7045	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7044	\N	5	Sí	\N	\N	\N	\N	\N	100
7046	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7045	\N	5	(Si es que es Si, vale 1 punto)	\N	\N	\N	\N	\N	100
7047	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7045	\N	5	¿cuándo?	\N	\N	\N	\N	\N	200
7048	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7045	\N	5	La capacitación incluyó pasantías vivenciales	\N	\N	\N	\N	\N	300
7049	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7048	\N	5	Sí	\N	\N	\N	\N	\N	100
7050	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7049	\N	5	(Si es que Si, vale 1 punto )	\N	\N	\N	\N	\N	100
7051	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7048	\N	5	No	\N	\N	\N	\N	\N	200
7052	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7044	\N	5	No	\N	\N	\N	\N	\N	200
7053	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7052	\N	5	P.3.d EP	\N	\N	\N	\N	\N	100
7054	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7043	\N	5	verificador	\N	\N	\N	\N	\N	200
7055	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7036	\N	5	5. ¿Conoce métodos no farmacológicos para aliviar el dolor durante el parto?	\N	\N	\N	\N	\N	300
7056	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7055	\N	5	respuesta	\N	\N	\N	\N	\N	100
7057	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7056	\N	5	Sí	\N	\N	\N	\N	\N	100
7058	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7057	\N	5	mencione dos:	\N	\N	\N	\N	\N	100
7059	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7058	\N	5	(Esperar a que el entrevistado responda y marque. Se puede seleccionar más de 1)	\N	\N	\N	\N	\N	100
7060	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7058	\N	5	a) Masaje	\N	\N	\N	\N	\N	200
7061	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7060	\N	5	Sí	\N	\N	\N	\N	\N	100
7062	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7060	\N	5	No	\N	\N	\N	\N	\N	200
7063	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7058	\N	5	b) Calor local	\N	\N	\N	\N	\N	300
7064	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7063	\N	5	Sí	\N	\N	\N	\N	\N	100
7065	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7063	\N	5	No	\N	\N	\N	\N	\N	200
7066	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7058	\N	5	c) Deambulación	\N	\N	\N	\N	\N	400
7067	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7066	\N	5	Sí	\N	\N	\N	\N	\N	100
7068	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7066	\N	5	No	\N	\N	\N	\N	\N	200
7069	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7058	\N	5	d) Baños de agua	\N	\N	\N	\N	\N	500
7070	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7069	\N	5	Sí	\N	\N	\N	\N	\N	100
7071	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7069	\N	5	No	\N	\N	\N	\N	\N	200
7072	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7058	\N	5	e) Relajación	\N	\N	\N	\N	\N	600
7073	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7072	\N	5	Sí	\N	\N	\N	\N	\N	100
7074	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7072	\N	5	No	\N	\N	\N	\N	\N	200
7075	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7058	\N	5	f) Musicoterapia	\N	\N	\N	\N	\N	700
7076	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7075	\N	5	Sí	\N	\N	\N	\N	\N	100
7077	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7075	\N	5	No	\N	\N	\N	\N	\N	200
7078	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7058	\N	5	g) Aromaterapia	\N	\N	\N	\N	\N	800
7079	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7078	\N	5	Sí	\N	\N	\N	\N	\N	100
7080	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7078	\N	5	No	\N	\N	\N	\N	\N	200
7081	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7058	\N	5	h) Visualización	\N	\N	\N	\N	\N	900
7082	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7081	\N	5	Sí	\N	\N	\N	\N	\N	100
7083	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7081	\N	5	No	\N	\N	\N	\N	\N	200
7084	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7058	\N	5	i) Otros	\N	\N	\N	\N	\N	1000
7085	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7084	\N	5	Sí	\N	\N	\N	\N	\N	100
7086	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7084	\N	5	No	\N	\N	\N	\N	\N	200
7087	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7058	\N	5	j) Ninguno	\N	\N	\N	\N	\N	1100
7088	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7087	\N	5	Sí	\N	\N	\N	\N	\N	100
7089	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7087	\N	5	No	\N	\N	\N	\N	\N	200
7090	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7058	\N	5	(Si menciona al menos 2 métodos, marca “sí” en evaluación)	\N	\N	\N	\N	\N	1200
7091	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7056	\N	5	No	\N	\N	\N	\N	\N	200
7092	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7091	\N	5	P.4.b EP	\N	\N	\N	\N	\N	100
7093	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7055	\N	5	verificador	\N	\N	\N	\N	\N	200
7094	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7036	\N	5	6. Mencione tres procedimientos que deban evitarse durante el parto y sus respectivas justificaciones por complicaciones	\N	\N	\N	\N	\N	400
7095	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7094	\N	5	respuesta	\N	\N	\N	\N	\N	100
7096	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7095	\N	5	(Esperar a que el encuestado/a mencione el método y compruebe si la justificación es válida médicamente. NO mencione la lista de procedimientos)	\N	\N	\N	\N	\N	100
7097	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7095	\N	5	Procedimiento	\N	\N	\N	\N	\N	200
7098	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7097	\N	5	a) canalización intravenosa de rutina;	\N	\N	\N	\N	\N	100
7099	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7098	\N	5	Complicación que lo justifique	\N	\N	\N	\N	\N	100
7100	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7099	\N	5	justificación	\N	\N	\N	\N	\N	100
7101	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7099	\N	5	está justificada	\N	\N	\N	\N	\N	200
7102	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7101	\N	5	Sí	\N	\N	\N	\N	\N	100
7103	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7101	\N	5	No	\N	\N	\N	\N	\N	200
7104	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7098	\N	5	(Escriba la justificación y marque X si está justificada)	\N	\N	\N	\N	\N	200
7105	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7097	\N	5	b) episiotomías;	\N	\N	\N	\N	\N	200
7106	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7105	\N	5	Complicación que lo justifique	\N	\N	\N	\N	\N	100
7107	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7106	\N	5	justificación	\N	\N	\N	\N	\N	100
7108	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7106	\N	5	está justificada	\N	\N	\N	\N	\N	200
7109	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7108	\N	5	Sí	\N	\N	\N	\N	\N	100
7110	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7108	\N	5	No	\N	\N	\N	\N	\N	200
7111	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7105	\N	5	(Escriba la justificación y marque X si está justificada)	\N	\N	\N	\N	\N	200
7112	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7097	\N	5	c) parto instrumentado;	\N	\N	\N	\N	\N	300
7113	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7112	\N	5	Complicación que lo justifique	\N	\N	\N	\N	\N	100
7114	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7113	\N	5	justificación	\N	\N	\N	\N	\N	100
7115	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7113	\N	5	está justificada	\N	\N	\N	\N	\N	200
7116	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7115	\N	5	Sí	\N	\N	\N	\N	\N	100
7117	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7115	\N	5	No	\N	\N	\N	\N	\N	200
7118	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7112	\N	5	(Escriba la justificación y marque X si está justificada)	\N	\N	\N	\N	\N	200
7119	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7097	\N	5	d) enema;	\N	\N	\N	\N	\N	400
7120	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7119	\N	5	Complicación que lo justifique	\N	\N	\N	\N	\N	100
7121	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7120	\N	5	justificación	\N	\N	\N	\N	\N	100
7122	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7120	\N	5	está justificada	\N	\N	\N	\N	\N	200
7123	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7122	\N	5	Sí	\N	\N	\N	\N	\N	100
7124	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7122	\N	5	No	\N	\N	\N	\N	\N	200
7125	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7119	\N	5	(Escriba la justificación y marque X si está justificada)	\N	\N	\N	\N	\N	200
7126	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7097	\N	5	e) separación,  ruptura artificial, o decolamiento de membranas;	\N	\N	\N	\N	\N	500
7127	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7126	\N	5	Complicación que lo justifique	\N	\N	\N	\N	\N	100
7128	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7127	\N	5	justificación	\N	\N	\N	\N	\N	100
7129	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7127	\N	5	está justificada	\N	\N	\N	\N	\N	200
7130	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7129	\N	5	Sí	\N	\N	\N	\N	\N	100
7131	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7129	\N	5	No	\N	\N	\N	\N	\N	200
7132	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7126	\N	5	(Escriba la justificación y marque X si está justificada)	\N	\N	\N	\N	\N	200
7133	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7097	\N	5	f) inducción médica y/o aceleramiento del trabajo de parto;	\N	\N	\N	\N	\N	600
7134	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7133	\N	5	Complicación que lo justifique	\N	\N	\N	\N	\N	100
7135	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7134	\N	5	justificación	\N	\N	\N	\N	\N	100
7136	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7134	\N	5	está justificada	\N	\N	\N	\N	\N	200
7137	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7136	\N	5	Sí	\N	\N	\N	\N	\N	100
7138	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7136	\N	5	No	\N	\N	\N	\N	\N	200
7139	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7133	\N	5	(Escriba la justificación y marque X si está justificada)	\N	\N	\N	\N	\N	200
7140	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7097	\N	5	g) exámenes vaginales repetidos;La realización de tactos vaginales de acuerdo a lo establecido en la norma: Máximo 1 tacto cada cuatro horas. 	\N	\N	\N	\N	\N	700
7141	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7140	\N	5	Complicación que lo justifique	\N	\N	\N	\N	\N	100
7142	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7141	\N	5	justificación	\N	\N	\N	\N	\N	100
7143	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7141	\N	5	está justificada	\N	\N	\N	\N	\N	200
7144	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7143	\N	5	Sí	\N	\N	\N	\N	\N	100
7145	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7143	\N	5	No	\N	\N	\N	\N	\N	200
7146	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7140	\N	5	(Escriba la justificación y marque X si está justificada)	\N	\N	\N	\N	\N	200
7147	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7097	\N	5	h) fluidos intravenosos;	\N	\N	\N	\N	\N	800
7148	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7147	\N	5	Complicación que lo justifique	\N	\N	\N	\N	\N	100
7149	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7148	\N	5	justificación	\N	\N	\N	\N	\N	100
7150	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7148	\N	5	está justificada	\N	\N	\N	\N	\N	200
7151	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7150	\N	5	Sí	\N	\N	\N	\N	\N	100
7152	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7150	\N	5	No	\N	\N	\N	\N	\N	200
7153	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7147	\N	5	(Escriba la justificación y marque X si está justificada)	\N	\N	\N	\N	\N	200
7154	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7097	\N	5	i) monitoreo electrónico fetal continuo (cardiotocografía);	\N	\N	\N	\N	\N	900
7155	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7154	\N	5	Complicación que lo justifique	\N	\N	\N	\N	\N	100
7156	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7155	\N	5	justificación	\N	\N	\N	\N	\N	100
7157	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7155	\N	5	está justificada	\N	\N	\N	\N	\N	200
7158	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7157	\N	5	Sí	\N	\N	\N	\N	\N	100
7159	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7157	\N	5	No	\N	\N	\N	\N	\N	200
7160	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7154	\N	5	(Escriba la justificación y marque X si está justificada)	\N	\N	\N	\N	\N	200
7161	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7097	\N	5	j) control farmacológico del dolor;	\N	\N	\N	\N	\N	1000
7162	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7161	\N	5	Complicación que lo justifique	\N	\N	\N	\N	\N	100
7163	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7162	\N	5	justificación	\N	\N	\N	\N	\N	100
7164	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7162	\N	5	está justificada	\N	\N	\N	\N	\N	200
7165	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7164	\N	5	Sí	\N	\N	\N	\N	\N	100
7166	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7164	\N	5	No	\N	\N	\N	\N	\N	200
7167	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7161	\N	5	(Escriba la justificación y marque X si está justificada)	\N	\N	\N	\N	\N	200
7168	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7097	\N	5	k) colocación de catéter  urinario;	\N	\N	\N	\N	\N	1100
7169	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7168	\N	5	Complicación que lo justifique	\N	\N	\N	\N	\N	100
7170	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7169	\N	5	justificación	\N	\N	\N	\N	\N	100
7171	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7169	\N	5	está justificada	\N	\N	\N	\N	\N	200
7172	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7171	\N	5	Sí	\N	\N	\N	\N	\N	100
7173	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7171	\N	5	No	\N	\N	\N	\N	\N	200
7174	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7168	\N	5	(Escriba la justificación y marque X si está justificada)	\N	\N	\N	\N	\N	200
7175	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7097	\N	5	l) posición supina o de litotomía (piernas en estribos);	\N	\N	\N	\N	\N	1200
7176	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7175	\N	5	Complicación que lo justifique	\N	\N	\N	\N	\N	100
7177	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7176	\N	5	justificación	\N	\N	\N	\N	\N	100
7178	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7176	\N	5	está justificada	\N	\N	\N	\N	\N	200
7179	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7178	\N	5	Sí	\N	\N	\N	\N	\N	100
7180	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7178	\N	5	No	\N	\N	\N	\N	\N	200
7181	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7175	\N	5	(Escriba la justificación y marque X si está justificada)	\N	\N	\N	\N	\N	200
7182	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7097	\N	5	m) pujos dirigidos por el personal de salud;	\N	\N	\N	\N	\N	1300
7183	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7182	\N	5	Complicación que lo justifique	\N	\N	\N	\N	\N	100
7184	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7183	\N	5	justificación	\N	\N	\N	\N	\N	100
7185	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7183	\N	5	está justificada	\N	\N	\N	\N	\N	200
7186	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7185	\N	5	Sí	\N	\N	\N	\N	\N	100
7187	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7185	\N	5	No	\N	\N	\N	\N	\N	200
7188	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7182	\N	5	(Escriba la justificación y marque X si está justificada)	\N	\N	\N	\N	\N	200
7189	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7097	\N	5	n) presión del fondo uterino (Kristeller);	\N	\N	\N	\N	\N	1400
7190	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7189	\N	5	Complicación que lo justifique	\N	\N	\N	\N	\N	100
7191	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7190	\N	5	justificación	\N	\N	\N	\N	\N	100
7192	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7190	\N	5	está justificada	\N	\N	\N	\N	\N	200
7193	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7192	\N	5	Sí	\N	\N	\N	\N	\N	100
7194	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7192	\N	5	No	\N	\N	\N	\N	\N	200
7195	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7189	\N	5	(Escriba la justificación y marque X si está justificada)	\N	\N	\N	\N	\N	200
7196	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7097	\N	5	o) fórceps y extracción por vacío;	\N	\N	\N	\N	\N	1500
7197	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7196	\N	5	Complicación que lo justifique	\N	\N	\N	\N	\N	100
7198	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7197	\N	5	justificación	\N	\N	\N	\N	\N	100
7199	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7197	\N	5	está justificada	\N	\N	\N	\N	\N	200
7200	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7199	\N	5	Sí	\N	\N	\N	\N	\N	100
7201	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7199	\N	5	No	\N	\N	\N	\N	\N	200
7202	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7196	\N	5	(Escriba la justificación y marque X si está justificada)	\N	\N	\N	\N	\N	200
7203	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7097	\N	5	p) exploración manual del útero o aspiración del recién nacido.	\N	\N	\N	\N	\N	1600
7204	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7203	\N	5	Complicación que lo justifique	\N	\N	\N	\N	\N	100
7205	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7204	\N	5	justificación	\N	\N	\N	\N	\N	100
7206	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7204	\N	5	está justificada	\N	\N	\N	\N	\N	200
7207	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7206	\N	5	Sí	\N	\N	\N	\N	\N	100
7208	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7206	\N	5	No	\N	\N	\N	\N	\N	200
7209	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7203	\N	5	(Escriba la justificación y marque X si está justificada)	\N	\N	\N	\N	\N	200
7210	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7097	\N	5	q) Otro	\N	\N	\N	\N	\N	1700
7211	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7210	\N	5	respuesta	\N	\N	\N	\N	\N	100
7212	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7210	\N	5	Complicación que lo justifique	\N	\N	\N	\N	\N	200
7213	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7212	\N	5	justificación	\N	\N	\N	\N	\N	100
7214	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7212	\N	5	está justificada	\N	\N	\N	\N	\N	200
7215	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7214	\N	5	Sí	\N	\N	\N	\N	\N	100
7216	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7214	\N	5	No	\N	\N	\N	\N	\N	200
7217	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7210	\N	5	(Escriba la justificación y marque X si está justificada)	\N	\N	\N	\N	\N	300
7218	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7095	\N	5	(Si menciona 3 procedimientos y 3 justificaciones correctas, marca “sí” en evaluación)	\N	\N	\N	\N	\N	300
7219	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7094	\N	5	verificador	\N	\N	\N	\N	\N	200
7220	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7219	\N	5	P.5.a EP	\N	\N	\N	\N	\N	100
7221	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7036	\N	5	7. ¿Cuáles son los fundamentos del pinzamiento oportuno del cordón umbilical?	\N	\N	\N	\N	\N	500
7222	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7221	\N	5	respuesta	\N	\N	\N	\N	\N	100
7223	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7222	\N	5	(Esperar a que el entrevistado/a mencione los fundamentos y marque según corresponda. Se puede marcar más de una opción)	\N	\N	\N	\N	\N	100
7224	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7222	\N	5	a) Esperar al menos 2 minutos	\N	\N	\N	\N	\N	200
7225	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7224	\N	5	Sí	\N	\N	\N	\N	\N	100
7226	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7224	\N	5	No	\N	\N	\N	\N	\N	200
7227	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7222	\N	5	b) Esperar hasta que el cordón deje de latir	\N	\N	\N	\N	\N	300
7228	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7227	\N	5	Sí	\N	\N	\N	\N	\N	100
7229	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7227	\N	5	No	\N	\N	\N	\N	\N	200
7230	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7222	\N	5	c) Ninguno de los anteriores	\N	\N	\N	\N	\N	400
7231	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7230	\N	5	Sí	\N	\N	\N	\N	\N	100
7232	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7230	\N	5	No	\N	\N	\N	\N	\N	200
7233	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7222	\N	5	(Si menciona al menos 1 método, marca “sí” en evaluación)	\N	\N	\N	\N	\N	500
7234	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7221	\N	5	verificador	\N	\N	\N	\N	\N	200
7235	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7234	\N	5	P.6.c EP	\N	\N	\N	\N	\N	100
7236	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7036	\N	5	8. ¿Ha sido capacitado en destrezas de emergencias obstétricas y neonatales?	\N	\N	\N	\N	\N	600
7237	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7236	\N	5	respuesta	\N	\N	\N	\N	\N	100
7238	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7237	\N	5	Sí	\N	\N	\N	\N	\N	100
7239	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7238	\N	5	¿Cuándo?	\N	\N	\N	\N	\N	100
7240	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7238	\N	5	¿Dónde?	\N	\N	\N	\N	\N	200
7241	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7238	\N	5	¿Cuántas horas?	\N	\N	\N	\N	\N	300
7242	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7237	\N	5	No/ No sabe, no contesta	\N	\N	\N	\N	\N	200
7243	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7236	\N	5	verificador	\N	\N	\N	\N	\N	200
7244	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7243	\N	5	P.8.b EP	\N	\N	\N	\N	\N	100
7245	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7036	\N	5	9. Mencione 2 signos de peligro para la madre después del parto	\N	\N	\N	\N	\N	700
7246	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7245	\N	5	respuesta	\N	\N	\N	\N	\N	100
7247	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7246	\N	5	Sí	\N	\N	\N	\N	\N	100
7248	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7247	\N	5	(Esperar respuesta del encuestado/a. Marque con “x” según corresponda. Puede seleccionar más de dos)	\N	\N	\N	\N	\N	100
7249	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7247	\N	5	a) Sangrado o secreción	\N	\N	\N	\N	\N	200
7250	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7249	\N	5	Sí	\N	\N	\N	\N	\N	100
7251	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7249	\N	5	No	\N	\N	\N	\N	\N	200
7252	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7247	\N	5	b) Fiebre	\N	\N	\N	\N	\N	300
7253	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7252	\N	5	Sí	\N	\N	\N	\N	\N	100
7254	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7252	\N	5	No	\N	\N	\N	\N	\N	200
7255	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7247	\N	5	c) Dolor de barriga	\N	\N	\N	\N	\N	400
7256	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7255	\N	5	Sí	\N	\N	\N	\N	\N	100
7257	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7255	\N	5	No	\N	\N	\N	\N	\N	200
7258	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7247	\N	5	d) Visión borrosa	\N	\N	\N	\N	\N	500
7259	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7258	\N	5	Sí	\N	\N	\N	\N	\N	100
7260	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7258	\N	5	No	\N	\N	\N	\N	\N	200
7261	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7247	\N	5	e) Ninguno	\N	\N	\N	\N	\N	600
7262	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7261	\N	5	Sí	\N	\N	\N	\N	\N	100
7263	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7261	\N	5	No	\N	\N	\N	\N	\N	200
7264	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7247	\N	5	(Si no menciona 2 signos se marca “No”)	\N	\N	\N	\N	\N	700
7265	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7246	\N	5	No/ No sabe, no contesta	\N	\N	\N	\N	\N	200
7266	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7245	\N	5	verificador	\N	\N	\N	\N	\N	200
7267	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7266	\N	5	P.10.b.2 EP	\N	\N	\N	\N	\N	100
7268	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7036	\N	5	10. Mencione 2 signos de peligro para la bebé	\N	\N	\N	\N	\N	800
7269	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7268	\N	5	respuesta	\N	\N	\N	\N	\N	100
7270	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7269	\N	5	Sí	\N	\N	\N	\N	\N	100
7271	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7270	\N	5	(Esperar respuesta del encuestado/a. Marque con según corresponda. Puede seleccionar más de dos)	\N	\N	\N	\N	\N	100
7272	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7270	\N	5	a) Cambio de coloración	\N	\N	\N	\N	\N	200
7273	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7272	\N	5	Sí	\N	\N	\N	\N	\N	100
7274	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7272	\N	5	No	\N	\N	\N	\N	\N	200
7275	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7270	\N	5	b) Dificultad para alimentarse	\N	\N	\N	\N	\N	300
7276	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7275	\N	5	Sí	\N	\N	\N	\N	\N	100
7277	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7275	\N	5	No	\N	\N	\N	\N	\N	200
7278	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7270	\N	5	c) Fiebre	\N	\N	\N	\N	\N	400
7279	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7278	\N	5	Sí	\N	\N	\N	\N	\N	100
7280	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7278	\N	5	No	\N	\N	\N	\N	\N	200
7281	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7270	\N	5	d) Dificultad para respirar	\N	\N	\N	\N	\N	500
7282	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7281	\N	5	Sí	\N	\N	\N	\N	\N	100
7283	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7281	\N	5	No	\N	\N	\N	\N	\N	200
7284	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7270	\N	5	e) Tieso o ataque	\N	\N	\N	\N	\N	600
7285	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7284	\N	5	Sí	\N	\N	\N	\N	\N	100
7286	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7284	\N	5	No	\N	\N	\N	\N	\N	200
7287	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7270	\N	5	f) Debilidad	\N	\N	\N	\N	\N	700
7288	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7287	\N	5	Sí	\N	\N	\N	\N	\N	100
7289	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7287	\N	5	No	\N	\N	\N	\N	\N	200
7290	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7270	\N	5	g) Ninguno	\N	\N	\N	\N	\N	800
7291	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7290	\N	5	Sí	\N	\N	\N	\N	\N	100
7292	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7290	\N	5	No	\N	\N	\N	\N	\N	200
7293	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7270	\N	5	(Si no menciona 2 signos se marca “No”)	\N	\N	\N	\N	\N	900
7294	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7269	\N	5	No/ No sabe, no contesta	\N	\N	\N	\N	\N	200
7295	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7268	\N	5	verificador	\N	\N	\N	\N	\N	200
7296	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7295	\N	5	P.10.b.2 EP	\N	\N	\N	\N	\N	100
7297	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7036	\N	5	11. ¿Enseña a las madres cómo amamantar?	\N	\N	\N	\N	\N	900
7298	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7297	\N	5	respuesta	\N	\N	\N	\N	\N	100
7299	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7298	\N	5	Sí	\N	\N	\N	\N	\N	100
7300	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7299	\N	5	¿Puede mostrarme y describirme cómo enseñaría a una madre a amamantar?	\N	\N	\N	\N	\N	100
7301	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7300	\N	5	(Marque si habla de alguno de los siguientes temas)	\N	\N	\N	\N	\N	100
7302	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7300	\N	5	a) El bebé debe estar sostenido cerca al pecho	\N	\N	\N	\N	\N	200
7303	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7302	\N	5	Sí	\N	\N	\N	\N	\N	100
7304	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7302	\N	5	No	\N	\N	\N	\N	\N	200
7305	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7300	\N	5	b) Cabeza del bebé y cuerpo en línea recta	\N	\N	\N	\N	\N	300
7306	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7305	\N	5	Sí	\N	\N	\N	\N	\N	100
7307	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7305	\N	5	No	\N	\N	\N	\N	\N	200
7308	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7300	\N	5	c) El bebé debe ser sostenido por su cabeza y hombros (también el cuerpo si es recién nacido)	\N	\N	\N	\N	\N	400
7309	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7308	\N	5	Sí	\N	\N	\N	\N	\N	100
7310	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7308	\N	5	No	\N	\N	\N	\N	\N	200
7311	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7300	\N	5	d) La madre coloca la mano en forma de C en el seno	\N	\N	\N	\N	\N	500
7312	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7311	\N	5	Sí	\N	\N	\N	\N	\N	100
7313	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7311	\N	5	No	\N	\N	\N	\N	\N	200
7314	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7300	\N	5	e) La boca del bebe debe estar bien abierta	\N	\N	\N	\N	\N	600
7315	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7314	\N	5	Sí	\N	\N	\N	\N	\N	100
7316	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7314	\N	5	No	\N	\N	\N	\N	\N	200
7317	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7300	\N	5	f) El labio inferior del bebé está hacia afuera	\N	\N	\N	\N	\N	700
7318	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7317	\N	5	Sí	\N	\N	\N	\N	\N	100
7319	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7317	\N	5	No	\N	\N	\N	\N	\N	200
7320	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7300	\N	5	g) El mentón del bebé toca el pecho	\N	\N	\N	\N	\N	800
7321	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7320	\N	5	Sí	\N	\N	\N	\N	\N	100
7322	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7320	\N	5	No	\N	\N	\N	\N	\N	200
7323	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7300	\N	5	h) Debería ser visible más de la areola en la parte superior que debajo de la boca del bebé	\N	\N	\N	\N	\N	900
7324	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7323	\N	5	Sí	\N	\N	\N	\N	\N	100
7325	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7323	\N	5	No	\N	\N	\N	\N	\N	200
7326	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7300	\N	5	i) Las mejillas deberían estar llenas	\N	\N	\N	\N	\N	1000
7327	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7326	\N	5	Sí	\N	\N	\N	\N	\N	100
7328	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7326	\N	5	No	\N	\N	\N	\N	\N	200
7329	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7300	\N	5	j) Succión lenta y sonidos de deglución	\N	\N	\N	\N	\N	1100
7330	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7329	\N	5	Sí	\N	\N	\N	\N	\N	100
7331	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7329	\N	5	No	\N	\N	\N	\N	\N	200
7332	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7300	\N	5	(Debe mencionar al menos 6 de los 10 pasos. Si no menciona, marcar “No”)	\N	\N	\N	\N	\N	1200
7333	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7298	\N	5	No/ No sabe, no contesta	\N	\N	\N	\N	\N	200
7334	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7297	\N	5	verificador	\N	\N	\N	\N	\N	200
7335	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7334	\N	5	L.3.a EP	\N	\N	\N	\N	\N	100
7336	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7036	\N	5	12. ¿Enseña a las madres cómo extraerse la leche?	\N	\N	\N	\N	\N	1000
7337	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7336	\N	5	respuesta	\N	\N	\N	\N	\N	100
7338	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7337	\N	5	Sí	\N	\N	\N	\N	\N	100
7339	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7338	\N	5	¿Puede explicar cómo enseñaría la extracción manual de leche?	\N	\N	\N	\N	\N	100
7340	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7339	\N	5	(Marcar si menciona los puntos clave. Puede marcar más de uno)	\N	\N	\N	\N	\N	100
7341	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7339	\N	5	a) Estimula el flujo de la leche (por relajación, masaje, calentamiento, etc)	\N	\N	\N	\N	\N	200
7342	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7341	\N	5	Sí	\N	\N	\N	\N	\N	100
7343	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7341	\N	5	No	\N	\N	\N	\N	\N	200
7344	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7339	\N	5	b) Colocando los dedos en forma de C	\N	\N	\N	\N	\N	300
7345	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7344	\N	5	Sí	\N	\N	\N	\N	\N	100
7346	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7344	\N	5	No	\N	\N	\N	\N	\N	200
7347	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7339	\N	5	c) Presión hacia costillas	\N	\N	\N	\N	\N	400
7348	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7347	\N	5	Sí	\N	\N	\N	\N	\N	100
7349	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7347	\N	5	No	\N	\N	\N	\N	\N	200
7350	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7339	\N	5	d) Ninguno	\N	\N	\N	\N	\N	500
7351	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7350	\N	5	Sí	\N	\N	\N	\N	\N	100
7352	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7350	\N	5	No	\N	\N	\N	\N	\N	200
7353	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7339	\N	5	(Si no menciona todos los pasos o marca ninguno, se marcar “No”. Si menciona todos los pasos son 2 puntos)	\N	\N	\N	\N	\N	600
7354	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7337	\N	5	No	\N	\N	\N	\N	\N	200
7355	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7336	\N	5	verificador	\N	\N	\N	\N	\N	200
7356	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7355	\N	5	L.3.b EP	\N	\N	\N	\N	\N	100
7357	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7036	\N	5	13. ¿Informa a las madres sobre la posibilidad de donar leche?	\N	\N	\N	\N	\N	1100
7358	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7357	\N	5	respuesta	\N	\N	\N	\N	\N	100
7359	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7358	\N	5	Sí	\N	\N	\N	\N	\N	100
7360	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7359	\N	5	¿Puede mencionar dónde podría donar leche?	\N	\N	\N	\N	\N	100
7361	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7359	\N	5	(Debe mencionar algún banco de leche cercano. Se pondera con 0,5)	\N	\N	\N	\N	\N	200
7362	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7358	\N	5	No	\N	\N	\N	\N	\N	200
7363	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7357	\N	5	verificador	\N	\N	\N	\N	\N	200
7364	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7363	\N	5	L.3.b EP	\N	\N	\N	\N	\N	100
7365	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7036	\N	5	14. ¿Informa a las madres cómo incrementar la producción de leche?	\N	\N	\N	\N	\N	1200
7366	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7365	\N	5	respuesta	\N	\N	\N	\N	\N	100
7367	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7366	\N	5	Sí	\N	\N	\N	\N	\N	100
7368	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7367	\N	5	¿Puede mencionar una forma para mejorar la producción?	\N	\N	\N	\N	\N	100
7369	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7368	\N	5	(Marcar si menciona los puntos clave. Puede marcar más de uno)	\N	\N	\N	\N	\N	100
7370	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7368	\N	5	a) Mayor succión o estímulo (extracción)	\N	\N	\N	\N	\N	200
7371	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7370	\N	5	Sí	\N	\N	\N	\N	\N	100
7372	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7370	\N	5	No	\N	\N	\N	\N	\N	200
7373	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7368	\N	5	b) No usar biberones	\N	\N	\N	\N	\N	300
7374	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7373	\N	5	Sí	\N	\N	\N	\N	\N	100
7375	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7373	\N	5	No	\N	\N	\N	\N	\N	200
7376	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7368	\N	5	c) Lactancia a libre demanda	\N	\N	\N	\N	\N	400
7377	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7376	\N	5	Sí	\N	\N	\N	\N	\N	100
7378	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7376	\N	5	No	\N	\N	\N	\N	\N	200
7379	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7368	\N	5	d) Posición correcta del bebé	\N	\N	\N	\N	\N	500
7380	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7379	\N	5	Sí	\N	\N	\N	\N	\N	100
7381	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7379	\N	5	No	\N	\N	\N	\N	\N	200
7382	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7368	\N	5	e) Ninguno	\N	\N	\N	\N	\N	600
7383	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7382	\N	5	Sí	\N	\N	\N	\N	\N	100
7384	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7382	\N	5	No	\N	\N	\N	\N	\N	200
7385	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7368	\N	5	(Debe mencionar al menos una. Se pondera con 0,5)	\N	\N	\N	\N	\N	700
7386	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7366	\N	5	No	\N	\N	\N	\N	\N	200
7387	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7365	\N	5	verificador	\N	\N	\N	\N	\N	200
7388	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7387	\N	5	L.3.b EP	\N	\N	\N	\N	\N	100
7389	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7036	\N	5	15. Observaciones 	\N	\N	\N	\N	\N	1300
7390	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6	c. Datos del empleado en el ES	\N	\N	\N	\N	\N	100
7391	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7390	\N	6	1. Área de trabajo en el establecimiento: 	\N	\N	\N	\N	\N	100
7392	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7390	\N	6	2. Ocupación: 	\N	\N	\N	\N	\N	200
7393	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6	d. Evaluación al personal	\N	\N	\N	\N	\N	200
7394	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7393	\N	6	3. ¿Conoce usted la Norma de Establecimientos de Salud Amigos de la Madre y del Niño?	\N	\N	\N	\N	\N	100
7395	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7394	\N	6	respuesta	\N	\N	\N	\N	\N	100
7396	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7395	\N	6	Sí	\N	\N	\N	\N	\N	100
7397	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7395	\N	6	No/ No sabe, no contesta	\N	\N	\N	\N	\N	200
7398	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7394	\N	6	verificador	\N	\N	\N	\N	\N	200
7399	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7398	\N	6	G.1.a EP	\N	\N	\N	\N	\N	100
7400	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7393	\N	6	4. ¿Conoce métodos no farmacológicos para aliviar el dolor durante el trabajo de parto y parto?	\N	\N	\N	\N	\N	200
7401	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7400	\N	6	respuesta	\N	\N	\N	\N	\N	100
7402	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7401	\N	6	Sí	\N	\N	\N	\N	\N	100
7403	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7402	\N	6	mencione dos:	\N	\N	\N	\N	\N	100
7404	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7403	\N	6	(Esperar a que el entrevistado responda y marque según corresponda. Se puede seleccionar más de 1)	\N	\N	\N	\N	\N	100
7405	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7403	\N	6	a) Masaje	\N	\N	\N	\N	\N	200
7406	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7405	\N	6	Sí	\N	\N	\N	\N	\N	100
7407	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7405	\N	6	No	\N	\N	\N	\N	\N	200
7408	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7403	\N	6	b) Calor local	\N	\N	\N	\N	\N	300
7409	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7408	\N	6	Sí	\N	\N	\N	\N	\N	100
7410	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7408	\N	6	No	\N	\N	\N	\N	\N	200
7411	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7403	\N	6	c) Deambulación	\N	\N	\N	\N	\N	400
7412	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7411	\N	6	Sí	\N	\N	\N	\N	\N	100
7413	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7411	\N	6	No	\N	\N	\N	\N	\N	200
7414	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7403	\N	6	d) Baños de agua	\N	\N	\N	\N	\N	500
7415	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7414	\N	6	Sí	\N	\N	\N	\N	\N	100
7416	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7414	\N	6	No	\N	\N	\N	\N	\N	200
7417	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7403	\N	6	e) Relajación	\N	\N	\N	\N	\N	600
7418	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7417	\N	6	Sí	\N	\N	\N	\N	\N	100
7419	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7417	\N	6	No	\N	\N	\N	\N	\N	200
7420	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7403	\N	6	f) Musicoterapia	\N	\N	\N	\N	\N	700
7421	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7420	\N	6	Sí	\N	\N	\N	\N	\N	100
7422	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7420	\N	6	No	\N	\N	\N	\N	\N	200
7423	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7403	\N	6	g) Aromaterapia	\N	\N	\N	\N	\N	800
7424	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7423	\N	6	Sí	\N	\N	\N	\N	\N	100
7425	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7423	\N	6	No	\N	\N	\N	\N	\N	200
7426	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7403	\N	6	h) Visualización	\N	\N	\N	\N	\N	900
7427	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7426	\N	6	Sí	\N	\N	\N	\N	\N	100
7428	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7426	\N	6	No	\N	\N	\N	\N	\N	200
7429	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7403	\N	6	i) Otros	\N	\N	\N	\N	\N	1000
7430	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7429	\N	6	Sí	\N	\N	\N	\N	\N	100
7431	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7429	\N	6	No	\N	\N	\N	\N	\N	200
7432	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7403	\N	6	j) Ninguno	\N	\N	\N	\N	\N	1100
7433	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7432	\N	6	Sí	\N	\N	\N	\N	\N	100
7434	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7432	\N	6	No	\N	\N	\N	\N	\N	200
7435	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7403	\N	6	(Si menciona al menos 2 métodos, marca “sí” en evaluación)	\N	\N	\N	\N	\N	1200
7436	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7401	\N	6	No/ No sabe, no contesta	\N	\N	\N	\N	\N	200
7437	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7400	\N	6	verificador	\N	\N	\N	\N	\N	200
7438	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7437	\N	6	P.4.b EP	\N	\N	\N	\N	\N	100
7439	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7393	\N	6	5. Mencione 2 signos de peligro para la madre después del parto	\N	\N	\N	\N	\N	300
7440	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7439	\N	6	respuesta	\N	\N	\N	\N	\N	100
7441	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7440	\N	6	Sí	\N	\N	\N	\N	\N	100
7442	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7441	\N	6	(Esperar respuesta del encuestado/a. Marque según corresponda. Puede seleccionar más de dos)	\N	\N	\N	\N	\N	100
7443	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7441	\N	6	a) Sangrado o secreción	\N	\N	\N	\N	\N	200
7444	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7443	\N	6	Sí	\N	\N	\N	\N	\N	100
7445	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7443	\N	6	No	\N	\N	\N	\N	\N	200
7446	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7441	\N	6	b) Fiebre	\N	\N	\N	\N	\N	300
7447	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7446	\N	6	Sí	\N	\N	\N	\N	\N	100
7448	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7446	\N	6	No	\N	\N	\N	\N	\N	200
7449	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7441	\N	6	c) Dolor de barriga	\N	\N	\N	\N	\N	400
7450	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7449	\N	6	Sí	\N	\N	\N	\N	\N	100
7451	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7449	\N	6	No	\N	\N	\N	\N	\N	200
7452	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7441	\N	6	d) Visión borrosa	\N	\N	\N	\N	\N	500
7453	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7452	\N	6	Sí	\N	\N	\N	\N	\N	100
7454	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7452	\N	6	No	\N	\N	\N	\N	\N	200
7455	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7441	\N	6	e) Ninguno	\N	\N	\N	\N	\N	600
7456	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7455	\N	6	Sí	\N	\N	\N	\N	\N	100
7457	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7455	\N	6	No	\N	\N	\N	\N	\N	200
7458	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7441	\N	6	(Si no menciona 2 signos se marca “No”)	\N	\N	\N	\N	\N	700
7459	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7440	\N	6	No/ No sabe, no contesta	\N	\N	\N	\N	\N	200
7460	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7439	\N	6	verificador	\N	\N	\N	\N	\N	200
7461	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7460	\N	6	P.10.b.2 EP	\N	\N	\N	\N	\N	100
7462	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7393	\N	6	6. Mencione 2 signos de peligro para el bebé	\N	\N	\N	\N	\N	400
7463	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7462	\N	6	respuesta	\N	\N	\N	\N	\N	100
7464	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7463	\N	6	Sí	\N	\N	\N	\N	\N	100
7465	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7464	\N	6	(Esperar respuesta del encuestado/a. Marque según corresponda. Puede seleccionar más de dos)	\N	\N	\N	\N	\N	100
7466	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7464	\N	6	1. Cambio de coloración	\N	\N	\N	\N	\N	200
7467	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7466	\N	6	Sí	\N	\N	\N	\N	\N	100
7468	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7466	\N	6	No	\N	\N	\N	\N	\N	200
7469	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7464	\N	6	2. Dificultad para alimentarse	\N	\N	\N	\N	\N	300
7470	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7469	\N	6	Sí	\N	\N	\N	\N	\N	100
7471	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7469	\N	6	No	\N	\N	\N	\N	\N	200
7472	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7464	\N	6	3. Fiebre	\N	\N	\N	\N	\N	400
7473	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7472	\N	6	Sí	\N	\N	\N	\N	\N	100
7474	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7472	\N	6	No	\N	\N	\N	\N	\N	200
7475	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7464	\N	6	4. Dificultad para respirar	\N	\N	\N	\N	\N	500
7476	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7475	\N	6	Sí	\N	\N	\N	\N	\N	100
7477	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7475	\N	6	No	\N	\N	\N	\N	\N	200
7478	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7464	\N	6	5. Tieso o ataque	\N	\N	\N	\N	\N	600
7479	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7478	\N	6	Sí	\N	\N	\N	\N	\N	100
7480	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7478	\N	6	No	\N	\N	\N	\N	\N	200
7481	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7464	\N	6	6. Debilidad	\N	\N	\N	\N	\N	700
7482	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7481	\N	6	Sí	\N	\N	\N	\N	\N	100
7483	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7481	\N	6	No	\N	\N	\N	\N	\N	200
7484	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7464	\N	6	7. Ninguno	\N	\N	\N	\N	\N	800
7485	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7484	\N	6	Sí	\N	\N	\N	\N	\N	100
7486	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7484	\N	6	No	\N	\N	\N	\N	\N	200
7487	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7464	\N	6	(Si no menciona 2 signos se marca “No”)	\N	\N	\N	\N	\N	900
7488	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7463	\N	6	No/ No sabe, no contesta	\N	\N	\N	\N	\N	200
7489	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7462	\N	6	verificador	\N	\N	\N	\N	\N	200
7490	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	7489	\N	6	P.10.b.2 EP	\N	\N	\N	\N	\N	100
\.


--
-- TOC entry 3287 (class 0 OID 0)
-- Dependencies: 233
-- Name: esa_pregunta_prg_id_seq; Type: SEQUENCE SET; Schema: esamyn; Owner: esamyn_user
--

SELECT pg_catalog.setval('esa_pregunta_prg_id_seq', 7636, true);


--
-- TOC entry 3231 (class 0 OID 16887)
-- Dependencies: 234
-- Data for Name: esa_provincia; Type: TABLE DATA; Schema: esamyn; Owner: esamyn_user
--

COPY esa_provincia (pro_id, pro_nombre, pro_codigo) FROM stdin;
\.


--
-- TOC entry 3288 (class 0 OID 0)
-- Dependencies: 235
-- Name: esa_provincia_pro_id_seq; Type: SEQUENCE SET; Schema: esamyn; Owner: esamyn_user
--

SELECT pg_catalog.setval('esa_provincia_pro_id_seq', 1, false);


--
-- TOC entry 3233 (class 0 OID 16895)
-- Dependencies: 236
-- Data for Name: esa_respuesta; Type: TABLE DATA; Schema: esamyn; Owner: esamyn_user
--

COPY esa_respuesta (res_id, res_creado, res_modificado, res_creado_por, res_modificado_por, res_pregunta, res_encuesta, res_valor_numero, res_valor_texto, res_valor_fecha, res_valor_booleano) FROM stdin;
1240	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5536	9	\N	1	\N	\N
1241	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5537	9	\N	a	\N	\N
1242	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5538	9	\N	dfg	\N	\N
1243	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5539	9	\N	rew	\N	\N
1244	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5540	9	\N		\N	\N
1245	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5541	9	\N		\N	\N
1246	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5542	9	\N		\N	\N
1247	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5543	9	\N		\N	\N
1248	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5544	9	\N		\N	\N
1249	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5547	9	\N		\N	\N
1250	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5550	9	\N		\N	\N
1251	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5553	9	\N		\N	\N
1252	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5556	9	\N		\N	\N
1253	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5559	9	\N		\N	\N
1254	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5562	9	\N		\N	\N
1255	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5565	9	\N		\N	\N
1256	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5567	9	\N		\N	\N
1257	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5570	9	\N		\N	\N
1258	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5573	9	\N		\N	\N
1259	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5576	9	\N		\N	\N
1260	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5579	9	\N		\N	\N
1261	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5583	9	\N		\N	\N
1262	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5586	9	\N		\N	\N
1263	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5589	9	\N		\N	\N
1264	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5592	9	\N		\N	\N
1265	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5593	9	\N		\N	\N
1266	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5594	9	\N		\N	\N
1267	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5595	9	\N		\N	\N
1268	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5597	9	\N		\N	\N
1269	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5598	9	\N		\N	\N
1270	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5599	9	\N		\N	\N
1271	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5600	9	\N		\N	\N
1272	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5601	9	\N		\N	\N
1273	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5602	9	\N		\N	\N
1274	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5603	9	\N		\N	\N
1275	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5604	9	\N		\N	\N
1276	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5606	9	\N		\N	\N
1277	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5607	9	\N		\N	\N
1278	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5608	9	\N		\N	\N
1279	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5610	9	\N		\N	\N
1280	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5611	9	\N		\N	\N
1281	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5612	9	\N		\N	\N
1282	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5614	9	\N		\N	\N
1283	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5616	9	\N		\N	\N
1284	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5617	9	\N		\N	\N
1285	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5618	9	\N		\N	\N
1286	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5620	9	\N		\N	\N
1287	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5622	9	\N		\N	\N
1288	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5624	9	\N		\N	\N
1289	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5626	9	\N		\N	\N
1290	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5628	9	\N		\N	\N
1291	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5630	9	\N		\N	\N
1292	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5632	9	\N		\N	\N
1293	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5634	9	\N		\N	\N
1294	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5641	9	\N		\N	\N
1295	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5644	9	\N		\N	\N
1296	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5647	9	\N		\N	\N
1297	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5650	9	\N		\N	\N
1298	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5654	9	\N		\N	\N
1299	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5657	9	\N		\N	\N
1300	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5660	9	\N		\N	\N
1301	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5663	9	\N		\N	\N
1302	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5667	9	\N		\N	\N
1303	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5670	9	\N		\N	\N
1304	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5673	9	\N		\N	\N
1305	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5676	9	\N		\N	\N
1306	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5680	9	\N		\N	\N
1307	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5683	9	\N		\N	\N
1308	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5686	9	\N		\N	\N
1309	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5689	9	\N		\N	\N
1310	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5693	9	\N		\N	\N
1311	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5696	9	\N		\N	\N
1312	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5699	9	\N		\N	\N
1313	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5702	9	\N		\N	\N
1314	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5706	9	\N		\N	\N
1315	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5709	9	\N		\N	\N
1316	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5712	9	\N		\N	\N
1317	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5715	9	\N		\N	\N
1318	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5719	9	\N		\N	\N
1319	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5722	9	\N		\N	\N
1320	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5725	9	\N		\N	\N
1321	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5728	9	\N		\N	\N
1322	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5732	9	\N		\N	\N
1323	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5735	9	\N		\N	\N
1324	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5738	9	\N		\N	\N
1325	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5741	9	\N		\N	\N
1326	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5745	9	\N		\N	\N
1327	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5748	9	\N		\N	\N
1328	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5751	9	\N		\N	\N
1329	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5754	9	\N		\N	\N
1330	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5757	9	\N		\N	\N
1331	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5759	9	\N		\N	\N
1332	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5762	9	\N		\N	\N
1333	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5765	9	\N		\N	\N
1334	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5768	9	\N		\N	\N
1335	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5771	9	\N		\N	\N
1336	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5773	9	\N		\N	\N
1337	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5776	9	\N		\N	\N
1338	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5779	9	\N		\N	\N
1339	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5782	9	\N		\N	\N
1340	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5785	9	\N		\N	\N
1341	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5787	9	\N		\N	\N
1342	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5789	9	\N		\N	\N
1343	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5792	9	\N		\N	\N
1344	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5793	9	\N		\N	\N
1345	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5796	9	\N		\N	\N
1346	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5798	9	\N		\N	\N
1347	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5799	9	\N		\N	\N
1348	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5800	9	\N		\N	\N
1349	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5802	9	\N		\N	\N
1350	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5804	9	\N		\N	\N
1351	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5805	9	\N		\N	\N
1352	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5806	9	\N		\N	\N
1353	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5809	9	\N		\N	\N
1354	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5812	9	\N		\N	\N
1355	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5536	10	\N	345	\N	\N
1356	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5537	10	\N	2345	\N	\N
1357	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5538	10	\N	456	\N	\N
1358	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5539	10	\N	667	\N	\N
1359	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5540	10	\N	6	\N	\N
1360	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5541	10	\N	6	\N	\N
1361	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5542	10	\N	6	\N	\N
1362	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5543	10	\N	6	\N	\N
1363	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5544	10	\N		\N	\N
1364	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5547	10	\N		\N	\N
1365	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5550	10	\N		\N	\N
1366	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5553	10	\N		\N	\N
1367	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5556	10	\N		\N	\N
1368	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5559	10	\N		\N	\N
1369	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5562	10	\N		\N	\N
1370	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5565	10	\N		\N	\N
1371	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5567	10	\N		\N	\N
1372	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5570	10	\N		\N	\N
1373	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5573	10	\N		\N	\N
1374	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5576	10	\N		\N	\N
1375	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5579	10	\N		\N	\N
1376	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5583	10	\N		\N	\N
1377	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5586	10	\N		\N	\N
1378	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5589	10	\N		\N	\N
1379	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5592	10	\N		\N	\N
1380	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5593	10	\N		\N	\N
1381	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5594	10	\N		\N	\N
1382	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5595	10	\N		\N	\N
1383	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5597	10	\N		\N	\N
1384	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5598	10	\N		\N	\N
1385	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5599	10	\N		\N	\N
1386	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5600	10	\N		\N	\N
1387	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5601	10	\N		\N	\N
1388	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5602	10	\N		\N	\N
1389	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5603	10	\N		\N	\N
1390	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5604	10	\N		\N	\N
1391	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5606	10	\N		\N	\N
1392	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5607	10	\N		\N	\N
1393	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5608	10	\N		\N	\N
1394	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5610	10	\N		\N	\N
1395	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5611	10	\N		\N	\N
1396	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5612	10	\N		\N	\N
1397	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5614	10	\N		\N	\N
1398	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5616	10	\N		\N	\N
1399	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5617	10	\N		\N	\N
1400	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5618	10	\N		\N	\N
1401	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5620	10	\N		\N	\N
1402	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5622	10	\N		\N	\N
1403	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5624	10	\N		\N	\N
1404	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5626	10	\N		\N	\N
1405	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5628	10	\N		\N	\N
1406	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5630	10	\N		\N	\N
1407	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5632	10	\N		\N	\N
1408	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5634	10	\N		\N	\N
1409	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5641	10	\N		\N	\N
1410	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5644	10	\N		\N	\N
1411	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5647	10	\N		\N	\N
1412	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5650	10	\N		\N	\N
1413	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5654	10	\N		\N	\N
1414	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5657	10	\N		\N	\N
1415	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5660	10	\N		\N	\N
1416	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5663	10	\N		\N	\N
1417	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5667	10	\N		\N	\N
1418	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5670	10	\N		\N	\N
1419	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5673	10	\N		\N	\N
1420	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5676	10	\N		\N	\N
1421	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5680	10	\N		\N	\N
1422	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5683	10	\N		\N	\N
1423	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5686	10	\N		\N	\N
1424	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5689	10	\N		\N	\N
1425	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5693	10	\N		\N	\N
1426	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5696	10	\N		\N	\N
1427	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5699	10	\N		\N	\N
1428	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5702	10	\N		\N	\N
1429	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5706	10	\N		\N	\N
1430	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5709	10	\N		\N	\N
1431	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5712	10	\N		\N	\N
1432	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5715	10	\N		\N	\N
1433	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5719	10	\N		\N	\N
1434	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5722	10	\N		\N	\N
1435	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5725	10	\N		\N	\N
1436	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5728	10	\N		\N	\N
1437	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5732	10	\N		\N	\N
1438	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5735	10	\N		\N	\N
1439	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5738	10	\N		\N	\N
1440	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5741	10	\N		\N	\N
1441	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5745	10	\N		\N	\N
1442	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5748	10	\N		\N	\N
1443	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5751	10	\N		\N	\N
1444	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5754	10	\N		\N	\N
1445	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5757	10	\N		\N	\N
1446	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5759	10	\N		\N	\N
1447	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5762	10	\N		\N	\N
1448	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5765	10	\N		\N	\N
1449	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5768	10	\N		\N	\N
1450	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5771	10	\N		\N	\N
1451	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5773	10	\N		\N	\N
1452	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5776	10	\N		\N	\N
1453	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5779	10	\N		\N	\N
1454	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5782	10	\N		\N	\N
1455	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5785	10	\N		\N	\N
1456	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5787	10	\N		\N	\N
1457	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5789	10	\N		\N	\N
1458	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5792	10	\N		\N	\N
1459	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5793	10	\N		\N	\N
1460	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5796	10	\N		\N	\N
1461	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5798	10	\N		\N	\N
1462	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5799	10	\N		\N	\N
1463	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5800	10	\N		\N	\N
1464	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5802	10	\N		\N	\N
1465	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5804	10	\N		\N	\N
1466	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5805	10	\N		\N	\N
1467	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5806	10	\N		\N	\N
1468	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5809	10	\N		\N	\N
1469	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5812	10	\N		\N	\N
1472	2017-07-20 14:36:22.557893+00	2017-08-21 20:16:34.197769+00	\N	\N	5816	11	\N	gd	\N	\N
1473	2017-07-20 14:36:22.557893+00	2017-08-21 20:16:34.199961+00	\N	\N	5817	11	\N	sdfg	\N	\N
1474	2017-07-20 14:36:22.557893+00	2017-08-21 20:16:34.202278+00	\N	\N	5818	11	\N	sdfg	\N	\N
1475	2017-07-20 14:36:22.557893+00	2017-08-21 20:16:34.205194+00	\N	\N	5819	11	\N		\N	\N
1476	2017-07-20 14:36:22.557893+00	2017-08-21 20:16:34.207461+00	\N	\N	5820	11	\N		\N	\N
1477	2017-07-20 14:36:22.557893+00	2017-08-21 20:16:34.209564+00	\N	\N	5821	11	\N		\N	\N
1478	2017-07-20 14:36:22.557893+00	2017-08-21 20:16:34.211753+00	\N	\N	5822	11	\N		\N	\N
1479	2017-07-20 14:36:22.557893+00	2017-08-21 20:16:34.213863+00	\N	\N	5823	11	\N		\N	\N
1481	2017-07-20 14:36:22.557893+00	2017-08-21 20:16:34.218476+00	\N	\N	5829	11	\N		\N	\N
1482	2017-07-20 14:36:22.557893+00	2017-08-21 20:16:34.220544+00	\N	\N	5830	11	\N		\N	\N
1483	2017-07-20 14:36:22.557893+00	2017-08-21 20:16:34.22257+00	\N	\N	5832	11	\N		\N	\N
1484	2017-07-20 14:36:22.557893+00	2017-08-21 20:16:34.22467+00	\N	\N	5834	11	\N		\N	\N
1485	2017-07-20 14:36:22.557893+00	2017-08-21 20:16:34.227041+00	\N	\N	5837	11	\N		\N	\N
1486	2017-07-20 14:36:22.557893+00	2017-08-21 20:16:34.22909+00	\N	\N	5841	11	\N		\N	\N
1487	2017-07-20 14:36:22.557893+00	2017-08-21 20:16:34.231192+00	\N	\N	5842	11	\N		\N	\N
1488	2017-07-20 14:36:22.557893+00	2017-08-21 20:16:34.233383+00	\N	\N	5845	11	\N		\N	\N
1489	2017-07-20 14:36:22.557893+00	2017-08-21 20:16:34.235566+00	\N	\N	5849	11	\N		\N	\N
1490	2017-07-20 14:36:22.557893+00	2017-08-21 20:16:34.237772+00	\N	\N	5851	11	\N		\N	\N
1491	2017-07-20 14:36:22.557893+00	2017-08-21 20:16:34.239982+00	\N	\N	5854	11	\N		\N	\N
1492	2017-07-20 14:36:22.557893+00	2017-08-21 20:16:34.242013+00	\N	\N	5858	11	\N		\N	\N
1493	2017-07-20 14:36:22.557893+00	2017-08-21 20:16:34.24445+00	\N	\N	5860	11	\N		\N	\N
1494	2017-07-20 14:36:22.557893+00	2017-08-21 20:16:34.246652+00	\N	\N	5863	11	\N		\N	\N
1495	2017-07-20 14:36:22.557893+00	2017-08-21 20:16:34.248892+00	\N	\N	5864	11	\N		\N	\N
1496	2017-07-20 14:36:22.557893+00	2017-08-21 20:16:34.250979+00	\N	\N	5866	11	\N		\N	\N
1497	2017-07-20 14:36:22.557893+00	2017-08-21 20:16:34.253046+00	\N	\N	5868	11	\N		\N	\N
1498	2017-07-20 14:36:22.557893+00	2017-08-21 20:16:34.255165+00	\N	\N	5871	11	\N		\N	\N
1500	2017-07-20 14:36:22.557893+00	2017-08-21 20:16:34.259629+00	\N	\N	5878	11	\N		\N	\N
1501	2017-07-20 14:36:22.557893+00	2017-08-21 20:16:34.262066+00	\N	\N	5881	11	\N		\N	\N
1502	2017-07-20 14:36:22.557893+00	2017-08-21 20:16:34.264931+00	\N	\N	5882	11	\N		\N	\N
1503	2017-07-20 14:36:22.557893+00	2017-08-21 20:16:34.267407+00	\N	\N	5885	11	\N		\N	\N
1504	2017-07-20 14:36:22.557893+00	2017-08-21 20:16:34.269843+00	\N	\N	5887	11	\N		\N	\N
1505	2017-07-20 14:36:22.557893+00	2017-08-21 20:16:34.272204+00	\N	\N	5888	11	\N		\N	\N
1506	2017-07-20 14:36:22.557893+00	2017-08-21 20:16:34.274498+00	\N	\N	5889	11	\N		\N	\N
1507	2017-07-20 14:36:22.557893+00	2017-08-21 20:16:34.276661+00	\N	\N	5890	11	\N		\N	\N
1508	2017-07-20 14:36:22.557893+00	2017-08-21 20:16:34.279266+00	\N	\N	5891	11	\N		\N	\N
1509	2017-07-20 14:36:22.557893+00	2017-08-21 20:16:34.281864+00	\N	\N	5894	11	\N		\N	\N
1510	2017-07-20 14:36:22.557893+00	2017-08-21 20:16:34.284479+00	\N	\N	5896	11	\N		\N	\N
1511	2017-07-20 14:36:22.557893+00	2017-08-21 20:16:34.28675+00	\N	\N	5897	11	\N		\N	\N
1512	2017-07-20 14:36:22.557893+00	2017-08-21 20:16:34.289136+00	\N	\N	5898	11	\N		\N	\N
1513	2017-07-20 14:36:22.557893+00	2017-08-21 20:16:34.29203+00	\N	\N	5899	11	\N		\N	\N
1514	2017-07-20 14:36:22.557893+00	2017-08-21 20:16:34.29451+00	\N	\N	5900	11	\N		\N	\N
1515	2017-07-20 14:36:22.557893+00	2017-08-21 20:16:34.296941+00	\N	\N	5901	11	\N		\N	\N
1516	2017-07-20 14:36:22.557893+00	2017-08-21 20:16:34.299175+00	\N	\N	5904	11	\N		\N	\N
1517	2017-07-20 14:36:22.557893+00	2017-08-21 20:16:34.301635+00	\N	\N	5906	11	\N		\N	\N
1519	2017-07-20 14:36:22.557893+00	2017-08-21 20:16:34.306775+00	\N	\N	5908	11	\N		\N	\N
1520	2017-07-20 14:36:22.557893+00	2017-08-21 20:16:34.309678+00	\N	\N	5909	11	\N		\N	\N
1521	2017-07-20 14:36:22.557893+00	2017-08-21 20:16:34.312237+00	\N	\N	5910	11	\N		\N	\N
1522	2017-07-20 14:36:22.557893+00	2017-08-21 20:16:34.315366+00	\N	\N	5913	11	\N		\N	\N
1523	2017-07-20 14:36:22.557893+00	2017-08-21 20:16:34.317791+00	\N	\N	5914	11	\N		\N	\N
1524	2017-07-20 14:36:22.557893+00	2017-08-21 20:16:34.320134+00	\N	\N	5916	11	\N	456	\N	\N
1525	2017-07-20 14:36:22.557893+00	2017-08-21 20:16:34.322967+00	\N	\N	5917	11	\N	3456	\N	\N
1526	2017-07-20 14:36:22.557893+00	2017-08-21 20:16:34.325474+00	\N	\N	5919	11	\N	sdfg	\N	\N
1527	2017-07-20 14:36:22.557893+00	2017-08-21 20:16:34.329193+00	\N	\N	5922	11	\N	dfgd	\N	\N
1528	2017-07-20 14:36:22.557893+00	2017-08-21 20:16:34.331923+00	\N	\N	5923	11	\N		\N	\N
1529	2017-07-20 14:36:22.557893+00	2017-08-21 20:16:34.334461+00	\N	\N	5925	11	\N	456	\N	\N
1530	2017-07-20 14:36:22.557893+00	2017-08-21 20:16:34.336781+00	\N	\N	5927	11	\N	3456	\N	\N
1531	2017-07-20 14:36:22.557893+00	2017-08-21 20:16:34.339457+00	\N	\N	5928	11	\N	456	\N	\N
1532	2017-07-20 14:36:22.557893+00	2017-08-21 20:16:34.342781+00	\N	\N	5932	11	\N	456	\N	\N
1533	2017-07-20 14:36:22.557893+00	2017-08-21 20:16:34.345493+00	\N	\N	5933	11	\N		\N	\N
1534	2017-07-20 14:36:22.557893+00	2017-08-21 20:16:34.347866+00	\N	\N	5935	11	\N	3456	\N	\N
1535	2017-07-20 14:36:22.557893+00	2017-08-21 20:16:34.350042+00	\N	\N	5936	11	\N		\N	\N
1536	2017-07-20 14:36:22.557893+00	2017-08-21 20:16:34.352339+00	\N	\N	5939	11	\N	3456	\N	\N
1538	2017-07-20 14:36:22.557893+00	2017-08-21 20:16:34.357645+00	\N	\N	5944	11	\N		\N	\N
1539	2017-07-20 14:36:22.557893+00	2017-08-21 20:16:34.36081+00	\N	\N	5945	11	\N		\N	\N
1540	2017-07-20 14:36:22.557893+00	2017-08-21 20:16:34.363659+00	\N	\N	5948	11	\N		\N	\N
1541	2017-07-20 14:36:22.557893+00	2017-08-21 20:16:34.366072+00	\N	\N	5949	11	\N		\N	\N
1542	2017-07-20 14:36:22.557893+00	2017-08-21 20:16:34.368327+00	\N	\N	5950	11	\N		\N	\N
1543	2017-07-20 14:36:22.557893+00	2017-08-21 20:16:34.370918+00	\N	\N	5951	11	\N		\N	\N
1544	2017-07-20 14:36:22.557893+00	2017-08-21 20:16:34.373199+00	\N	\N	5952	11	\N		\N	\N
1545	2017-07-20 14:36:22.557893+00	2017-08-21 20:16:34.375483+00	\N	\N	5953	11	\N		\N	\N
1546	2017-07-20 14:36:22.557893+00	2017-08-21 20:16:34.377738+00	\N	\N	5954	11	\N		\N	\N
1547	2017-07-20 14:36:22.557893+00	2017-08-21 20:16:34.380363+00	\N	\N	5955	11	\N		\N	\N
1548	2017-07-20 14:36:22.557893+00	2017-08-21 20:16:34.382898+00	\N	\N	5956	11	\N		\N	\N
1549	2017-07-20 14:36:22.557893+00	2017-08-21 20:16:34.385108+00	\N	\N	5957	11	\N		\N	\N
1550	2017-07-20 14:36:22.557893+00	2017-08-21 20:16:34.387345+00	\N	\N	5959	11	\N		\N	\N
1551	2017-07-20 14:36:22.557893+00	2017-08-21 20:16:34.389978+00	\N	\N	5962	11	\N		\N	\N
1552	2017-07-20 14:36:22.557893+00	2017-08-21 20:16:34.392517+00	\N	\N	5963	11	\N		\N	\N
1553	2017-07-20 14:36:22.557893+00	2017-08-21 20:16:34.39496+00	\N	\N	5966	11	\N		\N	\N
1554	2017-07-20 14:36:22.557893+00	2017-08-21 20:16:34.39722+00	\N	\N	5969	11	\N		\N	\N
1555	2017-07-20 14:36:22.557893+00	2017-08-21 20:16:34.399323+00	\N	\N	5970	11	\N		\N	\N
1557	2017-07-20 14:36:22.557893+00	2017-08-21 20:16:34.403751+00	\N	\N	5976	11	\N		\N	\N
1558	2017-07-20 14:36:22.557893+00	2017-08-21 20:16:34.406061+00	\N	\N	5977	11	\N		\N	\N
1559	2017-07-20 14:36:22.557893+00	2017-08-21 20:16:34.409146+00	\N	\N	5980	11	\N		\N	\N
1560	2017-07-20 14:36:22.557893+00	2017-08-21 20:16:34.411732+00	\N	\N	5983	11	\N		\N	\N
1471	2017-07-20 14:36:22.557893+00	2017-08-21 20:16:34.195347+00	\N	\N	5815	11	\N	dfg	\N	\N
1575	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5814	12	\N	gdsrgd	\N	\N
1576	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5815	12	\N	dfg	\N	\N
1577	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5816	12	\N	gd	\N	\N
1578	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5817	12	\N	sdfg	\N	\N
1579	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5818	12	\N	sdfg	\N	\N
1580	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5819	12	\N		\N	\N
1581	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5820	12	\N		\N	\N
1582	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5821	12	\N		\N	\N
1583	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5822	12	\N		\N	\N
1584	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5823	12	\N		\N	\N
1585	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5825	12	\N		\N	\N
1586	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5829	12	\N		\N	\N
1587	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5830	12	\N		\N	\N
1588	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5832	12	\N		\N	\N
1589	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5834	12	\N		\N	\N
1590	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5837	12	\N		\N	\N
1591	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5841	12	\N		\N	\N
1592	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5842	12	\N		\N	\N
1593	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5845	12	\N		\N	\N
1594	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5849	12	\N		\N	\N
1595	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5851	12	\N		\N	\N
1596	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5854	12	\N		\N	\N
1597	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5858	12	\N		\N	\N
1598	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5860	12	\N		\N	\N
1599	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5863	12	\N		\N	\N
1600	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5864	12	\N		\N	\N
1601	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5866	12	\N		\N	\N
1602	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5868	12	\N		\N	\N
1603	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5871	12	\N		\N	\N
1604	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5874	12	\N		\N	\N
1605	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5878	12	\N		\N	\N
1606	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5881	12	\N		\N	\N
1607	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5882	12	\N		\N	\N
1608	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5885	12	\N		\N	\N
1609	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5887	12	\N		\N	\N
1610	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5888	12	\N		\N	\N
1611	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5889	12	\N		\N	\N
1612	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5890	12	\N		\N	\N
1613	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5891	12	\N		\N	\N
1614	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5894	12	\N		\N	\N
1615	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5896	12	\N		\N	\N
1616	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5897	12	\N		\N	\N
1617	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5898	12	\N		\N	\N
1618	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5899	12	\N		\N	\N
1619	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5900	12	\N		\N	\N
1620	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5901	12	\N		\N	\N
1621	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5904	12	\N		\N	\N
1622	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5906	12	\N		\N	\N
1623	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5907	12	\N		\N	\N
1624	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5908	12	\N		\N	\N
1625	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5909	12	\N		\N	\N
1626	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5910	12	\N		\N	\N
1627	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5913	12	\N		\N	\N
1628	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5914	12	\N		\N	\N
1629	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5916	12	\N		\N	\N
1630	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5917	12	\N		\N	\N
1631	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5919	12	\N		\N	\N
1632	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5922	12	\N		\N	\N
1633	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5923	12	\N		\N	\N
1634	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5925	12	\N		\N	\N
1635	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5927	12	\N		\N	\N
1636	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5928	12	\N		\N	\N
1637	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5932	12	\N		\N	\N
1638	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5933	12	\N		\N	\N
1639	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5935	12	\N		\N	\N
1640	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5936	12	\N		\N	\N
1641	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5939	12	\N		\N	\N
1642	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5941	12	\N		\N	\N
1643	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5944	12	\N		\N	\N
1644	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5945	12	\N		\N	\N
1645	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5948	12	\N		\N	\N
1646	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5949	12	\N		\N	\N
1647	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5950	12	\N		\N	\N
1648	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5951	12	\N		\N	\N
1649	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5952	12	\N		\N	\N
1650	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5953	12	\N		\N	\N
1651	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5954	12	\N		\N	\N
1652	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5955	12	\N		\N	\N
1653	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5956	12	\N		\N	\N
1654	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5957	12	\N		\N	\N
1655	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5959	12	\N		\N	\N
1656	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5962	12	\N		\N	\N
1657	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5963	12	\N		\N	\N
1658	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5966	12	\N		\N	\N
1659	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5969	12	\N		\N	\N
1660	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5970	12	\N		\N	\N
1661	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5973	12	\N		\N	\N
1662	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5976	12	\N		\N	\N
1663	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5977	12	\N		\N	\N
1664	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5980	12	\N		\N	\N
1665	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5983	12	\N		\N	\N
1666	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5984	12	\N		\N	\N
1667	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5987	12	\N		\N	\N
1563	2017-07-20 14:36:22.557893+00	2017-08-21 20:16:34.419277+00	\N	\N	5990	11	\N		\N	\N
1564	2017-07-20 14:36:22.557893+00	2017-08-21 20:16:34.421512+00	\N	\N	5991	11	\N		\N	\N
1565	2017-07-20 14:36:22.557893+00	2017-08-21 20:16:34.424137+00	\N	\N	5994	11	\N		\N	\N
1566	2017-07-20 14:36:22.557893+00	2017-08-21 20:16:34.426408+00	\N	\N	5997	11	\N		\N	\N
1567	2017-07-20 14:36:22.557893+00	2017-08-21 20:16:34.428549+00	\N	\N	5998	11	\N		\N	\N
1568	2017-07-20 14:36:22.557893+00	2017-08-21 20:16:34.430724+00	\N	\N	6001	11	\N		\N	\N
1569	2017-07-20 14:36:22.557893+00	2017-08-21 20:16:34.432784+00	\N	\N	6004	11	\N		\N	\N
1570	2017-07-20 14:36:22.557893+00	2017-08-21 20:16:34.43571+00	\N	\N	6005	11	\N		\N	\N
1572	2017-07-20 14:36:22.557893+00	2017-08-21 20:16:34.441069+00	\N	\N	6009	11	\N		\N	\N
1573	2017-07-20 14:36:22.557893+00	2017-08-21 20:16:34.443327+00	\N	\N	6012	11	\N	sdfg	\N	\N
1574	2017-07-20 14:36:22.557893+00	2017-08-21 20:16:34.445622+00	\N	\N	6013	11	\N	df	\N	\N
1562	2017-07-20 14:36:22.557893+00	2017-08-21 20:16:34.41699+00	\N	\N	5987	11	\N		\N	\N
1668	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5990	12	\N		\N	\N
1669	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5991	12	\N		\N	\N
1670	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5994	12	\N		\N	\N
1671	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5997	12	\N		\N	\N
1672	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	5998	12	\N		\N	\N
1673	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6001	12	\N		\N	\N
1674	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6004	12	\N		\N	\N
1675	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6005	12	\N		\N	\N
1676	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6008	12	\N		\N	\N
1677	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6009	12	\N		\N	\N
1678	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6012	12	\N	sdfg	\N	\N
1679	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6013	12	\N	df	\N	\N
1680	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6015	13	\N		\N	\N
1681	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6016	13	\N		\N	\N
1682	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6017	13	\N		\N	\N
1683	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6018	13	\N		\N	\N
1684	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6019	13	\N		\N	\N
1685	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6020	13	\N		\N	\N
1686	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6021	13	\N		\N	\N
1687	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6022	13	\N		\N	\N
1688	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6024	13	\N		\N	\N
1689	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6025	13	\N		\N	\N
1690	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6026	13	\N		\N	\N
1691	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6029	13	\N	sdgffd	\N	\N
1692	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6035	13	\N	dfgdfg	\N	\N
1693	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6036	13	\N		\N	\N
1694	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6039	13	\N		\N	\N
1695	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6042	13	\N		\N	\N
1696	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6045	13	\N		\N	\N
1697	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6048	13	\N	dfgsdg	\N	\N
1698	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6050	13	\N		\N	\N
1699	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6051	13	\N		\N	\N
1700	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6052	13	\N		\N	\N
1701	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6057	13	\N		\N	\N
1702	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6059	13	\N		\N	\N
1703	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6060	13	\N		\N	\N
1704	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6064	13	\N		\N	\N
1705	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6066	13	\N		\N	\N
1706	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6067	13	\N		\N	\N
1707	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6068	13	\N		\N	\N
1708	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6069	13	\N		\N	\N
1709	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6074	13	\N	sdfgsdfgs	\N	\N
1710	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6075	13	\N		\N	\N
1711	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6078	13	\N		\N	\N
1712	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6081	13	\N		\N	\N
1713	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6084	13	\N		\N	\N
1714	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6087	13	\N		\N	\N
1715	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6090	13	\N		\N	\N
1716	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6093	13	\N		\N	\N
1717	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6095	13	\N		\N	\N
1718	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6097	13	\N		\N	\N
1719	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6098	13	\N		\N	\N
1720	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6103	13	\N		\N	\N
1721	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6104	13	\N		\N	\N
1722	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6107	13	\N		\N	\N
1723	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6110	13	\N		\N	\N
1724	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6113	13	\N		\N	\N
1725	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6116	13	\N		\N	\N
1726	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6119	13	\N		\N	\N
1727	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6121	13	\N		\N	\N
1728	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6123	13	\N		\N	\N
1729	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6124	13	\N		\N	\N
1730	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6129	13	\N		\N	\N
1731	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6131	13	\N		\N	\N
1732	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6132	13	\N		\N	\N
1733	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6137	13	\N		\N	\N
1734	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6138	13	\N		\N	\N
1735	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6141	13	\N		\N	\N
1736	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6144	13	\N		\N	\N
1737	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6147	13	\N		\N	\N
1738	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6150	13	\N		\N	\N
1739	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6152	13	\N		\N	\N
1740	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6154	13	\N		\N	\N
1741	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6155	13	\N		\N	\N
1742	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6159	13	\N		\N	\N
1743	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6163	13	\N		\N	\N
1744	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6165	13	\N		\N	\N
1745	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6166	13	\N		\N	\N
1746	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6171	13	\N		\N	\N
1747	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6172	13	\N		\N	\N
1748	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6175	13	\N		\N	\N
1749	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6178	13	\N		\N	\N
1750	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6181	13	\N		\N	\N
1751	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6184	13	\N		\N	\N
1752	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6187	13	\N		\N	\N
1753	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6190	13	\N		\N	\N
1754	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6194	13	\N		\N	\N
1755	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6196	13	\N		\N	\N
1756	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6197	13	\N		\N	\N
1757	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6202	13	\N		\N	\N
1758	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6204	13	\N		\N	\N
1759	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6205	13	\N		\N	\N
1760	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6210	13	\N		\N	\N
1761	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6212	13	\N		\N	\N
1762	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6213	13	\N		\N	\N
1763	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6214	13	\N		\N	\N
1764	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6215	13	\N		\N	\N
1765	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6220	13	\N		\N	\N
1766	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6222	13	\N		\N	\N
1767	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6223	13	\N		\N	\N
1768	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6228	13	\N		\N	\N
1769	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6230	13	\N		\N	\N
1770	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6231	13	\N		\N	\N
1771	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6236	13	\N		\N	\N
1772	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6238	13	\N		\N	\N
1773	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6239	13	\N		\N	\N
1774	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6244	13	\N		\N	\N
1775	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6246	13	\N		\N	\N
1776	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6247	13	\N		\N	\N
1777	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6250	13	\N		\N	\N
1778	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6251	13	\N		\N	\N
1779	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6254	13	\N		\N	\N
1780	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6257	13	\N		\N	\N
1781	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6260	13	\N		\N	\N
1782	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6263	13	\N		\N	\N
1783	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6265	13	\N		\N	\N
1784	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6266	13	\N		\N	\N
1785	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6269	13	\N		\N	\N
1786	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6272	13	\N		\N	\N
1787	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6275	13	\N		\N	\N
1788	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6278	13	\N		\N	\N
1470	2017-07-20 14:36:22.557893+00	2017-08-21 20:16:34.192951+00	\N	\N	5814	11	\N	gdsrgd	\N	\N
1480	2017-07-20 14:36:22.557893+00	2017-08-21 20:16:34.21633+00	\N	\N	5825	11	\N		\N	\N
1499	2017-07-20 14:36:22.557893+00	2017-08-21 20:16:34.257439+00	\N	\N	5874	11	\N		\N	\N
1518	2017-07-20 14:36:22.557893+00	2017-08-21 20:16:34.303933+00	\N	\N	5907	11	\N		\N	\N
1537	2017-07-20 14:36:22.557893+00	2017-08-21 20:16:34.354951+00	\N	\N	5941	11	\N		\N	\N
1556	2017-07-20 14:36:22.557893+00	2017-08-21 20:16:34.4015+00	\N	\N	5973	11	\N		\N	\N
1561	2017-07-20 14:36:22.557893+00	2017-08-21 20:16:34.41443+00	\N	\N	5984	11	\N		\N	\N
1571	2017-07-20 14:36:22.557893+00	2017-08-21 20:16:34.438278+00	\N	\N	6008	11	\N		\N	\N
1789	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6280	14	\N		\N	\N
1790	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6281	14	\N		\N	\N
1791	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6282	14	\N		\N	\N
1792	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6283	14	\N		\N	\N
1793	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6284	14	\N		\N	\N
1794	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6285	14	\N		\N	\N
1795	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6286	14	\N		\N	\N
1796	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6287	14	\N		\N	\N
1797	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6289	14	\N		\N	\N
1798	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6290	14	\N		\N	\N
1799	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6293	14	\N		\N	\N
1800	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6296	14	\N		\N	\N
1801	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6297	14	\N		\N	\N
1802	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6300	14	\N		\N	\N
1803	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6303	14	\N		\N	\N
1804	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6305	14	\N	dfghfdgh	\N	\N
1805	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6307	14	\N	fgh	\N	\N
1806	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6308	14	\N	dfghdh	\N	\N
1807	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6310	14	\N		\N	\N
1808	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6313	14	\N		\N	\N
1809	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6316	14	\N		\N	\N
1810	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6319	14	\N		\N	\N
1811	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6323	14	\N		\N	\N
1812	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6327	14	\N	dfgh	\N	\N
1813	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6328	14	\N	dfghfdgh	\N	\N
1814	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6329	14	\N		\N	\N
1815	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6330	14	\N		\N	\N
1816	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6331	14	\N		\N	\N
1817	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6333	14	\N		\N	\N
1818	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6336	14	\N		\N	\N
1819	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6338	14	\N		\N	\N
1820	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6339	14	\N		\N	\N
1821	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6343	14	\N		\N	\N
1822	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6344	14	\N		\N	\N
1823	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6345	14	\N		\N	\N
1824	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6346	14	\N		\N	\N
1825	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6347	14	\N		\N	\N
1826	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6348	14	\N		\N	\N
1827	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6349	14	\N		\N	\N
1828	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6351	14	\N		\N	\N
1829	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6352	14	\N		\N	\N
1830	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6353	14	\N		\N	\N
1831	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6357	14	\N		\N	\N
1832	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6358	14	\N		\N	\N
1833	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6359	14	\N		\N	\N
1834	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6360	14	\N		\N	\N
1835	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6361	14	\N		\N	\N
1836	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6362	14	\N		\N	\N
1837	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6363	14	\N		\N	\N
1838	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6364	14	\N		\N	\N
1839	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6366	14	\N		\N	\N
1840	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6368	14	\N		\N	\N
1841	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6369	14	\N		\N	\N
1842	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6373	14	\N		\N	\N
1843	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6374	14	\N		\N	\N
1844	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6375	14	\N		\N	\N
1845	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6377	14	\N		\N	\N
1846	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6378	14	\N		\N	\N
1847	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6379	14	\N		\N	\N
1848	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6380	14	\N		\N	\N
1849	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6381	14	\N		\N	\N
1850	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6382	14	\N		\N	\N
1851	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6383	14	\N		\N	\N
1852	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6385	14	\N		\N	\N
1853	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6387	14	\N		\N	\N
1854	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6388	14	\N		\N	\N
1855	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6391	14	\N		\N	\N
1856	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6395	14	\N		\N	\N
1857	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6397	14	\N		\N	\N
1858	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6399	14	\N		\N	\N
1859	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6403	14	\N		\N	\N
1860	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6405	14	\N		\N	\N
1861	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6406	14	\N		\N	\N
1862	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6407	14	\N		\N	\N
1863	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6408	14	\N		\N	\N
1864	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6414	14	\N		\N	\N
1865	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6416	14	\N		\N	\N
1866	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6418	14	\N		\N	\N
1867	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6419	14	\N		\N	\N
1868	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6425	14	\N		\N	\N
1869	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6427	14	\N		\N	\N
1870	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6429	14	\N		\N	\N
1871	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6430	14	\N		\N	\N
1872	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6434	14	\N		\N	\N
1873	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6436	14	\N		\N	\N
1874	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6437	14	\N		\N	\N
1875	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6440	14	\N		\N	\N
1876	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6445	14	\N		\N	\N
1877	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6447	14	\N		\N	\N
1878	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6451	14	\N		\N	\N
1879	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6453	14	\N		\N	\N
1880	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6454	14	\N		\N	\N
1881	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6457	14	\N		\N	\N
1882	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6464	14	\N		\N	\N
1883	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6465	14	\N		\N	\N
1884	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6467	14	\N		\N	\N
1885	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6468	14	\N		\N	\N
1886	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6472	14	\N		\N	\N
1887	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6474	14	\N		\N	\N
1888	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6475	14	\N		\N	\N
1889	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6478	14	\N		\N	\N
1890	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6483	14	\N		\N	\N
1891	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6484	14	\N		\N	\N
1892	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6486	14	\N		\N	\N
1893	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6487	14	\N		\N	\N
1894	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6490	14	\N		\N	\N
1895	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6491	14	\N		\N	\N
1896	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6493	14	\N		\N	\N
1897	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6494	14	\N		\N	\N
1898	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6496	14	\N		\N	\N
1899	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6497	14	\N		\N	\N
1900	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6501	14	\N		\N	\N
1901	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6503	14	\N		\N	\N
1902	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6504	14	\N		\N	\N
1903	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6511	14	\N		\N	\N
1904	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6512	14	\N		\N	\N
1905	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6514	14	\N		\N	\N
1906	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6515	14	\N		\N	\N
1907	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6519	14	\N		\N	\N
1908	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6520	14	\N		\N	\N
1909	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6523	14	\N		\N	\N
1910	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6526	14	\N		\N	\N
1911	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6529	14	\N		\N	\N
1912	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6532	14	\N		\N	\N
1913	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6535	14	\N		\N	\N
1914	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6538	14	\N		\N	\N
1915	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6541	14	\N		\N	\N
1916	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6544	14	\N		\N	\N
1917	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6547	14	\N		\N	\N
1918	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6550	14	\N		\N	\N
1919	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6552	14	\N		\N	\N
1920	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6554	14	\N		\N	\N
1921	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6555	14	\N		\N	\N
1922	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6561	14	\N		\N	\N
1923	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6566	14	\N		\N	\N
1924	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6567	14	\N		\N	\N
1925	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6569	14	\N		\N	\N
1926	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6570	14	\N		\N	\N
1927	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6571	14	\N		\N	\N
1928	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6572	14	\N		\N	\N
1929	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6576	14	\N		\N	\N
1930	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6578	14	\N		\N	\N
1931	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6579	14	\N		\N	\N
1932	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6583	14	\N		\N	\N
1933	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6585	14	\N		\N	\N
1934	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6586	14	\N		\N	\N
1935	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6590	14	\N		\N	\N
1936	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6591	14	\N		\N	\N
1937	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6594	14	\N		\N	\N
1938	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6597	14	\N		\N	\N
1939	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6600	14	\N		\N	\N
1940	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6603	14	\N		\N	\N
1941	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6606	14	\N		\N	\N
1942	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6609	14	\N		\N	\N
1943	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6612	14	\N		\N	\N
1944	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6614	14	\N		\N	\N
1945	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6616	14	\N		\N	\N
1946	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6617	14	\N		\N	\N
1947	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6621	14	\N		\N	\N
1948	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6622	14	\N		\N	\N
1949	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6625	14	\N		\N	\N
1950	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6628	14	\N		\N	\N
1951	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6631	14	\N		\N	\N
1952	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6634	14	\N		\N	\N
1953	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6637	14	\N		\N	\N
1954	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6639	14	\N		\N	\N
1955	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6641	14	\N		\N	\N
1956	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6642	14	\N		\N	\N
1957	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6646	14	\N		\N	\N
1958	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6648	14	\N		\N	\N
1959	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6649	14	\N		\N	\N
1960	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6652	14	\N		\N	\N
1961	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6653	14	\N		\N	\N
1962	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6654	14	\N		\N	\N
1963	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6656	14	\N		\N	\N
1964	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6658	14	\N		\N	\N
1965	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6659	14	\N		\N	\N
1966	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6661	14	\N		\N	\N
1967	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6665	14	\N		\N	\N
1968	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6667	14	\N		\N	\N
1969	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6668	14	\N		\N	\N
1970	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6671	14	\N		\N	\N
1971	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6675	14	\N		\N	\N
1972	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6677	14	\N		\N	\N
1973	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6678	14	\N		\N	\N
1974	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6682	14	\N		\N	\N
1975	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6684	14	\N		\N	\N
1976	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6685	14	\N		\N	\N
1977	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6687	14	\N		\N	\N
1978	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6690	14	\N		\N	\N
1979	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6691	14	\N		\N	\N
1980	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6693	14	\N		\N	\N
1981	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6694	14	\N		\N	\N
1982	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6695	14	\N		\N	\N
1983	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6696	14	\N		\N	\N
1984	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6700	14	\N		\N	\N
1985	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6701	14	\N		\N	\N
1986	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6704	14	\N		\N	\N
1987	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6707	14	\N		\N	\N
1988	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6710	14	\N		\N	\N
1989	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6713	14	\N		\N	\N
1990	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6716	14	\N		\N	\N
1991	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6719	14	\N		\N	\N
1992	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6722	14	\N		\N	\N
1993	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6725	14	\N		\N	\N
1994	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6728	14	\N		\N	\N
1995	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6731	14	\N		\N	\N
1996	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6733	14	\N		\N	\N
1997	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6735	14	\N		\N	\N
1998	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6736	14	\N		\N	\N
1999	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6740	14	\N		\N	\N
2000	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6741	14	\N		\N	\N
2001	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6744	14	\N		\N	\N
2002	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6747	14	\N		\N	\N
2003	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6750	14	\N		\N	\N
2004	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6753	14	\N		\N	\N
2005	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6756	14	\N		\N	\N
2006	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6758	14	\N		\N	\N
2007	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6760	14	\N		\N	\N
2008	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6761	14	\N		\N	\N
2009	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6765	14	\N		\N	\N
2010	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6767	14	\N		\N	\N
2011	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6768	14	\N		\N	\N
2012	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6772	14	\N		\N	\N
2013	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6774	14	\N		\N	\N
2014	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6775	14	\N		\N	\N
2015	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6779	14	\N		\N	\N
2016	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6781	14	\N		\N	\N
2017	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6782	14	\N		\N	\N
2018	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6785	14	\N		\N	\N
2019	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6787	14	\N		\N	\N
2020	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6788	14	\N		\N	\N
2021	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6789	14	\N		\N	\N
2022	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6792	14	\N		\N	\N
2023	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6794	14	\N		\N	\N
2024	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6795	14	\N		\N	\N
2025	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6799	14	\N		\N	\N
2026	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6800	14	\N		\N	\N
2027	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6803	14	\N		\N	\N
2028	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6805	14	\N		\N	\N
2029	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6808	14	\N		\N	\N
2030	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6809	14	\N		\N	\N
2031	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6810	14	\N		\N	\N
2032	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6815	14	\N		\N	\N
2033	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6817	14	\N		\N	\N
2034	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6820	14	\N		\N	\N
2035	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6821	14	\N		\N	\N
2036	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6822	14	\N		\N	\N
2037	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6827	14	\N		\N	\N
2038	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6829	14	\N		\N	\N
2039	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6832	14	\N		\N	\N
2040	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6833	14	\N		\N	\N
2041	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6834	14	\N		\N	\N
2042	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6839	14	\N		\N	\N
2043	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6841	14	\N		\N	\N
2044	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6844	14	\N		\N	\N
2045	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6845	14	\N		\N	\N
2046	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6846	14	\N		\N	\N
2047	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6851	14	\N		\N	\N
2048	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6853	14	\N		\N	\N
2049	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6856	14	\N		\N	\N
2050	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6857	14	\N		\N	\N
2051	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6858	14	\N		\N	\N
2052	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6863	14	\N		\N	\N
2053	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6865	14	\N		\N	\N
2054	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6866	14	\N		\N	\N
2055	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6869	14	\N		\N	\N
2056	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6870	14	\N		\N	\N
2057	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6871	14	\N		\N	\N
2058	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6876	14	\N		\N	\N
2059	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6878	14	\N		\N	\N
2060	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6880	14	\N		\N	\N
2061	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6881	14	\N		\N	\N
2062	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6885	14	\N		\N	\N
2063	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6887	14	\N		\N	\N
2064	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6888	14	\N		\N	\N
2065	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6892	14	\N		\N	\N
2066	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6895	14	\N		\N	\N
2067	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6897	14	\N		\N	\N
2068	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6898	14	\N		\N	\N
2069	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6901	14	\N		\N	\N
2070	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6903	14	\N		\N	\N
2071	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6905	14	\N		\N	\N
2072	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6906	14	\N		\N	\N
2073	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6909	14	\N		\N	\N
2074	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6911	14	\N		\N	\N
2075	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6913	14	\N		\N	\N
2076	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6914	14	\N		\N	\N
2077	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6918	14	\N		\N	\N
2078	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6919	14	\N		\N	\N
2079	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6922	14	\N		\N	\N
2080	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6925	14	\N		\N	\N
2081	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6928	14	\N		\N	\N
2082	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6931	14	\N		\N	\N
2083	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6934	14	\N		\N	\N
2084	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6937	14	\N		\N	\N
2085	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6939	14	\N		\N	\N
2086	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6941	14	\N		\N	\N
2087	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6942	14	\N		\N	\N
2088	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6944	14	\N		\N	\N
2089	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6946	14	\N		\N	\N
2090	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6949	14	\N		\N	\N
2091	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6952	14	\N		\N	\N
2092	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6955	14	\N		\N	\N
2093	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6958	14	\N		\N	\N
2094	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6959	14	\N		\N	\N
2095	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6960	14	\N		\N	\N
2096	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6962	14	\N		\N	\N
2097	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6963	14	\N		\N	\N
2098	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6966	14	\N		\N	\N
2099	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6969	14	\N		\N	\N
2100	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6972	14	\N		\N	\N
2101	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6975	14	\N		\N	\N
2102	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6978	14	\N		\N	\N
2103	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6979	14	\N		\N	\N
2104	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6981	14	\N		\N	\N
2105	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6982	14	\N		\N	\N
2106	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6985	14	\N		\N	\N
2107	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6988	14	\N		\N	\N
2108	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6991	14	\N		\N	\N
2109	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6992	14	\N		\N	\N
2110	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6993	14	\N		\N	\N
2111	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6997	14	\N		\N	\N
2112	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	6999	14	\N		\N	\N
2113	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7000	14	\N		\N	\N
2114	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7004	14	\N		\N	\N
2115	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7006	14	\N		\N	\N
2116	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7007	14	\N		\N	\N
2117	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7011	14	\N		\N	\N
2118	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7012	14	\N		\N	\N
2119	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7013	14	\N		\N	\N
2120	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7016	14	\N		\N	\N
2121	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7018	14	\N		\N	\N
2122	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7019	14	\N		\N	\N
2123	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7020	14	\N		\N	\N
2124	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7024	14	\N		\N	\N
2125	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7026	14	\N		\N	\N
2126	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7027	14	\N		\N	\N
2128	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.09449+00	\N	\N	7029	15	\N		\N	\N
2129	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.097664+00	\N	\N	7030	15	\N		\N	\N
2130	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.100921+00	\N	\N	7031	15	\N		\N	\N
2131	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.103578+00	\N	\N	7033	15	\N		\N	\N
2132	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.106547+00	\N	\N	7034	15	\N		\N	\N
2133	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.109726+00	\N	\N	7035	15	\N		\N	\N
2134	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.112402+00	\N	\N	7037	15	\N		\N	\N
2135	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.114942+00	\N	\N	7038	15	\N		\N	\N
2136	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.117363+00	\N	\N	7042	15	\N	tyutyu	\N	\N
2138	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.12337+00	\N	\N	7044	15	\N		\N	\N
2139	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.126308+00	\N	\N	7046	15	\N	tyuty	\N	\N
2140	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.12882+00	\N	\N	7047	15	\N	fdhfdgh	\N	\N
2141	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.131315+00	\N	\N	7048	15	\N		\N	\N
2142	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.1338+00	\N	\N	7050	15	\N	tyu	\N	\N
2143	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.136083+00	\N	\N	7053	15	\N		\N	\N
2144	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.138665+00	\N	\N	7054	15	\N		\N	\N
2145	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.141174+00	\N	\N	7055	15	\N		\N	\N
2146	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.143545+00	\N	\N	7056	15	\N		\N	\N
2147	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.145912+00	\N	\N	7059	15	\N	fdghfgh	\N	\N
2148	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.148267+00	\N	\N	7060	15	\N		\N	\N
2149	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.150574+00	\N	\N	7063	15	\N		\N	\N
2150	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.152839+00	\N	\N	7066	15	\N		\N	\N
2151	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.155014+00	\N	\N	7069	15	\N		\N	\N
2152	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.157216+00	\N	\N	7072	15	\N		\N	\N
2153	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.15954+00	\N	\N	7075	15	\N		\N	\N
2154	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.166535+00	\N	\N	7078	15	\N		\N	\N
2155	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.169248+00	\N	\N	7081	15	\N		\N	\N
2157	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.174865+00	\N	\N	7087	15	\N		\N	\N
2158	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.178638+00	\N	\N	7090	15	\N		\N	\N
2159	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.182286+00	\N	\N	7092	15	\N		\N	\N
2160	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.18568+00	\N	\N	7093	15	\N		\N	\N
2161	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.188585+00	\N	\N	7094	15	\N		\N	\N
2162	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.190997+00	\N	\N	7096	15	\N		\N	\N
2163	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.193663+00	\N	\N	7098	15	\N		\N	\N
2164	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.196723+00	\N	\N	7099	15	\N		\N	\N
2165	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.199972+00	\N	\N	7100	15	\N		\N	\N
2166	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.203055+00	\N	\N	7101	15	\N		\N	\N
2167	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.206159+00	\N	\N	7104	15	\N		\N	\N
2168	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.209198+00	\N	\N	7105	15	\N		\N	\N
2169	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.211905+00	\N	\N	7106	15	\N		\N	\N
2170	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.214172+00	\N	\N	7107	15	\N		\N	\N
2171	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.216646+00	\N	\N	7108	15	\N		\N	\N
2172	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.219188+00	\N	\N	7111	15	\N		\N	\N
2173	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.221824+00	\N	\N	7112	15	\N		\N	\N
2174	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.224629+00	\N	\N	7113	15	\N		\N	\N
2176	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.230594+00	\N	\N	7115	15	\N		\N	\N
2177	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.233992+00	\N	\N	7118	15	\N		\N	\N
2178	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.237607+00	\N	\N	7119	15	\N		\N	\N
2179	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.240972+00	\N	\N	7120	15	\N		\N	\N
2180	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.248642+00	\N	\N	7121	15	\N		\N	\N
2181	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.252037+00	\N	\N	7122	15	\N		\N	\N
2182	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.255109+00	\N	\N	7125	15	\N		\N	\N
2183	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.258677+00	\N	\N	7126	15	\N		\N	\N
2184	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.261905+00	\N	\N	7127	15	\N		\N	\N
2185	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.264856+00	\N	\N	7128	15	\N		\N	\N
2186	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.268024+00	\N	\N	7129	15	\N		\N	\N
2188	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.273088+00	\N	\N	7133	15	\N		\N	\N
2189	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.275601+00	\N	\N	7134	15	\N		\N	\N
2190	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.27836+00	\N	\N	7135	15	\N		\N	\N
2191	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.280824+00	\N	\N	7136	15	\N		\N	\N
2192	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.283158+00	\N	\N	7139	15	\N		\N	\N
2193	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.28545+00	\N	\N	7140	15	\N		\N	\N
2194	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.288194+00	\N	\N	7141	15	\N		\N	\N
2195	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.290736+00	\N	\N	7142	15	\N		\N	\N
2196	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.293773+00	\N	\N	7143	15	\N		\N	\N
2198	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.299233+00	\N	\N	7147	15	\N		\N	\N
2199	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.302289+00	\N	\N	7148	15	\N		\N	\N
2200	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.30539+00	\N	\N	7149	15	\N		\N	\N
2201	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.308006+00	\N	\N	7150	15	\N		\N	\N
2202	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.310466+00	\N	\N	7153	15	\N		\N	\N
2203	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.313054+00	\N	\N	7154	15	\N		\N	\N
2204	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.315763+00	\N	\N	7155	15	\N		\N	\N
2205	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.318249+00	\N	\N	7156	15	\N		\N	\N
2206	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.32108+00	\N	\N	7157	15	\N		\N	\N
2207	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.324383+00	\N	\N	7160	15	\N		\N	\N
2208	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.32698+00	\N	\N	7161	15	\N		\N	\N
2209	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.329466+00	\N	\N	7162	15	\N		\N	\N
2210	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.332383+00	\N	\N	7163	15	\N		\N	\N
2211	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.335158+00	\N	\N	7164	15	\N		\N	\N
2212	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.337796+00	\N	\N	7167	15	\N		\N	\N
2213	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.340541+00	\N	\N	7168	15	\N		\N	\N
2214	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.343126+00	\N	\N	7169	15	\N		\N	\N
2215	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.347389+00	\N	\N	7170	15	\N		\N	\N
2217	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.353012+00	\N	\N	7174	15	\N		\N	\N
2218	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.35558+00	\N	\N	7175	15	\N		\N	\N
2219	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.358517+00	\N	\N	7176	15	\N		\N	\N
2220	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.361825+00	\N	\N	7177	15	\N		\N	\N
2221	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.366201+00	\N	\N	7178	15	\N		\N	\N
2222	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.369241+00	\N	\N	7181	15	\N		\N	\N
2223	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.372457+00	\N	\N	7182	15	\N		\N	\N
2224	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.375649+00	\N	\N	7183	15	\N		\N	\N
2225	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.379345+00	\N	\N	7184	15	\N		\N	\N
2226	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.381867+00	\N	\N	7185	15	\N		\N	\N
2227	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.384327+00	\N	\N	7188	15	\N		\N	\N
2228	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.387155+00	\N	\N	7189	15	\N		\N	\N
2229	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.389613+00	\N	\N	7190	15	\N		\N	\N
2230	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.392222+00	\N	\N	7191	15	\N		\N	\N
2231	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.39493+00	\N	\N	7192	15	\N		\N	\N
2232	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.397861+00	\N	\N	7195	15	\N		\N	\N
2233	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.400587+00	\N	\N	7196	15	\N		\N	\N
2234	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.403039+00	\N	\N	7197	15	\N		\N	\N
2236	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.407914+00	\N	\N	7199	15	\N		\N	\N
2237	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.410322+00	\N	\N	7202	15	\N		\N	\N
2238	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.41269+00	\N	\N	7203	15	\N		\N	\N
2239	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.415095+00	\N	\N	7204	15	\N		\N	\N
2240	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.417993+00	\N	\N	7205	15	\N		\N	\N
2241	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.421639+00	\N	\N	7206	15	\N		\N	\N
2242	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.424164+00	\N	\N	7209	15	\N		\N	\N
2243	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.426972+00	\N	\N	7211	15	\N		\N	\N
2244	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.430113+00	\N	\N	7212	15	\N		\N	\N
2245	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.432843+00	\N	\N	7213	15	\N		\N	\N
2246	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.43585+00	\N	\N	7214	15	\N		\N	\N
2247	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.439004+00	\N	\N	7217	15	\N	666	\N	\N
2248	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.441986+00	\N	\N	7218	15	\N	777	\N	\N
2249	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.44469+00	\N	\N	7220	15	\N	555	\N	\N
2250	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.448036+00	\N	\N	7221	15	\N		\N	\N
2251	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.450614+00	\N	\N	7223	15	\N	888	\N	\N
2252	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.452994+00	\N	\N	7224	15	\N		\N	\N
2253	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.455727+00	\N	\N	7227	15	\N		\N	\N
2255	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.460631+00	\N	\N	7233	15	\N	444	\N	\N
2256	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.463776+00	\N	\N	7235	15	\N	333	\N	\N
2257	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.466253+00	\N	\N	7236	15	\N		\N	\N
2258	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.469262+00	\N	\N	7237	15	\N		\N	\N
2259	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.471914+00	\N	\N	7239	15	\N		\N	\N
2260	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.474472+00	\N	\N	7240	15	\N		\N	\N
2261	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.47695+00	\N	\N	7241	15	\N		\N	\N
2262	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.479451+00	\N	\N	7242	15	\N		\N	\N
2263	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.481858+00	\N	\N	7244	15	\N		\N	\N
2264	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.484546+00	\N	\N	7245	15	\N		\N	\N
2265	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.487072+00	\N	\N	7246	15	\N		\N	\N
2266	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.489719+00	\N	\N	7248	15	\N		\N	\N
2267	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.492391+00	\N	\N	7249	15	\N		\N	\N
2268	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.495004+00	\N	\N	7252	15	\N		\N	\N
2269	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.497549+00	\N	\N	7255	15	\N		\N	\N
2270	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.500348+00	\N	\N	7258	15	\N		\N	\N
2271	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.502999+00	\N	\N	7261	15	\N		\N	\N
2272	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.505361+00	\N	\N	7264	15	\N		\N	\N
2274	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.510256+00	\N	\N	7267	15	\N		\N	\N
2275	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.512589+00	\N	\N	7268	15	\N		\N	\N
2276	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.515621+00	\N	\N	7269	15	\N		\N	\N
2277	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.518139+00	\N	\N	7271	15	\N		\N	\N
2278	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.52052+00	\N	\N	7272	15	\N		\N	\N
2279	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.522927+00	\N	\N	7275	15	\N		\N	\N
2280	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.525188+00	\N	\N	7278	15	\N		\N	\N
2281	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.52747+00	\N	\N	7281	15	\N		\N	\N
2282	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.529856+00	\N	\N	7284	15	\N		\N	\N
2283	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.532665+00	\N	\N	7287	15	\N		\N	\N
2284	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.535792+00	\N	\N	7290	15	\N		\N	\N
2285	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.538805+00	\N	\N	7293	15	\N		\N	\N
2286	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.62285+00	\N	\N	7294	15	\N		\N	\N
2287	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.626501+00	\N	\N	7296	15	\N		\N	\N
2288	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.630277+00	\N	\N	7297	15	\N		\N	\N
2289	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.636121+00	\N	\N	7298	15	\N		\N	\N
2290	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.639261+00	\N	\N	7301	15	\N		\N	\N
2291	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.641978+00	\N	\N	7302	15	\N		\N	\N
2293	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.648626+00	\N	\N	7308	15	\N		\N	\N
2329	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7390	16	\N		\N	\N
2330	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7391	16	\N	gggg	\N	\N
2331	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7392	16	\N	gggg	\N	\N
2332	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7394	16	\N		\N	\N
2333	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7395	16	\N		\N	\N
2334	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7397	16	\N	gggg	\N	\N
2335	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7399	16	\N	gggg	\N	\N
2336	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7400	16	\N		\N	\N
2337	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7401	16	\N		\N	\N
2338	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7404	16	\N		\N	\N
2339	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7405	16	\N		\N	\N
2340	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7408	16	\N		\N	\N
2341	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7411	16	\N		\N	\N
2342	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7414	16	\N		\N	\N
2343	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7417	16	\N		\N	\N
2344	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7420	16	\N		\N	\N
2345	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7423	16	\N		\N	\N
2346	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7426	16	\N		\N	\N
2347	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7429	16	\N		\N	\N
2348	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7432	16	\N		\N	\N
2349	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7435	16	\N		\N	\N
2350	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7436	16	\N		\N	\N
2351	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7438	16	\N		\N	\N
2352	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7439	16	\N		\N	\N
2353	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7440	16	\N		\N	\N
2354	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7442	16	\N		\N	\N
2355	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7443	16	\N		\N	\N
2356	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7446	16	\N		\N	\N
2357	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7449	16	\N		\N	\N
2358	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7452	16	\N		\N	\N
2359	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7455	16	\N		\N	\N
2360	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7458	16	\N		\N	\N
2361	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7459	16	\N		\N	\N
2362	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7461	16	\N		\N	\N
2363	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7462	16	\N		\N	\N
2364	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7463	16	\N		\N	\N
2365	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7465	16	\N		\N	\N
2366	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7466	16	\N		\N	\N
2367	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7469	16	\N		\N	\N
2368	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7472	16	\N		\N	\N
2369	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7475	16	\N		\N	\N
2370	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7478	16	\N		\N	\N
2371	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7481	16	\N		\N	\N
2372	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7484	16	\N		\N	\N
2373	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7487	16	\N		\N	\N
2374	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7488	16	\N		\N	\N
2375	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7490	16	\N		\N	\N
2376	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7492	17	\N		\N	\N
2377	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7494	17	\N		\N	\N
2378	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7495	17	\N		\N	\N
2379	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7496	17	\N		\N	\N
2380	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7498	17	\N		\N	\N
2381	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7500	17	\N		\N	\N
2382	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7501	17	\N		\N	\N
2383	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7503	17	\N		\N	\N
2384	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7504	17	\N		\N	\N
2385	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7505	17	\N		\N	\N
2386	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7507	17	\N		\N	\N
2387	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7509	17	\N	ghghg	\N	\N
2388	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7510	17	\N		\N	\N
2389	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7512	17	\N		\N	\N
2390	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7513	17	\N		\N	\N
2391	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7514	17	\N		\N	\N
2392	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7516	17	\N		\N	\N
2393	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7518	17	\N	ghghg	\N	\N
2394	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7519	17	\N		\N	\N
2395	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7521	17	\N		\N	\N
2396	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7522	17	\N		\N	\N
2397	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7523	17	\N		\N	\N
2398	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7525	17	\N		\N	\N
2399	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7527	17	\N		\N	\N
2400	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7528	17	\N		\N	\N
2295	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.65413+00	\N	\N	7314	15	\N		\N	\N
2296	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.656772+00	\N	\N	7317	15	\N		\N	\N
2297	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.659104+00	\N	\N	7320	15	\N		\N	\N
2298	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.661507+00	\N	\N	7323	15	\N		\N	\N
2299	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.663933+00	\N	\N	7326	15	\N		\N	\N
2300	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.666327+00	\N	\N	7329	15	\N		\N	\N
2301	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.669121+00	\N	\N	7332	15	\N		\N	\N
2302	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.672116+00	\N	\N	7333	15	\N		\N	\N
2303	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.674754+00	\N	\N	7335	15	\N		\N	\N
2305	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.680097+00	\N	\N	7337	15	\N		\N	\N
2306	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.682647+00	\N	\N	7340	15	\N		\N	\N
2307	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.685197+00	\N	\N	7341	15	\N		\N	\N
2308	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.68843+00	\N	\N	7344	15	\N		\N	\N
2309	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.690958+00	\N	\N	7347	15	\N		\N	\N
2310	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.693433+00	\N	\N	7350	15	\N		\N	\N
2311	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.695959+00	\N	\N	7353	15	\N		\N	\N
2312	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.698342+00	\N	\N	7356	15	\N		\N	\N
2313	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.700892+00	\N	\N	7357	15	\N		\N	\N
2314	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.703411+00	\N	\N	7358	15	\N		\N	\N
2315	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.706087+00	\N	\N	7360	15	\N		\N	\N
2316	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.708956+00	\N	\N	7361	15	\N		\N	\N
2317	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.711592+00	\N	\N	7364	15	\N		\N	\N
2318	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.714026+00	\N	\N	7365	15	\N		\N	\N
2319	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.71651+00	\N	\N	7366	15	\N		\N	\N
2320	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.71932+00	\N	\N	7369	15	\N		\N	\N
2321	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.721597+00	\N	\N	7370	15	\N		\N	\N
2322	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.724114+00	\N	\N	7373	15	\N		\N	\N
2324	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.729537+00	\N	\N	7379	15	\N		\N	\N
2325	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.732629+00	\N	\N	7382	15	\N		\N	\N
2326	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.735006+00	\N	\N	7385	15	\N		\N	\N
2327	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.737213+00	\N	\N	7388	15	\N		\N	\N
2328	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.739456+00	\N	\N	7389	15	\N		\N	\N
2401	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7530	17	\N		\N	\N
2402	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7531	17	\N		\N	\N
2403	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7532	17	\N		\N	\N
2404	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7535	17	\N		\N	\N
2405	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7537	17	\N		\N	\N
2406	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7538	17	\N		\N	\N
2407	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7541	17	\N		\N	\N
2408	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7542	17	\N		\N	\N
2409	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7543	17	\N		\N	\N
2410	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7545	17	\N		\N	\N
2411	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7546	17	\N		\N	\N
2412	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7549	17	\N		\N	\N
2413	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7550	17	\N		\N	\N
2414	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7551	17	\N		\N	\N
2415	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7553	17	\N		\N	\N
2416	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7554	17	\N		\N	\N
2417	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7557	17	\N		\N	\N
2418	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7558	17	\N		\N	\N
2419	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7559	17	\N		\N	\N
2420	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7560	17	\N		\N	\N
2421	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7561	17	\N		\N	\N
2422	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7563	17	\N		\N	\N
2423	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7564	17	\N		\N	\N
2424	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7566	17	\N		\N	\N
2425	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7568	17	\N		\N	\N
2426	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7569	17	\N		\N	\N
2427	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7571	17	\N		\N	\N
2428	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7572	17	\N		\N	\N
2429	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7574	17	\N		\N	\N
2430	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7576	17	\N		\N	\N
2431	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7577	17	\N		\N	\N
2432	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7579	17	\N		\N	\N
2433	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7580	17	\N		\N	\N
2434	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7582	17	\N		\N	\N
2435	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7584	17	\N		\N	\N
2436	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7585	17	\N		\N	\N
2437	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7587	17	\N		\N	\N
2438	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7588	17	\N		\N	\N
2439	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7590	17	\N		\N	\N
2440	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7592	17	\N		\N	\N
2441	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7593	17	\N		\N	\N
2442	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7595	17	\N		\N	\N
2443	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7596	17	\N		\N	\N
2444	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7597	17	\N		\N	\N
2445	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7599	17	\N		\N	\N
2446	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7601	17	\N		\N	\N
2447	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7603	17	\N		\N	\N
2448	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7604	17	\N		\N	\N
2449	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7605	17	\N		\N	\N
2450	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7607	17	\N		\N	\N
2451	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7608	17	\N		\N	\N
2452	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7610	17	\N		\N	\N
2453	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7611	17	\N		\N	\N
2454	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7612	17	\N		\N	\N
2455	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7614	17	\N		\N	\N
2456	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7615	17	\N		\N	\N
2457	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7617	17	\N		\N	\N
2458	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7618	17	\N		\N	\N
2459	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7619	17	\N		\N	\N
2460	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7621	17	\N		\N	\N
2461	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7622	17	\N		\N	\N
2462	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7624	17	\N		\N	\N
2463	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7625	17	\N		\N	\N
2464	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7626	17	\N		\N	\N
2465	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7628	17	\N		\N	\N
2466	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7629	17	\N		\N	\N
2467	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7631	17	\N		\N	\N
2468	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7632	17	\N		\N	\N
2469	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7633	17	\N		\N	\N
2470	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7635	17	\N		\N	\N
2471	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7636	17	\N		\N	\N
2473	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:36.737789+00	\N	\N	7494	18	\N	456765456	\N	\N
2474	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:36.740959+00	\N	\N	7495	18	\N	556	\N	\N
2475	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:36.743611+00	\N	\N	7496	18	\N	xcvxcvz	\N	\N
2476	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:36.74611+00	\N	\N	7498	18	\N		\N	\N
2477	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:36.748722+00	\N	\N	7500	18	\N		\N	\N
2479	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:36.753816+00	\N	\N	7503	18	\N		\N	\N
2480	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:36.756318+00	\N	\N	7504	18	\N		\N	\N
2481	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:36.758825+00	\N	\N	7505	18	\N		\N	\N
2482	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:36.761388+00	\N	\N	7507	18	\N		\N	\N
2483	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:36.763805+00	\N	\N	7509	18	\N	zxcvcxzv	\N	\N
2484	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:36.766271+00	\N	\N	7510	18	\N		\N	\N
2485	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:36.76873+00	\N	\N	7512	18	\N		\N	\N
2486	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:36.771158+00	\N	\N	7513	18	\N		\N	\N
2487	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:36.773569+00	\N	\N	7514	18	\N		\N	\N
2488	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:36.778642+00	\N	\N	7516	18	\N		\N	\N
2489	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:36.781925+00	\N	\N	7518	18	\N	xcvcx	\N	\N
2490	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:36.784951+00	\N	\N	7519	18	\N		\N	\N
2491	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:36.787755+00	\N	\N	7521	18	\N	cxvcx	\N	\N
2492	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:36.790417+00	\N	\N	7522	18	\N	xcvxc	\N	\N
2493	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:36.79301+00	\N	\N	7523	18	\N	xzcvxz	\N	\N
2494	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:36.795423+00	\N	\N	7525	18	\N		\N	\N
2496	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:36.800629+00	\N	\N	7528	18	\N		\N	\N
2497	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:36.803114+00	\N	\N	7530	18	\N	zxcvxzc	\N	\N
2498	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:36.805917+00	\N	\N	7531	18	\N	xzcvxzc	\N	\N
2499	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:36.808716+00	\N	\N	7532	18	\N		\N	\N
2500	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:36.811025+00	\N	\N	7535	18	\N		\N	\N
2501	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:36.813265+00	\N	\N	7537	18	\N		\N	\N
2502	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:36.81549+00	\N	\N	7538	18	\N		\N	\N
2503	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:36.817846+00	\N	\N	7541	18	\N		\N	\N
2504	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:36.820525+00	\N	\N	7542	18	\N		\N	\N
2505	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:36.823059+00	\N	\N	7543	18	\N		\N	\N
2506	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:36.825364+00	\N	\N	7545	18	\N		\N	\N
2507	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:36.827625+00	\N	\N	7546	18	\N		\N	\N
2509	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:36.832805+00	\N	\N	7550	18	\N		\N	\N
2510	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:36.835178+00	\N	\N	7551	18	\N		\N	\N
2511	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:36.837582+00	\N	\N	7553	18	\N		\N	\N
2512	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:36.841097+00	\N	\N	7554	18	\N		\N	\N
2513	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:36.843971+00	\N	\N	7557	18	\N		\N	\N
2514	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:36.846479+00	\N	\N	7558	18	\N		\N	\N
2515	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:36.848795+00	\N	\N	7559	18	\N		\N	\N
2518	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:36.854344+00	\N	\N	7561	18	\N		\N	\N
2520	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:36.856753+00	\N	\N	7563	18	\N		\N	\N
2522	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:36.859152+00	\N	\N	7564	18	\N		\N	\N
2524	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:36.861646+00	\N	\N	7566	18	\N		\N	\N
2526	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:36.864324+00	\N	\N	7568	18	\N		\N	\N
2528	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:36.867018+00	\N	\N	7569	18	\N		\N	\N
2530	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:36.87004+00	\N	\N	7571	18	\N		\N	\N
2532	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:36.872929+00	\N	\N	7572	18	\N		\N	\N
2534	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:36.875324+00	\N	\N	7574	18	\N		\N	\N
2536	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:36.878085+00	\N	\N	7576	18	\N		\N	\N
2538	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:36.880487+00	\N	\N	7577	18	\N		\N	\N
2540	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:36.883265+00	\N	\N	7579	18	\N		\N	\N
2542	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:36.885795+00	\N	\N	7580	18	\N		\N	\N
2544	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:36.888381+00	\N	\N	7582	18	\N		\N	\N
2546	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:36.89075+00	\N	\N	7584	18	\N		\N	\N
2548	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:36.893356+00	\N	\N	7585	18	\N		\N	\N
2550	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:36.895749+00	\N	\N	7587	18	\N		\N	\N
2552	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:36.898311+00	\N	\N	7588	18	\N		\N	\N
2556	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:36.903421+00	\N	\N	7592	18	\N		\N	\N
2558	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:36.905912+00	\N	\N	7593	18	\N		\N	\N
2560	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:36.908221+00	\N	\N	7595	18	\N		\N	\N
2561	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:36.910518+00	\N	\N	7596	18	\N		\N	\N
2563	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:36.912788+00	\N	\N	7597	18	\N		\N	\N
2565	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:36.923734+00	\N	\N	7599	18	\N		\N	\N
2566	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:36.926768+00	\N	\N	7601	18	\N		\N	\N
2568	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:36.929654+00	\N	\N	7603	18	\N		\N	\N
2570	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:36.932614+00	\N	\N	7604	18	\N		\N	\N
2572	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:36.935966+00	\N	\N	7605	18	\N		\N	\N
2575	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:36.938945+00	\N	\N	7607	18	\N		\N	\N
2578	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:36.94219+00	\N	\N	7608	18	\N		\N	\N
2580	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:36.945361+00	\N	\N	7610	18	\N		\N	\N
2583	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:36.948719+00	\N	\N	7611	18	\N		\N	\N
2586	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:36.951517+00	\N	\N	7612	18	\N		\N	\N
2589	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:36.954108+00	\N	\N	7614	18	\N		\N	\N
2592	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:36.956951+00	\N	\N	7615	18	\N		\N	\N
2595	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:36.95979+00	\N	\N	7617	18	\N		\N	\N
2601	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:36.965435+00	\N	\N	7619	18	\N		\N	\N
2603	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:36.968708+00	\N	\N	7621	18	\N		\N	\N
2606	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:36.971761+00	\N	\N	7622	18	\N		\N	\N
2609	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:36.974542+00	\N	\N	7624	18	\N		\N	\N
2612	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:36.976982+00	\N	\N	7625	18	\N		\N	\N
2615	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:36.97986+00	\N	\N	7626	18	\N		\N	\N
2618	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:36.982211+00	\N	\N	7628	18	\N		\N	\N
2621	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:36.984785+00	\N	\N	7629	18	\N		\N	\N
2624	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:36.987138+00	\N	\N	7631	18	\N		\N	\N
2627	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:36.989511+00	\N	\N	7632	18	\N		\N	\N
2630	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:36.991859+00	\N	\N	7633	18	\N		\N	\N
2631	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:36.994166+00	\N	\N	7635	18	\N		\N	\N
2634	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:36.996705+00	\N	\N	7636	18	\N		\N	\N
2517	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:47.565848+00	\N	\N	7492	19	\N		\N	\N
2519	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:47.574761+00	\N	\N	7494	19	\N		\N	\N
2521	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:47.577536+00	\N	\N	7495	19	\N		\N	\N
2523	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:47.580054+00	\N	\N	7496	19	\N	xcvxcvz	\N	\N
2525	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:47.582912+00	\N	\N	7498	19	\N		\N	\N
2529	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:47.588625+00	\N	\N	7501	19	\N		\N	\N
2531	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:47.591131+00	\N	\N	7503	19	\N		\N	\N
2533	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:47.593844+00	\N	\N	7504	19	\N		\N	\N
2535	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:47.596593+00	\N	\N	7505	19	\N		\N	\N
2537	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:47.598936+00	\N	\N	7507	19	\N		\N	\N
2539	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:47.601944+00	\N	\N	7509	19	\N	zxcvcxzv	\N	\N
2541	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:47.604361+00	\N	\N	7510	19	\N		\N	\N
2543	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:47.606824+00	\N	\N	7512	19	\N		\N	\N
2545	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:47.60924+00	\N	\N	7513	19	\N		\N	\N
2547	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:47.61222+00	\N	\N	7514	19	\N		\N	\N
2549	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:47.61462+00	\N	\N	7516	19	\N		\N	\N
2551	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:47.617619+00	\N	\N	7518	19	\N	6676787	\N	\N
2553	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:47.620571+00	\N	\N	7519	19	\N		\N	\N
2555	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:47.623233+00	\N	\N	7521	19	\N		\N	\N
2557	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:47.625537+00	\N	\N	7522	19	\N		\N	\N
2559	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:47.627952+00	\N	\N	7523	19	\N		\N	\N
2562	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:47.630523+00	\N	\N	7525	19	\N		\N	\N
2564	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:47.632948+00	\N	\N	7527	19	\N		\N	\N
2569	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:47.638008+00	\N	\N	7530	19	\N		\N	\N
2573	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:47.640573+00	\N	\N	7531	19	\N		\N	\N
2576	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:47.642929+00	\N	\N	7532	19	\N		\N	\N
2579	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:47.645109+00	\N	\N	7535	19	\N		\N	\N
2582	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:47.647579+00	\N	\N	7537	19	\N		\N	\N
2585	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:47.65012+00	\N	\N	7538	19	\N		\N	\N
2588	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:47.652495+00	\N	\N	7541	19	\N		\N	\N
2591	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:47.655014+00	\N	\N	7542	19	\N		\N	\N
2594	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:47.657844+00	\N	\N	7543	19	\N		\N	\N
2597	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:47.660352+00	\N	\N	7545	19	\N		\N	\N
2602	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:47.662674+00	\N	\N	7546	19	\N		\N	\N
2605	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:47.665+00	\N	\N	7549	19	\N		\N	\N
2608	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:47.667522+00	\N	\N	7550	19	\N		\N	\N
2611	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:47.669856+00	\N	\N	7551	19	\N		\N	\N
2614	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:47.672305+00	\N	\N	7553	19	\N		\N	\N
2619	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:47.675522+00	\N	\N	7554	19	\N		\N	\N
2622	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:47.678043+00	\N	\N	7557	19	\N		\N	\N
2625	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:47.680626+00	\N	\N	7558	19	\N		\N	\N
2633	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:47.685399+00	\N	\N	7560	19	\N		\N	\N
2635	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:47.687725+00	\N	\N	7561	19	\N		\N	\N
2637	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:47.690084+00	\N	\N	7563	19	\N		\N	\N
2571	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:16.821912+00	\N	\N	7492	20	\N		\N	\N
2574	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:16.826678+00	\N	\N	7494	20	\N		\N	\N
2577	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:16.829744+00	\N	\N	7495	20	\N		\N	\N
2581	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:16.83269+00	\N	\N	7496	20	\N	xcvxcvz	\N	\N
2584	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:16.835164+00	\N	\N	7498	20	\N		\N	\N
2587	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:16.837662+00	\N	\N	7500	20	\N		\N	\N
2590	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:16.840297+00	\N	\N	7501	20	\N		\N	\N
2593	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:16.842697+00	\N	\N	7503	20	\N		\N	\N
2596	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:16.845061+00	\N	\N	7504	20	\N		\N	\N
2598	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:16.847451+00	\N	\N	7505	20	\N		\N	\N
2600	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:16.84984+00	\N	\N	7507	20	\N		\N	\N
2604	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:16.852455+00	\N	\N	7509	20	\N	zxcvcxzv	\N	\N
2607	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:16.855107+00	\N	\N	7510	20	\N		\N	\N
2610	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:16.857634+00	\N	\N	7512	20	\N	xcvxzcv	\N	\N
2613	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:16.860126+00	\N	\N	7513	20	\N		\N	\N
2616	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:16.862567+00	\N	\N	7514	20	\N		\N	\N
2617	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:16.865011+00	\N	\N	7516	20	\N		\N	\N
2620	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:16.867718+00	\N	\N	7518	20	\N		\N	\N
2623	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:16.870313+00	\N	\N	7519	20	\N		\N	\N
2626	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:16.872738+00	\N	\N	7521	20	\N	zxcvz	\N	\N
2628	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:16.875122+00	\N	\N	7522	20	\N		\N	\N
2632	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:16.877686+00	\N	\N	7523	20	\N	zxcvxvcv	\N	\N
2636	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:16.880177+00	\N	\N	7525	20	\N		\N	\N
2638	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:16.882636+00	\N	\N	7527	20	\N		\N	\N
2640	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:16.885056+00	\N	\N	7528	20	\N		\N	\N
2642	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:16.88753+00	\N	\N	7530	20	\N		\N	\N
2644	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:16.889936+00	\N	\N	7531	20	\N		\N	\N
2646	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:16.892662+00	\N	\N	7532	20	\N		\N	\N
2648	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:16.895024+00	\N	\N	7535	20	\N		\N	\N
2650	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:16.897367+00	\N	\N	7537	20	\N		\N	\N
2652	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:16.900332+00	\N	\N	7538	20	\N		\N	\N
2654	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:16.902968+00	\N	\N	7541	20	\N		\N	\N
2656	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:16.906147+00	\N	\N	7542	20	\N		\N	\N
2658	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:16.909058+00	\N	\N	7543	20	\N		\N	\N
2660	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:16.911507+00	\N	\N	7545	20	\N		\N	\N
2662	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:16.914121+00	\N	\N	7546	20	\N		\N	\N
2664	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:16.916565+00	\N	\N	7549	20	\N		\N	\N
2666	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:16.919016+00	\N	\N	7550	20	\N		\N	\N
2668	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:16.921491+00	\N	\N	7551	20	\N		\N	\N
2670	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:16.923906+00	\N	\N	7553	20	\N		\N	\N
2672	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:16.9263+00	\N	\N	7554	20	\N		\N	\N
2674	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:16.928918+00	\N	\N	7557	20	\N		\N	\N
2676	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:16.931482+00	\N	\N	7558	20	\N		\N	\N
2678	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:16.934675+00	\N	\N	7559	20	\N		\N	\N
2680	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:16.937956+00	\N	\N	7560	20	\N		\N	\N
2682	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:16.941226+00	\N	\N	7561	20	\N		\N	\N
2684	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:16.944673+00	\N	\N	7563	20	\N		\N	\N
2686	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:16.947856+00	\N	\N	7564	20	\N		\N	\N
2688	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:16.954983+00	\N	\N	7566	20	\N		\N	\N
2690	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:16.96294+00	\N	\N	7568	20	\N		\N	\N
2692	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:16.966164+00	\N	\N	7569	20	\N		\N	\N
2694	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:16.968678+00	\N	\N	7571	20	\N		\N	\N
2696	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:16.971119+00	\N	\N	7572	20	\N		\N	\N
2698	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:16.973618+00	\N	\N	7574	20	\N		\N	\N
2700	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:16.976296+00	\N	\N	7576	20	\N		\N	\N
2702	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:16.978722+00	\N	\N	7577	20	\N		\N	\N
2704	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:16.981361+00	\N	\N	7579	20	\N		\N	\N
2706	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:16.984485+00	\N	\N	7580	20	\N		\N	\N
2708	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:16.987163+00	\N	\N	7582	20	\N		\N	\N
2710	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:16.989732+00	\N	\N	7584	20	\N		\N	\N
2712	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:16.992666+00	\N	\N	7585	20	\N		\N	\N
2714	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:16.995472+00	\N	\N	7587	20	\N		\N	\N
2716	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:16.998073+00	\N	\N	7588	20	\N		\N	\N
2718	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:17.00085+00	\N	\N	7590	20	\N		\N	\N
2720	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:17.003532+00	\N	\N	7592	20	\N		\N	\N
2721	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:17.006288+00	\N	\N	7593	20	\N		\N	\N
2723	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:17.009166+00	\N	\N	7595	20	\N		\N	\N
2725	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:17.011535+00	\N	\N	7596	20	\N		\N	\N
2727	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:17.014648+00	\N	\N	7597	20	\N		\N	\N
2729	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:17.017458+00	\N	\N	7599	20	\N		\N	\N
2732	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:17.019843+00	\N	\N	7601	20	\N		\N	\N
2735	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:17.02215+00	\N	\N	7603	20	\N		\N	\N
2738	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:17.02457+00	\N	\N	7604	20	\N		\N	\N
2740	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:17.026954+00	\N	\N	7605	20	\N		\N	\N
2742	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:17.029253+00	\N	\N	7607	20	\N		\N	\N
2745	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:17.031613+00	\N	\N	7608	20	\N		\N	\N
2748	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:17.034217+00	\N	\N	7610	20	\N		\N	\N
2750	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:17.036694+00	\N	\N	7611	20	\N		\N	\N
2752	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:17.03911+00	\N	\N	7612	20	\N		\N	\N
2754	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:17.04147+00	\N	\N	7614	20	\N		\N	\N
2756	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:17.043968+00	\N	\N	7615	20	\N		\N	\N
2758	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:17.046223+00	\N	\N	7617	20	\N		\N	\N
2760	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:17.048586+00	\N	\N	7618	20	\N		\N	\N
2762	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:17.051004+00	\N	\N	7619	20	\N		\N	\N
2764	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:17.053353+00	\N	\N	7621	20	\N		\N	\N
2766	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:17.055727+00	\N	\N	7622	20	\N		\N	\N
2768	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:17.058015+00	\N	\N	7624	20	\N		\N	\N
2770	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:17.060471+00	\N	\N	7625	20	\N		\N	\N
2772	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:17.062863+00	\N	\N	7626	20	\N		\N	\N
2774	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:17.065241+00	\N	\N	7628	20	\N		\N	\N
2776	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:17.067633+00	\N	\N	7629	20	\N		\N	\N
2778	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:17.070075+00	\N	\N	7631	20	\N		\N	\N
2780	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:17.072444+00	\N	\N	7632	20	\N		\N	\N
2782	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:17.074853+00	\N	\N	7633	20	\N		\N	\N
2784	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:17.077519+00	\N	\N	7635	20	\N		\N	\N
2786	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:17.080466+00	\N	\N	7636	20	\N		\N	\N
2639	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:47.692603+00	\N	\N	7564	19	\N		\N	\N
2641	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:47.695103+00	\N	\N	7566	19	\N		\N	\N
2643	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:47.699112+00	\N	\N	7568	19	\N		\N	\N
2645	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:47.701568+00	\N	\N	7569	19	\N		\N	\N
2647	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:47.704198+00	\N	\N	7571	19	\N		\N	\N
2649	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:47.706759+00	\N	\N	7572	19	\N		\N	\N
2651	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:47.709038+00	\N	\N	7574	19	\N		\N	\N
2653	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:47.711338+00	\N	\N	7576	19	\N		\N	\N
2655	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:47.713917+00	\N	\N	7577	19	\N		\N	\N
2657	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:47.716549+00	\N	\N	7579	19	\N		\N	\N
2659	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:47.718933+00	\N	\N	7580	19	\N		\N	\N
2661	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:47.721235+00	\N	\N	7582	19	\N		\N	\N
2663	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:47.723754+00	\N	\N	7584	19	\N		\N	\N
2665	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:47.726677+00	\N	\N	7585	19	\N		\N	\N
2667	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:47.729575+00	\N	\N	7587	19	\N		\N	\N
2669	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:47.732207+00	\N	\N	7588	19	\N		\N	\N
2671	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:47.734659+00	\N	\N	7590	19	\N		\N	\N
2673	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:47.73706+00	\N	\N	7592	19	\N		\N	\N
2675	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:47.7401+00	\N	\N	7593	19	\N		\N	\N
2677	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:47.742697+00	\N	\N	7595	19	\N		\N	\N
2679	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:47.744948+00	\N	\N	7596	19	\N		\N	\N
2681	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:47.74738+00	\N	\N	7597	19	\N		\N	\N
2683	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:47.749952+00	\N	\N	7599	19	\N		\N	\N
2685	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:47.752284+00	\N	\N	7601	19	\N		\N	\N
2687	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:47.75483+00	\N	\N	7603	19	\N		\N	\N
2689	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:47.841446+00	\N	\N	7604	19	\N		\N	\N
2691	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:47.844347+00	\N	\N	7605	19	\N		\N	\N
2693	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:47.847471+00	\N	\N	7607	19	\N		\N	\N
2695	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:47.85011+00	\N	\N	7608	19	\N		\N	\N
2697	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:47.852816+00	\N	\N	7610	19	\N		\N	\N
2699	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:47.855752+00	\N	\N	7611	19	\N		\N	\N
2701	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:47.858395+00	\N	\N	7612	19	\N		\N	\N
2703	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:47.861592+00	\N	\N	7614	19	\N		\N	\N
2705	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:47.864221+00	\N	\N	7615	19	\N		\N	\N
2707	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:47.866731+00	\N	\N	7617	19	\N		\N	\N
2709	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:47.869518+00	\N	\N	7618	19	\N		\N	\N
2711	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:47.872186+00	\N	\N	7619	19	\N		\N	\N
2713	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:47.874703+00	\N	\N	7621	19	\N		\N	\N
2715	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:47.877784+00	\N	\N	7622	19	\N		\N	\N
2717	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:47.880936+00	\N	\N	7624	19	\N		\N	\N
2719	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:47.88359+00	\N	\N	7625	19	\N		\N	\N
2722	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:47.893623+00	\N	\N	7626	19	\N		\N	\N
2724	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:47.896794+00	\N	\N	7628	19	\N		\N	\N
2726	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:47.899155+00	\N	\N	7629	19	\N		\N	\N
2730	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:47.902078+00	\N	\N	7631	19	\N		\N	\N
2733	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:47.904716+00	\N	\N	7632	19	\N		\N	\N
2737	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:47.907269+00	\N	\N	7633	19	\N		\N	\N
2741	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:47.909964+00	\N	\N	7635	19	\N		\N	\N
2744	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:47.912626+00	\N	\N	7636	19	\N		\N	\N
2472	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:36.732277+00	\N	\N	7492	18	\N		\N	\N
2478	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:36.751196+00	\N	\N	7501	18	\N		\N	\N
2495	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:36.797917+00	\N	\N	7527	18	\N	xczvxzcv	\N	\N
2508	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:36.82996+00	\N	\N	7549	18	\N		\N	\N
2516	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:36.851408+00	\N	\N	7560	18	\N		\N	\N
2554	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:36.900743+00	\N	\N	7590	18	\N		\N	\N
2599	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:36.962319+00	\N	\N	7618	18	\N		\N	\N
2527	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:47.585654+00	\N	\N	7500	19	\N		\N	\N
2567	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:47.635501+00	\N	\N	7528	19	\N		\N	\N
2629	2017-07-20 14:36:22.557893+00	2017-08-21 20:18:47.682976+00	\N	\N	7559	19	\N		\N	\N
2728	2017-07-20 14:36:22.557893+00	2017-08-21 20:19:17.683305+00	\N	\N	7492	21	\N		\N	\N
2731	2017-07-20 14:36:22.557893+00	2017-08-21 20:19:17.691716+00	\N	\N	7494	21	\N		\N	\N
2734	2017-07-20 14:36:22.557893+00	2017-08-21 20:19:17.695081+00	\N	\N	7495	21	\N		\N	\N
2736	2017-07-20 14:36:22.557893+00	2017-08-21 20:19:17.69748+00	\N	\N	7496	21	\N	xcvxcvz	\N	\N
2739	2017-07-20 14:36:22.557893+00	2017-08-21 20:19:17.70248+00	\N	\N	7498	21	\N		\N	\N
2743	2017-07-20 14:36:22.557893+00	2017-08-21 20:19:17.70494+00	\N	\N	7500	21	\N		\N	\N
2747	2017-07-20 14:36:22.557893+00	2017-08-21 20:19:17.711267+00	\N	\N	7503	21	\N		\N	\N
2749	2017-07-20 14:36:22.557893+00	2017-08-21 20:19:17.713961+00	\N	\N	7504	21	\N		\N	\N
2751	2017-07-20 14:36:22.557893+00	2017-08-21 20:19:17.716491+00	\N	\N	7505	21	\N		\N	\N
2753	2017-07-20 14:36:22.557893+00	2017-08-21 20:19:17.719257+00	\N	\N	7507	21	\N		\N	\N
2755	2017-07-20 14:36:22.557893+00	2017-08-21 20:19:17.721794+00	\N	\N	7509	21	\N	zxcvcxzv	\N	\N
2757	2017-07-20 14:36:22.557893+00	2017-08-21 20:19:17.724382+00	\N	\N	7510	21	\N		\N	\N
2759	2017-07-20 14:36:22.557893+00	2017-08-21 20:19:17.727153+00	\N	\N	7512	21	\N		\N	\N
2761	2017-07-20 14:36:22.557893+00	2017-08-21 20:19:17.729637+00	\N	\N	7513	21	\N		\N	\N
2763	2017-07-20 14:36:22.557893+00	2017-08-21 20:19:17.732238+00	\N	\N	7514	21	\N		\N	\N
2765	2017-07-20 14:36:22.557893+00	2017-08-21 20:19:17.735058+00	\N	\N	7516	21	\N		\N	\N
2767	2017-07-20 14:36:22.557893+00	2017-08-21 20:19:17.737642+00	\N	\N	7518	21	\N	sdfds	\N	\N
2769	2017-07-20 14:36:22.557893+00	2017-08-21 20:19:17.740135+00	\N	\N	7519	21	\N		\N	\N
2771	2017-07-20 14:36:22.557893+00	2017-08-21 20:19:17.744515+00	\N	\N	7521	21	\N		\N	\N
2773	2017-07-20 14:36:22.557893+00	2017-08-21 20:19:17.747154+00	\N	\N	7522	21	\N	sdf5	\N	\N
2775	2017-07-20 14:36:22.557893+00	2017-08-21 20:19:17.749951+00	\N	\N	7523	21	\N	555	\N	\N
2777	2017-07-20 14:36:22.557893+00	2017-08-21 20:19:17.752433+00	\N	\N	7525	21	\N		\N	\N
2779	2017-07-20 14:36:22.557893+00	2017-08-21 20:19:17.754931+00	\N	\N	7527	21	\N	6777	\N	\N
2781	2017-07-20 14:36:22.557893+00	2017-08-21 20:19:17.75741+00	\N	\N	7528	21	\N		\N	\N
2785	2017-07-20 14:36:22.557893+00	2017-08-21 20:19:17.762063+00	\N	\N	7531	21	\N		\N	\N
2787	2017-07-20 14:36:22.557893+00	2017-08-21 20:19:17.764651+00	\N	\N	7532	21	\N		\N	\N
2788	2017-07-20 14:36:22.557893+00	2017-08-21 20:19:17.767164+00	\N	\N	7535	21	\N		\N	\N
2789	2017-07-20 14:36:22.557893+00	2017-08-21 20:19:17.769646+00	\N	\N	7537	21	\N		\N	\N
2790	2017-07-20 14:36:22.557893+00	2017-08-21 20:19:17.772005+00	\N	\N	7538	21	\N		\N	\N
2791	2017-07-20 14:36:22.557893+00	2017-08-21 20:19:17.774335+00	\N	\N	7541	21	\N		\N	\N
2792	2017-07-20 14:36:22.557893+00	2017-08-21 20:19:17.777224+00	\N	\N	7542	21	\N		\N	\N
2793	2017-07-20 14:36:22.557893+00	2017-08-21 20:19:17.781178+00	\N	\N	7543	21	\N		\N	\N
2794	2017-07-20 14:36:22.557893+00	2017-08-21 20:19:17.784117+00	\N	\N	7545	21	\N		\N	\N
2795	2017-07-20 14:36:22.557893+00	2017-08-21 20:19:17.787038+00	\N	\N	7546	21	\N		\N	\N
2796	2017-07-20 14:36:22.557893+00	2017-08-21 20:19:17.790008+00	\N	\N	7549	21	\N		\N	\N
2797	2017-07-20 14:36:22.557893+00	2017-08-21 20:19:17.793162+00	\N	\N	7550	21	\N		\N	\N
2798	2017-07-20 14:36:22.557893+00	2017-08-21 20:19:17.796394+00	\N	\N	7551	21	\N		\N	\N
2799	2017-07-20 14:36:22.557893+00	2017-08-21 20:19:17.799713+00	\N	\N	7553	21	\N		\N	\N
2800	2017-07-20 14:36:22.557893+00	2017-08-21 20:19:17.802261+00	\N	\N	7554	21	\N		\N	\N
2801	2017-07-20 14:36:22.557893+00	2017-08-21 20:19:17.805837+00	\N	\N	7557	21	\N		\N	\N
2802	2017-07-20 14:36:22.557893+00	2017-08-21 20:19:17.808523+00	\N	\N	7558	21	\N		\N	\N
2803	2017-07-20 14:36:22.557893+00	2017-08-21 20:19:17.811199+00	\N	\N	7559	21	\N		\N	\N
2805	2017-07-20 14:36:22.557893+00	2017-08-21 20:19:17.81729+00	\N	\N	7561	21	\N		\N	\N
2806	2017-07-20 14:36:22.557893+00	2017-08-21 20:19:17.820779+00	\N	\N	7563	21	\N		\N	\N
2807	2017-07-20 14:36:22.557893+00	2017-08-21 20:19:17.823321+00	\N	\N	7564	21	\N		\N	\N
2808	2017-07-20 14:36:22.557893+00	2017-08-21 20:19:17.826518+00	\N	\N	7566	21	\N		\N	\N
2809	2017-07-20 14:36:22.557893+00	2017-08-21 20:19:17.829126+00	\N	\N	7568	21	\N		\N	\N
2810	2017-07-20 14:36:22.557893+00	2017-08-21 20:19:17.831569+00	\N	\N	7569	21	\N		\N	\N
2811	2017-07-20 14:36:22.557893+00	2017-08-21 20:19:17.833943+00	\N	\N	7571	21	\N		\N	\N
2812	2017-07-20 14:36:22.557893+00	2017-08-21 20:19:17.83666+00	\N	\N	7572	21	\N		\N	\N
2813	2017-07-20 14:36:22.557893+00	2017-08-21 20:19:17.839557+00	\N	\N	7574	21	\N		\N	\N
2814	2017-07-20 14:36:22.557893+00	2017-08-21 20:19:17.843195+00	\N	\N	7576	21	\N		\N	\N
2815	2017-07-20 14:36:22.557893+00	2017-08-21 20:19:17.845988+00	\N	\N	7577	21	\N		\N	\N
2816	2017-07-20 14:36:22.557893+00	2017-08-21 20:19:17.848471+00	\N	\N	7579	21	\N		\N	\N
2817	2017-07-20 14:36:22.557893+00	2017-08-21 20:19:17.851306+00	\N	\N	7580	21	\N		\N	\N
2818	2017-07-20 14:36:22.557893+00	2017-08-21 20:19:17.854045+00	\N	\N	7582	21	\N		\N	\N
2819	2017-07-20 14:36:22.557893+00	2017-08-21 20:19:17.856723+00	\N	\N	7584	21	\N		\N	\N
2820	2017-07-20 14:36:22.557893+00	2017-08-21 20:19:17.859197+00	\N	\N	7585	21	\N		\N	\N
2821	2017-07-20 14:36:22.557893+00	2017-08-21 20:19:17.862252+00	\N	\N	7587	21	\N		\N	\N
2822	2017-07-20 14:36:22.557893+00	2017-08-21 20:19:17.865489+00	\N	\N	7588	21	\N		\N	\N
2824	2017-07-20 14:36:22.557893+00	2017-08-21 20:19:17.871983+00	\N	\N	7592	21	\N		\N	\N
2825	2017-07-20 14:36:22.557893+00	2017-08-21 20:19:17.874955+00	\N	\N	7593	21	\N		\N	\N
2826	2017-07-20 14:36:22.557893+00	2017-08-21 20:19:17.87925+00	\N	\N	7595	21	\N		\N	\N
2827	2017-07-20 14:36:22.557893+00	2017-08-21 20:19:17.882337+00	\N	\N	7596	21	\N		\N	\N
2828	2017-07-20 14:36:22.557893+00	2017-08-21 20:19:17.884967+00	\N	\N	7597	21	\N		\N	\N
2829	2017-07-20 14:36:22.557893+00	2017-08-21 20:19:17.888039+00	\N	\N	7599	21	\N		\N	\N
2830	2017-07-20 14:36:22.557893+00	2017-08-21 20:19:17.892571+00	\N	\N	7601	21	\N		\N	\N
2831	2017-07-20 14:36:22.557893+00	2017-08-21 20:19:17.895958+00	\N	\N	7603	21	\N		\N	\N
2832	2017-07-20 14:36:22.557893+00	2017-08-21 20:19:17.898203+00	\N	\N	7604	21	\N		\N	\N
2833	2017-07-20 14:36:22.557893+00	2017-08-21 20:19:17.900907+00	\N	\N	7605	21	\N		\N	\N
2834	2017-07-20 14:36:22.557893+00	2017-08-21 20:19:17.903275+00	\N	\N	7607	21	\N		\N	\N
2835	2017-07-20 14:36:22.557893+00	2017-08-21 20:19:17.90577+00	\N	\N	7608	21	\N		\N	\N
2836	2017-07-20 14:36:22.557893+00	2017-08-21 20:19:17.908302+00	\N	\N	7610	21	\N		\N	\N
2837	2017-07-20 14:36:22.557893+00	2017-08-21 20:19:17.910975+00	\N	\N	7611	21	\N		\N	\N
2838	2017-07-20 14:36:22.557893+00	2017-08-21 20:19:17.91379+00	\N	\N	7612	21	\N		\N	\N
2839	2017-07-20 14:36:22.557893+00	2017-08-21 20:19:17.916492+00	\N	\N	7614	21	\N		\N	\N
2840	2017-07-20 14:36:22.557893+00	2017-08-21 20:19:17.919059+00	\N	\N	7615	21	\N		\N	\N
2841	2017-07-20 14:36:22.557893+00	2017-08-21 20:19:17.921585+00	\N	\N	7617	21	\N		\N	\N
2843	2017-07-20 14:36:22.557893+00	2017-08-21 20:19:17.927657+00	\N	\N	7619	21	\N		\N	\N
2844	2017-07-20 14:36:22.557893+00	2017-08-21 20:19:17.931744+00	\N	\N	7621	21	\N		\N	\N
2845	2017-07-20 14:36:22.557893+00	2017-08-21 20:19:17.934935+00	\N	\N	7622	21	\N		\N	\N
2846	2017-07-20 14:36:22.557893+00	2017-08-21 20:19:17.937505+00	\N	\N	7624	21	\N		\N	\N
2847	2017-07-20 14:36:22.557893+00	2017-08-21 20:19:17.940303+00	\N	\N	7625	21	\N		\N	\N
2848	2017-07-20 14:36:22.557893+00	2017-08-21 20:19:17.944118+00	\N	\N	7626	21	\N		\N	\N
2849	2017-07-20 14:36:22.557893+00	2017-08-21 20:19:17.947279+00	\N	\N	7628	21	\N		\N	\N
2850	2017-07-20 14:36:22.557893+00	2017-08-21 20:19:17.949753+00	\N	\N	7629	21	\N		\N	\N
2851	2017-07-20 14:36:22.557893+00	2017-08-21 20:19:17.95266+00	\N	\N	7631	21	\N		\N	\N
2852	2017-07-20 14:36:22.557893+00	2017-08-21 20:19:17.955272+00	\N	\N	7632	21	\N		\N	\N
2853	2017-07-20 14:36:22.557893+00	2017-08-21 20:19:17.958098+00	\N	\N	7633	21	\N		\N	\N
2854	2017-07-20 14:36:22.557893+00	2017-08-21 20:19:17.960584+00	\N	\N	7635	21	\N		\N	\N
2855	2017-07-20 14:36:22.557893+00	2017-08-21 20:19:17.962932+00	\N	\N	7636	21	\N		\N	\N
2746	2017-07-20 14:36:22.557893+00	2017-08-21 20:19:17.707173+00	\N	\N	7501	21	\N		\N	\N
2783	2017-07-20 14:36:22.557893+00	2017-08-21 20:19:17.759764+00	\N	\N	7530	21	\N	666	\N	\N
2804	2017-07-20 14:36:22.557893+00	2017-08-21 20:19:17.813919+00	\N	\N	7560	21	\N		\N	\N
2823	2017-07-20 14:36:22.557893+00	2017-08-21 20:19:17.868583+00	\N	\N	7590	21	\N		\N	\N
2842	2017-07-20 14:36:22.557893+00	2017-08-21 20:19:17.924676+00	\N	\N	7618	21	\N		\N	\N
2856	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7390	22	\N		\N	\N
2857	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7391	22	\N		\N	\N
2858	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7392	22	\N		\N	\N
2859	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7394	22	\N		\N	\N
2860	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7395	22	\N		\N	\N
2861	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7397	22	\N		\N	\N
2862	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7399	22	\N		\N	\N
2863	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7400	22	\N		\N	\N
2864	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7401	22	\N		\N	\N
2865	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7404	22	\N		\N	\N
2866	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7405	22	\N		\N	\N
2867	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7408	22	\N		\N	\N
2868	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7411	22	\N		\N	\N
2869	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7414	22	\N		\N	\N
2870	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7417	22	\N		\N	\N
2871	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7420	22	\N		\N	\N
2872	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7423	22	\N		\N	\N
2873	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7426	22	\N		\N	\N
2874	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7429	22	\N		\N	\N
2875	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7432	22	\N		\N	\N
2876	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7435	22	\N		\N	\N
2877	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7436	22	\N		\N	\N
2878	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7438	22	\N		\N	\N
2879	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7439	22	\N		\N	\N
2880	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7440	22	\N		\N	\N
2881	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7442	22	\N	tyuty	\N	\N
2882	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7443	22	\N		\N	\N
2883	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7446	22	\N		\N	\N
2884	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7449	22	\N		\N	\N
2885	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7452	22	\N		\N	\N
2886	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7455	22	\N		\N	\N
2887	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7458	22	\N		\N	\N
2888	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7459	22	\N		\N	\N
2889	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7461	22	\N	tyuty	\N	\N
2890	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7462	22	\N		\N	\N
2891	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7463	22	\N		\N	\N
2892	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7465	22	\N		\N	\N
2893	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7466	22	\N		\N	\N
2894	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7469	22	\N		\N	\N
2895	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7472	22	\N		\N	\N
2896	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7475	22	\N		\N	\N
2897	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7478	22	\N		\N	\N
2898	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7481	22	\N		\N	\N
2899	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7484	22	\N		\N	\N
2900	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7487	22	\N		\N	\N
2901	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7488	22	\N		\N	\N
2902	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	\N	\N	7490	22	\N		\N	\N
2904	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:18.995581+00	\N	\N	7391	23	\N	tyuty	\N	\N
2905	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:18.99868+00	\N	\N	7392	23	\N	tyuty	\N	\N
2906	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:19.002134+00	\N	\N	7394	23	\N		\N	\N
2907	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:19.006151+00	\N	\N	7395	23	\N		\N	\N
2908	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:19.00958+00	\N	\N	7397	23	\N	tyutyu	\N	\N
2909	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:19.012938+00	\N	\N	7399	23	\N	tyutyu	\N	\N
2910	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:19.016231+00	\N	\N	7400	23	\N		\N	\N
2911	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:19.019631+00	\N	\N	7401	23	\N		\N	\N
2912	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:19.023347+00	\N	\N	7404	23	\N	tyutyu	\N	\N
2914	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:19.030699+00	\N	\N	7408	23	\N		\N	\N
2915	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:19.034331+00	\N	\N	7411	23	\N		\N	\N
2916	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:19.038233+00	\N	\N	7414	23	\N		\N	\N
2917	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:19.041059+00	\N	\N	7417	23	\N		\N	\N
2918	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:19.043811+00	\N	\N	7420	23	\N		\N	\N
2919	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:19.046538+00	\N	\N	7423	23	\N		\N	\N
2920	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:19.049012+00	\N	\N	7426	23	\N		\N	\N
2921	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:19.051933+00	\N	\N	7429	23	\N		\N	\N
2922	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:19.054817+00	\N	\N	7432	23	\N		\N	\N
2923	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:19.058166+00	\N	\N	7435	23	\N		\N	\N
2924	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:19.061772+00	\N	\N	7436	23	\N		\N	\N
2925	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:19.065716+00	\N	\N	7438	23	\N		\N	\N
2926	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:19.069316+00	\N	\N	7439	23	\N		\N	\N
2927	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:19.07391+00	\N	\N	7440	23	\N		\N	\N
2928	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:19.0777+00	\N	\N	7442	23	\N	tyuty	\N	\N
2929	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:19.08126+00	\N	\N	7443	23	\N		\N	\N
2930	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:19.085045+00	\N	\N	7446	23	\N		\N	\N
2931	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:19.088418+00	\N	\N	7449	23	\N		\N	\N
2933	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:19.102944+00	\N	\N	7455	23	\N		\N	\N
2934	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:19.106462+00	\N	\N	7458	23	\N		\N	\N
2935	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:19.109301+00	\N	\N	7459	23	\N	tyu	\N	\N
2936	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:19.113025+00	\N	\N	7461	23	\N	tyuty	\N	\N
2937	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:19.116453+00	\N	\N	7462	23	\N		\N	\N
2938	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:19.123554+00	\N	\N	7463	23	\N		\N	\N
2940	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:19.128101+00	\N	\N	7465	23	\N		\N	\N
2942	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:19.131214+00	\N	\N	7466	23	\N		\N	\N
2944	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:19.134341+00	\N	\N	7469	23	\N		\N	\N
2946	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:19.137502+00	\N	\N	7472	23	\N		\N	\N
2948	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:19.140418+00	\N	\N	7475	23	\N		\N	\N
2950	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:19.147829+00	\N	\N	7478	23	\N		\N	\N
2939	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:30.960643+00	\N	\N	7390	24	\N		\N	\N
2941	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:30.968208+00	\N	\N	7391	24	\N		\N	\N
2943	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:30.97096+00	\N	\N	7392	24	\N		\N	\N
2945	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:30.973983+00	\N	\N	7394	24	\N		\N	\N
2947	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:30.976835+00	\N	\N	7395	24	\N		\N	\N
2949	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:30.980248+00	\N	\N	7397	24	\N		\N	\N
2951	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:30.983044+00	\N	\N	7399	24	\N	tyutyu	\N	\N
2953	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:30.98567+00	\N	\N	7400	24	\N		\N	\N
2955	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:30.988644+00	\N	\N	7401	24	\N		\N	\N
2957	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:31.000035+00	\N	\N	7404	24	\N		\N	\N
2958	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:19.163211+00	\N	\N	7488	23	\N		\N	\N
2960	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:19.165669+00	\N	\N	7490	23	\N		\N	\N
2127	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.087371+00	\N	\N	7028	15	\N		\N	\N
2137	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.119968+00	\N	\N	7043	15	\N		\N	\N
2156	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.171929+00	\N	\N	7084	15	\N		\N	\N
2175	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.227127+00	\N	\N	7114	15	\N		\N	\N
2187	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.270543+00	\N	\N	7132	15	\N		\N	\N
2197	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.296283+00	\N	\N	7146	15	\N		\N	\N
2216	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.350223+00	\N	\N	7171	15	\N		\N	\N
2235	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.405468+00	\N	\N	7198	15	\N		\N	\N
2254	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.45802+00	\N	\N	7230	15	\N		\N	\N
2273	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.507948+00	\N	\N	7265	15	\N		\N	\N
2292	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.644605+00	\N	\N	7305	15	\N		\N	\N
2294	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.651148+00	\N	\N	7311	15	\N		\N	\N
2304	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.677585+00	\N	\N	7336	15	\N		\N	\N
2323	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:00.7266+00	\N	\N	7376	15	\N		\N	\N
2903	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:18.988325+00	\N	\N	7390	23	\N		\N	\N
2913	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:19.02741+00	\N	\N	7405	23	\N		\N	\N
2932	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:19.097942+00	\N	\N	7452	23	\N		\N	\N
2952	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:19.153283+00	\N	\N	7481	23	\N		\N	\N
2954	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:19.15662+00	\N	\N	7484	23	\N		\N	\N
2956	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:19.159967+00	\N	\N	7487	23	\N		\N	\N
2959	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:31.004578+00	\N	\N	7405	24	\N		\N	\N
2961	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:31.00826+00	\N	\N	7408	24	\N		\N	\N
2962	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:31.011971+00	\N	\N	7411	24	\N		\N	\N
2963	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:31.015287+00	\N	\N	7414	24	\N		\N	\N
2964	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:31.018332+00	\N	\N	7417	24	\N		\N	\N
2965	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:31.021499+00	\N	\N	7420	24	\N		\N	\N
2966	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:31.024866+00	\N	\N	7423	24	\N		\N	\N
2967	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:31.02793+00	\N	\N	7426	24	\N		\N	\N
2968	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:31.031434+00	\N	\N	7429	24	\N		\N	\N
2969	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:31.034518+00	\N	\N	7432	24	\N		\N	\N
2970	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:31.03741+00	\N	\N	7435	24	\N		\N	\N
2971	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:31.040273+00	\N	\N	7436	24	\N		\N	\N
2972	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:31.042896+00	\N	\N	7438	24	\N		\N	\N
2973	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:31.046515+00	\N	\N	7439	24	\N		\N	\N
2974	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:31.049263+00	\N	\N	7440	24	\N		\N	\N
2975	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:31.051949+00	\N	\N	7442	24	\N	tyuty	\N	\N
2976	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:31.057771+00	\N	\N	7443	24	\N		\N	\N
2977	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:31.060906+00	\N	\N	7446	24	\N		\N	\N
2978	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:31.06398+00	\N	\N	7449	24	\N		\N	\N
2979	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:31.070283+00	\N	\N	7452	24	\N		\N	\N
2980	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:31.074079+00	\N	\N	7455	24	\N		\N	\N
2981	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:31.080053+00	\N	\N	7458	24	\N		\N	\N
2982	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:31.083516+00	\N	\N	7459	24	\N		\N	\N
2983	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:31.086453+00	\N	\N	7461	24	\N	tyuty	\N	\N
2984	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:31.089247+00	\N	\N	7462	24	\N		\N	\N
2985	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:31.092319+00	\N	\N	7463	24	\N		\N	\N
2986	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:31.096338+00	\N	\N	7465	24	\N		\N	\N
2987	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:31.099691+00	\N	\N	7466	24	\N		\N	\N
2988	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:31.102931+00	\N	\N	7469	24	\N		\N	\N
2989	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:31.10657+00	\N	\N	7472	24	\N		\N	\N
2990	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:31.111129+00	\N	\N	7475	24	\N		\N	\N
2991	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:31.114717+00	\N	\N	7478	24	\N		\N	\N
2992	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:31.118029+00	\N	\N	7481	24	\N		\N	\N
2993	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:31.121375+00	\N	\N	7484	24	\N		\N	\N
2994	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:31.124111+00	\N	\N	7487	24	\N	tyuty	\N	\N
2995	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:31.127282+00	\N	\N	7488	24	\N	tyuty	\N	\N
2996	2017-07-20 14:36:22.557893+00	2017-08-21 20:20:31.130632+00	\N	\N	7490	24	\N		\N	\N
\.


--
-- TOC entry 3289 (class 0 OID 0)
-- Dependencies: 237
-- Name: esa_respuesta_res_id_seq; Type: SEQUENCE SET; Schema: esamyn; Owner: esamyn_user
--

SELECT pg_catalog.setval('esa_respuesta_res_id_seq', 2996, true);


--
-- TOC entry 3235 (class 0 OID 16905)
-- Dependencies: 238
-- Data for Name: esa_rol; Type: TABLE DATA; Schema: esamyn; Owner: esamyn_user
--

COPY esa_rol (rol_id, rol_nombre) FROM stdin;
1	Administrador
2	Supervisor
3	Operador
\.


--
-- TOC entry 3290 (class 0 OID 0)
-- Dependencies: 239
-- Name: esa_rol_rol_id_seq; Type: SEQUENCE SET; Schema: esamyn; Owner: esamyn_user
--

SELECT pg_catalog.setval('esa_rol_rol_id_seq', 3, true);


--
-- TOC entry 3237 (class 0 OID 16913)
-- Dependencies: 240
-- Data for Name: esa_tipo_grupo_parametro; Type: TABLE DATA; Schema: esamyn; Owner: esamyn_user
--

COPY esa_tipo_grupo_parametro (tgp_id, tgp_texto) FROM stdin;
\.


--
-- TOC entry 3291 (class 0 OID 0)
-- Dependencies: 241
-- Name: esa_tipo_grupo_parametro_tgp_id_seq; Type: SEQUENCE SET; Schema: esamyn; Owner: esamyn_user
--

SELECT pg_catalog.setval('esa_tipo_grupo_parametro_tgp_id_seq', 1, false);


--
-- TOC entry 3239 (class 0 OID 16922)
-- Dependencies: 242
-- Data for Name: esa_tipo_pregunta; Type: TABLE DATA; Schema: esamyn; Owner: esamyn_user
--

COPY esa_tipo_pregunta (tpp_id, tpp_clave, tpp_etiqueta) FROM stdin;
\.


--
-- TOC entry 3292 (class 0 OID 0)
-- Dependencies: 243
-- Name: esa_tipo_pregunta_tpp_id_seq; Type: SEQUENCE SET; Schema: esamyn; Owner: esamyn_user
--

SELECT pg_catalog.setval('esa_tipo_pregunta_tpp_id_seq', 1, false);


--
-- TOC entry 3241 (class 0 OID 16930)
-- Dependencies: 244
-- Data for Name: esa_usuario; Type: TABLE DATA; Schema: esamyn; Owner: esamyn_user
--

COPY esa_usuario (usu_id, usu_creado, usu_modificado, usu_rol, usu_nombres, usu_apellidos, usu_username, usu_password, usu_bloqueado, usu_cedula, usu_telefono, usu_correo_eletronico, usu_fecha_ingreso, usu_sesion) FROM stdin;
2	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	1	Admin	Istrator	1713175071	81dc9bdb52d04dc20036dbd8313ed055	0	1713175071	0982345678	edgar.valarezo@gmail.com	2017-08-21 19:11:27.753216+00	\N
3	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	3	Ope	Rador	1753156643	81dc9bdb52d04dc20036dbd8313ed055	0	1753156643	022345678	edgar.valarezo@gmail.com	2017-08-21 19:11:27.753216+00	\N
1	2017-07-20 14:36:22.557893+00	2017-07-20 14:36:22.557893+00	2	Sup	Ervisor	1716187206	81dc9bdb52d04dc20036dbd8313ed055	0	1716187206	0997654365	edgar.valarezo@gmail.com	2017-08-21 19:11:27.753216+00	2oU+UIs9uqz5eC5pN221I3mIBTUviIjJC1SV4hlHdLA=
\.


--
-- TOC entry 3293 (class 0 OID 0)
-- Dependencies: 245
-- Name: esa_usuario_usu_id_seq; Type: SEQUENCE SET; Schema: esamyn; Owner: esamyn_user
--

SELECT pg_catalog.setval('esa_usuario_usu_id_seq', 3, true);


--
-- TOC entry 3243 (class 0 OID 16941)
-- Dependencies: 246
-- Data for Name: esa_verificador; Type: TABLE DATA; Schema: esamyn; Owner: esamyn_user
--

COPY esa_verificador (ver_id, ver_creado, ver_modificado, ver_evaluacion, ver_parametro, ver_cumple, ver_no_aplica, ver_cantidad_medidas, ver_cumple_condicion_no_aplica) FROM stdin;
\.


--
-- TOC entry 3294 (class 0 OID 0)
-- Dependencies: 247
-- Name: esa_verificador_ver_id_seq; Type: SEQUENCE SET; Schema: esamyn; Owner: esamyn_user
--

SELECT pg_catalog.setval('esa_verificador_ver_id_seq', 1, false);


--
-- TOC entry 3034 (class 2606 OID 16969)
-- Name: esa_canton_pkey; Type: CONSTRAINT; Schema: esamyn; Owner: esamyn_user
--

ALTER TABLE ONLY esa_canton
    ADD CONSTRAINT esa_canton_pkey PRIMARY KEY (can_id);


--
-- TOC entry 3078 (class 2606 OID 17516)
-- Name: esa_catalogo_pkey; Type: CONSTRAINT; Schema: esamyn; Owner: esamyn_user
--

ALTER TABLE ONLY esa_catalogo
    ADD CONSTRAINT esa_catalogo_pkey PRIMARY KEY (cat_id);


--
-- TOC entry 3036 (class 2606 OID 16971)
-- Name: esa_condicion_pkey; Type: CONSTRAINT; Schema: esamyn; Owner: esamyn_user
--

ALTER TABLE ONLY esa_condicion_no_aplica
    ADD CONSTRAINT esa_condicion_pkey PRIMARY KEY (cna_id);


--
-- TOC entry 3074 (class 2606 OID 17216)
-- Name: esa_cumple_condicion_na_pkey; Type: CONSTRAINT; Schema: esamyn; Owner: esamyn_user
--

ALTER TABLE ONLY esa_cumple_condicion_no_aplica
    ADD CONSTRAINT esa_cumple_condicion_na_pkey PRIMARY KEY (ccn_id);


--
-- TOC entry 3038 (class 2606 OID 16973)
-- Name: esa_encuesta_pkey; Type: CONSTRAINT; Schema: esamyn; Owner: esamyn_user
--

ALTER TABLE ONLY esa_encuesta
    ADD CONSTRAINT esa_encuesta_pkey PRIMARY KEY (enc_id);


--
-- TOC entry 3041 (class 2606 OID 16975)
-- Name: esa_establecimiento_salud_pkey; Type: CONSTRAINT; Schema: esamyn; Owner: esamyn_user
--

ALTER TABLE ONLY esa_establecimiento_salud
    ADD CONSTRAINT esa_establecimiento_salud_pkey PRIMARY KEY (ess_id);


--
-- TOC entry 3043 (class 2606 OID 16977)
-- Name: esa_evaluacion_pkey; Type: CONSTRAINT; Schema: esamyn; Owner: esamyn_user
--

ALTER TABLE ONLY esa_evaluacion
    ADD CONSTRAINT esa_evaluacion_pkey PRIMARY KEY (eva_id);


--
-- TOC entry 3045 (class 2606 OID 16979)
-- Name: esa_formulario_pkey; Type: CONSTRAINT; Schema: esamyn; Owner: esamyn_user
--

ALTER TABLE ONLY esa_formulario
    ADD CONSTRAINT esa_formulario_pkey PRIMARY KEY (frm_id);


--
-- TOC entry 3047 (class 2606 OID 16981)
-- Name: esa_grupo_parametro_pkey; Type: CONSTRAINT; Schema: esamyn; Owner: esamyn_user
--

ALTER TABLE ONLY esa_grupo_parametro
    ADD CONSTRAINT esa_grupo_parametro_pkey PRIMARY KEY (gpa_id);


--
-- TOC entry 3049 (class 2606 OID 16983)
-- Name: esa_parametro_pkey; Type: CONSTRAINT; Schema: esamyn; Owner: esamyn_user
--

ALTER TABLE ONLY esa_parametro
    ADD CONSTRAINT esa_parametro_pkey PRIMARY KEY (par_id);


--
-- TOC entry 3070 (class 2606 OID 17231)
-- Name: esa_parametro_pregunta_pkey; Type: CONSTRAINT; Schema: esamyn; Owner: esamyn_user
--

ALTER TABLE ONLY esa_parametro_pregunta
    ADD CONSTRAINT esa_parametro_pregunta_pkey PRIMARY KEY (ppr_id);


--
-- TOC entry 3051 (class 2606 OID 16985)
-- Name: esa_persona_juridica_pkey; Type: CONSTRAINT; Schema: esamyn; Owner: esamyn_user
--

ALTER TABLE ONLY esa_persona_juridica
    ADD CONSTRAINT esa_persona_juridica_pkey PRIMARY KEY (pju_id);


--
-- TOC entry 3053 (class 2606 OID 16987)
-- Name: esa_pregunta_pkey; Type: CONSTRAINT; Schema: esamyn; Owner: esamyn_user
--

ALTER TABLE ONLY esa_pregunta
    ADD CONSTRAINT esa_pregunta_pkey PRIMARY KEY (prg_id);


--
-- TOC entry 3055 (class 2606 OID 16989)
-- Name: esa_provincia_pkey; Type: CONSTRAINT; Schema: esamyn; Owner: esamyn_user
--

ALTER TABLE ONLY esa_provincia
    ADD CONSTRAINT esa_provincia_pkey PRIMARY KEY (pro_id);


--
-- TOC entry 3057 (class 2606 OID 16991)
-- Name: esa_respuesta_pkey; Type: CONSTRAINT; Schema: esamyn; Owner: esamyn_user
--

ALTER TABLE ONLY esa_respuesta
    ADD CONSTRAINT esa_respuesta_pkey PRIMARY KEY (res_id);


--
-- TOC entry 3059 (class 2606 OID 16993)
-- Name: esa_rol_pkey; Type: CONSTRAINT; Schema: esamyn; Owner: esamyn_user
--

ALTER TABLE ONLY esa_rol
    ADD CONSTRAINT esa_rol_pkey PRIMARY KEY (rol_id);


--
-- TOC entry 3061 (class 2606 OID 16995)
-- Name: esa_tipo_grupo_parametro_pkey; Type: CONSTRAINT; Schema: esamyn; Owner: esamyn_user
--

ALTER TABLE ONLY esa_tipo_grupo_parametro
    ADD CONSTRAINT esa_tipo_grupo_parametro_pkey PRIMARY KEY (tgp_id);


--
-- TOC entry 3063 (class 2606 OID 16997)
-- Name: esa_tipo_pregunta_pkey; Type: CONSTRAINT; Schema: esamyn; Owner: esamyn_user
--

ALTER TABLE ONLY esa_tipo_pregunta
    ADD CONSTRAINT esa_tipo_pregunta_pkey PRIMARY KEY (tpp_id);


--
-- TOC entry 3065 (class 2606 OID 16999)
-- Name: esa_usuario_pkey; Type: CONSTRAINT; Schema: esamyn; Owner: esamyn_user
--

ALTER TABLE ONLY esa_usuario
    ADD CONSTRAINT esa_usuario_pkey PRIMARY KEY (usu_id);


--
-- TOC entry 3067 (class 2606 OID 17001)
-- Name: esa_verificador_pkey; Type: CONSTRAINT; Schema: esamyn; Owner: esamyn_user
--

ALTER TABLE ONLY esa_verificador
    ADD CONSTRAINT esa_verificador_pkey PRIMARY KEY (ver_id);


--
-- TOC entry 3075 (class 1259 OID 17190)
-- Name: fki_fk_ccn_condicion_na; Type: INDEX; Schema: esamyn; Owner: esamyn_user
--

CREATE INDEX fki_fk_ccn_condicion_na ON esa_cumple_condicion_no_aplica USING btree (ccn_condicion_no_aplica);


--
-- TOC entry 3076 (class 1259 OID 17202)
-- Name: fki_fk_ccn_evaluacion; Type: INDEX; Schema: esamyn; Owner: esamyn_user
--

CREATE INDEX fki_fk_ccn_evaluacion ON esa_cumple_condicion_no_aplica USING btree (ccn_evaluacion);


--
-- TOC entry 3039 (class 1259 OID 17522)
-- Name: fki_fk_enc_establecimiento_salud; Type: INDEX; Schema: esamyn; Owner: esamyn_user
--

CREATE INDEX fki_fk_enc_establecimiento_salud ON esa_encuesta USING btree (enc_establecimiento_salud);


--
-- TOC entry 3071 (class 1259 OID 17238)
-- Name: fki_fk_ppr_parametro; Type: INDEX; Schema: esamyn; Owner: esamyn_user
--

CREATE INDEX fki_fk_ppr_parametro ON esa_parametro_pregunta USING btree (ppr_parametro);


--
-- TOC entry 3072 (class 1259 OID 17250)
-- Name: fki_fk_ppr_pregunta; Type: INDEX; Schema: esamyn; Owner: esamyn_user
--

CREATE INDEX fki_fk_ppr_pregunta ON esa_parametro_pregunta USING btree (ppr_pregunta);


--
-- TOC entry 3068 (class 1259 OID 17179)
-- Name: fki_fk_ver_cumple_condicion_na; Type: INDEX; Schema: esamyn; Owner: esamyn_user
--

CREATE INDEX fki_fk_ver_cumple_condicion_na ON esa_verificador USING btree (ver_cumple_condicion_no_aplica);


--
-- TOC entry 3079 (class 2606 OID 17492)
-- Name: esa_canton_can_provincia_fkey; Type: FK CONSTRAINT; Schema: esamyn; Owner: esamyn_user
--

ALTER TABLE ONLY esa_canton
    ADD CONSTRAINT esa_canton_can_provincia_fkey FOREIGN KEY (can_provincia) REFERENCES esa_provincia(pro_id);


--
-- TOC entry 3082 (class 2606 OID 17480)
-- Name: esa_encuesta_enc_evaluacion_fkey; Type: FK CONSTRAINT; Schema: esamyn; Owner: esamyn_user
--

ALTER TABLE ONLY esa_encuesta
    ADD CONSTRAINT esa_encuesta_enc_evaluacion_fkey FOREIGN KEY (enc_evaluacion) REFERENCES esa_evaluacion(eva_id);


--
-- TOC entry 3080 (class 2606 OID 17456)
-- Name: esa_encuesta_enc_formulario_fkey; Type: FK CONSTRAINT; Schema: esamyn; Owner: esamyn_user
--

ALTER TABLE ONLY esa_encuesta
    ADD CONSTRAINT esa_encuesta_enc_formulario_fkey FOREIGN KEY (enc_formulario) REFERENCES esa_formulario(frm_id);


--
-- TOC entry 3081 (class 2606 OID 17468)
-- Name: esa_encuesta_enc_usuario_fkey; Type: FK CONSTRAINT; Schema: esamyn; Owner: esamyn_user
--

ALTER TABLE ONLY esa_encuesta
    ADD CONSTRAINT esa_encuesta_enc_usuario_fkey FOREIGN KEY (enc_usuario) REFERENCES esa_usuario(usu_id);


--
-- TOC entry 3084 (class 2606 OID 17431)
-- Name: esa_establecimiento_salud_ess_canton_fkey; Type: FK CONSTRAINT; Schema: esamyn; Owner: esamyn_user
--

ALTER TABLE ONLY esa_establecimiento_salud
    ADD CONSTRAINT esa_establecimiento_salud_ess_canton_fkey FOREIGN KEY (ess_canton) REFERENCES esa_canton(can_id);


--
-- TOC entry 3085 (class 2606 OID 17443)
-- Name: esa_establecimiento_salud_ess_persona_juridica_fkey; Type: FK CONSTRAINT; Schema: esamyn; Owner: esamyn_user
--

ALTER TABLE ONLY esa_establecimiento_salud
    ADD CONSTRAINT esa_establecimiento_salud_ess_persona_juridica_fkey FOREIGN KEY (ess_persona_juridica) REFERENCES esa_persona_juridica(pju_id);


--
-- TOC entry 3087 (class 2606 OID 17419)
-- Name: esa_evaluacion_eva_establecimiento_salud_fkey; Type: FK CONSTRAINT; Schema: esamyn; Owner: esamyn_user
--

ALTER TABLE ONLY esa_evaluacion
    ADD CONSTRAINT esa_evaluacion_eva_establecimiento_salud_fkey FOREIGN KEY (eva_establecimiento_salud) REFERENCES esa_establecimiento_salud(ess_id);


--
-- TOC entry 3086 (class 2606 OID 17407)
-- Name: esa_evaluacion_eva_usuario_fkey; Type: FK CONSTRAINT; Schema: esamyn; Owner: esamyn_user
--

ALTER TABLE ONLY esa_evaluacion
    ADD CONSTRAINT esa_evaluacion_eva_usuario_fkey FOREIGN KEY (eva_usuario) REFERENCES esa_usuario(usu_id);


--
-- TOC entry 3088 (class 2606 OID 17383)
-- Name: esa_grupo_parametro_gpa_padre_fkey; Type: FK CONSTRAINT; Schema: esamyn; Owner: esamyn_user
--

ALTER TABLE ONLY esa_grupo_parametro
    ADD CONSTRAINT esa_grupo_parametro_gpa_padre_fkey FOREIGN KEY (gpa_padre) REFERENCES esa_grupo_parametro(gpa_id);


--
-- TOC entry 3089 (class 2606 OID 17395)
-- Name: esa_grupo_parametro_gpa_tipo_grupo_parametro_fkey; Type: FK CONSTRAINT; Schema: esamyn; Owner: esamyn_user
--

ALTER TABLE ONLY esa_grupo_parametro
    ADD CONSTRAINT esa_grupo_parametro_gpa_tipo_grupo_parametro_fkey FOREIGN KEY (gpa_tipo_grupo_parametro) REFERENCES esa_tipo_grupo_parametro(tgp_id);


--
-- TOC entry 3091 (class 2606 OID 17371)
-- Name: esa_parametro_par_condicion_fkey; Type: FK CONSTRAINT; Schema: esamyn; Owner: esamyn_user
--

ALTER TABLE ONLY esa_parametro
    ADD CONSTRAINT esa_parametro_par_condicion_fkey FOREIGN KEY (par_condicion_no_aplica) REFERENCES esa_condicion_no_aplica(cna_id);


--
-- TOC entry 3090 (class 2606 OID 17359)
-- Name: esa_parametro_par_grupo_parametro_fkey; Type: FK CONSTRAINT; Schema: esamyn; Owner: esamyn_user
--

ALTER TABLE ONLY esa_parametro
    ADD CONSTRAINT esa_parametro_par_grupo_parametro_fkey FOREIGN KEY (par_grupo_parametro) REFERENCES esa_grupo_parametro(gpa_id);


--
-- TOC entry 3094 (class 2606 OID 17346)
-- Name: esa_pregunta_prg_formulario_fkey; Type: FK CONSTRAINT; Schema: esamyn; Owner: esamyn_user
--

ALTER TABLE ONLY esa_pregunta
    ADD CONSTRAINT esa_pregunta_prg_formulario_fkey FOREIGN KEY (prg_formulario) REFERENCES esa_formulario(frm_id);


--
-- TOC entry 3092 (class 2606 OID 17322)
-- Name: esa_pregunta_prg_padre_fkey; Type: FK CONSTRAINT; Schema: esamyn; Owner: esamyn_user
--

ALTER TABLE ONLY esa_pregunta
    ADD CONSTRAINT esa_pregunta_prg_padre_fkey FOREIGN KEY (prg_padre) REFERENCES esa_pregunta(prg_id);


--
-- TOC entry 3093 (class 2606 OID 17334)
-- Name: esa_pregunta_prg_tipo_pregunta_fkey; Type: FK CONSTRAINT; Schema: esamyn; Owner: esamyn_user
--

ALTER TABLE ONLY esa_pregunta
    ADD CONSTRAINT esa_pregunta_prg_tipo_pregunta_fkey FOREIGN KEY (prg_tipo_pregunta) REFERENCES esa_tipo_pregunta(tpp_id);


--
-- TOC entry 3096 (class 2606 OID 17310)
-- Name: esa_respuesta_res_encuesta_fkey; Type: FK CONSTRAINT; Schema: esamyn; Owner: esamyn_user
--

ALTER TABLE ONLY esa_respuesta
    ADD CONSTRAINT esa_respuesta_res_encuesta_fkey FOREIGN KEY (res_encuesta) REFERENCES esa_encuesta(enc_id);


--
-- TOC entry 3095 (class 2606 OID 17298)
-- Name: esa_respuesta_res_pregunta_fkey; Type: FK CONSTRAINT; Schema: esamyn; Owner: esamyn_user
--

ALTER TABLE ONLY esa_respuesta
    ADD CONSTRAINT esa_respuesta_res_pregunta_fkey FOREIGN KEY (res_pregunta) REFERENCES esa_pregunta(prg_id);


--
-- TOC entry 3097 (class 2606 OID 17286)
-- Name: esa_usuario_usu_rol_fkey; Type: FK CONSTRAINT; Schema: esamyn; Owner: esamyn_user
--

ALTER TABLE ONLY esa_usuario
    ADD CONSTRAINT esa_usuario_usu_rol_fkey FOREIGN KEY (usu_rol) REFERENCES esa_rol(rol_id);


--
-- TOC entry 3099 (class 2606 OID 17266)
-- Name: esa_verificador_ver_evaluacion_fkey; Type: FK CONSTRAINT; Schema: esamyn; Owner: esamyn_user
--

ALTER TABLE ONLY esa_verificador
    ADD CONSTRAINT esa_verificador_ver_evaluacion_fkey FOREIGN KEY (ver_evaluacion) REFERENCES esa_evaluacion(eva_id);


--
-- TOC entry 3100 (class 2606 OID 17276)
-- Name: esa_verificador_ver_parametro_fkey; Type: FK CONSTRAINT; Schema: esamyn; Owner: esamyn_user
--

ALTER TABLE ONLY esa_verificador
    ADD CONSTRAINT esa_verificador_ver_parametro_fkey FOREIGN KEY (ver_parametro) REFERENCES esa_parametro(par_id);


--
-- TOC entry 3103 (class 2606 OID 17191)
-- Name: fk_ccn_condicion_na; Type: FK CONSTRAINT; Schema: esamyn; Owner: esamyn_user
--

ALTER TABLE ONLY esa_cumple_condicion_no_aplica
    ADD CONSTRAINT fk_ccn_condicion_na FOREIGN KEY (ccn_condicion_no_aplica) REFERENCES esa_condicion_no_aplica(cna_id);


--
-- TOC entry 3104 (class 2606 OID 17203)
-- Name: fk_ccn_evaluacion; Type: FK CONSTRAINT; Schema: esamyn; Owner: esamyn_user
--

ALTER TABLE ONLY esa_cumple_condicion_no_aplica
    ADD CONSTRAINT fk_ccn_evaluacion FOREIGN KEY (ccn_evaluacion) REFERENCES esa_evaluacion(eva_id);


--
-- TOC entry 3083 (class 2606 OID 17517)
-- Name: fk_enc_establecimiento_salud; Type: FK CONSTRAINT; Schema: esamyn; Owner: esamyn_user
--

ALTER TABLE ONLY esa_encuesta
    ADD CONSTRAINT fk_enc_establecimiento_salud FOREIGN KEY (enc_establecimiento_salud) REFERENCES esa_establecimiento_salud(ess_id);


--
-- TOC entry 3101 (class 2606 OID 17239)
-- Name: fk_ppr_parametro; Type: FK CONSTRAINT; Schema: esamyn; Owner: esamyn_user
--

ALTER TABLE ONLY esa_parametro_pregunta
    ADD CONSTRAINT fk_ppr_parametro FOREIGN KEY (ppr_parametro) REFERENCES esa_parametro(par_id);


--
-- TOC entry 3102 (class 2606 OID 17251)
-- Name: fk_ppr_pregunta; Type: FK CONSTRAINT; Schema: esamyn; Owner: esamyn_user
--

ALTER TABLE ONLY esa_parametro_pregunta
    ADD CONSTRAINT fk_ppr_pregunta FOREIGN KEY (ppr_pregunta) REFERENCES esa_pregunta(prg_id);


--
-- TOC entry 3098 (class 2606 OID 17217)
-- Name: fk_ver_cumple_condicion_na; Type: FK CONSTRAINT; Schema: esamyn; Owner: esamyn_user
--

ALTER TABLE ONLY esa_verificador
    ADD CONSTRAINT fk_ver_cumple_condicion_na FOREIGN KEY (ver_cumple_condicion_no_aplica) REFERENCES esa_cumple_condicion_no_aplica(ccn_id);


-- Completed on 2017-08-28 22:20:42

--
-- PostgreSQL database dump complete
--

