<?php
    $is_edit = ($type == 'edit' && isset($question));
    $action_url = $is_edit ? site_url('admin/pyp_questions/' . $paper['id'] . '/edit/' . $question['id']) : site_url('admin/pyp_questions/' . $paper['id'] . '/add');
    
    $opts_en = $is_edit ? $question['options_en'] : array();
    $opts_hi = $is_edit ? $question['options_hi'] : array();
    $correct_opt = $is_edit ? $question['correct_options'] : 'opt_1';
?>

<div class="row">
    <div class="col-xl-12">
        <div class="card">
            <div class="card-body">
                <h4 class="page-title">
                    <i class="mdi mdi-help-circle-outline title_icon"></i> 
                    <?php echo $is_edit ? get_phrase('edit_question') : get_phrase('add_new_question'); ?>: 
                    <span class="text-primary"><?php echo htmlspecialchars($paper['title']); ?></span>
                    <a href="<?php echo site_url('admin/pyp_questions/' . $paper['id']); ?>" class="btn btn-outline-secondary btn-rounded alignToTitle">
                        <i class="mdi mdi-arrow-left"></i> <?php echo get_phrase('back_to_questions'); ?>
                    </a>
                </h4>
            </div>
        </div>
    </div>
</div>

<div class="row">
    <div class="col-xl-10 col-lg-12 mx-auto">
        <div class="card">
            <div class="card-body">
                <form action="<?php echo $action_url; ?>" method="post">
                    
                    <!-- Top Meta Info -->
                    <div class="row">
                        <div class="col-md-4 form-group">
                            <label for="section_id"><?php echo get_phrase('select_section'); ?> <span class="text-danger">*</span></label>
                            <select name="section_id" id="section_id" class="form-control" required>
                                <?php foreach ($sections as $s): ?>
                                    <option value="<?php echo $s['id']; ?>" <?php if ($is_edit && $question['section_id'] == $s['id']) echo 'selected'; ?>>
                                        <?php echo htmlspecialchars($s['name']); ?>
                                    </option>
                                <?php endforeach; ?>
                            </select>
                        </div>

                        <div class="col-md-2 form-group">
                            <label for="difficulty"><?php echo get_phrase('difficulty'); ?></label>
                            <select name="difficulty" id="difficulty" class="form-control">
                                <option value="EASY" <?php if ($is_edit && $question['difficulty'] == 'EASY') echo 'selected'; ?>>EASY</option>
                                <option value="MEDIUM" <?php if (!$is_edit || $question['difficulty'] == 'MEDIUM') echo 'selected'; ?>>MEDIUM</option>
                                <option value="HARD" <?php if ($is_edit && $question['difficulty'] == 'HARD') echo 'selected'; ?>>HARD</option>
                            </select>
                        </div>

                        <div class="col-md-3 form-group">
                            <label for="positive_marks"><?php echo get_phrase('correct_mark_(+)'); ?></label>
                            <input type="number" step="0.25" name="positive_marks" id="positive_marks" class="form-control"
                                   value="<?php echo $is_edit ? $question['positive_marks'] : $paper['positive_marks']; ?>" required>
                        </div>

                        <div class="col-md-3 form-group">
                            <label for="negative_marks"><?php echo get_phrase('negative_penalty_(-)'); ?></label>
                            <input type="number" step="0.25" name="negative_marks" id="negative_marks" class="form-control"
                                   value="<?php echo $is_edit ? $question['negative_marks'] : $paper['negative_marks']; ?>" required>
                        </div>
                    </div>

                    <!-- Bilingual Question Text -->
                    <div class="row mt-2">
                        <div class="col-md-6 form-group">
                            <label for="question_en"><?php echo get_phrase('question_statement_(english)'); ?> <span class="text-danger">*</span></label>
                            <textarea name="question_en" id="question_en" class="form-control" rows="4" required
                                      placeholder="Type English question statement. HTML and KaTeX LaTeX math ($...$) supported."><?php echo $is_edit ? htmlspecialchars($question['question_en']) : ''; ?></textarea>
                            <small class="form-text text-muted">Use <code>$x = \frac{a}{b}$</code> for math equations.</small>
                        </div>

                        <div class="col-md-6 form-group">
                            <label for="question_hi"><?php echo get_phrase('question_statement_(hindi)'); ?></label>
                            <textarea name="question_hi" id="question_hi" class="form-control" rows="4"
                                      placeholder="हिंदी में प्रश्न दर्ज करें (वैकल्पिक)"><?php echo $is_edit ? htmlspecialchars($question['question_hi']) : ''; ?></textarea>
                            <small class="form-text text-muted">Leave empty to use English statement as fallback.</small>
                        </div>
                    </div>

                    <!-- 4 Options (A, B, C, D) -->
                    <h5 class="header-title mt-4 mb-2"><?php echo get_phrase('multiple_choice_options'); ?></h5>
                    <p class="text-muted font-12 mb-3"><?php echo get_phrase('enter_four_options_and_mark_the_correct_answer_radio.'); ?></p>

                    <?php for ($i = 1; $i <= 4; $i++): 
                        $opt_id = 'opt_' . $i;
                        $letter = chr(64 + $i);
                        $en_val = '';
                        $hi_val = '';
                        if ($is_edit) {
                            $found_en = array_filter($opts_en, function($o) use ($opt_id) { return $o['id'] == $opt_id; });
                            $en_val = !empty($found_en) ? reset($found_en)['text'] : '';
                            $found_hi = array_filter($opts_hi, function($o) use ($opt_id) { return $o['id'] == $opt_id; });
                            $hi_val = !empty($found_hi) ? reset($found_hi)['text'] : '';
                        }
                    ?>
                        <div class="card bg-light border mb-3">
                            <div class="card-body py-2">
                                <div class="row align-items-center">
                                    <div class="col-md-1 text-center">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="radio_<?php echo $opt_id; ?>" name="correct_options" value="<?php echo $opt_id; ?>" 
                                                   class="custom-control-input" <?php if ($correct_opt == $opt_id) echo 'checked'; ?>>
                                            <label class="custom-control-label font-weight-bold" for="radio_<?php echo $opt_id; ?>">
                                                <?php echo $letter; ?>
                                            </label>
                                        </div>
                                        <small class="text-success font-weight-bold d-block"><?php echo get_phrase('correct'); ?></small>
                                    </div>

                                    <div class="col-md-5 form-group mb-0">
                                        <input type="text" name="<?php echo $opt_id; ?>_en" class="form-control form-control-sm" required
                                               placeholder="Option <?php echo $letter; ?> (English)" value="<?php echo htmlspecialchars($en_val); ?>">
                                    </div>

                                    <div class="col-md-6 form-group mb-0">
                                        <input type="text" name="<?php echo $opt_id; ?>_hi" class="form-control form-control-sm"
                                               placeholder="Option <?php echo $letter; ?> (Hindi - Optional)" value="<?php echo htmlspecialchars($hi_val); ?>">
                                    </div>
                                </div>
                            </div>
                        </div>
                    <?php endfor; ?>

                    <!-- Step-by-Step Detailed Solution -->
                    <h5 class="header-title mt-4 mb-2"><?php echo get_phrase('step-by-step_detailed_solution'); ?></h5>
                    <div class="row">
                        <div class="col-md-6 form-group">
                            <label for="solution_en"><?php echo get_phrase('solution_(english)'); ?></label>
                            <textarea name="solution_en" id="solution_en" class="form-control" rows="4"
                                      placeholder="Explain step-by-step method with calculations and formulas"><?php echo $is_edit ? htmlspecialchars($question['solution_en']) : ''; ?></textarea>
                        </div>

                        <div class="col-md-6 form-group">
                            <label for="solution_hi"><?php echo get_phrase('solution_(hindi)'); ?></label>
                            <textarea name="solution_hi" id="solution_hi" class="form-control" rows="4"
                                      placeholder="विस्तृत हल हिंदी में"><?php echo $is_edit ? htmlspecialchars($question['solution_hi']) : ''; ?></textarea>
                        </div>
                    </div>

                    <div class="text-center mt-4">
                        <button type="submit" class="btn btn-primary px-5 py-2 font-weight-bold">
                            <i class="mdi mdi-check"></i> <?php echo $is_edit ? get_phrase('update_question') : get_phrase('save_question'); ?>
                        </button>
                    </div>

                </form>
            </div>
        </div>
    </div>
</div>
