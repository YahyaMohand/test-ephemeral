-- CreateTable
CREATE TABLE "twilio_statuses" (
    "id" SERIAL NOT NULL,
    "status" TEXT,
    "message_id" TEXT,
    "to" TEXT,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    CONSTRAINT "twilio_statuses_pkey" PRIMARY KEY ("id")
);
