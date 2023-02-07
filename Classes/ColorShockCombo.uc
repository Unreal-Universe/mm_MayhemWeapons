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
     ExpRing=Class'tk_Mayhemweapons.ColorShockComboExpRing'
     ComboFlare=Class'tk_Mayhemweapons.ColorShockComboFlare'
     Core=Class'tk_Mayhemweapons.ColorShockComboCore'
     SphereDark=Class'tk_Mayhemweapons.ColorShockComboSphereDark'
     Vortex=Class'tk_Mayhemweapons.ColorShockComboVortex'
     Wiggles=Class'tk_Mayhemweapons.ColorShockComboWiggles'
     Flash=Class'tk_Mayhemweapons.ColorShockComboFlash'
}
