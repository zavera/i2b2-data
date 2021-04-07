--==============================================================
-- Database Script to upgrade CRC from 1.6 to 1.7                  
--==============================================================

alter table qt_query_master add PM_XML TEXT
;

ALTER TABLE PATIENT_MAPPING
DROP CONSTRAINT PATIENT_MAPPING_PK
;

alter table PATIENT_MAPPING add  PROJECT_ID VARCHAR(50)
;

update PATIENT_MAPPING set PROJECT_ID = 'Demo'
;

alter table PATIENT_MAPPING alter column  PROJECT_ID VARCHAR(50) NOT NULL
;

ALTER TABLE PATIENT_MAPPING
ADD CONSTRAINT PATIENT_MAPPING_PK PRIMARY KEY nonclustered (PATIENT_IDE, PATIENT_IDE_SOURCE, PROJECT_ID)
;

ALTER TABLE ENCOUNTER_MAPPING
DROP CONSTRAINT ENCOUNTER_MAPPING_PK
;

alter table ENCOUNTER_MAPPING add  PROJECT_ID VARCHAR(50)
;

update ENCOUNTER_MAPPING set PROJECT_ID = 'Demo'
;

alter table ENCOUNTER_MAPPING alter column  PROJECT_ID VARCHAR(50) NOT NULL
;

ALTER TABLE ENCOUNTER_MAPPING
ADD CONSTRAINT ENCOUNTER_MAPPING_PK PRIMARY KEY nonclustered (ENCOUNTER_IDE, ENCOUNTER_IDE_SOURCE, PATIENT_IDE, PATIENT_IDE_SOURCE, PROJECT_ID)
;
