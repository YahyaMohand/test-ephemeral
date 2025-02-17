-- CreateTable
CREATE TABLE "ticket_holders" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "phone" TEXT NOT NULL,
    "user_id" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "ticket_holders_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE INDEX "ticket_holders_id_idx" ON "ticket_holders"("id");

-- AddForeignKey
ALTER TABLE "ticket_holders" ADD CONSTRAINT "ticket_holders_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
