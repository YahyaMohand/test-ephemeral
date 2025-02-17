-- Add the permissions for the role admin, super_admin, suppliers
UPDATE role_permissions
SET permissions = permissions || '{"subject": "vouchers", "action": "createVouchersBulks"}'::jsonb
WHERE role IN ('admin', 'super_admin', 'supplier');