-- AlterTable
ALTER TABLE "ticket_orders" ADD COLUMN     "payment_method" "PaymentMethods" NOT NULL DEFAULT 'QI_PAYMENT_GATEWAY';
