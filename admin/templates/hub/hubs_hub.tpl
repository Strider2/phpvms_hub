<?php

$this->show('hub/hub_header.tpl');
echo '<h4>Hub:'.$hubs->hubicao.'</h4><hr />';



echo 'Airport Name: <b>'.$hubs->hubname.'</b><hr />';

echo '</b><hr />';
echo '<a href="'.SITE_URL.'/admin/index.php/Hub_admin/edit_hub?hubid='.$hubs->hubid.'"><b>Edit Hub</b></a><br /><hr />';
echo '<a href="'.SITE_URL.'/admin/index.php/Hub_admin/delete_hub?hubid='.$hubs->hubid.'"><b>Delete Hub</b></a> - This will delete the Hub from the database permanently!<br /><hr />';
?>