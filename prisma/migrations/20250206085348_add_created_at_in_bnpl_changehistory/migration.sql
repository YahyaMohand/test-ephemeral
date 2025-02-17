-- AlterTable
ALTER TABLE "bnplchangehistory" DROP COLUMN "updatedat",
ADD COLUMN     "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "updated_at" TIMESTAMP(3) NOT NULL;