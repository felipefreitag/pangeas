SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

--
-- Name: subscription_recurrence; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE subscription_recurrence AS ENUM (
    'monthly',
    'anual'
);


--
-- Name: subscription_state; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE subscription_state AS ENUM (
    'pending',
    'rejected',
    'active',
    'inactive',
    'canceled'
);


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: categories; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE categories (
    id bigint NOT NULL,
    subsection_id bigint NOT NULL,
    name text NOT NULL,
    description text NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE categories_id_seq OWNED BY categories.id;


--
-- Name: courses; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE courses (
    id bigint NOT NULL,
    subsection_id bigint NOT NULL,
    name text NOT NULL,
    description text NOT NULL,
    lesson_detail text NOT NULL,
    vimeo_id integer NOT NULL,
    image_url text NOT NULL,
    instructor text NOT NULL,
    credentials text NOT NULL,
    price text NOT NULL,
    discount_price text NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: courses_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE courses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: courses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE courses_id_seq OWNED BY courses.id;


--
-- Name: purchases; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE purchases (
    id bigint NOT NULL,
    paid boolean DEFAULT false NOT NULL,
    invoice_id character varying,
    affiliate_tag character varying,
    user_id bigint,
    course_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: purchases_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE purchases_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: purchases_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE purchases_id_seq OWNED BY purchases.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


--
-- Name: sections; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sections (
    id bigint NOT NULL,
    name text NOT NULL,
    description text NOT NULL,
    image_url text NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: sections_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE sections_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sections_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE sections_id_seq OWNED BY sections.id;


--
-- Name: series; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE series (
    id bigint NOT NULL,
    category_id bigint,
    name text NOT NULL,
    description text NOT NULL,
    highlighted boolean DEFAULT false NOT NULL,
    sorting integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    image_url character varying,
    course_id bigint
);


--
-- Name: series_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE series_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: series_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE series_id_seq OWNED BY series.id;


--
-- Name: subscriptions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE subscriptions (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    state subscription_state DEFAULT 'pending'::subscription_state NOT NULL,
    recurrence subscription_recurrence NOT NULL,
    payment_method character varying,
    activated_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    iugu_id character varying,
    affiliate_tag character varying
);


--
-- Name: subscriptions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE subscriptions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: subscriptions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE subscriptions_id_seq OWNED BY subscriptions.id;


--
-- Name: subsections; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE subsections (
    id bigint NOT NULL,
    section_id bigint NOT NULL,
    name character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: subsections_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE subsections_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: subsections_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE subsections_id_seq OWNED BY subsections.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE users (
    id bigint NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    first_name character varying NOT NULL,
    last_name character varying NOT NULL,
    admin boolean DEFAULT false NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip inet,
    last_sign_in_ip inet,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    iugu_id character varying,
    affiliate_tag character varying,
    cpf character varying NOT NULL,
    address character varying NOT NULL,
    address_number character varying NOT NULL,
    address_complement character varying,
    neighborhood character varying,
    city character varying NOT NULL,
    state character varying NOT NULL,
    zip_code character varying NOT NULL
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: videos; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE videos (
    id bigint NOT NULL,
    category_id bigint,
    series_id bigint,
    name text NOT NULL,
    description text NOT NULL,
    vimeo_id integer NOT NULL,
    information text,
    synopsys text,
    bio text,
    highlighted boolean DEFAULT false NOT NULL,
    sorting integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    image_url character varying NOT NULL,
    course_id bigint
);


--
-- Name: videos_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE videos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: videos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE videos_id_seq OWNED BY videos.id;


--
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY categories ALTER COLUMN id SET DEFAULT nextval('categories_id_seq'::regclass);


--
-- Name: courses id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY courses ALTER COLUMN id SET DEFAULT nextval('courses_id_seq'::regclass);


--
-- Name: purchases id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY purchases ALTER COLUMN id SET DEFAULT nextval('purchases_id_seq'::regclass);


--
-- Name: sections id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY sections ALTER COLUMN id SET DEFAULT nextval('sections_id_seq'::regclass);


--
-- Name: series id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY series ALTER COLUMN id SET DEFAULT nextval('series_id_seq'::regclass);


--
-- Name: subscriptions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY subscriptions ALTER COLUMN id SET DEFAULT nextval('subscriptions_id_seq'::regclass);


--
-- Name: subsections id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY subsections ALTER COLUMN id SET DEFAULT nextval('subsections_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: videos id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY videos ALTER COLUMN id SET DEFAULT nextval('videos_id_seq'::regclass);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: courses courses_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY courses
    ADD CONSTRAINT courses_pkey PRIMARY KEY (id);


--
-- Name: purchases purchases_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY purchases
    ADD CONSTRAINT purchases_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: sections sections_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sections
    ADD CONSTRAINT sections_pkey PRIMARY KEY (id);


--
-- Name: series series_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY series
    ADD CONSTRAINT series_pkey PRIMARY KEY (id);


--
-- Name: subscriptions subscriptions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY subscriptions
    ADD CONSTRAINT subscriptions_pkey PRIMARY KEY (id);


--
-- Name: subsections subsections_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY subsections
    ADD CONSTRAINT subsections_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: videos videos_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY videos
    ADD CONSTRAINT videos_pkey PRIMARY KEY (id);


--
-- Name: index_categories_on_subsection_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_categories_on_subsection_id ON categories USING btree (subsection_id);


--
-- Name: index_courses_on_subsection_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_courses_on_subsection_id ON courses USING btree (subsection_id);


--
-- Name: index_purchases_on_course_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_purchases_on_course_id ON purchases USING btree (course_id);


--
-- Name: index_purchases_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_purchases_on_user_id ON purchases USING btree (user_id);


--
-- Name: index_series_on_category_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_series_on_category_id ON series USING btree (category_id);


--
-- Name: index_series_on_course_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_series_on_course_id ON series USING btree (course_id);


--
-- Name: index_subscriptions_on_iugu_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_subscriptions_on_iugu_id ON subscriptions USING btree (iugu_id);


--
-- Name: index_subscriptions_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_subscriptions_on_user_id ON subscriptions USING btree (user_id);


--
-- Name: index_subsections_on_section_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_subsections_on_section_id ON subsections USING btree (section_id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_email ON users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON users USING btree (reset_password_token);


--
-- Name: index_videos_on_category_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_videos_on_category_id ON videos USING btree (category_id);


--
-- Name: index_videos_on_course_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_videos_on_course_id ON videos USING btree (course_id);


--
-- Name: index_videos_on_series_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_videos_on_series_id ON videos USING btree (series_id);


--
-- Name: purchases fk_rails_2888c5cba9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY purchases
    ADD CONSTRAINT fk_rails_2888c5cba9 FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: courses fk_rails_3590e5f1a0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY courses
    ADD CONSTRAINT fk_rails_3590e5f1a0 FOREIGN KEY (subsection_id) REFERENCES subsections(id);


--
-- Name: purchases fk_rails_7b913c2916; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY purchases
    ADD CONSTRAINT fk_rails_7b913c2916 FOREIGN KEY (course_id) REFERENCES courses(id);


--
-- Name: series fk_rails_7e523f8111; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY series
    ADD CONSTRAINT fk_rails_7e523f8111 FOREIGN KEY (course_id) REFERENCES courses(id);


--
-- Name: subscriptions fk_rails_933bdff476; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY subscriptions
    ADD CONSTRAINT fk_rails_933bdff476 FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: categories fk_rails_9ba1667f2b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY categories
    ADD CONSTRAINT fk_rails_9ba1667f2b FOREIGN KEY (subsection_id) REFERENCES subsections(id);


--
-- Name: videos fk_rails_a2aee9449d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY videos
    ADD CONSTRAINT fk_rails_a2aee9449d FOREIGN KEY (series_id) REFERENCES series(id);


--
-- Name: series fk_rails_d50a220694; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY series
    ADD CONSTRAINT fk_rails_d50a220694 FOREIGN KEY (category_id) REFERENCES categories(id);


--
-- Name: videos fk_rails_dc08c1994c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY videos
    ADD CONSTRAINT fk_rails_dc08c1994c FOREIGN KEY (course_id) REFERENCES courses(id);


--
-- Name: subsections fk_rails_dd9427d3db; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY subsections
    ADD CONSTRAINT fk_rails_dd9427d3db FOREIGN KEY (section_id) REFERENCES sections(id);


--
-- Name: videos fk_rails_edd73071b6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY videos
    ADD CONSTRAINT fk_rails_edd73071b6 FOREIGN KEY (category_id) REFERENCES categories(id);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user", public;

INSERT INTO "schema_migrations" (version) VALUES
('20170828142617'),
('20170829121743'),
('20170829122629'),
('20170829123213'),
('20170829124452'),
('20170829125252'),
('20170829130413'),
('20170922172600'),
('20170925190751'),
('20171030201335'),
('20171030201522'),
('20171106133117'),
('20171106133210'),
('20171120121856'),
('20171122192715'),
('20171212192237'),
('20171218174635'),
('20180125170839'),
('20180125171816'),
('20180131182654');


