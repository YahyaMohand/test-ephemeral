-- DropIndex
DROP INDEX "ticket_orders_id_idx";

-- CreateIndex
CREATE INDEX "ticket_orders_id_orderNumber_idx" ON "ticket_orders"("id", "orderNumber");
