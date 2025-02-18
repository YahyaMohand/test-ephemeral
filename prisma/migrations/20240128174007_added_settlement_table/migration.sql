-- CreateTable
CREATE TABLE "settlements" (
    "id" SERIAL NOT NULL,
    "settlement_number" TEXT,
    "amount" DOUBLE PRECISION NOT NULL,
    "madeBy" TEXT,
    "comment" TEXT,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "image" TEXT,
    "supplier" TEXT,

    CONSTRAINT "settlements_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE INDEX "settlements_id_supplier_idx" ON "settlements"("id", "supplier");
