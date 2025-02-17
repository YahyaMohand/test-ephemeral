/*
  Warnings:

  - A unique constraint covering the columns `[en_name]` on the table `brands` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[ar_name]` on the table `brands` will be added. If there are existing duplicate values, this will fail.

*/
-- AlterTable
ALTER TABLE "brands" ADD COLUMN     "deleted" BOOLEAN DEFAULT false;

-- CreateIndex
CREATE UNIQUE INDEX "brands_en_name_key" ON "brands"("en_name");

-- CreateIndex
CREATE UNIQUE INDEX "brands_ar_name_key" ON "brands"("ar_name");
