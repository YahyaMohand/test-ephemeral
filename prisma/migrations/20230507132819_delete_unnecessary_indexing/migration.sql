-- DropIndex
DROP INDEX "brands_id_en_name_ar_name_sub_category_id_idx";

-- DropIndex
DROP INDEX "main_categories_id_en_name_ar_name_idx";

-- DropIndex
DROP INDEX "sub_categories_id_en_name_ar_name_main_category_id_idx";

-- CreateIndex
CREATE INDEX "brands_id_sub_category_id_idx" ON "brands"("id", "sub_category_id");

-- CreateIndex
CREATE INDEX "main_categories_id_idx" ON "main_categories"("id");

-- CreateIndex
CREATE INDEX "sub_categories_id_main_category_id_idx" ON "sub_categories"("id", "main_category_id");
