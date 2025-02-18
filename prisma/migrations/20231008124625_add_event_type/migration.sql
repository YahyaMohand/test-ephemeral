-- CreateEnum
CREATE TYPE "EventType" AS ENUM ('SPORT', 'CONCERT');

-- DropIndex
DROP INDEX "matches_id_team_a_id_team_b_id_season_id_round_id_stadium_i_idx";

-- AlterTable
ALTER TABLE "matches" ADD COLUMN     "event_type" "EventType" NOT NULL DEFAULT 'SPORT';

-- CreateIndex
CREATE INDEX "matches_id_team_a_id_team_b_id_season_id_round_id_stadium_i_idx" ON "matches"("id", "team_a_id", "team_b_id", "season_id", "round_id", "stadium_id", "event_type");
