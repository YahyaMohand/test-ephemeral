-- CreateTable
CREATE TABLE "merchant_topup_history" (
    "id" SERIAL NOT NULL,
    "old_balance" INTEGER NOT NULL,
    "amount" INTEGER NOT NULL,
    "merchantId" TEXT,
    "note" TEXT DEFAULT '',
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "merchant_topup_history_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE INDEX "merchant_topup_history_id_merchantId_idx" ON "merchant_topup_history"("id", "merchantId");

-- AddForeignKey
ALTER TABLE "merchant_topup_history" ADD CONSTRAINT "merchant_topup_history_merchantId_fkey" FOREIGN KEY ("merchantId") REFERENCES "merchants"("id") ON DELETE SET NULL ON UPDATE CASCADE;
