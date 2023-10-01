class ColorManager extends Mutator Abstract;

/*
    This Class is mostly a reference device for several weapons in the mutator.
    It stores Colors that are commonly used in the mutator, as well as some classes,
    damagetypes, and other such things.
*/

//Enums------------------------
enum EBankColor
{
    BANK_IceBlue,
    BANK_NeonViolet,
    BANK_NeonGreen,
    BANK_NeonRed,
    BANK_Violet,
    BANK_Red,
    BANK_Blue,
    BANK_Green,
    BANK_Yellow,
    BANK_Orange,
    BANK_White
};

//Structs----------------------
struct LightColor
{
   var byte Hue, Saturation;
};

//Translators------------------
/*   Some weapons produce lesser variety of colors, and the colors produced do not
   match the correct indexes of the colors used in the banks.  The translators 
   use that incorrect index given by whatever function, to reference the correct
   element which contains the appropriate matching index for the needed color.      */
var Array<byte> ShockTranslator;
var Array<byte> LinkTranslator;

// Reference Class Names
Var Class<LinkProjectile> LinkProj_Class[7];
Var Class<ReflectiveShockProjectile> ShockProj_Class[6];
Var Class<ReflectiveShockProjectileHoming> Hom_ShockProj_Class[6];
Var Class<ShockBeamEffect> ShockBeam_Class[6];
Var Class<ShockBeamEffect> Rd_ShockBeam_Class[6];
Var Class<WeaponAttachment> ShockAttachment_Class[6];
Var class<DamageType> DamageTypeBeam_Class[6];
var class<DamageType> DamageTypeLightning_Class[6];
var class<xEmitter> ShockBeamFlashEmitter_Class[6];
var class<xEmitter> ShockProjFlashEmitter_Class[6];
var class<xEmitter> LinkProjFlash_Class[7];
var class<BioGlob> GlobClass[3];
var class<RocketProj> RocketClass[3];

//Textures
var Array<Texture> ShockBeamTX;
//Color
var Array<Color> ColorBank;
var Array<string> ColorName;
var Array<LightColor> LightBank;

//===============================================================================
// Shock Rifle Color Settings
//===============================================================================
Simulated Static Final Function AssignShockRifleColors(string sColor) // Yes, it deserves its own function!
{
    local byte i;
    Switch(sColor)
    {
        Case "Ice Blue":     i = 0;  Break;
        Case "Neon Red":     i = 1;  Break;
        Case "Neon Violet":  i = 2;  Break;
        Case "Neon Green":   i = 3;  Break;
        Case "Holy White":   i = 4;  Break;
        Default:             i = 5;  Break;
    }
    class'MayhemShockRifle'.Default.RandPick = i;
}

//===============================================================================
// Link Gun Color Settings
//===============================================================================
Simulated Static Final Function AssignLinkGunColor(String sColor)
{
    local byte i;
    switch(sColor)
    {
        Case "Ice Blue":    i = 0;  Break;
        Case "Neon Red":    i = 1;  Break;
        Case "Neon Violet": i = 2;  Break;
        Case "Neon Green":  i = 3;  Break;
        case "Orange":      i = 4;  Break;
        case "Yellow":      i = 5;  Break;
        Default:            i = 6;  Break;
    }
    class'ReflectiveLinkAltFire'.Default.RandPick = i;
}

simulated static Final function RangeVector AssignColorRange(Color C)
{                                                            
    local RangeVector RV;

    RV.X.Min = float(C.R) / 255.0;
    RV.Y.Min = float(C.G) / 255.0;
    RV.Z.Min = float(C.B) / 255.0;
    RV.X.Max = RV.X.Min;
    RV.Y.Max = RV.Y.Min;
    RV.Z.Max = RV.Z.Min;

    return RV;
}

/*Simulated Static Final Function Color AssignColorFromRange(RangeVector RV)
{
    Return class'Canvas'.Static.MakeColor(RV.X.Min * 255, RV.Y.Min * 255, RV.Z.Min * 255 );
}   */

simulated Static function byte AssignColorIndex(string sColor)
{
    local byte i;
    While (sColor != Default.ColorName[i] && i < 13)   {  i++;  }
    Return i;
}

simulated Static function Color AssignBankColor(string sColor)
{
    local byte i;
    While (sColor != Default.ColorName[i] && i < 10)   {  i++;  }
    Return Default.ColorBank[i];
}

simulated Static Final Function Color AssignRandomColor()
{
    Return class'Canvas'.Static.MakeColor( Rand(256), Rand(256), Rand(256) );
}

/*simulated static function AssignBankLight(string sColor)
{
    local byte i;
    While (sColor != Default.ColorName[i] && i < 10)   {  i++;  }
    Return Default.LightBank[i];
} */                              

Simulated Static Function SetRandomTrailColor()
{
    class'ReflectiveFlakTrail'.default.mColorRange[0] = AssignRandomColor();
    class'ReflectiveFlakTrail'.default.mColorRange[1] = class'ReflectiveFlakTrail'.default.mColorRange[0];
}

//======================================================================
// DefaultProperties
//======================================================================

defaultproperties
{
     ShockTranslator(1)=3
     ShockTranslator(2)=4
     ShockTranslator(3)=2
     ShockTranslator(4)=10
     LinkTranslator(1)=3
     LinkTranslator(2)=4
     LinkTranslator(3)=2
     LinkTranslator(4)=9
     LinkTranslator(5)=8
     LinkTranslator(6)=10
     LinkProj_Class(0)=Class'mm_MayhemWeapons.ColorLinkProjBlue'
     LinkProj_Class(1)=Class'mm_MayhemWeapons.ColorLinkProjRed'
     LinkProj_Class(2)=Class'mm_MayhemWeapons.ColorLinkProjViolet'
     LinkProj_Class(3)=Class'mm_MayhemWeapons.ColorLinkProjGreen'
     LinkProj_Class(4)=Class'mm_MayhemWeapons.ColorLinkProjOrange'
     LinkProj_Class(5)=Class'mm_MayhemWeapons.ColorLinkProjYellow'
     LinkProj_Class(6)=Class'mm_MayhemWeapons.ColorLinkProjWhite'
     ShockProj_Class(0)=Class'mm_MayhemWeapons.ReflectiveShockProjectileIce'
     ShockProj_Class(1)=Class'mm_MayhemWeapons.ReflectiveShockProjectileFire'
     ShockProj_Class(2)=Class'mm_MayhemWeapons.ReflectiveShockProjectileViolet'
     ShockProj_Class(3)=Class'mm_MayhemWeapons.ReflectiveShockProjectileToxic'
     ShockProj_Class(4)=Class'mm_MayhemWeapons.ReflectiveShockProjectileHoly'
     ShockProj_Class(5)=Class'mm_MayhemWeapons.ReflectiveShockProjectileRainbow'
     Hom_ShockProj_Class(0)=Class'mm_MayhemWeapons.ReflectiveShockProjectileHomingIce'
     Hom_ShockProj_Class(1)=Class'mm_MayhemWeapons.ReflectiveShockProjectileHomingFire'
     Hom_ShockProj_Class(2)=Class'mm_MayhemWeapons.ReflectiveShockProjectileHomingViolet'
     Hom_ShockProj_Class(3)=Class'mm_MayhemWeapons.ReflectiveShockProjectileHomingToxic'
     Hom_ShockProj_Class(4)=Class'mm_MayhemWeapons.ReflectiveShockProjectileHomingHoly'
     Hom_ShockProj_Class(5)=Class'mm_MayhemWeapons.ReflectiveShockProjectileHomingRainbow'
     ShockBeam_Class(0)=Class'mm_MayhemWeapons.ReflectiveShockBeamEffectIce'
     ShockBeam_Class(1)=Class'mm_MayhemWeapons.ReflectiveShockBeamEffectFire'
     ShockBeam_Class(2)=Class'mm_MayhemWeapons.ReflectiveShockBeamEffectViolet'
     ShockBeam_Class(3)=Class'mm_MayhemWeapons.ReflectiveShockBeamEffectToxic'
     ShockBeam_Class(4)=Class'mm_MayhemWeapons.ReflectiveShockBeamEffectHoly'
     ShockBeam_Class(5)=Class'mm_MayhemWeapons.ReflectiveShockBeamEffectRainbow'
     Rd_ShockBeam_Class(0)=Class'mm_MayhemWeapons.ReflectedShockBeamEffectIce'
     Rd_ShockBeam_Class(1)=Class'mm_MayhemWeapons.ReflectedShockBeamEffectFire'
     Rd_ShockBeam_Class(2)=Class'mm_MayhemWeapons.ReflectedShockBeamEffectViolet'
     Rd_ShockBeam_Class(3)=Class'mm_MayhemWeapons.ReflectedShockBeamEffectToxic'
     Rd_ShockBeam_Class(4)=Class'mm_MayhemWeapons.ReflectedShockBeamEffectHoly'
     Rd_ShockBeam_Class(5)=Class'mm_MayhemWeapons.ReflectedShockBeamEffectRainbow'
     ShockAttachment_Class(0)=Class'mm_MayhemWeapons.ReflectiveShockAttachmentIce'
     ShockAttachment_Class(1)=Class'mm_MayhemWeapons.ReflectiveShockAttachmentFire'
     ShockAttachment_Class(2)=Class'mm_MayhemWeapons.ReflectiveShockAttachmentViolet'
     ShockAttachment_Class(3)=Class'mm_MayhemWeapons.ReflectiveShockAttachmentToxic'
     ShockAttachment_Class(4)=Class'mm_MayhemWeapons.ReflectiveShockAttachmentHoly'
     ShockAttachment_Class(5)=Class'mm_MayhemWeapons.ReflectiveShockAttachmentRainbow'
     DamageTypeBeam_Class(0)=Class'mm_MayhemWeapons.DamageTypeBeamIce'
     DamageTypeBeam_Class(1)=Class'mm_MayhemWeapons.DamageTypeBeamFire'
     DamageTypeBeam_Class(2)=Class'mm_MayhemWeapons.DamageTypeBeamViolet'
     DamageTypeBeam_Class(3)=Class'mm_MayhemWeapons.DamageTypeBeamToxic'
     DamageTypeBeam_Class(4)=Class'mm_MayhemWeapons.DamageTypeBeamHoly'
     DamageTypeBeam_Class(5)=Class'mm_MayhemWeapons.DamageTypeBeamRainbow'
     DamageTypeLightning_Class(0)=Class'mm_MayhemWeapons.DamageTypeLightning'
     DamageTypeLightning_Class(1)=Class'mm_MayhemWeapons.DamageTypeLightningBranch'
     ShockBeamFlashEmitter_Class(0)=Class'mm_MayhemWeapons.ReflectiveShockBeamMuzFlashIce'
     ShockBeamFlashEmitter_Class(1)=Class'mm_MayhemWeapons.ReflectiveShockBeamMuzFlashFire'
     ShockBeamFlashEmitter_Class(2)=Class'mm_MayhemWeapons.ReflectiveShockBeamMuzFlashViolet'
     ShockBeamFlashEmitter_Class(3)=Class'mm_MayhemWeapons.ReflectiveShockBeamMuzFlashToxic'
     ShockBeamFlashEmitter_Class(4)=Class'mm_MayhemWeapons.ReflectiveShockBeamMuzFlashHoly'
     ShockBeamFlashEmitter_Class(5)=Class'mm_MayhemWeapons.ReflectiveShockBeamMuzFlashRainbow'
     ShockProjFlashEmitter_Class(0)=Class'mm_MayhemWeapons.ReflectiveShockProjMuzFlashIce'
     ShockProjFlashEmitter_Class(1)=Class'mm_MayhemWeapons.ReflectiveShockProjMuzFlashFire'
     ShockProjFlashEmitter_Class(2)=Class'mm_MayhemWeapons.ReflectiveShockProjMuzFlashViolet'
     ShockProjFlashEmitter_Class(3)=Class'mm_MayhemWeapons.ReflectiveShockProjMuzFlashToxic'
     ShockProjFlashEmitter_Class(4)=Class'mm_MayhemWeapons.ReflectiveShockProjMuzFlashHoly'
     ShockProjFlashEmitter_Class(5)=Class'mm_MayhemWeapons.ReflectiveShockProjMuzFlashRainbow'
     LinkProjFlash_Class(0)=Class'mm_MayhemWeapons.ReflectiveLinkMuzFlashProj1stBlue'
     LinkProjFlash_Class(1)=Class'mm_MayhemWeapons.ReflectiveLinkMuzFlashProj1stRed'
     LinkProjFlash_Class(2)=Class'mm_MayhemWeapons.ReflectiveLinkMuzFlashProj1stViolet'
     LinkProjFlash_Class(3)=Class'mm_MayhemWeapons.ReflectiveLinkMuzFlashProj1stGreen'
     LinkProjFlash_Class(4)=Class'mm_MayhemWeapons.ReflectiveLinkMuzFlashProj1stOrange'
     LinkProjFlash_Class(5)=Class'mm_MayhemWeapons.ReflectiveLinkMuzFlashProj1stYellow'
     LinkProjFlash_Class(6)=Class'mm_MayhemWeapons.ReflectiveLinkMuzFlashProj1stWhite'
     GlobClass(0)=Class'mm_MayhemWeapons.MayhemBioGlobStandard'
     GlobClass(1)=Class'mm_MayhemWeapons.MayhemBioGlob'
     GlobClass(2)=Class'mm_MayhemWeapons.MayhemBioGlobSplitter'
     RocketClass(0)=Class'mm_MayhemWeapons.RocketProjFlaming'
     RocketClass(1)=Class'mm_MayhemWeapons.RocketProjFragmentation'
     RocketClass(2)=Class'mm_MayhemWeapons.RocketProjStandard'
     ShockBeamTX(0)=Texture'mm_MayhemWeapons.Effects.ShockBeam_Ice'
     ShockBeamTX(1)=Texture'mm_MayhemWeapons.Effects.ShockBeam_Fire'
     ShockBeamTX(2)=Texture'XWeapons_rc.Effects.ShockBeamTex'
     ShockBeamTX(3)=Texture'mm_MayhemWeapons.Effects.ShockBeam_Green'
     ShockBeamTX(4)=Texture'mm_MayhemWeapons.Effects.ShockBeam_Holy'
     ShockBeamTX(5)=Texture'mm_MayhemWeapons.Effects.ShockBeam_Rainbow1'
     ColorBank(0)=(B=255,G=200,R=100,A=255)
     ColorBank(1)=(B=255,R=175,A=255)
     ColorBank(2)=(B=50,G=255,R=150,A=255)
     ColorBank(3)=(B=50,G=100,R=255,A=255)
     ColorBank(4)=(B=255,R=100,A=255)
     ColorBank(5)=(R=255,A=255)
     ColorBank(6)=(B=255,A=255)
     ColorBank(7)=(G=255,A=255)
     ColorBank(8)=(G=200,R=255,A=255)
     ColorBank(9)=(G=125,R=255,A=255)
     ColorBank(10)=(B=255,G=255,R=255,A=255)
     colorname(0)="Ice Blue"
     colorname(1)="Neon Violet"
     colorname(2)="Neon Green"
     colorname(3)="Neon Red"
     colorname(4)="Violet"
     colorname(5)="Red"
     colorname(6)="Blue"
     colorname(7)="Green"
     colorname(8)="Yellow"
     colorname(9)="Orange"
     colorname(10)="White"
     colorname(11)="Random(Mix)"
     colorname(12)="Random(Crazy)"
     colorname(13)="Random(Group)"
     LightBank(0)=(Hue=150,Saturation=175)
     LightBank(1)=(Hue=190,Saturation=75)
     LightBank(2)=(Hue=70,Saturation=50)
     LightBank(3)=(Hue=10,Saturation=30)
     LightBank(4)=(Hue=175,Saturation=50)
     LightBank(6)=(Hue=155)
     LightBank(7)=(Hue=60)
     LightBank(8)=(Hue=30,Saturation=50)
     LightBank(9)=(Hue=23,Saturation=50)
     LightBank(10)=(Saturation=255)
}
