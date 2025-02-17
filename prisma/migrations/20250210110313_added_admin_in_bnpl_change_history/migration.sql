-- AlterTable
ALTER TABLE "bnplchangehistory" ADD COLUMN     "active" BOOLEAN NOT NULL DEFAULT true,
ADD COLUMN     "admin_id" TEXT;

-- AddForeignKey
ALTER TABLE "bnplchangehistory" ADD CONSTRAINT "bnplchangehistory_admin_id_fkey" FOREIGN KEY ("admin_id") REFERENCES "admins"("id") ON DELETE SET NULL ON UPDATE CASCADE;
