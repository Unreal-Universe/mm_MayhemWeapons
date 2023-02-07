class MayhemONSMineLayerPickup extends ONSMineLayerPickup;

static function StaticPrecache(LevelInfo L)
{
        L.AddPrecacheMaterial(Texture'tk_MayhemWeapons.empblue');
        L.AddPrecacheMaterial(Texture'tk_MayhemWeapons.empred');
        L.AddPrecacheMaterial(Texture'tk_MayhemWeapons.newMineLayer');
        L.AddPrecacheMaterial(Texture'tk_MayhemWeapons.Mines.ring');

        L.AddPrecacheMaterial(Texture'VMWeaponsTX.PlayerWeaponsGroup.SpiderMineTEX');
	L.AddPrecacheMaterial(Shader'VMWeaponsTX.PlayerWeaponsGroup.ParasiteMineImplantTEXshad');
	L.AddPrecacheMaterial(Texture'VMWeaponsTX.PlayerWeaponsGroup.SpiderMineBLUETEX');
	L.AddPrecacheMaterial(Texture'XGameShaders.WeaponShaders.bio_flash');
	L.AddPrecacheMaterial(Texture'AW-2004Particles.Weapons.BeamFragment');
	L.AddPrecacheStaticMesh(default.StaticMesh);
}

simulated function UpdatePrecacheMaterials()
{
	Level.AddPrecacheMaterial(Texture'tk_MayhemWeapons.empblue');
        Level.AddPrecacheMaterial(Texture'tk_MayhemWeapons.empred');
        Level.AddPrecacheMaterial(Texture'tk_MayhemWeapons.newMineLayer');
        Level.AddPrecacheMaterial(Texture'tk_MayhemWeapons.Mines.ring');
        super.UpdatePrecacheMaterials();
}

defaultproperties
{
     InventoryType=Class'tk_Mayhemweapons.MayhemONSMineLayer'
     PickupMessage="You got the Mayhem Mine Layer."
     Skins(0)=Texture'tk_MayhemWeapons.newminelayer'
}
