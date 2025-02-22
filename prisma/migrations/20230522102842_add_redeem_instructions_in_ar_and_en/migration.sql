/*
  Warnings:

  - You are about to drop the column `redeem_instructions` on the `brands` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "brands" DROP COLUMN "redeem_instructions",
ADD COLUMN     "ar_redeem_instructions" TEXT,
ADD COLUMN     "en_redeem_instructions" TEXT;
