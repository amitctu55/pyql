<?php
$CI = get_instance();
$CI->load->database();
$CI->load->dbforge();

// ADD NEW COLUMN INSINDE payment TABLE
$for_stripe1 = array(
	'transaction_id' => array(
		'type' => 'VARCHAR',
		'constraint' => 255,
		'default' => null,
		'null' => TRUE
	)
);
$for_stripe2 = array(
	'session_id' => array(
		'type' => 'VARCHAR',
		'constraint' => 255,
		'default' => null,
		'null' => TRUE
	)
);
$this->dbforge->add_column('payment', $for_stripe1);
$this->dbforge->add_column('payment', $for_stripe2);


// INSERT VERSION NUMBER INSIDE SETTINGS TABLE
$settings_data = array( 'value' => '4.2');
$CI->db->where('key', 'version');
$CI->db->update('settings', $settings_data);
?>
