<div class="row">
    <div class="col-xl-12">
        <div class="card">
            <div class="card-body">
                <h4 class="page-title">
                    <i class="mdi mdi-file-document-box-multiple-outline title_icon"></i> 
                    <?php echo get_phrase('previous_year_papers_&_mock_tests'); ?>
                    <a href="<?php echo site_url('admin/pyp_paper_form/add'); ?>" class="btn btn-outline-primary btn-rounded alignToTitle">
                        <i class="mdi mdi-plus"></i> <?php echo get_phrase('create_new_paper'); ?>
                    </a>
                </h4>
            </div>
        </div>
    </div>
</div>

<!-- Stats Counter Cards -->
<div class="row">
    <div class="col-md-3">
        <div class="card widget-flat">
            <div class="card-body">
                <div class="float-right">
                    <i class="mdi mdi-file-document-outline widget-icon text-primary"></i>
                </div>
                <h5 class="text-muted font-weight-normal mt-0" title="Total Papers"><?php echo get_phrase('total_papers'); ?></h5>
                <h3 class="mt-3 mb-1 font-weight-bold text-primary"><?php echo count($papers); ?></h3>
                <p class="mb-0 text-muted">
                    <span class="text-nowrap"><?php echo get_phrase('active_test_papers'); ?></span>
                </p>
            </div>
        </div>
    </div>
    <div class="col-md-3">
        <div class="card widget-flat">
            <div class="card-body">
                <div class="float-right">
                    <i class="mdi mdi-help-circle-outline widget-icon text-success"></i>
                </div>
                <h5 class="text-muted font-weight-normal mt-0" title="Total Questions"><?php echo get_phrase('total_questions'); ?></h5>
                <h3 class="mt-3 mb-1 font-weight-bold text-success">
                    <?php 
                        $total_all_q = $this->db->count_all_results('pyp_questions');
                        echo number_format($total_all_q);
                    ?>
                </h3>
                <p class="mb-0 text-muted">
                    <span class="text-nowrap"><?php echo get_phrase('bilingual_questions'); ?></span>
                </p>
            </div>
        </div>
    </div>
    <div class="col-md-3">
        <div class="card widget-flat">
            <div class="card-body">
                <div class="float-right">
                    <i class="mdi mdi-account-group-outline widget-icon text-info"></i>
                </div>
                <h5 class="text-muted font-weight-normal mt-0" title="Test Attempts"><?php echo get_phrase('student_attempts'); ?></h5>
                <h3 class="mt-3 mb-1 font-weight-bold text-info">
                    <?php echo $this->db->count_all_results('pyp_attempts'); ?>
                </h3>
                <p class="mb-0 text-muted">
                    <span class="text-nowrap"><?php echo get_phrase('completed_tests'); ?></span>
                </p>
            </div>
        </div>
    </div>
    <div class="col-md-3">
        <div class="card widget-flat">
            <div class="card-body">
                <div class="float-right">
                    <i class="mdi mdi-crown text-warning widget-icon"></i>
                </div>
                <h5 class="text-muted font-weight-normal mt-0" title="PYQL Passes"><?php echo get_phrase('active_passes'); ?></h5>
                <h3 class="mt-3 mb-1 font-weight-bold text-warning">
                    <?php echo $this->db->where('status', 'ACTIVE')->count_all_results('pyp_user_passes'); ?>
                </h3>
                <p class="mb-0 text-muted">
                    <span class="text-nowrap"><?php echo get_phrase('subscribed_students'); ?></span>
                </p>
            </div>
        </div>
    </div>
</div>

<!-- Papers Datatable -->
<div class="row">
    <div class="col-xl-12">
        <div class="card">
            <div class="card-body">
                <h4 class="mb-3 header-title"><?php echo get_phrase('all_test_papers'); ?></h4>
                <div class="table-responsive-sm mt-4">
                    <table id="basic-datatable" class="table table-striped table-centered mb-0">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th><?php echo get_phrase('paper_title'); ?></th>
                                <th><?php echo get_phrase('exam'); ?></th>
                                <th><?php echo get_phrase('year_/_shift'); ?></th>
                                <th><?php echo get_phrase('duration'); ?></th>
                                <th><?php echo get_phrase('questions'); ?></th>
                                <th><?php echo get_phrase('marks'); ?></th>
                                <th><?php echo get_phrase('access'); ?></th>
                                <th><?php echo get_phrase('actions'); ?></th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php foreach ($papers as $key => $p): ?>
                                <tr>
                                    <td><?php echo $key + 1; ?></td>
                                    <td>
                                        <strong>
                                            <a href="<?php echo site_url('admin/pyp_questions/' . $p['id']); ?>" class="text-dark">
                                                <?php echo htmlspecialchars($p['title']); ?>
                                            </a>
                                        </strong>
                                    </td>
                                    <td>
                                        <span class="badge badge-info-lighten">
                                            <?php echo htmlspecialchars($p['exam_title'] ?: 'General'); ?>
                                        </span>
                                    </td>
                                    <td>
                                        <small class="text-muted">
                                            <?php echo $p['year']; ?> &bull; <?php echo htmlspecialchars($p['shift']); ?>
                                        </small>
                                    </td>
                                    <td><?php echo $p['duration_minutes']; ?> mins</td>
                                    <td>
                                        <span class="badge badge-primary-lighten font-weight-bold">
                                            <?php echo $p['total_questions']; ?> Qs
                                        </span>
                                    </td>
                                    <td>
                                        <small class="text-success font-weight-bold">+<?php echo (float)$p['positive_marks']; ?></small> / 
                                        <small class="text-danger font-weight-bold">-<?php echo (float)$p['negative_marks']; ?></small>
                                    </td>
                                    <td>
                                        <?php if ($p['is_free']): ?>
                                            <span class="badge badge-success-lighten"><?php echo get_phrase('free'); ?></span>
                                        <?php else: ?>
                                            <span class="badge badge-warning-lighten"><i class="mdi mdi-crown"></i> <?php echo get_phrase('pass_required'); ?></span>
                                        <?php endif; ?>
                                    </td>
                                    <td>
                                        <div class="dropright dropright">
                                            <button type="button" class="btn btn-sm btn-outline-primary btn-rounded btn-icon" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                <i class="mdi mdi-dots-vertical"></i>
                                            </button>
                                            <div class="dropdown-menu">
                                                <a class="dropdown-item" href="<?php echo site_url('admin/pyp_questions/' . $p['id']); ?>">
                                                    <i class="mdi mdi-help-circle-outline mr-1 text-primary"></i> <?php echo get_phrase('manage_questions'); ?>
                                                </a>
                                                <a class="dropdown-item" href="<?php echo site_url('admin/pyp_import/' . $p['id']); ?>">
                                                    <i class="mdi mdi-upload mr-1 text-success"></i> <?php echo get_phrase('bulk_import_questions'); ?>
                                                </a>
                                                <a class="dropdown-item" href="<?php echo site_url('admin/pyp_paper_form/edit/' . $p['id']); ?>">
                                                    <i class="mdi mdi-pencil mr-1 text-info"></i> <?php echo get_phrase('edit_paper'); ?>
                                                </a>
                                                <a class="dropdown-item" target="_blank" href="<?php echo site_url('test-series/instructions/' . $p['id']); ?>">
                                                    <i class="mdi mdi-eye mr-1 text-secondary"></i> <?php echo get_phrase('preview_in_cbt_engine'); ?>
                                                </a>
                                                <div class="dropdown-divider"></div>
                                                <a class="dropdown-item text-danger" href="javascript:;" onclick="confirm_modal('<?php echo site_url('admin/pyp_papers/delete/' . $p['id']); ?>');">
                                                    <i class="mdi mdi-delete mr-1"></i> <?php echo get_phrase('delete'); ?>
                                                </a>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                            <?php endforeach; ?>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
