-- AlterEnum
ALTER TYPE "EventState" ADD VALUE 'CANCELLED';

-- AlterTable
ALTER TABLE "ticket_orders" ADD COLUMN     "refunded_by_admin" TEXT DEFAULT '';
