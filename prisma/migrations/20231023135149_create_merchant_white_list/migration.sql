-- CreateTable
CREATE TABLE "merchant_white_list" (
    "id" SERIAL NOT NULL,
    "phone_number" TEXT NOT NULL,
    "max_allowed_tickets" INTEGER NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    CONSTRAINT "merchant_white_list_pkey" PRIMARY KEY ("id")
);