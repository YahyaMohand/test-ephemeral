/*
  Warnings:

  - You are about to drop the column `stadium_id` on the `matches` table. All the data in the column will be lost.
  - Added the required column `stadium_id` to the `events` table without a default value. This is not possible if the table is not empty.
  - Made the column `exchange_rate` on table `settings` required. This step will fail if there are existing NULL values in that column.

*/
-- DropForeignKey
ALTER TABLE "matches" DROP CONSTRAINT "matches_stadium_id_fkey";

-- DropIndex
DROP INDEX "events_id_event_type_idx";

-- DropIndex
DROP INDEX "matches_id_team_a_id_team_b_id_season_id_round_id_stadium_i_idx";

-- AlterTable
ALTER TABLE "events" ADD COLUMN     "stadium_id" INTEGER;

-- AlterTable
ALTER TABLE "matches" DROP COLUMN "stadium_id";

-- AlterTable
ALTER TABLE "settings" ALTER COLUMN "exchange_rate" SET NOT NULL;

-- CreateIndex
CREATE INDEX "events_id_event_type_stadium_id_idx" ON "events"("id", "event_type", "stadium_id");

-- CreateIndex
CREATE INDEX "matches_id_team_a_id_team_b_id_season_id_round_id_event_id_idx" ON "matches"("id", "team_a_id", "team_b_id", "season_id", "round_id", "event_id");

-- AddForeignKey
ALTER TABLE "events" ADD CONSTRAINT "events_stadium_id_fkey" FOREIGN KEY ("stadium_id") REFERENCES "stadiums"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
