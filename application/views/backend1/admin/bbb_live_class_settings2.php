<div class="row">
    <div class="col-xl-12">
        <div class="card">
            <div class="card-body py-2">
                <h4 class="page-title">
                    <i class="mdi mdi-apple-keyboard-command title_icon"></i> 
                    <?php echo get_phrase('Zoom Live Class Settings'); ?>
                </h4>
            </div> <!-- end card body-->
        </div> <!-- end card -->
    </div><!-- end col-->
</div>

<div class="row">
    <div class="col-md-6">
        <div class="card">
            <div class="card-body">
                <form action="<?php echo site_url('admin/zoom_live_class_settings/update'); ?>" method="post" enctype="multipart/form-data">
                    <div class="form-group">
                        <label for="api_key"><?php echo get_phrase('Zoom API Key'); ?></label>
                        <input value="<?php echo get_settings('zoom_setting', true)['api_key'] ?? ''; ?>" type="text" class="form-control" name="api_key" id="api_key" placeholder="Your Zoom API Key" required>
                    </div>

                    <div class="form-group">
                        <label for="api_secret"><?php echo get_phrase('Zoom API Secret'); ?></label>
                        <input value="<?php echo get_settings('zoom_setting', true)['api_secret'] ?? ''; ?>" type="text" class="form-control" name="api_secret" id="api_secret" placeholder="Your Zoom API Secret" required>
                    </div>

                    <div class="form-group mt-4">
                        <button class="btn btn-success"><?php echo get_phrase('Save Changes'); ?></button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
