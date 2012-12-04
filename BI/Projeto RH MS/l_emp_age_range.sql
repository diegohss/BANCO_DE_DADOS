-- Table: rh.l_emp_age_range

-- DROP TABLE rh.l_emp_age_range;
use bi_kivah
go
CREATE TABLE l_emp_age_range
(
  emp_age_rng_id smallint NOT NULL,
  emp_age_rng_desc varchar(30),
  CONSTRAINT l_emp_age_range_pkey PRIMARY KEY (emp_age_rng_id )
)
