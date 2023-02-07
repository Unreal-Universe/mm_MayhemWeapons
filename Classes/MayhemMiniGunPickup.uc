class MayhemMinigunPickup extends MinigunPickup;

static function StaticPrecache(LevelInfo L)
{
    L.AddPrecacheMaterial(Texture'XEffects.ShellCasingTex');
    L.AddPrecacheMaterial(Texture'AW-2004Explosions.Part_explode2s');
    L.AddPrecacheMaterial(Texture'AW-2004Particles.TracerShot');
    L.AddPrecacheMaterial(Texture'tk_MayhemWeapons.newminigun');
	L.AddPrecacheStaticMesh(StaticMesh'WeaponStaticMesh.MinigunPickup');
}

simulated function UpdatePrecacheMaterials()
{
    Level.AddPrecacheMaterial(Texture'tk_MayhemWeapons.newminigun');

        super.UpdatePrecacheMaterials();
}

defaultproperties
{
     InventoryType=Class'tk_Mayhemweapons.MayhemMiniGun'
     PickupMessage="You got the Mayhem Minigun."
     Skins(0)=Texture'tk_MayhemWeapons.newminigun'
}
