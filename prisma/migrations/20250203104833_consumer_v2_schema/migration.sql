/*
  Warnings:

  - A unique constraint covering the columns `[slug]` on the table `brands` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[event_id]` on the table `concerts` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[slug]` on the table `main_categories` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[event_id]` on the table `matches` will be added. If there are existing duplicate values, this will fail.
  - Made the column `abilities` on table `admins` required. This step will fail if there are existing NULL values in that column.
  - The required column `slug` was added to the `brands` table with a prisma-level default value. This is not possible if the table is not empty. Please add this column as optional, then populate it before making it required.
  - The required column `slug` was added to the `main_categories` table with a prisma-level default value. This is not possible if the table is not empty. Please add this column as optional, then populate it before making it required.

*/
-- CreateEnum
CREATE TYPE "Locale" AS ENUM ('AR', 'EN', 'KU', 'TR', 'UR');

-- AlterTable
ALTER TABLE "brands" ADD COLUMN     "slug" TEXT NOT NULL DEFAULT gen_random_uuid();

-- AlterTable
ALTER TABLE "main_categories" ADD COLUMN     "slug" TEXT NOT NULL DEFAULT gen_random_uuid();

-- CreateTable
CREATE TABLE "main_categories_translations" (
    "category_id" INTEGER NOT NULL,
    "locale" "Locale" NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "main_categories_translations_pkey" PRIMARY KEY ("category_id","locale")
);

-- CreateTable
CREATE TABLE "sub_categories_translations" (
    "category_id" INTEGER NOT NULL,
    "locale" "Locale" NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "sub_categories_translations_pkey" PRIMARY KEY ("category_id","locale")
);

-- CreateTable
CREATE TABLE "brands_translations" (
    "brand_id" INTEGER NOT NULL,
    "locale" "Locale" NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT,

    CONSTRAINT "brands_translations_pkey" PRIMARY KEY ("brand_id","locale")
);

-- CreateTable
CREATE TABLE "products_translations" (
    "product_id" INTEGER NOT NULL,
    "locale" "Locale" NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT,

    CONSTRAINT "products_translations_pkey" PRIMARY KEY ("product_id","locale")
);

-- CreateTable
CREATE TABLE "variants_translations" (
    "variant_id" INTEGER NOT NULL,
    "locale" "Locale" NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "variants_translations_pkey" PRIMARY KEY ("variant_id","locale")
);

-- CreateTable
CREATE TABLE "contents" (
    "id" TEXT NOT NULL,
    "slug" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "contents_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "contents_translations" (
    "content_id" TEXT NOT NULL,
    "locale" "Locale" NOT NULL,
    "data" JSON NOT NULL,

    CONSTRAINT "contents_translations_pkey" PRIMARY KEY ("content_id","locale")
);

-- CreateTable
CREATE TABLE "offers" (
    "id" TEXT NOT NULL,
    "slug" TEXT NOT NULL,
    "image" TEXT,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "offers_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "offers_brands" (
    "offer_id" TEXT NOT NULL,
    "brand_id" INTEGER NOT NULL,

    CONSTRAINT "offers_brands_pkey" PRIMARY KEY ("offer_id","brand_id")
);

-- CreateTable
CREATE TABLE "offers_translations" (
    "offer_id" TEXT NOT NULL,
    "locale" "Locale" NOT NULL,
    "title" TEXT NOT NULL,
    "description" TEXT NOT NULL,

    CONSTRAINT "offers_translations_pkey" PRIMARY KEY ("offer_id","locale")
);

-- CreateTable
CREATE TABLE "catalogs" (
    "id" TEXT NOT NULL,
    "slug" TEXT NOT NULL,
    "content_id" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "catalogs_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "catalog_categories" (
    "catalog_id" TEXT NOT NULL,
    "category_id" INTEGER NOT NULL,

    CONSTRAINT "catalog_categories_pkey" PRIMARY KEY ("category_id","catalog_id")
);

-- CreateTable
CREATE TABLE "catalogs_brands" (
    "catalog_id" TEXT NOT NULL,
    "brand_id" INTEGER NOT NULL,

    CONSTRAINT "catalogs_brands_pkey" PRIMARY KEY ("catalog_id","brand_id")
);

-- CreateIndex
CREATE UNIQUE INDEX "contents_slug_key" ON "contents"("slug");

-- CreateIndex
CREATE UNIQUE INDEX "offers_slug_key" ON "offers"("slug");

-- CreateIndex
CREATE UNIQUE INDEX "catalogs_slug_key" ON "catalogs"("slug");

-- CreateIndex
CREATE INDEX "catalogs_slug_idx" ON "catalogs"("slug");

-- CreateIndex
CREATE UNIQUE INDEX "brands_slug_key" ON "brands"("slug");

-- CreateIndex
CREATE INDEX "brands_slug_idx" ON "brands"("slug");


-- CreateIndex
CREATE UNIQUE INDEX "main_categories_slug_key" ON "main_categories"("slug");

-- CreateIndex
CREATE INDEX "main_categories_slug_idx" ON "main_categories"("slug");


-- AddForeignKey
ALTER TABLE "main_categories_translations" ADD CONSTRAINT "main_categories_translations_category_id_fkey" FOREIGN KEY ("category_id") REFERENCES "main_categories"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "sub_categories_translations" ADD CONSTRAINT "sub_categories_translations_category_id_fkey" FOREIGN KEY ("category_id") REFERENCES "sub_categories"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "brands_translations" ADD CONSTRAINT "brands_translations_brand_id_fkey" FOREIGN KEY ("brand_id") REFERENCES "brands"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "products_translations" ADD CONSTRAINT "products_translations_product_id_fkey" FOREIGN KEY ("product_id") REFERENCES "products"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "variants_translations" ADD CONSTRAINT "variants_translations_variant_id_fkey" FOREIGN KEY ("variant_id") REFERENCES "variants"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "contents_translations" ADD CONSTRAINT "contents_translations_content_id_fkey" FOREIGN KEY ("content_id") REFERENCES "contents"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "offers_brands" ADD CONSTRAINT "offers_brands_brand_id_fkey" FOREIGN KEY ("brand_id") REFERENCES "brands"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "offers_brands" ADD CONSTRAINT "offers_brands_offer_id_fkey" FOREIGN KEY ("offer_id") REFERENCES "offers"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "offers_translations" ADD CONSTRAINT "offers_translations_offer_id_fkey" FOREIGN KEY ("offer_id") REFERENCES "offers"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "catalogs" ADD CONSTRAINT "catalogs_content_id_fkey" FOREIGN KEY ("content_id") REFERENCES "contents"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "catalog_categories" ADD CONSTRAINT "catalog_categories_catalog_id_fkey" FOREIGN KEY ("catalog_id") REFERENCES "catalogs"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "catalog_categories" ADD CONSTRAINT "catalog_categories_category_id_fkey" FOREIGN KEY ("category_id") REFERENCES "main_categories"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "catalogs_brands" ADD CONSTRAINT "catalogs_brands_brand_id_fkey" FOREIGN KEY ("brand_id") REFERENCES "brands"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "catalogs_brands" ADD CONSTRAINT "catalogs_brands_catalog_id_fkey" FOREIGN KEY ("catalog_id") REFERENCES "catalogs"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
