class MayhemShockRiflePickup extends ShockRiflePickup;

static function StaticPrecache(LevelInfo L)
{
    L.AddPrecacheMaterial(Material'ShockBeam_Rainbow1');
    L.AddPrecacheMaterial(Material'ShockBeam_Ice');
    L.AddPrecacheMaterial(Material'ShockBeam_Fire');
    L.AddPrecacheMaterial(Material'ShockBeamTex');
    L.AddPrecacheMaterial(Material'ShockBeam_Green');
    L.AddPrecacheMaterial(Material'ShockBeam_Holy');
    L.AddPrecacheMaterial(Material'ShockHeatDecalIce');
    L.AddPrecacheMaterial(Material'ShockHeatDecalFire');
    L.AddPrecacheMaterial(Material'ShockHeatDecalViolet');
    L.AddPrecacheMaterial(Material'ShockHeatDecalGreen');
    L.AddPrecacheMaterial(Material'ShockHeatDecalHoly');
    L.AddPrecacheMaterial(Material'mm_MayhemWeapons.Shock.shock_core_low_ICE');
    L.AddPrecacheMaterial(Material'mm_MayhemWeapons.Shock.shock_core_low_FIRE');
    L.AddPrecacheMaterial(Material'Shock_core_low');
    L.AddPrecacheMaterial(Material'mm_MayhemWeapons.Shock.shock_core_low_TOXIC');
    L.AddPrecacheMaterial(Material'mm_MayhemWeapons.Shock.shock_core_low_Desat');
    L.AddPrecacheMaterial(Material'mm_MayhemWeapons.ElecFBIce');
    L.AddPrecacheMaterial(Material'mm_MayhemWeapons.ElecFBFire');
    L.AddPrecacheMaterial(Material'mm_MayhemWeapons.ElecFBViolet');
    L.AddPrecacheMaterial(Material'mm_MayhemWeapons.ElecFBGreen');
    L.AddPrecacheMaterial(Material'mm_MayhemWeapons.ShockElecRingFB');
    L.AddPrecacheMaterial(Material'mm_MayhemWeapons.Shock.purple_line');
    L.AddPrecacheMaterial(Material'mm_MayhemWeapons.shock_core');
    L.AddPrecacheMaterial(Material'mm_MayhemWeapons.shock_Energy_green_faded');
    L.AddPrecacheMaterial(Material'mm_MayhemWeapons.shock_flash');
    L.AddPrecacheMaterial(Material'mm_MayhemWeapons.shock_flare_a');
    L.AddPrecacheMaterial(Material'mm_MayhemWeapons.shock_sparkle');
    L.AddPrecacheMaterial(Material'mm_MayhemWeapons.shock_gradient_b');
    L.AddPrecacheMaterial(Material'mm_MayhemWeapons.Shock_ring_a');
    L.AddPrecacheMaterial(Material'mm_MayhemWeapons.ShockComboFlash');
    L.AddPrecacheMaterial(Material'mm_MayhemWeapons.shock_muzflash_1st');
    L.AddPrecacheMaterial(Material'mm_MayhemWeapons.shock_muzflash_3rd');
    L.AddPrecacheMaterial(Texture'mm_MayhemWeapons.ShockRifleTex');

    L.AddPrecacheMaterial(Material'DeployableTex.C_T_Electricity_SG');
    L.AddPrecacheMaterial(Material'XEffects.SaDScorcht');
    L.AddPrecacheMaterial(Material'UT2004Weapons.ShockRipple');
    
    //L.AddPrecacheStaticMesh(StaticMesh'MayhemWeaponPickups.Weapons.MayhemShockPickupSM');
}

simulated function UpdatePrecacheMaterials()
{
    Level.AddPrecacheMaterial(Material'ShockBeam_Rainbow1');
    Level.AddPrecacheMaterial(Material'ShockBeam_Ice');
    Level.AddPrecacheMaterial(Material'ShockBeam_Fire');
    Level.AddPrecacheMaterial(Material'ShockBeamTex');
    Level.AddPrecacheMaterial(Material'ShockBeam_Green');
    Level.AddPrecacheMaterial(Material'ShockBeam_Holy');
    Level.AddPrecacheMaterial(Material'ShockHeatDecalIce');
    Level.AddPrecacheMaterial(Material'ShockHeatDecalFire');
    Level.AddPrecacheMaterial(Material'ShockHeatDecalViolet');
    Level.AddPrecacheMaterial(Material'ShockHeatDecalGreen');
    Level.AddPrecacheMaterial(Material'ShockHeatDecalHoly');
    Level.AddPrecacheMaterial(Material'mm_MayhemWeapons.Shock.shock_core_low_ICE');
    Level.AddPrecacheMaterial(Material'mm_MayhemWeapons.Shock.shock_core_low_FIRE');
    Level.AddPrecacheMaterial(Material'Shock_core_low');
    Level.AddPrecacheMaterial(Material'mm_MayhemWeapons.Shock.shock_core_low_TOXIC');
    Level.AddPrecacheMaterial(Material'mm_MayhemWeapons.Shock.shock_core_low_Desat');
    Level.AddPrecacheMaterial(Material'mm_MayhemWeapons.ElecFBIce');
    Level.AddPrecacheMaterial(Material'mm_MayhemWeapons.ElecFBFire');
    Level.AddPrecacheMaterial(Material'mm_MayhemWeapons.ElecFBViolet');
    Level.AddPrecacheMaterial(Material'mm_MayhemWeapons.ElecFBGreen');
    Level.AddPrecacheMaterial(Material'mm_MayhemWeapons.ShockElecRingFB');
    Level.AddPrecacheMaterial(Material'mm_MayhemWeapons.Shock.purple_line');
    Level.AddPrecacheMaterial(Material'mm_MayhemWeapons.shock_core');
    Level.AddPrecacheMaterial(Material'mm_MayhemWeapons.shock_Energy_green_faded');
    Level.AddPrecacheMaterial(Material'mm_MayhemWeapons.shock_flash');
    Level.AddPrecacheMaterial(Material'mm_MayhemWeapons.shock_flare_a');
    Level.AddPrecacheMaterial(Material'mm_MayhemWeapons.shock_sparkle');
    Level.AddPrecacheMaterial(Material'mm_MayhemWeapons.shock_gradient_b');
    Level.AddPrecacheMaterial(Material'mm_MayhemWeapons.Shock_ring_a');
    Level.AddPrecacheMaterial(Material'mm_MayhemWeapons.ShockComboFlash');
    Level.AddPrecacheMaterial(Material'mm_MayhemWeapons.shock_muzflash_1st');
    Level.AddPrecacheMaterial(Material'mm_MayhemWeapons.shock_muzflash_3rd');
    Level.AddPrecacheMaterial(Texture'mm_MayhemWeapons.ShockRifleTex');

    Level.AddPrecacheMaterial(Material'DeployableTex.C_T_Electricity_SG');
    Level.AddPrecacheMaterial(Material'XEffects.SaDScorcht');
    Level.AddPrecacheMaterial(Material'UT2004Weapons.ShockRipple');

        super(UTWeaponPickup).UpdatePrecacheMaterials();
}

defaultproperties
{
     InventoryType=Class'mm_MayhemWeapons.MayhemShockRifle'
     PickupMessage="You got the Mayhem Shock Rifle."
     Skins(0)=Texture'mm_MayhemWeapons.ShockRifleTex'
}
