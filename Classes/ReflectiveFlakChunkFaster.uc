class ReflectiveFlakChunkFaster extends ReflectiveFlakChunk;

Simulated function BounceProjectile(Vector HitNormal)
{
         Velocity = MirrorVectorByNormal(Velocity, HitNormal);
}

function SetNewDamage()
{
     NewDamage = Default.Damage * ((1-DampeningFactor) ** float(ReflectNum));
}

defaultproperties
{
     DampeningFactor=0.120000
     Speed=4200.000000
     MaxSpeed=4200.000000
}
