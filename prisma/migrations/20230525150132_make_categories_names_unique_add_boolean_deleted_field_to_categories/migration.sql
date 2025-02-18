/*
  Warnings:

  - A unique constraint covering the columns `[en_name]` on the table `main_categories` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[ar_name]` on the table `main_categories` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[en_name]` on the table `sub_categories` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[ar_name]` on the table `sub_categories` will be added. If there are existing duplicate values, this will fail.

*/
-- AlterTable
ALTER TABLE "main_categories" ADD COLUMN     "deleted" BOOLEAN DEFAULT false;

-- AlterTable
ALTER TABLE "sub_categories" ADD COLUMN     "deleted" BOOLEAN DEFAULT false;

-- CreateIndex
CREATE UNIQUE INDEX "main_categories_en_name_key" ON "main_categories"("en_name");

-- CreateIndex
CREATE UNIQUE INDEX "main_categories_ar_name_key" ON "main_categories"("ar_name");

-- CreateIndex
CREATE UNIQUE INDEX "sub_categories_en_name_key" ON "sub_categories"("en_name");

-- CreateIndex
CREATE UNIQUE INDEX "sub_categories_ar_name_key" ON "sub_categories"("ar_name");
