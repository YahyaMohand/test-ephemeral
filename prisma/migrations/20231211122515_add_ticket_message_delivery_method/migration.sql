-- CreateEnum
CREATE TYPE "MessageDeliveryMethod" AS ENUM ('WHATSAPP', 'SMS');

-- DropIndex
DROP INDEX "tickets_id_idx";

-- AlterTable
ALTER TABLE "tickets" ADD COLUMN     "message_delivery_method" "MessageDeliveryMethod" NOT NULL DEFAULT 'WHATSAPP';

-- CreateIndex
CREATE INDEX "tickets_id_twilio_message_id_idx" ON "tickets"("id", "twilio_message_id");
