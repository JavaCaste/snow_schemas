USE SCHEMA DEMO;

CREATE MASKING POLICY email_visibility_v3 AS
(email string, visibility string) RETURNS string ->
  CASE 
    WHEN current_role()='SECURITYADMIN' THEN email
    WHEN visibility='PUBLIC' THEN email
    ELSE '******'
  END;
