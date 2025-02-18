-- CreateEnum
CREATE TYPE "PromoCodeType" AS ENUM ('BRAND', 'PRODUCT', 'VARIANT');

-- AlterTable
ALTER TABLE
  "promo_codes" RENAME COLUMN "variants_ids" TO "promocodable_ids";

ALTER TABLE
  "promo_codes" ADD COLUMN "promocodable_type" "PromoCodeType" NOT NULL DEFAULT 'VARIANT';
