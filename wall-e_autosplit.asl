state("WALL-E")
{
	int endscreen: 0x001DD040, 0xB8;
	int saving: 0x4C6E58;
	//byte instage: 0x0052E740, 0x8, 0xAB4, 0x48, 0x34, 0x394;
	int cutscene: 0x4F48B8;
	int loading: 0x001DA598, 0x33C;
}

startup
{
	settings.Add("subsplits", true, "Enable Mid-Level Subsplits");
	settings.Add("load_removal", false, "Enable Load Removal");

	refreshRate = 120;
}

split
{
	if (settings["subsplits"]) {
		if (old.saving == 512 && current.saving != 512){
			return true;
		}
	}

	else {
		if (old.saving == 512 && current.saving != 512 && (current.endscreen == 1769239105 || current.endscreen == 1702130241)){
			return true;
		}
	}
}

isLoading
{
	if(settings["load_removal"]) {
		//if (current.saving == 4096 || (current.instage == 1 && current.cutscene != 258828840 && current.cutscene != 2590921123 && current.cutscene != 258829920 && current.cutscene != 258633264)) {
		if (current.saving == 4096 || (current.loading == 1041865114 || current.loading == 1056964608)) {
			return true;
		}
	
		else {
			return false;
		}
	}
}
