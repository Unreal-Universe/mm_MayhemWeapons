class MayhemRocketLauncherPickup extends RocketLauncherPickup;

static function StaticPrecache(LevelInfo L)
{
    L.AddPrecacheMaterial(Texture'mm_MayhemWeapons.RocketTex');
    L.AddPrecacheMaterial(Material'mm_MayhemWeapons.RocketShellTexGold');

    L.AddPrecacheMaterial(Material'XEffects.RocketFlare');
    L.AddPrecacheMaterial(Material'XEffects.SmokeAlphab_t');
    L.AddPrecacheMaterial(Material'EmitterTextures.rockchunks02');
    L.AddPrecacheMaterial(Material'EmitterTextures.fire3');
    L.AddPrecacheMaterial(Material'EmitterTextures.LargeFlames');
	L.AddPrecacheStaticMesh(StaticMesh'WeaponStaticMesh.rocketproj');
	L.AddPrecacheStaticMesh(StaticMesh'WeaponStaticMesh.RocketLauncherPickup');
}

simulated function UpdatePrecacheMaterials()
{
    Level.AddPrecacheMaterial(Texture'mm_MayhemWeapons.RocketTex');
    Level.AddPrecacheMaterial(Material'mm_MayhemWeapons.RocketShellTexGold');                                                                           // Add when ready
	super.UpdatePrecacheMaterials();
}

defaultproperties
{
     InventoryType=Class'mm_MayhemWeapons.MayhemRocketLauncher'
     PickupMessage="You got the Mayhem Rocket Launcher."
     Skins(0)=Texture'mm_MayhemWeapons.RocketTex'
}
