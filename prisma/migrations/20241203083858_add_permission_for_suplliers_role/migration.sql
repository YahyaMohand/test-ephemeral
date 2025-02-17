-- Add the permissions for the role supplier
UPDATE role_permissions
SET permissions = permissions || '{"subject": "variants", "action": "getAll"}'::jsonb 
                  || '{"subject": "brands", "action": "findAll"}'::jsonb
WHERE role IN ('supplier');
