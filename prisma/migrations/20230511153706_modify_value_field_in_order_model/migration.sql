/*
  Warnings:

  - The values [COMPLETED,FAILED] on the enum `OrderStatus` will be removed. If these variants are still used in the database, this will fail.
  - The `value` column on the `orders` table would be dropped and recreated. This will lead to data loss if there is data in the column.

*/
-- AlterEnum
BEGIN;
CREATE TYPE "OrderStatus_new" AS ENUM ('PENDING', 'CANCELLED', 'FAILURE', 'SUCCESS');
ALTER TABLE "orders" ALTER COLUMN "status" DROP DEFAULT;
ALTER TABLE "orders" ALTER COLUMN "status" TYPE "OrderStatus_new" USING ("status"::text::"OrderStatus_new");
ALTER TYPE "OrderStatus" RENAME TO "OrderStatus_old";
ALTER TYPE "OrderStatus_new" RENAME TO "OrderStatus";
DROP TYPE "OrderStatus_old";
ALTER TABLE "orders" ALTER COLUMN "status" SET DEFAULT 'PENDING';
COMMIT;

-- AlterTable
ALTER TABLE "orders" ADD COLUMN     "webhook_response" JSONB DEFAULT '{}',
DROP COLUMN "value",
ADD COLUMN     "value" JSONB[];
