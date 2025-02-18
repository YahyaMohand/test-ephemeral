/*
  Warnings:

  - You are about to drop the column `ar_plural_name` on the `products` table. All the data in the column will be lost.
  - You are about to drop the column `en_plural_name` on the `products` table. All the data in the column will be lost.
  - Added the required column `redeem_instructions` to the `brands` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "brands" ADD COLUMN     "redeem_instructions" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "products" DROP COLUMN "ar_plural_name",
DROP COLUMN "en_plural_name";
