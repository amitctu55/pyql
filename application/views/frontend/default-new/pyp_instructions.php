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
    <header class="h-16 bg-white border-b border-slate-200 px-6 flex items-center justify-between shadow-xs">
        <div class="flex items-center gap-3">
            <a href="<?= site_url('test-series'); ?>" class="font-black text-2xl tracking-tight text-blue-600">
                PYQL<span class="text-amber-500">.in</span>
            </a>
            <span class="text-xs bg-blue-50 text-blue-700 font-bold px-2.5 py-0.5 rounded-full border border-blue-200">
                CBT Exam Panel
            </span>
        </div>
        <div class="text-xs text-slate-500 font-medium">
            Candidate ID: <span class="font-bold text-slate-800">230910084</span>
        </div>
    </header>

    <!-- Main Instruction Body -->
    <main class="max-w-4xl mx-auto w-full px-4 py-8 flex-1">
        <div class="bg-white rounded-3xl p-8 border border-slate-200 shadow-sm space-y-6">
            
            <!-- Paper Header -->
            <div class="border-b border-slate-100 pb-5">
                <span class="text-xs font-bold text-blue-600 uppercase tracking-widest">General Guidelines & Instructions</span>
                <h1 class="text-2xl font-black text-slate-800 mt-1">
                    <?= htmlspecialchars($paper['title']); ?>
                </h1>
                <div class="flex flex-wrap gap-4 mt-3 text-xs text-slate-600">
                    <span class="flex items-center gap-1.5 bg-slate-100 px-3 py-1 rounded-lg">
                        <i class="fa-regular fa-clock text-blue-600"></i> Duration: <b><?= (int)$paper['duration_minutes']; ?> Minutes</b>
                    </span>
                    <span class="flex items-center gap-1.5 bg-slate-100 px-3 py-1 rounded-lg">
                        <i class="fa-solid fa-list-ol text-emerald-600"></i> Total Questions: <b><?= (int)$paper['total_questions']; ?></b>
                    </span>
                    <span class="flex items-center gap-1.5 bg-slate-100 px-3 py-1 rounded-lg">
                        <i class="fa-solid fa-award text-amber-500"></i> Total Marks: <b><?= (float)$paper['total_marks']; ?></b>
                    </span>
                    <span class="flex items-center gap-1.5 bg-emerald-50 text-emerald-700 px-3 py-1 rounded-lg border border-emerald-200">
                        Correct: <b>+<?= (float)$paper['positive_marks']; ?></b>
                    </span>
                    <span class="flex items-center gap-1.5 bg-rose-50 text-rose-700 px-3 py-1 rounded-lg border border-rose-200">
                        Negative: <b>-<?= (float)$paper['negative_marks']; ?></b>
                    </span>
                </div>
            </div>

            <!-- Sections Structure -->
            <div>
                <h3 class="font-bold text-sm text-slate-800 mb-3">Test Paper Sections Structure:</h3>
                <div class="grid grid-cols-2 sm:grid-cols-4 gap-3">
                    <?php foreach ($sections as $s): ?>
                        <div class="bg-slate-50 border border-slate-200 p-3.5 rounded-xl text-center">
                            <div class="font-bold text-xs text-slate-700"><?= htmlspecialchars($s['name']); ?></div>
                            <div class="text-[11px] text-blue-600 font-semibold mt-1">Order #<?= $s['order']; ?></div>
                        </div>
                    <?php endforeach; ?>
                </div>
            </div>

            <!-- Important Instructions -->
            <div class="space-y-3 text-xs text-slate-600 leading-relaxed bg-slate-50/70 p-5 rounded-2xl border border-slate-200">
                <h4 class="font-bold text-slate-800 text-sm">Please read the following instructions carefully:</h4>
                <ul class="list-disc pl-5 space-y-2">
                    <li>The clock will be set at the server. The countdown timer at the top right corner of the screen will display the remaining time available for you to complete the examination.</li>
                    <li>When the timer reaches zero, the examination will end automatically by default. You are not required to end or submit your examination manually before that time unless you wish to.</li>
                    <li>To select your answer, click on the button of one of the options. To deselect your chosen answer, click on the <b>"Clear Response"</b> button.</li>
                    <li>To save your answer, you MUST click on the <b>"Save & Next"</b> button.</li>
                    <li>To mark the question for review, click on the <b>"Mark for Review & Next"</b> button. If an answer is selected for a question that is Marked for Review, that answer will be evaluated in the final score.</li>
                    <li>You can toggle between <b>English</b> and <b>Hindi</b> language at any time during the test without losing answers.</li>
                </ul>
            </div>

            <!-- Candidate Agreement Checkbox -->
            <div class="pt-4 border-t border-slate-100 flex flex-col gap-4">
                <label class="flex items-start gap-3 cursor-pointer select-none">
                    <input type="checkbox" id="agreeCheck" onchange="toggleStartBtn(this)" class="mt-0.5 w-4 h-4 text-blue-600 rounded border-slate-300 focus:ring-blue-500 cursor-pointer">
                    <span class="text-xs text-slate-700 font-medium">
                        I have read and understood all instructions. All computer hardware allotted to me is in proper working condition. I agree not to use any unfair means during the exam.
                    </span>
                </label>

                <!-- Proceed Button -->
                <div class="flex justify-end gap-3 pt-2">
                    <a href="<?= site_url('test-series'); ?>" class="px-5 py-2.5 border border-slate-300 text-slate-700 hover:bg-slate-100 rounded-xl text-xs font-semibold transition">
                        Back to Portal
                    </a>
                    <a id="startExamBtn" href="<?= site_url('test-series/start/' . $paper['id']); ?>" class="px-8 py-2.5 bg-slate-300 text-slate-500 cursor-not-allowed rounded-xl text-xs font-bold transition shadow-xs pointer-events-none">
                        I Am Ready to Begin <i class="fa-solid fa-arrow-right ml-1"></i>
                    </a>
                </div>
            </div>

        </div>
    </main>

    <!-- Footer -->
    <footer class="h-12 bg-white border-t border-slate-200 px-6 flex items-center justify-between text-[11px] text-slate-400">
        <span>&copy; <?= date('Y'); ?> pyql.in. Testbook-style Previous Year Paper Exam Engine.</span>
        <span>All Rights Reserved.</span>
    </footer>

    <script>
        function toggleStartBtn(checkbox) {
            const btn = document.getElementById('startExamBtn');
            if (checkbox.checked) {
                btn.className = "px-8 py-2.5 bg-blue-600 hover:bg-blue-700 text-white cursor-pointer rounded-xl text-xs font-bold transition shadow-sm";
                btn.classList.remove('pointer-events-none');
            } else {
                btn.className = "px-8 py-2.5 bg-slate-300 text-slate-500 cursor-not-allowed rounded-xl text-xs font-bold transition shadow-xs pointer-events-none";
            }
        }
    </script>
</body>
</html>
