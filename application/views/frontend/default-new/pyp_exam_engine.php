<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?= htmlspecialchars($page_title); ?></title>
    <!-- Tailwind CSS -->
    <script src="https://cdn.tailwindcss.com"></script>
    <script>
        tailwind.config = {
            theme: {
                extend: {
                    colors: {
                        brand: { 50: '#f0f7ff', 500: '#0066cc', 600: '#0052a3', 700: '#003d7a' },
                        ans: '#22c55e',
                        unans: '#ef4444',
                        review: '#6366f1',
                        notvisit: '#e2e8f0'
                    }
                }
            }
        }
    </script>
    <!-- FontAwesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <!-- KaTeX for high-speed LaTeX Formulae Rendering -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/katex@0.16.8/dist/katex.min.css">
    <script defer src="https://cdn.jsdelivr.net/npm/katex@0.16.8/dist/katex.min.js"></script>
    <script defer src="https://cdn.jsdelivr.net/npm/katex@0.16.8/dist/contrib/auto-render.min.js"></script>
    <style>
        .custom-scrollbar::-webkit-scrollbar { width: 5px; height: 5px; }
        .custom-scrollbar::-webkit-scrollbar-track { background: #f1f5f9; }
        .custom-scrollbar::-webkit-scrollbar-thumb { background: #cbd5e1; border-radius: 4px; }
        
        /* Testbook Authentic Palette Shape Badges */
        .badge-answered {
            background-color: #16a34a !important;
            color: #fff !important;
            border-top-left-radius: 6px;
            border-top-right-radius: 6px;
            border-bottom-left-radius: 0px;
            border-bottom-right-radius: 0px;
        }
        .badge-unanswered {
            background-color: #ef4444 !important;
            color: #fff !important;
            border-top-left-radius: 0px;
            border-top-right-radius: 0px;
            border-bottom-left-radius: 6px;
            border-bottom-right-radius: 6px;
        }
        .badge-not-visited {
            background-color: #f1f5f9 !important;
            color: #475569 !important;
            border: 1px solid #cbd5e1;
            border-radius: 4px;
        }
        .badge-review {
            background-color: #6366f1 !important;
            color: #fff !important;
            border-radius: 9999px !important;
        }
        .badge-ans-review {
            background-color: #6366f1 !important;
            color: #fff !important;
            border-radius: 9999px !important;
            position: relative;
        }
        .badge-ans-review::after {
            content: '✓';
            position: absolute;
            bottom: -2px;
            right: -2px;
            background: #22c55e;
            color: #fff;
            font-size: 8px;
            width: 12px;
            height: 12px;
            border-radius: 9999px;
            display: flex;
            align-items: center;
            justify-content: center;
            border: 1px solid #fff;
        }
    </style>
</head>
<body class="h-screen w-screen overflow-hidden bg-slate-100 flex flex-col font-sans select-none">

    <!-- 1. EXAM TOP HEADER -->
    <header class="h-14 bg-white border-b border-slate-200 px-6 flex items-center justify-between shadow-xs z-20 shrink-0">
        <div class="flex items-center gap-4">
            <div class="flex items-center gap-1.5">
                <span class="font-black text-xl tracking-tight text-blue-600">PYQL<span class="text-amber-500">.in</span></span>
                <span class="bg-blue-100 text-blue-800 text-[10px] font-extrabold uppercase px-1.5 py-0.5 rounded tracking-wide">CBT Live</span>
            </div>
            <div class="h-5 w-[1px] bg-slate-200"></div>
            <h1 class="font-semibold text-slate-800 text-sm hidden md:block max-w-lg truncate" title="<?= htmlspecialchars($attempt['paper_title']); ?>">
                <?= htmlspecialchars($attempt['paper_title']); ?>
            </h1>
        </div>

        <div class="flex items-center gap-4">
            <!-- Language Switcher -->
            <div class="flex items-center gap-1.5 text-xs bg-slate-100 px-3 py-1.5 rounded-lg border border-slate-200 font-medium text-slate-600">
                <span>Language:</span>
                <select id="langSelect" onchange="switchLanguage(this.value)" class="bg-transparent font-bold text-blue-600 outline-none cursor-pointer">
                    <option value="en" selected>English</option>
                    <option value="hi">हिंदी (Hindi)</option>
                </select>
            </div>

            <!-- Countdown Timer Clock -->
            <div class="flex items-center gap-2 font-mono text-sm bg-slate-900 text-amber-400 px-4 py-1.5 rounded-lg shadow-inner">
                <i class="fa-regular fa-clock animate-pulse text-amber-400"></i>
                <span id="countdownTimer" class="font-bold tracking-wider">00:00:00</span>
            </div>

            <!-- Submit Test Button -->
            <button onclick="confirmSubmitExam()" class="bg-blue-600 hover:bg-blue-700 active:bg-blue-800 text-white font-semibold text-xs px-4 py-2 rounded-lg transition shadow-sm">
                Submit Test
            </button>
        </div>
    </header>

    <!-- 2. SECTION TABS BAR -->
    <nav class="h-11 bg-white border-b border-slate-200 px-6 flex items-center gap-2 overflow-x-auto shrink-0 shadow-xs">
        <span class="text-[11px] font-bold uppercase tracking-wider text-slate-400 mr-2">Sections:</span>
        <?php foreach ($sections as $index => $sec): ?>
            <button id="sec-tab-<?= $sec['id']; ?>" 
                    onclick="switchSection('<?= $sec['id']; ?>')" 
                    class="section-tab text-xs font-semibold px-4 py-1.5 rounded-md transition-all whitespace-nowrap <?= ($index === 0) ? 'bg-blue-50 text-blue-600 border border-blue-200 shadow-xs' : 'text-slate-600 hover:bg-slate-100'; ?>">
                <?= htmlspecialchars($sec['name']); ?>
            </button>
        <?php endforeach; ?>
    </nav>

    <!-- 3. MAIN CBT WORKSPACE (SPLIT VIEW) -->
    <div class="flex-1 flex overflow-hidden">
        
        <!-- LEFT: QUESTION WORKSPACE -->
        <main class="flex-1 flex flex-col justify-between bg-white overflow-hidden border-r border-slate-200">
            
            <!-- Question Content Box (Scrollable) -->
            <div id="questionContainer" class="flex-1 p-8 overflow-y-auto custom-scrollbar">
                <!-- Question Top Header -->
                <div class="flex items-center justify-between pb-4 mb-6 border-b border-slate-100 text-xs">
                    <span class="font-bold text-slate-500 text-sm">
                        Question No. <span id="displayQuestionNumber">1</span>
                    </span>
                    <div class="flex items-center gap-3">
                        <span id="displayPositiveMarks" class="text-emerald-700 font-semibold bg-emerald-50 border border-emerald-200 px-2.5 py-1 rounded-full">
                            +2.00 Marks
                        </span>
                        <span id="displayNegativeMarks" class="text-rose-600 font-semibold bg-rose-50 border border-rose-200 px-2.5 py-1 rounded-full">
                            -0.50 Negative
                        </span>
                    </div>
                </div>

                <!-- Question Text -->
                <div id="questionText" class="text-base text-slate-800 leading-relaxed font-normal mb-8 render-latex">
                    <!-- Injected dynamically -->
                </div>

                <!-- Options List -->
                <div id="optionsList" class="space-y-3.5 max-w-3xl">
                    <!-- Injected dynamically -->
                </div>
            </div>

            <!-- Bottom Action Controls -->
            <footer class="h-16 border-t border-slate-200 px-8 flex items-center justify-between bg-slate-50 shrink-0">
                <div class="flex gap-3">
                    <button onclick="markForReviewAndNext()" class="px-4 py-2 border border-indigo-200 text-indigo-700 bg-indigo-50/50 hover:bg-indigo-100 active:bg-indigo-200 rounded-lg text-xs font-semibold transition">
                        <i class="fa-regular fa-bookmark mr-1.5"></i> Mark for Review & Next
                    </button>
                    <button onclick="clearResponse()" class="px-4 py-2 border border-slate-300 text-slate-600 hover:bg-slate-200/70 active:bg-slate-300 rounded-lg text-xs font-semibold transition">
                        <i class="fa-solid fa-eraser mr-1.5"></i> Clear Response
                    </button>
                </div>

                <div class="flex gap-3">
                    <button onclick="navigatePrevious()" class="px-4 py-2 border border-slate-300 text-slate-700 hover:bg-slate-100 rounded-lg text-xs font-semibold transition">
                        <i class="fa-solid fa-chevron-left mr-1"></i> Previous
                    </button>
                    <button onclick="saveAndNext()" class="px-6 py-2 bg-emerald-600 hover:bg-emerald-700 active:bg-emerald-800 text-white rounded-lg text-xs font-bold tracking-wide shadow-sm transition">
                        Save & Next <i class="fa-solid fa-chevron-right ml-1"></i>
                    </button>
                </div>
            </footer>
        </main>

        <!-- RIGHT: TESTBOOK QUESTION PALETTE SIDEBAR -->
        <aside class="w-80 bg-white flex flex-col justify-between hidden lg:flex shrink-0">
            <div class="p-5 overflow-y-auto custom-scrollbar flex-1">
                
                <!-- Candidate Quick Info -->
                <div class="flex items-center gap-3 pb-4 mb-4 border-b border-slate-100">
                    <div class="w-10 h-10 rounded-full bg-blue-100 text-blue-600 flex items-center justify-center font-bold text-sm">
                        <i class="fa-regular fa-user"></i>
                    </div>
                    <div>
                        <div class="font-bold text-xs text-slate-800">Candidate Mode</div>
                        <div class="text-[11px] text-slate-500">Roll No: 230910084</div>
                    </div>
                </div>

                <!-- Testbook 5-State Legend Badges -->
                <h3 class="text-[11px] font-bold uppercase tracking-wider text-slate-400 mb-3">Palette Legend</h3>
                <div class="grid grid-cols-2 gap-2 text-[11px] font-medium text-slate-600 mb-6 bg-slate-50 p-3 rounded-xl border border-slate-200">
                    <div class="flex items-center gap-2">
                        <span id="statAnswered" class="w-5 h-5 flex items-center justify-center font-bold text-[10px] badge-answered shadow-xs">0</span>
                        <span>Answered</span>
                    </div>
                    <div class="flex items-center gap-2">
                        <span id="statUnanswered" class="w-5 h-5 flex items-center justify-center font-bold text-[10px] badge-unanswered shadow-xs">0</span>
                        <span>Not Answered</span>
                    </div>
                    <div class="flex items-center gap-2">
                        <span id="statNotVisited" class="w-5 h-5 flex items-center justify-center font-bold text-[10px] badge-not-visited">0</span>
                        <span>Not Visited</span>
                    </div>
                    <div class="flex items-center gap-2">
                        <span id="statReview" class="w-5 h-5 flex items-center justify-center font-bold text-[10px] badge-review shadow-xs">0</span>
                        <span>Review</span>
                    </div>
                    <div class="flex items-center gap-2 col-span-2 pt-2 border-t border-slate-200">
                        <span id="statAnsReview" class="w-5 h-5 flex items-center justify-center font-bold text-[10px] badge-ans-review shadow-xs">0</span>
                        <span>Ans & Marked for Review</span>
                    </div>
                </div>

                <!-- Current Section Palette Question Grid -->
                <div class="flex items-center justify-between mb-3">
                    <h3 class="text-[11px] font-bold uppercase tracking-wider text-slate-500" id="currentSectionTitle">
                        Questions Grid
                    </h3>
                    <span id="currentSectionCount" class="text-[11px] font-bold text-blue-600 bg-blue-50 px-2 py-0.5 rounded">0 Questions</span>
                </div>

                <div id="paletteGrid" class="grid grid-cols-5 gap-2.5">
                    <!-- Injected dynamically -->
                </div>
            </div>

            <!-- Submit Button Drawer -->
            <div class="p-4 border-t border-slate-200 bg-slate-50">
                <button onclick="confirmSubmitExam()" class="w-full py-2.5 bg-blue-600 hover:bg-blue-700 active:bg-blue-800 text-white rounded-lg text-xs font-bold tracking-wide transition shadow-sm">
                    Submit Paper
                </button>
            </div>
        </aside>
    </div>

    <!-- SUBMIT CONFIRMATION MODAL -->
    <div id="submitModal" class="fixed inset-0 bg-slate-900/60 backdrop-blur-xs flex items-center justify-center hidden z-50 p-4">
        <div class="bg-white rounded-2xl max-w-md w-full p-6 shadow-2xl border border-slate-200 animate-in fade-in zoom-in duration-150">
            <div class="w-12 h-12 bg-amber-100 text-amber-600 rounded-full flex items-center justify-center text-xl mb-4 mx-auto">
                <i class="fa-solid fa-triangle-exclamation"></i>
            </div>
            <h3 class="text-lg font-bold text-slate-800 text-center mb-1">Submit Exam Paper?</h3>
            <p class="text-xs text-slate-500 text-center mb-6">
                Are you sure you want to finish the test? Once submitted, you cannot change your answers.
            </p>

            <!-- Quick Summary Table inside Modal -->
            <div class="bg-slate-50 rounded-xl p-4 mb-6 border border-slate-200 text-xs space-y-2">
                <div class="flex justify-between font-medium text-slate-600">
                    <span>Total Questions:</span>
                    <span id="modalTotalQ" class="font-bold text-slate-800">0</span>
                </div>
                <div class="flex justify-between font-medium text-emerald-700">
                    <span>Answered:</span>
                    <span id="modalAnsweredQ" class="font-bold">0</span>
                </div>
                <div class="flex justify-between font-medium text-rose-600">
                    <span>Unanswered:</span>
                    <span id="modalUnansweredQ" class="font-bold">0</span>
                </div>
                <div class="flex justify-between font-medium text-indigo-600">
                    <span>Marked for Review:</span>
                    <span id="modalReviewQ" class="font-bold">0</span>
                </div>
            </div>

            <div class="flex gap-3">
                <button onclick="closeSubmitModal()" class="flex-1 py-2.5 border border-slate-300 text-slate-700 hover:bg-slate-100 rounded-lg text-xs font-semibold transition">
                    Cancel & Return
                </button>
                <button id="modalConfirmBtn" onclick="executeFinalSubmit()" class="flex-1 py-2.5 bg-blue-600 hover:bg-blue-700 text-white rounded-lg text-xs font-bold transition shadow-sm">
                    Yes, Submit Now
                </button>
            </div>
        </div>
    </div>

    <!-- CLIENT SCRIPT: REAL-TIME CBT EXAM ENGINE -->
    <script>
        const ATTEMPT_ID = <?= (int)$attempt['id']; ?>;
        const REMAINING_SECONDS = <?= (int)$remaining_seconds; ?>;
        const SECTIONS = <?= json_encode($sections); ?>;
        const QUESTIONS = <?= json_encode($questions); ?>;
        const SAVE_URL = '<?= site_url("test-series/save-response"); ?>';
        const SUBMIT_URL = '<?= site_url("test-series/submit-exam"); ?>';

        // Engine State
        let currentLang = 'en';
        let currentSectionId = SECTIONS[0]?.id || '';
        let currentQuestionIndex = 0; // index within current section
        let timeLeft = REMAINING_SECONDS;
        let timerInterval = null;

        // Question Map: questionId -> Question Object
        const questionsMap = {};
        QUESTIONS.forEach(q => {
            questionsMap[q.id] = q;
        });

        // Current section's questions array
        function getSectionQuestions(secId) {
            return QUESTIONS.filter(q => q.section_id === secId);
        }

        // Initialize Exam Engine
        document.addEventListener('DOMContentLoaded', () => {
            renderSectionTabs();
            loadQuestion(0);
            renderPalette();
            startTimer();
            renderKaTeX();
        });

        // 1. Timer Logic
        function startTimer() {
            updateTimerDisplay();
            timerInterval = setInterval(() => {
                if (timeLeft <= 1) {
                    clearInterval(timerInterval);
                    executeFinalSubmit();
                    return;
                }
                timeLeft--;
                updateTimerDisplay();

                // Increment time spent on current question
                const secQuestions = getSectionQuestions(currentSectionId);
                const curQ = secQuestions[currentQuestionIndex];
                if (curQ) {
                    curQ.time_spent_seconds = (parseInt(curQ.time_spent_seconds) || 0) + 1;
                }
            }, 1000);
        }

        function updateTimerDisplay() {
            const hrs = Math.floor(timeLeft / 3600);
            const mins = Math.floor((timeLeft % 3600) / 60);
            const secs = timeLeft % 60;
            const str = [hrs, mins, secs].map(v => v.toString().padStart(2, '0')).join(':');
            const el = document.getElementById('countdownTimer');
            if (el) el.innerText = str;
        }

        // 2. Language Switcher
        function switchLanguage(lang) {
            currentLang = lang;
            loadQuestion(currentQuestionIndex, false);
        }

        // 3. Section Switcher
        function switchSection(secId) {
            currentSectionId = secId;
            currentQuestionIndex = 0;
            renderSectionTabs();
            loadQuestion(0);
            renderPalette();
        }

        function renderSectionTabs() {
            SECTIONS.forEach(sec => {
                const btn = document.getElementById(`sec-tab-${sec.id}`);
                if (!btn) return;
                if (sec.id === currentSectionId) {
                    btn.className = "section-tab text-xs font-semibold px-4 py-1.5 rounded-md transition-all whitespace-nowrap bg-blue-50 text-blue-600 border border-blue-200 shadow-xs";
                } else {
                    btn.className = "section-tab text-xs font-semibold px-4 py-1.5 rounded-md transition-all whitespace-nowrap text-slate-600 hover:bg-slate-100";
                }
            });
            const curSec = SECTIONS.find(s => s.id === currentSectionId);
            if (curSec) {
                document.getElementById('currentSectionTitle').innerText = curSec.name;
            }
        }

        // 4. Load Question
        function loadQuestion(index, markVisited = true) {
            const secQuestions = getSectionQuestions(currentSectionId);
            if (index < 0 || index >= secQuestions.length) return;

            currentQuestionIndex = index;
            const q = secQuestions[index];

            // If not visited yet, mark as unanswered
            if (markVisited && q.response_status === 'NOT_VISITED') {
                q.response_status = 'UNANSWERED';
                asyncSave(q.id, q.selected_options, 'UNANSWERED', q.time_spent_seconds);
            }

            // Update UI elements
            document.getElementById('displayQuestionNumber').innerText = `${index + 1} of ${secQuestions.length}`;
            document.getElementById('displayPositiveMarks').innerText = `+${parseFloat(q.positive_marks).toFixed(2)} Marks`;
            document.getElementById('displayNegativeMarks').innerText = `-${parseFloat(q.negative_marks).toFixed(2)} Negative`;

            // Question Text
            const qText = (currentLang === 'hi' && q.question_hi) ? q.question_hi : q.question_en;
            document.getElementById('questionText').innerHTML = qText;

            // Options List
            const options = (currentLang === 'hi' && q.options_hi && q.options_hi.length > 0) ? q.options_hi : q.options_en;
            let optionsHtml = '';
            options.forEach((opt, idx) => {
                const isSelected = (q.selected_options || []).includes(opt.id);
                const optLetter = String.fromCharCode(65 + idx);

                optionsHtml += `
                    <label onclick="selectOption('${q.id}', '${opt.id}')" 
                           class="flex items-start gap-4 p-4 rounded-xl border cursor-pointer transition-all ${
                               isSelected
                               ? 'border-blue-600 bg-blue-50/60 shadow-xs ring-1 ring-blue-600'
                               : 'border-slate-200 hover:border-slate-300 hover:bg-slate-50'
                           }">
                        <div class="w-6 h-6 rounded-full shrink-0 mt-0.5 flex items-center justify-center border font-bold text-xs transition-all ${
                            isSelected
                            ? 'border-blue-600 bg-blue-600 text-white shadow-xs'
                            : 'border-slate-300 bg-white text-slate-600'
                        }">
                            ${isSelected ? '✓' : optLetter}
                        </div>
                        <div class="text-sm font-medium text-slate-700 select-none pt-0.5 render-latex">
                            ${opt.text}
                        </div>
                    </label>
                `;
            });
            document.getElementById('optionsList').innerHTML = optionsHtml;

            renderPalette();
            renderKaTeX();
        }

        // 5. Select Option
        function selectOption(questionId, optId) {
            const q = questionsMap[questionId];
            if (!q) return;

            q.selected_options = [optId]; // Single choice radio
            loadQuestion(currentQuestionIndex, false);
        }

        // 6. Action: Clear Response
        function clearResponse() {
            const secQuestions = getSectionQuestions(currentSectionId);
            const q = secQuestions[currentQuestionIndex];
            if (!q) return;

            q.selected_options = [];
            q.response_status = 'UNANSWERED';
            asyncSave(q.id, [], 'UNANSWERED', q.time_spent_seconds);
            loadQuestion(currentQuestionIndex, false);
        }

        // 7. Action: Save & Next
        function saveAndNext() {
            const secQuestions = getSectionQuestions(currentSectionId);
            const q = secQuestions[currentQuestionIndex];
            if (!q) return;

            const isAnswered = q.selected_options && q.selected_options.length > 0;
            const newStatus = isAnswered ? 'ANSWERED' : 'UNANSWERED';
            q.response_status = newStatus;

            asyncSave(q.id, q.selected_options, newStatus, q.time_spent_seconds);

            if (currentQuestionIndex < secQuestions.length - 1) {
                loadQuestion(currentQuestionIndex + 1);
            } else {
                // Move to next section if available
                const curSecIdx = SECTIONS.findIndex(s => s.id === currentSectionId);
                if (curSecIdx < SECTIONS.length - 1) {
                    switchSection(SECTIONS[curSecIdx + 1].id);
                }
            }
        }

        // 8. Action: Mark for Review & Next
        function markForReviewAndNext() {
            const secQuestions = getSectionQuestions(currentSectionId);
            const q = secQuestions[currentQuestionIndex];
            if (!q) return;

            const isAnswered = q.selected_options && q.selected_options.length > 0;
            const newStatus = isAnswered ? 'ANSWERED_AND_MARKED' : 'MARKED_FOR_REVIEW';
            q.response_status = newStatus;

            asyncSave(q.id, q.selected_options, newStatus, q.time_spent_seconds);

            if (currentQuestionIndex < secQuestions.length - 1) {
                loadQuestion(currentQuestionIndex + 1);
            } else {
                const curSecIdx = SECTIONS.findIndex(s => s.id === currentSectionId);
                if (curSecIdx < SECTIONS.length - 1) {
                    switchSection(SECTIONS[curSecIdx + 1].id);
                }
            }
        }

        // 9. Previous Button
        function navigatePrevious() {
            if (currentQuestionIndex > 0) {
                loadQuestion(currentQuestionIndex - 1);
            }
        }

        // 10. Render Question Palette
        function renderPalette() {
            const secQuestions = getSectionQuestions(currentSectionId);
            document.getElementById('currentSectionCount').innerText = `${secQuestions.length} Questions`;

            let answered = 0, unans = 0, notVisit = 0, review = 0, ansReview = 0;

            QUESTIONS.forEach(q => {
                const st = q.response_status || 'NOT_VISITED';
                if (st === 'ANSWERED') answered++;
                else if (st === 'UNANSWERED') unans++;
                else if (st === 'MARKED_FOR_REVIEW') review++;
                else if (st === 'ANSWERED_AND_MARKED') ansReview++;
                else notVisit++;
            });

            document.getElementById('statAnswered').innerText = answered;
            document.getElementById('statUnanswered').innerText = unans;
            document.getElementById('statNotVisited').innerText = notVisit;
            document.getElementById('statReview').innerText = review;
            document.getElementById('statAnsReview').innerText = ansReview;

            // Render buttons for current section
            let gridHtml = '';
            secQuestions.forEach((q, idx) => {
                const st = q.response_status || 'NOT_VISITED';
                const isCurrent = (idx === currentQuestionIndex);

                let badgeClass = 'badge-not-visited';
                if (st === 'ANSWERED') badgeClass = 'badge-answered';
                else if (st === 'UNANSWERED') badgeClass = 'badge-unanswered';
                else if (st === 'MARKED_FOR_REVIEW') badgeClass = 'badge-review';
                else if (st === 'ANSWERED_AND_MARKED') badgeClass = 'badge-ans-review';

                const ringClass = isCurrent ? 'ring-2 ring-blue-500 ring-offset-2 scale-105' : '';

                gridHtml += `
                    <button onclick="loadQuestion(${idx})" 
                            class="h-9 w-full flex items-center justify-center text-xs font-bold transition-all shadow-xs ${badgeClass} ${ringClass}">
                        ${idx + 1}
                    </button>
                `;
            });
            document.getElementById('paletteGrid').innerHTML = gridHtml;
        }

        // 11. Async Save AJAX API
        function asyncSave(questionId, selectedOptions, status, timeSpent) {
            const formData = new FormData();
            formData.append('attempt_id', ATTEMPT_ID);
            formData.append('question_id', questionId);
            formData.append('selected_options', JSON.stringify(selectedOptions || []));
            formData.append('status', status);
            formData.append('time_spent', timeSpent || 0);

            fetch(SAVE_URL, {
                method: 'POST',
                body: formData
            }).catch(err => console.error('Save error:', err));
        }

        // 12. Submit Flow & Modal
        function confirmSubmitExam() {
            let total = QUESTIONS.length;
            let ans = 0, unans = 0, rev = 0;
            QUESTIONS.forEach(q => {
                const st = q.response_status || 'NOT_VISITED';
                if (st === 'ANSWERED' || st === 'ANSWERED_AND_MARKED') ans++;
                else if (st === 'MARKED_FOR_REVIEW') rev++;
                else unans++;
            });

            document.getElementById('modalTotalQ').innerText = total;
            document.getElementById('modalAnsweredQ').innerText = ans;
            document.getElementById('modalUnansweredQ').innerText = unans;
            document.getElementById('modalReviewQ').innerText = rev;

            document.getElementById('submitModal').classList.remove('hidden');
        }

        function closeSubmitModal() {
            document.getElementById('submitModal').classList.add('hidden');
        }

        function executeFinalSubmit() {
            const btn = document.getElementById('modalConfirmBtn');
            if (btn) {
                btn.disabled = true;
                btn.innerHTML = `<i class="fa-solid fa-spinner fa-spin mr-1.5"></i> Evaluating...`;
            }

            const formData = new FormData();
            formData.append('attempt_id', ATTEMPT_ID);

            fetch(SUBMIT_URL, {
                method: 'POST',
                body: formData
            })
            .then(res => res.json())
            .then(data => {
                if (data.success && data.redirect_url) {
                    window.location.href = data.redirect_url;
                } else {
                    alert('Submission error: ' + (data.message || 'Please try again'));
                    if (btn) btn.disabled = false;
                }
            })
            .catch(err => {
                console.error(err);
                alert('Submission failed, please check connection.');
                if (btn) btn.disabled = false;
            });
        }

        // 13. KaTeX LaTeX Formula Rendering Engine
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
