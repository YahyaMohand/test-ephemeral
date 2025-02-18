/*
  Warnings:

  - You are about to drop the column `date_and_time` on the `concerts` table. All the data in the column will be lost.
  - You are about to drop the column `date_and_time` on the `matches` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "concerts" DROP COLUMN "date_and_time";

-- AlterTable
ALTER TABLE "matches" DROP COLUMN "date_and_time";
