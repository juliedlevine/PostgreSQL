--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.2
-- Dumped by pg_dump version 9.6.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: album; Type: TABLE; Schema: public; Owner: Julie
--

CREATE TABLE album (
    id integer NOT NULL,
    name character varying,
    year integer,
    artist_id integer,
    CONSTRAINT album_year_check CHECK (((year >= 1000) AND (year <= 3000)))
);


ALTER TABLE album OWNER TO "Julie";

--
-- Name: album_id_seq; Type: SEQUENCE; Schema: public; Owner: Julie
--

CREATE SEQUENCE album_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE album_id_seq OWNER TO "Julie";

--
-- Name: album_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Julie
--

ALTER SEQUENCE album_id_seq OWNED BY album.id;


--
-- Name: artist; Type: TABLE; Schema: public; Owner: Julie
--

CREATE TABLE artist (
    id integer NOT NULL,
    name character varying
);


ALTER TABLE artist OWNER TO "Julie";

--
-- Name: artist_id_seq; Type: SEQUENCE; Schema: public; Owner: Julie
--

CREATE SEQUENCE artist_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE artist_id_seq OWNER TO "Julie";

--
-- Name: artist_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Julie
--

ALTER SEQUENCE artist_id_seq OWNED BY artist.id;


--
-- Name: collaborators; Type: TABLE; Schema: public; Owner: Julie
--

CREATE TABLE collaborators (
    album_id integer,
    collaborator_id integer
);


ALTER TABLE collaborators OWNER TO "Julie";

--
-- Name: song; Type: TABLE; Schema: public; Owner: Julie
--

CREATE TABLE song (
    id integer NOT NULL,
    name character varying,
    length interval minute to second,
    year integer,
    song_writer_id integer,
    CONSTRAINT song_year_check CHECK (((year >= 1000) AND (year <= 3000)))
);


ALTER TABLE song OWNER TO "Julie";

--
-- Name: song_id_seq; Type: SEQUENCE; Schema: public; Owner: Julie
--

CREATE SEQUENCE song_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE song_id_seq OWNER TO "Julie";

--
-- Name: song_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Julie
--

ALTER SEQUENCE song_id_seq OWNED BY song.id;


--
-- Name: song_writer; Type: TABLE; Schema: public; Owner: Julie
--

CREATE TABLE song_writer (
    id integer NOT NULL,
    name character varying
);


ALTER TABLE song_writer OWNER TO "Julie";

--
-- Name: song_writer_id_seq; Type: SEQUENCE; Schema: public; Owner: Julie
--

CREATE SEQUENCE song_writer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE song_writer_id_seq OWNER TO "Julie";

--
-- Name: song_writer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Julie
--

ALTER SEQUENCE song_writer_id_seq OWNED BY song_writer.id;


--
-- Name: track; Type: TABLE; Schema: public; Owner: Julie
--

CREATE TABLE track (
    id integer NOT NULL,
    name character varying,
    length interval minute to second,
    year integer,
    song_id integer,
    album_id integer,
    CONSTRAINT track_year_check CHECK (((year >= 1000) AND (year <= 3000)))
);


ALTER TABLE track OWNER TO "Julie";

--
-- Name: track_id_seq; Type: SEQUENCE; Schema: public; Owner: Julie
--

CREATE SEQUENCE track_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE track_id_seq OWNER TO "Julie";

--
-- Name: track_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Julie
--

ALTER SEQUENCE track_id_seq OWNED BY track.id;


--
-- Name: album id; Type: DEFAULT; Schema: public; Owner: Julie
--

ALTER TABLE ONLY album ALTER COLUMN id SET DEFAULT nextval('album_id_seq'::regclass);


--
-- Name: artist id; Type: DEFAULT; Schema: public; Owner: Julie
--

ALTER TABLE ONLY artist ALTER COLUMN id SET DEFAULT nextval('artist_id_seq'::regclass);


--
-- Name: song id; Type: DEFAULT; Schema: public; Owner: Julie
--

ALTER TABLE ONLY song ALTER COLUMN id SET DEFAULT nextval('song_id_seq'::regclass);


--
-- Name: song_writer id; Type: DEFAULT; Schema: public; Owner: Julie
--

ALTER TABLE ONLY song_writer ALTER COLUMN id SET DEFAULT nextval('song_writer_id_seq'::regclass);


--
-- Name: track id; Type: DEFAULT; Schema: public; Owner: Julie
--

ALTER TABLE ONLY track ALTER COLUMN id SET DEFAULT nextval('track_id_seq'::regclass);


--
-- Data for Name: album; Type: TABLE DATA; Schema: public; Owner: Julie
--

COPY album (id, name, year, artist_id) FROM stdin;
1	Dear Catastrophe Waitress	2004	6
2	A Very Merry Christmas	1996	1
3	Test	1998	1
4	SQL 2 The Sequel	2011	3
5	Elephant	2017	2
\.


--
-- Name: album_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Julie
--

SELECT pg_catalog.setval('album_id_seq', 5, true);


--
-- Data for Name: artist; Type: TABLE DATA; Schema: public; Owner: Julie
--

COPY artist (id, name) FROM stdin;
1	James
2	Julie
3	Toby
4	The Chainsmokers
5	Beck
6	Belle & Sebastian
\.


--
-- Name: artist_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Julie
--

SELECT pg_catalog.setval('artist_id_seq', 6, true);


--
-- Data for Name: collaborators; Type: TABLE DATA; Schema: public; Owner: Julie
--

COPY collaborators (album_id, collaborator_id) FROM stdin;
5	1
5	5
2	3
4	1
1	2
5	1
5	5
2	3
4	1
1	2
\.


--
-- Data for Name: song; Type: TABLE DATA; Schema: public; Owner: Julie
--

COPY song (id, name, length, year, song_writer_id) FROM stdin;
1	The Boy WIth The Arab Strap	00:05:14	1998	4
2	James Sings The Blues	00:44:18	1994	1
3	Piazza, New York Catcher	00:03:03	2004	4
4	Test1	00:11:11	1997	5
5	Test2	00:22:22	1998	5
7	Test4	00:44:44	2000	6
6	Test3	00:33:33	1999	5
8	Test5	00:55:55	2001	7
\.


--
-- Name: song_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Julie
--

SELECT pg_catalog.setval('song_id_seq', 8, true);


--
-- Data for Name: song_writer; Type: TABLE DATA; Schema: public; Owner: Julie
--

COPY song_writer (id, name) FROM stdin;
1	Ning
2	Justin
3	Frank
4	Giorgio
5	Blake
6	Andreea
7	Todd
\.


--
-- Name: song_writer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Julie
--

SELECT pg_catalog.setval('song_writer_id_seq', 7, true);


--
-- Data for Name: track; Type: TABLE DATA; Schema: public; Owner: Julie
--

COPY track (id, name, length, year, song_id, album_id) FROM stdin;
1	The Boy WIth The Arab Strap	00:05:14	1999	1	1
3	Piazza, New York Catcher	00:03:03	2004	3	1
2	James Sings The Blues	00:44:18	1995	2	2
4	James Song	00:01:11	2021	1	3
5	Javascript is cool	00:00:45	2009	2	4
6	Python is cool	00:01:00	2009	2	4
7	Elephant in the Jungle	00:03:13	2017	3	5
8	Tiger in the Jungle	00:01:40	1999	4	5
9	Giraffe in the Jungle	00:03:20	2000	4	5
10	Turtle in the Jungle	00:05:00	2001	5	5
\.


--
-- Name: track_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Julie
--

SELECT pg_catalog.setval('track_id_seq', 5, true);


--
-- Name: album album_pkey; Type: CONSTRAINT; Schema: public; Owner: Julie
--

ALTER TABLE ONLY album
    ADD CONSTRAINT album_pkey PRIMARY KEY (id);


--
-- Name: artist artist_pkey; Type: CONSTRAINT; Schema: public; Owner: Julie
--

ALTER TABLE ONLY artist
    ADD CONSTRAINT artist_pkey PRIMARY KEY (id);


--
-- Name: song song_pkey; Type: CONSTRAINT; Schema: public; Owner: Julie
--

ALTER TABLE ONLY song
    ADD CONSTRAINT song_pkey PRIMARY KEY (id);


--
-- Name: song_writer song_writer_pkey; Type: CONSTRAINT; Schema: public; Owner: Julie
--

ALTER TABLE ONLY song_writer
    ADD CONSTRAINT song_writer_pkey PRIMARY KEY (id);


--
-- Name: track track_pkey; Type: CONSTRAINT; Schema: public; Owner: Julie
--

ALTER TABLE ONLY track
    ADD CONSTRAINT track_pkey PRIMARY KEY (id);


--
-- Name: album album_artist_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: Julie
--

ALTER TABLE ONLY album
    ADD CONSTRAINT album_artist_id_fkey FOREIGN KEY (artist_id) REFERENCES artist(id);


--
-- Name: collaborators album_id; Type: FK CONSTRAINT; Schema: public; Owner: Julie
--

ALTER TABLE ONLY collaborators
    ADD CONSTRAINT album_id FOREIGN KEY (album_id) REFERENCES album(id);


--
-- Name: collaborators artist_id; Type: FK CONSTRAINT; Schema: public; Owner: Julie
--

ALTER TABLE ONLY collaborators
    ADD CONSTRAINT artist_id FOREIGN KEY (collaborator_id) REFERENCES artist(id);


--
-- Name: song song_song_writer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: Julie
--

ALTER TABLE ONLY song
    ADD CONSTRAINT song_song_writer_id_fkey FOREIGN KEY (song_writer_id) REFERENCES song_writer(id);


--
-- Name: track track_album_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: Julie
--

ALTER TABLE ONLY track
    ADD CONSTRAINT track_album_id_fkey FOREIGN KEY (album_id) REFERENCES album(id);


--
-- Name: track track_song_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: Julie
--

ALTER TABLE ONLY track
    ADD CONSTRAINT track_song_id_fkey FOREIGN KEY (song_id) REFERENCES song(id);


--
-- PostgreSQL database dump complete
--

