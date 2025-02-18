-- CreateIndex
CREATE INDEX "orders_consumer_id_idx" ON "orders"("consumer_id");

-- CreateIndex
CREATE INDEX "orders_consumer_id_status_idx" ON "orders"("consumer_id", "status");
