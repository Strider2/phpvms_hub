<h3>Hubs</h3>

<?php 
if(!$hubs)
	{
		echo "You have not added any Hubs yet.";
	}
?>

<table width="100%" border="0">
<tr>
	<th>Airport ICAO</th>
    <th>Airport Name</th>
    <th>View Details</th>
</tr>
<?php 
foreach($hubs as $hub)
{
?>
<tr>
	<td><?php echo $hub->hubicao;?></td>
    <td><?php echo $hub->hubname;?></td>
    <td><a href="<?php echo SITE_URL;?>/index.php/Hub/HubView/<?php echo $hub->hubid;?>"><span class="btn">View Details</span></a></td>
</tr>
<?php
}
?>
</table>
