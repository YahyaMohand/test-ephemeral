

-- AlterTable
ALTER TABLE "orders" ADD COLUMN     "refund_request_id" TEXT DEFAULT '';

-- AlterTable
ALTER TABLE "ticket_orders" ADD COLUMN     "refund_request_id" TEXT DEFAULT '';

