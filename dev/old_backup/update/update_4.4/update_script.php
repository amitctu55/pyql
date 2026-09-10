<?php
$CI = get_instance();
$CI->load->database();
$CI->load->dbforge();

$fields1 = array(
    'visibility' => array(
        'name' => 'course_type',
        'type' => 'VARCHAR',
		'constraint' => '255',
		'default' => null,
		'null' => TRUE,
		'collation' => 'utf8_unicode_ci'
    ),
);
$CI->dbforge->modify_column('course', $fields1);

$course_type['course_type'] = 'general';
$CI->db->update('course', $course_type);

$frontend_settings1['key']   = 'recaptcha_status';
$frontend_settings1['value'] = '0';
$CI->db->insert('frontend_settings', $frontend_settings1);

$frontend_settings2['key']   = 'recaptcha_sitekey';
$frontend_settings2['value'] = 'recaptcha-sitekey';
$CI->db->insert('frontend_settings', $frontend_settings2);

$frontend_settings3['key']   = 'recaptcha_secretkey';
$frontend_settings3['value'] = 'recaptcha-secretkey';
$CI->db->insert('frontend_settings', $frontend_settings3);

// INSERT VERSION NUMBER INSIDE SETTINGS TABLE
$settings_data = array( 'value' => '4.4');
$CI->db->where('key', 'version');
$CI->db->update('settings', $settings_data);
?>
