/*
  Warnings:

  - You are about to drop the column `publishe_dt` on the `matches` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "events" ADD COLUMN     "published_at" TIMESTAMP(3);

-- AlterTable
ALTER TABLE "matches" DROP COLUMN "publishe_dt";
