-- CreateEnum
CREATE TYPE "CurrencyType" AS ENUM ('IQD', 'USD');

-- AlterTable
ALTER TABLE "variants" ADD COLUMN     "cost" DOUBLE PRECISION NOT NULL DEFAULT 0,
ADD COLUMN     "currency" "CurrencyType" NOT NULL DEFAULT 'IQD';

-- CreateTable
CREATE TABLE "marketplaces" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "deleted" BOOLEAN DEFAULT false,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "marketplaces_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE INDEX "marketplaces_id_name_idx" ON "marketplaces"("id", "name");