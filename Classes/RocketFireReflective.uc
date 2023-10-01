Class RocketFireReflective extends RocketMultiFire;

function Projectile SpawnProjectile(Vector Start, Rotator Dir)
{
    local Projectile p;

    p = MayhemRocketLauncher(Weapon).SpawnPlainProjectile(Start, Dir);

    if ( p == None )
        p = Spawn(class'RocketProjReflective',,, Start, Dir);

    return p;
}

defaultproperties
{
     bRecommendSplashDamage=False
     AmmoClass=Class'mm_MayhemWeapons.MayhemRocketAmmo'
}
