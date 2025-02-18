-- AlterTable
ALTER TABLE "vouchers" ADD COLUMN     "encrypted_aes_key" BYTEA,
ADD COLUMN     "encrypted_voucher" TEXT,
ADD COLUMN     "iv" TEXT,
ADD COLUMN     "metadata" JSONB;
