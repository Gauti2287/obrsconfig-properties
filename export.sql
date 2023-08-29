--
-- PostgreSQL database dump
--

-- Dumped from database version 14.8
-- Dumped by pg_dump version 14.8

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
-- Name: adminpack; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION adminpack; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: bookingdetails; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bookingdetails (
    bookingno numeric(50,0) NOT NULL,
    busno numeric(20,0),
    bookingdate date,
    source character varying(50),
    destinations character varying(50),
    status character varying(50),
    noofseats numeric(50,0)
);


ALTER TABLE public.bookingdetails OWNER TO postgres;

--
-- Name: seq_busno; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_busno
    START WITH 21
    INCREMENT BY 1
    MINVALUE 21
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seq_busno OWNER TO postgres;

--
-- Name: businventory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.businventory (
    busno numeric(20,0) DEFAULT nextval('public.seq_busno'::regclass) NOT NULL,
    availableseats numeric(30,0),
    lastupdateddate date
);


ALTER TABLE public.businventory OWNER TO postgres;

--
-- Name: busroutedetails; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.busroutedetails (
    busname character varying(50),
    bustype character varying(50),
    source character varying(50),
    destination character varying(50),
    busno numeric(50,0) NOT NULL,
    price integer
);


ALTER TABLE public.busroutedetails OWNER TO postgres;

--
-- Name: busroutedetails_busno_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.busroutedetails_busno_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.busroutedetails_busno_seq OWNER TO postgres;

--
-- Name: busroutedetails_busno_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.busroutedetails_busno_seq OWNED BY public.busroutedetails.busno;


--
-- Name: credentials; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.credentials (
    username character varying(50) NOT NULL,
    password character varying(50)
);


ALTER TABLE public.credentials OWNER TO postgres;

--
-- Name: hibernate_sequence; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hibernate_sequence OWNER TO postgres;

--
-- Name: obrscredentials; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.obrscredentials (
    username character varying(50) NOT NULL,
    password character varying(50) NOT NULL,
    phone numeric(50,0)
);


ALTER TABLE public.obrscredentials OWNER TO postgres;

--
-- Name: obrsuserdetails; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.obrsuserdetails (
    username character varying(50) NOT NULL,
    fname character varying(50),
    lname character varying(50),
    city character varying(50),
    state character varying(50),
    email character varying(50),
    country character varying(50),
    usertype character varying(20)
);


ALTER TABLE public.obrsuserdetails OWNER TO postgres;

--
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    orderid character varying(10) NOT NULL,
    offerid character varying(10),
    buyername character varying(50),
    bid integer
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- Name: orderstatuses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orderstatuses (
    id character varying(10) NOT NULL,
    orderid character varying(10),
    status character varying(20)
);


ALTER TABLE public.orderstatuses OWNER TO postgres;

--
-- Name: passengerbooking; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.passengerbooking (
    passengerid character varying(20) NOT NULL,
    bookingno character varying(50)
);


ALTER TABLE public.passengerbooking OWNER TO postgres;

--
-- Name: payment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payment (
    transactionid numeric(30,0) NOT NULL,
    bookingno character varying(50),
    paymentdate date,
    amount numeric(30,0),
    status character varying(20)
);


ALTER TABLE public.payment OWNER TO postgres;

--
-- Name: payments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payments (
    id character varying(10) NOT NULL,
    orderid character varying(10),
    offerid character varying(10),
    status character varying(10)
);


ALTER TABLE public.payments OWNER TO postgres;

--
-- Name: productoffers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.productoffers (
    id character varying(10) NOT NULL,
    hscode character varying(8),
    qty integer,
    unitprice integer,
    offername character varying(50),
    sellername character varying(50)
);


ALTER TABLE public.productoffers OWNER TO postgres;

--
-- Name: productofferstatuses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.productofferstatuses (
    offerid character varying(10),
    status character varying(10),
    id character varying(10) NOT NULL
);


ALTER TABLE public.productofferstatuses OWNER TO postgres;

--
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    hscode character varying(8) NOT NULL,
    name character varying(50),
    unit character varying(5)
);


ALTER TABLE public.products OWNER TO postgres;

--
-- Name: userdetails; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.userdetails (
    username character varying(50) NOT NULL,
    fname character varying(50),
    lname character varying(50) NOT NULL,
    email character varying(50),
    phone character varying(50),
    city character varying(50),
    country character varying(50)
);


ALTER TABLE public.userdetails OWNER TO postgres;

--
-- Name: usernamewalletlinks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usernamewalletlinks (
    username character varying(50) NOT NULL,
    walletid character varying(10)
);


ALTER TABLE public.usernamewalletlinks OWNER TO postgres;

--
-- Name: usertypelinks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usertypelinks (
    linkid character varying(10) NOT NULL,
    username character varying(50),
    type character varying(10)
);


ALTER TABLE public.usertypelinks OWNER TO postgres;

--
-- Name: wallets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.wallets (
    walletid character varying(10) NOT NULL,
    balance integer
);


ALTER TABLE public.wallets OWNER TO postgres;

--
-- Name: busroutedetails busno; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.busroutedetails ALTER COLUMN busno SET DEFAULT nextval('public.busroutedetails_busno_seq'::regclass);


--
-- Data for Name: bookingdetails; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bookingdetails (bookingno, busno, bookingdate, source, destinations, status, noofseats) FROM stdin;
46	67	2023-08-27	Patna	Kolkata	string	4
\.


--
-- Data for Name: businventory; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.businventory (busno, availableseats, lastupdateddate) FROM stdin;
67	58	2023-08-27
\.


--
-- Data for Name: busroutedetails; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.busroutedetails (busname, bustype, source, destination, busno, price) FROM stdin;
Shivneri bus service	AC	Mumbai	Pune	67	\N
Ganga Travels	AC	Mumbai	Pune	23	450
Hira Thakur Travels	SLEEPER	Mumbai	Pune	3	250
Shiva Travels	Seater	Nashik	Mumbai	4	450
Shiva Travels	AC	Nashik	Nagpur	5	1000
Hemant travels	AC	Goa	Mumbai	2	1800
\.


--
-- Data for Name: credentials; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.credentials (username, password) FROM stdin;
Gautam	sanvi
indiagator	test@123
jyotirmaya	test@564
sejal	test@987
amisha	test@982
anjali	gupta
abhishek	test
\.


--
-- Data for Name: obrscredentials; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.obrscredentials (username, password, phone) FROM stdin;
Nitu	nitu@123	9060922916
Gautam	gautam123	7738835405
\.


--
-- Data for Name: obrsuserdetails; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.obrsuserdetails (username, fname, lname, city, state, email, country, usertype) FROM stdin;
Nitu	Nitu	Gupta	Chapra	Bihar	n@gmail.com	India	Passenger
Gautam	Gautam	Gupta	Chapra	Bihar	n@gmail.com	India	admin
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (orderid, offerid, buyername, bid) FROM stdin;
12661	23	Gautam	0
6786	8645	anjali	910000
7654	5435	diwakar	910000
6543	5457	amisha	2500000
4324	7883	abhishek	50000
4326	5435	dheeraj	500000
7689	4823	sejal	42000
\.


--
-- Data for Name: orderstatuses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orderstatuses (id, orderid, status) FROM stdin;
1862	12661	OPEN
6768	4324	ACCEPTED
6786	8645	ACCEPTED
5457	7689	REJECTED
6547	4326	ACCEPTED
\.


--
-- Data for Name: passengerbooking; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.passengerbooking (passengerid, bookingno) FROM stdin;
\.


--
-- Data for Name: payment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payment (transactionid, bookingno, paymentdate, amount, status) FROM stdin;
11	45454	2023-08-19	300	\N
13	45454	2023-08-19	300	\N
\.


--
-- Data for Name: payments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payments (id, orderid, offerid, status) FROM stdin;
272585	3455	8678	DUE
5676	2556	4234	due
\.


--
-- Data for Name: productoffers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.productoffers (id, hscode, qty, unitprice, offername, sellername) FROM stdin;
7883	44020010	7	7000	coconut shell charcoal from Kerala	sejal
4823	17011120	20	2000	sugar from up	jyotirmaya
7857	72230091	20000	35	stainless steel wires thick	diptesh
5457	10011010	1000	2000	durum wheat seed quality	sejal
8645	10081010	750	1200	buckwheat seed quality	jyotirmaya
5435	17011110	1200	350	jaggery from maharashtra	diptesh
92158	10061010	17	1000	best seed quality rice from jharkhand	diptesh
\.


--
-- Data for Name: productofferstatuses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.productofferstatuses (offerid, status, id) FROM stdin;
7883	OPEN	3442
4823	OPEN	3255
4823	SUSPENDED	6322
7857	OPEN	4540
5457	OPEN	9822
8645	OPEN	2909
5435	OPEN	4971
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (hscode, name, unit) FROM stdin;
702	Tomatoes, fresh or chilled	kg
707	Cucumbers or gherkins, fresh or chilled	kg
402	Milk and Cream, containing added sugar	ltr
1803	Cocoa paste, whether or not defatted	kg
72042110	empty cartridges scrap of stainless steel	ton
72042190	scrap of stainless steel not empty cartridges	ton
72230091	wires of stainless steel above 1.5mm thickness	meter
72230092	wires of stainless steel between 0.46 and 1.5mm	meter
17011110	sugarcane jaggery	qntl
17011120	khandsari sugar	qntl
44020010	charcoal of coconut shells	ton
10061010	rice of seed quality	qntl
10011010	durum wheat of seed quality	qntl
10081010	buckwheat of seed quality	qntl
\.


--
-- Data for Name: userdetails; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.userdetails (username, fname, lname, email, phone, city, country) FROM stdin;
Gautam		K	gauti2287@gmail.com	7738835405	chapra	India
Nitu		Gupta	gauti2287@gmail.com	7738835405	chapra	India
indiagator	prateek	kishore	indiagator@gmail.com	534563646	\N	\N
jyotirmaya	jyotirmaya	vasaniwal	jyotirmaya@gmail.com	45435355	\N	\N
sejal	sejal	pachchigar	sejal@gmail.com	42354355	\N	\N
amisha	amisha	pagare	amisa@gmail.com	435435543	\N	\N
diptesh	diptesh	thakare	diptesh@gmail.com	9873215632	\N	\N
anjali	anjali	gupta	anjali@gmail.com	324246667	\N	\N
abhishek	abhishek	parab	abhishek@gmail.com	65467337	\N	\N
dheeraj	dheeraj	kumar	dheeraj@gmail.com	42325346	\N	\N
diwakar	diwakar	shah	diwakar@gmail.com	54377876	\N	\N
rajan	rajan	shukla	rajan@gmail.com	983283832	\N	\N
\.


--
-- Data for Name: usernamewalletlinks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usernamewalletlinks (username, walletid) FROM stdin;
indiagator	5435
jyotirmaya	5436
sejal	1234
amisha	9078
anjali	7453
abhishek	9857
dheeraj	4543
diptesh	3213
diwakar	9874
\.


--
-- Data for Name: usertypelinks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usertypelinks (linkid, username, type) FROM stdin;
16728	Gautam	buyer
22008	Nitu	buyer
5794	indiagator	ADMIN
6944	jyotirmaya	SELLER
7279	sejal	BUYER
5144	sejal	SELLER
8835	amisha	BUYER
8053	diptesh	SELLER
5243	anjali	BUYER
3081	abhishek	BUYER
3110	dheeraj	BUYER
9115	diwakar	BUYER
39200	rajan	BUYER
\.


--
-- Data for Name: wallets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.wallets (walletid, balance) FROM stdin;
5435	0
5436	0
1234	0
9078	0
7453	0
9857	0
4543	0
3213	0
9874	0
\.


--
-- Name: busroutedetails_busno_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.busroutedetails_busno_seq', 1, false);


--
-- Name: hibernate_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.hibernate_sequence', 46, true);


--
-- Name: seq_busno; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_busno', 21, false);


--
-- Name: bookingdetails bookingdetails_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bookingdetails
    ADD CONSTRAINT bookingdetails_pk PRIMARY KEY (bookingno);


--
-- Name: businventory businventory_busno_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.businventory
    ADD CONSTRAINT businventory_busno_key UNIQUE (busno);


--
-- Name: businventory businventory_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.businventory
    ADD CONSTRAINT businventory_pkey PRIMARY KEY (busno);


--
-- Name: busroutedetails busroutedetails_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.busroutedetails
    ADD CONSTRAINT busroutedetails_pk PRIMARY KEY (busno);


--
-- Name: credentials credentials_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.credentials
    ADD CONSTRAINT credentials_pk PRIMARY KEY (username);


--
-- Name: productoffers key_name; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productoffers
    ADD CONSTRAINT key_name PRIMARY KEY (id);


--
-- Name: obrscredentials obrscredentials_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.obrscredentials
    ADD CONSTRAINT obrscredentials_pk UNIQUE (username);


--
-- Name: obrsuserdetails obrsuserdetails_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.obrsuserdetails
    ADD CONSTRAINT obrsuserdetails_pk UNIQUE (username);


--
-- Name: orders orders_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pk PRIMARY KEY (orderid);


--
-- Name: orderstatuses orderstatuses_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orderstatuses
    ADD CONSTRAINT orderstatuses_pk PRIMARY KEY (id);


--
-- Name: passengerbooking passengerbookin_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.passengerbooking
    ADD CONSTRAINT passengerbookin_pk PRIMARY KEY (passengerid);


--
-- Name: payment payment_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_pk PRIMARY KEY (transactionid);


--
-- Name: payments payments_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_pk PRIMARY KEY (id);


--
-- Name: products products_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pk PRIMARY KEY (hscode);


--
-- Name: productofferstatuses statuses_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productofferstatuses
    ADD CONSTRAINT statuses_pk PRIMARY KEY (id);


--
-- Name: userdetails userdetails_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.userdetails
    ADD CONSTRAINT userdetails_pk PRIMARY KEY (username);


--
-- Name: usernamewalletlinks usernamewalletlinks_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usernamewalletlinks
    ADD CONSTRAINT usernamewalletlinks_pk PRIMARY KEY (username);


--
-- Name: usertypelinks usertypelinks_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usertypelinks
    ADD CONSTRAINT usertypelinks_pk PRIMARY KEY (linkid);


--
-- Name: wallets wallets_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wallets
    ADD CONSTRAINT wallets_pk PRIMARY KEY (walletid);


--
-- Name: bookingdetails bookingdetails_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bookingdetails
    ADD CONSTRAINT bookingdetails_fkey FOREIGN KEY (busno) REFERENCES public.busroutedetails(busno);


--
-- Name: businventory businventory_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.businventory
    ADD CONSTRAINT businventory_fkey FOREIGN KEY (busno) REFERENCES public.busroutedetails(busno);


--
-- Name: obrsuserdetails obrsuserdetails_obrscredentials_username_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.obrsuserdetails
    ADD CONSTRAINT obrsuserdetails_obrscredentials_username_fk FOREIGN KEY (username) REFERENCES public.obrscredentials(username);


--
-- PostgreSQL database dump complete
--

