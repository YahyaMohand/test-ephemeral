
-- DropIndex
DROP INDEX "variant_cost_changes_date_of_change_version_key";

-- CreateIndex
CREATE UNIQUE INDEX "variant_cost_changes_variant_id_date_of_change_version_key" ON "variant_cost_changes"("variant_id", "date_of_change", "version");
