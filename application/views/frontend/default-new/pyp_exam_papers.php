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
            <div class="text-xs text-slate-500 font-semibold hidden sm:block">
                <a href="<?= site_url('test-series'); ?>" class="hover:text-blue-600">Test Series</a> / 
                <span class="text-slate-800"><?= htmlspecialchars($exam['title']); ?></span>
            </div>
        </div>

        <div class="flex items-center gap-3">
            <a href="<?= site_url('pass'); ?>" class="bg-amber-500 hover:bg-amber-600 text-slate-900 text-xs font-black px-4 py-2 rounded-xl transition shadow-xs flex items-center gap-1.5">
                <i class="fa-solid fa-crown"></i> PYQL Pass
            </a>
        </div>
    </header>

    <main class="max-w-5xl mx-auto px-4 py-8 space-y-6 flex-1 w-full">

        <!-- Exam Header Hero Card -->
        <div class="bg-white rounded-3xl p-8 border border-slate-200 shadow-xs flex flex-col md:flex-row justify-between items-start md:items-center gap-6">
            <div class="space-y-2">
                <span class="bg-blue-100 text-blue-800 text-[10px] font-extrabold uppercase px-2 py-0.5 rounded tracking-wide">
                    Official Exam Papers
                </span>
                <h1 class="text-2xl md:text-3xl font-black text-slate-800">
                    <?= htmlspecialchars($exam['title']); ?> Previous Year Question Papers
                </h1>
                <p class="text-xs md:text-sm text-slate-500 max-w-2xl leading-relaxed">
                    <?= htmlspecialchars($exam['description']); ?>
                </p>
            </div>

            <div class="bg-slate-50 p-4 rounded-2xl border border-slate-200 text-center shrink-0 w-full md:w-auto">
                <div class="text-2xl font-black text-blue-600"><?= count($papers); ?></div>
                <div class="text-[11px] font-bold text-slate-500 uppercase mt-0.5">Available Papers</div>
            </div>
        </div>

        <!-- Papers List -->
        <div class="space-y-4">
            <h2 class="text-base font-bold text-slate-800">Available Test Series & Past Papers</h2>

            <?php if (empty($papers)): ?>
                <div class="bg-white rounded-2xl p-12 text-center border border-slate-200 text-slate-400">
                    <i class="fa-solid fa-folder-open text-4xl mb-3"></i>
                    <p class="text-sm font-medium">New test papers will be uploaded soon for this exam.</p>
                </div>
            <?php else: ?>
                <div class="grid grid-cols-1 gap-4">
                    <?php foreach ($papers as $p): ?>
                        <div class="bg-white rounded-2xl border border-slate-200 shadow-xs hover:border-blue-300 p-6 flex flex-col sm:flex-row items-start sm:items-center justify-between gap-4 transition">
                            <div class="space-y-2">
                                <div class="flex items-center gap-2">
                                    <span class="text-xs font-bold text-slate-400">Year <?= $p['year']; ?></span>
                                    <?php if ($p['is_free']): ?>
                                        <span class="bg-emerald-50 text-emerald-700 text-[10px] font-extrabold px-2 py-0.5 rounded-full border border-emerald-200">
                                            FREE
                                        </span>
                                    <?php else: ?>
                                        <span class="bg-amber-50 text-amber-700 text-[10px] font-extrabold px-2 py-0.5 rounded-full border border-amber-200">
                                            <i class="fa-solid fa-crown text-[9px] mr-0.5"></i> PASS REQUIRED
                                        </span>
                                    <?php endif; ?>
                                </div>
                                <h3 class="font-bold text-base text-slate-800">
                                    <?= htmlspecialchars($p['title']); ?>
                                </h3>
                                <div class="flex flex-wrap gap-4 text-xs text-slate-500">
                                    <span><i class="fa-regular fa-clock mr-1 text-slate-400"></i> <?= $p['duration_minutes']; ?> Mins</span>
                                    <span><i class="fa-solid fa-list-ol mr-1 text-slate-400"></i> <?= $p['total_questions']; ?> Questions</span>
                                    <span><i class="fa-solid fa-award mr-1 text-slate-400"></i> <?= $p['total_marks']; ?> Marks</span>
                                    <span><i class="fa-solid fa-language mr-1 text-slate-400"></i> English / Hindi</span>
                                </div>
                            </div>

                            <div class="shrink-0 w-full sm:w-auto">
                                <a href="<?= site_url('test-series/instructions/' . $p['id']); ?>" 
                                   class="w-full sm:w-auto text-center block bg-blue-600 hover:bg-blue-700 active:bg-blue-800 text-white font-bold text-xs px-6 py-3 rounded-xl transition shadow-xs">
                                    Start Test <i class="fa-solid fa-arrow-right ml-1"></i>
                                </a>
                            </div>
                        </div>
                    <?php endforeach; ?>
                </div>
            <?php endif; ?>
        </div>

    </main>

    <!-- Footer -->
    <footer class="h-14 bg-white border-t border-slate-200 px-6 flex items-center justify-between text-xs text-slate-500">
        <span>&copy; <?= date('Y'); ?> <b>pyql.in</b> &bull; Testbook-Style PYP Platform.</span>
        <a href="<?= site_url('test-series'); ?>" class="hover:text-blue-600 font-semibold">Back to All Exams</a>
    </footer>
</body>
</html>
