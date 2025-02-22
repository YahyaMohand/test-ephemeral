/*
  Warnings:

  - You are about to drop the column `ar_redeem_instructions` on the `brands` table. All the data in the column will be lost.
  - You are about to drop the column `en_redeem_instructions` on the `brands` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "brands" DROP COLUMN "ar_redeem_instructions",
DROP COLUMN "en_redeem_instructions";

-- AlterTable
ALTER TABLE "products" ADD COLUMN     "ar_redeem_instructions" TEXT,
ADD COLUMN     "en_redeem_instructions" TEXT;
