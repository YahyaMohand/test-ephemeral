-- AlterTable
ALTER TABLE "variants" ADD COLUMN     "bnpl_active" BOOLEAN DEFAULT false,
ADD COLUMN     "bnpl_percentage" DOUBLE PRECISION DEFAULT 0;

-- CreateTable
CREATE TABLE "user_cards" (
    "id" TEXT NOT NULL,
    "user_id" TEXT NOT NULL,
    "masked_card_number" TEXT NOT NULL,
    "account_number" TEXT NOT NULL,
    "active" BOOLEAN NOT NULL DEFAULT true,
    "bnpl_eligible" BOOLEAN NOT NULL DEFAULT false,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "user_cards_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE INDEX "user_cards_user_id_idx" ON "user_cards"("user_id");

-- CreateIndex
CREATE UNIQUE INDEX "user_cards_user_id_masked_card_number_key" ON "user_cards"("user_id", "masked_card_number");

-- AddForeignKey
ALTER TABLE "user_cards" ADD CONSTRAINT "user_cards_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
