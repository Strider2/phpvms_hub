<?php

class HubData extends CodonData
{
    public function get_hub()
    {
        return DB::get_results("SELECT * FROM ".TABLE_PREFIX."airports WHERE hub = 1");
		
    }
	public function getHubs($icao)
	{
		$query = "SELECT *
				  FROM " . TABLE_PREFIX . "airports
				  WHERE icao = '$icao'";
				  
		return DB::get_row($query);
	}
 	/*public function getAircraft($aircraftid)
    {
		
        $query = "SELECT a.*, f.image
   				  FROM " . TABLE_PREFIX ."aircraft a
    			  LEFT JOIN ".TABLE_PREFIX."fleet f ON a.id=f.aircraftid
				  WHERE a.id ='$aircraftid'";

        return DB::get_row($query);
    }*/
    /*public function get_airline()
    {
        return DB::get_results("SELECT * FROM ".TABLE_PREFIX."codeshares GROUP BY airline");
    }*/
	    public function get_hubs($icao)
    {
        $query = "SELECT * FROM ".TABLE_PREFIX ."hubs WHERE hubicao='$icao'";

        return DB::get_row($query);
    }
   public function get_past_hub()
    {
        $query = "SELECT * FROM phpvms_hubs
                ORDER BY hubid DESC";

        return DB::get_results($query);
    }
	 public function get_airports()
    {
        return DB::get_results("SELECT * FROM ".TABLE_PREFIX."airports GROUP BY name");
    }
				  
    public function save_new_hub($hubicao, $hubname, $lat, $lng, $pilotid, $manager, $image)
    {
        $query = "INSERT INTO phpvms_hubs (hubicao, hubname, lat, lng, pilotid, manager, image)
                VALUES ('$hubicao', '$hubname', '$lat', '$lng', '$pilotid', '$manager', '$image')";

        DB::query($query);
    }
     public function save_edit_hub($hubicao, $hubname, $lat, $lng, $pilotid, $manager, $image, $hubid)
    {
        $query = "UPDATE phpvms_hubs SET
         hubicao='$hubicao',
		 hubname='$hubname',
		 lat='$lat',
		 lng='$lng',
		 pilotid='$pilotid',
		 manager='$manager',
		 image='$image'
         WHERE hubid='$hubid'";

        DB::query($query);
    }
    
    public function delete_hub($hubid)
    {
        $query = "DELETE FROM phpvms_hubs
                    WHERE hubid='$hubid'";

        DB::query($query);
    }
   
}