/*
  Warnings:

  - A unique constraint covering the columns `[voucher_id]` on the table `orders` will be added. If there are existing duplicate values, this will fail.

*/
-- CreateEnum
CREATE TYPE "VoucherStatus" AS ENUM ('ACTIVE', 'ON_HOLD', 'USED', 'EXPIRED');

-- AlterTable
ALTER TABLE "orders" ADD COLUMN     "voucher_id" INTEGER;

-- CreateTable
CREATE TABLE "vouchers" (
    "id" SERIAL NOT NULL,
    "code" TEXT NOT NULL,
    "serial" TEXT NOT NULL,
    "value" TEXT NOT NULL,
    "expiry_date" TIMESTAMP(3) NOT NULL,
    "variant_id" INTEGER NOT NULL,
    "order_id" INTEGER,
    "status" "VoucherStatus" NOT NULL DEFAULT 'ACTIVE',
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "vouchers_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "vouchers_code_key" ON "vouchers"("code");

-- CreateIndex
CREATE UNIQUE INDEX "vouchers_serial_key" ON "vouchers"("serial");

-- CreateIndex
CREATE UNIQUE INDEX "vouchers_order_id_key" ON "vouchers"("order_id");

-- CreateIndex
CREATE INDEX "vouchers_id_variant_id_order_id_idx" ON "vouchers"("id", "variant_id", "order_id");

-- CreateIndex
CREATE UNIQUE INDEX "orders_voucher_id_key" ON "orders"("voucher_id");

-- AddForeignKey
ALTER TABLE "orders" ADD CONSTRAINT "orders_voucher_id_fkey" FOREIGN KEY ("voucher_id") REFERENCES "vouchers"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "vouchers" ADD CONSTRAINT "vouchers_variant_id_fkey" FOREIGN KEY ("variant_id") REFERENCES "variants"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
