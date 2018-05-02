#!/bin/bash

psql -c "DROP TABLE switch.participant_fsp_mapping;"

pqsl - c "CREATE TABLE switch.participant_fsp_mapping (uuid uuid NOT NULL, type text COLLATE pg_catalog."default", id text COLLATE pg_catalog."default", sub_id text COLLATE pg_catalog."default", fsp_id text COLLATE pg_catalog."default", created_by text COLLATE pg_catalog."default", created_date timestamp with time zone DEFAULT now(), updated_by text COLLATE pg_catalog."default", updated_date timestamp with time zone DEFAULT now(), CONSTRAINT participant_fsp_mapping_pkey PRIMARY KEY (uuid)) WITH ( OIDS = FALSE) TABLESPACE pg_default;"

echo "Table created"

psql -c "ALTER TABLE switch.participant_fsp_mapping OWNER to mojaloop;"
