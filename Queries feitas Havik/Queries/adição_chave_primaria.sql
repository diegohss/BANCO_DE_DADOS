alter table br_cidades ALTER COLUMN MUNCOD nvarchar(6) not null

ALTER TABLE br_cidades 
    ADD CONSTRAINT pk_id_cidades 
    PRIMARY KEY (MUNCOD)
    
alter table br_estados ALTER COLUMN ufcod nvarchar(2) not null    

ALTER TABLE br_estados
    ADD CONSTRAINT pk_id_estados 
    PRIMARY KEY (ufcod)