/*
  Warnings:

  - You are about to drop the column `details` on the `logs` table. All the data in the column will be lost.
  - You are about to drop the column `log_body` on the `logs` table. All the data in the column will be lost.
  - You are about to drop the column `request_header` on the `logs` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "logs" DROP COLUMN "details",
DROP COLUMN "log_body",
DROP COLUMN "request_header",
ADD COLUMN     "body" JSONB,
ADD COLUMN     "response" JSONB;
