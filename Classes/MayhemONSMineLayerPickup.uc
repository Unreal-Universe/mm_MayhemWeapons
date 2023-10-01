class MayhemONSMineLayerPickup extends ONSMineLayerPickup;

static function StaticPrecache(LevelInfo L)
{
        L.AddPrecacheMaterial(Texture'mm_MayhemWeapons.empblue');
        L.AddPrecacheMaterial(Texture'mm_MayhemWeapons.empred');
        L.AddPrecacheMaterial(Texture'mm_MayhemWeapons.newMineLayer');
        L.AddPrecacheMaterial(Texture'mm_MayhemWeapons.Mines.ring');

        L.AddPrecacheMaterial(Texture'VMWeaponsTX.PlayerWeaponsGroup.SpiderMineTEX');
	L.AddPrecacheMaterial(Shader'VMWeaponsTX.PlayerWeaponsGroup.ParasiteMineImplantTEXshad');
	L.AddPrecacheMaterial(Texture'VMWeaponsTX.PlayerWeaponsGroup.SpiderMineBLUETEX');
	L.AddPrecacheMaterial(Texture'XGameShaders.WeaponShaders.bio_flash');
	L.AddPrecacheMaterial(Texture'AW-2004Particles.Weapons.BeamFragment');
	L.AddPrecacheStaticMesh(default.StaticMesh);
}

simulated function UpdatePrecacheMaterials()
{
	Level.AddPrecacheMaterial(Texture'mm_MayhemWeapons.empblue');
        Level.AddPrecacheMaterial(Texture'mm_MayhemWeapons.empred');
        Level.AddPrecacheMaterial(Texture'mm_MayhemWeapons.newMineLayer');
        Level.AddPrecacheMaterial(Texture'mm_MayhemWeapons.Mines.ring');
        super.UpdatePrecacheMaterials();
}

defaultproperties
{
     InventoryType=Class'mm_MayhemWeapons.MayhemONSMineLayer'
     PickupMessage="You got the Mayhem Mine Layer."
     Skins(0)=Texture'mm_MayhemWeapons.newminelayer'
}
