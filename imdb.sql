--PostgreSQL Maestro 10.12.0.2
------------------------------------------
--Host     : localhost:1432
--Database : imdb


\connect - postgres
CREATE DATABASE imdb WITH TEMPLATE = template0 ENCODING = 6 TABLESPACE = pg_default;
\connect imdb postgres
CREATE SCHEMA movie AUTHORIZATION postgres;
CREATE SCHEMA news AUTHORIZATION postgres;
CREATE SCHEMA "user" AUTHORIZATION postgres;
-- Structure for table cast (OID = 16396):
SET search_path = movie, pg_catalog;
CREATE TABLE "cast" (
    "movieId" integer NOT NULL,
    "personId" integer NOT NULL,
    name varchar(50),
    "jobTypeId" integer NOT NULL
) WITHOUT OIDS;
-- Structure for table genre (OID = 16399):
CREATE TABLE genre (
    id integer DEFAULT nextval('genre_id_seq'::regclass) NOT NULL,
    name varchar(50) NOT NULL
) WITHOUT OIDS;
-- Definition for sequence genre_id_seq (OID = 16402):
CREATE SEQUENCE genre_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
-- Structure for table jobType (OID = 16404):
CREATE TABLE "jobType" (
    id integer NOT NULL,
    name varchar(40) NOT NULL
) WITHOUT OIDS;
-- Structure for table movie (OID = 16407):
CREATE TABLE movie (
    id integer DEFAULT nextval('movie_id_seq'::regclass) NOT NULL,
    name varchar(100),
    "alternativeName" varchar(150),
    description text,
    date varchar(4) NOT NULL,
    "countryId" integer
) WITHOUT OIDS;
-- Structure for table comment (OID = 16413):
SET search_path = public, pg_catalog;
CREATE TABLE "comment" (
    id integer DEFAULT nextval('public.comment_id_seq'::regclass) NOT NULL,
    "comment" text NOT NULL,
    "userId" integer NOT NULL,
    date date NOT NULL,
    "isDeleted" boolean NOT NULL
) WITHOUT OIDS;
-- Definition for sequence comment_id_seq (OID = 16419):
CREATE SEQUENCE comment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
-- Structure for table movieComment (OID = 16422):
SET search_path = movie, pg_catalog;
CREATE TABLE "movieComment" (
    id integer DEFAULT nextval('comment_id_seq'::regclass),
    "movieId" integer NOT NULL
)
INHERITS (public."comment") WITHOUT OIDS;
-- Structure for table movieGenreMapping (OID = 16429):
CREATE TABLE "movieGenreMapping" (
    "movieId" integer NOT NULL,
    "genreId" integer NOT NULL
) WITHOUT OIDS;
-- Structure for table movieLanguageMapping (OID = 16432):
CREATE TABLE "movieLanguageMapping" (
    "movieId" integer NOT NULL,
    "languageId" integer NOT NULL
) WITHOUT OIDS;
-- Definition for sequence movie_id_seq (OID = 16435):
CREATE SEQUENCE movie_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
-- Structure for table person (OID = 16437):
CREATE TABLE person (
    id integer DEFAULT nextval('person_id_seq'::regclass) NOT NULL,
    name varchar(75) NOT NULL,
    "birthDate" date,
    "isDead" boolean NOT NULL,
    "deathDate" date
) WITHOUT OIDS;
-- Definition for sequence person_id_seq (OID = 16440):
CREATE SEQUENCE person_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
-- Structure for table release (OID = 16442):
CREATE TABLE release (
    "movieId" integer NOT NULL,
    "countryId" integer NOT NULL,
    date date NOT NULL
) WITHOUT OIDS;
-- Structure for table video (OID = 16445):
CREATE TABLE video (
    id integer DEFAULT nextval('videos_id_seq'::regclass) NOT NULL,
    name varchar(100) NOT NULL,
    url varchar(250) NOT NULL,
    date date,
    "movieId" integer NOT NULL,
    "isActive" boolean NOT NULL,
    description text
) WITHOUT OIDS;
-- Structure for table videoComment (OID = 16451):
CREATE TABLE "videoComment" (
    id integer,
    "videoId" integer NOT NULL
)
INHERITS (public."comment") WITHOUT OIDS;
-- Definition for sequence videos_id_seq (OID = 16458):
CREATE SEQUENCE videos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
-- Structure for table category (OID = 16460):
SET search_path = news, pg_catalog;
CREATE TABLE category (
    id integer DEFAULT nextval('news.category_id_seq'::regclass) NOT NULL,
    name varchar(50) NOT NULL,
    description text
) WITHOUT OIDS;
-- Definition for sequence category_id_seq (OID = 16466):
CREATE SEQUENCE category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
-- Structure for table news (OID = 16468):
CREATE TABLE news (
    id integer DEFAULT nextval('news_id_seq'::regclass) NOT NULL,
    title varchar(150) NOT NULL,
    content text NOT NULL,
    date date NOT NULL,
    "isActive" boolean NOT NULL,
    "categoryId" integer
) WITHOUT OIDS;
-- Structure for table newsComment (OID = 16474):
CREATE TABLE "newsComment" (
    id integer,
    "newsId" integer NOT NULL
)
INHERITS (public."comment") WITHOUT OIDS;
-- Definition for sequence news_id_seq (OID = 16481):
CREATE SEQUENCE news_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
-- Structure for table country (OID = 16483):
SET search_path = public, pg_catalog;
CREATE TABLE country (
    id integer DEFAULT nextval('public.country_id_seq'::regclass) NOT NULL,
    name varchar(75) NOT NULL,
    code varchar(5) NOT NULL
) WITHOUT OIDS;
-- Definition for sequence country_id_seq (OID = 16486):
CREATE SEQUENCE country_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
-- Structure for table language (OID = 16488):
CREATE TABLE "language" (
    id integer DEFAULT nextval('language_id_seq'::regclass) NOT NULL,
    name varchar(50) NOT NULL,
    code varchar(5)
) WITHOUT OIDS;
-- Definition for sequence language_id_seq (OID = 16491):
CREATE SEQUENCE language_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
-- Structure for table type (OID = 16493):
SET search_path = "user", pg_catalog;
CREATE TABLE "type" (
    id integer DEFAULT nextval('"user".type_id_seq'::regclass) NOT NULL,
    name varchar(50) NOT NULL
) WITHOUT OIDS;
-- Definition for sequence type_id_seq (OID = 16496):
CREATE SEQUENCE type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
-- Structure for table user (OID = 16498):
CREATE TABLE "user" (
    id integer DEFAULT nextval('user_id_seq'::regclass) NOT NULL,
    name varchar(50),
    "password" varchar(10) NOT NULL,
    email varchar(75) NOT NULL,
    "isActive" boolean NOT NULL,
    "registrationDate" date NOT NULL,
    "userTypeId" integer NOT NULL,
    "languageId" integer NOT NULL,
    "countryId" integer NOT NULL
) WITHOUT OIDS;
-- Definition for sequence user_id_seq (OID = 16501):
CREATE SEQUENCE user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
-- Structure for table vote (OID = 16503):
CREATE TABLE vote (
    "movieId" integer NOT NULL,
    "userId" integer NOT NULL,
    rate smallint NOT NULL,
    date date NOT NULL,
    CONSTRAINT rate CHECK (((rate >= 1) AND (rate <= 10)))
) WITHOUT OIDS;
SET search_path = movie, pg_catalog;
SET search_path = public, pg_catalog;
SET search_path = movie, pg_catalog;
SET search_path = news, pg_catalog;
SET search_path = public, pg_catalog;
SET search_path = "user", pg_catalog;
-- Definition for index genre_name_key (OID = 16517):
SET search_path = movie, pg_catalog;
ALTER TABLE ONLY genre
    ADD CONSTRAINT genre_name_key UNIQUE (name);
-- Definition for index genre_pkey (OID = 16519):
ALTER TABLE ONLY genre
    ADD CONSTRAINT genre_pkey PRIMARY KEY (id);
-- Definition for index jobType_name_key (OID = 16521):
ALTER TABLE ONLY "jobType"
    ADD CONSTRAINT "jobType_name_key" UNIQUE (name);
-- Definition for index jobType_pkey (OID = 16523):
ALTER TABLE ONLY "jobType"
    ADD CONSTRAINT "jobType_pkey" PRIMARY KEY (id);
-- Definition for index movieComment_pkey (OID = 16525):
ALTER TABLE ONLY "movieComment"
    ADD CONSTRAINT "movieComment_pkey" PRIMARY KEY (id);
-- Definition for index movie_pkey (OID = 16527):
ALTER TABLE ONLY movie
    ADD CONSTRAINT movie_pkey PRIMARY KEY (id);
-- Definition for index person_pkey (OID = 16529):
ALTER TABLE ONLY person
    ADD CONSTRAINT person_pkey PRIMARY KEY (id);
-- Definition for index videoComment_pkey (OID = 16531):
ALTER TABLE ONLY "videoComment"
    ADD CONSTRAINT "videoComment_pkey" PRIMARY KEY (id);
-- Definition for index videos_pkey (OID = 16533):
ALTER TABLE ONLY video
    ADD CONSTRAINT videos_pkey PRIMARY KEY (id);
-- Definition for index category_name_key (OID = 16535):
SET search_path = news, pg_catalog;
ALTER TABLE ONLY category
    ADD CONSTRAINT category_name_key UNIQUE (name);
-- Definition for index category_pkey (OID = 16537):
ALTER TABLE ONLY category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id);
-- Definition for index newsComment_pkey (OID = 16539):
ALTER TABLE ONLY "newsComment"
    ADD CONSTRAINT "newsComment_pkey" PRIMARY KEY (id);
-- Definition for index news_pkey (OID = 16541):
ALTER TABLE ONLY news
    ADD CONSTRAINT news_pkey PRIMARY KEY (id);
-- Definition for index comment_pkey (OID = 16543):
SET search_path = public, pg_catalog;
ALTER TABLE ONLY "comment"
    ADD CONSTRAINT comment_pkey PRIMARY KEY (id);
-- Definition for index country_name_code_key (OID = 16545):
ALTER TABLE ONLY country
    ADD CONSTRAINT country_name_code_key UNIQUE (name, code);
-- Definition for index country_pkey (OID = 16547):
ALTER TABLE ONLY country
    ADD CONSTRAINT country_pkey PRIMARY KEY (id);
-- Definition for index language_code_key (OID = 16549):
ALTER TABLE ONLY "language"
    ADD CONSTRAINT language_code_key UNIQUE (code);
-- Definition for index language_name_key (OID = 16551):
ALTER TABLE ONLY "language"
    ADD CONSTRAINT language_name_key UNIQUE (name);
-- Definition for index language_pkey (OID = 16553):
ALTER TABLE ONLY "language"
    ADD CONSTRAINT language_pkey PRIMARY KEY (id);
-- Definition for index type_id_name_key (OID = 16555):
SET search_path = "user", pg_catalog;
ALTER TABLE ONLY "type"
    ADD CONSTRAINT type_id_name_key UNIQUE (id, name);
-- Definition for index type_pkey (OID = 16557):
ALTER TABLE ONLY "type"
    ADD CONSTRAINT type_pkey PRIMARY KEY (id);
-- Definition for index user_name_id_email_key (OID = 16559):
ALTER TABLE ONLY "user"
    ADD CONSTRAINT user_name_id_email_key UNIQUE (name, id, email);
-- Definition for index user_pkey (OID = 16561):
ALTER TABLE ONLY "user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);
-- Definition for index cast_jobTypeId_fkey (OID = 16563):
SET search_path = movie, pg_catalog;
ALTER TABLE ONLY "cast"
    ADD CONSTRAINT "cast_jobTypeId_fkey" FOREIGN KEY ("jobTypeId") REFERENCES "jobType"(id);
-- Definition for index cast_movieId_fkey (OID = 16568):
ALTER TABLE ONLY "cast"
    ADD CONSTRAINT "cast_movieId_fkey" FOREIGN KEY ("movieId") REFERENCES movie(id);
-- Definition for index cast_personId_fkey (OID = 16573):
ALTER TABLE ONLY "cast"
    ADD CONSTRAINT "cast_personId_fkey" FOREIGN KEY ("personId") REFERENCES person(id);
-- Definition for index movieComment_movieId_fkey (OID = 16578):
ALTER TABLE ONLY "movieComment"
    ADD CONSTRAINT "movieComment_movieId_fkey" FOREIGN KEY ("movieId") REFERENCES movie(id);
-- Definition for index movieGenreMapping_genreId_fkey (OID = 16583):
ALTER TABLE ONLY "movieGenreMapping"
    ADD CONSTRAINT "movieGenreMapping_genreId_fkey" FOREIGN KEY ("genreId") REFERENCES genre(id);
-- Definition for index movieGenreMapping_movieId_fkey (OID = 16588):
ALTER TABLE ONLY "movieGenreMapping"
    ADD CONSTRAINT "movieGenreMapping_movieId_fkey" FOREIGN KEY ("movieId") REFERENCES movie(id);
-- Definition for index movieLanguageMapping_languageId_fkey (OID = 16593):
ALTER TABLE ONLY "movieLanguageMapping"
    ADD CONSTRAINT "movieLanguageMapping_languageId_fkey" FOREIGN KEY ("languageId") REFERENCES public.language(id);
-- Definition for index movieLanguageMapping_movieId_fkey (OID = 16598):
ALTER TABLE ONLY "movieLanguageMapping"
    ADD CONSTRAINT "movieLanguageMapping_movieId_fkey" FOREIGN KEY ("movieId") REFERENCES movie(id);
-- Definition for index movie_countryId_fkey (OID = 16603):
ALTER TABLE ONLY movie
    ADD CONSTRAINT "movie_countryId_fkey" FOREIGN KEY ("countryId") REFERENCES public.country(id);
-- Definition for index release_countryId_fkey (OID = 16608):
ALTER TABLE ONLY release
    ADD CONSTRAINT "release_countryId_fkey" FOREIGN KEY ("countryId") REFERENCES public.country(id);
-- Definition for index release_movieId_fkey (OID = 16613):
ALTER TABLE ONLY release
    ADD CONSTRAINT "release_movieId_fkey" FOREIGN KEY ("movieId") REFERENCES movie(id);
-- Definition for index videoComment_videoId_fkey (OID = 16618):
ALTER TABLE ONLY "videoComment"
    ADD CONSTRAINT "videoComment_videoId_fkey" FOREIGN KEY ("videoId") REFERENCES video(id);
-- Definition for index videos_movieId_fkey (OID = 16623):
ALTER TABLE ONLY video
    ADD CONSTRAINT "videos_movieId_fkey" FOREIGN KEY ("movieId") REFERENCES movie(id);
-- Definition for index newsComment_newsId_fkey (OID = 16628):
SET search_path = news, pg_catalog;
ALTER TABLE ONLY "newsComment"
    ADD CONSTRAINT "newsComment_newsId_fkey" FOREIGN KEY ("newsId") REFERENCES news(id);
-- Definition for index news_categoryId_fkey (OID = 16633):
ALTER TABLE ONLY news
    ADD CONSTRAINT "news_categoryId_fkey" FOREIGN KEY ("categoryId") REFERENCES category(id);
-- Definition for index user_countryId_fkey (OID = 16638):
SET search_path = "user", pg_catalog;
ALTER TABLE ONLY "user"
    ADD CONSTRAINT "user_countryId_fkey" FOREIGN KEY ("countryId") REFERENCES public.country(id);
-- Definition for index user_languageId_fkey (OID = 16643):
ALTER TABLE ONLY "user"
    ADD CONSTRAINT "user_languageId_fkey" FOREIGN KEY ("languageId") REFERENCES public.language(id);
-- Definition for index user_userTypeId_fkey (OID = 16648):
ALTER TABLE ONLY "user"
    ADD CONSTRAINT "user_userTypeId_fkey" FOREIGN KEY ("userTypeId") REFERENCES type(id);
-- Definition for index vote_movieId_fkey (OID = 16653):
ALTER TABLE ONLY vote
    ADD CONSTRAINT "vote_movieId_fkey" FOREIGN KEY ("movieId") REFERENCES movie.movie(id);
-- Definition for index vote_userId_fkey (OID = 16658):
ALTER TABLE ONLY vote
    ADD CONSTRAINT "vote_userId_fkey" FOREIGN KEY ("userId") REFERENCES "user"(id);
SET search_path = pg_catalog, pg_catalog;
COMMENT ON SCHEMA public IS 'standard public schema';

