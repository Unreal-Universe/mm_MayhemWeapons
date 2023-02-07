Class MayhemONSGrenadePickup extends ONSGrenadePickup;

static function StaticPrecache(LevelInfo L)
{
        L.AddPrecacheMaterial(Texture'tk_MayhemWeapons.NewGrenadeLauncher');
        L.AddPrecacheMaterial(Texture'VMWeaponsTX.PlayerWeaponsGroup.GrenadeTex');
	L.AddPrecacheMaterial(Texture'EpicParticles.Smoke.Smokepuff2');
	L.AddPrecacheMaterial(Texture'AW-2004Particles.Fire.GrenadeTest');
	L.AddPrecacheMaterial(Material'AW-2004Particles.Energy.AirBlast');

	L.AddPrecacheStaticMesh(StaticMesh'VMWeaponsSM.PlayerWeaponsGroup.VMGrenade');
	L.AddPrecacheStaticMesh(default.StaticMesh);
}

simulated function UpdatePrecacheMaterials()
{
        Level.AddPrecacheMaterial(Texture'tk_MayhemWeapons.NewGrenadeLauncher');
	super.UpdatePrecacheMaterials();
}

defaultproperties
{
     InventoryType=Class'tk_Mayhemweapons.MayhemONSGrenadeLauncher'
     PickupMessage="You got the Mayhem Grenade Launcher."
     Skins(0)=Texture'tk_MayhemWeapons.newgrenadelauncher'
}
