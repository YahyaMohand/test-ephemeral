
-- AlterTable
ALTER TABLE "admins" ADD COLUMN "abilities" JSONB DEFAULT '[]'::jsonb;

-- CreateTable
CREATE TABLE "role_permissions" (
    "role" "AdminRole" NOT NULL,
    "permissions" JSONB NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "role_permissions_pkey" PRIMARY KEY ("role")
);
