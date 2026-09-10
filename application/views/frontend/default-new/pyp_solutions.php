<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?= htmlspecialchars($page_title); ?></title>
    <!-- Tailwind CSS -->
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <!-- KaTeX for LaTeX rendering -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/katex@0.16.8/dist/katex.min.css">
    <script defer src="https://cdn.jsdelivr.net/npm/katex@0.16.8/dist/katex.min.js"></script>
    <script defer src="https://cdn.jsdelivr.net/npm/katex@0.16.8/dist/contrib/auto-render.min.js"></script>
</head>
<body class="bg-slate-50 min-h-screen text-slate-800 antialiased font-sans pb-20">

    <!-- Sticky Solutions Navigation -->
    <header class="h-16 bg-white border-b border-slate-200 px-6 flex items-center justify-between shadow-xs sticky top-0 z-30">
        <div class="flex items-center gap-3">
            <a href="<?= site_url('test-series'); ?>" class="font-black text-2xl tracking-tight text-blue-600">
                PYQL<span class="text-amber-500">.in</span>
            </a>
            <span class="text-xs bg-slate-100 text-slate-600 font-semibold px-2 py-0.5 rounded">Solutions Engine</span>
        </div>

        <div class="flex items-center gap-4">
            <!-- Language Toggle -->
            <div class="flex items-center gap-1.5 text-xs bg-slate-100 px-3 py-1.5 rounded-lg border border-slate-200 font-medium text-slate-600">
                <span>Language:</span>
                <select id="solLangSelect" onchange="toggleSolLang(this.value)" class="bg-transparent font-bold text-blue-600 outline-none cursor-pointer">
                    <option value="en" selected>English</option>
                    <option value="hi">हिंदी (Hindi)</option>
                </select>
            </div>

            <a href="<?= site_url('test-series/scorecard/' . $attempt['id']); ?>" class="border border-slate-300 text-slate-700 hover:bg-slate-100 font-semibold text-xs px-4 py-2 rounded-lg transition">
                <i class="fa-solid fa-chart-pie mr-1"></i> Back to Scorecard
            </a>
        </div>
    </header>

    <main class="max-w-4xl mx-auto px-4 pt-6 space-y-6">

        <!-- Top Title & Filter Bar -->
        <div class="bg-white rounded-2xl p-6 border border-slate-200 shadow-xs flex flex-col sm:flex-row justify-between items-start sm:items-center gap-4">
            <div>
                <h1 class="text-lg font-bold text-slate-800">
                    <?= htmlspecialchars($attempt['paper_title']); ?>
                </h1>
                <p class="text-xs text-slate-500">Official Detailed Step-by-Step Solutions</p>
            </div>

            <!-- Filter Buttons -->
            <div class="flex items-center gap-1.5 bg-slate-100 p-1 rounded-xl text-xs font-semibold">
                <button onclick="filterQuestions('all')" id="filter-all" class="px-3 py-1.5 rounded-lg bg-white text-blue-600 shadow-xs transition">
                    All (<?= count($questions); ?>)
                </button>
                <button onclick="filterQuestions('correct')" id="filter-correct" class="px-3 py-1.5 rounded-lg text-slate-600 hover:bg-white/50 transition">
                    Correct (<?= (int)$attempt['correct_count']; ?>)
                </button>
                <button onclick="filterQuestions('incorrect')" id="filter-incorrect" class="px-3 py-1.5 rounded-lg text-slate-600 hover:bg-white/50 transition">
                    Incorrect (<?= (int)$attempt['incorrect_count']; ?>)
                </button>
                <button onclick="filterQuestions('unattempted')" id="filter-unattempted" class="px-3 py-1.5 rounded-lg text-slate-600 hover:bg-white/50 transition">
                    Skipped (<?= (int)$attempt['unattempted_count']; ?>)
                </button>
            </div>
        </div>

        <!-- Question Solution Cards List -->
        <div id="solutionsList" class="space-y-6">
            <?php foreach ($questions as $idx => $q): 
                $is_correct = ($q['is_correct'] === '1' || $q['is_correct'] === 1);
                $is_incorrect = ($q['is_correct'] === '0' || $q['is_correct'] === 0);
                $is_unattempted = ($q['is_correct'] === null || $q['is_correct'] === '');
                
                $filter_tag = 'unattempted';
                if ($is_correct) $filter_tag = 'correct';
                else if ($is_incorrect) $filter_tag = 'incorrect';

                $user_choice = $q['selected_options'][0] ?? null;
                $correct_opt = $q['correct_options_arr'][0] ?? null;
            ?>
                <div class="question-card bg-white rounded-2xl border border-slate-200 shadow-xs p-6 transition" data-filter="<?= $filter_tag; ?>">
                    
                    <!-- Card Top Header -->
                    <div class="flex items-center justify-between pb-4 mb-4 border-b border-slate-100 text-xs">
                        <div class="flex items-center gap-2">
                            <span class="font-bold text-slate-700 text-sm">Question <?= $idx + 1; ?></span>
                            <?php if ($is_correct): ?>
                                <span class="bg-emerald-50 text-emerald-700 border border-emerald-200 px-2 py-0.5 rounded-full font-bold">
                                    <i class="fa-solid fa-check mr-1"></i> Correct (+<?= (float)$q['positive_marks']; ?>)
                                </span>
                            <?php elseif ($is_incorrect): ?>
                                <span class="bg-rose-50 text-rose-600 border border-rose-200 px-2 py-0.5 rounded-full font-bold">
                                    <i class="fa-solid fa-xmark mr-1"></i> Incorrect (-<?= (float)$q['negative_marks']; ?>)
                                </span>
                            <?php else: ?>
                                <span class="bg-slate-100 text-slate-600 border border-slate-200 px-2 py-0.5 rounded-full font-bold">
                                    <i class="fa-solid fa-minus mr-1"></i> Skipped (0.00)
                                </span>
                            <?php endif; ?>
                        </div>

                        <div class="flex items-center gap-3">
                            <button onclick="toggleBookmark(this)" class="text-slate-400 hover:text-amber-500 font-medium text-xs transition">
                                <i class="fa-regular fa-star mr-1"></i> Bookmark
                            </button>
                            <button onclick="reportQuestion(<?= $q['id']; ?>)" class="text-slate-400 hover:text-rose-500 font-medium text-xs transition">
                                <i class="fa-regular fa-flag mr-1"></i> Report
                            </button>
                        </div>
                    </div>

                    <!-- Question Content -->
                    <div class="sol-q-en text-slate-800 text-sm font-medium mb-6 leading-relaxed">
                        <?= $q['question_en']; ?>
                    </div>
                    <?php if (!empty($q['question_hi'])): ?>
                        <div class="sol-q-hi text-slate-800 text-sm font-medium mb-6 leading-relaxed hidden">
                            <?= $q['question_hi']; ?>
                        </div>
                    <?php endif; ?>

                    <!-- Options List with Status Highlighting -->
                    <div class="space-y-2.5 mb-6">
                        <!-- English Options -->
                        <div class="sol-opt-en space-y-2.5">
                            <?php foreach ($q['options_en'] as $opt_idx => $opt): 
                                $is_this_correct = ($opt['id'] === $correct_opt);
                                $is_user_choice = ($opt['id'] === $user_choice);

                                $opt_style = "border-slate-200 bg-white text-slate-700";
                                if ($is_this_correct) {
                                    $opt_style = "border-emerald-500 bg-emerald-50/80 text-emerald-900 font-semibold ring-1 ring-emerald-500";
                                } elseif ($is_user_choice && !$is_this_correct) {
                                    $opt_style = "border-rose-400 bg-rose-50 text-rose-800 font-medium line-through";
                                }
                            ?>
                                <div class="p-3.5 rounded-xl border text-xs flex items-center justify-between <?= $opt_style; ?>">
                                    <div class="flex items-center gap-3">
                                        <span class="w-6 h-6 rounded-full flex items-center justify-center font-bold text-[11px] <?= $is_this_correct ? 'bg-emerald-600 text-white' : ($is_user_choice ? 'bg-rose-500 text-white' : 'bg-slate-100 text-slate-600'); ?>">
                                            <?= String.fromCharCode(65 + $opt_idx); ?>
                                        </span>
                                        <span><?= $opt['text']; ?></span>
                                    </div>

                                    <div>
                                        <?php if ($is_this_correct && $is_user_choice): ?>
                                            <span class="bg-emerald-600 text-white text-[10px] font-bold px-2 py-0.5 rounded-md">✓ Correct & Your Choice</span>
                                        <?php elseif ($is_this_correct): ?>
                                            <span class="text-emerald-700 font-bold text-[11px]">✓ Correct Answer</span>
                                        <?php elseif ($is_user_choice): ?>
                                            <span class="text-rose-600 font-bold text-[11px]">✕ Your Choice</span>
                                        <?php endif; ?>
                                    </div>
                                </div>
                            <?php endforeach; ?>
                        </div>

                        <!-- Hindi Options -->
                        <?php if (!empty($q['options_hi'])): ?>
                            <div class="sol-opt-hi space-y-2.5 hidden">
                                <?php foreach ($q['options_hi'] as $opt_idx => $opt): 
                                    $is_this_correct = ($opt['id'] === $correct_opt);
                                    $is_user_choice = ($opt['id'] === $user_choice);

                                    $opt_style = "border-slate-200 bg-white text-slate-700";
                                    if ($is_this_correct) {
                                        $opt_style = "border-emerald-500 bg-emerald-50/80 text-emerald-900 font-semibold ring-1 ring-emerald-500";
                                    } elseif ($is_user_choice && !$is_this_correct) {
                                        $opt_style = "border-rose-400 bg-rose-50 text-rose-800 font-medium line-through";
                                    }
                                ?>
                                    <div class="p-3.5 rounded-xl border text-xs flex items-center justify-between <?= $opt_style; ?>">
                                        <div class="flex items-center gap-3">
                                            <span class="w-6 h-6 rounded-full flex items-center justify-center font-bold text-[11px] <?= $is_this_correct ? 'bg-emerald-600 text-white' : ($is_user_choice ? 'bg-rose-500 text-white' : 'bg-slate-100 text-slate-600'); ?>">
                                                <?= String.fromCharCode(65 + $opt_idx); ?>
                                            </span>
                                            <span><?= $opt['text']; ?></span>
                                        </div>

                                        <div>
                                            <?php if ($is_this_correct && $is_user_choice): ?>
                                                <span class="bg-emerald-600 text-white text-[10px] font-bold px-2 py-0.5 rounded-md">✓ Correct & Your Choice</span>
                                            <?php elseif ($is_this_correct): ?>
                                                <span class="text-emerald-700 font-bold text-[11px]">✓ Correct Answer</span>
                                            <?php elseif ($is_user_choice): ?>
                                                <span class="text-rose-600 font-bold text-[11px]">✕ Your Choice</span>
                                            <?php endif; ?>
                                        </div>
                                    </div>
                                <?php endforeach; ?>
                            </div>
                        <?php endif; ?>
                    </div>

                    <!-- Detailed Step-by-Step Solution Box -->
                    <div class="bg-blue-50/40 rounded-xl p-5 border border-blue-100">
                        <div class="flex items-center gap-2 mb-2">
                            <i class="fa-solid fa-lightbulb text-amber-500 text-sm"></i>
                            <h4 class="font-bold text-xs uppercase tracking-wider text-blue-900">
                                Detailed Step-by-Step Solution:
                            </h4>
                        </div>

                        <div class="sol-expl-en text-xs text-slate-700 leading-relaxed font-normal">
                            <?= !empty($q['solution_en']) ? $q['solution_en'] : '<p class="italic text-slate-400">Solution will be updated shortly.</p>'; ?>
                        </div>

                        <?php if (!empty($q['solution_hi'])): ?>
                            <div class="sol-expl-hi text-xs text-slate-700 leading-relaxed font-normal hidden">
                                <?= $q['solution_hi']; ?>
                            </div>
                        <?php endif; ?>
                    </div>

                </div>
            <?php endforeach; ?>
        </div>

    </main>

    <script>
        document.addEventListener('DOMContentLoaded', () => {
            renderKaTeX();
        });

        // 1. Switch Language in Solutions
        function toggleSolLang(lang) {
            const showEn = (lang === 'en');

            document.querySelectorAll('.sol-q-en, .sol-opt-en, .sol-expl-en').forEach(el => {
                el.classList.toggle('hidden', !showEn);
            });
            document.querySelectorAll('.sol-q-hi, .sol-opt-hi, .sol-expl-hi').forEach(el => {
                el.classList.toggle('hidden', showEn);
            });

            renderKaTeX();
        }

        // 2. Filter Cards by Status
        function filterQuestions(type) {
            document.querySelectorAll('[id^="filter-"]').forEach(btn => {
                btn.className = "px-3 py-1.5 rounded-lg text-slate-600 hover:bg-white/50 transition";
            });
            const activeBtn = document.getElementById(`filter-${type}`);
            if (activeBtn) {
                activeBtn.className = "px-3 py-1.5 rounded-lg bg-white text-blue-600 shadow-xs transition";
            }

            document.querySelectorAll('.question-card').forEach(card => {
                if (type === 'all') {
                    card.classList.remove('hidden');
                } else {
                    const match = card.getAttribute('data-filter') === type;
                    card.classList.toggle('hidden', !match);
                }
            });
        }

        function toggleBookmark(btn) {
            const isMarked = btn.classList.contains('text-amber-500');
            if (isMarked) {
                btn.className = "text-slate-400 hover:text-amber-500 font-medium text-xs transition";
                btn.innerHTML = `<i class="fa-regular fa-star mr-1"></i> Bookmark`;
            } else {
                btn.className = "text-amber-500 font-bold text-xs transition";
                btn.innerHTML = `<i class="fa-solid fa-star mr-1"></i> Bookmarked`;
            }
        }

        function reportQuestion(qId) {
            alert(`Question #${qId} reported to academic review team. Thank you!`);
        }

        function renderKaTeX() {
            if (typeof renderMathInElement === 'function') {
                renderMathInElement(document.body, {
                    delimiters: [
                        { left: '$$', right: '$$', display: true },
                        { left: '$', right: '$', display: false }
                    ],
                    throwOnError: false
                });
            }
        }
    </script>
</body>
</html>
