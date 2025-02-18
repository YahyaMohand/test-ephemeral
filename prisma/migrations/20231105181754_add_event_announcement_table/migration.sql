-- CreateTable
CREATE TABLE "event_announcements" (
    "id" SERIAL NOT NULL,
    "title" TEXT NOT NULL,
    "subtitle" TEXT,
    "event_id" INTEGER,
    "active" BOOLEAN NOT NULL DEFAULT false,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "event_announcements_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE INDEX "event_announcements_id_idx" ON "event_announcements"("id");
