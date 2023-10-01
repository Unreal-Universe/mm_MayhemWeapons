class MayhemMinigunPickup extends MinigunPickup;

static function StaticPrecache(LevelInfo L)
{
    L.AddPrecacheMaterial(Texture'XEffects.ShellCasingTex');
    L.AddPrecacheMaterial(Texture'AW-2004Explosions.Part_explode2s');
    L.AddPrecacheMaterial(Texture'AW-2004Particles.TracerShot');
    L.AddPrecacheMaterial(Texture'mm_MayhemWeapons.newminigun');
	L.AddPrecacheStaticMesh(StaticMesh'WeaponStaticMesh.MinigunPickup');
}

simulated function UpdatePrecacheMaterials()
{
    Level.AddPrecacheMaterial(Texture'mm_MayhemWeapons.newminigun');

        super.UpdatePrecacheMaterials();
}

defaultproperties
{
     InventoryType=Class'mm_MayhemWeapons.MayhemMiniGun'
     PickupMessage="You got the Mayhem Minigun."
     Skins(0)=Texture'mm_MayhemWeapons.newminigun'
}
