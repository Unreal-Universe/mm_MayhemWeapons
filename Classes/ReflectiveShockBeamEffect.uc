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
     Core=Class'mm_MayhemWeapons.ColorShockExplosionCoreHoly'
     Scorch=Class'mm_MayhemWeapons.ReflectiveShockImpactScorch'
     Ring=Class'mm_MayhemWeapons.ReflectiveShockImpactRing'
     Flare=Class'mm_MayhemWeapons.ReflectiveShockImpactFlare'
     CoilClass=Class'mm_MayhemWeapons.ReflectiveShockCoilEffect'
     MuzFlashClass=Class'mm_MayhemWeapons.ReflectiveShockMuzFlash'
     MuzFlash3Class=Class'mm_MayhemWeapons.ReflectiveShockMuzFlash3rd'
     Texture=Texture'mm_MayhemWeapons.Effects.ShockBeam_Holy'
     Skins(0)=Texture'mm_MayhemWeapons.Effects.ShockBeam_Holy'
}
