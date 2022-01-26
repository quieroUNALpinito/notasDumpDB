--
-- PostgreSQL database dump
--

-- Dumped from database version 13.4
-- Dumped by pg_dump version 14.0

-- Started on 2022-01-26 18:41:23

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
-- TOC entry 3 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: azure_pg_admin
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO azure_pg_admin;

--
-- TOC entry 3719 (class 0 OID 0)
-- Dependencies: 3
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: azure_pg_admin
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- TOC entry 200 (class 1259 OID 24834)
-- Name: attendee_event; Type: SEQUENCE; Schema: public; Owner: AdminIS2
--

CREATE SEQUENCE public.attendee_event
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.attendee_event OWNER TO "AdminIS2";

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 201 (class 1259 OID 24836)
-- Name: AsistentesEvento; Type: TABLE; Schema: public; Owner: AdminIS2
--

CREATE TABLE public."AsistentesEvento" (
    "ID" numeric DEFAULT nextval('public.attendee_event'::regclass) NOT NULL,
    "ID_evento" numeric,
    "ID_usuario" numeric,
    "Notificaciones" boolean,
    "Confirmacion" boolean
);


ALTER TABLE public."AsistentesEvento" OWNER TO "AdminIS2";

--
-- TOC entry 202 (class 1259 OID 24843)
-- Name: CategoriaGrupo; Type: TABLE; Schema: public; Owner: AdminIS2
--

CREATE TABLE public."CategoriaGrupo" (
    "ID" numeric NOT NULL,
    "Nombre" character varying
);


ALTER TABLE public."CategoriaGrupo" OWNER TO "AdminIS2";

--
-- TOC entry 203 (class 1259 OID 24849)
-- Name: event_id_seq; Type: SEQUENCE; Schema: public; Owner: AdminIS2
--

CREATE SEQUENCE public.event_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.event_id_seq OWNER TO "AdminIS2";

--
-- TOC entry 204 (class 1259 OID 24851)
-- Name: Evento; Type: TABLE; Schema: public; Owner: AdminIS2
--

CREATE TABLE public."Evento" (
    "ID" numeric DEFAULT nextval('public.event_id_seq'::regclass) NOT NULL,
    "Nombre" character varying,
    "Descripcion" character varying,
    "Imagen" character varying,
    "ID_TipoEvento" numeric,
    "Hora" timestamp without time zone,
    "Duracion" time without time zone,
    "Presencial" boolean,
    "LugarOficial" boolean,
    "ID_lugarOficial" numeric,
    "NombreUbicacion" character varying,
    "CoordenadasUbicacion" point,
    "ID_creador" numeric,
    "ID_grupo" numeric,
    "Recurrente" boolean,
    "Privado" boolean DEFAULT false
);


ALTER TABLE public."Evento" OWNER TO "AdminIS2";

--
-- TOC entry 205 (class 1259 OID 24859)
-- Name: group_id_seq; Type: SEQUENCE; Schema: public; Owner: AdminIS2
--

CREATE SEQUENCE public.group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.group_id_seq OWNER TO "AdminIS2";

--
-- TOC entry 206 (class 1259 OID 24861)
-- Name: Grupo; Type: TABLE; Schema: public; Owner: AdminIS2
--

CREATE TABLE public."Grupo" (
    "ID" numeric DEFAULT nextval('public.group_id_seq'::regclass) NOT NULL,
    "ID_CategoriaGrupo" numeric,
    "Nombre" character varying,
    "Descripcion" character varying,
    "Oficial" boolean,
    "Privado" boolean DEFAULT false
);


ALTER TABLE public."Grupo" OWNER TO "AdminIS2";

--
-- TOC entry 207 (class 1259 OID 24869)
-- Name: Lugar; Type: TABLE; Schema: public; Owner: AdminIS2
--

CREATE TABLE public."Lugar" (
    "ID" numeric NOT NULL,
    "Nombre" character varying,
    "Edificio" character varying,
    "Coordenadas" point
);


ALTER TABLE public."Lugar" OWNER TO "AdminIS2";

--
-- TOC entry 208 (class 1259 OID 24875)
-- Name: Permiso; Type: TABLE; Schema: public; Owner: AdminIS2
--

CREATE TABLE public."Permiso" (
    "ID" numeric NOT NULL,
    "Nombre" character varying,
    "Descripcion" character varying
);


ALTER TABLE public."Permiso" OWNER TO "AdminIS2";

--
-- TOC entry 209 (class 1259 OID 24881)
-- Name: permission_user_id_seq; Type: SEQUENCE; Schema: public; Owner: AdminIS2
--

CREATE SEQUENCE public.permission_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.permission_user_id_seq OWNER TO "AdminIS2";

--
-- TOC entry 210 (class 1259 OID 24883)
-- Name: PermisosUsuario; Type: TABLE; Schema: public; Owner: AdminIS2
--

CREATE TABLE public."PermisosUsuario" (
    "ID" numeric DEFAULT nextval('public.permission_user_id_seq'::regclass) NOT NULL,
    "ID_usuario" numeric,
    "ID_permiso" numeric
);


ALTER TABLE public."PermisosUsuario" OWNER TO "AdminIS2";

--
-- TOC entry 211 (class 1259 OID 24890)
-- Name: PreferenciasEventoUsuario; Type: TABLE; Schema: public; Owner: AdminIS2
--

CREATE TABLE public."PreferenciasEventoUsuario" (
    "ID" numeric NOT NULL,
    "ID_usuario" numeric,
    "ID_TipoEvento" numeric
);


ALTER TABLE public."PreferenciasEventoUsuario" OWNER TO "AdminIS2";

--
-- TOC entry 212 (class 1259 OID 24896)
-- Name: Recurso; Type: TABLE; Schema: public; Owner: AdminIS2
--

CREATE TABLE public."Recurso" (
    "ID" numeric NOT NULL,
    nombre character varying,
    "CantidadTotal" numeric,
    "CantidadOcupados" numeric,
    "Facultad" character varying
);


ALTER TABLE public."Recurso" OWNER TO "AdminIS2";

--
-- TOC entry 213 (class 1259 OID 24902)
-- Name: TipoEvento; Type: TABLE; Schema: public; Owner: AdminIS2
--

CREATE TABLE public."TipoEvento" (
    "ID" numeric NOT NULL,
    "Nombre" character varying
);


ALTER TABLE public."TipoEvento" OWNER TO "AdminIS2";

--
-- TOC entry 214 (class 1259 OID 24908)
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: AdminIS2
--

CREATE SEQUENCE public.user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_id_seq OWNER TO "AdminIS2";

--
-- TOC entry 215 (class 1259 OID 24910)
-- Name: Usuario; Type: TABLE; Schema: public; Owner: AdminIS2
--

CREATE TABLE public."Usuario" (
    "ID" numeric DEFAULT nextval('public.user_id_seq'::regclass) NOT NULL,
    "Nombres" character varying,
    "Apellidos" character varying,
    "Correo" character varying,
    "Descripcion" character varying,
    "Foto" character varying
);


ALTER TABLE public."Usuario" OWNER TO "AdminIS2";

--
-- TOC entry 216 (class 1259 OID 24923)
-- Name: users_group_id_seq; Type: SEQUENCE; Schema: public; Owner: AdminIS2
--

CREATE SEQUENCE public.users_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_group_id_seq OWNER TO "AdminIS2";

--
-- TOC entry 217 (class 1259 OID 24925)
-- Name: UsuariosGrupo; Type: TABLE; Schema: public; Owner: AdminIS2
--

CREATE TABLE public."UsuariosGrupo" (
    "ID" numeric DEFAULT nextval('public.users_group_id_seq'::regclass) NOT NULL,
    "ID_usuario" numeric,
    "ID_grupo" numeric,
    "ID_permiso" numeric,
    "Notificaciones" character varying
);


ALTER TABLE public."UsuariosGrupo" OWNER TO "AdminIS2";

--
-- TOC entry 3697 (class 0 OID 24836)
-- Dependencies: 201
-- Data for Name: AsistentesEvento; Type: TABLE DATA; Schema: public; Owner: AdminIS2
--

INSERT INTO public."AsistentesEvento" VALUES (1, 15, 3, true, true);
INSERT INTO public."AsistentesEvento" VALUES (2, 12, 5, true, true);
INSERT INTO public."AsistentesEvento" VALUES (3, 10, 5, true, true);
INSERT INTO public."AsistentesEvento" VALUES (4, 20, 7, true, true);
INSERT INTO public."AsistentesEvento" VALUES (6, 23, 8, false, true);
INSERT INTO public."AsistentesEvento" VALUES (5, 16, 8, false, true);
INSERT INTO public."AsistentesEvento" VALUES (8, 15, 8, false, true);
INSERT INTO public."AsistentesEvento" VALUES (9, 15, 2, true, true);
INSERT INTO public."AsistentesEvento" VALUES (10, 25, 2, true, true);
INSERT INTO public."AsistentesEvento" VALUES (11, 21, 8, true, true);
INSERT INTO public."AsistentesEvento" VALUES (13, 2, 2, true, true);


--
-- TOC entry 3698 (class 0 OID 24843)
-- Dependencies: 202
-- Data for Name: CategoriaGrupo; Type: TABLE DATA; Schema: public; Owner: AdminIS2
--

INSERT INTO public."CategoriaGrupo" VALUES (1, 'Deportes');
INSERT INTO public."CategoriaGrupo" VALUES (2, 'Semilleros');
INSERT INTO public."CategoriaGrupo" VALUES (3, 'Grupos de Estudio');
INSERT INTO public."CategoriaGrupo" VALUES (4, 'Ocio');


--
-- TOC entry 3700 (class 0 OID 24851)
-- Dependencies: 204
-- Data for Name: Evento; Type: TABLE DATA; Schema: public; Owner: AdminIS2
--

INSERT INTO public."Evento" VALUES (15, 'salida grupo ing soft', 'cuando vamos a salir?
', 'http://placeimg.com/640/480/animals', 2, '2022-02-11 19:00:44', '06:00:00', true, false, NULL, 'hemeroteca', NULL, 4, 12, false, false);
INSERT INTO public."Evento" VALUES (1, 'Actualizacion full', 'descricpcion', 'http://placeimg.com/640/480/any', 1, '2021-10-12 04:00:00', '01:00:00', false, true, 1, '', NULL, 5, NULL, false, false);
INSERT INTO public."Evento" VALUES (26, 'Futboll', 'ahora sip', NULL, 1, '2022-01-30 04:09:36', '02:00:00', true, false, NULL, 'lol', NULL, 5, NULL, false, false);
INSERT INTO public."Evento" VALUES (13, 'asdadad', 'adasdasdadas', 'http://placeimg.com/640/480/grayscale', 2, '2021-12-01 00:40:01', '01:00:00', true, true, 4, NULL, NULL, 2, NULL, true, false);
INSERT INTO public."Evento" VALUES (7, 'adasad', 'adsdsadas', 'http://placeimg.com/640/480/grayscale', 2, '2021-11-30 21:00:40', '02:00:00', false, NULL, NULL, NULL, NULL, 4, 13, true, true);
INSERT INTO public."Evento" VALUES (9, 'prueba ubicacion relativa', 'asdadsda', 'http://placeimg.com/640/480/tech', 1, '2021-11-30 21:11:13', '03:00:00', true, false, NULL, 'frente al viejo', NULL, 2, NULL, true, true);
INSERT INTO public."Evento" VALUES (14, 'actualización', 'descripción actualizada', 'http://placeimg.com/640/480/sepia', NULL, '2021-12-01 01:37:38', '02:00:00', false, NULL, NULL, NULL, NULL, 3, 5, false, false);
INSERT INTO public."Evento" VALUES (12, 'test evento actualizado', '', 'http://placeimg.com/640/480/people', 2, '2021-11-30 20:00:35', '01:00:00', true, false, NULL, '', NULL, 5, NULL, true, false);
INSERT INTO public."Evento" VALUES (2, 'qweqewqew', 'asdadsdad', 'http://placeimg.com/640/480/arch', 1, '2022-02-12 10:00:00', '01:00:00', false, NULL, NULL, NULL, NULL, 3, 5, true, true);
INSERT INTO public."Evento" VALUES (3, 'asdadadasd', 'asdasdasdadsad', 'http://placeimg.com/640/480/natuare', 1, '2022-02-03 02:00:40', '01:00:00', false, NULL, NULL, NULL, NULL, 4, 12, false, false);
INSERT INTO public."Evento" VALUES (5, 'parangacutirimicuaro', 'qweqweqeqweqewqeqeweqwe', 'http://placeimg.com/640/480/people', 2, '2022-02-13 11:00:40', '01:00:00', false, NULL, NULL, NULL, NULL, 2, 13, true, true);
INSERT INTO public."Evento" VALUES (6, 'ttttttttttttttttttttttttttttttt', 'tttyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy', 'http://placeimg.com/640/480/tech', 2, '2022-02-23 15:00:40', '01:00:00', false, NULL, NULL, NULL, NULL, 3, 13, true, true);
INSERT INTO public."Evento" VALUES (8, 'prueba no presencial actualizada', 'Descripción de la prueba con id 8', 'http://placeimg.com/640/480/sepia', 1, '2021-12-01 12:07:08', '02:00:00', false, NULL, NULL, NULL, NULL, 5, NULL, false, false);
INSERT INTO public."Evento" VALUES (4, 'prueba 2', 'no que no', 'http://placeimg.com/640/480/animals', 2, '2022-02-10 17:00:40', '01:00:00', false, NULL, NULL, NULL, NULL, 5, 12, false, false);
INSERT INTO public."Evento" VALUES (20, 'feliz cumple :d', 'hoy es el', 'http://placeimg.com/640/480/any', 3, '2022-01-28 23:22:21', '02:00:00', false, NULL, NULL, NULL, NULL, 2, NULL, true, false);
INSERT INTO public."Evento" VALUES (16, 'prueba privacidad 1', 'prueba privacidad 11', 'http://placeimg.com/640/480/any', 1, '2022-01-31 23:43:46', '01:00:00', true, false, NULL, 'lugar prueba privacidad 1', NULL, 6, 11, false, false);
INSERT INTO public."Evento" VALUES (17, 'prueba privacidad 2', 'prueba privacidad 22', 'http://placeimg.com/640/480/any', 3, '2022-01-31 00:06:35', '01:00:00', false, NULL, NULL, NULL, NULL, 6, 11, false, true);
INSERT INTO public."Evento" VALUES (18, 'prueba privacidad 3', 'prueba privacidad 3', 'http://placeimg.com/640/480/any', 1, '2022-02-01 02:48:06', '01:00:00', false, NULL, NULL, NULL, NULL, 6, NULL, false, true);
INSERT INTO public."Evento" VALUES (19, 'sasdasd', 'asdasd', 'http://placeimg.com/640/480/any', 1, '2022-02-01 04:03:23', '01:00:00', false, NULL, NULL, NULL, NULL, 6, NULL, false, true);
INSERT INTO public."Evento" VALUES (10, 'test lugar oficial', 'asdasda', 'http://placeimg.com/640/480/animals', 2, '2021-11-30 22:06:33', '04:00:00', true, true, 1, NULL, NULL, 3, NULL, false, false);
INSERT INTO public."Evento" VALUES (11, 'asdasdasd', 'asdasdd', 'http://placeimg.com/640/480/nature', 1, '2021-11-30 10:07:19', '01:00:00', true, true, 1, NULL, NULL, 4, NULL, false, false);
INSERT INTO public."Evento" VALUES (21, 'prueba antiguo', 'adasdadasddas', 'http://placeimg.com/640/480/any', 2, '2022-01-19 17:26:39', '01:00:00', false, NULL, NULL, NULL, NULL, 2, NULL, false, false);
INSERT INTO public."Evento" VALUES (22, 'prueba mas de 30 dias', 'asdadsd', 'http://placeimg.com/640/480/any', 1, '2021-11-17 17:27:09', '01:00:00', false, NULL, NULL, NULL, NULL, 2, NULL, false, false);
INSERT INTO public."Evento" VALUES (24, 'prueba prehistorica', 'asdasdasada', 'http://placeimg.com/640/480/any', 2, '2021-08-09 21:14:11', '01:00:00', false, NULL, NULL, NULL, NULL, 2, NULL, false, false);
INSERT INTO public."Evento" VALUES (25, 'prueba asistencia pasada', 'adssdd', 'http://placeimg.com/640/480/any', 2, '2022-01-24 21:15:51', '01:00:00', false, NULL, NULL, NULL, NULL, 2, NULL, false, false);
INSERT INTO public."Evento" VALUES (23, 'Colombia Peru', 'holas', 'http://placeimg.com/640/480/any', 2, '2022-01-28 22:38:15', '01:00:00', false, NULL, NULL, NULL, NULL, 7, NULL, false, false);


--
-- TOC entry 3702 (class 0 OID 24861)
-- Dependencies: 206
-- Data for Name: Grupo; Type: TABLE DATA; Schema: public; Owner: AdminIS2
--

INSERT INTO public."Grupo" VALUES (3, 4, 'Halo', 'dar bala', false, false);
INSERT INTO public."Grupo" VALUES (4, 1, 'canicas pro', 'maras salvatruchas', false, false);
INSERT INTO public."Grupo" VALUES (5, 1, 'la gasimba', 'dar pata como es!', true, false);
INSERT INTO public."Grupo" VALUES (6, 3, 'matematicas', 'estudiar para los parciales', true, false);
INSERT INTO public."Grupo" VALUES (7, 2, 'Deep Learning', 'Crear modelos bien melos', true, false);
INSERT INTO public."Grupo" VALUES (8, 2, 'Astronimia para todos', 'Mas cerca de las estrellas', true, false);
INSERT INTO public."Grupo" VALUES (9, 2, 'Bichos', 'ver bichos', true, false);
INSERT INTO public."Grupo" VALUES (10, 4, 'Fotografia', 'nos gustan las fotos', false, false);
INSERT INTO public."Grupo" VALUES (12, 3, 'pruebaPrivacidadEventos2', 'prueba de privacidad para el filtrado de eventos por grupo 2', false, false);
INSERT INTO public."Grupo" VALUES (13, 1, 'pruebaPrivacidadEventos3', 'prueba de privacidad para el filtrado de eventos por grupo 3', false, false);
INSERT INTO public."Grupo" VALUES (11, 4, 'pruebaPrivacidadEventos1', 'prueba de privacidad para el filtrado de eventos por grupo', false, true);
INSERT INTO public."Grupo" VALUES (14, 1, 'prueba25-01-2022', 'asdasdsad', true, false);
INSERT INTO public."Grupo" VALUES (15, 4, 'prueba25-01-2022-2', 'sdasdasd', true, false);
INSERT INTO public."Grupo" VALUES (16, 4, 'prueba25-01-2022-2', 'sdasdasd', true, false);
INSERT INTO public."Grupo" VALUES (17, 4, 'halo 2', 'halito', false, false);
INSERT INTO public."Grupo" VALUES (18, 4, 'halo2', 'asdasd', false, false);
INSERT INTO public."Grupo" VALUES (19, 1, 'Comandos Azules', 'mill8s', false, false);


--
-- TOC entry 3703 (class 0 OID 24869)
-- Dependencies: 207
-- Data for Name: Lugar; Type: TABLE DATA; Schema: public; Owner: AdminIS2
--

INSERT INTO public."Lugar" VALUES (2, 'auditorio A', 'Aulas de ingenieria', '(1,1)');
INSERT INTO public."Lugar" VALUES (3, 'auditorio B', 'Aulas de ingenieria', '(1,1)');
INSERT INTO public."Lugar" VALUES (4, 'Terraza', 'Ciencia y Tecnologia', '(1,1)');
INSERT INTO public."Lugar" VALUES (5, 'Biblioteca', 'Ciencia y Tecnologia', '(1,1)');
INSERT INTO public."Lugar" VALUES (1, 'Auditorio', 'Auditorio Leon de Greiff', '(1,1)');


--
-- TOC entry 3704 (class 0 OID 24875)
-- Dependencies: 208
-- Data for Name: Permiso; Type: TABLE DATA; Schema: public; Owner: AdminIS2
--

INSERT INTO public."Permiso" VALUES (1, 'Administrador', 'Admin');
INSERT INTO public."Permiso" VALUES (2, 'Miembro regular', 'Miembro sin permisos especiales');
INSERT INTO public."Permiso" VALUES (3, 'Solicitud', 'Solicitud pendiente');


--
-- TOC entry 3706 (class 0 OID 24883)
-- Dependencies: 210
-- Data for Name: PermisosUsuario; Type: TABLE DATA; Schema: public; Owner: AdminIS2
--

INSERT INTO public."PermisosUsuario" VALUES (1, 3, 1);
INSERT INTO public."PermisosUsuario" VALUES (2, 3, 1);
INSERT INTO public."PermisosUsuario" VALUES (3, 3, 1);
INSERT INTO public."PermisosUsuario" VALUES (4, 3, 1);
INSERT INTO public."PermisosUsuario" VALUES (5, 3, 1);
INSERT INTO public."PermisosUsuario" VALUES (6, 3, 1);
INSERT INTO public."PermisosUsuario" VALUES (7, 3, 1);
INSERT INTO public."PermisosUsuario" VALUES (8, 4, 1);
INSERT INTO public."PermisosUsuario" VALUES (9, 4, 1);
INSERT INTO public."PermisosUsuario" VALUES (10, 6, 1);
INSERT INTO public."PermisosUsuario" VALUES (11, 6, 1);
INSERT INTO public."PermisosUsuario" VALUES (12, 6, 1);
INSERT INTO public."PermisosUsuario" VALUES (13, 6, 1);
INSERT INTO public."PermisosUsuario" VALUES (14, 6, 1);
INSERT INTO public."PermisosUsuario" VALUES (15, 6, 1);
INSERT INTO public."PermisosUsuario" VALUES (16, 6, 1);
INSERT INTO public."PermisosUsuario" VALUES (17, 6, 1);
INSERT INTO public."PermisosUsuario" VALUES (18, 7, 1);


--
-- TOC entry 3707 (class 0 OID 24890)
-- Dependencies: 211
-- Data for Name: PreferenciasEventoUsuario; Type: TABLE DATA; Schema: public; Owner: AdminIS2
--



--
-- TOC entry 3708 (class 0 OID 24896)
-- Dependencies: 212
-- Data for Name: Recurso; Type: TABLE DATA; Schema: public; Owner: AdminIS2
--



--
-- TOC entry 3709 (class 0 OID 24902)
-- Dependencies: 213
-- Data for Name: TipoEvento; Type: TABLE DATA; Schema: public; Owner: AdminIS2
--

INSERT INTO public."TipoEvento" VALUES (1, 'Presentacion de tesis');
INSERT INTO public."TipoEvento" VALUES (2, 'Deportivo');
INSERT INTO public."TipoEvento" VALUES (3, 'Asamblea de sede');


--
-- TOC entry 3711 (class 0 OID 24910)
-- Dependencies: 215
-- Data for Name: Usuario; Type: TABLE DATA; Schema: public; Owner: AdminIS2
--

INSERT INTO public."Usuario" VALUES (2, 'Johan Sebastian', 'Romero Diaz', 'jsromerod@unal.edu.co', NULL, 'https://lh3.googleusercontent.com/a-/AOh14Gh6hv6vRH-uTZhuwdKQbWgfORGYeFkqwCgyEnyAVg=s96-c');
INSERT INTO public."Usuario" VALUES (4, 'Wilber', 'Lopez Murcia', 'wlopezm@unal.edu.co', NULL, 'https://lh3.googleusercontent.com/a-/AOh14GikPImZkxrK-cXrCJwAwLAzO0gFqpzPf9k8Am_Wmg=s96-c');
INSERT INTO public."Usuario" VALUES (3, 'Jorge Camilo', 'Colmenares Santos', 'jccolmenaress@unal.edu.co', 'me gusta jartar hp', 'https://lh3.googleusercontent.com/a-/AOh14Gj7gyGFje_zFkIngVa8Y_AluOJSXSz_qz3davpa=s96-c');
INSERT INTO public."Usuario" VALUES (5, 'Nicholson Stive', 'Ochoa Garcia', 'nsochoaga@unal.edu.co', 'Estudiante de Ingeniería de Sistemas que pierde el tiempo viendo anime.', 'https://lh3.googleusercontent.com/a-/AOh14Gj1Wr3t5oELzViVrWxSIDBE4jhS0HxjMxSEXhWCvQ=s96-c');
INSERT INTO public."Usuario" VALUES (6, 'Vinnie Giuliano', 'Mellizo Molina', 'vgmellizom@unal.edu.co', NULL, 'https://lh3.googleusercontent.com/a-/AOh14GgVTAYXwu7ULUSPCt89mB1LNfaLIEQkrCZvR0dCAQ=s96-c');
INSERT INTO public."Usuario" VALUES (7, 'Daniel Arturo', 'Moreno Rincon', 'damorenor@unal.edu.co', NULL, 'https://lh3.googleusercontent.com/a-/AOh14GjXsJmwnWeKX1r12qT79wkK0xV7DwD7dEyiUhOwFw=s96-c');
INSERT INTO public."Usuario" VALUES (8, 'Paula Alejandra', 'Cadena Espitia', 'pacadenae@unal.edu.co', NULL, 'https://lh3.googleusercontent.com/a/AATXAJyuG8XVCyPLD8Dy5Kbva3PC12h4RedKeamtT0qIyQ=s96-c');


--
-- TOC entry 3713 (class 0 OID 24925)
-- Dependencies: 217
-- Data for Name: UsuariosGrupo; Type: TABLE DATA; Schema: public; Owner: AdminIS2
--

INSERT INTO public."UsuariosGrupo" VALUES (1, 3, 3, 1, NULL);
INSERT INTO public."UsuariosGrupo" VALUES (2, 3, 4, 1, NULL);
INSERT INTO public."UsuariosGrupo" VALUES (3, 3, 5, 1, NULL);
INSERT INTO public."UsuariosGrupo" VALUES (4, 3, 6, 1, NULL);
INSERT INTO public."UsuariosGrupo" VALUES (5, 3, 7, 1, NULL);
INSERT INTO public."UsuariosGrupo" VALUES (6, 3, 8, 1, NULL);
INSERT INTO public."UsuariosGrupo" VALUES (7, 4, 9, 1, NULL);
INSERT INTO public."UsuariosGrupo" VALUES (8, 4, 10, 1, NULL);
INSERT INTO public."UsuariosGrupo" VALUES (9, 6, 11, 1, NULL);
INSERT INTO public."UsuariosGrupo" VALUES (10, 6, 12, 1, NULL);
INSERT INTO public."UsuariosGrupo" VALUES (11, 6, 13, 1, NULL);
INSERT INTO public."UsuariosGrupo" VALUES (12, 6, 5, 2, NULL);
INSERT INTO public."UsuariosGrupo" VALUES (13, 6, 15, 1, NULL);
INSERT INTO public."UsuariosGrupo" VALUES (14, 6, 16, 1, NULL);
INSERT INTO public."UsuariosGrupo" VALUES (15, 6, 17, 1, NULL);
INSERT INTO public."UsuariosGrupo" VALUES (16, 6, 18, 1, NULL);
INSERT INTO public."UsuariosGrupo" VALUES (17, 7, 19, 1, NULL);
INSERT INTO public."UsuariosGrupo" VALUES (18, 2, 3, 1, NULL);
INSERT INTO public."UsuariosGrupo" VALUES (29, 5, 4, 3, NULL);
INSERT INTO public."UsuariosGrupo" VALUES (30, 5, 5, 3, NULL);
INSERT INTO public."UsuariosGrupo" VALUES (31, 5, 13, 3, NULL);
INSERT INTO public."UsuariosGrupo" VALUES (32, 5, 19, 3, NULL);
INSERT INTO public."UsuariosGrupo" VALUES (33, 5, 6, 3, NULL);
INSERT INTO public."UsuariosGrupo" VALUES (34, 2, 4, 3, NULL);


--
-- TOC entry 3721 (class 0 OID 0)
-- Dependencies: 200
-- Name: attendee_event; Type: SEQUENCE SET; Schema: public; Owner: AdminIS2
--

SELECT pg_catalog.setval('public.attendee_event', 13, true);


--
-- TOC entry 3722 (class 0 OID 0)
-- Dependencies: 203
-- Name: event_id_seq; Type: SEQUENCE SET; Schema: public; Owner: AdminIS2
--

SELECT pg_catalog.setval('public.event_id_seq', 26, true);


--
-- TOC entry 3723 (class 0 OID 0)
-- Dependencies: 205
-- Name: group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: AdminIS2
--

SELECT pg_catalog.setval('public.group_id_seq', 19, true);


--
-- TOC entry 3724 (class 0 OID 0)
-- Dependencies: 209
-- Name: permission_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: AdminIS2
--

SELECT pg_catalog.setval('public.permission_user_id_seq', 18, true);


--
-- TOC entry 3725 (class 0 OID 0)
-- Dependencies: 214
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: AdminIS2
--

SELECT pg_catalog.setval('public.user_id_seq', 8, true);


--
-- TOC entry 3726 (class 0 OID 0)
-- Dependencies: 216
-- Name: users_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: AdminIS2
--

SELECT pg_catalog.setval('public.users_group_id_seq', 34, true);


--
-- TOC entry 3529 (class 2606 OID 24934)
-- Name: AsistentesEvento AsistentesEvento_pkey; Type: CONSTRAINT; Schema: public; Owner: AdminIS2
--

ALTER TABLE ONLY public."AsistentesEvento"
    ADD CONSTRAINT "AsistentesEvento_pkey" PRIMARY KEY ("ID");


--
-- TOC entry 3531 (class 2606 OID 24936)
-- Name: CategoriaGrupo CategoriaGrupo_pkey; Type: CONSTRAINT; Schema: public; Owner: AdminIS2
--

ALTER TABLE ONLY public."CategoriaGrupo"
    ADD CONSTRAINT "CategoriaGrupo_pkey" PRIMARY KEY ("ID");


--
-- TOC entry 3533 (class 2606 OID 24938)
-- Name: Evento Evento_pkey; Type: CONSTRAINT; Schema: public; Owner: AdminIS2
--

ALTER TABLE ONLY public."Evento"
    ADD CONSTRAINT "Evento_pkey" PRIMARY KEY ("ID");


--
-- TOC entry 3535 (class 2606 OID 24940)
-- Name: Grupo Grupo_pkey; Type: CONSTRAINT; Schema: public; Owner: AdminIS2
--

ALTER TABLE ONLY public."Grupo"
    ADD CONSTRAINT "Grupo_pkey" PRIMARY KEY ("ID");


--
-- TOC entry 3537 (class 2606 OID 24942)
-- Name: Lugar Lugar_pkey; Type: CONSTRAINT; Schema: public; Owner: AdminIS2
--

ALTER TABLE ONLY public."Lugar"
    ADD CONSTRAINT "Lugar_pkey" PRIMARY KEY ("ID");


--
-- TOC entry 3539 (class 2606 OID 24944)
-- Name: Permiso Permiso_pkey; Type: CONSTRAINT; Schema: public; Owner: AdminIS2
--

ALTER TABLE ONLY public."Permiso"
    ADD CONSTRAINT "Permiso_pkey" PRIMARY KEY ("ID");


--
-- TOC entry 3541 (class 2606 OID 24946)
-- Name: PermisosUsuario PermisosUsuario_pkey; Type: CONSTRAINT; Schema: public; Owner: AdminIS2
--

ALTER TABLE ONLY public."PermisosUsuario"
    ADD CONSTRAINT "PermisosUsuario_pkey" PRIMARY KEY ("ID");


--
-- TOC entry 3543 (class 2606 OID 24948)
-- Name: PreferenciasEventoUsuario PreferenciasEventoUsuario_pkey; Type: CONSTRAINT; Schema: public; Owner: AdminIS2
--

ALTER TABLE ONLY public."PreferenciasEventoUsuario"
    ADD CONSTRAINT "PreferenciasEventoUsuario_pkey" PRIMARY KEY ("ID");


--
-- TOC entry 3545 (class 2606 OID 24950)
-- Name: Recurso Recurso_pkey; Type: CONSTRAINT; Schema: public; Owner: AdminIS2
--

ALTER TABLE ONLY public."Recurso"
    ADD CONSTRAINT "Recurso_pkey" PRIMARY KEY ("ID");


--
-- TOC entry 3547 (class 2606 OID 24952)
-- Name: TipoEvento TipoEvento_pkey; Type: CONSTRAINT; Schema: public; Owner: AdminIS2
--

ALTER TABLE ONLY public."TipoEvento"
    ADD CONSTRAINT "TipoEvento_pkey" PRIMARY KEY ("ID");


--
-- TOC entry 3549 (class 2606 OID 24954)
-- Name: Usuario Usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: AdminIS2
--

ALTER TABLE ONLY public."Usuario"
    ADD CONSTRAINT "Usuario_pkey" PRIMARY KEY ("ID");


--
-- TOC entry 3551 (class 2606 OID 24956)
-- Name: UsuariosGrupo UsuariosGrupo_pkey; Type: CONSTRAINT; Schema: public; Owner: AdminIS2
--

ALTER TABLE ONLY public."UsuariosGrupo"
    ADD CONSTRAINT "UsuariosGrupo_pkey" PRIMARY KEY ("ID");


--
-- TOC entry 3552 (class 2606 OID 24959)
-- Name: AsistentesEvento FK_AsistentesEvento.ID_evento; Type: FK CONSTRAINT; Schema: public; Owner: AdminIS2
--

ALTER TABLE ONLY public."AsistentesEvento"
    ADD CONSTRAINT "FK_AsistentesEvento.ID_evento" FOREIGN KEY ("ID_evento") REFERENCES public."Evento"("ID");


--
-- TOC entry 3553 (class 2606 OID 24964)
-- Name: AsistentesEvento FK_AsistentesEvento.ID_usuario; Type: FK CONSTRAINT; Schema: public; Owner: AdminIS2
--

ALTER TABLE ONLY public."AsistentesEvento"
    ADD CONSTRAINT "FK_AsistentesEvento.ID_usuario" FOREIGN KEY ("ID_usuario") REFERENCES public."Usuario"("ID");


--
-- TOC entry 3554 (class 2606 OID 24969)
-- Name: Evento FK_Evento.ID_TipoEvento; Type: FK CONSTRAINT; Schema: public; Owner: AdminIS2
--

ALTER TABLE ONLY public."Evento"
    ADD CONSTRAINT "FK_Evento.ID_TipoEvento" FOREIGN KEY ("ID_TipoEvento") REFERENCES public."TipoEvento"("ID");


--
-- TOC entry 3555 (class 2606 OID 24974)
-- Name: Evento FK_Evento.ID_creador; Type: FK CONSTRAINT; Schema: public; Owner: AdminIS2
--

ALTER TABLE ONLY public."Evento"
    ADD CONSTRAINT "FK_Evento.ID_creador" FOREIGN KEY ("ID_creador") REFERENCES public."Usuario"("ID");


--
-- TOC entry 3556 (class 2606 OID 24979)
-- Name: Evento FK_Evento.ID_grupo; Type: FK CONSTRAINT; Schema: public; Owner: AdminIS2
--

ALTER TABLE ONLY public."Evento"
    ADD CONSTRAINT "FK_Evento.ID_grupo" FOREIGN KEY ("ID_grupo") REFERENCES public."Grupo"("ID");


--
-- TOC entry 3557 (class 2606 OID 24984)
-- Name: Evento FK_Evento.ID_lugarOficial; Type: FK CONSTRAINT; Schema: public; Owner: AdminIS2
--

ALTER TABLE ONLY public."Evento"
    ADD CONSTRAINT "FK_Evento.ID_lugarOficial" FOREIGN KEY ("ID_lugarOficial") REFERENCES public."Lugar"("ID");


--
-- TOC entry 3558 (class 2606 OID 24989)
-- Name: Grupo FK_Grupo.ID_CategoriaGrupo; Type: FK CONSTRAINT; Schema: public; Owner: AdminIS2
--

ALTER TABLE ONLY public."Grupo"
    ADD CONSTRAINT "FK_Grupo.ID_CategoriaGrupo" FOREIGN KEY ("ID_CategoriaGrupo") REFERENCES public."CategoriaGrupo"("ID");


--
-- TOC entry 3559 (class 2606 OID 24994)
-- Name: PermisosUsuario FK_PermisosUsuario.ID_permiso; Type: FK CONSTRAINT; Schema: public; Owner: AdminIS2
--

ALTER TABLE ONLY public."PermisosUsuario"
    ADD CONSTRAINT "FK_PermisosUsuario.ID_permiso" FOREIGN KEY ("ID_permiso") REFERENCES public."Permiso"("ID");


--
-- TOC entry 3560 (class 2606 OID 24999)
-- Name: PermisosUsuario FK_PermisosUsuario.ID_usuario; Type: FK CONSTRAINT; Schema: public; Owner: AdminIS2
--

ALTER TABLE ONLY public."PermisosUsuario"
    ADD CONSTRAINT "FK_PermisosUsuario.ID_usuario" FOREIGN KEY ("ID_usuario") REFERENCES public."Usuario"("ID");


--
-- TOC entry 3561 (class 2606 OID 25004)
-- Name: PreferenciasEventoUsuario FK_PreferenciasEventoUsuario.ID_TipoEvento; Type: FK CONSTRAINT; Schema: public; Owner: AdminIS2
--

ALTER TABLE ONLY public."PreferenciasEventoUsuario"
    ADD CONSTRAINT "FK_PreferenciasEventoUsuario.ID_TipoEvento" FOREIGN KEY ("ID_TipoEvento") REFERENCES public."TipoEvento"("ID");


--
-- TOC entry 3562 (class 2606 OID 25009)
-- Name: PreferenciasEventoUsuario FK_PreferenciasEventoUsuario.ID_usuario; Type: FK CONSTRAINT; Schema: public; Owner: AdminIS2
--

ALTER TABLE ONLY public."PreferenciasEventoUsuario"
    ADD CONSTRAINT "FK_PreferenciasEventoUsuario.ID_usuario" FOREIGN KEY ("ID_usuario") REFERENCES public."Usuario"("ID");


--
-- TOC entry 3563 (class 2606 OID 25014)
-- Name: UsuariosGrupo FK_UsuariosGrupo.ID_grupo; Type: FK CONSTRAINT; Schema: public; Owner: AdminIS2
--

ALTER TABLE ONLY public."UsuariosGrupo"
    ADD CONSTRAINT "FK_UsuariosGrupo.ID_grupo" FOREIGN KEY ("ID_grupo") REFERENCES public."Grupo"("ID");


--
-- TOC entry 3564 (class 2606 OID 25019)
-- Name: UsuariosGrupo FK_UsuariosGrupo.ID_permiso; Type: FK CONSTRAINT; Schema: public; Owner: AdminIS2
--

ALTER TABLE ONLY public."UsuariosGrupo"
    ADD CONSTRAINT "FK_UsuariosGrupo.ID_permiso" FOREIGN KEY ("ID_permiso") REFERENCES public."Permiso"("ID");


--
-- TOC entry 3565 (class 2606 OID 25024)
-- Name: UsuariosGrupo FK_UsuariosGrupo.ID_usuario; Type: FK CONSTRAINT; Schema: public; Owner: AdminIS2
--

ALTER TABLE ONLY public."UsuariosGrupo"
    ADD CONSTRAINT "FK_UsuariosGrupo.ID_usuario" FOREIGN KEY ("ID_usuario") REFERENCES public."Usuario"("ID");


--
-- TOC entry 3720 (class 0 OID 0)
-- Dependencies: 3
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: azure_pg_admin
--

REVOKE ALL ON SCHEMA public FROM azuresu;
REVOKE ALL ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO azure_pg_admin;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2022-01-26 18:41:53

--
-- PostgreSQL database dump complete
--

