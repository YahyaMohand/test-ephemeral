-- CreateTable
CREATE TABLE "brands" (
    "id" SERIAL NOT NULL,
    "enName" TEXT NOT NULL,
    "arName" TEXT NOT NULL,
    "logo" TEXT NOT NULL,
    "subCategoryId" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "brands_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "main_categories" (
    "id" SERIAL NOT NULL,
    "enName" TEXT NOT NULL,
    "arName" TEXT NOT NULL,
    "logo" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "main_categories_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "sub_categories" (
    "id" SERIAL NOT NULL,
    "enName" TEXT NOT NULL,
    "arName" TEXT NOT NULL,
    "mainCategoryId" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "sub_categories_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE INDEX "brands_id_enName_arName_idx" ON "brands"("id", "enName", "arName");

-- CreateIndex
CREATE INDEX "main_categories_id_enName_arName_idx" ON "main_categories"("id", "enName", "arName");

-- CreateIndex
CREATE INDEX "sub_categories_id_enName_arName_idx" ON "sub_categories"("id", "enName", "arName");

-- AddForeignKey
ALTER TABLE "brands" ADD CONSTRAINT "brands_subCategoryId_fkey" FOREIGN KEY ("subCategoryId") REFERENCES "sub_categories"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "sub_categories" ADD CONSTRAINT "sub_categories_mainCategoryId_fkey" FOREIGN KEY ("mainCategoryId") REFERENCES "main_categories"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
