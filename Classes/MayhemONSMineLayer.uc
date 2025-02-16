class MayhemONSMineLayer extends ONSMineLayer
      HideDropDown;

var Sound ModeCycleSound;
var byte CurrentMineIndex;

replication
{
    /* the client can call this function on the server*/
    reliable if ( Role < ROLE_Authority )
        ToggleMayhemWeaponMode;

    /*Server replicates this to the client whenever there is a status change*/
    reliable if ( bNetDirty && (Role == ROLE_Authority) )
        CurrentMineIndex;
}

simulated function BringUp(optional Weapon PrevWeapon)
{
    Super.BringUp(PrevWeapon);
    if ( Instigator.IsHumanControlled() )
        Instigator.ReceiveLocalizedMessage( class'MessageModeSwitchAbstract', CurrentMineIndex,,, Class );
}

exec function ToggleMayhemWeaponMode()
{
    local MayhemONSMineThrowFire P_Fire;

    if ( Firemode[1].bIsFiring )
        Return;

    P_Fire = MayhemONSMineThrowFire(FireMode[0]);

    CurrentMineIndex = (Int(P_Fire.MineType)+1) % P_Fire.EMineType.EnumCount;

    P_Fire.MineType = EMineType(CurrentMineIndex);

    // Message & Sound
    Instigator.ReceiveLocalizedMessage( class'MessageModeSwitchAbstract', CurrentMineIndex,,, class );
    PlayerController(Instigator.Controller).ClientPlaySound(ModeCycleSound);
}

defaultproperties
{
     ModeCycleSound=Sound'WeaponSounds.BaseGunTech.BReload4'
     MaxMines=12
     FireModeClass(0)=Class'mm_MayhemWeapons.MayhemONSMineThrowFire'
     FireModeClass(1)=Class'mm_MayhemWeapons.MayhemONSMineLayerAltFire'
     AmmoClass(0)=Class'mm_MayhemWeapons.MayhemONSMineAmmo'
     PickupClass=Class'mm_MayhemWeapons.MayhemONSMineLayerPickup'
     AttachmentClass=Class'mm_MayhemWeapons.MayhemONSMineLayerAttachment'
     IconMaterial=Texture'mm_MayhemWeapons.Generic.HUD'
     ItemName="Mayhem Mine Layer"
     Skins(0)=Texture'mm_MayhemWeapons.newminelayer'
}
