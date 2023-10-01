Class MayhemAssaultRifle Extends AssaultRifle
    HideDropDown;

var byte CurrentIndex;

replication
{
    /* the client can call this function on the server*/
    reliable if ( Role < ROLE_Authority )
        ToggleMayhemWeaponMode;

    /*Server replicates this to the client whenever there is a status change*/
    reliable if ( bNetDirty  && (Role == ROLE_Authority) )
        CurrentIndex;
}

simulated function String GetHumanReadableName()
{
    Super.GetHumanReadableName();
    CurrentIndex = 0;
    return ItemName;
}

exec function ToggleMayhemWeaponMode()
{
    if ( PlayerController(Instigator.Controller) != None )
        PlayerController(Instigator.Controller).ClientPlaySound(sound'Menusounds.selectj');
    Instigator.ReceiveLocalizedMessage( class'MessageModeSwitchDummy', CurrentIndex);
    CurrentIndex = (CurrentIndex+1) % class'MessageModeSwitchDummy'.Default.ModeMessage.Length;
}

defaultproperties
{
     FireModeClass(0)=Class'mm_MayhemWeapons.MayhemAssaultFire'
     FireModeClass(1)=Class'mm_MayhemWeapons.MayhemAssaultGrenade'
     PickupClass=Class'mm_MayhemWeapons.MayhemAssaultRiflePickup'
     AttachmentClass=Class'mm_MayhemWeapons.MayhemAssaultAttachment'
     IconMaterial=Texture'mm_MayhemWeapons.Generic.HUD'
     ItemName="Mayhem Assault Rifle"
     Skins(0)=Texture'mm_MayhemWeapons.newar'
}
