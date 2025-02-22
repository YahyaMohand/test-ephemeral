-- CreateEnum
CREATE TYPE "PricingType" AS ENUM ('FIXED', 'CALCULATED');


-- CreateTable
CREATE TABLE "marketplace_variants" (
    "id" SERIAL NOT NULL,
    "commission" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "added_cost" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "pricing_type" "PricingType" NOT NULL DEFAULT 'FIXED',
    "price" DOUBLE PRECISION NOT NULL,
    "active" BOOLEAN NOT NULL DEFAULT true,
    "variant_id" INTEGER NOT NULL,
    "marketplace_id" INTEGER NOT NULL,
    "deleted" BOOLEAN DEFAULT false,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "marketplace_variants_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE INDEX "marketplace_variants_variant_id_marketplace_id_idx" ON "marketplace_variants"("variant_id", "marketplace_id");

-- AddForeignKey
ALTER TABLE "marketplace_variants" ADD CONSTRAINT "marketplace_variants_variant_id_fkey" FOREIGN KEY ("variant_id") REFERENCES "variants"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "marketplace_variants" ADD CONSTRAINT "marketplace_variants_marketplace_id_fkey" FOREIGN KEY ("marketplace_id") REFERENCES "marketplaces"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
