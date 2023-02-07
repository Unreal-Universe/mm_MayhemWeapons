class ReflectiveShockBeamEffect extends ShockBeamEffect;

var class<ColorShockExplosionCore> Core;
var class<ReflectiveShockImpactScorch> Scorch;
Var class<ReflectiveShockImpactRing> Ring;
var class<ReflectiveShockImpactFlare> Flare;
const CM = Class'ColorManager';

simulated function SpawnImpactEffects(rotator HitRot, vector EffectLoc)
{
    Spawn(Flare,,, EffectLoc, HitRot);
    Spawn(Ring,,, EffectLoc, HitRot);
    Spawn(Scorch,,, EffectLoc, Rotator(-HitNormal));
    Spawn(Core,,, EffectLoc+HitNormal*8, HitRot);
}

defaultproperties
{
     Core=Class'tk_Mayhemweapons.ColorShockExplosionCoreHoly'
     Scorch=Class'tk_Mayhemweapons.ReflectiveShockImpactScorch'
     Ring=Class'tk_Mayhemweapons.ReflectiveShockImpactRing'
     Flare=Class'tk_Mayhemweapons.ReflectiveShockImpactFlare'
     CoilClass=Class'tk_Mayhemweapons.ReflectiveShockCoilEffect'
     MuzFlashClass=Class'tk_Mayhemweapons.ReflectiveShockMuzFlash'
     MuzFlash3Class=Class'tk_Mayhemweapons.ReflectiveShockMuzFlash3rd'
     Texture=Texture'tk_MayhemWeapons.Effects.ShockBeam_Holy'
     Skins(0)=Texture'tk_MayhemWeapons.Effects.ShockBeam_Holy'
}
