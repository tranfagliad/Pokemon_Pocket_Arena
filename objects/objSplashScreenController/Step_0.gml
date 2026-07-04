
if (acknowledgement_timer > 0)
{
    acknowledgement_timer--;
    if (acknowledgement_timer <= 0) { allow_skip = true; }
}

if (allow_skip && !global.midTransition)
{
    if (objInputManager.pressed.select) { TransitionStart(rmMainMenu, seqFadeOut, seqFadeIn); }
}
