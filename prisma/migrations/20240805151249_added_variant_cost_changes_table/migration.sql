-- CreateTable
CREATE TABLE "variant_cost_changes" (
    "id" SERIAL NOT NULL,
    "variantId" INTEGER NOT NULL,
    "cost" DOUBLE PRECISION NOT NULL,
    "date_of_change" TIMESTAMP(3) NOT NULL,
    "admin_id" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "version" INTEGER NOT NULL DEFAULT 1,

    CONSTRAINT "variant_cost_changes_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "variant_cost_changes_variantId_date_of_change_version_key" ON "variant_cost_changes"("variantId", "date_of_change", "version");

-- AddForeignKey
ALTER TABLE "variant_cost_changes" ADD CONSTRAINT "variant_cost_changes_variantId_fkey" FOREIGN KEY ("variantId") REFERENCES "variants"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "variant_cost_changes" ADD CONSTRAINT "variant_cost_changes_admin_id_fkey" FOREIGN KEY ("admin_id") REFERENCES "admins"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
