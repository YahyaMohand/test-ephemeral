/*
  Warnings:

  - The `consumer_phone` column on the `promo_codes` table would be dropped and recreated. This will lead to data loss if there is data in the column.

*/
-- AlterTable
ALTER TABLE "promo_codes" DROP COLUMN "consumer_phone",
ADD COLUMN     "consumer_phone" TEXT[];
