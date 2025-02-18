-- CreateTable
CREATE TABLE "banners" (
    "id" SERIAL NOT NULL,
    "image" TEXT NOT NULL,
    "bannerable_id" INTEGER NOT NULL,
    "bannerable_type" TEXT NOT NULL,
    "active" BOOLEAN NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    CONSTRAINT "banners_pkey" PRIMARY KEY ("id")
);
