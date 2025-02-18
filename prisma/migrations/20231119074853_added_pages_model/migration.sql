/*
  Warnings:

  - Made the column `stadium_id` on table `events` required. This step will fail if there are existing NULL values in that column.

*/
-- CreateEnum
CREATE TYPE "PagePlatform" AS ENUM ('METABASE', 'RETOOL', 'DZ_DASHBOARD');

-- DropForeignKey
ALTER TABLE "events" DROP CONSTRAINT "events_stadium_id_fkey";

-- AlterTable
ALTER TABLE "events" ALTER COLUMN "stadium_id" SET NOT NULL;

-- CreateTable
CREATE TABLE "pages" (
    "id" SERIAL NOT NULL,
    "title" TEXT NOT NULL,
    "platform" "PagePlatform" NOT NULL DEFAULT 'DZ_DASHBOARD',
    "page_id" INTEGER NOT NULL,
    "provider_metadata" JSONB DEFAULT '{}',
    "role" "AdminRole" NOT NULL,
    "allowed_admins" TEXT[],
    "visible" BOOLEAN NOT NULL DEFAULT true,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "pages_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE INDEX "pages_id_role_allowed_admins_idx" ON "pages"("id", "role", "allowed_admins");

-- AddForeignKey
ALTER TABLE "events" ADD CONSTRAINT "events_stadium_id_fkey" FOREIGN KEY ("stadium_id") REFERENCES "stadiums"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
