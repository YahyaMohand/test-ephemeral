-- CreateEnum
CREATE TYPE "Platform" AS ENUM ('CONSUMER_APP', 'QI_SERVICES_APP', 'SUPER_QI_APP');

-- DropIndex
DROP INDEX "users_phone_key";

-- AlterTable
ALTER TABLE "users" ADD COLUMN     "platform" "Platform" NOT NULL DEFAULT 'CONSUMER_APP';
