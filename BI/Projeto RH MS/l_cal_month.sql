/*
-- Table: rh.l_cal_month

-- DROP TABLE rh.l_cal_month;

CREATE TABLE rh.l_cal_month
(
  month_id numeric(6,0) NOT NULL,
  month_desc character varying(30),
  last_month_id numeric(6,0),
  qtr_id integer,
  year_id smallint,
  month_desc_sch character varying(30),
  month_desc_tch character varying(30),
  CONSTRAINT l_cal_month_pkey PRIMARY KEY (month_id )
)
WITH (
  OIDS=TRUE
);
ALTER TABLE rh.l_cal_month
  OWNER TO postgres;
*/
use bi_kivah
go
CREATE TABLE l_cal_month
(
  month_id numeric(6,0) NOT NULL,
  month_desc varchar(30),
  last_month_id numeric(6,0),
  qtr_id integer,
  year_id smallint,
  month_desc_sch varchar(30),
  month_desc_tch varchar(30),
  CONSTRAINT l_cal_month_pkey PRIMARY KEY (month_id )
)
