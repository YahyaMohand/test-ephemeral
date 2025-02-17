-- Add the permissions for the role admin, super_admin
UPDATE role_permissions
SET permissions = permissions || '{"subject": "variants", "action": "imageBulkUpdate"}'::jsonb
WHERE role IN ('admin', 'super_admin');