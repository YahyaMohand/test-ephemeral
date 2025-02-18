-- AlterTable
ALTER TABLE "users" ADD COLUMN     "mini_program_id" TEXT;

-- CreateIndex
CREATE INDEX "users_mini_program_id_idx" ON "users"("mini_program_id");
