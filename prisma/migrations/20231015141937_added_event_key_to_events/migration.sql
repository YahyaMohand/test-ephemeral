/*
 Warnings:
 
 - You are about to drop the column `eventKey` on the `concerts` table. All the data in the column will be lost.
 - You are about to drop the column `eventKey` on the `matches` table. All the data in the column will be lost.
 
 */
-- AlterTable
ALTER TABLE
  "concerts" DROP COLUMN "eventKey";

-- AlterTable
ALTER TABLE
  "events"
ADD
  COLUMN "event_key" TEXT;

-- AlterTable
ALTER TABLE
  "events"
ADD
  COLUMN "chart_key" TEXT;

-- AlterTable
ALTER TABLE
  "matches" DROP COLUMN "eventKey";