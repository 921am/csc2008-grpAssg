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