--
-- PostgreSQL database dump
--

-- Dumped from database version 14.0
-- Dumped by pg_dump version 14.0

-- Started on 2021-11-29 21:09:03

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
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- TOC entry 3414 (class 0 OID 0)
-- Dependencies: 3
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 215 (class 1259 OID 24656)
-- Name: AsistentesEvento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."AsistentesEvento" (
    "ID" numeric NOT NULL,
    "ID_evento" numeric,
    "ID_usuario" numeric,
    "Notificaciones" boolean,
    "Confirmacion" boolean
);


ALTER TABLE public."AsistentesEvento" OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 24584)
-- Name: CategoriaGrupo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."CategoriaGrupo" (
    "ID" numeric NOT NULL,
    "Nombre" character varying
);


ALTER TABLE public."CategoriaGrupo" OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 24743)
-- Name: event_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.event_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.event_id_seq OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 24629)
-- Name: Evento; Type: TABLE; Schema: public; Owner: postgres
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
    "Recurrente" boolean
);


ALTER TABLE public."Evento" OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 24591)
-- Name: Grupo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Grupo" (
    "ID" numeric NOT NULL,
    "ID_CategoriaGrupo" numeric,
    "Nombre" character varying,
    "Descripcion" character varying,
    "Oficial" boolean
);


ALTER TABLE public."Grupo" OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 24610)
-- Name: Lugar; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Lugar" (
    "ID" numeric NOT NULL,
    "Nombre" character varying,
    "Edificio" character varying,
    "Coordenadas" point
);


ALTER TABLE public."Lugar" OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 24673)
-- Name: Permiso; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Permiso" (
    "ID" numeric NOT NULL,
    "Nombre" character varying,
    "Descripcion" character varying
);


ALTER TABLE public."Permiso" OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 24726)
-- Name: PermisosUsuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."PermisosUsuario" (
    "ID" numeric NOT NULL,
    "ID_usuario" numeric,
    "ID_permiso" numeric
);


ALTER TABLE public."PermisosUsuario" OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 24680)
-- Name: PreferenciasEventoUsuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."PreferenciasEventoUsuario" (
    "ID" numeric NOT NULL,
    "ID_usuario" numeric,
    "ID_TipoEvento" numeric
);


ALTER TABLE public."PreferenciasEventoUsuario" OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 24697)
-- Name: Recurso; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Recurso" (
    "ID" numeric NOT NULL,
    nombre character varying,
    "CantidadTotal" numeric,
    "CantidadOcupados" numeric,
    "Facultad" character varying
);


ALTER TABLE public."Recurso" OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 24603)
-- Name: TipoEvento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."TipoEvento" (
    "ID" numeric NOT NULL,
    "Nombre" character varying
);


ALTER TABLE public."TipoEvento" OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 24782)
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_id_seq OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 24577)
-- Name: Usuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Usuario" (
    "ID" numeric DEFAULT nextval('public.user_id_seq'::regclass) NOT NULL,
    "Nombres" character varying,
    "Apellidos" character varying,
    "Correo" character varying,
    "Descripcion" character varying,
    "Foto" character varying
);


ALTER TABLE public."Usuario" OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 24774)
-- Name: Usuarios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Usuarios" (
    "ID" integer NOT NULL,
    "Nombres" character varying(255),
    "Apellidos" character varying(255),
    "Correo" character varying(255),
    "Descripcion" character varying(255),
    "Foto" character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."Usuarios" OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 24704)
-- Name: UsuariosGrupo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."UsuariosGrupo" (
    "ID" numeric NOT NULL,
    "ID_usuario" numeric,
    "ID_grupo" numeric,
    "ID_permiso" numeric,
    "Notificaciones" character varying
);


ALTER TABLE public."UsuariosGrupo" OWNER TO postgres;

--
-- TOC entry 3400 (class 0 OID 24656)
-- Dependencies: 215
-- Data for Name: AsistentesEvento; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3395 (class 0 OID 24584)
-- Dependencies: 210
-- Data for Name: CategoriaGrupo; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3399 (class 0 OID 24629)
-- Dependencies: 214
-- Data for Name: Evento; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Evento" VALUES (1, 'qweqewqew', 'asdadsdad', '', 1, '2021-10-10 12:00:00', '01:00:00', false, true, 1, '', NULL, NULL, NULL, false);
INSERT INTO public."Evento" VALUES (2, 'qweqewqew', 'asdadsdad', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public."Evento" VALUES (3, 'asdadadasd', 'asdasdasdadsad', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public."Evento" VALUES (4, 'prueba 2', 'texto de tpruwebnsaofud', NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public."Evento" VALUES (5, 'parangacutirimicuaro', 'qweqweqeqweqewqeqeweqwe', NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public."Evento" VALUES (6, 'ttttttttttttttttttttttttttttttt', 'tttyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy', NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public."Evento" VALUES (7, 'adasad', 'adsdsadas', NULL, 2, '2021-11-30 21:00:40', '02:00:00', false, NULL, NULL, NULL, NULL, NULL, NULL, false);
INSERT INTO public."Evento" VALUES (8, 'prueba no presencial', 'asdasd', NULL, 1, '2021-11-30 21:07:08', '02:00:00', false, NULL, NULL, NULL, NULL, NULL, NULL, false);
INSERT INTO public."Evento" VALUES (9, 'prueba ubicacion relativa', 'asdadsda', NULL, 1, '2021-11-30 21:11:13', '03:00:00', true, false, NULL, 'frente al viejo', NULL, NULL, NULL, true);
INSERT INTO public."Evento" VALUES (10, 'test lugar oficial', 'asdasda', NULL, 2, '2021-11-30 22:06:33', '04:00:00', true, true, 1, NULL, NULL, NULL, NULL, false);
INSERT INTO public."Evento" VALUES (11, 'asdasdasd', 'asdasdd', NULL, 1, '2021-11-30 10:07:19', '01:00:00', true, true, 1, NULL, NULL, NULL, NULL, false);
INSERT INTO public."Evento" VALUES (12, 'test evento', 'jajajajajjaaa', NULL, 2, '2021-11-30 15:00:35', '01:00:00', true, false, NULL, 'frente al edificio de posgrados de humanas', NULL, NULL, NULL, false);
INSERT INTO public."Evento" VALUES (13, 'asdadad', 'adasdasdadas', NULL, 2, '2021-12-01 00:40:01', '01:00:00', true, true, 4, NULL, NULL, NULL, NULL, false);
INSERT INTO public."Evento" VALUES (14, 'mmmmmmmmmmmmmmmmmmmmmmmmmm', 'mmmmmmmmmmmmmmmmmmmmmmmmmm', NULL, 2, '2021-12-01 01:37:38', '02:00:00', false, NULL, NULL, NULL, NULL, NULL, NULL, false);


--
-- TOC entry 3396 (class 0 OID 24591)
-- Dependencies: 211
-- Data for Name: Grupo; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3398 (class 0 OID 24610)
-- Dependencies: 213
-- Data for Name: Lugar; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Lugar" VALUES (2, 'auditorio A', 'Aulas de ingenieria', '(1,1)');
INSERT INTO public."Lugar" VALUES (3, 'auditorio B', 'Aulas de ingenieria', '(1,1)');
INSERT INTO public."Lugar" VALUES (4, 'Terraza', 'Ciencia y Tecnologia', '(1,1)');
INSERT INTO public."Lugar" VALUES (5, 'Biblioteca', 'Ciencia y Tecnologia', '(1,1)');
INSERT INTO public."Lugar" VALUES (1, 'Auditorio', 'Auditorio Leon de Greiff', '(1,1)');


--
-- TOC entry 3401 (class 0 OID 24673)
-- Dependencies: 216
-- Data for Name: Permiso; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3405 (class 0 OID 24726)
-- Dependencies: 220
-- Data for Name: PermisosUsuario; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3402 (class 0 OID 24680)
-- Dependencies: 217
-- Data for Name: PreferenciasEventoUsuario; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3403 (class 0 OID 24697)
-- Dependencies: 218
-- Data for Name: Recurso; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3397 (class 0 OID 24603)
-- Dependencies: 212
-- Data for Name: TipoEvento; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."TipoEvento" VALUES (1, 'Presentacion de tesis');
INSERT INTO public."TipoEvento" VALUES (2, 'Deportivo');
INSERT INTO public."TipoEvento" VALUES (3, 'Asamblea de sede');


--
-- TOC entry 3394 (class 0 OID 24577)
-- Dependencies: 209
-- Data for Name: Usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Usuario" VALUES (2, 'Johan Sebastian', 'Romero Diaz', 'jsromerod@unal.edu.co', NULL, 'https://lh3.googleusercontent.com/a-/AOh14Gh6hv6vRH-uTZhuwdKQbWgfORGYeFkqwCgyEnyAVg=s96-c');


--
-- TOC entry 3407 (class 0 OID 24774)
-- Dependencies: 222
-- Data for Name: Usuarios; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3404 (class 0 OID 24704)
-- Dependencies: 219
-- Data for Name: UsuariosGrupo; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3415 (class 0 OID 0)
-- Dependencies: 221
-- Name: event_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.event_id_seq', 14, true);


--
-- TOC entry 3416 (class 0 OID 0)
-- Dependencies: 223
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_id_seq', 2, true);


--
-- TOC entry 3228 (class 2606 OID 24662)
-- Name: AsistentesEvento AsistentesEvento_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."AsistentesEvento"
    ADD CONSTRAINT "AsistentesEvento_pkey" PRIMARY KEY ("ID");


--
-- TOC entry 3218 (class 2606 OID 24590)
-- Name: CategoriaGrupo CategoriaGrupo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CategoriaGrupo"
    ADD CONSTRAINT "CategoriaGrupo_pkey" PRIMARY KEY ("ID");


--
-- TOC entry 3226 (class 2606 OID 24635)
-- Name: Evento Evento_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Evento"
    ADD CONSTRAINT "Evento_pkey" PRIMARY KEY ("ID");


--
-- TOC entry 3220 (class 2606 OID 24597)
-- Name: Grupo Grupo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Grupo"
    ADD CONSTRAINT "Grupo_pkey" PRIMARY KEY ("ID");


--
-- TOC entry 3224 (class 2606 OID 24616)
-- Name: Lugar Lugar_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Lugar"
    ADD CONSTRAINT "Lugar_pkey" PRIMARY KEY ("ID");


--
-- TOC entry 3230 (class 2606 OID 24679)
-- Name: Permiso Permiso_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Permiso"
    ADD CONSTRAINT "Permiso_pkey" PRIMARY KEY ("ID");


--
-- TOC entry 3238 (class 2606 OID 24732)
-- Name: PermisosUsuario PermisosUsuario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."PermisosUsuario"
    ADD CONSTRAINT "PermisosUsuario_pkey" PRIMARY KEY ("ID");


--
-- TOC entry 3232 (class 2606 OID 24686)
-- Name: PreferenciasEventoUsuario PreferenciasEventoUsuario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."PreferenciasEventoUsuario"
    ADD CONSTRAINT "PreferenciasEventoUsuario_pkey" PRIMARY KEY ("ID");


--
-- TOC entry 3234 (class 2606 OID 24703)
-- Name: Recurso Recurso_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Recurso"
    ADD CONSTRAINT "Recurso_pkey" PRIMARY KEY ("ID");


--
-- TOC entry 3222 (class 2606 OID 24609)
-- Name: TipoEvento TipoEvento_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."TipoEvento"
    ADD CONSTRAINT "TipoEvento_pkey" PRIMARY KEY ("ID");


--
-- TOC entry 3216 (class 2606 OID 24583)
-- Name: Usuario Usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Usuario"
    ADD CONSTRAINT "Usuario_pkey" PRIMARY KEY ("ID");


--
-- TOC entry 3236 (class 2606 OID 24710)
-- Name: UsuariosGrupo UsuariosGrupo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."UsuariosGrupo"
    ADD CONSTRAINT "UsuariosGrupo_pkey" PRIMARY KEY ("ID");


--
-- TOC entry 3240 (class 2606 OID 24780)
-- Name: Usuarios Usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Usuarios"
    ADD CONSTRAINT "Usuarios_pkey" PRIMARY KEY ("ID");


--
-- TOC entry 3247 (class 2606 OID 24668)
-- Name: AsistentesEvento FK_AsistentesEvento.ID_evento; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."AsistentesEvento"
    ADD CONSTRAINT "FK_AsistentesEvento.ID_evento" FOREIGN KEY ("ID_evento") REFERENCES public."Evento"("ID");


--
-- TOC entry 3246 (class 2606 OID 24663)
-- Name: AsistentesEvento FK_AsistentesEvento.ID_usuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."AsistentesEvento"
    ADD CONSTRAINT "FK_AsistentesEvento.ID_usuario" FOREIGN KEY ("ID_usuario") REFERENCES public."Usuario"("ID");


--
-- TOC entry 3243 (class 2606 OID 24641)
-- Name: Evento FK_Evento.ID_TipoEvento; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Evento"
    ADD CONSTRAINT "FK_Evento.ID_TipoEvento" FOREIGN KEY ("ID_TipoEvento") REFERENCES public."TipoEvento"("ID");


--
-- TOC entry 3244 (class 2606 OID 24646)
-- Name: Evento FK_Evento.ID_creador; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Evento"
    ADD CONSTRAINT "FK_Evento.ID_creador" FOREIGN KEY ("ID_creador") REFERENCES public."Usuario"("ID");


--
-- TOC entry 3242 (class 2606 OID 24636)
-- Name: Evento FK_Evento.ID_grupo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Evento"
    ADD CONSTRAINT "FK_Evento.ID_grupo" FOREIGN KEY ("ID_grupo") REFERENCES public."Grupo"("ID");


--
-- TOC entry 3245 (class 2606 OID 24651)
-- Name: Evento FK_Evento.ID_lugarOficial; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Evento"
    ADD CONSTRAINT "FK_Evento.ID_lugarOficial" FOREIGN KEY ("ID_lugarOficial") REFERENCES public."Lugar"("ID");


--
-- TOC entry 3241 (class 2606 OID 24598)
-- Name: Grupo FK_Grupo.ID_CategoriaGrupo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Grupo"
    ADD CONSTRAINT "FK_Grupo.ID_CategoriaGrupo" FOREIGN KEY ("ID_CategoriaGrupo") REFERENCES public."CategoriaGrupo"("ID");


--
-- TOC entry 3253 (class 2606 OID 24733)
-- Name: PermisosUsuario FK_PermisosUsuario.ID_permiso; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."PermisosUsuario"
    ADD CONSTRAINT "FK_PermisosUsuario.ID_permiso" FOREIGN KEY ("ID_permiso") REFERENCES public."Permiso"("ID");


--
-- TOC entry 3254 (class 2606 OID 24738)
-- Name: PermisosUsuario FK_PermisosUsuario.ID_usuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."PermisosUsuario"
    ADD CONSTRAINT "FK_PermisosUsuario.ID_usuario" FOREIGN KEY ("ID_usuario") REFERENCES public."Usuario"("ID");


--
-- TOC entry 3249 (class 2606 OID 24692)
-- Name: PreferenciasEventoUsuario FK_PreferenciasEventoUsuario.ID_TipoEvento; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."PreferenciasEventoUsuario"
    ADD CONSTRAINT "FK_PreferenciasEventoUsuario.ID_TipoEvento" FOREIGN KEY ("ID_TipoEvento") REFERENCES public."TipoEvento"("ID");


--
-- TOC entry 3248 (class 2606 OID 24687)
-- Name: PreferenciasEventoUsuario FK_PreferenciasEventoUsuario.ID_usuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."PreferenciasEventoUsuario"
    ADD CONSTRAINT "FK_PreferenciasEventoUsuario.ID_usuario" FOREIGN KEY ("ID_usuario") REFERENCES public."Usuario"("ID");


--
-- TOC entry 3252 (class 2606 OID 24721)
-- Name: UsuariosGrupo FK_UsuariosGrupo.ID_grupo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."UsuariosGrupo"
    ADD CONSTRAINT "FK_UsuariosGrupo.ID_grupo" FOREIGN KEY ("ID_grupo") REFERENCES public."Grupo"("ID");


--
-- TOC entry 3250 (class 2606 OID 24711)
-- Name: UsuariosGrupo FK_UsuariosGrupo.ID_permiso; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."UsuariosGrupo"
    ADD CONSTRAINT "FK_UsuariosGrupo.ID_permiso" FOREIGN KEY ("ID_permiso") REFERENCES public."Permiso"("ID");


--
-- TOC entry 3251 (class 2606 OID 24716)
-- Name: UsuariosGrupo FK_UsuariosGrupo.ID_usuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."UsuariosGrupo"
    ADD CONSTRAINT "FK_UsuariosGrupo.ID_usuario" FOREIGN KEY ("ID_usuario") REFERENCES public."Usuario"("ID");


-- Completed on 2021-11-29 21:09:03

--
-- PostgreSQL database dump complete
--

