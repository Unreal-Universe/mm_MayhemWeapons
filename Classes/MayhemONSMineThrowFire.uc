class MayhemONSMineThrowFire extends ONSMineThrowFire;

var enum EMineType
{
    TYPE_Standard,
    TYPE_EMP,
} MineType;

Var Class<Projectile> MayhemMineClass[6];

function projectile SpawnProjectile(Vector Start, Rotator Dir)
{
    local Projectile p;
    local MayhemONSMineLayer Layer;
    local byte x;

    x = Weapon.Instigator.GetTeamNum();
    Layer = MayhemONSMineLayer(Weapon);

    if ( AIController(Instigator.Controller) != None )
        Layer.CurrentMineIndex = Rand(2);

    If ( x == 0 )
        ProjectileClass = MayhemMineClass[Layer.CurrentMineIndex + 2];
    else if ( x == 1 )
        ProjectileClass = MayhemMineClass[Layer.CurrentMineIndex + 4];
    else
        ProjectileClass = MayhemMineClass[Layer.CurrentMineIndex];

    if( ProjectileClass != None )
        p = Weapon.Spawn(ProjectileClass, Weapon,, Start, Dir);

    if( p == None )
        return None;

    p.Damage *= DamageAtten;

    if (Layer != None)
    {
        if (Layer.CurrentMines >= Layer.MaxMines)
	{
	    for (x = 0; x < Layer.Mines.length; x++)
	    {
		if (Layer.Mines[x] == None)
		{
		    Layer.Mines.Remove(x, 1);
		    x--;
	        }
	        else
		{
		    Layer.Mines[x].Destroy();
		    Layer.Mines.Remove(x, 1);
		    break;
		}
	    }
	}
	Layer.Mines[Layer.Mines.length] = p;
    	Layer.CurrentMines++;
    }

    return p;
}

defaultproperties
{
     MayhemMineClass(0)=Class'mm_MayhemWeapons.MayhemONSMineProjectile'
     MayhemMineClass(1)=Class'mm_MayhemWeapons.MayhemONSMineProjectileEMP'
     MayhemMineClass(2)=Class'mm_MayhemWeapons.MayhemONSMineProjectileRED'
     MayhemMineClass(3)=Class'mm_MayhemWeapons.MayhemONSMineProjectileEMPRed'
     MayhemMineClass(4)=Class'mm_MayhemWeapons.MayhemONSMineProjectileBLUE'
     MayhemMineClass(5)=Class'mm_MayhemWeapons.MayhemONSMineProjectileEMPBlue'
     FireRate=1.000000
     AmmoClass=Class'mm_MayhemWeapons.MayhemONSMineAmmo'
}
