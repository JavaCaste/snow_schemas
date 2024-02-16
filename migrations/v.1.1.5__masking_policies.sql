CREATE MASKING POLICY email_visibility_v2 AS
(email string, visibility string) RETURNS string ->
  CASE 
    WHEN currenr_role()='ACCOUNTADMIN' THEN email
    WHEN visibility='PUBLIC' THEN email
    ELSE '******'
  END;
