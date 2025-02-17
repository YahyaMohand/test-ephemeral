-- CreateIndex
CREATE INDEX "orders_old_id_idx" ON "orders"("old_id");

-- CreateIndex
CREATE INDEX "orders_created_at_idx" ON "orders"("created_at");

-- CreateIndex
CREATE INDEX "vouchers_old_id_idx" ON "vouchers"("old_id");
