-- CreateEnum
CREATE TYPE "PaymentMethods" AS ENUM ('WALLET', 'QI_PAYMENT_GATEWAY', 'MINI_PROGRAM');

-- AlterTable
ALTER TABLE "orders" ADD COLUMN     "paymentMethod" "PaymentMethods" NOT NULL DEFAULT 'QI_PAYMENT_GATEWAY';
