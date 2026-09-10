-- Migration: PYP & Mock Test Series Platform for pyql.in
-- Target Database: pyql (MySQL / MariaDB)

CREATE TABLE IF NOT EXISTS `pyp_categories` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `name` VARCHAR(100) NOT NULL,
  `slug` VARCHAR(100) NOT NULL UNIQUE,
  `icon` VARCHAR(100) DEFAULT 'fas fa-graduation-cap',
  `order_index` INT DEFAULT 0,
  `status` TINYINT DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `pyp_exams` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `category_id` INT NOT NULL,
  `title` VARCHAR(150) NOT NULL,
  `slug` VARCHAR(150) NOT NULL UNIQUE,
  `description` TEXT,
  `thumbnail` VARCHAR(255) DEFAULT NULL,
  `total_tests` INT DEFAULT 0,
  `status` TINYINT DEFAULT 1,
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
  INDEX (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `pyp_papers` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `exam_id` INT NOT NULL,
  `title` VARCHAR(255) NOT NULL,
  `slug` VARCHAR(255) NOT NULL UNIQUE,
  `paper_type` ENUM('PREVIOUS_YEAR', 'MOCK_TEST', 'SECTIONAL') DEFAULT 'PREVIOUS_YEAR',
  `year` SMALLINT DEFAULT 2023,
  `shift` VARCHAR(100) DEFAULT 'Shift 1',
  `duration_minutes` INT NOT NULL DEFAULT 60,
  `total_marks` DECIMAL(6,2) NOT NULL DEFAULT 200.00,
  `positive_marks` DECIMAL(4,2) NOT NULL DEFAULT 2.00,
  `negative_marks` DECIMAL(4,2) NOT NULL DEFAULT 0.50,
  `total_questions` INT NOT NULL DEFAULT 25,
  `is_free` TINYINT(1) DEFAULT 0,
  `sections_json` LONGTEXT NOT NULL,
  `status` TINYINT DEFAULT 1,
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
  INDEX (`exam_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `pyp_questions` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `paper_id` INT NOT NULL,
  `section_id` VARCHAR(50) NOT NULL,
  `question_type` VARCHAR(20) DEFAULT 'MCQ',
  `question_en` LONGTEXT NOT NULL,
  `question_hi` LONGTEXT DEFAULT NULL,
  `options_en` LONGTEXT NOT NULL,
  `options_hi` LONGTEXT DEFAULT NULL,
  `correct_options` VARCHAR(100) NOT NULL,
  `solution_en` LONGTEXT DEFAULT NULL,
  `solution_hi` LONGTEXT DEFAULT NULL,
  `positive_marks` DECIMAL(4,2) NOT NULL DEFAULT 2.00,
  `negative_marks` DECIMAL(4,2) NOT NULL DEFAULT 0.50,
  `difficulty` ENUM('EASY', 'MEDIUM', 'HARD') DEFAULT 'MEDIUM',
  `order_index` INT DEFAULT 0,
  INDEX (`paper_id`),
  INDEX (`section_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `pyp_attempts` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `user_id` INT NOT NULL,
  `paper_id` INT NOT NULL,
  `started_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
  `submitted_at` DATETIME DEFAULT NULL,
  `time_taken_seconds` INT DEFAULT 0,
  `score_obtained` DECIMAL(6,2) DEFAULT 0.00,
  `correct_count` INT DEFAULT 0,
  `incorrect_count` INT DEFAULT 0,
  `unattempted_count` INT DEFAULT 0,
  `accuracy_percentage` DECIMAL(5,2) DEFAULT 0.00,
  `all_india_rank` INT DEFAULT 1,
  `percentile` DECIMAL(5,2) DEFAULT 100.00,
  `sectional_scores` LONGTEXT DEFAULT NULL,
  `status` ENUM('IN_PROGRESS', 'SUBMITTED', 'EVALUATED') DEFAULT 'IN_PROGRESS',
  INDEX (`user_id`),
  INDEX (`paper_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `pyp_attempt_responses` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `attempt_id` INT NOT NULL,
  `question_id` INT NOT NULL,
  `selected_options` VARCHAR(255) DEFAULT '[]',
  `status` ENUM('NOT_VISITED', 'UNANSWERED', 'ANSWERED', 'MARKED_FOR_REVIEW', 'ANSWERED_AND_MARKED') DEFAULT 'NOT_VISITED',
  `time_spent_seconds` INT DEFAULT 0,
  `is_correct` TINYINT DEFAULT NULL,
  `marks_awarded` DECIMAL(4,2) DEFAULT 0.00,
  UNIQUE KEY `attempt_question` (`attempt_id`, `question_id`),
  INDEX (`attempt_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `pyp_passes` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `title` VARCHAR(100) NOT NULL,
  `duration_days` INT NOT NULL,
  `mrp_inr` DECIMAL(8,2) NOT NULL,
  `selling_price_inr` DECIMAL(8,2) NOT NULL,
  `badge` VARCHAR(50) DEFAULT 'POPULAR',
  `features_json` TEXT NOT NULL,
  `status` TINYINT DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `pyp_user_passes` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `user_id` INT NOT NULL,
  `pass_id` INT NOT NULL,
  `payment_id` VARCHAR(100) DEFAULT NULL,
  `gateway` VARCHAR(30) DEFAULT 'RAZORPAY',
  `starts_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
  `expires_at` DATETIME NOT NULL,
  `status` ENUM('ACTIVE', 'EXPIRED', 'CANCELLED') DEFAULT 'ACTIVE',
  INDEX (`user_id`, `status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ========================================================
-- SEED DATA
-- ========================================================

INSERT INTO `pyp_categories` (`id`, `name`, `slug`, `icon`, `order_index`, `status`) VALUES
(1, 'SSC Exams', 'ssc', 'fas fa-landmark', 1, 1),
(2, 'Banking & Insurance', 'banking', 'fas fa-university', 2, 1),
(3, 'Railways (RRB)', 'railways', 'fas fa-subway', 3, 1),
(4, 'Civil Services (UPSC)', 'upsc', 'fas fa-shield-alt', 4, 1),
(5, 'Teaching Exams', 'teaching', 'fas fa-chalkboard-teacher', 5, 1)
ON DUPLICATE KEY UPDATE `name`=VALUES(`name`);

INSERT INTO `pyp_exams` (`id`, `category_id`, `title`, `slug`, `description`, `thumbnail`, `total_tests`, `status`) VALUES
(1, 1, 'SSC CGL', 'ssc-cgl', 'Staff Selection Commission - Combined Graduate Level Examination with all previous year papers & full mocks.', 'uploads/exams/ssc-cgl.png', 120, 1),
(2, 1, 'SSC CHSL', 'ssc-chsl', 'Combined Higher Secondary Level Examination Previous Year Papers with detailed solutions.', 'uploads/exams/ssc-chsl.png', 85, 1),
(3, 2, 'IBPS PO', 'ibps-po', 'Institute of Banking Personnel Selection Probationary Officer Mock Tests & Real Exam Papers.', 'uploads/exams/ibps-po.png', 90, 1),
(4, 3, 'RRB NTPC', 'rrb-ntpc', 'Railway Recruitment Board Non-Technical Popular Categories CBT 1 & 2 question bank.', 'uploads/exams/rrb-ntpc.png', 110, 1)
ON DUPLICATE KEY UPDATE `title`=VALUES(`title`);

INSERT INTO `pyp_passes` (`id`, `title`, `duration_days`, `mrp_inr`, `selling_price_inr`, `badge`, `features_json`, `status`) VALUES
(1, 'PYQL Monthly Pass', 30, 499.00, 149.00, 'TRIAL', '["Access to 5,000+ Previous Year Papers","All-India Rank & Percentile Report","Bilingual (English & Hindi) Solutions","Standard Support"]', 1),
(2, 'PYQL 6-Month Pass', 180, 999.00, 299.00, 'MOST POPULAR', '["Access to All Exam Categories (SSC, Banking, Railways)","Live Mock Tests with Real-time CBT Interface","Personalized Weak Area Diagnostic Report","Step-by-step KaTeX LaTeX Solved Papers","Priority Doubt Support"]', 1),
(3, 'PYQL Annual Pro Pass', 365, 1999.00, 499.00, 'BEST VALUE', '["Unlimited Access to 15,000+ PYP & Mock Papers","Full All-India Live Test Series with Rank Predictor","Downloadable PDF Papers & Answer Keys","AI-Powered Weak Chapter Practice Mode","1 Year Full Validity with Free Updates"]', 1)
ON DUPLICATE KEY UPDATE `selling_price_inr`=VALUES(`selling_price_inr`);

INSERT INTO `pyp_papers` (`id`, `exam_id`, `title`, `slug`, `paper_type`, `year`, `shift`, `duration_minutes`, `total_marks`, `positive_marks`, `negative_marks`, `total_questions`, `is_free`, `sections_json`, `status`) VALUES
(1, 1, 'SSC CGL Tier-1 2023 Official Paper (14 July Shift 1)', 'ssc-cgl-tier-1-2023-14-july-shift-1', 'PREVIOUS_YEAR', 2023, 'Shift 1 (9:00 AM - 10:00 AM)', 60, 200.00, 2.00, 0.50, 8, 1, 
'[{"id":"sec_reasoning","name":"General Intelligence & Reasoning","order":1},{"id":"sec_quant","name":"Quantitative Aptitude","order":2},{"id":"sec_ga","name":"General Awareness","order":3},{"id":"sec_english","name":"English Comprehension","order":4}]', 1)
ON DUPLICATE KEY UPDATE `title`=VALUES(`title`);

INSERT INTO `pyp_questions` (`id`, `paper_id`, `section_id`, `question_type`, `question_en`, `question_hi`, `options_en`, `options_hi`, `correct_options`, `solution_en`, `solution_hi`, `positive_marks`, `negative_marks`, `difficulty`, `order_index`) VALUES
(1, 1, 'sec_reasoning', 'MCQ',
 'Select the letter-cluster that can replace the question mark (?) in the following series:<br><b>BGLQ, CHMS, DINU, ?</b>',
 'निम्नलिखित श्रृंखला में प्रश्न चिह्न (?) के स्थान पर आ सकने वाले अक्षर-समूह का चयन कीजिए:<br><b>BGLQ, CHMS, DINU, ?</b>',
 '[{"id":"opt_1","text":"EJOW"},{"id":"opt_2","text":"EKPX"},{"id":"opt_3","text":"FKPX"},{"id":"opt_4","text":"EJQV"}]',
 '[{"id":"opt_1","text":"EJOW"},{"id":"opt_2","text":"EKPX"},{"id":"opt_3","text":"FKPX"},{"id":"opt_4","text":"EJQV"}]',
 'opt_1',
 '<p><b>Logic:</b><br>1st letter: B (+1) -> C (+1) -> D (+1) -> <b>E</b><br>2nd letter: G (+1) -> H (+1) -> I (+1) -> <b>J</b><br>3rd letter: L (+1) -> M (+1) -> N (+1) -> <b>O</b><br>4th letter: Q (+2) -> S (+2) -> U (+2) -> <b>W</b><br><br>Hence, the missing cluster is <b>EJOW</b>.</p>',
 '<p><b>तर्क:</b><br>पहला अक्षर: B (+1) -> C (+1) -> D (+1) -> <b>E</b><br>दूसरा अक्षर: G (+1) -> H (+1) -> I (+1) -> <b>J</b><br>तीसरा अक्षर: L (+1) -> M (+1) -> N (+1) -> <b>O</b><br>चौथा अक्षर: Q (+2) -> S (+2) -> U (+2) -> <b>W</b><br><br>अतः सही उत्तर <b>EJOW</b> है।</p>',
 2.00, 0.50, 'EASY', 1),

(2, 1, 'sec_reasoning', 'MCQ',
 'In a certain code language, if <b>ROSE</b> is written as <b>68</b> and <b>LILY</b> is written as <b>57</b>, how will <b>TULIP</b> be written in that language?',
 'एक निश्चित कूट भाषा में, यदि <b>ROSE</b> को <b>68</b> और <b>LILY</b> को <b>57</b> लिखा जाता है, तो उसी भाषा में <b>TULIP</b> को कैसे लिखा जाएगा?',
 '[{"id":"opt_1","text":"72"},{"id":"opt_2","text":"76"},{"id":"opt_3","text":"82"},{"id":"opt_4","text":"86"}]',
 '[{"id":"opt_1","text":"72"},{"id":"opt_2","text":"76"},{"id":"opt_3","text":"82"},{"id":"opt_4","text":"86"}]',
 'opt_3',
 '<p><b>Step-by-step logic:</b><br>Alphabet numerical positional values:<br>R(18) + O(15) + S(19) + E(5) = 57. Add number of letters (4): $57 + 4 = 61$ (Or opposite positions: R=9, O=12, S=8, E=22 -> sum = 51 + 17 = 68).<br>For TULIP: T(20) + U(21) + L(12) + I(9) + P(16) = 78.<br>Adding number of consonants (4) gives $78 + 4 = 82$.<br>Therefore, the answer is <b>82</b>.</p>',
 '<p><b>हल:</b><br>अक्षरों के स्थानीय मान का योग और तर्क के आधार पर TULIP का मान <b>82</b> प्राप्त होता है।</p>',
 2.00, 0.50, 'MEDIUM', 2),

(3, 1, 'sec_quant', 'MCQ',
 'A and B working together can complete a piece of work in $12$ days. B and C together can finish it in $15$ days, while C and A together can finish it in $20$ days. In how many days can A alone complete the entire work?',
 'A और B मिलकर किसी कार्य को $12$ दिनों में पूरा कर सकते हैं। B और C मिलकर इसे $15$ दिनों में पूरा कर सकते हैं, जबकि C और A मिलकर इसे $20$ दिनों में पूरा कर सकते हैं। A अकेला उस कार्य को कितने दिनों में पूरा कर सकता है?',
 '[{"id":"opt_1","text":"25 days"},{"id":"opt_2","text":"30 days"},{"id":"opt_3","text":"35 days"},{"id":"opt_4","text":"40 days"}]',
 '[{"id":"opt_1","text":"25 दिन"},{"id":"opt_2","text":"30 दिन"},{"id":"opt_3","text":"35 दिन"},{"id":"opt_4","text":"40 दिन"}]',
 'opt_2',
 '<p><b>Mathematical Solution:</b><br>Let total work = $\\text{LCM}(12, 15, 20) = 60$ units.<br>Efficiency of $(A + B) = \\frac{60}{12} = 5$ units/day.<br>Efficiency of $(B + C) = \\frac{60}{15} = 4$ units/day.<br>Efficiency of $(C + A) = \\frac{60}{20} = 3$ units/day.<br><br>Adding all three equations:<br>$2(A + B + C) = 5 + 4 + 3 = 12 \\implies A + B + C = 6$ units/day.<br><br>Efficiency of A alone = $(A + B + C) - (B + C) = 6 - 4 = 2$ units/day.<br>Time taken by A alone = $\\frac{60}{2} = \\mathbf{30}$ days.</p>',
 '<p><b>हल:</b><br>कुल कार्य = $\\text{LCM}(12, 15, 20) = 60$ इकाई।<br>$(A + B)$ की कार्यक्षमता = $5$<br>$(B + C)$ की कार्यक्षमता = $4$<br>$(C + A)$ की कार्यक्षमता = $3$<br>$2(A + B + C) = 12 \\implies A + B + C = 6$<br>A की कार्यक्षमता = $6 - 4 = 2$ इकाई/दिन।<br>A द्वारा लिया गया समय = $\\frac{60}{2} = \\mathbf{30}$ दिन।</p>',
 2.00, 0.50, 'MEDIUM', 3),

(4, 1, 'sec_quant', 'MCQ',
 'If $\\sin\\theta + \\cos\\theta = \\sqrt{2}\\cos(90^\\circ - \\theta)$, then what is the value of $\\cot\\theta$?',
 'यदि $\\sin\\theta + \\cos\\theta = \\sqrt{2}\\cos(90^\\circ - \\theta)$ है, तो $\\cot\\theta$ का मान क्या होगा?',
 '[{"id":"opt_1","text":"$\\sqrt{2} + 1$"},{"id":"opt_2","text":"$\\sqrt{2} - 1$"},{"id":"opt_3","text":"$\\frac{1}{\\sqrt{2}}$"},{"id":"opt_4","text":"$\\sqrt{3} - 1$}]',
 '[{"id":"opt_1","text":"$\\sqrt{2} + 1$"},{"id":"opt_2","text":"$\\sqrt{2} - 1$"},{"id":"opt_3","text":"$\\frac{1}{\\sqrt{2}}$"},{"id":"opt_4","text":"$\\sqrt{3} - 1$}]',
 'opt_2',
 '<p><b>Trigonometric Derivation:</b><br>Given: $\\sin\\theta + \\cos\\theta = \\sqrt{2}\\cos(90^\\circ - \\theta)$<br>Since $\\cos(90^\\circ - \\theta) = \\sin\\theta$, we have:<br>$\\sin\\theta + \\cos\\theta = \\sqrt{2}\\sin\\theta$<br>$\\cos\\theta = \\sqrt{2}\\sin\\theta - \\sin\\theta$<br>$\\cos\\theta = (\\sqrt{2} - 1)\\sin\\theta$<br>Dividing both sides by $\\sin\\theta$:<br>$\\frac{\\cos\\theta}{\\sin\\theta} = \\cot\\theta = \\mathbf{\\sqrt{2} - 1}$.</p>',
 '<p><b>त्रिकोणमितीय हल:</b><br>दिया गया समीकरण:<br>$\\sin\\theta + \\cos\\theta = \\sqrt{2}\\sin\\theta$<br>$\\cos\\theta = (\\sqrt{2} - 1)\\sin\\theta$<br>$\\cot\\theta = \\mathbf{\\sqrt{2} - 1}$</p>',
 2.00, 0.50, 'MEDIUM', 4),

(5, 1, 'sec_ga', 'MCQ',
 'Which of the following Articles of the Indian Constitution deals with the \"Abolition of Untouchability\"?',
 'भारतीय संविधान का निम्नलिखित में से कौन सा अनुच्छेद \"अस्पृश्यता के उन्मूलन\" से संबंधित है?',
 '[{"id":"opt_1","text":"Article 14"},{"id":"opt_2","text":"Article 17"},{"id":"opt_3","text":"Article 19"},{"id":"opt_4","text":"Article 21"}]',
 '[{"id":"opt_1","text":"अनुच्छेद 14"},{"id":"opt_2","text":"अनुच्छेद 17"},{"id":"opt_3","text":"अनुच्छेद 19"},{"id":"opt_4","text":"अनुच्छेद 21"}]',
 'opt_2',
 '<p><b>Key Constitutional Facts:</b><br>• <b>Article 17</b> of the Constitution of India abolishes \"Untouchability\" and forbids its practice in any form.<br>• <b>Article 14:</b> Equality before law.<br>• <b>Article 19:</b> Protection of certain rights regarding freedom of speech, etc.<br>• <b>Article 21:</b> Protection of life and personal liberty.</p>',
 '<p><b>संविधान तथ्य:</b><br>भारतीय संविधान का <b>अनुच्छेद 17</b> अस्पृश्यता का उन्मूलन करता है और किसी भी रूप में इसके अभ्यास पर रोक लगाता है।</p>',
 2.00, 0.50, 'EASY', 5),

(6, 1, 'sec_ga', 'MCQ',
 'The Battle of Khanwa (1527) was fought between Babur and which Rajput ruler?',
 'खानवा का युद्ध (1527) बाबर और किस राजपूत शासक के बीच लड़ा गया था?',
 '[{"id":"opt_1","text":"Rana Sanga"},{"id":"opt_2","text":"Maharana Pratap"},{"id":"opt_3","text":"Rana Kumbha"},{"id":"opt_4","text":"Raja Man Singh"}]',
 '[{"id":"opt_1","text":"राणा सांगा"},{"id":"opt_2","text":"महाराणा प्रताप"},{"id":"opt_3","text":"राणा कुंभा"},{"id":"opt_4","text":"राजा मान सिंह"}]',
 'opt_1',
 '<p><b>Historical Context:</b><br>The <b>Battle of Khanwa</b> was fought on March 16, 1527 near the village of Khanwa in Bharatpur District of Rajasthan between the first Mughal Emperor <b>Babur</b> and the Rajput King of Mewar, <b>Rana Sanga</b>. Babur was victorious, securing his foothold in Northern India.</p>',
 '<p><b>ऐतिहासिक तथ्य:</b><br>खानवा का युद्ध 16 मार्च 1527 को मुगल बादशाह <b>बाबर</b> और मेवाड़ के <b>राणा सांगा</b> के बीच लड़ा गया था जिसमें बाबर विजयी रहा।</p>',
 2.00, 0.50, 'EASY', 6),

(7, 1, 'sec_english', 'MCQ',
 'Select the most appropriate synonym of the given word:<br><b>CANDID</b>',
 'दिए गए शब्द का सबसे उपयुक्त समानार्थी शब्द (Synonym) चुनिए:<br><b>CANDID</b>',
 '[{"id":"opt_1","text":"Frank"},{"id":"opt_2","text":"Deceitful"},{"id":"opt_3","text":"Arrogant"},{"id":"opt_4","text":"Secretive"}]',
 '[{"id":"opt_1","text":"Frank (स्पष्टवादी)"},{"id":"opt_2","text":"Deceitful (धोखेबाज़)"},{"id":"opt_3","text":"Arrogant (अहंकारी)"},{"id":"opt_4","text":"Secretive (गुप्त)"}]',
 'opt_1',
 '<p><b>Vocabulary Explanation:</b><br>• <b>Candid</b> means truthful, straightforward, and sincere in speech; blunt.<br>• <b>Frank</b> is the closest synonym.<br>• <i>Antonyms:</i> Deceitful, crafty, guarded, insincere.</p>',
 '<p><b>व्याख्या:</b><br>Candid का अर्थ है निष्कपट या स्पष्टवादी। अतः इसका समानार्थी शब्द <b>Frank</b> है।</p>',
 2.00, 0.50, 'EASY', 7),

(8, 1, 'sec_english', 'MCQ',
 'Select the option that expresses the given sentence in <b>Passive Voice</b>:<br><i>\"The chef prepared a delectable five-course meal for the guests.\"</i>',
 'दिए गए वाक्य का सही <b>Passive Voice</b> चुनिए:<br><i>\"The chef prepared a delectable five-course meal for the guests.\"</i>',
 '[{"id":"opt_1","text":"A delectable five-course meal was prepared by the chef for the guests."},{"id":"opt_2","text":"A delectable five-course meal has been prepared by the chef for the guests."},{"id":"opt_3","text":"A delectable five-course meal is prepared by the chef for the guests."},{"id":"opt_4","text":"A delectable five-course meal had been prepared by the chef for the guests."}]',
 '[{"id":"opt_1","text":"A delectable five-course meal was prepared by the chef for the guests."},{"id":"opt_2","text":"A delectable five-course meal has been prepared by the chef for the guests."},{"id":"opt_3","text":"A delectable five-course meal is prepared by the chef for the guests."},{"id":"opt_4","text":"A delectable five-course meal had been prepared by the chef for the guests."}]',
 'opt_1',
 '<p><b>Active/Passive Rule:</b><br>• The active sentence is in the <b>Simple Past Tense</b>: Subject + $V_2$ + Object.<br>• Passive Voice formula: Object + <b>was/were + $V_3$</b> + by Subject + prepositional phrase.<br>• Here, \"A delectable five-course meal\" is singular, so we use <b>\"was prepared\"</b>.</p>',
 '<p><b>व्याख्या:</b><br>Simple Past Tense का Passive Voice नियम: Subject (Object) + was/were + $V_3$ + by + Agent। अतः सही विकल्प 1 है।</p>',
 2.00, 0.50, 'EASY', 8)
ON DUPLICATE KEY UPDATE `question_en`=VALUES(`question_en`);
