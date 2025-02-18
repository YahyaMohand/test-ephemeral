-- Add the permissions for the role admin, super_admin
UPDATE role_permissions
SET permissions = permissions || '{"subject": "marketplace", "action": "getAllMarketplaces"}'::jsonb
WHERE role IN ('admin', 'super_admin');