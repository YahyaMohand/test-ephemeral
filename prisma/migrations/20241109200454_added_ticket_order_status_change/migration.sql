
-- AlterTable
ALTER TABLE "ticket_orders" ADD COLUMN     "failure_reason" TEXT DEFAULT '';

-- CreateTable
CREATE TABLE "ticket_order_status_change" (
    "id" SERIAL NOT NULL,
    "ticket_order_id" INTEGER NOT NULL,
    "previous_status" "OrderStatus" NOT NULL,
    "new_status" "OrderStatus" NOT NULL,
    "timestamp" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "ticket_order_status_change_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE INDEX "ticket_order_status_change_ticket_order_id_idx" ON "ticket_order_status_change"("ticket_order_id");


-- AddForeignKey
ALTER TABLE "ticket_order_status_change" ADD CONSTRAINT "ticket_order_status_change_ticket_order_id_fkey" FOREIGN KEY ("ticket_order_id") REFERENCES "ticket_orders"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
