-- CreateTable
CREATE TABLE "rounds" (
    "id" SERIAL NOT NULL,
    "season_id" INTEGER NOT NULL,
    "round_number" INTEGER NOT NULL,
    "start_date" TIMESTAMP(3) NOT NULL,
    "end_date" TIMESTAMP(3) NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "rounds_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE INDEX "rounds_id_idx" ON "rounds"("id");

-- AddForeignKey
ALTER TABLE "rounds" ADD CONSTRAINT "rounds_season_id_fkey" FOREIGN KEY ("season_id") REFERENCES "seasons"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
