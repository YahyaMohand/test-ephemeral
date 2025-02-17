/*
  Warnings:

  - A unique constraint covering the columns `[event_id]` on the table `concerts` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[event_id]` on the table `matches` will be added. If there are existing duplicate values, this will fail.
  - Made the column `abilities` on table `admins` required. This step will fail if there are existing NULL values in that column.

*/

-- CreateTable
CREATE TABLE "promo_code_usages" (
    "id" SERIAL NOT NULL,
    "promo_code_id" INTEGER NOT NULL,
    "number_of_redemptions" INTEGER NOT NULL DEFAULT 0,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "promo_code_usages_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "promo_code_usages_promo_code_id_key" ON "promo_code_usages"("promo_code_id");

-- AddForeignKey
ALTER TABLE "promo_code_usages" ADD CONSTRAINT "promo_code_usages_promo_code_id_fkey" FOREIGN KEY ("promo_code_id") REFERENCES "promo_codes"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
