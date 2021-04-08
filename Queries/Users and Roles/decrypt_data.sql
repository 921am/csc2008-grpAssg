-- get symmetric key to decrypt 
OPEN SYMMETRIC KEY SymKey_test
        DECRYPTION BY CERTIFICATE Certificate_test;

-- decrypt encrypted inmateName
SELECT inmateID, inmateName_Encrypted AS 'Encrypted data',
            CONVERT(varchar, DecryptByKey(inmateName_Encrypted)) AS 'Decrypted Inmate Name'
            FROM Inmates;