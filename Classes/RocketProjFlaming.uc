class RocketProjFlaming extends RocketProjAbstract;

var float FlameDamage[2];
var bool bStuckToTarget;
var AvoidMarker Fear;

Simulated Function ProcessTouch (Actor Other, Vector HitLocation)
{
    Super.ProcessTouch(Other, Hitlocation);

    if (Other != Instigator)
        if (!PhysicsVolume.bWaterVolume && !Other.IsA('FluidSurfaceInfo'))
        {
            bStuckToTarget = True;
            SetSticky(Other);
        }
}

Simulated function Hitwall( vector HitNormal, actor Wall )
{
    Explode(Location, HitNormal);  // Still exists after explosion
    if ( !Wall.bStatic && !Wall.bWorldGeometry
        && ((Mover(Wall) == None) || Mover(Wall).bDamageTriggered) )
    {
        if ( Level.NetMode != NM_Client )
        {
             if ( Instigator == None || Instigator.Controller == None )
                  Wall.SetDelayedDamageInstigatorController( InstigatorController );
             Wall.TakeDamage( Damage, Instigator, Location, MomentumTransfer * Normal(Velocity), MyDamageType);
        }
        bStuckToTarget = True;
    }
    if (!PhysicsVolume.bWaterVolume)
        SetSticky(Wall);
}

Simulated Function SetSticky(Actor Base)
{
    bHardAttach = True;
    SetPhysics(PHYS_None);
    Self.SetBase(Base);
    if ( AirExplosionEmitter != None )
        AirExplosionEmitter.SetBase(Base);
}

simulated function Explode(vector HitLocation, vector HitNormal)
{
    Super.Explode(HitLocation, HitNormal);

    RocketDisappear();
    if (!PhysicsVolume.bWaterVolume )
        GoToState('BurningDamage');
    else
        Destroy();
}

Simulated Function RocketDisappear()
{
    if ( AirTrailEmitter != None )
        AirTrailEmitter.SetBase(None);
    else if ( WaterTrailEmitter != None )
        WaterTrailEmitter.SetBase(None);
    if ( Corona != None )
        Corona.Destroy();

    LightBrightness = 0;
    LightRadius = 0;
    bHidden = True;
}

State BurningDamage
{
    Simulated Function Explode(vector Hitlocation, Vector Hitnormal)  {}
    Simulated Function Blowup(vector Hitlocation)                     {}
    simulated function Landed(vector HitNormal )                      {}
    simulated function ProcessTouch (Actor Other, Vector HitLocation) {}

    Function BeginState()
    {
        SetTimer(0.1,True);
        if (!bStuckToTarget)
        {
            LifeSpan = 2.3;
            Fear = Spawn(class'FlameMarker');  // only if not a direct hit.
        }
        else
            LifeSpan = 2.0;
    }

    Simulated Function Timer()   // "simulated" new in version after 14.1
    {
        if (!PhysicsVolume.bWaterVolume)
        {
            if (Level.Netmode != NM_Client)
            {
                HurtRadius(FlameDamage[int(bStuckToTarget)], 250, class'DamageTypeIncendiaryFlames', 0.00, Location);
                bHurtEntry = False;
            }
        }
        else
        {
            bStuckToTarget = False;
            if (AirExplosionEmitter != None)
                 AirExplosionEmitter.Kill();

            Destroy();
        }
    }
}

simulated function Destroyed()
{
    RemoveFear();
    Super.Destroyed();
}

Simulated Function RemoveFear()
{
    if ( Fear != None )
        Fear.Destroy();
}

defaultproperties
{
     FlameDamage(0)=4.500000
     FlameDamage(1)=3.000000
     AirTrailClass=Class'mm_MayhemWeapons.EffectRocketFlaming'
     AirExplosionClass=Class'mm_MayhemWeapons.EffectRocketFlamingExplosion'
     AirExplosionSound=Sound'mm_MayhemWeapons.Rocket.incendiary'
     AirVolumeMult=3.500000
     WaterVolumeMult=3.500000
     Damage=30.000000
     MomentumTransfer=30000.000000
     MyDamageType=Class'mm_MayhemWeapons.DamageTypeRocketFlaming'
     LightHue=20
     LightRadius=6.000000
}
