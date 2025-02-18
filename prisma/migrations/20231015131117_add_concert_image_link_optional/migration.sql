-- CreateEnum
CREATE TYPE "EventState" AS ENUM ('ON_SALE', 'SOLD_OUT');

-- CreateTable
CREATE TABLE "concerts" (
    "id" SERIAL NOT NULL,
    "event_id" INTEGER,
    "ar_title" TEXT,
    "ar_subtitle" TEXT,
    "ku_title" TEXT,
    "ku_subtitle" TEXT,
    "ar_address" TEXT,
    "ku_address" TEXT,
    "categories" JSONB DEFAULT '[]',
    "eventKey" TEXT,
    "state" "EventState" NOT NULL DEFAULT 'ON_SALE',
    "date_and_time" TIMESTAMP(3) NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "concerts_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE INDEX "concerts_id_event_id_idx" ON "concerts"("id", "event_id");

-- AlterTable
ALTER TABLE "concerts" ADD COLUMN     "image_link" TEXT;
