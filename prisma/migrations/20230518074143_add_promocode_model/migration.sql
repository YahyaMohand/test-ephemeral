-- CreateEnum
CREATE TYPE "PromoCodeValueType" AS ENUM ('RATE', 'FIXED');

-- CreateTable
CREATE TABLE "promo_codes" (
    "id" SERIAL NOT NULL,
    "code" TEXT NOT NULL,
    "value" DOUBLE PRECISION NOT NULL,
    "value_type" "PromoCodeValueType" NOT NULL,
    "max_usage" INTEGER NOT NULL DEFAULT 1,
    "expiry_date" TIMESTAMP(3) NOT NULL,
    "consumer_phone" TEXT,
    "min_register_date" TIMESTAMP(3),
    "variants_ids" INTEGER[],
    "is_active" BOOLEAN NOT NULL DEFAULT true,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "promo_codes_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "promo_codes_code_key" ON "promo_codes"("code");

-- CreateIndex
CREATE INDEX "promo_codes_id_code_idx" ON "promo_codes"("id", "code");

-- AddForeignKey
ALTER TABLE "orders" ADD CONSTRAINT "orders_promo_code_id_fkey" FOREIGN KEY ("promo_code_id") REFERENCES "promo_codes"("id") ON DELETE SET NULL ON UPDATE CASCADE;
