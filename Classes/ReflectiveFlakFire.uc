Class ReflectiveFlakFire extends FlakFire;

var enum EPatternSize
{
    MODE_Tight,
    MODE_Normal,
    MODE_Wide
} PatternSize;
var array<float> PatternSpread, PatternVolume;
var array<byte> PatternShots;
var class<Projectile> PatternProjClass[3];
Var Array<Sound> PatternSound;

function ModeDoFire()
{
     Const CM = Class'ColorManager';
     Const FC = Class'MayhemFlakCannon';
     Local Color CTS;
     Local byte i;

     if (FC.default.FlakTrailColor == FTC_Group)
          CM.Static.SetRandomTrailColor();
     else if (FC.Default.FlakTrailColor < FTC_Random)
     {
          CTS = CM.Default.ColorBank[
                CM.static.AssignColorIndex(
                CM.Default.ColorName[ FC.default.FlakTrailColor ]
                                          )
                                    ];
          for (i = 0; i < 2; i++)
               class'ReflectiveFlakTrail'.default.mColorRange[i]= CTS;
     }
     Super.ModeDoFire();
}

function DoFireEffect()
{
     Spread = PatternSpread[PatternSize];
     ProjPerFire = PatternShots[PatternSize];
     ProjectileClass = PatternProjClass[PatternSize];

     super.DoFireEffect();
}

defaultproperties
{
     PatternSize=MODE_Normal
     PatternSpread(0)=700.000000
     PatternSpread(1)=1400.000000
     PatternSpread(2)=3000.000000
     PatternVolume(0)=0.750000
     PatternVolume(1)=0.500000
     PatternVolume(2)=0.750000
     PatternShots(0)=5
     PatternShots(1)=9
     PatternShots(2)=12
     PatternProjClass(0)=Class'mm_MayhemWeapons.ReflectiveFlakChunkFaster'
     PatternProjClass(1)=Class'mm_MayhemWeapons.ReflectiveFlakChunk'
     PatternProjClass(2)=Class'mm_MayhemWeapons.ReflectiveFlakChunkSlower'
     PatternSound(0)=Sound'mm_MayhemWeapons.Flak.highflak'
     PatternSound(1)=SoundGroup'WeaponSounds.FlakCannon.FlakCannonFire'
     PatternSound(2)=Sound'mm_MayhemWeapons.Flak.lowflak'
     AmmoClass=Class'mm_MayhemWeapons.MayhemFlakAmmo'
     ProjectileClass=Class'mm_MayhemWeapons.ReflectiveFlakChunk'
}
