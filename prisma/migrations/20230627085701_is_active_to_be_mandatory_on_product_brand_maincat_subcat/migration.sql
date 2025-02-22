/*
  Warnings:

  - Made the column `is_active` on table `brands` required. This step will fail if there are existing NULL values in that column.
  - Made the column `is_active` on table `main_categories` required. This step will fail if there are existing NULL values in that column.
  - Made the column `is_active` on table `products` required. This step will fail if there are existing NULL values in that column.
  - Made the column `is_active` on table `sub_categories` required. This step will fail if there are existing NULL values in that column.

*/
-- AlterTable
ALTER TABLE "brands" ALTER COLUMN "is_active" SET NOT NULL;

-- AlterTable
ALTER TABLE "main_categories" ALTER COLUMN "is_active" SET NOT NULL;

-- AlterTable
ALTER TABLE "products" ALTER COLUMN "is_active" SET NOT NULL;

-- AlterTable
ALTER TABLE "sub_categories" ALTER COLUMN "is_active" SET NOT NULL;
