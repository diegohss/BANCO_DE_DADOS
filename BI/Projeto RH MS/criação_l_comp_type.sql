-- Table: rh.l_comp_type

-- DROP TABLE rh.l_comp_type;

use bi_kivah
go

CREATE TABLE l_comp_type
(
  comp_type_id smallint NOT NULL,
  comp_type_desc character varying(30),
  comp_type_desc_sch character varying(30),
  comp_type_desc_tch character varying(30),
  CONSTRAINT l_comp_type_pkey PRIMARY KEY (comp_type_id)
)