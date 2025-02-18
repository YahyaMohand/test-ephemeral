-- CreateIndex
CREATE INDEX "orders_merchant_user_id_idx" ON "orders"("merchant_user_id");

-- CreateIndex
CREATE INDEX "orders_merchant_id_merchant_user_id_idx" ON "orders"("merchant_id", "merchant_user_id");
