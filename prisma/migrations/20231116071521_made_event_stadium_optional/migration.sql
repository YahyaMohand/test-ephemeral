-- DropForeignKey
ALTER TABLE "events" DROP CONSTRAINT "events_stadium_id_fkey";

-- AddForeignKey
ALTER TABLE "events" ADD CONSTRAINT "events_stadium_id_fkey" FOREIGN KEY ("stadium_id") REFERENCES "stadiums"("id") ON DELETE SET NULL ON UPDATE CASCADE;
