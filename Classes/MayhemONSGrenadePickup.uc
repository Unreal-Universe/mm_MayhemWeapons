Class MayhemONSGrenadePickup extends ONSGrenadePickup;

static function StaticPrecache(LevelInfo L)
{
        L.AddPrecacheMaterial(Texture'mm_MayhemWeapons.NewGrenadeLauncher');
        L.AddPrecacheMaterial(Texture'VMWeaponsTX.PlayerWeaponsGroup.GrenadeTex');
	L.AddPrecacheMaterial(Texture'EpicParticles.Smoke.Smokepuff2');
	L.AddPrecacheMaterial(Texture'AW-2004Particles.Fire.GrenadeTest');
	L.AddPrecacheMaterial(Material'AW-2004Particles.Energy.AirBlast');

	L.AddPrecacheStaticMesh(StaticMesh'VMWeaponsSM.PlayerWeaponsGroup.VMGrenade');
	L.AddPrecacheStaticMesh(default.StaticMesh);
}

simulated function UpdatePrecacheMaterials()
{
        Level.AddPrecacheMaterial(Texture'mm_MayhemWeapons.NewGrenadeLauncher');
	super.UpdatePrecacheMaterials();
}

defaultproperties
{
     InventoryType=Class'mm_MayhemWeapons.MayhemONSGrenadeLauncher'
     PickupMessage="You got the Mayhem Grenade Launcher."
     Skins(0)=Texture'mm_MayhemWeapons.newgrenadelauncher'
}
