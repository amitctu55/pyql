<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?= htmlspecialchars($page_title); ?></title>
    <!-- Tailwind CSS -->
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body class="bg-slate-50 min-h-screen text-slate-800 antialiased font-sans flex flex-col justify-between">

    <!-- Top Navigation Header -->
    <header class="h-16 bg-white border-b border-slate-200 px-6 flex items-center justify-between shadow-xs sticky top-0 z-30">
        <div class="flex items-center gap-6">
            <a href="<?= site_url('test-series'); ?>" class="font-black text-2xl tracking-tight text-blue-600">
                PYQL<span class="text-amber-500">.in</span>
            </a>
            <nav class="hidden md:flex items-center gap-5 text-xs font-semibold text-slate-600">
                <a href="<?= site_url('test-series'); ?>" class="text-blue-600">Test Series</a>
                <a href="<?= site_url('test-series/exam/ssc-cgl'); ?>" class="hover:text-blue-600">SSC CGL</a>
                <a href="<?= site_url('test-series/exam/ibps-po'); ?>" class="hover:text-blue-600">Banking</a>
                <a href="<?= site_url('test-series/exam/rrb-ntpc'); ?>" class="hover:text-blue-600">Railways</a>
                <a href="<?= site_url('pass'); ?>" class="text-amber-600 flex items-center gap-1 font-bold">
                    <i class="fa-solid fa-crown text-amber-500"></i> PYQL Pass
                </a>
            </nav>
        </div>

        <div class="flex items-center gap-3">
            <?php if ($user_has_pass): ?>
                <span class="bg-emerald-50 text-emerald-700 border border-emerald-200 text-xs font-bold px-3 py-1.5 rounded-full flex items-center gap-1.5 shadow-xs">
                    <i class="fa-solid fa-circle-check"></i> PYQL Pass Active
                </span>
            <?php else: ?>
                <a href="<?= site_url('pass'); ?>" class="bg-amber-500 hover:bg-amber-600 active:bg-amber-700 text-slate-900 text-xs font-black px-4 py-2 rounded-xl transition shadow-xs flex items-center gap-1.5">
                    <i class="fa-solid fa-bolt"></i> Get PYQL Pass
                </a>
            <?php endif; ?>
        </div>
    </header>

    <!-- Main Portal Content -->
    <main class="max-w-6xl mx-auto px-4 py-8 space-y-10 flex-1 w-full">

        <!-- 1. HERO BANNER -->
        <div class="bg-gradient-to-r from-blue-700 via-indigo-700 to-blue-900 rounded-3xl p-8 md:p-12 text-white shadow-xl flex flex-col md:flex-row justify-between items-center gap-8 relative overflow-hidden">
            <div class="space-y-4 max-w-xl text-center md:text-left z-10">
                <div class="inline-flex items-center gap-2 bg-white/20 backdrop-blur-md px-3.5 py-1 rounded-full text-xs font-bold uppercase tracking-wider text-blue-100">
                    <i class="fa-solid fa-fire text-amber-300"></i> India's #1 PYP Practice Platform
                </div>
                <h1 class="text-3xl md:text-5xl font-black tracking-tight leading-tight">
                    Crack Your Dream Exam with Authentic PYPs
                </h1>
                <p class="text-blue-100 text-xs md:text-sm leading-relaxed">
                    Practice official previous year papers with Testbook-style real CBT exam interface, step-by-step bilingual solutions, and All-India percentile rankings.
                </p>
                <div class="flex flex-wrap gap-3 justify-center md:justify-start pt-2">
                    <a href="<?= site_url('test-series/instructions/1'); ?>" class="bg-amber-400 hover:bg-amber-500 text-slate-900 font-extrabold text-xs px-6 py-3 rounded-xl transition shadow-md flex items-center gap-2">
                        <i class="fa-solid fa-play"></i> Attempt Free CGL Mock Test
                    </a>
                    <a href="<?= site_url('pass'); ?>" class="bg-white/10 hover:bg-white/20 border border-white/30 text-white font-bold text-xs px-6 py-3 rounded-xl transition">
                        Explore PYQL Pass
                    </a>
                </div>
            </div>

            <!-- Hero Feature Badges -->
            <div class="grid grid-cols-2 gap-3 w-full md:w-auto z-10 text-center">
                <div class="bg-white/10 backdrop-blur-md p-4 rounded-2xl border border-white/20">
                    <div class="text-2xl font-black text-amber-300">10,000+</div>
                    <div class="text-[11px] text-blue-100 font-semibold uppercase mt-0.5">PYP Questions</div>
                </div>
                <div class="bg-white/10 backdrop-blur-md p-4 rounded-2xl border border-white/20">
                    <div class="text-2xl font-black text-emerald-300">100%</div>
                    <div class="text-[11px] text-blue-100 font-semibold uppercase mt-0.5">Bilingual Solutions</div>
                </div>
                <div class="bg-white/10 backdrop-blur-md p-4 rounded-2xl border border-white/20">
                    <div class="text-2xl font-black text-cyan-300">Real CBT</div>
                    <div class="text-[11px] text-blue-100 font-semibold uppercase mt-0.5">Exam Engine</div>
                </div>
                <div class="bg-white/10 backdrop-blur-md p-4 rounded-2xl border border-white/20">
                    <div class="text-2xl font-black text-purple-300">Instant</div>
                    <div class="text-[11px] text-blue-100 font-semibold uppercase mt-0.5">AIR & Percentile</div>
                </div>
            </div>
        </div>

        <!-- 2. EXAM CATEGORIES FILTER -->
        <section class="space-y-4">
            <div class="flex items-center justify-between">
                <div>
                    <h2 class="text-xl font-bold text-slate-800">Popular Exam Categories</h2>
                    <p class="text-xs text-slate-500">Select your target recruitment board</p>
                </div>
            </div>

            <div class="grid grid-cols-2 sm:grid-cols-3 md:grid-cols-5 gap-3">
                <?php foreach ($categories as $cat): ?>
                    <a href="<?= site_url('test-series?category=' . $cat['slug']); ?>" 
                       class="bg-white hover:bg-blue-50/50 p-4 rounded-2xl border border-slate-200 hover:border-blue-300 shadow-xs transition group text-center flex flex-col items-center justify-center gap-2">
                        <div class="w-10 h-10 rounded-xl bg-blue-50 group-hover:bg-blue-600 text-blue-600 group-hover:text-white flex items-center justify-center text-lg transition">
                            <i class="<?= $cat['icon'] ?: 'fas fa-graduation-cap'; ?>"></i>
                        </div>
                        <span class="font-bold text-xs text-slate-700 group-hover:text-blue-700">
                            <?= htmlspecialchars($cat['name']); ?>
                        </span>
                    </a>
                <?php endforeach; ?>
            </div>
        </section>

        <!-- 3. AVAILABLE EXAMS GRID -->
        <section class="space-y-4">
            <div class="flex items-center justify-between">
                <div>
                    <h2 class="text-xl font-bold text-slate-800">Target Examinations</h2>
                    <p class="text-xs text-slate-500">Official Previous Year Question Papers & Mock Series</p>
                </div>
            </div>

            <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-4 gap-5">
                <?php foreach ($exams as $ex): ?>
                    <div class="bg-white rounded-2xl border border-slate-200 shadow-xs hover:shadow-md transition p-5 flex flex-col justify-between space-y-4">
                        <div class="space-y-2">
                            <div class="flex items-center justify-between">
                                <span class="bg-blue-50 text-blue-700 font-extrabold text-[10px] uppercase px-2 py-0.5 rounded">
                                    Official Papers
                                </span>
                                <span class="text-xs text-slate-400 font-medium">
                                    <i class="fa-solid fa-file-lines mr-1"></i> <?= $ex['total_tests']; ?> Papers
                                </span>
                            </div>
                            <h3 class="font-bold text-base text-slate-800">
                                <?= htmlspecialchars($ex['title']); ?>
                            </h3>
                            <p class="text-xs text-slate-500 line-clamp-2 leading-relaxed">
                                <?= htmlspecialchars($ex['description']); ?>
                            </p>
                        </div>

                        <a href="<?= site_url('test-series/exam/' . $ex['slug']); ?>" 
                           class="w-full text-center py-2.5 bg-slate-100 hover:bg-blue-600 text-slate-700 hover:text-white rounded-xl text-xs font-bold transition">
                            View All Papers <i class="fa-solid fa-chevron-right ml-1 text-[10px]"></i>
                        </a>
                    </div>
                <?php endforeach; ?>
            </div>
        </section>

        <!-- 4. FEATURED TEST PAPERS CARDS -->
        <section class="space-y-4">
            <div class="flex items-center justify-between">
                <div>
                    <h2 class="text-xl font-bold text-slate-800">Featured Test Papers</h2>
                    <p class="text-xs text-slate-500">Attempt live with countdown timer and KaTeX formulas</p>
                </div>
            </div>

            <div class="grid grid-cols-1 md:grid-cols-2 gap-5">
                <?php foreach ($papers as $p): ?>
                    <div class="bg-white rounded-2xl border border-slate-200 shadow-xs hover:border-blue-300 p-6 flex flex-col justify-between transition gap-4">
                        <div class="space-y-2">
                            <div class="flex items-center gap-2">
                                <span class="bg-blue-50 text-blue-700 text-xs font-bold px-2.5 py-0.5 rounded-full">
                                    <?= htmlspecialchars($p['exam_title']); ?>
                                </span>
                                <?php if ($p['is_free']): ?>
                                    <span class="bg-emerald-50 text-emerald-700 text-xs font-bold px-2 py-0.5 rounded-full border border-emerald-200">
                                        FREE TEST
                                    </span>
                                <?php else: ?>
                                    <span class="bg-amber-50 text-amber-700 text-xs font-bold px-2 py-0.5 rounded-full border border-amber-200">
                                        <i class="fa-solid fa-crown text-[10px] mr-0.5"></i> PASS REQUIRED
                                    </span>
                                <?php endif; ?>
                            </div>

                            <h3 class="font-bold text-base text-slate-800">
                                <?= htmlspecialchars($p['title']); ?>
                            </h3>

                            <div class="flex flex-wrap gap-4 text-xs text-slate-500 pt-1">
                                <span><i class="fa-regular fa-clock mr-1 text-slate-400"></i> <?= $p['duration_minutes']; ?> Mins</span>
                                <span><i class="fa-solid fa-list-ol mr-1 text-slate-400"></i> <?= $p['total_questions']; ?> Questions</span>
                                <span><i class="fa-solid fa-award mr-1 text-slate-400"></i> <?= $p['total_marks']; ?> Marks</span>
                                <span><i class="fa-solid fa-language mr-1 text-slate-400"></i> English / हिंदी</span>
                            </div>
                        </div>

                        <div class="pt-2 border-t border-slate-100 flex items-center justify-between">
                            <div class="text-xs text-slate-400">
                                <i class="fa-solid fa-calendar-day mr-1"></i> <?= $p['shift']; ?>
                            </div>
                            <a href="<?= site_url('test-series/instructions/' . $p['id']); ?>" 
                               class="bg-blue-600 hover:bg-blue-700 active:bg-blue-800 text-white font-bold text-xs px-5 py-2.5 rounded-xl transition shadow-xs flex items-center gap-1.5">
                                <i class="fa-solid fa-play text-[10px]"></i> Start Test
                            </a>
                        </div>
                    </div>
                <?php endforeach; ?>
            </div>
        </section>

    </main>

    <!-- Footer -->
    <footer class="h-14 bg-white border-t border-slate-200 px-6 flex items-center justify-between text-xs text-slate-500">
        <span>&copy; <?= date('Y'); ?> <b>pyql.in</b> &bull; Testbook-Style PYP & Mock Test Series Platform.</span>
        <div class="flex gap-4">
            <a href="<?= site_url('pass'); ?>" class="hover:text-blue-600 font-semibold">PYQL Pass</a>
            <a href="<?= site_url('test-series'); ?>" class="hover:text-blue-600 font-semibold">Exams</a>
        </div>
    </footer>
</body>
</html>
