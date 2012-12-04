/*
-- Table: rh.l_cal_qtr

-- DROP TABLE rh.l_cal_qtr;

CREATE TABLE rh.l_cal_qtr
(
  qtr_id numeric(6,0) NOT NULL,
  qtr_desc character varying(30),
  last_qtr_id numeric(6,0),
  year_id smallint,
  qtr_desc_sch character varying(30),
  qtr_desc_tch character varying(30),
  CONSTRAINT l_cal_qtr_pkey PRIMARY KEY (qtr_id )
)
WITH (
  OIDS=TRUE
);
ALTER TABLE rh.l_cal_qtr
  OWNER TO postgres;
*/
use bi_kivah
go
CREATE TABLE l_cal_qtr
(
  qtr_id numeric(6,0) NOT NULL,
  qtr_desc varchar(30),
  last_qtr_id numeric(6,0),
  year_id smallint,
  qtr_desc_sch varchar(30),
  qtr_desc_tch varchar(30),
  CONSTRAINT l_cal_qtr_pkey PRIMARY KEY (qtr_id )
)