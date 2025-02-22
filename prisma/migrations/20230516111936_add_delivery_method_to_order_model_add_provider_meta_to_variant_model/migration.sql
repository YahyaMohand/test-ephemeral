-- AlterTable
ALTER TABLE "orders" ADD COLUMN     "delivery_method" JSONB DEFAULT '{}';

-- AlterTable
ALTER TABLE "variants" ADD COLUMN     "provider_meta_data" JSONB DEFAULT '{}';
