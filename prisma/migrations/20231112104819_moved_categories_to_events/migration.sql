/*
  Warnings:

  - You are about to drop the column `categories` on the `concerts` table. All the data in the column will be lost.
  - You are about to drop the column `categories` on the `matches` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "concerts" DROP COLUMN "categories";

-- AlterTable
ALTER TABLE "events" ADD COLUMN     "categories" JSONB DEFAULT '[]';

-- AlterTable
ALTER TABLE "matches" DROP COLUMN "categories";
