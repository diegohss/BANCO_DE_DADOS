/*
CREATE TABLE rh.l_cal_date
(
  date_id timestamp(0) without time zone,
  year_id numeric(4,0),
  qtr_id numeric,
  month_id numeric(6,0)
)
WITH (
  OIDS=TRUE
);
ALTER TABLE rh.l_cal_date
  OWNER TO postgres;
*/
use bi_kivah
go
CREATE TABLE l_cal_date
(
  date_id datetime,
  year_id numeric(4,0),
  qtr_id numeric,
  month_id numeric(6,0)
)