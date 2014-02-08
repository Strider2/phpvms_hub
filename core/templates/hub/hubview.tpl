<h3><?php echo $hubs->hubicao;?> information</h3>

<table width="100%" border="0">
<tr>
	<td><strong>Hub ICAO:</strong></td>
    <td><?php echo $hubs->icao;?></td>
    <td><strong>Airport Name:</strong></td>
    <td><?php echo $hubs->name;?></td>
    <td rowspan="2"><img src="<?php echo SITE_URL;?>/lib/images/airports/<?php echo $hubs->icao;?>.jpg" alt="<?php echo $hubs->icao;?>"/></td>
</tr>
<tr>
	<td><strong>Latitude:</strong></td>
    <td><?php echo $hubs->lat;?></td>
    <td><strong>Longtitude:</strong></td>
    <td><?php echo $hubs->lng;?></td>
</tr>
<tr>
	<td><strong>Hub Manager:</strong></td>
    <?php $manager = HubData::get_hubs($hubs->icao);?>
    <td><a href="<?php echo SITE_URL?>/index.php/profile/view/<?php echo $manager->pilotid;?>"><?php echo $manager->manager;?></a></td>
</table>

<h3><?php echo $hubs->icao;?> map</h3>
<img src="http://www.gcmap.com/map?P=<?php echo $hubs->icao;?>,+&amp;MS=bm&MR=30&MX=700x360&PM=b:disc4:blue%2b%22%25i%25+%28N%2210:yellow&PC=%23ffffff&MP=rect" width="100%" />

<h3><?php echo $hubs->icao;?> stats</h3>

<table width="100%" border="1" style="border-collapse:collapse;">
<tr>
	<td><strong>Number of Pilots:</strong></td>
    <td><?php echo HubStats::CountPilots($hubs->icao);?></td>
</tr>
<tr>
	<td><strong>Number of Flights Flown:</strong></td>
    <td><?php echo HubStats::CountFlights($hubs->icao);?></td>
</tr>
<tr>
	<td><strong>Number of Routes Flown From <?php echo $hubs->icao;?>:</strong></td>
    <td><?php echo HubStats::CountRoutes($hubs->icao);?></td>
</tr>
<tr>
	<td><strong>Total Miles Flown:</strong></td>
    <td><?php echo HubStats::TotalMiles($hubs->icao);?>nm</td>
</tr>
<tr>
	<td><strong>Total Hours Flown:</strong></td>
    <td><?php echo round(HubStats::TotalHours($hubs->icao));?></td>
</tr>
<tr>
	<td><strong>Total Fuel Used:</strong></td>
    <td><?php echo round(HubStats::TotalFuelUsed($hubs->icao));?>lbs</td>
</tr>
</table>

<h3>Pilot Roster for <?php echo $hubs->icao;?></h3>
<?php
$hubs_details = HubStats::Pilots($hubs->icao);
?>

<table width="100%" border="0">
<tr id="tablehead">
  <th>Country</th>
	<th>Pilot ID</th>

	<th>Name</th>

	<th>Rank</th>

	<th>Flights</th>

	<th>Hours</th>
    <th>Group</th>

    <th>Vatsim ID/IVAO ID</th>
    
    <th>Active</th>

   
  

</tr>

<?php

foreach($hubs_details as $pilot)

{

	

		
     if($pilot->retired =='1') { continue; }
     if($pilot->totalhours =='0'){ continue; }

?>

<tr>
  <td>
    <img src="<?php echo Countries::getCountryImage($pilot->location);?>" alt="<?php echo Countries::getCountryName($pilot->location);?>" />
  </td>
	<td width="1%" nowrap><a href="<?php echo SITE_URL?>/index.php/profile/view/<?php echo $pilot->pilotid;?>"><?php echo PilotData::GetPilotCode($pilot->code, $pilot->pilotid);?></a>

	</td>

	<td>
		
			

		<?php echo $pilot->firstname.' '.$pilot->lastname;?>

	</td>

	<td><img src="<?php echo $pilot->rankimage;?>" alt="<?php echo $pilot->rank;?>" /></td>
    

	<td><?php echo $pilot->totalflights; ?></td>

	<td><?php echo Util::AddTime($pilot->totalhours, $pilot->transferhours); ?></td>
    <td><?php echo $pilot->group;?></td>

    <td><?php

$fieldvalue = PilotData::GetFieldValue($pilot->pilotid, 'VATSIM ID');

if($fieldvalue != '')

{

   echo '<a href="http://www.vataware.com/pilot.cfm?cid='.$fieldvalue.'" target="_blank"><img src="'.SITE_URL.'/lib/skins/mva/images/vatsim.gif" alt="Vatsim ID" border="0" /></a>';

}

 ?>
<?php 
$feildvalue = PilotData::GetFieldValue($pilot->pilotid, 'IVAO ID');

if($feildvalue != '')
{
	echo '<img src="http://status.ivao.aero/R/'.$feildvalue.'.png">';
    }
    ?>
 </td>

  <td>
  <?php
                
                if($pilot->retired == 0)
                        echo '<span class="label label-success">Active</span>';
                elseif($pilot->retired == 1)
                        echo '<span class="label label-warning">Inactive</span>';
                elseif($pilot->retired == 2)
                        echo '<span class="label label-error">Banned</span>';
                elseif($pilot->retired == 3)
                        echo '<span class="label label-warning">On Leave</span>';
                
                ?>
  <!--<?php
                if($pilot->retired == '1')
                {echo '<img src="'.SITE_URL.'/lib/skins/mva/images/no.png" alt="Retired" /> - Retired';}
                
                
                else
                {echo '<img src="'.SITE_URL.'/lib/skins/mva/images/yes.png" alt="Active" /> - Active';}
            ?>-->
<?php

 }

 ?></td>





</tr>  
</table>

<a href="<?php echo SITE_URL?>/index.php/Hub">Back</a>

<!--Do not remove the copyright -->
<p>&copy; 2014 Strider V1.2.</p>