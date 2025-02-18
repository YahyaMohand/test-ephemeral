-- Add the permissions for the role admin, super_admin
UPDATE role_permissions
SET permissions = permissions || '{"subject": "products", "action": "bulkUpdate"}'::jsonb
WHERE role IN ('admin', 'super_admin');