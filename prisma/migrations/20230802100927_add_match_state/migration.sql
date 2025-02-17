-- CreateEnum
CREATE TYPE "MatchState" AS ENUM ('ON_SALE', 'SOLD_OUT');

-- AlterTable
ALTER TABLE "matches" ADD COLUMN     "state" "MatchState" NOT NULL DEFAULT 'ON_SALE';
