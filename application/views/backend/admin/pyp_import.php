<div class="row">
    <div class="col-xl-12">
        <div class="card">
            <div class="card-body">
                <h4 class="page-title">
                    <i class="mdi mdi-upload title_icon"></i> 
                    <?php echo get_phrase('bulk_import_questions'); ?>: 
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
    <!-- Left Column: Importer Options Tabs -->
    <div class="col-xl-8 col-lg-7">
        <div class="card">
            <div class="card-body">
                
                <ul class="nav nav-tabs nav-bordered mb-3">
                    <li class="nav-item">
                        <a href="#tab-csv" data-toggle="tab" aria-expanded="true" class="nav-link active">
                            <i class="mdi mdi-file-delimited text-success mr-1"></i> <?php echo get_phrase('csv_/_excel_file'); ?>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="#tab-json-file" data-toggle="tab" aria-expanded="false" class="nav-link">
                            <i class="mdi mdi-code-json text-warning mr-1"></i> <?php echo get_phrase('json_file_upload'); ?>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="#tab-paste" data-toggle="tab" aria-expanded="false" class="nav-link">
                            <i class="mdi mdi-clipboard-text-outline text-primary mr-1"></i> <?php echo get_phrase('paste_json_/_text'); ?>
                        </a>
                    </li>
                </ul>

                <div class="tab-content">
                    
                    <!-- TAB 1: CSV / EXCEL FILE -->
                    <div class="tab-pane show active" id="tab-csv">
                        <form action="<?php echo site_url('admin/pyp_import/' . $paper['id']); ?>" method="post" enctype="multipart/form-data">
                            <input type="hidden" name="is_submitted" value="1">
                            <input type="hidden" name="import_type" value="csv_file">

                            <div class="form-group mb-4">
                                <label for="file_csv"><?php echo get_phrase('select_csv_file'); ?> <span class="text-danger">*</span></label>
                                <div class="custom-file">
                                    <input type="file" class="custom-file-input" id="file_csv" name="file_csv" accept=".csv" required>
                                    <label class="custom-file-label" for="file_csv"><?php echo get_phrase('choose_csv_file'); ?>...</label>
                                </div>
                                <small class="form-text text-muted">
                                    <?php echo get_phrase('format:_.csv_file_with_header_row._download_the_sample_template_to_see_the_exact_structure.'); ?>
                                </small>
                            </div>

                            <div class="alert alert-info">
                                <h5 class="alert-heading font-14"><i class="mdi mdi-information-outline mr-1"></i> CSV Column Specifications:</h5>
                                <p class="mb-1 font-12">
                                    <code>question_en, question_hi, opt_1, opt_2, opt_3, opt_4, correct_options, solution_en, solution_hi, section_id, difficulty, positive_marks, negative_marks</code>
                                </p>
                                <small>Section IDs available for this paper: 
                                    <?php foreach ($sections as $s) echo '<code>' . $s['id'] . '</code> '; ?>
                                </small>
                            </div>

                            <button type="submit" class="btn btn-success px-4 py-2 font-weight-bold">
                                <i class="mdi mdi-upload"></i> <?php echo get_phrase('upload_&_import_csv'); ?>
                            </button>
                        </form>
                    </div>

                    <!-- TAB 2: JSON FILE UPLOAD -->
                    <div class="tab-pane" id="tab-json-file">
                        <form action="<?php echo site_url('admin/pyp_import/' . $paper['id']); ?>" method="post" enctype="multipart/form-data">
                            <input type="hidden" name="is_submitted" value="1">
                            <input type="hidden" name="import_type" value="json_file">

                            <div class="form-group mb-4">
                                <label for="file_json"><?php echo get_phrase('select_json_file'); ?> <span class="text-danger">*</span></label>
                                <div class="custom-file">
                                    <input type="file" class="custom-file-input" id="file_json" name="file_json" accept=".json" required>
                                    <label class="custom-file-label" for="file_json"><?php echo get_phrase('choose_json_file'); ?>...</label>
                                </div>
                                <small class="form-text text-muted">
                                    <?php echo get_phrase('upload_a_valid_json_file_containing_an_array_of_questions.'); ?>
                                </small>
                            </div>

                            <button type="submit" class="btn btn-warning px-4 py-2 font-weight-bold text-dark">
                                <i class="mdi mdi-upload"></i> <?php echo get_phrase('upload_&_import_json'); ?>
                            </button>
                        </form>
                    </div>

                    <!-- TAB 3: DIRECT PASTE (JSON) -->
                    <div class="tab-pane" id="tab-paste">
                        <form action="<?php echo site_url('admin/pyp_import/' . $paper['id']); ?>" method="post">
                            <input type="hidden" name="is_submitted" value="1">
                            <input type="hidden" name="import_type" value="json_paste">

                            <div class="form-group mb-3">
                                <label for="raw_json"><?php echo get_phrase('paste_json_data_below'); ?> <span class="text-danger">*</span></label>
                                <textarea name="raw_json" id="raw_json" class="form-control font-family-monospace" rows="12" required
                                          placeholder='[&#10;  {&#10;    "section_id": "sec_reasoning",&#10;    "question_en": "What is the capital of India?",&#10;    "options_en": [{"id":"opt_1","text":"New Delhi"},{"id":"opt_2","text":"Mumbai"},{"id":"opt_3","text":"Kolkata"},{"id":"opt_4","text":"Chennai"}],&#10;    "correct_options": "opt_1",&#10;    "solution_en": "New Delhi is the official capital.",&#10;    "difficulty": "EASY"&#10;  }&#10;]'></textarea>
                            </div>

                            <button type="submit" class="btn btn-primary px-4 py-2 font-weight-bold">
                                <i class="mdi mdi-import"></i> <?php echo get_phrase('parse_&_import_questions'); ?>
                            </button>
                        </form>
                    </div>

                </div>

            </div>
        </div>
    </div>

    <!-- Right Column: Download Templates & Guidelines -->
    <div class="col-xl-4 col-lg-5">
        
        <!-- Download Templates Card -->
        <div class="card bg-light border">
            <div class="card-body">
                <h5 class="header-title mb-2"><?php echo get_phrase('sample_templates'); ?></h5>
                <p class="text-muted font-12 mb-3">
                    <?php echo get_phrase('download_a_pre-filled_sample_file_to_see_the_exact_format.'); ?>
                </p>

                <div class="d-flex flex-column gap-2">
                    <a href="<?php echo site_url('admin/pyp_sample_template/csv'); ?>" class="btn btn-outline-success btn-block text-left mb-2">
                        <i class="mdi mdi-download mr-1"></i> <?php echo get_phrase('download_sample_csv_template'); ?>
                    </a>
                    <a href="<?php echo site_url('admin/pyp_sample_template/json'); ?>" class="btn btn-outline-warning btn-block text-left text-dark">
                        <i class="mdi mdi-download mr-1"></i> <?php echo get_phrase('download_sample_json_template'); ?>
                    </a>
                </div>
            </div>
        </div>

        <!-- KaTeX / LaTeX Syntax Guidelines -->
        <div class="card">
            <div class="card-body">
                <h5 class="header-title mb-2"><i class="mdi mdi-function mr-1 text-primary"></i> KaTeX LaTeX Formulas</h5>
                <p class="text-muted font-12 mb-3">
                    You can include mathematical formulas anywhere in the question, options, or solution fields:
                </p>

                <div class="table-responsive">
                    <table class="table table-sm table-centered font-11 mb-0">
                        <thead class="bg-light">
                            <tr>
                                <th>Math Formula</th>
                                <th>KaTeX Syntax</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>Fractions</td>
                                <td><code>$\frac{a}{b}$</code></td>
                            </tr>
                            <tr>
                                <td>Square Roots</td>
                                <td><code>$\sqrt{x^2 + y^2}$</code></td>
                            </tr>
                            <tr>
                                <td>Exponents</td>
                                <td><code>$x^{n+1}$</code></td>
                            </tr>
                            <tr>
                                <td>Trigonometry</td>
                                <td><code>$\sin\theta + \cos\theta$</code></td>
                            </tr>
                            <tr>
                                <td>Summation</td>
                                <td><code>$\sum_{i=1}^n x_i$</code></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

    </div>
</div>

<script>
    // Update custom file input label
    document.querySelectorAll('.custom-file-input').forEach(input => {
        input.addEventListener('change', function(e) {
            const fileName = e.target.files[0]?.name || 'Choose file...';
            const label = e.target.nextElementSibling;
            if (label) label.innerText = fileName;
        });
    });
</script>
