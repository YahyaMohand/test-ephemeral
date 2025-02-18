-- CreateTable
CREATE TABLE "teams" (
    "id" SERIAL NOT NULL,
    "ar_name" TEXT NOT NULL,
    "ku_name" TEXT NOT NULL,
    "logo" TEXT,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "teams_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE INDEX "teams_id_idx" ON "teams"("id");
