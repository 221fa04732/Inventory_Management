/*
  Warnings:

  - You are about to drop the column `image` on the `Product` table. All the data in the column will be lost.
  - You are about to drop the column `image` on the `Supplier` table. All the data in the column will be lost.
  - You are about to drop the `_ProductSuppliers` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `productId` to the `Supplier` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "_ProductSuppliers" DROP CONSTRAINT "_ProductSuppliers_A_fkey";

-- DropForeignKey
ALTER TABLE "_ProductSuppliers" DROP CONSTRAINT "_ProductSuppliers_B_fkey";

-- AlterTable
ALTER TABLE "Product" DROP COLUMN "image";

-- AlterTable
ALTER TABLE "Supplier" DROP COLUMN "image",
ADD COLUMN     "productId" TEXT NOT NULL;

-- DropTable
DROP TABLE "_ProductSuppliers";

-- AddForeignKey
ALTER TABLE "Supplier" ADD CONSTRAINT "Supplier_productId_fkey" FOREIGN KEY ("productId") REFERENCES "Product"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
