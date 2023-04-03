-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 03, 2023 at 10:44 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bkfood`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` bigint(11) NOT NULL,
  `user_id` bigint(11) NOT NULL,
  `food_id` int(11) NOT NULL,
  `amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `user_id`, `food_id`, `amount`) VALUES
(1, 3, 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `cart_seq`
--

CREATE TABLE `cart_seq` (
  `next_not_cached_value` bigint(21) NOT NULL,
  `minimum_value` bigint(21) NOT NULL,
  `maximum_value` bigint(21) NOT NULL,
  `start_value` bigint(21) NOT NULL COMMENT 'start value when sequences is created or value if RESTART is used',
  `increment` bigint(21) NOT NULL COMMENT 'increment value',
  `cache_size` bigint(21) UNSIGNED NOT NULL,
  `cycle_option` tinyint(1) UNSIGNED NOT NULL COMMENT '0 if no cycles are allowed, 1 if the sequence should begin a new cycle when maximum_value is passed',
  `cycle_count` bigint(21) NOT NULL COMMENT 'How many cycles have been done'
) ENGINE=InnoDB;

--
-- Dumping data for table `cart_seq`
--

INSERT INTO `cart_seq` (`next_not_cached_value`, `minimum_value`, `maximum_value`, `start_value`, `increment`, `cache_size`, `cycle_option`, `cycle_count`) VALUES
(50001, 1, 9223372036854775806, 1, 50, 1000, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `food`
--

CREATE TABLE `food` (
  `id` int(11) NOT NULL,
  `food_name` varchar(200) NOT NULL,
  `base_price` double NOT NULL,
  `des` text NOT NULL DEFAULT 'NO DESCRIPTION',
  `rating` float NOT NULL DEFAULT 0,
  `category` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `food`
--

INSERT INTO `food` (`id`, `food_name`, `base_price`, `des`, `rating`, `category`) VALUES
(1, 'Phở', 1.21, 'NO DESCRIPTION', 0, 'Vietnam Food'),
(10, 'Extra Large Meat Lovers', 15.99, 'Whole pie.', 3, 'Extra Large Pizza'),
(11, 'Extra Large Supreme', 15.99, 'Whole pie.', 4, 'Extra Large Pizza \n'),
(13, 'Extra Large BBQ Chicken &amp; Bacon', 15.99, 'Whole Pie', 2, 'Extra Large Pizza \n'),
(18, 'Extra Large Supreme Slice', 3.99, 'Slice.', 5, 'Extra Large Pizza'),
(19, 'Extra Large;5;Cheese Slice', 3.99, 'Slice.', 5, 'Extra Large Pizza'),
(20, 'Jumbo Chicken Wings Five Pieces', 8.99, '5', 2, ''),
(21, 'Jumbo Chicken Wings Seven Pieces', 10.99, '5', 3.5, ''),
(22, 'Jumbo Chicken Wings Nine Pieces', 12.99, '5', 1.5, ''),
(23, 'Jumbo Chicken Wings Twelve Pieces', 15.99, '5', 3.5, ''),
(24, 'Jumbo Spicy Chicken Wings Five Pieces', 8.99, '5', 3.2, ''),
(25, 'Jumbo Spicy Chicken Wings Seven Pieces', 10.99, '5', 2.5, ''),
(26, 'Jumbo Spicy Chicken Wings Nine Pieces', 12.99, '5', 4, ''),
(27, 'Jumbo Spicy Chicken Wings Twelve Pieces', 15.99, '5', 1.7, ''),
(28, 'Five Chicken Tenders', 8.99, '5', 5, ''),
(29, 'Seven Chicken Tenders', 10.99, '5', 2.675, ''),
(30, 'Nine Chicken Tenders', 12.99, '5', 2.43, ''),
(31, 'Twelve Chicken Tenders', 15.99, '5', 4.213, ''),
(32, 'Grab and Go Cheese It', 1.89, '5', 2.32, ''),
(33, 'Doritos Nacho', 1.99, '3.125oz.', 5, 'Snacks'),
(34, 'Lay\'s Classic', 1.99, '2.75oz.', 5, 'Snacks'),
(35, 'Ruffles Cheddar and Sour Cream', 1.99, '2.625oz.', 5, 'Snacks'),
(36, 'Doritos Cool Ranch', 1.99, '3.125oz.', 5, 'Snacks'),
(37, 'Cheetos Crunchy', 1.99, '3.5oz.', 5, 'Snacks'),
(38, '2.375oz.', 5, 'Snacks', 0, ''),
(39, 'Chex Mix Traditional', 2.69, '5', 0, ''),
(40, 'Combos Pretzel With Cheddar Cheese', 2.99, '6.30oz.', 5, 'Snacks'),
(41, 'Snak Club Family Size Energizer Trail Mix', 7.39, '5', 0, ''),
(42, 'Wonderful Roasted and Salted Pistachios', 10.99, '8oz.', 5, 'Snacks'),
(43, 'Wonderful Roasted and Salted Unshelled Pistachios', 14.99, '6oz.', 5, 'Snacks'),
(44, 'Wonderful Roasted and Salted Pistachios', 14.99, '16oz', 5, 'Snacks'),
(45, 'Jack Links Original Jerky', 13.49, '5', 0, ''),
(46, 'Jack Links Peppered Jerky', 13.49, '5', 0, ''),
(47, 'Jack Links Teriyaki Jerky', 13.49, '5', 0, ''),
(48, 'Old Trapper Old Fashion Jerky', 16.99, '10oz.', 5, 'Snacks'),
(49, 'Old Trapper Peppered Jerky', 16.99, '10oz.', 5, 'Snacks'),
(50, 'Haribo Gold Bears', 2.69, '5', 0, ''),
(51, 'Hershey Almond King Size', 2.29, '5', 0, ''),
(52, 'Hershey Bar Milk Chocolate King Size', 2.29, '5', 0, ''),
(53, 'Kit Kat King Size', 2.29, '5', 0, ''),
(54, 'M and M Peanut King Size', 2.29, '5', 0, ''),
(55, 'Payday King', 2.29, '5', 0, ''),
(56, 'Reese Cup King Size', 2.29, '5', 0, ''),
(57, 'Reese Fast Break King Size', 2.29, '5', 0, ''),
(58, 'Reese Sticks King Size', 2.29, '5', 0, ''),
(59, 'Snickers King Two Piece', 2.29, '5', 0, ''),
(60, 'Twix Caramel King', 2.29, '5', 0, ''),
(61, 'Bon Appetit Cheese and Berry Danish', 2.69, '5', 0, ''),
(62, 'Bon Appetit Cheese Croissant', 2.69, '5', 0, ''),
(63, 'Bon Appetit Apple Turnover', 2.69, '5', 0, ''),
(64, 'Bon Appetit Bluberry Cream Danish', 2.69, '5', 0, ''),
(65, 'Rice Krispies Treat Original Big Bar', 1.89, '5', 0, ''),
(66, 'Monster Java Mean Bean', 3.49, '15oz can.', 5, 'Coffee'),
(67, 'Monster Java Loca Moca', 3.49, '15oz can.', 5, 'Coffee'),
(68, 'Monster Java Sltd Crml', 3.49, '15oz can.', 5, 'Coffee'),
(69, 'Starbucks Frapp Mocha', 3.79, '7oz bottle.', 5, 'Coffee'),
(70, 'Starbucks Frapp Van', 3.79, '7oz bottle.', 5, 'Coffee'),
(71, 'Starbucks Frapp Crml Macchiato', 3.79, '7oz bottle.', 5, 'Coffee'),
(72, '16oz can.', 5, 'Energy', 0, ''),
(73, 'Monster Zero Ultra', 3.29, '16oz can.', 5, 'Energy'),
(74, 'Monster Ultra Paradise', 3.29, '16oz can.', 5, 'Energy'),
(75, 'Red Bull', 3.79, '12oz can.', 5, 'Energy'),
(76, 'Red Bull Sugar Free', 3.79, '12oz can.', 5, 'Energy'),
(77, 'Red Bull Blue Berry', 3.79, '12oz can.', 5, 'Energy'),
(78, 'Five Hour Energy Ex Strong Berry', 4.29, '3oz bottle.', 5, 'Energy'),
(79, 'Tropicana Orange No Pulp', 2.29, '5', 0, ''),
(80, 'Tropicana Prem Orange Hmstl Pulp', 2.29, '12oz bottle.', 5, 'Juice'),
(81, 'Tropicana Apple', 2.29, '5', 0, ''),
(82, 'Diet Coke', 2.39, '20oz bottle.', 5, 'Soda'),
(83, 'Diet Mountain Dew', 2.39, '20oz bottle.', 5, 'Soda'),
(84, 'Diet Pepsi', 2.39, '20oz bottle.', 5, 'Soda'),
(85, 'Dr Pepper', 2.39, '20oz bottle.', 5, 'Soda'),
(86, 'Mountain Dew', 2.39, '20oz bottle.', 5, 'Soda'),
(87, 'Mountain Dew Code Red', 2.39, '20oz bottle.', 5, 'Soda'),
(88, '20oz bottle.', 5, 'Soda', 0, ''),
(89, '20oz bottle.', 5, 'Soda', 0, ''),
(90, 'Canada Dry Ginger Ale', 2.29, '20oz bottle.', 5, 'Soda'),
(91, 'Coca Cola', 2.39, '20oz bottle.', 5, 'Soda'),
(92, 'Coke Chry', 2.39, '20oz bottle.', 5, 'Soda'),
(93, 'Coke Zero', 2.39, '20oz bottle.', 5, 'Soda'),
(94, 'Coke Zero Chry Two', 2.39, '20oz bottle.', 5, 'Soda'),
(95, 'Diet Dr Pepper', 2.39, '20oz bottle.', 5, 'Soda'),
(96, 'Dr Pepper Chry', 2.39, '20oz bottle.', 5, 'Soda'),
(97, 'Arizona Green Tea', 2.49, '34oz bottle.', 5, 'Tea'),
(98, 'Arizona Tea Sweet', 2.49, 'One liter bottle.', 5, 'Tea'),
(99, 'Arizona Tea Arnld Plmr', 2.49, '34oz bottle.', 5, 'Tea'),
(100, 'Bodyarmor Strawberry Banana', 2.99, '28oz bottle.', 5, 'Water'),
(101, 'Bodyarmor Orange Mango', 2.99, '28oz bottle.', 5, 'Water'),
(102, 'Bodyarmor Fruit Punch', 2.99, '28oz bottle.', 5, 'Water'),
(103, 'Fiji Water 700 ml', 2.89, '700 ml bottle.', 5, 'Water'),
(104, 'Fiji Water', 3.39, 'One liter bottle.', 5, 'Water'),
(105, 'J? Ti`?z Smoothie', 5.49, 'Tropical fruit blend, dragon fruit mix, mango, bananas, pineapples, apples, and spinach. Special blue and green with strawberry bananas juice blend smoothies. Our fruity tasty smoothies are blended to perfection.', 5, 'Smoothies'),
(106, 'Ti`?z Fruity Thang Smoothie', 5.49, 'Tropical fruit blend, dragon fruit mix, craisin, and apricot. Special green juice blend smoothies. Our fruity tasty smoothies are blended to perfection.', 5, 'Smoothies'),
(107, 'Ashunti`Way Smoothie', 5.49, 'Fruit n greens, mango bananas, tropical fruit blend, dragon fruit mix, mango, bananas, pineapples, apples, and spinach. Special green with strawberry bananas juice blend . Our fruity tasty smoothies are blended to perfection.', 5, 'Smoothies'),
(108, 'Jimmy Jam Smoothie', 5.49, 'Berries n kale, strawberries, bananas, blueberries kale, tropical fruit blend, and dragon fruit. Our fruity tasty smoothies are blended to perfection.', 5, 'Smoothies'),
(109, 'J? Ti`?z Tastey Ice Smoothie', 5.49, 'Tropical fruit blend, dragon fruit, pineapple, bananas, and mango. Our fruity tasty smoothies are blended to perfection.', 5, 'Smoothies'),
(110, 'Tejay Impact Smoothie', 5.49, 'Tropical fruit blend, dragon fruit mix, mango, bananas, pineapples, apples, and spinach. Special blue juice blend smoothies.', 5, 'Smoothies'),
(111, 'Dayton 500 Smoothie', 5.49, 'Tropical fruit blend, dragon fruit mix, mango, bananas, pineapples, apples. Special green juice blend. Our fruity tasty smoothies are blended to perfection.', 5, 'Smoothies'),
(112, 'Nappy Head Truth Smoothie', 6.49, 'Refreshing greens with a hint of mint, apples, bananas, kale, cucumbers, spinach, and mint leaves smoothies. Our fruity tasty smoothies are blended to perfection.', 5, 'Smoothies'),
(113, 'Aw Shuckie Shuckie Now Smoothie', 6.49, 'Triple berry blend, blueberries, strawberries, raspberries, bananas, non- fat yogurt, carrots, and mango smoothies. Our fruity tasty smoothies are blended to perfection.', 5, 'Smoothies'),
(114, 'J? Taste Bud Factor Smoothie', 5.49, 'Strawberries, bananas, peaches, apples, coconut water, and grape smoothies. Our fruity tasty smoothies are blended to perfection.', 5, 'Smoothies'),
(115, 'Early Birds Get the Worm Smoothie', 5.49, 'Mango, pineapples, bananas, sweet potato, v s and b special blue blend berry. Our fruity tasty smoothies are blended to perfection.', 5, 'Smoothies'),
(116, 'Jameria Crush Smoothie', 5.49, 'Detox rocks, pineapple, bananas, cranberry, kale, lemon, and berry mango blend smoothies. Our fruity tasty smoothies are blended to perfection.', 5, 'Smoothies'),
(117, 'Tongue Teaser Smoothie', 6.49, 'Tropical fruit blend, dragon fruit, pineapples, bananas, mango, apples, spinach, ginger powder. Special green blend, pineapple and ginger smoothies. Our fruity tasty smoothies are blended to perfection.', 5, 'Smoothies'),
(118, 'Groovy Louie Smoothie', 5.49, 'Mango, taro, coconut milk, pineapple juice or lime. Our fruity tasty smoothies are blended to perfection.', 5, 'Smoothies'),
(119, 'J Wit Da Weezy Smoothie', 6.49, 'Kale, pineapples, peaches, blueberries, and cran blackberries. Our fruity tasty smoothies are blended to perfection.', 5, 'Smoothies'),
(120, 'Dance Wit Ginger Smoothie', 6.49, 'Avocado, blueberries, kale, spinach, and ginger. Special blue and green. Our fruity tasty smoothies are blended to perfection.', 5, 'Smoothies'),
(121, 'N Da Clouds Smoothie', 6.49, 'Berries, mango, pineapples, and dragon fruit. Our fruity tasty smoothies are blended to perfection.', 5, 'Smoothies'),
(122, 'Taste on Da Tongue Smoothie', 5.49, 'Pineapples, orange, peaches, and coconut water. Our fruity tasty smoothies are blended to perfection.', 5, 'Smoothies'),
(123, 'Summer Time Smoothie', 6.49, 'Orange tangerine, tropical sunshine, apricot, craisin, lime, and pineapples. Our fruity tasty smoothies are blended to perfection.', 5, 'Smoothies'),
(124, 'K Blend Smoothie', 8.49, 'Mango, pineapple, peaches pear apricot, cranberry, lemons, lemonade, flaxseeds, and strawberry protein. Our fruity tasty smoothies are blended to perfection.', 5, 'Smoothies'),
(125, 'Black Tar Coffee', 2.5, 'Fresh medium roast brewed, with or without boba fresh decaf roast brewed. Fresh brewed whole beans coffee! Taste will be fresh and add in our gourmet flavors of your choice.', 5, 'Coffee'),
(126, 'Ray Single Shot', 0.75, 'Fresh and strong to give you the kick start you need.', 5, 'Espresso Shots'),
(127, 'Garri Double Shot', 3.95, 'Fresh and strong to give you the double kick start you need.', 5, 'Espresso Shots'),
(128, 'Tereze Latte', 4.95, 'Creamy espresso, steamed milk, and light froth. Made from fresh whole bean coffee made with espresso and hot steamed milk.', 5, 'Latte'),
(129, 'Tiese Mocha Latte', 4.95, 'Cocoa, chocolate, espresso, steamed milk, and whipped cream. Made from fresh whole bean coffee made with espresso and hot steamed milk.', 5, 'Latte'),
(130, 'Matcha Green Tea Latte', 4.95, 'Almond breeze vanilla unsweetened almond milk. Made from fresh whole bean coffee made with espresso and hot steamed milk.', 5, 'Latte'),
(131, 'Toffee Nut or Butter Pecan Latte', 5.5, 'Butter pecan, caramel sauce, espresso, steamed milk, and whipped cream. Made from fresh whole bean coffee made with espresso and hot steamed milk.', 5, 'Latte'),
(132, 'Caramel Jtizpuccino', 5.5, 'Coffee, sweetened condense milk, cream, caramel sauce, and whip cream.', 5, 'Jtizpuccino'),
(133, 'Java Chip Jtizpuccino', 5.5, 'Coffee, chocolate syrup, sweetened condense milk, cream, chocolate chips, and whip cream.', 5, 'Jtizpuccino'),
(134, 'Cotton Candy Jtizpuccino', 4.99, 'Vanilla syrup, raspberry syrup, milk, whip cream, and vanilla ice cream.', 5, 'Jtizpuccino'),
(135, 'Matcha Mint Chip Cafe Essential', 5.5, 'Specialty drinks.', 5, 'Teas'),
(136, 'Boba Milk Tea Flavors', 4.95, '5', 0, ''),
(137, 'Homemade Tea', 2.5, '5', 0, ''),
(138, 'Gourmet Flavor Tea', 0.6, '5', 0, ''),
(139, 'Fruit N Yogurt Parfait', 4.5, '5', 0, ''),
(140, '5', 0, '', 0, ''),
(141, '5', 0, '', 0, ''),
(142, 'Acai Berry Blend', 4.5, '5', 0, ''),
(143, 'Traditional or belgian waffle. Add a topping (strawberries, chocolate chips, or whipped cream).', 5, 'Breakfast (All-Day)', 0, ''),
(144, 'Waffle Omelets', 6, 'Eggs, shredded mozzarella, chopped red peppers, chopped broccoli or spinach, andbreakfast sliced sausage.', 5, 'Breakfast (All-Day)'),
(145, 'Chicken Waffle Sandwich', 7.99, 'Pulled chicken, jalapeno, shredded cabbage, shredded carrot, maple syrup apple cider vinegar, and mayo.', 5, 'Breakfast (All-Day)'),
(146, 'Stuffed Waffle Biscuits', 5.95, 'Your Choose your size of meats are sausage or ham or bacon or eggs, turkey (two meats with cheese).', 5, 'Breakfast (All-Day)'),
(147, 'Bacon with Eggs| Cheese', 5.95, '5', 0, ''),
(148, 'Breakfast Plate', 7.99, 'Grits, eggs, bacon or sausage with toast.', 5, 'Breakfast (All-Day)'),
(149, 'Sausage| Egg with Cheese Sandwich', 5.95, '5', 0, ''),
(150, 'Bacon Egg| Cheese Sandwich', 4.39, '5', 0, ''),
(151, 'Kings Hawaiian', 7.29, 'Kaiser roll, turkey, ham, and monterey Jack cheese (French chili). Take a,oad off and relax sip-n-snack at J\'ti\'z.', 5, 'Lunch'),
(152, 'Cuban bread, roast pork, ham, swiss, and slice pickle (honey mustard). Take a,oad off and relax sip-n-snack at J\'ti\'z.', 5, 'Lunch', 0, ''),
(153, 'Tomato basil focaccia, salami, ham, and cheese provolone (feta dressing). Take a,oad off and relax sip-n-snack at J\'ti\'z.', 5, 'Lunch', 0, ''),
(154, 'Tuna Wrap', 4.95, 'Tuna and tomato. Take a,oad off and relax sip-n-snack at J\'ti\'z.', 5, 'Lunch'),
(155, 'Waffle Pizza', 4.95, 'Pepperoni, ham, cheese, onions, and green peppers. Take a,oad off and relax sip-n-snack at J\'ti\'z.', 5, 'Lunch'),
(156, 'Ti\'z Tuna Crunch Sandwich', 7.29, '5', 0, ''),
(157, 'J\' Ti\'z Tuna Melt (Wrap)', 7.49, '5', 0, ''),
(158, 'Sho Nuff Kicken Tuna Sandwich', 7.99, '5', 0, ''),
(159, 'Avocado Tuna Sandwich with,ime', 7.49, '5', 0, ''),
(160, 'Tuna Salad', 4.25, 'Tuna salad and crackers (one scoop). Grab a freshly made salad.', 5, 'Salads'),
(161, 'Chicken Salad', 7.99, 'Pulled chicken, jalapeno, shredded cabbage, and shredded carrot. Grab a freshly made salad.', 5, 'Salads'),
(162, 'Garden Salad', 4.95, 'Lettuce, tomatoes, and cucumbers. Grab a freshly made salad.', 5, 'Salads'),
(163, 'Broccoli| Cheddar Soup', 3.5, 'Freshly made soup.', 5, 'Soup'),
(164, 'Tomato Basil Soup', 3.5, 'Freshly made soup.', 5, 'Soup'),
(165, 'Chicken Bacon Ranch Cheesesteak', 14.38, 'Chicken sandwich with bacon, ranch, and your choice of cheese.', 5, 'Picked for you'),
(166, 'Philadelphia Cheesesteak', 10.78, 'Steak sandwich with your choice of cheese.', 5, 'Picked for you'),
(167, 'Cheesesteak Hoagie', 14.38, 'Steak sandwich with lettuce, tomato, onion, and your choice of cheese.', 5, 'Picked for you'),
(168, 'Buffalo Chicken Cheesesteak', 13.18, 'Chicken sandwich with buffalo sauce, grilled onions, and your choice of cheese.', 5, 'Picked for you'),
(169, 'BBQ Chicken Cheesesteak', 13.18, 'Chicken sandwich with BBQ sauce, fried onions, and your choice of cheese.', 5, 'Picked for you'),
(170, 'Philadelphia Cheesesteak', 10.78, 'Steak sandwich with your choice of cheese.', 5, 'Philly Fresh Cheesesteaks'),
(171, 'Classic Cheesesteak', 11.98, 'Steak sandwich with grilled onions and your choice of cheese.', 5, 'Philly Fresh Cheesesteaks'),
(172, 'Roasted Pepper Cheesesteak', 13.18, 'Steak sandwich with grilled onions, bell peppers, and your choice of cheese.', 5, 'Philly Fresh Cheesesteaks'),
(173, 'Mushroom Cheesesteak', 13.18, 'Steak sandwich with mushrooms, grilled onions, and your choice of cheese.', 5, 'Philly Fresh Cheesesteaks'),
(174, 'Loaded Cheesesteak', 14.38, 'Steak sandwich with grilled onions, bell peppers, mushrooms, and your choice of cheese.', 5, 'Philly Fresh Cheesesteaks'),
(175, 'Buffalo Cheesesteak', 13.18, 'Steak sandwich with buffalo sauce, grilled onions, and your choice of cheese.', 5, 'Philly Fresh Cheesesteaks'),
(176, 'BBQ Cheesesteak', 13.18, 'Steak sandwich with BBQ sauce, fried onions, and your choice of cheese.', 5, 'Philly Fresh Cheesesteaks'),
(177, 'Bacon Ranch Cheesesteak', 14.38, 'Steak sandwich with bacon, ranch, and your choice of cheese.', 5, 'Philly Fresh Cheesesteaks'),
(178, 'Cheesesteak Hoagie', 14.38, 'Steak sandwich with lettuce, tomato, onion, and your choice of cheese.', 5, 'Philly Fresh Cheesesteaks'),
(179, 'Cheesesteak Combo', 16.78, 'Your choice of cheesesteak and side.', 5, 'Philly Fresh Cheesesteaks'),
(180, 'Chicken Cheesesteak', 11.98, 'Chicken sandwich with grilled onions and your choice of cheese.', 5, 'Philly Fresh Chicken Cheesesteaks'),
(181, 'Chicken Bacon Ranch Cheesesteak', 14.38, 'Chicken sandwich with bacon, ranch, and your choice of cheese.', 5, 'Philly Fresh Chicken Cheesesteaks'),
(182, 'BBQ Chicken Cheesesteak', 13.18, 'Chicken sandwich with BBQ sauce, fried onions, and your choice of cheese.', 5, 'Philly Fresh Chicken Cheesesteaks'),
(183, 'Buffalo Chicken Cheesesteak', 13.18, 'Chicken sandwich with buffalo sauce, grilled onions, and your choice of cheese.', 5, 'Philly Fresh Chicken Cheesesteaks'),
(184, 'Chicken Cheesesteak Combo', 16.78, 'Your choice of cheesesteak and side.', 5, 'Philly Fresh Chicken Cheesesteaks'),
(185, 'Cheese Fries', 5.98, 'Crispy fries served with melted cheese.', 5, 'Philly Fresh Sides'),
(186, 'French Fries', 4.78, 'Crispy fries.', 5, 'Philly Fresh Sides'),
(187, 'Onion Rings', 4.78, 'Crispy onion rings.', 5, 'Philly Fresh Sides'),
(188, 'Crispy onion rings.', 5, 'Philly Fresh Drinks', 0, ''),
(189, 'Crispy onion rings.', 5, 'Philly Fresh Drinks', 0, ''),
(190, 'Diet Coke', 3, 'Crispy onion rings.', 5, 'Philly Fresh Drinks'),
(191, 'Crispy onion rings.', 5, 'Philly Fresh Drinks', 0, ''),
(192, 'Iced Tea', 3, 'Crispy onion rings.', 5, 'Philly Fresh Drinks'),
(193, 'Chicken Bacon Artichoke - Keto Friendly (Baking Required)', 10.99, 'Creamy Garlic Sauce, Whole-Milk Mozzarella, Grilled Chicken Raised Without Antibiotics, Crispy Bacon, Marinated Artichoke Hearts, Fresh Spinach, Aged Parmesan and Zesty Herbs without the Crust. This recipe is Keto-friendly, but still fully customizable. Macros for this entire tray with the default build are Fats: 89g, Proteins: 91g, Carbs: 21g', 5, 'New! Crustless Pizzas - Keto Friendly (Baking Required)'),
(194, 'Cowboy - Keto Friendly (Baking Required)', 10.99, 'Traditional Red Sauce, Whole-Milk Mozzarella, Premium Pepperoni, Italian Sausage, Sliced Mushrooms, Black Olives, Cheddar, and Herb| Cheese Blend without the Crust. \r\n\r\nTo make this Keto-friendly, simply change the Traditional Red Sauce to Creamy Garlic Sauce or Olive Oil| Garlic Sauce. Macros for this entire tray with the default build are Fats: 100g, Proteins: 75g, Carbs: 28g', 5, 'New! Crustless Pizzas - Keto Friendly (Baking Required)'),
(195, 'Create Your Own Crustless - Keto Friendly (Baking Required)', 9, 'Choose your sauce (or no sauce at all!) and add up to;5;toppings for best results.|Toppings that are Keto-friendly are marked with;\"KF\".', 5, 'New! Crustless Pizzas - Keto Friendly (Baking Required)'),
(196, 'Gourmet Vegetarian - Keto Friendly (Baking Required)', 10.99, 'Creamy Garlic Sauce, Whole-Milk Mozzarella, Fresh Spinach, Sliced Zucchini, Sliced Mushrooms, Marinated Artichoke Hearts, Roma Tomatoes, Mixed Onions, Cheddar, and Herb| Cheese Blend. This recipe is Keto-friendly, but still fully customizable. Macros for this entire tray with the default build are Fats: 79g, Proteins: 57g, Carbs: 23g', 5, 'New! Crustless Pizzas - Keto Friendly (Baking Required)'),
(197, 'Papa\'s All Meat - Keto Friendly (Baking Required)', 10.99, 'Traditional Red Sauce, Whole-Milk Mozzarella, Canadian Bacon, Salami, Premium Pepperoni, Italian Sausage and Ground Beef, and Cheddar. \r\n\r\nTo make this Keto-friendly, simply change the Traditional Red Sauce to Creamy Garlic Sauce or Olive Oil| Garlic Sauce. Macros for this entire tray with the default build are Fats: 108g, Proteins: 88g, Carbs: 25g', 5, 'New! Crustless Pizzas - Keto Friendly (Baking Required)'),
(198, 'Papa\'s Favorite - Keto Friendly (Baking Required)', 10.99, 'Traditional Red Sauce, Whole-Milk Mozzarella, Premium Pepperoni, Italian Sausage, Ground Beef, Sliced Mushrooms, Mixed Onions, Green Peppers, Black Olives, and Cheddar. To make this Keto-friendly, simply change the Traditional Red Sauce to Creamy Garlic Sauce or Olive Oil| Garlic Sauce. Macros for this entire tray with the default build are Fats: 104g, Proteins: 77g, Carbs: 33g', 5, 'New! Crustless Pizzas - Keto Friendly (Baking Required)'),
(199, 'Cowboy (Baking Required)', 12.99, 'Our Original Crust topped with Traditional Red Sauce, Whole-Milk Mozzarella, Premium Pepperoni, Italian Sausage, Sliced Mushrooms, Black Olives, Cheddar, and Herb| Cheese Blend. OUR PIZZA. YOUR OVEN. NOT AS CRAZY AS IT SOUNDS.', 5, 'Signature Pizza (Baking Required)'),
(200, 'Papa\'s Favorite? (Baking Required)', 12.99, 'Our Original Crust topped with Traditional Red Sauce, Whole-Milk Mozzarella, Premium Pepperoni, Italian Sausage, Ground Beef, Sliced Mushrooms, Mixed Onions, Green Peppers, Black Olives, and Cheddar. OUR PIZZA. YOUR OVEN. NOT AS CRAZY AS IT SOUNDS.', 5, 'Signature Pizza (Baking Required)'),
(201, 'Murphy\'s Combo (Baking Required)', 12.99, 'Our Original Crust topped with Traditional Red Sauce, Whole-Milk Mozzarella, Salami, Premium Pepperoni, Italian Sausage, Sliced Mushrooms, Mixed Onions and Black Olives, and Cheddar. OUR PIZZA. YOUR OVEN. NOT AS CRAZY AS IT SOUNDS.', 5, 'Signature Pizza (Baking Required)'),
(202, 'Chicken Garlic (Baking Required)', 12.99, 'Our Original Crust topped with Creamy Garlic Sauce, Whole-Milk Mozzarella, Grilled Chicken Raised Without Antibiotics, Roma Tomatoes, Green Onions, Cheddar, and Herb| Cheese Blend. OUR PIZZA. YOUR OVEN. NOT AS CRAZY AS IT SOUNDS.', 5, 'Signature Pizza (Baking Required)'),
(203, 'Papa\'s All Meat (Baking Required)', 12.99, 'Our Original Crust topped with Traditional Red Sauce, Whole-Milk Mozzarella, Canadian Bacon, Salami, Premium Pepperoni, Italian Sausage and Ground Beef, and Cheddar. OUR PIZZA. YOUR OVEN. NOT AS CRAZY AS IT SOUNDS.', 5, 'Signature Pizza (Baking Required)'),
(204, 'Our Original Crust topped with Traditional Red Sauce, Whole-Milk Mozzarella, Canadian Bacon, Premium Pepperoni, Ground Beef, Mixed Onions, and Cheddar.', 5, 'Signature Pizza (Baking Required)', 0, ''),
(205, 'Chicken Bacon Artichoke (Baking Required)', 11.99, 'Our Artisan Thin Crust, topped with Creamy Garlic Sauce, Whole-Milk Mozzarella, Grilled Chicken Raised Without Antibiotics, Crispy Bacon, Marinated Artichoke Hearts, Fresh Spinach, Aged Parmesan and Zesty Herbs. OUR PIZZA. YOUR OVEN. NOT AS CRAZY AS IT SOUNDS.', 5, 'Gourmet Delite Pizza (Baking Required)'),
(206, 'Herb Chicken Mediterranean (Baking Required)', 11.99, 'Our Artisan Thin Crust, topped with Olive Oil, Chopped Garlic, Whole-Milk Mozzarella, Grilled Chicken Raised Without Antibiotics, Fresh Spinach, Sun-dried Tomatoes, Crumbled Feta and Zesty Herbs. OUR PIZZA. YOUR OVEN. NOT AS CRAZY AS IT SOUNDS.', 5, 'Gourmet Delite Pizza (Baking Required)'),
(207, 'Gourmet Vegetarian (Baking Required)', 11.99, 'Our Artisan Thin Crust, topped with Creamy Garlic Sauce, Whole-Milk Mozzarella, Fresh Spinach, Sliced Zucchini, Sliced Mushrooms, Marinated Artichoke Hearts, Roma Tomatoes, Mixed Onions, Cheddar, and Herb| Cheese Blend. OUR PIZZA. YOUR OVEN. NOT AS CRAZY AS IT SOUNDS.', 5, 'Gourmet Delite Pizza (Baking Required)'),
(208, 'Thai Chicken(Baking Required)', 11.99, 'Our Artisan Thin Crust topped with Traditional Red Sauce, Whole-Milk Mozzarella, Premium Pepperoni, Fresh Spinach, Black Olives, Roma Tomatoes, Feta Cheese, and Zesty Herbs. OUR PIZZA. YOUR OVEN. NOT AS CRAZY AS IT SOUNDS.', 5, 'Gourmet Delite Pizza (Baking Required)'),
(209, 'Tuscan Chicken and Sausage ( Baking Required)', 11.99, 'Our Artisan Thin Crust topped with Traditional Red Sauce, Whole-Milk Mozzarella, Premium Pepperoni, Fresh Spinach, Black Olives, Roma Tomatoes, Feta Cheese, and Zesty Herbs. OUR PIZZA. YOUR OVEN. NOT AS CRAZY AS IT SOUNDS.', 5, 'Gourmet Delite Pizza (Baking Required)'),
(210, '5-Meat Stuffed (Baking Required) Family', 16.99, 'Two layers of our Original Crust stuffed with Traditional Red Sauce, Whole-Milk Mozzarella, Canadian Bacon, Premium Pepperoni, Italian Sausage, Crispy Bacon and topped with Traditional Red Sauce, Ground Beef, Mozzarella and Mild Cheddar.', 5, 'Stuffed Pizza (Baking Required)'),
(211, '5-Meat Stuffed (Baking Required) Large', 14.99, 'Two layers of our Original Crust stuffed with Traditional Red Sauce, Whole-Milk Mozzarella, Canadian Bacon, Premium Pepperoni, Italian Sausage, Crispy Bacon and topped with Traditional Red Sauce, Ground Beef, Mozzarella and Mild Cheddar.', 5, 'Stuffed Pizza (Baking Required)'),
(212, 'Chicago-Styled Stuffed (Baking Required) Family', 16.99, 'Two layers of our Original Crust stuffed with Traditional Red Sauce, Whole-Milk Mozzarella, Salami, Premium Pepperoni, Italian Sausage, Ground Beef, Mixed Onions and topped with Traditional Red Sauce, Green Onions, Roma Tomatoes, Mozzarella and Mild Cheddar. OUR PIZZA. YOUR OVEN. NOT AS CRAZY AS IT SOUNDS.', 5, 'Stuffed Pizza (Baking Required)'),
(213, 'Chicago-Styled Stuffed (Baking Required) Large', 14.99, 'Two layers of our Original Crust stuffed with Traditional Red Sauce, Whole-Milk Mozzarella, Salami, Premium Pepperoni, Italian Sausage, Ground Beef, Mixed Onions and topped with Traditional Red Sauce, Green Onions, Roma Tomatoes, Mozzarella and Mild Cheddar. OUR PIZZA. YOUR OVEN. NOT AS CRAZY AS IT SOUNDS.', 5, 'Stuffed Pizza (Baking Required)'),
(214, 'Big Murphy\'s Stuffed (Baking Required) Large', 14.99, 'Two layers of our Original Crust stuffed with Traditional Red Sauce, Whole-Milk Mozzarella, Premium Pepperoni, Italian Sausage, Sliced Mushrooms and Black Olives topped with Traditional Red Sauce, Green Peppers, Roma Tomatoes, Mild Cheddar and Herb| Cheese Blend. OUR PIZZA. YOUR OVEN. NOT AS CRAZY AS IT SOUNDS.', 5, 'Stuffed Pizza (Baking Required)'),
(215, 'Big Murphy\'s Stuffed (Baking Required) Family', 16.99, 'Two layers of our Original Crust stuffed with Traditional Red Sauce, Whole-Milk Mozzarella, Premium Pepperoni, Italian Sausage, Sliced Mushrooms and Black Olives topped with Traditional Red Sauce, Green Peppers, Roma Tomatoes, Mild Cheddar and Herb| Cheese Blend. OUR PIZZA. YOUR OVEN. NOT AS CRAZY AS IT SOUNDS.', 5, 'Stuffed Pizza (Baking Required)'),
(216, 'Chicken Bacon Stuffed (Baking Required) Large', 14.99, 'Two layers of our Original Crust stuffed with Creamy Garlic Sauce, Whole-Milk Mozzarella, Grilled Chicken Raised Without Antibiotics, Crispy Bacon, Roma Tomatoes, Mixed Onions and topped with Creamy Garlic Sauce, Roma Tomatoes, Crispy Bacon, Mozzarella and Mild Cheddar. OUR PIZZA. YOUR OVEN. NOT AS CRAZY AS IT SOUNDS.', 5, 'Stuffed Pizza (Baking Required)'),
(217, 'Chicken Bacon Stuffed (Baking Required) Family', 16.99, 'Two layers of our Original Crust stuffed with Creamy Garlic Sauce, Whole-Milk Mozzarella, Grilled Chicken Raised Without Antibiotics, Crispy Bacon, Roma Tomatoes, Mixed Onions and topped with Creamy Garlic Sauce, Roma Tomatoes, Crispy Bacon, Mozzarella and Mild Cheddar. OUR PIZZA. YOUR OVEN. NOT AS CRAZY AS IT SOUNDS.', 5, 'Stuffed Pizza (Baking Required)'),
(218, 'Scratch-Made 5-Cheese Bread (Baking Required)', 5, 'Fresh dough topped with our Herb Garlic Spread, ? pound of Whole-Milk Mozzarella, Herb| Cheese Blend, and Mild Cheddar Cheese served with a side of Marinara.', 5, 'Starters, Sides, Desserts and Beverages'),
(219, 'Chocolate Chip Cookie Dough (Baking Required)', 5, 'Fresh-made in house with Semi-Sweet Chocolate Chips.', 5, 'Starters, Sides, Desserts and Beverages'),
(220, 'Cinnamon Wheel (Baking Required)', 5, 'Our Original Crust topped with Cinnamon Spread, Oatmeal Crisp Topping, served with Cream Cheese Frosting.', 5, 'Starters, Sides, Desserts and Beverages'),
(221, 'S?mores Bars', 6, 'Chocolate chip cookie dough topped with marshmallows, crisp topping, and even more chocolate chips.', 5, 'Starters, Sides, Desserts and Beverages'),
(222, 'Soft Drink (2-Liter Pepsi Product)', 2.49, 'Chocolate chip cookie dough topped with marshmallows, crisp topping, and even more chocolate chips.', 5, 'Starters, Sides, Desserts and Beverages'),
(223, 'Mini Murph Cheese', 4.99, 'Make \'n\' Bake Pizza Kit with Red Sauce| Mozzarella.', 5, 'Starters, Sides, Desserts and Beverages'),
(224, 'Mini Murph Pepperoni', 4.99, 'Make \'n\' Bake Pizza Kit with Red Sauce, Mozzarella| Pepperoni.', 5, 'Starters, Sides, Desserts and Beverages'),
(225, 'Create Your Own', 2.49, 'Choose your size and one of our fresh dough options, and then top your pizza with everyone\'s favorites .', 5, 'Create Your Own'),
(226, 'Garden Salad', 5.99, 'Romaine lettuce topped with green peppers, Roma tomatoes, black olives, whole milk mozzarella, and mild cheddar cheeses.', 5, 'Salad'),
(227, 'Caesar Salad', 5.99, 'Romaine lettuce topped with shredded aged parmesan cheese.', 5, 'Salad'),
(228, 'Club Salad', 5.99, 'Romaine lettuce topped with crispy bacon, Canadian bacon, Roma tomatoes, whole milk mozzarella, and mild cheddar cheese.', 5, 'Salad'),
(229, 'Mediterranean|Salad', 5.99, 'Romaine lettuce and fresh spinach topped with black olives, sun dried tomatoes, mixed onions, and crumbled feta cheese.', 5, 'Salad'),
(230, 'Pork Chop Rice with Gravy Plate', 7, 'Romaine lettuce and fresh spinach topped with black olives, sun dried tomatoes, mixed onions, and crumbled feta cheese.', 5, 'Picked for you'),
(231, 'Full Sausage (2 pcs) with;5;Eggs', 7.25, '2 pieces.', 5, 'Picked for you'),
(232, 'Bacon and Egg with Cheese Breakfast Sandwich', 3.5, '3 pieces.', 5, 'Picked for you'),
(233, 'Double Cheese Burger', 3.25, 'Grilled or fried patty with cheese on a bun.', 5, 'Picked for you'),
(234, 'Full Bacon (3 pcs) with;5;Eggs', 7.25, 'Grilled or fried patty with cheese on a bun.', 5, 'Picked for you'),
(235, 'Full Ham with;5;Eggs', 7.25, 'Grilled or fried patty with cheese on a bun.', 5, 'Breakfast'),
(236, '1/2|Ham with;5;Egg', 6.25, 'Grilled or fried patty with cheese on a bun.', 5, 'Breakfast'),
(237, 'Full Bacon (3 pcs) with;5;Eggs', 7.25, '3 pieces.', 5, 'Breakfast'),
(238, '1/2|Bacon (2 pcs) with;5;Egg', 6.25, '2 pieces.', 5, 'Breakfast'),
(239, 'Full Sausage (2 pcs) with;5;Eggs', 7.25, '2 pieces.', 5, 'Breakfast'),
(240, '1/2 Sausage (1 pc) with;5;Egg', 6.25, '1 piece.', 5, 'Breakfast'),
(241, 'Full Salmon (2 pcs) with;5;Eggs', 7.25, '2 pieces.', 5, 'Breakfast'),
(242, '1/2 Salmon (1 pc) with;5;Egg', 6.25, '1 piece.', 5, 'Breakfast'),
(243, 'Full Frank (2 pcs) with;5;Eggs', 7.25, '2 pieces.', 5, 'Breakfast'),
(244, '1/2 Frank (1 pc) with;5;Egg', 6.25, '1 piece.', 5, 'Breakfast'),
(245, 'Fish and|Grits', 6.75, 'Porridge made from ground corn.', 5, 'Breakfast'),
(246, 'Grits with;5;Eggs', 5.25, 'Porridge made from ground corn.', 5, 'Breakfast'),
(247, 'Bowl of Grits', 1.75, 'Porridge made from ground corn.', 5, 'Breakfast'),
(248, 'Bowl of Rice', 1.75, 'Porridge made from ground corn.', 5, 'Breakfast'),
(249, 'Sausage Breakfast Sandwich', 2.75, 'Porridge made from ground corn.', 5, 'Breakfast Sandwich'),
(250, 'Sausage with Egg Breakfast Sandwich', 3.25, 'Porridge made from ground corn.', 5, 'Breakfast Sandwich'),
(251, 'Sausage with Cheese Breakfast Sandwich', 3.5, 'Porridge made from ground corn.', 5, 'Breakfast Sandwich'),
(252, 'Ham, Egg with Cheese Breakfast Sandwich', 4.5, 'Sandwich built with pork and cheese.;', 5, 'Breakfast Sandwich'),
(253, 'Frank and Egg with Cheese Breakfast Sandwich', 4.9, 'Sandwich built with pork and cheese.;', 5, 'Breakfast Sandwich'),
(254, 'Bacon and Egg with Cheese Breakfast Sandwich', 3.5, 'Sandwich built with pork and cheese.;', 5, 'Breakfast Sandwich'),
(255, 'Salmon and Egg Breakfast Sandwich', 3.75, 'Subtle rich fish and egg sandwich.', 5, 'Breakfast Sandwich'),
(256, 'BLT Breakfast Sandwich', 3.5, 'Bacon, lettuce, and tomato.;', 5, 'Breakfast Sandwich'),
(257, 'Grilled Cheese Breakfast Sandwich', 2.25, 'Hot sandwich filled with cheese that has been pan cooked or grilled.;', 5, 'Breakfast Sandwich'),
(258, 'Pancakes (3 pcs)', 3.5, 'Hot sandwich filled with cheese that has been pan cooked or grilled.;', 5, 'Pancakes'),
(259, 'Pancakes (3 pcs) with Meat', 6.75, 'Hot sandwich filled with cheese that has been pan cooked or grilled.;', 5, 'Pancakes'),
(260, 'Pork Chop Rice with Gravy Plate', 7, 'Hot sandwich filled with cheese that has been pan cooked or grilled.;', 5, 'Plates'),
(261, 'Steak Rice with Gravy Plate', 7, 'Hot sandwich filled with cheese that has been pan cooked or grilled.;', 5, 'Plates'),
(262, 'Liver Rice with Gravy Plate', 6.75, 'Hot sandwich filled with cheese that has been pan cooked or grilled.;', 5, 'Plates'),
(263, 'Chicken Rice with Gravy Plate', 6, 'Hot sandwich filled with cheese that has been pan cooked or grilled.;', 5, 'Plates'),
(264, 'Wings (3 pcs) with Fries Plate', 5.5, 'Hot sandwich filled with cheese that has been pan cooked or grilled.;', 5, 'Plates'),
(265, 'Cheese Burger', 2.5, 'Grilled or fried patty with cheese on a bun.', 5, 'Sandwiches and Burgers'),
(266, 'Hot Dog', 2.25, 'Sausage served on a bun.', 5, 'Sandwiches and Burgers'),
(267, 'Sausage served on a bun.', 5, 'Sandwiches and Burgers', 0, ''),
(268, 'Sausage served on a bun.', 5, 'Sandwiches and Burgers', 0, ''),
(269, 'Cheese Frank', 3.25, 'Sausage served on a bun.', 5, 'Sandwiches and Burgers'),
(270, 'Grilled or fried patty on a bun.;', 5, 'Sandwiches and Burgers', 0, ''),
(271, 'Double Hamburger', 3, 'Grilled or fried patty on a bun.;', 5, 'Sandwiches and Burgers'),
(272, 'Double Cheese Burger', 3.25, 'Grilled or fried patty with cheese on a bun.', 5, 'Sandwiches and Burgers'),
(273, 'Turkey with Cheese Deluxe Sandwich', 3.5, 'Grilled or fried patty with cheese on a bun.', 5, 'Sandwiches and Burgers'),
(274, 'Ham Deluxe Sandwich', 4, 'Grilled or fried patty with cheese on a bun.', 5, 'Sandwiches and Burgers'),
(275, 'Salmon Sandwich', 3, 'Subtle rich fish sandwich.;', 5, 'Sandwiches and Burgers'),
(276, 'Pork Chop Sandwich', 4.5, 'Thick cut of meat from a pig typically cut from the spine.', 5, 'Sandwiches and Burgers'),
(277, 'Fish Sandwich', 4, 'Sandwich made with a piece of cut fish that is either fried, baked, or grilled.;', 5, 'Sandwiches and Burgers'),
(278, 'Liver Sandwich', 3.75, 'Sandwich with liver meat typically made as a spread or a patty.', 5, 'Sandwiches and Burgers'),
(279, 'Pig Ear Sandwich', 3.75, 'Sandwich with liver meat typically made as a spread or a patty.', 5, 'Sandwiches and Burgers'),
(280, 'Mac| Cheese', 2.75, 'Sandwich with liver meat typically made as a spread or a patty.', 5, 'Sides'),
(281, 'Sandwich with liver meat typically made as a spread or a patty.', 5, 'Sides', 0, ''),
(282, 'Potato Salad', 2.75, 'Sandwich with liver meat typically made as a spread or a patty.', 5, 'Sides'),
(283, 'Green Beans', 2.75, 'Sandwich with liver meat typically made as a spread or a patty.', 5, 'Sides'),
(284, 'Baked Beans', 2.75, 'Sandwich with liver meat typically made as a spread or a patty.', 5, 'Sides'),
(285, 'Bowl Peas', 3.75, 'Sandwich with liver meat typically made as a spread or a patty.', 5, 'Sides'),
(286, 'Bowl Beans', 3.75, 'Sandwich with liver meat typically made as a spread or a patty.', 5, 'Sides'),
(287, 'Sandwich with liver meat typically made as a spread or a patty.', 5, 'Sides', 0, ''),
(288, 'Pie Slice', 2.25, 'Sandwich with liver meat typically made as a spread or a patty.', 5, 'Dessert'),
(289, 'Cake Slice', 2.5, 'Sandwich with liver meat typically made as a spread or a patty.', 5, 'Dessert'),
(290, 'Whole Pie', 12, 'Sandwich with liver meat typically made as a spread or a patty.', 5, 'Dessert'),
(291, 'Whole Cake', 20, 'Sandwich with liver meat typically made as a spread or a patty.', 5, 'Dessert'),
(292, 'Hot Coffee', 1, 'Sandwich with liver meat typically made as a spread or a patty.', 5, 'Beverages'),
(293, 'Sandwich with liver meat typically made as a spread or a patty.', 5, 'Beverages', 0, ''),
(294, 'Can Sodas', 1, 'Sandwich with liver meat typically made as a spread or a patty.', 5, 'Beverages'),
(295, 'Sandwich with liver meat typically made as a spread or a patty.', 5, 'Beverages', 0, ''),
(296, 'Hereford Filet Mignon', 44, 'Potato pave, haricot verts, caramalized onion bacon foam, and worcestershire blue butter.', 5, 'Picked for you'),
(297, 'Alaskan Halibut', 40, 'lemongrass| ginger tea crusted, cucumber zucchini ribbon salad, asparagus, honey stone ground vinaigrette, dandelion honey\r\n', 5, 'Picked for you'),
(298, 'King Crab Cobb Salad', 43, 'plus king crab, avocado, quail eggs, bacon lardons, heirloom tomato, persian cukes, fried capers, mixed greens, green goddess dressing', 5, 'Picked for you'),
(299, 'Grilled King Salmon', 36, 'artichoke barigoule, baby carrots, pearl onions, local pintos, lardons, jus\r\n', 5, 'Picked for you'),
(300, 'Lobster Tortellini;', 18, 'plus maine lobster, english peas, fennel shallot salad , grana, truffle and chive oils', 5, 'Picked for you'),
(301, 'Fritto Misto', 14, 'Calamari, shrimp, pesce, parsley, sweet pepper, fennel, lemon, and green curry aioli.', 5, 'Appetizers| Salads'),
(302, 'King Crab Cobb Salad', 43, 'plus king crab, avocado, quail eggs, bacon lardons, heirloom tomato, persian cukes, fried capers, mixed greens, green goddess dressing', 5, 'Appetizers| Salads'),
(303, 'Heirloom and Eggplant Caprese;', 17, 'plus heirloom tomato, coal roasted eggplant, burrata, pesto cetarese', 5, 'Appetizers| Salads'),
(304, 'Lobster Tortellini;', 18, 'plus maine lobster, english peas, fennel shallot salad , grana, truffle and chive oils', 5, 'Appetizers| Salads'),
(305, 'Gulf Coast Red Snapper Crudo;', 17, 'plus yukon gold causa, satsumas, indian finger chiles, pistachio vinaigrette', 5, 'Appetizers| Salads'),
(306, 'Smoked Halibut Chowder', 15, 'plus yukon gold causa, satsumas, indian finger chiles, pistachio vinaigrette', 5, 'Appetizers| Salads'),
(307, 'Ocean Salad;\"Greek Style\";with Fried Feta', 12, 'Crispy greens, roma tomatoes, red onion, and kalamata olives.', 5, 'Appetizers| Salads'),
(308, 'Bubblegum Roll', 15, 'Tempura shrimp, tuna, cucumber, avocado, sriracha, and wasabi aioli.', 5, 'Sushi'),
(309, 'Soul Roll', 16, 'Tempura fried alaskan king crab. Jalapeno, cream cheese, and carrots.', 5, 'Sushi'),
(310, 'Tempura Ocean', 14, 'Tuna, salmon, sesame oil, and chives.', 5, 'Sushi'),
(311, 'DEE\'s Roll', 18, 'bbq eel, tamago, red pepper, cucumber, green onion, avocado, eel sauce', 5, 'Sushi'),
(312, 'Veggie Tempura Roll', 13, 'bell pepper, shiitake, carrot, green onion, asparagus, sesame seed, ginger dressing', 5, 'Sushi'),
(313, 'Spicy Crab Salad Roll', 16, 'tuna, crab, scallions, tempura, spicy mayo, eel sauce', 5, 'Sushi'),
(314, 'Spicy Tuna Tempura Bonbons', 14, 'Cream cheese, sambal, hot mustard, and sweet chili glaze.', 5, 'Sushi'),
(315, 'Smoked Salmon King Crab', 15, 'Avocado, cucumber, and sambal aioli.', 5, 'Sushi'),
(316, 'Hereford Filet Mignon', 44, 'Potato pave, haricot verts, caramalized onion bacon foam, and worcestershire blue butter.', 5, 'Entr?es'),
(317, 'Grilled Main Lobster', 52, '1.5# maine lobster, oregon red dulce seaweed butter, kale| toasted almonds', 5, 'Entr?es'),
(318, 'G.B. Scallops', 37, 'Red lentils and|barley, golden chanterelles, parsnip pur?e, and skordalia.', 5, 'Entr?es'),
(319, 'Thai Green Curry Bouillabaisse', 48, 'Lobster tail, gulf shrimp, mussels, clams, pesce, and pineapple jasmine rice.', 5, 'Entr?es'),
(320, 'Gulf Shrimp Al Ajillo', 33, 'garlic, flat leaf parsley, lemon white wine, h.c. tomato chive risotto, griddled baguette', 5, 'Entr?es'),
(321, 'Crispy Duck Breast', 36, 'butter braised radishes, carrot sage puree, granny apple chips, red delicious orange gastrique\r\n', 5, 'Entr?es'),
(322, 'Grilled King Salmon', 36, 'artichoke barigoule, baby carrots, pearl onions, local pintos, lardons, jus\r\n', 5, 'Entr?es'),
(323, 'Alaskan Halibut', 40, 'lemongrass| ginger tea crusted, cucumber zucchini ribbon salad, asparagus, honey stone ground vinaigrette, dandelion honey\r\n', 5, 'Entr?es'),
(324, 'Pan Seared Red Snapper', 38, 'red lentil salad, avocado pomelo pomegranate salsa, green chick pea hummus\r\n', 5, 'Entr?es'),
(325, 'Gulf Grouper', 38, 'agave tequila glazed sweet potatoes, hominy, epazote, fish bits, salsa verde\r\n', 5, 'Entr?es'),
(326, 'Red Snapper (from Gulf of Mexico)', 38, 'hickory grilled, italian verde', 5, 'Whole Fish'),
(327, 'Flounder(from Gulf of Mexico)', 42, 'southern cornmeal crusted, gribiche', 5, 'Whole Fish');

-- --------------------------------------------------------

--
-- Table structure for table `food_seq`
--

CREATE TABLE `food_seq` (
  `next_not_cached_value` bigint(21) NOT NULL,
  `minimum_value` bigint(21) NOT NULL,
  `maximum_value` bigint(21) NOT NULL,
  `start_value` bigint(21) NOT NULL COMMENT 'start value when sequences is created or value if RESTART is used',
  `increment` bigint(21) NOT NULL COMMENT 'increment value',
  `cache_size` bigint(21) UNSIGNED NOT NULL,
  `cycle_option` tinyint(1) UNSIGNED NOT NULL COMMENT '0 if no cycles are allowed, 1 if the sequence should begin a new cycle when maximum_value is passed',
  `cycle_count` bigint(21) NOT NULL COMMENT 'How many cycles have been done'
) ENGINE=InnoDB;

--
-- Dumping data for table `food_seq`
--

INSERT INTO `food_seq` (`next_not_cached_value`, `minimum_value`, `maximum_value`, `start_value`, `increment`, `cache_size`, `cycle_option`, `cycle_count`) VALUES
(1, 1, 9223372036854775806, 1, 50, 1000, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` bigint(20) NOT NULL,
  `age` int(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `age`, `email`, `password`, `role`, `username`) VALUES
(2, 17, 'khanhtran01@gmail.com', '$2a$10$hHsMP84OAB24uM29EtrbQeCM22Z.5HUAh8by8IsNhBQdUR3Ljx9YW', 'BUYER', 'khanh.tran01'),
(3, 13, 'khanhtran@gmail.com', '$2a$10$PqZNithM0Mi4c7M/8gWTwuaPSHlxHwf35LGwIPSSpd257esaZ5mLu', 'BUYER', 'khanhtran');

-- --------------------------------------------------------

--
-- Table structure for table `user_seq`
--

CREATE TABLE `user_seq` (
  `next_not_cached_value` bigint(21) NOT NULL,
  `minimum_value` bigint(21) NOT NULL,
  `maximum_value` bigint(21) NOT NULL,
  `start_value` bigint(21) NOT NULL COMMENT 'start value when sequences is created or value if RESTART is used',
  `increment` bigint(21) NOT NULL COMMENT 'increment value',
  `cache_size` bigint(21) UNSIGNED NOT NULL,
  `cycle_option` tinyint(1) UNSIGNED NOT NULL COMMENT '0 if no cycles are allowed, 1 if the sequence should begin a new cycle when maximum_value is passed',
  `cycle_count` bigint(21) NOT NULL COMMENT 'How many cycles have been done'
) ENGINE=InnoDB;

--
-- Dumping data for table `user_seq`
--

INSERT INTO `user_seq` (`next_not_cached_value`, `minimum_value`, `maximum_value`, `start_value`, `increment`, `cache_size`, `cycle_option`, `cycle_count`) VALUES
(50001, 1, 9223372036854775806, 1, 50, 1000, 0, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `have_food` (`food_id`),
  ADD KEY `cart_of` (`user_id`);

--
-- Indexes for table `food`
--
ALTER TABLE `food`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` bigint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `food`
--
ALTER TABLE `food`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=330;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_of` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `have_food` FOREIGN KEY (`food_id`) REFERENCES `food` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
