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
     FireModeClass(0)=Class'tk_Mayhemweapons.MayhemAssaultFire'
     FireModeClass(1)=Class'tk_Mayhemweapons.MayhemAssaultGrenade'
     PickupClass=Class'tk_Mayhemweapons.MayhemAssaultRiflePickup'
     AttachmentClass=Class'tk_Mayhemweapons.MayhemAssaultAttachment'
     IconMaterial=Texture'tk_MayhemWeapons.Generic.HUD'
     ItemName="Mayhem Assault Rifle"
     Skins(0)=Texture'tk_MayhemWeapons.newar'
}
