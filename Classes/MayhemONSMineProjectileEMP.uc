Class MayhemONSMineProjectileEMP extends ONSMineProjectile;

var class<Emitter> ExplosionEffect;

simulated function Destroyed()
{
    if ( !bNoFX && EffectIsRelevant(Location,false) )
        Spawn(ExplosionEffect);

    if (Role == ROLE_Authority && ONSMineLayer(Owner) != None)
    	ONSMineLayer(Owner).CurrentMines--;

    Super(Projectile).Destroyed();
}

event TakeDamage( int Damage, Pawn EventInstigator, vector HitLocation, vector Momentum, class<DamageType> DType)
{   
    if (class<DamTypeONSMine>(DType) == None)    // immune to explosion damage from Spider Mines.
        Super.TakeDamage(Damage, EventInstigator, HitLocation, Momentum, DType);
}

defaultproperties
{
     ExplosionEffect=Class'mm_MayhemWeapons.EffectEMPMine'
     ExplodeSound=Sound'mm_MayhemWeapons.Mines.empmine'
     ScurrySpeed=400.000000
     ScurryAnimRate=3.250000
     Damage=45.000000
     DamageRadius=350.000000
     MomentumTransfer=20000.000000
     MyDamageType=Class'mm_MayhemWeapons.DamageTypeMayhemONSMineEMP'
     Skins(0)=Texture'mm_MayhemWeapons.empred'
     Skins(1)=Texture'mm_MayhemWeapons.empred'
}
