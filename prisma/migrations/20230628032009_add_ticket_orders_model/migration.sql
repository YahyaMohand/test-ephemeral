-- AlterTable
ALTER TABLE "tickets" ADD COLUMN     "ticket_order_id" INTEGER;

-- CreateTable
CREATE TABLE "ticket_orders" (
    "id" SERIAL NOT NULL,
    "orderNumber" TEXT NOT NULL,
    "total_price" DOUBLE PRECISION NOT NULL,
    "user_id" TEXT NOT NULL,
    "match_id" INTEGER NOT NULL,
    "status" "OrderStatus" NOT NULL DEFAULT 'PENDING',
    "transaction_id" TEXT,
    "transaction_body" JSONB DEFAULT '{}',
    "transaction_response" JSONB DEFAULT '{}',
    "webhook_response" JSONB DEFAULT '{}',
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "ticket_orders_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE INDEX "ticket_orders_id_idx" ON "ticket_orders"("id");

-- AddForeignKey
ALTER TABLE "tickets" ADD CONSTRAINT "tickets_ticket_order_id_fkey" FOREIGN KEY ("ticket_order_id") REFERENCES "ticket_orders"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ticket_orders" ADD CONSTRAINT "ticket_orders_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ticket_orders" ADD CONSTRAINT "ticket_orders_match_id_fkey" FOREIGN KEY ("match_id") REFERENCES "matches"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
