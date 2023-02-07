class RocketProjAbstract extends RocketProj;

var Emitter WaterTrailEmitter, AirTrailEmitter, AirExplosionEmitter;
var class<Emitter> AirTrailClass, WaterTrailClass, AirExplosionClass, WaterExplosionClass;
var Sound WaterExplosionSound, AirExplosionSound;
var Float AirVolumeMult, WaterVolumeMult, ExplodeOffSet;

simulated function Explode(vector HitLocation, vector HitNormal)
{
    local PlayerController PC;
    local Rotator rHitNormal;
    local vector ExplodeOutPosition;

    if (!PhysicsVolume.bWaterVolume)
	PlaySound(AirExplosionSound,,    AirVolumeMult*TransientSoundVolume);
    else
        PlaySound(WaterExplosionSound,,  WaterVolumeMult*TransientSoundVolume);

    if ( EffectIsRelevant(Location,false) )
    {
        rHitNormal = Rotator(HitNormal);
        ExplodeOutPosition = HitLocation + HitNormal * ExplodeOffSet;

        if (!PhysicsVolume.bWaterVolume )
            AirExplosionEmitter = Spawn(AirExplosionClass,,, ExplodeOutPosition, rHitNormal);
        else
            Spawn(WaterExplosionClass,,, ExplodeOutPosition, rHitNormal);
        PC = Level.GetLocalPlayerController();
	if ( (PC.ViewTarget != None) && VSize(PC.ViewTarget.Location - Location) < 5000 )
	    Spawn(class'ExplosionCrap',,, ExplodeOutPosition, rHitNormal);
    }

    KillWaterTrail();
    KillAirTrail();

    BlowUp(HitLocation);
    // Will Need More input after this, because it's still not destroyed yet.
}

simulated function PostBeginPlay()
{
    if ( Level.NetMode != NM_DedicatedServer)
    {
        if (!PhysicsVolume.bWaterVolume)
            MakeAirTrail();
        else
            MakeWaterTrail();
    }

    Dir = vector(Rotation);
    Velocity = speed * Dir;

    if (PhysicsVolume.bWaterVolume)
    {
        bHitWater = True;
        Velocity=0.6*Velocity;
    }

    Super(Projectile).PostBeginPlay();
}

simulated function Destroyed()
{
    Super.Destroyed();
}

function PhysicsVolumeChange( PhysicsVolume Volume )
{
    if (!Volume.bWaterVolume)
    {
        if (AirTrailEmitter == None)
        {
            KillWaterTrail();
            MakeAirTrail();
        }
    }
    else
    {
        if (WaterTrailEmitter == None)
        {
            KillAirTrail();
            MakeWaterTrail();
        }
    }
}

Simulated Function KillWaterTrail()
{
    if ( WaterTrailEmitter != None )
    {
        WaterTrailEmitter.Kill();
    }
    if (Corona != None)
        Corona.Destroy();
}
Simulated Function KillAirTrail()
{
    if ( AirTrailEmitter != None )
    {
        AirTrailEmitter.Kill();
    }
}

Simulated Function MakeWaterTrail()
{
    if ( Level.NetMode != NM_DedicatedServer )
    {
        if (WaterTrailEmitter == None)
        {
            WaterTrailEmitter = Spawn(WaterTrailClass,,,Location);
            WaterTrailEmitter.SetBase(self);
        }
        if (Corona == None)
            Corona = Spawn(class'RocketCorona',self);
    }
}
Simulated Function MakeAirTrail()
{
    if ( Level.NetMode != NM_DedicatedServer )
    {
        if (AirTrailEmitter == None)
        {
            AirTrailEmitter = Spawn(AirTrailClass,,,Location);
            AirTrailEmitter.SetBase(self);
        }
    }
}

defaultproperties
{
     AirTrailClass=Class'tk_Mayhemweapons.EffectRocketTrailStandard'
     WaterTrailClass=Class'tk_Mayhemweapons.EffectRocketSwimming'
     AirExplosionClass=Class'XEffects.NewExplosionA'
     WaterExplosionClass=Class'tk_Mayhemweapons.EffectRocketWaterExplosion'
     WaterExplosionSound=Sound'tk_MayhemWeapons.Rocket.inc_underwater'
     AirExplosionSound=Sound'WeaponSounds.BaseImpactAndExplosions.BExplosion3'
     AirVolumeMult=2.500000
     WaterVolumeMult=6.000000
     Skins(0)=Texture'tk_MayhemWeapons.RocketShellTexGold'
     bRotateToDesired=True
}
