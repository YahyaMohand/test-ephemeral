
/*
  Warnings:

  - You are about to drop the column `match_id` on the `ticket_orders` table. All the data in the column will be lost.
  - You are about to drop the column `match_id` on the `tickets` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE "ticket_orders" DROP CONSTRAINT "ticket_orders_match_id_fkey";

-- DropForeignKey
ALTER TABLE "tickets" DROP CONSTRAINT "tickets_match_id_fkey";

-- AlterTable
ALTER TABLE "ticket_orders" DROP COLUMN "match_id";

-- AlterTable
ALTER TABLE "tickets" DROP COLUMN "match_id";

/*
  Warnings:

  - You are about to drop the column `event_type` on the `matches` table. All the data in the column will be lost.
  - You are about to drop the `Event` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "ticket_orders" DROP CONSTRAINT "ticket_orders_event_id_fkey";

-- DropForeignKey
ALTER TABLE "tickets" DROP CONSTRAINT "tickets_event_id_fkey";

-- DropIndex
DROP INDEX "matches_id_team_a_id_team_b_id_season_id_round_id_stadium_i_idx";

-- AlterTable
ALTER TABLE "matches" DROP COLUMN "event_type";

-- DropTable
DROP TABLE "Event";

-- CreateTable
CREATE TABLE "events" (
    "id" SERIAL NOT NULL,
    "event_type" "EventType" NOT NULL DEFAULT 'SPORT',
    "date_and_time" TIMESTAMP(3) NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "events_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE INDEX "events_id_event_type_idx" ON "events"("id", "event_type");

-- CreateIndex
CREATE INDEX "matches_id_team_a_id_team_b_id_season_id_round_id_stadium_i_idx" ON "matches"("id", "team_a_id", "team_b_id", "season_id", "round_id", "stadium_id", "event_id");

-- AddForeignKey
ALTER TABLE "tickets" ADD CONSTRAINT "tickets_event_id_fkey" FOREIGN KEY ("event_id") REFERENCES "events"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ticket_orders" ADD CONSTRAINT "ticket_orders_event_id_fkey" FOREIGN KEY ("event_id") REFERENCES "events"("id") ON DELETE SET NULL ON UPDATE CASCADE;
