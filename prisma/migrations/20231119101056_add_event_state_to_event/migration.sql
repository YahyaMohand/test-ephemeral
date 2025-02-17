/*
  Warnings:

  - You are about to drop the column `state` on the `concerts` table. All the data in the column will be lost.
  - You are about to drop the column `state` on the `matches` table. All the data in the column will be lost.
  - Made the column `stadium_id` on table `events` required. This step will fail if there are existing NULL values in that column.

*/
-- DropForeignKey
ALTER TABLE "events" DROP CONSTRAINT "events_stadium_id_fkey";

-- AlterTable
ALTER TABLE "concerts" DROP COLUMN "state";

-- AlterTable
ALTER TABLE "events" ADD COLUMN     "state" "EventState" NOT NULL DEFAULT 'ON_SALE',
ALTER COLUMN "stadium_id" SET NOT NULL;

-- AlterTable
ALTER TABLE "matches" DROP COLUMN "state";

-- AddForeignKey
ALTER TABLE "events" ADD CONSTRAINT "events_stadium_id_fkey" FOREIGN KEY ("stadium_id") REFERENCES "stadiums"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
