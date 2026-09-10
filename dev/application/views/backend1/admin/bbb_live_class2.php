<?php
// Fetch Zoom meeting details from the database
$zoom_meeting = $this->db->where('course_id', $course_details['id'])->get('zoom_meetings')->row_array();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Zoom Meeting Setup</title>
    <link rel="stylesheet" href="style.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <div class="form-group">
                    <label for="zoom_meeting_id"><?php echo get_phrase('Meeting ID'); ?></label>
                    <input value="<?php echo $zoom_meeting['meeting_id'] ?? '' ?>" type="text" class="form-control" id="zoom_meeting_id" placeholder="Enter Zoom Meeting ID">
                </div>

                <div class="form-group">
                    <label for="zoom_moderator_pw"><?php echo get_phrase('Moderator Password'); ?></label>
                    <input value="<?php echo $zoom_meeting['moderator_pw'] ?? '' ?>" type="text" class="form-control" id="zoom_moderator_pw" placeholder="Enter Moderator Password">
                </div>

                <div class="form-group">
                    <label for="zoom_viewer_pw"><?php echo get_phrase('Viewer Password'); ?></label>
                    <input value="<?php echo $zoom_meeting['viewer_pw'] ?? '' ?>" type="text" class="form-control" id="zoom_viewer_pw" placeholder="Enter Viewer Password">
                </div>

                <div class="form-group">
                    <label for="zoom_meeting_instruction"><?php echo get_phrase('Instructions for students'); ?></label>
                    <textarea id="zoom_meeting_instruction"><?php echo $zoom_meeting['instructions'] ?? '' ?></textarea>
                </div>
            </div>
            <div class="col-md-6">
                <div class="form-group mt-5 pt-5 text-center">
                    <div class="alert alert-info w-75 text-center ml-auto mr-auto mb-4">
                        <strong><?php echo get_phrase('Attention!'); ?></strong><br>
                        <?php echo get_phrase('Provide instructions to keep your students informed about the meeting.'); ?>
                    </div>
                    <button type="button" onclick="save_zoom_meeting()" class="btn btn-info w-75 mb-2"><?php echo get_phrase('Save Meeting Info'); ?></button>
                    <button type="button" onclick="start_zoom_meeting()" class="btn btn-success w-75"><?php echo get_phrase('Start Meeting'); ?></button>
                </div>
            </div>
        </div>
    </div>

    <script>
        $(function() {
            // Initialize any required UI components here
        });

        function save_zoom_meeting() {
            var zoom_meeting_id = $('#zoom_meeting_id').val();
            var zoom_moderator_pw = $('#zoom_moderator_pw').val();
            var zoom_viewer_pw = $('#zoom_viewer_pw').val();
            var zoom_instructions = $('#zoom_meeting_instruction').val();

            if (zoom_moderator_pw === '' || zoom_viewer_pw === '' || zoom_meeting_id === '') {
                alert('<?php echo get_phrase("Meeting ID and passwords cannot be empty"); ?>');
            } else if (zoom_moderator_pw === zoom_viewer_pw) {
                alert('<?php echo get_phrase("Moderator and viewer passwords cannot be the same"); ?>');
            } else {
                $.ajax({
                    type: 'POST',
                    url: '<?php echo site_url('admin/save_zoom_meeting/' . $course_details['id']); ?>',
                    data: {
                        'zoom_meeting_id': zoom_meeting_id,
                        'zoom_moderator_pw': zoom_moderator_pw,
                        'zoom_viewer_pw': zoom_viewer_pw,
                        'instructions': zoom_instructions
                    },
                    success: function(response) {
                        var result = JSON.parse(response);
                        alert(result.message);
                    }
                });
            }
        }

        function start_zoom_meeting() {
            $.ajax({
                type: 'GET',
                url: '<?php echo site_url('admin/start_zoom_meeting/' . $course_details['id']); ?>',
                success: function(response) {
                    var result = JSON.parse(response);
                    if (result.start_url) {
                        window.open(result.start_url, '_blank');
                    } else {
                        alert('Error starting meeting.');
                    }
                }
            });
        }
    </script>
</body>
</html>
