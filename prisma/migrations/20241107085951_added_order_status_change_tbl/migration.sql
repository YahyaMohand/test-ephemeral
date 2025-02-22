
-- AlterTable
ALTER TABLE "orders" ADD COLUMN     "failure_reason" TEXT DEFAULT '';

-- CreateTable
CREATE TABLE "order_status_change" (
    "id" SERIAL NOT NULL,
    "order_id" INTEGER NOT NULL,
    "previous_status" "OrderStatus" NOT NULL,
    "new_status" "OrderStatus" NOT NULL,
    "timestamp" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "order_status_change_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE INDEX "order_status_change_order_id_idx" ON "order_status_change"("order_id");


-- AddForeignKey
ALTER TABLE "order_status_change" ADD CONSTRAINT "order_status_change_order_id_fkey" FOREIGN KEY ("order_id") REFERENCES "orders"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
