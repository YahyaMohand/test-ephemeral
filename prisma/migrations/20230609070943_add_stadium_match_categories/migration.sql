-- AlterTable
ALTER TABLE "matches" ADD COLUMN     "categories" JSONB DEFAULT '[]';

-- AlterTable
ALTER TABLE "stadiums" ADD COLUMN     "categories" JSONB DEFAULT '[]';
