--
-- Database: `digicourse`
-- This is a digital store database
-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `name` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `category_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `image_id` int(11) DEFAULT NULL,
  `published` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `name`, `description`, `details`, `price`, `created`, `category_id`, `user_id`, `image_id`, `published`) VALUES
(1, 'Productivity Suite', 'Task and project management software', 'A powerful digital productivity suite designed to manage tasks, schedules, and team collaboration tools.', 49.99, '2023-03-01 10:00:00', 1, 1, 1, 1),
(2, 'Learn Python', 'Beginner programming e-book', 'A complete beginner-friendly e-book teaching Python programming fundamentals with exercises and examples.', 19.99, '2023-03-02 11:00:00', 2, 2, 2, 1),
(3, 'Chill Beats Album', 'Relaxing instrumental music album', 'A digital music album featuring relaxing instrumental beats ideal for studying and meditation.', 9.99, '2023-03-03 12:00:00', 3, 1, 3, 1),
(4, 'Web Development Mastery', 'Full-stack web development course', 'An in-depth video course covering HTML, CSS, JavaScript, and backend development.', 99.99, '2023-03-04 13:00:00', 4, 3, 4, 1),
(5, 'Stock Photo Bundle', 'High-resolution stock images', 'A bundle of 200 royalty-free high-resolution stock photographs for commercial and personal use.', 29.99, '2023-03-05 14:00:00', 5, 2, 5, 1),
(6, 'Tech Talk Podcast Series', 'Technology discussion podcast', 'A premium podcast series discussing the latest trends in AI, software development, and innovation.', 14.99, '2023-03-06 15:00:00', 6, 3, 6, 1);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(24) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL,
  `navigation` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`, `description`, `navigation`) VALUES
(1, 'Software', 'Downloadable applications and tools', 1),
(2, 'E-Books', 'Digital books and guides', 1),
(3, 'Music', 'Digital albums and audio tracks', 1),
(4, 'Courses', 'Online training and tutorials', 1),
(5, 'Graphics', 'Stock images and design resources', 1),
(6, 'Podcasts', 'Premium podcast series and episodes', 1);

-- --------------------------------------------------------

--
-- Table structure for table `image`
--

CREATE TABLE `image` (
  `id` int(11) NOT NULL,
  `file` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alt` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `image`
--

INSERT INTO `image` (`id`, `file`, `alt`) VALUES
(1, 'productivity-suite.jpg', 'Productivity software dashboard'),
(2, 'learn-python.jpg', 'Python programming e-book cover'),
(3, 'chill-beats.jpg', 'Music album cover with blue tones'),
(4, 'web-dev-course.jpg', 'Online web development course preview'),
(5, 'stock-photos.jpg', 'Collection of stock images'),
(6, 'tech-podcast.jpg', 'Podcast microphone and headphones');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `forename` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL,
  `surname` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL,
  `joined` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `picture` varchar(254) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `forename`, `surname`, `email`, `password`, `joined`, `picture`) VALUES
(1, 'John', 'Doe', 'john@example.com', 'pass1234', '2023-03-01 09:00:00', 'john.jpg'),
(2, 'Sarah', 'Connor', 'sarah@example.com', 'pass5678', '2023-03-02 10:00:00', NULL),
(3, 'Michael', 'Lee', 'michael@example.com', 'pass9101', '2023-03-03 11:00:00', 'michael.jpg');

-- --------------------------------------------------------

--
-- Indexes for dumped tables
--

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `image_id` (`image_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `image`
--
ALTER TABLE `image`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

ALTER TABLE `image`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

ALTER TABLE `product`
  ADD CONSTRAINT `category_exists` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  ADD CONSTRAINT `image_exists` FOREIGN KEY (`image_id`) REFERENCES `image` (`id`),
  ADD CONSTRAINT `user_exists` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);