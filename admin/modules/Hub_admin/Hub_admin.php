<?php


class Hub_admin extends CodonModule
{
    public function HTMLHead()
    {
        $this->set('sidebar', 'hub/sidebar_hub.tpl');
    }

    public function NavBar()
    {
        echo '<li><a href="'.SITE_URL.'/admin/index.php/Hub_admin">Hubs</a></li>';
    }

    public function index()
    {
        if($this->post->action == 'save_new_hub')
        {
            $this->save_new_hub();
        }
        elseif($this->post->action == 'save_edit_hub')
        {
            $this->save_edit_hub();
        }
        else
        {
            $this->set('hubs', HubData::get_hub());
			$this->set('history', HubData::get_past_hub());
            $this->show('hub/hub_index.tpl');
        }
    }
    public function get_hubs()
    {
        $hubid = $_GET[hubid];
        $this->set('hubs', HubData::get_hubs($hubid));
        
        $this->show('hub/hubs_hub.tpl');
    }
    public function new_hub()
    {
        $hubs = HubData::get_airports();
		$this->set('hubs', $hubs);
		$this->show('hub/hub_new_form.tpl');
    }
    protected function save_new_hub()
    {
        $hubr = array();

        $hubr['hubicao'] = DB::escape($this->post->hubicao);
		$hubr['hubname'] = DB::escape($this->post->hubname);
		$hubr['lat'] = DB::escape($this->post->lat);
		$hubr['lng'] = DB::escape($this->post->lng);
		$hubr['image'] = DB::escape($this->post->image);

  

   /*     foreach($hubr as $test)
        {
            if(empty($test))
            {
                $this->set('aircrafts', $ac);
                $this->show('aircraft/aircraft_new_form.tpl');
                return;
            }
        }*/

 

        HubData::save_new_hub($hubr['hubicao'], $hubr['hubname'], $hubr['lat'], $hubr['lng'], $hubr['image']);
                                   

       

        $this->set('hubs', HubData::get_hub());
       
        $this->show('hub/hub_index.tpl');
    }
    public function edit_hub() {
            $hubid = $_GET[hubid];
            $hubed = array();
            //$aircraft = AircraftData::get_aircrafts($id);
            $this->set('hubs', HubData::get_hubs($hubid));
            $this->show('hub/hub_edit_form.tpl');
    }
    protected function save_edit_hub()
    {
        $hb= array();

        $hb['hubicao'] = DB::escape($this->post->hubicao);
        $hb['hubname'] = DB::escape($this->post->hubname);	
		$hb['lat'] = DB::escape($this->post->lat);
		$hb['lng'] = DB::escape($this->post->lng);
		$hb['image'] = DB::escape($this->post->image);
		$hb['hubid'] = DB::escape($this->post->hubid);
     

        HubData::save_edit_hub($hb['hubicao'], 
										   $hb['hubname'],   
										   $hb['lat'],
										   $hb['lng'],
										   $hb['image'],
										   $hb['hubid']);

        $hubid = $hb['hubid'];
        $this->set('hubs', HubData::get_hubs($hubid));
        
        $this->show('hub/hubs_hub.tpl');
    }
 
    public function delete_hub()
    {
        $hubid = $_GET[hubid];
        HubData::delete_hub($hubid);

        $this->set('hub', HubData::get_hub());
        $this->show('hub/hub_index.tpl');
    }
}