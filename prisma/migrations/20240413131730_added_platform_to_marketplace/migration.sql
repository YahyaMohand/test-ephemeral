-- DropIndex
DROP INDEX "marketplaces_id_name_idx";

-- AlterTable
ALTER TABLE "marketplaces" ADD COLUMN     "platform" "Platform" NOT NULL DEFAULT 'MERCHANT_API';

-- CreateIndex
CREATE INDEX "marketplaces_platform_idx" ON "marketplaces"("platform");
