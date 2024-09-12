-- CreateTable
CREATE TABLE `Admin` (
    `id_admin` INTEGER NOT NULL AUTO_INCREMENT,
    `username_admin` VARCHAR(191) NOT NULL,
    `password_hash_admin` VARCHAR(191) NOT NULL DEFAULT '',
    `email_admin` VARCHAR(191) NOT NULL DEFAULT '',
    `address_admin` VARCHAR(191) NULL,
    `phone_number_admin` VARCHAR(191) NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,

    UNIQUE INDEX `Admin_username_admin_key`(`username_admin`),
    UNIQUE INDEX `Admin_email_admin_key`(`email_admin`),
    PRIMARY KEY (`id_admin`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `User` (
    `id_users` INTEGER NOT NULL AUTO_INCREMENT,
    `username_users` VARCHAR(191) NOT NULL,
    `password_hash_users` VARCHAR(191) NOT NULL DEFAULT '',
    `email_users` VARCHAR(191) NOT NULL DEFAULT '',
    `address_users` VARCHAR(191) NULL,
    `phone_number_users` VARCHAR(191) NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,

    UNIQUE INDEX `User_username_users_key`(`username_users`),
    UNIQUE INDEX `User_email_users_key`(`email_users`),
    PRIMARY KEY (`id_users`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Categories` (
    `id_category` INTEGER NOT NULL AUTO_INCREMENT,
    `name_category` VARCHAR(191) NOT NULL,
    `description_category` VARCHAR(191) NULL,

    UNIQUE INDEX `Categories_name_category_key`(`name_category`),
    PRIMARY KEY (`id_category`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Product` (
    `id_product` INTEGER NOT NULL AUTO_INCREMENT,
    `name_product` VARCHAR(191) NOT NULL DEFAULT '',
    `id_category` INTEGER NOT NULL,
    `price_product` INTEGER NOT NULL DEFAULT 0,
    `description_product` VARCHAR(191) NULL,
    `stock_quantity_product` INTEGER NOT NULL DEFAULT 0,
    `image_product` VARCHAR(191) NULL,

    PRIMARY KEY (`id_product`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Order` (
    `id_order` INTEGER NOT NULL AUTO_INCREMENT,
    `id_users` INTEGER NOT NULL,
    `date_order` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `total_amount_order` INTEGER NOT NULL DEFAULT 0,
    `status_order` ENUM('Pending', 'Shipped', 'Delivered') NOT NULL DEFAULT 'Pending',
    `shipping_address_order` VARCHAR(191) NULL DEFAULT '',
    `payment_method_order` VARCHAR(191) NOT NULL DEFAULT '',
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,

    PRIMARY KEY (`id_order`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Order_items` (
    `id_order_items` INTEGER NOT NULL AUTO_INCREMENT,
    `id_order` INTEGER NOT NULL,
    `id_product` INTEGER NOT NULL,
    `quantity` INTEGER NOT NULL DEFAULT 0,
    `sub_total` INTEGER NOT NULL DEFAULT 0,

    PRIMARY KEY (`id_order_items`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Product` ADD CONSTRAINT `Product_id_category_fkey` FOREIGN KEY (`id_category`) REFERENCES `Categories`(`id_category`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Order` ADD CONSTRAINT `Order_id_users_fkey` FOREIGN KEY (`id_users`) REFERENCES `User`(`id_users`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Order_items` ADD CONSTRAINT `Order_items_id_order_fkey` FOREIGN KEY (`id_order`) REFERENCES `Order`(`id_order`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Order_items` ADD CONSTRAINT `Order_items_id_product_fkey` FOREIGN KEY (`id_product`) REFERENCES `Product`(`id_product`) ON DELETE RESTRICT ON UPDATE CASCADE;
