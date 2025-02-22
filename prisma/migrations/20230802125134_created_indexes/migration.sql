-- CreateIndex
CREATE INDEX "brands_is_active_idx" ON "brands"("is_active");

-- CreateIndex
CREATE INDEX "brands_deleted_idx" ON "brands"("deleted");

-- CreateIndex
CREATE INDEX "main_categories_is_active_idx" ON "main_categories"("is_active");

-- CreateIndex
CREATE INDEX "main_categories_deleted_idx" ON "main_categories"("deleted");

-- CreateIndex
CREATE INDEX "products_is_active_idx" ON "products"("is_active");

-- CreateIndex
CREATE INDEX "products_deleted_idx" ON "products"("deleted");

-- CreateIndex
CREATE INDEX "sub_categories_is_active_idx" ON "sub_categories"("is_active");

-- CreateIndex
CREATE INDEX "sub_categories_deleted_idx" ON "sub_categories"("deleted");

-- CreateIndex
CREATE INDEX "variants_is_active_idx" ON "variants"("is_active");

-- CreateIndex
CREATE INDEX "variants_deleted_idx" ON "variants"("deleted");
