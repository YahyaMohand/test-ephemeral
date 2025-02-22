-- DropIndex
DROP INDEX "orders_id_idx";

-- CreateIndex
CREATE INDEX "orders_id_variant_id_consumer_id_idx" ON "orders"("id", "variant_id", "consumer_id");

-- AddForeignKey
ALTER TABLE "orders" ADD CONSTRAINT "orders_consumer_id_fkey" FOREIGN KEY ("consumer_id") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;
