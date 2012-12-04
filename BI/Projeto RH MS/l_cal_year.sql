/*
-- Table: rh.l_cal_year

-- DROP TABLE rh.l_cal_year;

CREATE TABLE rh.l_cal_year
(
  year_id smallint NOT NULL,
  last_year_id smallint,
  CONSTRAINT l_cal_year_pkey PRIMARY KEY (year_id )
)
WITH (
  OIDS=TRUE
);
ALTER TABLE rh.l_cal_year
  OWNER TO postgres;
*/  
use bi_kivah
go
CREATE TABLE l_cal_year
(
  year_id smallint NOT NULL,
  last_year_id smallint,
  CONSTRAINT l_cal_year_pkey PRIMARY KEY (year_id )
)