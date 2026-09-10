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
            <span class="text-xs bg-amber-50 text-amber-800 border border-amber-200 font-extrabold px-2.5 py-0.5 rounded-full flex items-center gap-1">
                <i class="fa-solid fa-crown text-amber-500"></i> PASS MEMBERSHIP
            </span>
        </div>

        <div class="flex items-center gap-3">
            <a href="<?= site_url('test-series'); ?>" class="text-xs font-semibold text-slate-600 hover:text-blue-600">
                <i class="fa-solid fa-house mr-1"></i> Back to Test Series
            </a>
        </div>
    </header>

    <main class="max-w-5xl mx-auto px-4 py-12 space-y-12 flex-1 w-full">

        <!-- Header Hero -->
        <div class="text-center space-y-3 max-w-2xl mx-auto">
            <div class="inline-flex items-center gap-2 bg-amber-100 text-amber-900 px-3.5 py-1 rounded-full text-xs font-black uppercase tracking-wider">
                <i class="fa-solid fa-bolt text-amber-600"></i> India's Most Affordable Exam Pass
            </div>
            <h1 class="text-3xl sm:text-5xl font-black text-slate-900 tracking-tight">
                One Pass. All Exams. Unlimited Practice.
            </h1>
            <p class="text-xs sm:text-sm text-slate-600 leading-relaxed">
                Unlock 10,000+ Previous Year Papers, All-India CBT Mock Tests, bilingual step-by-step KaTeX solutions, and rank predictions.
            </p>

            <?php if ($user_has_pass): ?>
                <div class="bg-emerald-50 border border-emerald-300 text-emerald-800 p-4 rounded-2xl max-w-md mx-auto text-xs font-bold flex items-center justify-center gap-2 shadow-xs">
                    <i class="fa-solid fa-circle-check text-base text-emerald-600"></i>
                    You currently have an ACTIVE PYQL Pass! All papers are unlocked.
                </div>
            <?php endif; ?>
        </div>

        <!-- 3 Subscription Tiers Cards -->
        <div class="grid grid-cols-1 md:grid-cols-3 gap-6 items-stretch">
            <?php foreach ($passes as $pass): 
                $is_popular = ($pass['badge'] === 'MOST POPULAR');
                $features = json_decode($pass['features_json'], true) ?: array();
            ?>
                <div class="bg-white rounded-3xl border <?= $is_popular ? 'border-2 border-blue-600 shadow-xl relative' : 'border-slate-200 shadow-sm'; ?> p-8 flex flex-col justify-between transition hover:shadow-md">
                    
                    <?php if ($is_popular): ?>
                        <div class="absolute -top-3.5 left-1/2 -translate-x-1/2 bg-blue-600 text-white text-[11px] font-black uppercase tracking-widest px-3.5 py-1 rounded-full shadow-sm">
                            ★ Most Popular Choice ★
                        </div>
                    <?php endif; ?>

                    <div class="space-y-4">
                        <div class="flex justify-between items-start">
                            <div>
                                <h3 class="font-bold text-lg text-slate-800"><?= htmlspecialchars($pass['title']); ?></h3>
                                <div class="text-xs text-slate-400 font-medium"><?= $pass['duration_days']; ?> Days Unlimited Access</div>
                            </div>
                            <?php if (!$is_popular && !empty($pass['badge'])): ?>
                                <span class="bg-slate-100 text-slate-600 text-[10px] font-bold px-2 py-0.5 rounded uppercase">
                                    <?= htmlspecialchars($pass['badge']); ?>
                                </span>
                            <?php endif; ?>
                        </div>

                        <!-- Price -->
                        <div class="flex items-baseline gap-2 pt-2">
                            <span class="text-4xl font-black text-slate-900">₹<?= (int)$pass['selling_price_inr']; ?></span>
                            <span class="text-sm text-slate-400 line-through font-medium">₹<?= (int)$pass['mrp_inr']; ?></span>
                            <span class="text-xs font-bold text-emerald-600 bg-emerald-50 px-2 py-0.5 rounded">
                                <?= round((($pass['mrp_inr'] - $pass['selling_price_inr']) / $pass['mrp_inr']) * 100); ?>% OFF
                            </span>
                        </div>

                        <!-- Features list -->
                        <div class="pt-4 border-t border-slate-100 space-y-3">
                            <div class="text-[11px] font-bold uppercase tracking-wider text-slate-400">Included Features:</div>
                            <ul class="space-y-2.5 text-xs text-slate-600 font-medium">
                                <?php foreach ($features as $f): ?>
                                    <li class="flex items-start gap-2.5">
                                        <i class="fa-solid fa-check text-emerald-500 mt-0.5 text-[11px] shrink-0"></i>
                                        <span><?= htmlspecialchars($f); ?></span>
                                    </li>
                                <?php endforeach; ?>
                            </ul>
                        </div>
                    </div>

                    <!-- Buy CTA / Trial Activation -->
                    <div class="pt-8 space-y-2">
                        <a href="<?= site_url('pass/activate-trial/' . $pass['id']); ?>" 
                           class="w-full text-center block <?= $is_popular ? 'bg-blue-600 hover:bg-blue-700 text-white' : 'bg-slate-900 hover:bg-slate-800 text-white'; ?> font-bold text-xs py-3 rounded-xl transition shadow-xs">
                            <i class="fa-solid fa-bolt mr-1"></i> Activate Now
                        </a>
                        <div class="text-[10px] text-center text-slate-400">
                            Instant access &bull; 100% money back guarantee
                        </div>
                    </div>

                </div>
            <?php endforeach; ?>
        </div>

        <!-- Trust Badges -->
        <div class="bg-white rounded-3xl p-8 border border-slate-200 shadow-xs grid grid-cols-2 md:grid-cols-4 gap-6 text-center">
            <div>
                <div class="w-12 h-12 rounded-2xl bg-blue-50 text-blue-600 flex items-center justify-center text-xl mx-auto mb-3">
                    <i class="fa-solid fa-shield-halved"></i>
                </div>
                <h4 class="font-bold text-xs text-slate-800">100% Official Papers</h4>
                <p class="text-[11px] text-slate-500 mt-1">Authentic questions from actual exam shifts</p>
            </div>

            <div>
                <div class="w-12 h-12 rounded-2xl bg-emerald-50 text-emerald-600 flex items-center justify-center text-xl mx-auto mb-3">
                    <i class="fa-solid fa-laptop-code"></i>
                </div>
                <h4 class="font-bold text-xs text-slate-800">Real CBT Interface</h4>
                <p class="text-[11px] text-slate-500 mt-1">Exact replica of TCS iON Exam Engine</p>
            </div>

            <div>
                <div class="w-12 h-12 rounded-2xl bg-amber-50 text-amber-600 flex items-center justify-center text-xl mx-auto mb-3">
                    <i class="fa-solid fa-square-root-variable"></i>
                </div>
                <h4 class="font-bold text-xs text-slate-800">KaTeX LaTeX Equations</h4>
                <p class="text-[11px] text-slate-500 mt-1">Crisp mathematical and reasoning equations</p>
            </div>

            <div>
                <div class="w-12 h-12 rounded-2xl bg-purple-50 text-purple-600 flex items-center justify-center text-xl mx-auto mb-3">
                    <i class="fa-solid fa-chart-line"></i>
                </div>
                <h4 class="font-bold text-xs text-slate-800">All India Rankings</h4>
                <p class="text-[11px] text-slate-500 mt-1">Accurate percentile benchmark across peers</p>
            </div>
        </div>

    </main>

    <!-- Footer -->
    <footer class="h-14 bg-white border-t border-slate-200 px-6 flex items-center justify-between text-xs text-slate-500">
        <span>&copy; <?= date('Y'); ?> <b>pyql.in</b> &bull; Testbook-Style Exam Preparation.</span>
        <a href="<?= site_url('test-series'); ?>" class="hover:text-blue-600 font-semibold">Browse Tests</a>
    </footer>
</body>
</html>
