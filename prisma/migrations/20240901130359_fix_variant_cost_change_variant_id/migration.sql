-- DropForeignKey
ALTER TABLE "variant_cost_changes" DROP CONSTRAINT "variant_cost_changes_variantId_fkey";

-- DropIndex
DROP INDEX "variant_cost_changes_variantId_date_of_change_version_key";

-- AlterTable
ALTER TABLE "variant_cost_changes" DROP COLUMN "variantId",
ADD COLUMN     "variant_id" INTEGER,
ALTER COLUMN "cost" SET DATA TYPE INTEGER;


-- CreateIndex
CREATE UNIQUE INDEX "variant_cost_changes_date_of_change_version_key" ON "variant_cost_changes"("date_of_change", "version");

-- AddForeignKey
ALTER TABLE "variant_cost_changes" ADD CONSTRAINT "variant_cost_changes_variant_id_fkey" FOREIGN KEY ("variant_id") REFERENCES "variants"("id") ON DELETE SET NULL ON UPDATE CASCADE;
