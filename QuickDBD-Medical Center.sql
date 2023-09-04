-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/gsUiP3
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).

DROP DATABASE medical_center;
CREATE DATABASE medical_center;
\c medical_center;

CREATE TABLE Doctor (
    DoctorID SERIAL  NOT NULL ,
    Name TEXT  NOT NULL ,
    Specialty TEXT  NOT NULL ,
    CONSTRAINT PK_Doctor PRIMARY KEY (
        DoctorID
    )
);

CREATE TABLE Patients (
    PatientID SERIAL  NOT NULL ,
    Birthday TEXT  NOT NULL ,
    Diagnosis TEXT  NOT NULL ,
    Insurance TEXT  NOT NULL ,
    CONSTRAINT PK_Patients PRIMARY KEY (
        PatientID
    )
);

CREATE TABLE Diagnosis (
    DiagnosisID SERIAL  NOT NULL ,
    Treatments TEXT  NOT NULL ,
    VisitID INTEGER NOT NULL ,
    DiseaseID INTEGER  NOT NULL ,
    CONSTRAINT PK_Diagnosis PRIMARY KEY (
        DiagnosisID
    )
);

CREATE TABLE Visits (
    VisitID SERIAL  NOT NULL ,
    DoctorID INTEGER  NOT NULL ,
    PatientID INTEGER  NOT NULL ,
    Date TEXT  NOT NULL ,
    Notes TEXT  NOT NULL ,
    CONSTRAINT PK_Visits PRIMARY KEY (
        VisitID
    )
);

CREATE TABLE Diseases (
    DiseaseID SERIAL  NOT NULL ,
    Name TEXT  NOT NULL ,
    Description TEXT  NOT NULL ,
    CONSTRAINT PK_Diseases PRIMARY KEY (
        DiseaseID
    )
);

INSERT INTO Doctor (name, Specialty)
VALUES ('Dr. A', 'anesthesiology'),
('Dr. S', 'surgery'),
('Dr. N', 'neurology'),
('Dr. D', 'dermatology');

INSERT INTO Patients (Birthday, Diagnosis, Insurance)
VALUES ('10-20-1970', 'fracture', 'Blue Cross'),
('01-02-1996', 'vertigo', 'Medicaid'),
('06-14-1985', 'dermatitis', 'Kaiser');



--
-- ALTER TABLE [Doctor] WITH CHECK ADD CONSTRAINT [FK_Doctor_DoctorID] FOREIGN KEY([DoctorID])
--REFERENCES [Visits] ([DoctorID])

----ALTER TABLE [Doctor] CHECK CONSTRAINT [FK_Doctor_DoctorID]

--ALTER TABLE [Patients] WITH CHECK ADD CONSTRAINT --[FK_Patients_PatientID] FOREIGN KEY([PatientID])
--REFERENCES [Visits] ([PatientID])

--ALTER TABLE [Patients] CHECK CONSTRAINT [FK_Patients_PatientID]

--ALTER TABLE [Patients] WITH CHECK ADD CONSTRAINT --[FK_Patients_Diagnosis] FOREIGN KEY([Diagnosis])
--REFERENCES [Diagnosis] ([DiagnosisID])

--ALTER TABLE [Patients] CHECK CONSTRAINT [FK_Patients_Diagnosis]

--ALTER TABLE [Diagnosis] WITH CHECK ADD CONSTRAINT --[FK_Diagnosis_VisitID] FOREIGN KEY([VisitID])
--REFERENCES [Visits] ([VisitID])

--ALTER TABLE [Diagnosis] CHECK CONSTRAINT [FK_Diagnosis_VisitID]

--ALTER TABLE [Diagnosis] WITH CHECK ADD CONSTRAINT --[FK_Diagnosis_DiseaseID] FOREIGN KEY([DiseaseID])
--REFERENCES [Diseases] ([DiseaseID])

--ALTER TABLE [Diagnosis] CHECK CONSTRAINT [FK_Diagnosis_DiseaseID]

--CREATE INDEX [idx_Doctor_Name]
--ON [Doctor] ([Name])

--COMMIT TRANSACTION QUICKDBD
--