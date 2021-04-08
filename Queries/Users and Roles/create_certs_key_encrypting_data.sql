-- create master key
USE CRUD;
GO
CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'password';

-- verify master key is created or not
SELECT name KeyName, 
    symmetric_key_id KeyID, 
    key_length KeyLength, 
    algorithm_desc KeyAlgorithm
FROM sys.symmetric_keys;

-- create master key SPS certificate
USE CRUD;
GO
CREATE CERTIFICATE Certificate_test WITH SUBJECT = 'SPS Certificate';
GO

-- verify certificate
SELECT name CertName, 
    certificate_id CertID, 
    pvt_key_encryption_type_desc EncryptType, 
    issuer_name Issuer
FROM sys.certificates;

-- create symmetric key
CREATE SYMMETRIC KEY SymKey_test WITH ALGORITHM = AES_256 ENCRYPTION BY CERTIFICATE Certificate_test;

-- verify symmetric key
SELECT name KeyName, 
    symmetric_key_id KeyID, 
    key_length KeyLength, 
    algorithm_desc KeyAlgorithm
FROM sys.symmetric_keys;

-- add new encrypted column to Inmate
ALTER TABLE Inmates
ADD inmateName_Encrypted varbinary(MAX)

-- open up symmetric key to use
OPEN SYMMETRIC KEY SymKey_test
        DECRYPTION BY CERTIFICATE Certificate_test;

-- apply symmetric key
UPDATE Inmates
        SET inmateName_Encrypted = EncryptByKey (Key_GUID('SymKey_test'), inmateName)
        FROM Inmates;
        GO

-- close symmetric key session
CLOSE SYMMETRIC KEY SymKey_test;
            GO

