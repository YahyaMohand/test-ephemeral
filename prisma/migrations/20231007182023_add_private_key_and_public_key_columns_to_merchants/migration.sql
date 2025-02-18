/*
  Warnings:

  - A unique constraint covering the columns `[private_key]` on the table `merchants` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[public_key]` on the table `merchants` will be added. If there are existing duplicate values, this will fail.

*/
-- AlterTable
ALTER TABLE "merchants" ADD COLUMN     "private_key" TEXT,
ADD COLUMN     "public_key" TEXT;

-- CreateIndex
CREATE UNIQUE INDEX "merchants_private_key_key" ON "merchants"("private_key");

-- CreateIndex
CREATE UNIQUE INDEX "merchants_public_key_key" ON "merchants"("public_key");
