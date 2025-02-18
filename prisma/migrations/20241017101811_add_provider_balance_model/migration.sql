-- CreateTable
CREATE TABLE "providers_balance" (
    "id" SERIAL NOT NULL,
    "provider" TEXT NOT NULL,
    "balance" DECIMAL(65,30) NOT NULL,
    "currency" "CurrencyType" NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "providers_balance_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE INDEX "providers_balance_provider_idx" ON "providers_balance"("provider");

