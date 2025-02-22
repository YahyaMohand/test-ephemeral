/*
  Warnings:

  - You are about to drop the column `ar_address` on the `concerts` table. All the data in the column will be lost.
  - You are about to drop the column `ku_address` on the `concerts` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "concerts" DROP COLUMN "ar_address",
DROP COLUMN "ku_address";

-- AlterTable
ALTER TABLE "events" ADD COLUMN     "ar_address" TEXT,
ADD COLUMN     "ku_address" TEXT;
