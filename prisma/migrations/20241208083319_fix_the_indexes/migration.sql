-- CreateIndex
CREATE INDEX IF NOT EXISTS "concerts_event_id_idx" ON "concerts"("event_id");

-- CreateIndex
CREATE INDEX IF NOT EXISTS "matches_event_id_idx" ON "matches"("event_id");
