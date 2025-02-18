/*
  Warnings:

  - The `value` column on the `variants` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - Added the required column `logo` to the `products` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "products" ADD COLUMN "logo" TEXT;

-- AlterTable
ALTER TABLE "variants" DROP COLUMN "value",
ADD COLUMN     "value" JSONB[];
