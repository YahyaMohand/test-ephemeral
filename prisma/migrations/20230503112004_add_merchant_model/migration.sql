-- CreateTable
CREATE TABLE "merchants" (
    "id" TEXT NOT NULL,
    "api_key" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "merchants_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "merchants_api_key_key" ON "merchants"("api_key");

-- CreateIndex
CREATE INDEX "merchants_id_idx" ON "merchants"("id");
