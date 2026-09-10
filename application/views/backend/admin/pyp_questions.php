<!-- KaTeX for math formula rendering in admin question bank -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/katex@0.16.8/dist/katex.min.css">
<script defer src="https://cdn.jsdelivr.net/npm/katex@0.16.8/dist/katex.min.js"></script>
<script defer src="https://cdn.jsdelivr.net/npm/katex@0.16.8/dist/contrib/auto-render.min.js"></script>

<div class="row">
    <div class="col-xl-12">
        <div class="card">
            <div class="card-body">
                <div class="d-flex justify-content-between align-items-center flex-wrap">
                    <div>
                        <h4 class="page-title mb-1">
                            <i class="mdi mdi-help-circle-outline title_icon"></i> 
                            <?php echo htmlspecialchars($paper['title']); ?>
                        </h4>
                        <p class="text-muted font-13 mb-0">
                            <?php echo count($questions); ?> <?php echo get_phrase('total_questions_configured'); ?> &bull; 
                            <?php echo $paper['duration_minutes']; ?> <?php echo get_phrase('minutes'); ?> &bull; 
                            <?php echo $paper['total_marks']; ?> <?php echo get_phrase('total_marks'); ?>
                        </p>
                    </div>

                    <div class="mt-2 mt-sm-0">
                        <a href="<?php echo site_url('admin/pyp_question_form/' . $paper['id'] . '/add'); ?>" class="btn btn-primary btn-rounded mr-1">
                            <i class="mdi mdi-plus"></i> <?php echo get_phrase('add_single_question'); ?>
                        </a>
                        <a href="<?php echo site_url('admin/pyp_import/' . $paper['id']); ?>" class="btn btn-success btn-rounded mr-1">
                            <i class="mdi mdi-upload"></i> <?php echo get_phrase('bulk_import'); ?>
                        </a>
                        <a href="<?php echo site_url('admin/pyp_papers'); ?>" class="btn btn-outline-secondary btn-rounded">
                            <i class="mdi mdi-arrow-left"></i> <?php echo get_phrase('papers'); ?>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Section Filter Tabs -->
<div class="row mb-3">
    <div class="col-xl-12">
        <div class="card mb-0">
            <div class="card-body py-2">
                <div class="d-flex align-items-center flex-wrap gap-2">
                    <span class="text-muted font-weight-bold mr-2 text-uppercase font-11"><?php echo get_phrase('filter_by_section'); ?>:</span>
                    <button type="button" class="btn btn-sm btn-primary mr-1" onclick="filterAdminSection('all', this)">
                        <?php echo get_phrase('all_sections'); ?> (<?php echo count($questions); ?>)
                    </button>
                    <?php foreach ($sections as $s): 
                        $sec_count = 0;
                        foreach ($questions as $q) { if ($q['section_id'] == $s['id']) $sec_count++; }
                    ?>
                        <button type="button" class="btn btn-sm btn-outline-secondary mr-1" onclick="filterAdminSection('<?php echo $s['id']; ?>', this)">
                            <?php echo htmlspecialchars($s['name']); ?> (<?php echo $sec_count; ?>)
                        </button>
                    <?php endforeach; ?>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Question Cards List -->
<div class="row">
    <div class="col-xl-12">
        <?php if (empty($questions)): ?>
            <div class="card">
                <div class="card-body text-center py-5">
                    <i class="mdi mdi-help-circle-outline text-muted" style="font-size: 48px;"></i>
                    <h4 class="mt-2 text-muted"><?php echo get_phrase('no_questions_added_yet'); ?></h4>
                    <p class="text-muted font-13 mb-3"><?php echo get_phrase('you_can_add_questions_one-by-one_or_bulk_import_via_excel/json'); ?></p>
                    <a href="<?php echo site_url('admin/pyp_question_form/' . $paper['id'] . '/add'); ?>" class="btn btn-primary btn-sm btn-rounded mr-2">
                        <i class="mdi mdi-plus"></i> <?php echo get_phrase('add_question'); ?>
                    </a>
                    <a href="<?php echo site_url('admin/pyp_import/' . $paper['id']); ?>" class="btn btn-success btn-sm btn-rounded">
                        <i class="mdi mdi-upload"></i> <?php echo get_phrase('bulk_import_questions'); ?>
                    </a>
                </div>
            </div>
        <?php else: ?>
            <div id="questionsContainer">
                <?php foreach ($questions as $index => $q): 
                    $options_en = json_decode($q['options_en'], true) ?: array();
                    $options_hi = json_decode($q['options_hi'], true) ?: array();
                ?>
                    <div class="card mb-3 question-row" data-section="<?php echo $q['section_id']; ?>">
                        <div class="card-body">
                            
                            <!-- Question Header -->
                            <div class="d-flex justify-content-between align-items-center pb-2 mb-3 border-bottom">
                                <div>
                                    <span class="badge badge-secondary mr-1 font-weight-bold">
                                        #<?php echo $index + 1; ?>
                                    </span>
                                    <span class="badge badge-info-lighten mr-1">
                                        <?php 
                                            $sec_obj = array_filter($sections, function($s) use ($q) { return $s['id'] == $q['section_id']; });
                                            $sec_name = !empty($sec_obj) ? reset($sec_obj)['name'] : $q['section_id'];
                                            echo htmlspecialchars($sec_name);
                                        ?>
                                    </span>
                                    <span class="badge badge-<?php echo ($q['difficulty'] == 'EASY') ? 'success' : (($q['difficulty'] == 'HARD') ? 'danger' : 'warning'); ?>-lighten mr-1">
                                        <?php echo $q['difficulty']; ?>
                                    </span>
                                    <small class="text-success font-weight-bold">+<?php echo (float)$q['positive_marks']; ?></small> / 
                                    <small class="text-danger font-weight-bold">-<?php echo (float)$q['negative_marks']; ?></small>
                                </div>

                                <div>
                                    <a href="<?php echo site_url('admin/pyp_question_form/' . $paper['id'] . '/edit/' . $q['id']); ?>" class="btn btn-sm btn-outline-info mr-1">
                                        <i class="mdi mdi-pencil"></i> <?php echo get_phrase('edit'); ?>
                                    </a>
                                    <a href="javascript:;" onclick="confirm_modal('<?php echo site_url('admin/pyp_questions/' . $paper['id'] . '/delete/' . $q['id']); ?>');" class="btn btn-sm btn-outline-danger">
                                        <i class="mdi mdi-delete"></i> <?php echo get_phrase('delete'); ?>
                                    </a>
                                </div>
                            </div>

                            <!-- Question Content (Bilingual) -->
                            <div class="row">
                                <div class="col-md-6 border-right">
                                    <strong class="text-primary d-block mb-1 font-12 text-uppercase">English Question:</strong>
                                    <div class="text-dark font-14 mb-3 render-katex">
                                        <?php echo $q['question_en']; ?>
                                    </div>

                                    <!-- Options English -->
                                    <div class="list-group">
                                        <?php foreach ($options_en as $opt_idx => $opt): 
                                            $is_correct = ($opt['id'] == $q['correct_options']);
                                        ?>
                                            <div class="list-group-item list-group-item-action py-1 px-2 font-13 d-flex justify-content-between align-items-center <?php if ($is_correct) echo 'list-group-item-success font-weight-bold'; ?>">
                                                <span>
                                                    <b><?php echo chr(65 + $opt_idx); ?>.</b> 
                                                    <span class="render-katex"><?php echo $opt['text']; ?></span>
                                                </span>
                                                <?php if ($is_correct): ?>
                                                    <span class="badge badge-success"><?php echo get_phrase('correct'); ?></span>
                                                <?php endif; ?>
                                            </div>
                                        <?php endforeach; ?>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <strong class="text-primary d-block mb-1 font-12 text-uppercase">हिंदी प्रश्न (Hindi Question):</strong>
                                    <div class="text-dark font-14 mb-3 render-katex">
                                        <?php echo !empty($q['question_hi']) ? $q['question_hi'] : '<em class="text-muted">Same as English</em>'; ?>
                                    </div>

                                    <!-- Options Hindi -->
                                    <div class="list-group">
                                        <?php foreach ($options_hi as $opt_idx => $opt): 
                                            $is_correct = ($opt['id'] == $q['correct_options']);
                                        ?>
                                            <div class="list-group-item list-group-item-action py-1 px-2 font-13 d-flex justify-content-between align-items-center <?php if ($is_correct) echo 'list-group-item-success font-weight-bold'; ?>">
                                                <span>
                                                    <b><?php echo chr(65 + $opt_idx); ?>.</b> 
                                                    <span class="render-katex"><?php echo $opt['text']; ?></span>
                                                </span>
                                                <?php if ($is_correct): ?>
                                                    <span class="badge badge-success"><?php echo get_phrase('correct'); ?></span>
                                                <?php endif; ?>
                                            </div>
                                        <?php endforeach; ?>
                                    </div>
                                </div>
                            </div>

                            <!-- Detailed Solution Box -->
                            <?php if (!empty($q['solution_en']) || !empty($q['solution_hi'])): ?>
                                <div class="mt-3 p-3 bg-light rounded border">
                                    <strong class="text-secondary font-12 text-uppercase d-block mb-1">
                                        <i class="mdi mdi-lightbulb-on-outline text-warning"></i> <?php echo get_phrase('step-by-step_solution'); ?>:
                                    </strong>
                                    <div class="font-13 text-muted render-katex">
                                        <?php echo $q['solution_en']; ?>
                                    </div>
                                </div>
                            <?php endif; ?>

                        </div>
                    </div>
                <?php endforeach; ?>
            </div>
        <?php endif; ?>
    </div>
</div>

<script>
    document.addEventListener('DOMContentLoaded', () => {
        if (typeof renderMathInElement === 'function') {
            renderMathInElement(document.body, {
                delimiters: [
                    { left: '$$', right: '$$', display: true },
                    { left: '$', right: '$', display: false }
                ],
                throwOnError: false
            });
        }
    });

    function filterAdminSection(secId, btn) {
        document.querySelectorAll('.question-row').forEach(row => {
            if (secId === 'all') {
                row.style.display = '';
            } else {
                row.style.display = (row.getAttribute('data-section') === secId) ? '' : 'none';
            }
        });
        btn.parentElement.querySelectorAll('.btn').forEach(b => {
            b.className = 'btn btn-sm btn-outline-secondary mr-1';
        });
        btn.className = 'btn btn-sm btn-primary mr-1';
    }
</script>
