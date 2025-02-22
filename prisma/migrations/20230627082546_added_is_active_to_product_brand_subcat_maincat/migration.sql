-- AlterTable
ALTER TABLE "brands" ADD COLUMN     "is_active" BOOLEAN DEFAULT true;

-- AlterTable
ALTER TABLE "main_categories" ADD COLUMN     "is_active" BOOLEAN DEFAULT true;

-- AlterTable
ALTER TABLE "products" ADD COLUMN     "is_active" BOOLEAN DEFAULT true;

-- AlterTable
ALTER TABLE "sub_categories" ADD COLUMN     "is_active" BOOLEAN DEFAULT true;
