-- CreateTable
CREATE TABLE "otp_tries" (
    "id" SERIAL NOT NULL,
    "phone" TEXT,
    "ip" TEXT,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "otp_tries_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE INDEX "otp_tries_id_idx" ON "otp_tries"("id");
