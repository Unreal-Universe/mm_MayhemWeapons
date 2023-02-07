class ReflectiveLinkAltFire extends LinkAltFire;

var FinalBlend FinalBlendEffect;
var bool bRandomColor;
var byte RandPick; // index of Projectile chosen in random function

const CM = class'ColorManager';

event ModeDoFire()
{
    if (!AllowFire())
        return;
    if (bRandomColor)
        RandPick = Rand(7);

    // don't even spawn on server
    if ( (Level.NetMode != NM_DedicatedServer) && (AIController(Instigator.Controller) == None) )
    {
        FlashEmitterClass = CM.Default.LinkProjFlash_Class[RandPick];
        FlashEmitter = None;
        if ( (FlashEmitterClass != None) && ((FlashEmitter == None) || FlashEmitter.bDeleteMe) )
        {
            FlashEmitter = Weapon.Spawn(FlashEmitterClass);
        }
    }
    Super(ProjectileFire).ModeDoFire();
}

function FlashMuzzleFlash()
{
    if (FlashEmitter != None)
        FlashEmitter.Skins[0] = FinalBlendEffect;
    Super(WeaponFire).FlashMuzzleFlash();
}

function Projectile SpawnProjectile(Vector Start, Rotator Dir)
{
    local LinkProjectile Proj;

    Start += Vector(Dir) * 10.0 * LinkGun(Weapon).Links;

    if ( Proj == None )
        Proj = Weapon.Spawn(CM.Default.LinkProj_Class[RandPick],,, Start, Dir);

    if ( Proj != None )
    {
	Proj.Links = LinkGun(Weapon).Links;
	Proj.LinkAdjust();
    }
    return Proj;
}

defaultproperties
{
     FinalBlendEffect=FinalBlend'tk_MayhemWeapons.Link.LinkMuzProjGreenFB'
     RandPick=1
     AmmoClass=Class'tk_Mayhemweapons.MayhemLinkAmmo'
     ProjectileClass=Class'tk_Mayhemweapons.ReflectiveLinkProjectile'
     FlashEmitterClass=Class'tk_Mayhemweapons.ReflectiveLinkMuzFlashProj1st'
}
