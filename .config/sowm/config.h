#ifndef CONFIG_H
#define CONFIG_H

#define MOD Mod1Mask
#define BORDER_COLOR "#000000"
#define BORDER_WIDTH 1

const char* term[]    = {"alacritty", 0};
const char* web[]    = {"firefox", 0};
const char* ide[]    = {"code", 0};
const char* scrot[]   = {"import", "scr.png", 0};
const char* voldown[] = {"amixer", "sset", "Master", "5%-", 0};
const char* volup[]   = {"amixer", "sset", "Master", "5%+", 0};
const char* volmute[] = {"amixer", "sset", "Master", "toggle", 0};

static struct key keys[] = {
    {Mod1Mask, XK_Tab, win_next, {0}},
    {MOD, XK_t, run, {.com = term}},
    {MOD, XK_w, run, {.com = web}},
    {MOD, XK_e, run, {.com = ide}},
    {MOD, XK_q, win_kill,   {0}},
    {MOD, XK_Up, win_fs,     {0}},
    {MOD, XK_k,  win_move,  {.com = (const char*[]){"resize", "n"}, .i = 10}},
    {MOD, XK_j,  win_move,  {.com = (const char*[]){"resize", "s"}, .i = 10}},
    {MOD, XK_l,  win_move,  {.com = (const char*[]){"resize", "e"}, .i = 10}},
    {MOD, XK_h,  win_move,  {.com = (const char*[]){"resize", "w"}, .i = 10}},
    {MOD, XK_Right, win_half, {.com = (const char*[]){"e"}}},
    {MOD, XK_Left, win_half,  {.com = (const char*[]){"w"}}},
    {0, XK_Print, run, {.com = scrot}},
    {0, XF86XK_AudioLowerVolume, run, {.com = voldown}},
    {0, XF86XK_AudioRaiseVolume, run, {.com = volup}},
    {0, XF86XK_AudioMute,        run, {.com = volmute}},
};

#endif
