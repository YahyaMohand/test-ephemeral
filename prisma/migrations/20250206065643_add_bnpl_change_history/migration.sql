-- CreateTable
CREATE TABLE "bnplchangehistory" (
    "id" SERIAL NOT NULL,
    "bnpl_percentage" DOUBLE PRECISION NOT NULL,
    "updatedat" TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP,
    "variant_id" INTEGER,

    CONSTRAINT "bnplchangehistory_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "bnplchangehistory_id_key" ON "bnplchangehistory"("id");

-- AddForeignKey
ALTER TABLE "bnplchangehistory" ADD CONSTRAINT "bnplchangehistory_variant_id_fkey" FOREIGN KEY ("variant_id") REFERENCES "variants"("id") ON DELETE SET NULL ON UPDATE CASCADE;
