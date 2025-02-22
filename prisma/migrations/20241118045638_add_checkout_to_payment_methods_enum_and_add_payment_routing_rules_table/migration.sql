-- AlterEnum
ALTER TYPE "PaymentMethods" ADD VALUE 'CHECKOUT';

-- CreateTable
CREATE TABLE "payment_routing_rules" (
    "id" SERIAL NOT NULL,
    "paymentMethod" "PaymentMethods" NOT NULL,
    "marketplaceId" INTEGER NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "is_active" BOOLEAN NOT NULL DEFAULT true,
    "variantId" INTEGER NOT NULL,
    CONSTRAINT "payment_routing_rules_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "payment_routing_rules" ADD CONSTRAINT "payment_routing_rules_marketplaceId_fkey" FOREIGN KEY ("marketplaceId") REFERENCES "marketplaces"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
-- AddForeignKey
ALTER TABLE "payment_routing_rules" ADD CONSTRAINT "payment_routing_rules_variantId_fkey" FOREIGN KEY ("variantId") REFERENCES "variants"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
-- CreateIndex
CREATE UNIQUE INDEX "payment_routing_rules_variantId_marketplaceId_paymentMethod_key" ON "payment_routing_rules"("variantId", "marketplaceId", "paymentMethod");
