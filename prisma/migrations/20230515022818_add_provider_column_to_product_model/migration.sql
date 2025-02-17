-- CreateEnum
CREATE TYPE "ProviderType" AS ENUM ('ASIACELL', 'MINTROUTE');

-- AlterTable
ALTER TABLE "products" ADD COLUMN     "provider" "ProviderType";
