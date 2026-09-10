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
<body class="bg-slate-50 min-h-screen text-slate-800 antialiased font-sans pb-16">

    <!-- Header Navigation -->
    <header class="h-16 bg-white border-b border-slate-200 px-6 flex items-center justify-between shadow-xs sticky top-0 z-30">
        <div class="flex items-center gap-3">
            <a href="<?= site_url('test-series'); ?>" class="font-black text-2xl tracking-tight text-blue-600">
                PYQL<span class="text-amber-500">.in</span>
            </a>
            <span class="text-xs bg-slate-100 text-slate-600 font-semibold px-2 py-0.5 rounded">Scorecard & Analysis</span>
        </div>
        <div class="flex items-center gap-3">
            <a href="<?= site_url('test-series/solutions/' . $attempt['id']); ?>" class="bg-blue-600 hover:bg-blue-700 text-white font-semibold text-xs px-4 py-2 rounded-lg transition shadow-xs">
                <i class="fa-solid fa-list-check mr-1.5"></i> View Detailed Solutions
            </a>
            <a href="<?= site_url('test-series'); ?>" class="border border-slate-300 text-slate-700 hover:bg-slate-100 font-semibold text-xs px-4 py-2 rounded-lg transition">
                <i class="fa-solid fa-house mr-1"></i> Dashboard
            </a>
        </div>
    </header>

    <main class="max-w-5xl mx-auto px-4 pt-8 space-y-6">

        <!-- 1. PERFORMANCE OVERVIEW HERO CARD -->
        <div class="bg-gradient-to-r from-blue-700 via-indigo-700 to-blue-900 rounded-3xl p-8 text-white shadow-xl flex flex-col md:flex-row justify-between items-center gap-8 relative overflow-hidden">
            <div class="space-y-2 text-center md:text-left z-10">
                <div class="inline-flex items-center gap-2 bg-white/20 backdrop-blur-md px-3 py-1 rounded-full text-xs font-bold uppercase tracking-wider text-blue-100">
                    <i class="fa-solid fa-trophy text-amber-300"></i> All India Result
                </div>
                <h1 class="text-3xl md:text-4xl font-black tracking-tight">
                    Rank #<?= (int)$attempt['all_india_rank']; ?>
                </h1>
                <p class="text-blue-100 text-xs md:text-sm font-medium">
                    Out of <span class="font-bold text-white"><?= number_format($total_candidates); ?></span> test takers across India
                </p>
                <div class="text-[13px] text-blue-200 font-medium pt-1">
                    <?= htmlspecialchars($attempt['paper_title']); ?>
                </div>
            </div>

            <!-- Score / Percentile / Accuracy Badges -->
            <div class="grid grid-cols-3 gap-3 w-full md:w-auto z-10">
                <div class="bg-white/10 backdrop-blur-md px-5 py-4 rounded-2xl border border-white/20 text-center">
                    <div class="text-2xl font-black text-amber-300">
                        <?= (float)$attempt['score_obtained']; ?> <span class="text-xs text-white/80 font-normal">/ <?= (float)$attempt['total_marks']; ?></span>
                    </div>
                    <div class="text-[11px] text-blue-100 font-bold uppercase tracking-wider mt-0.5">Score</div>
                </div>

                <div class="bg-white/10 backdrop-blur-md px-5 py-4 rounded-2xl border border-white/20 text-center">
                    <div class="text-2xl font-black text-emerald-300">
                        <?= (float)$attempt['percentile']; ?>%
                    </div>
                    <div class="text-[11px] text-blue-100 font-bold uppercase tracking-wider mt-0.5">Percentile</div>
                </div>

                <div class="bg-white/10 backdrop-blur-md px-5 py-4 rounded-2xl border border-white/20 text-center">
                    <div class="text-2xl font-black text-cyan-300">
                        <?= (float)$attempt['accuracy_percentage']; ?>%
                    </div>
                    <div class="text-[11px] text-blue-100 font-bold uppercase tracking-wider mt-0.5">Accuracy</div>
                </div>
            </div>
        </div>

        <!-- 2. SUMMARY COUNTERS -->
        <div class="grid grid-cols-2 sm:grid-cols-4 gap-4">
            <div class="bg-white p-5 rounded-2xl border border-slate-200 shadow-xs flex items-center gap-4">
                <div class="w-12 h-12 rounded-xl bg-emerald-50 text-emerald-600 flex items-center justify-center text-xl shrink-0">
                    <i class="fa-solid fa-circle-check"></i>
                </div>
                <div>
                    <div class="text-2xl font-black text-slate-800"><?= (int)$attempt['correct_count']; ?></div>
                    <div class="text-xs text-slate-500 font-medium">Correct Answers</div>
                </div>
            </div>

            <div class="bg-white p-5 rounded-2xl border border-slate-200 shadow-xs flex items-center gap-4">
                <div class="w-12 h-12 rounded-xl bg-rose-50 text-rose-600 flex items-center justify-center text-xl shrink-0">
                    <i class="fa-solid fa-circle-xmark"></i>
                </div>
                <div>
                    <div class="text-2xl font-black text-slate-800"><?= (int)$attempt['incorrect_count']; ?></div>
                    <div class="text-xs text-slate-500 font-medium">Incorrect Answers</div>
                </div>
            </div>

            <div class="bg-white p-5 rounded-2xl border border-slate-200 shadow-xs flex items-center gap-4">
                <div class="w-12 h-12 rounded-xl bg-slate-100 text-slate-600 flex items-center justify-center text-xl shrink-0">
                    <i class="fa-solid fa-circle-minus"></i>
                </div>
                <div>
                    <div class="text-2xl font-black text-slate-800"><?= (int)$attempt['unattempted_count']; ?></div>
                    <div class="text-xs text-slate-500 font-medium">Unattempted</div>
                </div>
            </div>

            <div class="bg-white p-5 rounded-2xl border border-slate-200 shadow-xs flex items-center gap-4">
                <div class="w-12 h-12 rounded-xl bg-blue-50 text-blue-600 flex items-center justify-center text-xl shrink-0">
                    <i class="fa-regular fa-clock"></i>
                </div>
                <div>
                    <div class="text-2xl font-black text-slate-800">
                        <?= floor((int)$attempt['time_taken_seconds'] / 60); ?>m <?= (int)$attempt['time_taken_seconds'] % 60; ?>s
                    </div>
                    <div class="text-xs text-slate-500 font-medium">Time Taken</div>
                </div>
            </div>
        </div>

        <!-- 3. SECTIONAL BREAKDOWN TABLE -->
        <div class="bg-white rounded-2xl p-6 border border-slate-200 shadow-xs">
            <div class="flex items-center justify-between mb-5">
                <div>
                    <h2 class="text-base font-bold text-slate-800">Sectional Performance Analysis</h2>
                    <p class="text-xs text-slate-500">Examine your strengths and weak areas across each paper section</p>
                </div>
                <a href="<?= site_url('test-series/solutions/' . $attempt['id']); ?>" class="text-xs font-bold text-blue-600 hover:text-blue-700">
                    View Solutions &rarr;
                </a>
            </div>

            <div class="overflow-x-auto">
                <table class="w-full text-left text-xs">
                    <thead class="bg-slate-50 text-slate-500 font-bold uppercase tracking-wider border-y border-slate-200">
                        <tr>
                            <th class="py-3 px-4">Section Name</th>
                            <th class="py-3 px-4">Total Qs</th>
                            <th class="py-3 px-4">Score</th>
                            <th class="py-3 px-4">Attempted</th>
                            <th class="py-3 px-4">Correct</th>
                            <th class="py-3 px-4">Incorrect</th>
                            <th class="py-3 px-4">Accuracy</th>
                        </tr>
                    </thead>
                    <tbody class="divide-y divide-slate-100">
                        <?php foreach ($sectional_scores as $sec): ?>
                            <tr class="hover:bg-slate-50/70 transition">
                                <td class="py-3.5 px-4 font-bold text-slate-700"><?= htmlspecialchars($sec['section_name']); ?></td>
                                <td class="py-3.5 px-4 text-slate-600"><?= (int)$sec['total_questions']; ?></td>
                                <td class="py-3.5 px-4 font-black text-blue-600">
                                    <?= (float)$sec['score']; ?> <span class="text-slate-400 font-normal">/ <?= (float)$sec['max_score']; ?></span>
                                </td>
                                <td class="py-3.5 px-4 text-slate-700 font-semibold"><?= (int)$sec['attempted']; ?></td>
                                <td class="py-3.5 px-4 text-emerald-600 font-bold"><?= (int)$sec['correct']; ?></td>
                                <td class="py-3.5 px-4 text-rose-500 font-medium"><?= (int)$sec['incorrect']; ?></td>
                                <td class="py-3.5 px-4">
                                    <span class="inline-flex items-center px-2 py-0.5 rounded text-[11px] font-bold <?= ($sec['accuracy'] >= 75) ? 'bg-emerald-50 text-emerald-700' : (($sec['accuracy'] >= 50) ? 'bg-amber-50 text-amber-700' : 'bg-rose-50 text-rose-700'); ?>">
                                        <?= (float)$sec['accuracy']; ?>%
                                    </span>
                                </td>
                            </tr>
                        <?php endforeach; ?>
                    </tbody>
                </table>
            </div>
        </div>

        <!-- 4. BOTTOM CTAS -->
        <div class="flex flex-col sm:flex-row items-center justify-between bg-blue-50 border border-blue-200 rounded-2xl p-6 gap-4">
            <div>
                <h3 class="font-bold text-sm text-blue-900">Want to revise all mistakes?</h3>
                <p class="text-xs text-blue-700">Check full bilingual step-by-step solutions with KaTeX LaTeX math equations.</p>
            </div>
            <div class="flex gap-3 w-full sm:w-auto">
                <a href="<?= site_url('test-series/solutions/' . $attempt['id']); ?>" class="flex-1 sm:flex-none text-center bg-blue-600 hover:bg-blue-700 text-white font-bold text-xs px-6 py-3 rounded-xl transition shadow-sm">
                    Detailed Solutions <i class="fa-solid fa-arrow-right ml-1"></i>
                </a>
                <a href="<?= site_url('test-series/start/' . $attempt['paper_id']); ?>" class="flex-1 sm:flex-none text-center bg-white border border-slate-300 text-slate-700 hover:bg-slate-100 font-bold text-xs px-6 py-3 rounded-xl transition">
                    Re-Attempt Test
                </a>
            </div>
        </div>

    </main>
</body>
</html>
