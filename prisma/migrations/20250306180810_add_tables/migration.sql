-- CreateEnum
CREATE TYPE "ticketPhase" AS ENUM ('CREATED', 'IN_PROGRESS', 'UNDER_REVIEW');

-- CreateTable
CREATE TABLE "Boards" (
    "id" SERIAL NOT NULL,
    "title" TEXT NOT NULL,

    CONSTRAINT "Boards_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Ticket" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT,
    "ticketPhase" "ticketPhase" NOT NULL DEFAULT 'CREATED',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "boardsId" INTEGER NOT NULL,

    CONSTRAINT "Ticket_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "Ticket" ADD CONSTRAINT "Ticket_boardsId_fkey" FOREIGN KEY ("boardsId") REFERENCES "Boards"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
