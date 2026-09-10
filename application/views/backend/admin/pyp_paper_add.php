<?php 
    $is_edit = ($type == 'edit' && isset($paper));
    $action_url = $is_edit ? site_url('admin/pyp_papers/edit/' . $paper['id']) : site_url('admin/pyp_papers/add');
    $sections = $is_edit ? (json_decode($paper['sections_json'], true) ?: array()) : array();
?>

<div class="row">
    <div class="col-xl-12">
        <div class="card">
            <div class="card-body">
                <h4 class="page-title">
                    <i class="mdi mdi-file-document-box-plus-outline title_icon"></i> 
                    <?php echo $is_edit ? get_phrase('edit_test_paper') : get_phrase('create_new_test_paper'); ?>
                    <a href="<?php echo site_url('admin/pyp_papers'); ?>" class="btn btn-outline-secondary btn-rounded alignToTitle">
                        <i class="mdi mdi-arrow-left"></i> <?php echo get_phrase('back_to_papers'); ?>
                    </a>
                </h4>
            </div>
        </div>
    </div>
</div>

<div class="row">
    <div class="col-xl-9 col-lg-10 mx-auto">
        <div class="card">
            <div class="card-body">
                <h4 class="header-title mb-3"><?php echo get_phrase('paper_basic_information'); ?></h4>

                <form action="<?php echo $action_url; ?>" method="post">
                    
                    <div class="row">
                        <div class="col-md-6 form-group">
                            <label for="exam_id"><?php echo get_phrase('target_exam'); ?> <span class="text-danger">*</span></label>
                            <select name="exam_id" id="exam_id" class="form-control select2" required>
                                <option value=""><?php echo get_phrase('select_exam'); ?></option>
                                <?php foreach ($exams as $ex): ?>
                                    <option value="<?php echo $ex['id']; ?>" <?php if ($is_edit && $paper['exam_id'] == $ex['id']) echo 'selected'; ?>>
                                        <?php echo htmlspecialchars($ex['title']); ?>
                                    </option>
                                <?php endforeach; ?>
                            </select>
                        </div>

                        <div class="col-md-6 form-group">
                            <label for="paper_type"><?php echo get_phrase('paper_type'); ?></label>
                            <select name="paper_type" id="paper_type" class="form-control">
                                <option value="PREVIOUS_YEAR" <?php if ($is_edit && $paper['paper_type'] == 'PREVIOUS_YEAR') echo 'selected'; ?>>
                                    <?php echo get_phrase('previous_year_official_paper'); ?>
                                </option>
                                <option value="MOCK_TEST" <?php if ($is_edit && $paper['paper_type'] == 'MOCK_TEST') echo 'selected'; ?>>
                                    <?php echo get_phrase('full_length_mock_test'); ?>
                                </option>
                                <option value="SECTIONAL" <?php if ($is_edit && $paper['paper_type'] == 'SECTIONAL') echo 'selected'; ?>>
                                    <?php echo get_phrase('sectional_test'); ?>
                                </option>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="title"><?php echo get_phrase('paper_title'); ?> <span class="text-danger">*</span></label>
                        <input type="text" name="title" id="title" class="form-control" required
                               placeholder="e.g. SSC CGL Tier-1 2023 Official Paper (14 July Shift 1)"
                               value="<?php echo $is_edit ? htmlspecialchars($paper['title']) : ''; ?>">
                    </div>

                    <div class="row">
                        <div class="col-md-4 form-group">
                            <label for="year"><?php echo get_phrase('exam_year'); ?></label>
                            <input type="number" name="year" id="year" class="form-control"
                                   value="<?php echo $is_edit ? $paper['year'] : date('Y'); ?>">
                        </div>
                        <div class="col-md-8 form-group">
                            <label for="shift"><?php echo get_phrase('shift_/_timing'); ?></label>
                            <input type="text" name="shift" id="shift" class="form-control"
                                   placeholder="e.g. Shift 1 (9:00 AM - 10:00 AM)"
                                   value="<?php echo $is_edit ? htmlspecialchars($paper['shift']) : 'Shift 1'; ?>">
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-3 form-group">
                            <label for="duration_minutes"><?php echo get_phrase('duration_(minutes)'); ?> <span class="text-danger">*</span></label>
                            <input type="number" name="duration_minutes" id="duration_minutes" class="form-control" required
                                   value="<?php echo $is_edit ? $paper['duration_minutes'] : 60; ?>">
                        </div>
                        <div class="col-md-3 form-group">
                            <label for="total_marks"><?php echo get_phrase('total_marks'); ?></label>
                            <input type="number" step="0.5" name="total_marks" id="total_marks" class="form-control"
                                   value="<?php echo $is_edit ? $paper['total_marks'] : 200.00; ?>">
                        </div>
                        <div class="col-md-3 form-group">
                            <label for="positive_marks"><?php echo get_phrase('correct_mark_(+)'); ?></label>
                            <input type="number" step="0.25" name="positive_marks" id="positive_marks" class="form-control"
                                   value="<?php echo $is_edit ? $paper['positive_marks'] : 2.00; ?>">
                        </div>
                        <div class="col-md-3 form-group">
                            <label for="negative_marks"><?php echo get_phrase('negative_penalty_(-)'); ?></label>
                            <input type="number" step="0.25" name="negative_marks" id="negative_marks" class="form-control"
                                   value="<?php echo $is_edit ? $paper['negative_marks'] : 0.50; ?>">
                        </div>
                    </div>

                    <!-- Free / PYQL Pass Access -->
                    <div class="form-group custom-control custom-checkbox mt-2 mb-4">
                        <input type="checkbox" class="custom-control-input" id="is_free" name="is_free" value="1"
                               <?php if ($is_edit && $paper['is_free']) echo 'checked'; ?>>
                        <label class="custom-control-label font-weight-bold text-success" for="is_free">
                            <?php echo get_phrase('allow_free_access_(no_pyql_pass_required)'); ?>
                        </label>
                        <small class="form-text text-muted">
                            <?php echo get_phrase('if_unchecked,_students_must_have_an_active_pyql_pass_to_attempt_this_test.'); ?>
                        </small>
                    </div>

                    <?php if (!$is_edit): ?>
                        <!-- Dynamic Section Configurator -->
                        <div class="border-top pt-3 mt-3">
                            <h5 class="header-title mb-2"><?php echo get_phrase('exam_sections_configuration'); ?></h5>
                            <p class="text-muted font-13 mb-3">
                                <?php echo get_phrase('configure_test_sections_(e.g._reasoning,_quant,_general_awareness,_english)'); ?>
                            </p>

                            <div id="sectionsContainer">
                                <div class="input-group mb-2 section-row">
                                    <div class="input-group-prepend"><span class="input-group-text">1</span></div>
                                    <input type="text" name="sections[]" class="form-control" value="General Intelligence & Reasoning" required>
                                    <div class="input-group-append">
                                        <button type="button" class="btn btn-outline-danger" onclick="removeSectionRow(this)"><i class="mdi mdi-close"></i></button>
                                    </div>
                                </div>
                                <div class="input-group mb-2 section-row">
                                    <div class="input-group-prepend"><span class="input-group-text">2</span></div>
                                    <input type="text" name="sections[]" class="form-control" value="Quantitative Aptitude" required>
                                    <div class="input-group-append">
                                        <button type="button" class="btn btn-outline-danger" onclick="removeSectionRow(this)"><i class="mdi mdi-close"></i></button>
                                    </div>
                                </div>
                                <div class="input-group mb-2 section-row">
                                    <div class="input-group-prepend"><span class="input-group-text">3</span></div>
                                    <input type="text" name="sections[]" class="form-control" value="General Awareness" required>
                                    <div class="input-group-append">
                                        <button type="button" class="btn btn-outline-danger" onclick="removeSectionRow(this)"><i class="mdi mdi-close"></i></button>
                                    </div>
                                </div>
                                <div class="input-group mb-2 section-row">
                                    <div class="input-group-prepend"><span class="input-group-text">4</span></div>
                                    <input type="text" name="sections[]" class="form-control" value="English Comprehension" required>
                                    <div class="input-group-append">
                                        <button type="button" class="btn btn-outline-danger" onclick="removeSectionRow(this)"><i class="mdi mdi-close"></i></button>
                                    </div>
                                </div>
                            </div>

                            <button type="button" class="btn btn-sm btn-outline-primary mt-2" onclick="addSectionRow()">
                                <i class="mdi mdi-plus"></i> <?php echo get_phrase('add_another_section'); ?>
                            </button>
                        </div>
                    <?php endif; ?>

                    <div class="text-center mt-4">
                        <button type="submit" class="btn btn-primary px-4 py-2 font-weight-bold">
                            <i class="mdi mdi-check"></i> <?php echo $is_edit ? get_phrase('save_changes') : get_phrase('create_paper_&_continue_to_questions'); ?>
                        </button>
                    </div>

                </form>
            </div>
        </div>
    </div>
</div>

<script>
    function addSectionRow() {
        const container = document.getElementById('sectionsContainer');
        const count = container.querySelectorAll('.section-row').length + 1;
        const div = document.createElement('div');
        div.className = 'input-group mb-2 section-row';
        div.innerHTML = `
            <div class="input-group-prepend"><span class="input-group-text">${count}</span></div>
            <input type="text" name="sections[]" class="form-control" placeholder="Section Name" required>
            <div class="input-group-append">
                <button type="button" class="btn btn-outline-danger" onclick="removeSectionRow(this)"><i class="mdi mdi-close"></i></button>
            </div>
        `;
        container.appendChild(div);
    }

    function removeSectionRow(btn) {
        const row = btn.closest('.section-row');
        if (row && document.querySelectorAll('.section-row').length > 1) {
            row.remove();
            // Re-index row numbers
            document.querySelectorAll('.section-row').forEach((r, idx) => {
                r.querySelector('.input-group-text').innerText = idx + 1;
            });
        }
    }
</script>
