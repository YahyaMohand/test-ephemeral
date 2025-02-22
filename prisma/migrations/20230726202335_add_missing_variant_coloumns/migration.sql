-- AlterTable
ALTER TABLE "variants"
ADD COLUMN     "required_fields" JSONB,
ADD COLUMN     "image" TEXT;