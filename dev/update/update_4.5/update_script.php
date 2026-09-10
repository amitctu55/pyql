<?php
$CI = get_instance();
$CI->load->database();
$CI->load->dbforge();

$purchase_code_column = array(
	'purchase_code' => array(
		'type' => 'VARCHAR',
		'constraint' => 255,
		'default' => null,
		'null' => TRUE
	)
);
$CI->dbforge->add_column('addons', $purchase_code_column);


// INSERT VERSION NUMBER INSIDE SETTINGS TABLE
$settings_data = array( 'value' => '4.5');
$CI->db->where('key', 'version');
$CI->db->update('settings', $settings_data);
?>
