
-- CreateEnum
CREATE TYPE "ConcertCategory" AS ENUM ('CONCERT', 'WORKSHOP');

-- AlterTable
ALTER TABLE "concerts" ADD COLUMN     "concert_category" "ConcertCategory" NOT NULL DEFAULT 'CONCERT';

-- CreateIndex
CREATE INDEX "concerts_id_event_id_concert_category_idx" ON "concerts"("id", "event_id", "concert_category");

