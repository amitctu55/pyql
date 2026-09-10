<?php
// Include your Zoom API credentials
$zoom_api_key = 'YOUR_API_KEY';
$zoom_api_secret = 'YOUR_API_SECRET';

// Function to create a Zoom meeting
function create_zoom_meeting($course_id) {
    global $zoom_api_key, $zoom_api_secret;
    
    $url = 'https://api.zoom.us/v2/users/me/meetings';
    $data = array(
        'topic' => 'Meeting for Course ' . $course_id,
        'type' => 1, // Scheduled meeting
        'settings' => array(
            'host_video' => true,
            'participant_video' => true,
            'join_before_host' => true,
            'mute_upon_entry' => true,
            'watermark' => false,
            'use_pmi' => false
        )
    );

    $ch = curl_init($url);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_HTTPHEADER, array(
        'Authorization: Bearer ' . generate_jwt($zoom_api_key, $zoom_api_secret),
        'Content-Type: application/json'
    ));
    curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($data));
    $response = curl_exec($ch);
    curl_close($ch);

    return json_decode($response, true);
}

// Function to generate JWT
function generate_jwt($api_key, $api_secret) {
    $payload = array(
        'iss' => $api_key,
        'exp' => time() + 3600
    );
    return JWT::encode($payload, $api_secret);
}

// Handle POST request to save Zoom meeting details
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $zoom_meeting_id = $_POST['zoom_meeting_id'];
    $host_pw = $_POST['zoom_host_pw'];
    $participant_pw = $_POST['zoom_participant_pw'];
    $instructions = $_POST['instructions'];
    
    $data = array(
        'zoom_meeting_id' => $zoom_meeting_id,
        'host_pw' => $host_pw,
        'participant_pw' => $participant_pw,
        'instructions' => $instructions
    );

    // Save to database
    $this->db->where('course_id', $course_id)->update('zoom_meetings', $data);
    
    echo json_encode(array('status' => 'success', 'message' => 'Meeting info saved successfully.'));
    exit;
}

// Handle GET request to start Zoom meeting
if ($_SERVER['REQUEST_METHOD'] === 'GET' && isset($_GET['action']) && $_GET['action'] === 'start') {
    $course_id = $_GET['course_id'];
    
    $zoom_meeting = $this->db->where('course_id', $course_id)->get('zoom_meetings')->row_array();
    
    // Start Zoom meeting
    $start_url = 'https://api.zoom.us/v2/meetings/' . $zoom_meeting['zoom_meeting_id'] . '/instance';
    $ch = curl_init($start_url);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_HTTPHEADER, array(
        'Authorization: Bearer ' . generate_jwt($zoom_api_key, $zoom_api_secret),
        'Content-Type: application/json'
    ));
    $response = curl_exec($ch);
    curl_close($ch);
    
    $meeting_details = json_decode($response, true);
    echo json_encode($meeting_details);
    exit;
}
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
                    <label for="zoom_meeting_id">Meeting ID</label>
                    <input value="<?php echo $zoom_meeting['zoom_meeting_id'] ?? '' ?>" type="text" class="form-control" id="zoom_meeting_id" placeholder="xxxxxxxxx">
                </div>

                <div class="form-group">
                    <label for="zoom_host_pw">Host Password</label>
                    <input value="<?php echo $zoom_meeting['host_pw'] ?? '' ?>" type="text" class="form-control" id="zoom_host_pw" placeholder="xxxxxx">
                </div>

                <div class="form-group">
                    <label for="zoom_participant_pw">Participant Password</label>
                    <input value="<?php echo $zoom_meeting['participant_pw'] ?? '' ?>" type="text" class="form-control" id="zoom_participant_pw" placeholder="xxxxxx">
                </div>

                <div class="form-group">
                    <label for="zoom_meeting_instruction">Instructions for students</label>
                    <textarea id="zoom_meeting_instruction"><?php echo $zoom_meeting['instructions'] ?? '' ?></textarea>
                </div>
            </div>
            <div class="col-md-6">
                <div class="form-group mt-5 pt-5 text-center">
                    <div class="alert alert-info w-75 text-center ml-auto mr-auto mb-4">
                        <strong>Attention!</strong><br>
                        Give some instructions to keep your students informed about the meeting
                    </div>
                    <button type="button" onclick="save_zoom_meeting()" class="btn btn-info w-75 mb-2">Save Meeting Info</button>
                    <button type="button" onclick="start_zoom_meeting()" class="btn btn-success w-75">Start Meeting</button>
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
            var zoom_host_pw = $('#zoom_host_pw').val();
            var zoom_participant_pw = $('#zoom_participant_pw').val();
            var zoom_instructions = $('#zoom_meeting_instruction').val();

            if (zoom_host_pw == '' || zoom_participant_pw == '' || zoom_meeting_id == '') {
                alert('Meeting ID and password cannot be empty');
            } else if (zoom_host_pw == zoom_participant_pw) {
                alert('Host and participant password cannot be the same');
            } else {
                $.ajax({
                    type: 'POST',
                    url: 'zoom_meeting.php',
                    data: {
                        'zoom_meeting_id': zoom_meeting_id,
                        'zoom_host_pw': zoom_host_pw,
                        'zoom_participant_pw': zoom_participant_pw,
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
                url: 'zoom_meeting.php',
                data: {
                    'action': 'start',
                    'course_id': '<?php echo $course_id; ?>'
                },
                success: function(response) {
                    var meetingDetails = JSON.parse(response);
                    window.open(meetingDetails.start_url, '_blank');
                }
            });
        }
    </script>
</body>
</html>
