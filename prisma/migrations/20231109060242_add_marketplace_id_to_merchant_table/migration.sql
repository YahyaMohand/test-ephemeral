/*
  Warnings:

  - Made the column `exchange_rate` on table `settings` required. This step will fail if there are existing NULL values in that column.

*/
-- AlterTable
ALTER TABLE "merchants" ADD COLUMN     "marketplace_id" INTEGER;

-- AddForeignKey
ALTER TABLE "merchants" ADD CONSTRAINT "merchants_marketplace_id_fkey" FOREIGN KEY ("marketplace_id") REFERENCES "marketplaces"("id") ON DELETE SET NULL ON UPDATE CASCADE;
