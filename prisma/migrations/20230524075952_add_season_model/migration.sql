-- CreateTable
CREATE TABLE "seasons" (
    "id" SERIAL NOT NULL,
    "season_number" INTEGER NOT NULL,
    "seasonKey" TEXT,
    "start_date" TIMESTAMP(3),
    "end_date" TIMESTAMP(3),
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "seasons_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE INDEX "seasons_id_idx" ON "seasons"("id");
