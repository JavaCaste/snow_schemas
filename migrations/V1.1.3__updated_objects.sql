USE SCHEMA DEMO;

ALTER TABLE HELLO_WORLD MODIFY COLUMN EMAIL SET MASKING POLICY EMAIL_VISIBILITY;

CREATE MASKING POLICY email_visibility_v2 AS
(email string, visibility string) RETURNS string ->
  CASE 
    WHEN current_role()='ACCOUNTADMIN' THEN email
    WHEN visibility='PUBLIC' THEN email
    ELSE '******'
  END;
