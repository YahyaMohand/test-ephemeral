/*
  Warnings:

  - A unique constraint covering the columns `[event_id]` on the table `concerts` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[event_id]` on the table `matches` will be added. If there are existing duplicate values, this will fail.

*/
-- CreateIndex
-- CREATE UNIQUE INDEX "concerts_event_id_key" ON "concerts"("event_id");

-- -- CreateIndex
-- CREATE UNIQUE INDEX "matches_event_id_key" ON "matches"("event_id");

-- -- AddForeignKey
-- ALTER TABLE "concerts" ADD CONSTRAINT "concerts_event_id_fkey" FOREIGN KEY ("event_id") REFERENCES "events"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- -- AddForeignKey
-- ALTER TABLE "matches" ADD CONSTRAINT "matches_event_id_fkey" FOREIGN KEY ("event_id") REFERENCES "events"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- CreateIndex
CREATE INDEX "concerts_event_id_idx" ON "concerts"("event_id");

-- CreateIndex
CREATE INDEX "matches_event_id_idx" ON "matches"("event_id");

-- AddForeignKey
ALTER TABLE "concerts" ADD CONSTRAINT "concerts_event_id_fkey" FOREIGN KEY ("event_id") REFERENCES "events"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "matches" ADD CONSTRAINT "matches_event_id_fkey" FOREIGN KEY ("event_id") REFERENCES "events"("id") ON DELETE SET NULL ON UPDATE CASCADE;
