/*
  Warnings:

  - You are about to drop the column `arName` on the `brands` table. All the data in the column will be lost.
  - You are about to drop the column `createdAt` on the `brands` table. All the data in the column will be lost.
  - You are about to drop the column `enName` on the `brands` table. All the data in the column will be lost.
  - You are about to drop the column `subCategoryId` on the `brands` table. All the data in the column will be lost.
  - You are about to drop the column `updatedAt` on the `brands` table. All the data in the column will be lost.
  - You are about to drop the column `arName` on the `main_categories` table. All the data in the column will be lost.
  - You are about to drop the column `createdAt` on the `main_categories` table. All the data in the column will be lost.
  - You are about to drop the column `enName` on the `main_categories` table. All the data in the column will be lost.
  - You are about to drop the column `updatedAt` on the `main_categories` table. All the data in the column will be lost.
  - You are about to drop the column `arName` on the `sub_categories` table. All the data in the column will be lost.
  - You are about to drop the column `createdAt` on the `sub_categories` table. All the data in the column will be lost.
  - You are about to drop the column `enName` on the `sub_categories` table. All the data in the column will be lost.
  - You are about to drop the column `mainCategoryId` on the `sub_categories` table. All the data in the column will be lost.
  - You are about to drop the column `updatedAt` on the `sub_categories` table. All the data in the column will be lost.
  - You are about to drop the `Product` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `ar_description` to the `brands` table without a default value. This is not possible if the table is not empty.
  - Added the required column `ar_name` to the `brands` table without a default value. This is not possible if the table is not empty.
  - Added the required column `en_description` to the `brands` table without a default value. This is not possible if the table is not empty.
  - Added the required column `en_name` to the `brands` table without a default value. This is not possible if the table is not empty.
  - Added the required column `sub_category_id` to the `brands` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updated_at` to the `brands` table without a default value. This is not possible if the table is not empty.
  - Added the required column `ar_name` to the `main_categories` table without a default value. This is not possible if the table is not empty.
  - Added the required column `en_name` to the `main_categories` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updated_at` to the `main_categories` table without a default value. This is not possible if the table is not empty.
  - Added the required column `ar_name` to the `sub_categories` table without a default value. This is not possible if the table is not empty.
  - Added the required column `en_name` to the `sub_categories` table without a default value. This is not possible if the table is not empty.
  - Added the required column `main_category_id` to the `sub_categories` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updated_at` to the `sub_categories` table without a default value. This is not possible if the table is not empty.

*/
-- CreateEnum
CREATE TYPE "ProductType" AS ENUM ('VOUCHER', 'TOPUP', 'BUNDLE');

-- DropForeignKey
ALTER TABLE "brands" DROP CONSTRAINT "brands_subCategoryId_fkey";

-- DropForeignKey
ALTER TABLE "sub_categories" DROP CONSTRAINT "sub_categories_mainCategoryId_fkey";

-- DropIndex
DROP INDEX "brands_id_enName_arName_idx";

-- DropIndex
DROP INDEX "main_categories_id_enName_arName_idx";

-- DropIndex
DROP INDEX "sub_categories_id_enName_arName_idx";

-- AlterTable
ALTER TABLE "brands" DROP COLUMN "arName",
DROP COLUMN "createdAt",
DROP COLUMN "enName",
DROP COLUMN "subCategoryId",
DROP COLUMN "updatedAt",
ADD COLUMN     "ar_description" TEXT NOT NULL,
ADD COLUMN     "ar_name" TEXT NOT NULL,
ADD COLUMN     "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "en_description" TEXT NOT NULL,
ADD COLUMN     "en_name" TEXT NOT NULL,
ADD COLUMN     "order" INTEGER NOT NULL DEFAULT 0,
ADD COLUMN     "show_in_home" BOOLEAN NOT NULL DEFAULT false,
ADD COLUMN     "sub_category_id" INTEGER NOT NULL,
ADD COLUMN     "updated_at" TIMESTAMP(3) NOT NULL;

-- AlterTable
ALTER TABLE "main_categories" DROP COLUMN "arName",
DROP COLUMN "createdAt",
DROP COLUMN "enName",
DROP COLUMN "updatedAt",
ADD COLUMN     "ar_name" TEXT NOT NULL,
ADD COLUMN     "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "en_name" TEXT NOT NULL,
ADD COLUMN     "updated_at" TIMESTAMP(3) NOT NULL;

-- AlterTable
ALTER TABLE "sub_categories" DROP COLUMN "arName",
DROP COLUMN "createdAt",
DROP COLUMN "enName",
DROP COLUMN "mainCategoryId",
DROP COLUMN "updatedAt",
ADD COLUMN     "ar_name" TEXT NOT NULL,
ADD COLUMN     "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "en_name" TEXT NOT NULL,
ADD COLUMN     "main_category_id" INTEGER NOT NULL,
ADD COLUMN     "updated_at" TIMESTAMP(3) NOT NULL;

-- DropTable
DROP TABLE "Product";

-- CreateTable
CREATE TABLE "products" (
    "id" SERIAL NOT NULL,
    "ar_name" TEXT NOT NULL,
    "en_name" TEXT NOT NULL,
    "brandId" INTEGER NOT NULL,
    "type" "ProductType" NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "products_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "variants" (
    "id" SERIAL NOT NULL,
    "price" DOUBLE PRECISION NOT NULL,
    "value" TEXT NOT NULL,
    "is_active" BOOLEAN NOT NULL DEFAULT true,
    "is_reserved" BOOLEAN NOT NULL DEFAULT false,
    "order" INTEGER NOT NULL DEFAULT 0,
    "product_id" INTEGER NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "variants_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE INDEX "products_id_brandId_idx" ON "products"("id", "brandId");

-- CreateIndex
CREATE INDEX "variants_id_product_id_idx" ON "variants"("id", "product_id");

-- CreateIndex
CREATE INDEX "brands_id_en_name_ar_name_sub_category_id_idx" ON "brands"("id", "en_name", "ar_name", "sub_category_id");

-- CreateIndex
CREATE INDEX "main_categories_id_en_name_ar_name_idx" ON "main_categories"("id", "en_name", "ar_name");

-- CreateIndex
CREATE INDEX "sub_categories_id_en_name_ar_name_main_category_id_idx" ON "sub_categories"("id", "en_name", "ar_name", "main_category_id");

-- AddForeignKey
ALTER TABLE "sub_categories" ADD CONSTRAINT "sub_categories_main_category_id_fkey" FOREIGN KEY ("main_category_id") REFERENCES "main_categories"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "brands" ADD CONSTRAINT "brands_sub_category_id_fkey" FOREIGN KEY ("sub_category_id") REFERENCES "sub_categories"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "products" ADD CONSTRAINT "products_brandId_fkey" FOREIGN KEY ("brandId") REFERENCES "brands"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "variants" ADD CONSTRAINT "variants_product_id_fkey" FOREIGN KEY ("product_id") REFERENCES "products"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
