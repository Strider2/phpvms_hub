<?php

class Hub extends CodonModule 
{
	public function index()
	{
		$this->set('hubs', HubData::get_hub());
		$this->render('hub/index.tpl');
	}
	public function HubView($hubid='')
	{
		$hubs = HubData::getHubs($hubid);
		$this->set('hubs', $hubs);
		$this->render('hub/hubview.tpl');
	}
}
?>