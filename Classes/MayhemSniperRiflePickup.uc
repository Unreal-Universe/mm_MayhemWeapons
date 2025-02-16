class MayhemSniperRiflePickup extends SniperRiflePickup;

static function StaticPrecache(LevelInfo L)
{
    L.AddPrecacheMaterial(Texture'mm_MayhemWeapons.SniperTex');

    L.AddPrecacheMaterial(Material'XGameShaders.WeaponEnvShader');
    L.AddPrecacheMaterial(Texture'SniperBorder');
    L.AddPrecacheMaterial(Texture'SniperFocus');
	L.AddPrecacheMaterial(Texture'SniperArrows');	
	L.AddPrecacheMaterial(Texture'Engine.WhiteTexture');
    L.AddPrecacheMaterial(Texture'WeaponSkins.SniperScreen1');
    L.AddPrecacheMaterial(Texture'WeaponSkins.SniperScreen1Pan');
    L.AddPrecacheMaterial(Texture'WeaponSkins.SniperScreen2');
    L.AddPrecacheMaterial(Texture'XEffects.LightningChargeT');
    L.AddPrecacheMaterial(Texture'XEffects.pcl_BlueSpark');
    L.AddPrecacheMaterial(Texture'XEffects.LightningBoltT');
    L.AddPrecacheMaterial(Material'XGameShaders.fulloverlay');
    L.AddPrecacheMaterial(Material'XGameShaders.scanline');
    L.AddPrecacheMaterial(Material'EmitterTextures.LargeFlames');
	L.AddPrecacheStaticMesh(StaticMesh'WeaponStaticMesh.SniperRiflePickup');
}

simulated function UpdatePrecacheMaterials()
{
    Level.AddPrecacheMaterial(Texture'mm_MayhemWeapons.SniperTex');

	super.UpdatePrecacheMaterials();
}

defaultproperties
{
     InventoryType=Class'mm_MayhemWeapons.MayhemSniperRifle'
     PickupMessage="You got the Mayhem Lightning Gun."
     Skins(0)=Texture'mm_MayhemWeapons.SniperTex'
}
