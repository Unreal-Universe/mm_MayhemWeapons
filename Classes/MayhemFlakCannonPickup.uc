class MayhemFlakCannonPickup extends FlakCannonPickup;

static function StaticPrecache(LevelInfo L)
{
    L.AddPrecacheMaterial(Texture'mm_MayhemWeapons.FlakTrailTex');
    if ( L.DetailMode != DM_Low )
		L.AddPrecacheMaterial(Texture'XEffects.fexpt');
    L.AddPrecacheMaterial(Texture'XEffects.ExplosionFlashTex');
    L.AddPrecacheMaterial(Texture'XEffects.GoldGlow');
    L.AddPrecacheMaterial(Texture'mm_MayhemWeapons.FlakTex');
    L.AddPrecacheMaterial(Texture'WeaponSkins.FlakTex1');
    L.AddPrecacheMaterial(Texture'WeaponSkins.FlakChunkTex');
    L.AddPrecacheMaterial(Texture'XWeapons.NewFlakSkin');
    L.AddPrecacheMaterial(Texture'XGameShaders.flak_flash');
    	L.AddPrecacheStaticMesh(StaticMesh'WeaponStaticMesh.flakchunk');
	L.AddPrecacheStaticMesh(StaticMesh'WeaponStaticMesh.flakshell');
	L.AddPrecacheStaticMesh(StaticMesh'WeaponStaticMesh.FlakCannonPickup');
}

simulated function UpdatePrecacheMaterials()
{
    Level.AddPrecacheMaterial(Texture'mm_MayhemWeapons.FlakTrailTex');
    if ( Level.DetailMode != DM_Low )
		Level.AddPrecacheMaterial(Texture'XEffects.fexpt');
    Level.AddPrecacheMaterial(Texture'XEffects.ExplosionFlashTex');
    Level.AddPrecacheMaterial(Texture'XEffects.GoldGlow');
    Level.AddPrecacheMaterial(Texture'mm_MayhemWeapons.FlakTex');
    Level.AddPrecacheMaterial(Texture'WeaponSkins.FlakTex1');
    Level.AddPrecacheMaterial(Texture'WeaponSkins.FlakChunkTex');
    Level.AddPrecacheMaterial(Texture'XWeapons.NewFlakSkin');
    Level.AddPrecacheMaterial(Texture'XGameShaders.flak_flash');

    	super(UTWeaponPickup).UpdatePrecacheMaterials();
}

defaultproperties
{
     InventoryType=Class'mm_MayhemWeapons.MayhemFlakCannon'
     PickupMessage="You got the Mayhem Flak Cannon."
     Skins(0)=Texture'mm_MayhemWeapons.Flak3rdperson'
}
