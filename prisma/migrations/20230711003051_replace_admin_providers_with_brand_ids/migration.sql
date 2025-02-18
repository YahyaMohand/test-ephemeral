/*
  Warnings:

  - You are about to drop the column `provider` on the `admins` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "admins" DROP COLUMN "provider",
ADD COLUMN     "brand_ids" INTEGER[];
