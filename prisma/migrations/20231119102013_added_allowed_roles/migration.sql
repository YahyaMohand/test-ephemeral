/*
  Warnings:

  - You are about to drop the column `role` on the `pages` table. All the data in the column will be lost.

*/
-- DropIndex
DROP INDEX "pages_id_role_allowed_admins_idx";

-- AlterTable
ALTER TABLE "pages" DROP COLUMN "role",
ADD COLUMN     "allowed_roles" "AdminRole"[];

-- CreateIndex
CREATE INDEX "pages_id_allowed_roles_allowed_admins_idx" ON "pages"("id", "allowed_roles", "allowed_admins");
