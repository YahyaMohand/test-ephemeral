-- AlterTable
ALTER TABLE "brands" ADD COLUMN     "is_global" BOOLEAN NOT NULL DEFAULT false;

-- CreateTable
CREATE TABLE "settings" (
    "id" SERIAL NOT NULL,
    "hide_global_brands" BOOLEAN NOT NULL DEFAULT false,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "settings_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE INDEX "settings_id_idx" ON "settings"("id");
