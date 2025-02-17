-- AlterTable
ALTER TABLE "vouchers" ADD COLUMN     "activation_date" TIMESTAMP(3),
ADD COLUMN     "retention_end_date" TIMESTAMP(3);

-- CreateIndex
CREATE INDEX "vouchers_retention_end_date_idx" ON "vouchers"("retention_end_date");

-- CreateIndex
CREATE INDEX "vouchers_activation_date_retention_end_date_idx" ON "vouchers"("activation_date", "retention_end_date");
