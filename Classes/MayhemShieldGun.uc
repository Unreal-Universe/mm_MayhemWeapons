Class MayhemShieldGun Extends ShieldGun
    HideDropDown;

var byte CurrentIndex;
var float AmmoShieldMult; // can be adjusted by berserk

replication
{
    /* the client can call this function on the server*/
    reliable if ( Role < ROLE_Authority )
        ToggleMayhemWeaponMode;

    /*Server replicates this to the client whenever there is a status change*/
    reliable if ( bNetDirty  && (Role == ROLE_Authority) )
        CurrentIndex;
}

function AdjustPlayerDamage( out int Damage, Pawn InstigatedBy, Vector HitLocation,
						         out Vector Momentum, class<DamageType> DamageType)
{
    local int Drain;
	local vector Reflect;
    local vector HitNormal;
    local float DamageMax;      // Maximum that can be absorbed.

        DamageMax = 200.0;                // 100.0   // Max Absorption for Non-fall Damage
	if ( DamageType == class'Fell' )
		DamageMax = 50.0;         // 20.0    // Max Absorption for fall damage
    else if( !DamageType.default.bArmorStops || (DamageType == class'DamTypeShieldImpact' && InstigatedBy == Instigator) )
        return;

    if ( CheckReflect(HitLocation, HitNormal, 0) )
    {
        Drain = Min( AmmoAmount(1)*AmmoShieldMult, Damage );
		Drain = Min(Drain,DamageMax);
	    Reflect = MirrorVectorByNormal( Normal(Location - HitLocation), Vector(Instigator.Rotation) );
        
        //Log("Damage Dealt:"@Damage$", Absorbed:"@Drain);
        Damage -= Drain;  // Damage Reduced here
        //Log("Total Inflicted:"@Damage);

        Momentum *= 1.25; // Momentum Scaled
        if ( (Instigator != None) && (Instigator.PlayerReplicationInfo != None) && (Instigator.PlayerReplicationInfo.HasFlag != None) )
        {
		Drain /= (AmmoShieldMult / 2);
                Drain = Min(AmmoAmount(1), Drain);
	}
        else
        {
		Drain /= AmmoShieldMult;
	}

        //log("Ammo Drained:"@Drain);
	ConsumeAmmo(1,Drain);
	DoReflectEffect(Drain);
    }
}

Function SetShielding(Float SMult) // Called by berserk functions in alt fire.
{
    AmmoShieldMult = Default.AmmoShieldMult * SMult;
}

simulated function String GetHumanReadableName()
{
    CurrentIndex = 0;
    return Super.GetHumanReadableName();
}

exec function ToggleMayhemWeaponMode()
{
    PlayerController(Instigator.Controller).ClientPlaySound(sound'Menusounds.selectj');
    Instigator.ReceiveLocalizedMessage( class'MessageModeSwitchDummy', CurrentIndex);
    CurrentIndex = (CurrentIndex+1) % class'MessageModeSwitchDummy'.Default.ModeMessage.Length;
}

defaultproperties
{
     AmmoShieldMult=3.500000
     FireModeClass(0)=Class'mm_MayhemWeapons.MayhemShieldFire'
     FireModeClass(1)=Class'mm_MayhemWeapons.MayhemShieldAltFire'
     PickupClass=Class'mm_MayhemWeapons.MayhemShieldGunPickup'
     AttachmentClass=Class'mm_MayhemWeapons.MayhemShieldAttachment'
     IconMaterial=Texture'mm_MayhemWeapons.Generic.HUD'
     ItemName="Mayhem Shield Gun"
     Skins(0)=Texture'mm_MayhemWeapons.newshield'
}
