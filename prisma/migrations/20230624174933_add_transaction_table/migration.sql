-- CreateEnum
CREATE TYPE "TransactionType" AS ENUM ('TOPUP', 'PAYMENT');

-- AlterTable
ALTER TABLE "orders" ADD COLUMN     "merchant_id" TEXT,
ALTER COLUMN "consumer_id" DROP NOT NULL;

-- CreateTable
CREATE TABLE "transactions" (
    "id" SERIAL NOT NULL,
    "type" "TransactionType" NOT NULL,
    "amount" DOUBLE PRECISION NOT NULL,
    "merchant_id" TEXT,
    "old_balance" DOUBLE PRECISION NOT NULL,
    "new_balance" DOUBLE PRECISION NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "transactions_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE INDEX "transactions_id_idx" ON "transactions"("id");

-- AddForeignKey
ALTER TABLE "orders" ADD CONSTRAINT "orders_merchant_id_fkey" FOREIGN KEY ("merchant_id") REFERENCES "merchants"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "transactions" ADD CONSTRAINT "transactions_merchant_id_fkey" FOREIGN KEY ("merchant_id") REFERENCES "merchants"("id") ON DELETE SET NULL ON UPDATE CASCADE;
