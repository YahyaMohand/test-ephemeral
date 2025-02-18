-- CreateTable
CREATE TABLE "stadiums" (
    "id" SERIAL NOT NULL,
    "ar_name" TEXT NOT NULL,
    "ku_name" TEXT NOT NULL,
    "chartKey" TEXT,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "stadiums_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE INDEX "stadiums_id_idx" ON "stadiums"("id");
