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
     FireModeClass(0)=Class'tk_Mayhemweapons.MayhemONSMineThrowFire'
     FireModeClass(1)=Class'tk_Mayhemweapons.MayhemONSMineLayerAltFire'
     AmmoClass(0)=Class'tk_Mayhemweapons.MayhemONSMineAmmo'
     PickupClass=Class'tk_Mayhemweapons.MayhemONSMineLayerPickup'
     AttachmentClass=Class'tk_Mayhemweapons.MayhemONSMineLayerAttachment'
     IconMaterial=Texture'tk_MayhemWeapons.Generic.HUD'
     ItemName="Mayhem Mine Layer"
     Skins(0)=Texture'tk_MayhemWeapons.newminelayer'
}
