class ColorShockCombo extends ShockCombo;

Var Class<ColorShockComboExpRing> ExpRing;
Var Class<ColorShockComboFlare> ComboFlare;
Var Class<ColorShockComboCore> Core;
Var Class<ColorShockComboSphereDark> SphereDark;
var Class<ColorShockComboVortex> Vortex;
Var Class<ColorShockComboWiggles> Wiggles;
Var Class<ColorShockComboFlash> Flash;

simulated Function PostBeginPlay()
{
    Super(Actor).PostBeginPlay();

    if (Level.NetMode != NM_DedicatedServer)
    {
        Spawn(ExpRing);
        Flare = Spawn(ComboFlare);
        Spawn(Core);
        Spawn(SphereDark);
        Spawn(Vortex);         // Mesh
        Spawn(Wiggles);
        Spawn(Flash);
    }
}

defaultproperties
{
     ExpRing=Class'mm_MayhemWeapons.ColorShockComboExpRing'
     ComboFlare=Class'mm_MayhemWeapons.ColorShockComboFlare'
     Core=Class'mm_MayhemWeapons.ColorShockComboCore'
     SphereDark=Class'mm_MayhemWeapons.ColorShockComboSphereDark'
     Vortex=Class'mm_MayhemWeapons.ColorShockComboVortex'
     Wiggles=Class'mm_MayhemWeapons.ColorShockComboWiggles'
     Flash=Class'mm_MayhemWeapons.ColorShockComboFlash'
}
