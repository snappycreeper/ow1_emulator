#!mainFile "../../main.opy"

subroutine initGenji

rule "[genji.opy]: Detect Genji initialization":
    @Event eachPlayer
    @Hero genji
    @Condition eventPlayer.initialized == false # without this flag, the reset code in generic.opy executes after initialization


    initGenji()
    eventPlayer.initialized = true


def initGenji():
    @Name "[genji.opy]: initGenji()"
    eventPlayer.setAmmo(0, OW1_GENJI_CLIP_SIZE)
    eventPlayer.setMaxAmmo(0, OW1_GENJI_CLIP_SIZE)


rule "[genji.opy]: Deal OW1 shuriken damage":
    @Event playerDealtDamage
    @Hero genji
    @Condition eventAbility == Button.PRIMARY_FIRE or eventAbility == Button.SECONDARY_FIRE

    damage(victim, attacker, eventDamage*(OW1_GENJI_SHURIKEN_DAMAGE/OW2_GENJI_SHURIKEN_DAMAGE)-eventDamage)