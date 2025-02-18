

-- CreateTable
CREATE TABLE "tajir_zone_merchant_whitelist" (
    "id" SERIAL NOT NULL,
    "phone_number" TEXT NOT NULL,
    "active" BOOLEAN NOT NULL DEFAULT true,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "tajir_zone_merchant_whitelist_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE INDEX "tajir_zone_merchant_whitelist_phone_number_active_idx" ON "tajir_zone_merchant_whitelist"("phone_number", "active");
