-- Add the permissions for the role supplier
UPDATE role_permissions
SET permissions = permissions || '{"subject": "vouchers", "action": "createVouchersBulks"}'::jsonb 
WHERE role IN ('supplier');