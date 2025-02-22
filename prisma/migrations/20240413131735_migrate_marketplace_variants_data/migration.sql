-- Insert marketplaces if they don't exist
INSERT INTO "marketplaces" ("name", "deleted", "created_at", "updated_at", "platform")
SELECT 'SUPER_QI_APP', 'f', NOW(), NOW(), 'SUPER_QI_APP'
WHERE NOT EXISTS (
    SELECT * FROM marketplaces WHERE platform = 'SUPER_QI_APP'
);

INSERT INTO "marketplaces" ("name", "deleted", "created_at", "updated_at", "platform")
SELECT 'QI_SERVICES_APP', 'f', NOW(), NOW(), 'QI_SERVICES_APP'
WHERE NOT EXISTS (
    SELECT * FROM marketplaces WHERE platform = 'QI_SERVICES_APP'
);

INSERT INTO "marketplaces" ("name", "deleted", "created_at", "updated_at", "platform")
SELECT 'CONSUMER_APP', 'f', NOW(), NOW(), 'CONSUMER_APP'
WHERE NOT EXISTS (
    SELECT * FROM marketplaces WHERE platform = 'CONSUMER_APP'
);


-- Insert marketplace variants for SUPER_QI_APP
INSERT INTO "marketplace_variants" ("commission", "added_cost", "pricing_type", "price", "active", "variant_id", "marketplace_id", "deleted", "created_at", "updated_at")
SELECT 
    0 as commission,
    0 as added_cost,
    'FIXED' as pricing_type,
    variants.price as price,
    't' as active,
    variants.id as variant_id,
    (SELECT MIN(id) FROM marketplaces WHERE platform = 'SUPER_QI_APP') as marketplace_id,
    'f' as deleted,
    NOW() as created_at,
    NOW() as updated_at
FROM 
    variants
    JOIN products ON variants.product_id = products.id
    JOIN brands ON brands.id = products."brandId"
WHERE 
    variants.is_active AND products.is_active AND brands.is_active;


-- Insert marketplace variants for QI_SERVICES_APP
INSERT INTO "marketplace_variants" ("commission", "added_cost", "pricing_type", "price", "active", "variant_id", "marketplace_id", "deleted", "created_at", "updated_at")
SELECT 
    0 as commission,
    0 as added_cost,
    'FIXED' as pricing_type,
    variants.price as price,
    't' as active,
    variants.id as variant_id,
    (SELECT MIN(id) FROM marketplaces WHERE platform = 'QI_SERVICES_APP') as marketplace_id,
    'f' as deleted,
    NOW() as created_at,
    NOW() as updated_at
FROM 
    variants
    JOIN products ON variants.product_id = products.id
    JOIN brands ON brands.id = products."brandId"
WHERE 
    variants.is_active AND products.is_active AND brands.is_active;


-- Insert marketplace variants for CONSUMER_APP
INSERT INTO "marketplace_variants" ("commission", "added_cost", "pricing_type", "price", "active", "variant_id", "marketplace_id", "deleted", "created_at", "updated_at")
SELECT 
    0 as commission,
    0 as added_cost,
    'FIXED' as pricing_type,
    variants.price as price,
    't' as active,
    variants.id as variant_id,
    (SELECT MIN(id) FROM marketplaces WHERE platform = 'CONSUMER_APP') as marketplace_id,
    'f' as deleted,
    NOW() as created_at,
    NOW() as updated_at
FROM 
    variants
    JOIN products ON variants.product_id = products.id
    JOIN brands ON brands.id = products."brandId"
WHERE 
    variants.is_active AND products.is_active AND brands.is_active;
