-- CreateTable
CREATE TABLE "logs" (
    "id" SERIAL NOT NULL,
    "message" TEXT NOT NULL,
    "request_id" TEXT NOT NULL,
    "method" TEXT NOT NULL,
    "url" TEXT NOT NULL,
    "request_header" JSONB,
    "log_body" JSONB,
    "details" JSONB,
    "status_code" INTEGER,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "logs_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE INDEX "logs_id_request_id_idx" ON "logs"("id", "request_id");
