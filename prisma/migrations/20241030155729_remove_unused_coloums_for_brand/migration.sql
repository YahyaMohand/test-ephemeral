-- AlterTable
ALTER TABLE "brands" DROP COLUMN "show_in_home",
ALTER COLUMN "ar_description" DROP NOT NULL,
ALTER COLUMN "en_description" DROP NOT NULL,
ALTER COLUMN "is_global" DROP NOT NULL;