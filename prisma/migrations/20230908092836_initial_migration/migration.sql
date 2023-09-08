-- CreateTable
CREATE TABLE `Profile` (
    `id` varchar(191) NOT NULL,
    `userId` varchar(191) NOT NULL,
    `name` varchar(191) NOT NULL,
    `imageUrl` text NOT NULL,
    `email` text NOT NULL,
    `createdAt` DATETIME (3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME (3) NOT NULL,
    UNIQUE INDEX `Profile_userId_key` (`userId`),
    PRIMARY KEY (`id`))
DEFAULT CHARACTER
SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Server` (
    `id` varchar(191) NOT NULL,
    `name` varchar(191) NOT NULL,
    `imageUrl` text NOT NULL,
    `inviteCode` varchar(191) NOT NULL,
    `profileId` varchar(191) NOT NULL,
    `createdAt` DATETIME (3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME (3) NOT NULL,
    UNIQUE INDEX `Server_inviteCode_key` (`inviteCode`),
    INDEX `Server_profileId_idx` (`profileId`),
    PRIMARY KEY (`id`))
DEFAULT CHARACTER
SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Member` (
    `id` varchar(191) NOT NULL,
    `role` ENUM ('ADMIN', 'MODERATOR', 'GUEST') NOT NULL DEFAULT 'GUEST',
    `profileId` varchar(191) NOT NULL,
    `serverId` varchar(191) NOT NULL,
    `createdAt` DATETIME (3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME (3) NOT NULL,
    INDEX `Member_profileId_idx` (`profileId`),
    INDEX `Member_serverId_idx` (`serverId`),
    PRIMARY KEY (`id`))
DEFAULT CHARACTER
SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Channel` (
    `id` varchar(191) NOT NULL,
    `name` varchar(191) NOT NULL,
    `type` ENUM ('TEXT', 'AUDIO', 'VIDEO') NOT NULL DEFAULT 'TEXT',
    `profileId` varchar(191) NOT NULL,
    `serverId` varchar(191) NOT NULL,
    `createdAt` DATETIME (3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME (3) NOT NULL,
    INDEX `Channel_profileId_idx` (`profileId`),
    INDEX `Channel_serverId_idx` (`serverId`),
    PRIMARY KEY (`id`))
DEFAULT CHARACTER
SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Message` (
    `id` varchar(191) NOT NULL,
    `content` text NOT NULL,
    `fileUrl` text NULL,
    `memberId` varchar(191) NOT NULL,
    `channelId` varchar(191) NOT NULL,
    `deleted` boolean NOT NULL DEFAULT FALSE,
    `createdAt` DATETIME (3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME (3) NOT NULL,
    INDEX `Message_channelId_idx` (`channelId`),
    INDEX `Message_memberId_idx` (`memberId`),
    PRIMARY KEY (`id`))
DEFAULT CHARACTER
SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Conversation` (
    `id` varchar(191) NOT NULL,
    `memberOneId` varchar(191) NOT NULL,
    `memberTwoId` varchar(191) NOT NULL,
    INDEX `Conversation_memberTwoId_idx` (`memberTwoId`),
    UNIQUE INDEX `Conversation_memberOneId_memberTwoId_key` (`memberOneId`, `memberTwoId`),
    PRIMARY KEY (`id`))
DEFAULT CHARACTER
SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `DirectMessage` (
    `id` varchar(191) NOT NULL,
    `content` text NOT NULL,
    `fileUrl` text NULL,
    `memberId` varchar(191) NOT NULL,
    `conversationId` varchar(191) NOT NULL,
    `deleted` boolean NOT NULL DEFAULT FALSE,
    `createdAt` DATETIME (3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME (3) NOT NULL,
    INDEX `DirectMessage_memberId_idx` (`memberId`),
    INDEX `DirectMessage_conversationId_idx` (`conversationId`),
    PRIMARY KEY (`id`))
DEFAULT CHARACTER
SET utf8mb4 COLLATE utf8mb4_unicode_ci;
