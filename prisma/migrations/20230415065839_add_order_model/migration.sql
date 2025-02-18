-- CreateEnum
CREATE TYPE "OrderStatus" AS ENUM ('PENDING', 'CANCELLED', 'COMPLETED', 'FAILED');

-- AlterTable
ALTER TABLE "variants" ADD COLUMN     "stock" INTEGER NOT NULL DEFAULT 0;

-- CreateTable
CREATE TABLE "orders" (
    "id" SERIAL NOT NULL,
    "consumer_id" TEXT NOT NULL,
    "total_price" DOUBLE PRECISION NOT NULL,
    "value" TEXT NOT NULL,
    "variant_id" INTEGER NOT NULL,
    "fees" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "status" "OrderStatus" NOT NULL DEFAULT 'PENDING',
    "transaction_id" TEXT,
    "transaction_body" JSONB DEFAULT '{}',
    "transaction_response" JSONB DEFAULT '{}',
    "promo_code_id" INTEGER,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "orders_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE INDEX "orders_id_idx" ON "orders"("id");

-- AddForeignKey
ALTER TABLE "orders" ADD CONSTRAINT "orders_variant_id_fkey" FOREIGN KEY ("variant_id") REFERENCES "variants"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
